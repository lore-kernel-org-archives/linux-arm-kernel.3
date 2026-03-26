Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7819A10AB822
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 22:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpy+NjFmQ1UZzVo0QwIuf1cqhqfKorIEk2o2QMNh51g=; b=BZRjSuQU3i4xqc2cNfwr8jFYF1
	WbA8hhWqD59lRXA1o8wNQmmA7Y5WVomxeyTiechli60UfaYM3xk9NSCWWyPwd8mKL6OvcKVT2Nv4+
	GKGxw03QOPG4grLV+CeELoD46GrqFOH7aGoa3u3LLMOjgpiQd+Dkid+rMqN4zYDjbYQc0JGFXF5OU
	OZAucBX4Mz7J/7AxzcaISCr6UZX4JR2O5GTWAA8Li3pMfs61pMlwWsNTs45IXyZkx7gPdPRp7V/vp
	ubVbCXycb5kUW25vnIW+0fxSpHTSDH3jxVonCmYk7y4foLfQOe8GDq32d7Yjjs/QBBCLxqHUP+R+y
	jE4odpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sxO-00000006I3O-2RJE;
	Thu, 26 Mar 2026 22:13:38 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sx1-00000006Hp0-1tTL;
	Thu, 26 Mar 2026 22:13:16 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ACB1B1400275;
	Thu, 26 Mar 2026 18:13:14 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 18:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774563194;
	 x=1774649594; bh=bpy+NjFmQ1UZzVo0QwIuf1cqhqfKorIEk2o2QMNh51g=; b=
	js7x845CY4wNoRR12Aa3lcLD6OmRHpYpqUjDvx2wAGnvUawcBKpzNg0KHoRi6VUY
	BTP7ap8flX8y5W5FNXmJMUXPExrG29C/pG0JkVugR/oEZ/2TDikPPl8IOitqqacE
	YRReE0ciZEMAXTk8nk7dZmEcTvEMFtmAYrt+coBjeUuiAptdW4OpgGKTXT4mnS0Q
	xUiI6EweyrivcbCTlRM2YZXSNaIZ6eJUH1JzNKoUz/UGp4v7+OQ2zV42xuWqfEVR
	TXr1L5q602QACVbTR6OXnt8ILeHDerJFzwo+zws7vL7ukm7xYGF7eNwd/SjrdXht
	12Pel9tZipj8xRxYOgTxIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774563194; x=
	1774649594; bh=bpy+NjFmQ1UZzVo0QwIuf1cqhqfKorIEk2o2QMNh51g=; b=O
	uszeibcBq0x4QM77Qa2t93y+AoX6WQk+2AK795eVOjg9FW6LvxJVqcAUQDdmwHBw
	EMl3RgWcGCPqmYHE2s62xGDD8+rjNf3a/a5PWZJzBALXV47Y9l/80+BxaHMIIqHU
	xryfzTkfpbQKTyG1nGRLz6zTkmCnLB8+2YyV4BrryDN72Lc1TrsYpLyEjoQuX2U8
	GB99YwVjtvuNSS4CLER7iwUAkiRiA8aP0IGAeygyAqilFiJYqbrksVumvBKTxcDj
	H83NFEx++CdhERRJ86sjXQuY7pEADEJrulheKvZez9accV7Id/b6blDsO3ohwQiv
	UD/JDCC2/s/gcsFP5z4Vg==
X-ME-Sender: <xms:eq_FaeU8oZnKttYfjeNg-5BsIFdR8tfa0-j-BSC2glfu3gObj1H8Iw>
    <xme:eq_FaVZ_B9sb873r1aOQHWxt6okzYWoesaZPSESSmBNo678cKoAY-cm6_KDyJ6ujS
    6Q8oGgh8ussf3jK-VT0cjc7AR3A0BiXh2bhaQeOrra2wSAjcuQBovg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    efvdefkedutdejfffhheehfffgfedthfeuieeiteetgedttdfhveefledvkeejnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhm
    vgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    hnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdr
    tghomhdprhgtphhtthhopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomhdprhgtph
    htthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehm
    vghlihhnkhhovddttdefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtvghlse
    hhohhlthhmrghnnhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:eq_FaZ1NtxXi6eTJf64ocvtMBtvL-O5zKnkky5nUDrpPgh1y07odAA>
    <xmx:eq_FaTIb-NFlRzl50Py6Y4SoxDarlIi6-L512Mf9lsfYC56FdHll5w>
    <xmx:eq_FaUhYSBlHRb6eFA5YjCyQY4Uf2KIYHhzT-evMRO_WuXEVJSDAog>
    <xmx:eq_FaTC-gG5lXVCQyLR4Y6xddN0HOoZ16eLlqsk4jFArUBzN0zYIXw>
    <xmx:eq_FaZTfh7kkKFYrj7FX3k5rOV6TdKhCs_zN-4glUzxxNEls0OVWWz45>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 867791EA006B; Thu, 26 Mar 2026 18:13:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 26 Mar 2026 16:13:07 -0600
Subject: [PATCH v3 4/8] Bluetooth: btusb: Add MT7927 ID for Lenovo Legion
 Pro 7 16ARX9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-mt7927-bt-support-v3-4-fa7ebd424323@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Llewellyn Curran <melinko2003@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=floss@jetm.me;
 h=from:subject:message-id; bh=9VC/j/XdBMGnjdaMjoJsd1+eJl2LQOX2dwL92kQTdgA=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxa9vijJD6ypFSAZp2399M2+OP1vYcCoXC+5Sx
 oT+vhj279yJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWvbwAKCRC17sMLqGd3
 HyjlC/9lpV8DfM9fL9BuryQmfGoBM8bO4JegOPl8vuhFwHfqYFKdiQN2UOdf84Xsr4BMp/XxQ5m
 KSCxpCNl+idIXrlhOw69aQAB4LFRM+tHZ/sXnBh6NuqkLjbpAQhLbEJP33ktRs70F3dYd2sHkkv
 D9p3JPC90sJSxIa/DIr+f6cvbZWSp82xGT4xwDbS3VmIsc2ieFXAEHBC0BzHaAjJw6CL1A5tCvZ
 P+VO+2IfMEyDouc911+tAh5/J53N/amBxZC8GD90EPIJEOxRMtpl4qEWFR12Hs+guIliEzKDVNm
 3HDHjyyQ2d+XPoFerzDAw67lYHQbhgGjtgyL67qlyWTTmLACxvvK35PG65YuFaoaFGhEf7vn9ZI
 FV65QHULPe9GT9LvUmPUXYGfM1k0KtD5TVtd0MGWyBZ8hmas55JigWBfaUhuII5xHgdtY44TQcd
 IM+vOcfPlSWhlEtF8RCOnrOhr8vCaiiHJVVVmZvam56u0GOm2oymEzhJTrc5EastbyH/I=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me>
References: <20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_151315_551513_CECAB427 
X-CRM114-Status: GOOD (  10.15  )
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

Add USB device ID 0489:e0fa (Foxconn/Hon Hai) for the MediaTek MT7927
(Filogic 380) Bluetooth interface found on the Lenovo Legion Pro 7
16ARX9 laptop.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=04 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0489 ProdID=e0fa Rev= 1.00
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
Tested-by: Llewellyn Curran <melinko2003@gmail.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 58309af0f7a2..2c9ca3d6016b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -753,6 +753,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe13a), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe0fa), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14e), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |

-- 
2.53.0


