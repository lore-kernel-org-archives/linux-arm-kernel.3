Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE701061B1F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQJQrCceeT3vdLIN7zWnldzYwpMDL1GuLvYlQTM7xZE=; b=hf0xaLZcJL3SO43PaOPmrFIZrk
	mnarwPgJsMROWYsf36Xx/6ynhzkuFtt4XqTMzByROpxooPzJS4KSytE5H23H3/fhyFl838yYCZpIr
	xke6nIdIsm2FWE98cjmmOebBzleGl9aXWrnecbOaLjqFwdZGCTfEiXewRzf7aLGrGwUqm7SLz1NwR
	ghfubR4JWVMjxO7ZvJ7LfD43st0O7C4llh4Aendn4YMnX18jgGQB9ElljSYWfl5wr+F+roqoiOseI
	w1i+Xoi3MFM7l4xKTHFCHFsxHMe6jj4Q2VeBNXZO8biCeK0RvgCIbskgFf22mbKKhffi5UnhNxDdE
	a+QUynKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JPL-0000000Br2v-3ZuE;
	Mon, 30 Mar 2026 20:40:23 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOb-0000000BqOD-0713;
	Mon, 30 Mar 2026 20:39:38 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 40D0AEC0263;
	Mon, 30 Mar 2026 16:39:36 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Mon, 30 Mar 2026 16:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774903176;
	 x=1774989576; bh=kQJQrCceeT3vdLIN7zWnldzYwpMDL1GuLvYlQTM7xZE=; b=
	p9+JGIo84WnX8h238/67WbniDjz10Ji7tIX/PCFk7FclITG3tYAj8msPOfs93UVY
	ed2yLL+z9Ilnio7fmU5iLADKFEgLp6FQC5FLB5jVV59Okd4PyABw8/JoY4fFBGr9
	aOPtf2HD9Rat+p2z0QrYVw1VCzC7yQgnoCXkeRaWzh64PipFqzeQ33Xmr9MDsvkZ
	jZDy/b0s/fB6gp4w3w8ftcWWXaTk7mMwbxVTTlbKXw8/Sx78qMomltuUlht60tVJ
	ctcFstiFA1uqEUnzFZXT/yaHRprkL07x+yp+5VXq+mbyOqwY73qRLhBDvUbKiI27
	4Dt7R84rnaqtPKxP4rQEbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774903176; x=
	1774989576; bh=kQJQrCceeT3vdLIN7zWnldzYwpMDL1GuLvYlQTM7xZE=; b=1
	rR+BfigdzCBWenmD3VN5yicbXebrOWeTzqsz1goDer9qhemtyC7eg7pP/hRHIhIK
	JGBqSaAmaZVWkdWEav8d+WNI0MZ7hQ/mama1MRLVcPDjIL18m+Se8K+EDqopVhfn
	gU/GA7gVgbIvNcBgzQiMAJ5y4pKP70Whms4+ItNC/+bzKmrqZ9h9SedFNiUZmXgc
	fNQnQufLYUcfmHeriptiHS1A7oMFbRZWRLbECuS3J5ELxRh13A8CWZGu03ZD/BqI
	oC+T7JGMQwyrvaVFhk+te+ICdYWNqvmYcImlTo/RwFeZ4wkGP3xPXxGPoUHp3Pv0
	kpztNoUAZfuVNlZG0inIg==
X-ME-Sender: <xms:iN_KaYlt1LEvRKnVK8VXQuIrUgZTG48t0OU6lHomZ3I6vSHOXmZWxA>
    <xme:iN_KaSqNtjWW2vK-aw19ixeWLJ_us8nL6ghPEt-JlWJ_tFJ4D_gj6Mg-fD8XliG8G
    xSBEK8LJTsq5bdymAztIhfNQemfJS67jylD0_IOVf1HwamO9aKUf54>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeelleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    efvdefkedutdejfffhheehfffgfedthfeuieeiteetgedttdfhveefledvkeejnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhm
    vgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    hnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdr
    tghomhdprhgtphhtthhopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomhdprhgtph
    htthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehn
    ihhtihhnrdhrvgguugihkeeksehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtvg
    hlsehhohhlthhmrghnnhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghr
    nhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iN_KaUHClc2W848lMomtD6uakIiIUo1d19dFRntawgNeWt-j4UApzA>
    <xmx:iN_KaQYdq7eJkYCcdnnMLwSDRZrz0-XgYRrg9587-fnAvVRTQ3nqqw>
    <xmx:iN_KaYyXlEEAD-Ibyh9XUdrFqGrzPcXZ0jQB1wGte7MlayyWkupkPA>
    <xmx:iN_KaSTGfmJvVUn9GFK_JbDaMpW6IsYzZd2S8MNAewUpoDpLCyyWPQ>
    <xmx:iN_KadjNBZJxqk5ckzupS-znAZFEee5yHQOAhfAJu2URsoXFFCr2GlBx>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1D4A91EA006B; Mon, 30 Mar 2026 16:39:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Mon, 30 Mar 2026 14:39:28 -0600
Subject: [PATCH v4 6/8] Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace
 Max
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-mt7927-bt-support-v4-6-cecc025e7062@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Nitin Gurram <nitin.reddy88@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2170; i=floss@jetm.me;
 h=from:subject:message-id; bh=oX9RcQEWF2VJoE6RgvKmZHprs09/2hbUA9uGu4FFREs=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpyt97BaqY/zbN9L9A7pSx1KBlGc+EIDJ9mghuQ
 g6Z7XUhumCJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacrfewAKCRC17sMLqGd3
 Hx5UC/9G/Mdxdjl0Kq/mxFIVJnTpts57tvwpx1bbi6GkWwGMJD9sDqSD81fCz1RdhWmp5vp34Nz
 Rv0C4UAm7b2HEZqRDM7IcpuAbWKKPAbatcvlRrtpUsVY8Fy2xvn0DXVU1wLc7KVgx8EKa6AA/Yg
 rQNQq2VeSwJ2ps59qsV4e9CytThkmNjQf7mrJ/Jkq+NbVdW0TGQaNmmyBfHZXAUV8Gugv7LbYu3
 Ea+Ua2FUGFQegI0qhdWbjH+IfbLR+hXsM6t70oJNa8F5w4waP8j5mY1ehXEutqbRDGAnBvvSitn
 LxIorqzo9tH3XCOv/s7aTeS2M4xIWDGSqPWM5FZUCpAdp7WHbqSAJ9MsJe4XuoJc81mreU3Z6kb
 qGF8cCKilXuNjKfcXitoPkP/9yY2umaThBIzxtYLQ1Hbka6dYK6EbQda7l9r1OJyxopDIN4EZhB
 JhBzzdP0LkZdXfBVSBXrLhMt1Lk4fxjMjdjgwG3PEO7NKYgMl+IlPN+8hiaKUdbEI/f5Q=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
References: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133937_712936_D15307B9 
X-CRM114-Status: GOOD (  10.16  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add USB device ID 0489:e110 (Foxconn/Hon Hai) for the MediaTek MT7927
(Filogic 380) Bluetooth interface found on the MSI X870E Ace Max
motherboard.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=04 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0489 ProdID=e110 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
...
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221096
Link: https://github.com/openwrt/mt76/issues/927
Signed-off-by: Javier Tia <floss@jetm.me>
Tested-by: Nitin Gurram <nitin.reddy88@gmail.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index d60798331bb3..96882e9b831c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -757,6 +757,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe10f), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe110), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14e), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |

-- 
2.53.0


