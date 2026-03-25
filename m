Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21B2109E52E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=fTVfOcekMP4nNbq7ByV71OMN+x
	rDnt+gpVdhAcDS7AGrhL7+kP2IiRGNzoVhixC0p1A6FgNSJb0PQXk4rvll9DPw2uMVPnI+P+gMAML
	vYaTUTsGo9f5H9CSPq8z0SiI1MCA4pLNtuEJA5F3oIZQPSQPhQ1i40VPF1uvs0Ng1COUndf/22ksV
	Q5IKTAxMFJTw94p6Y28pLNxgFitl8tai5oopFUKBQ7fdmlJ1Af8e7ThwndcTLxRVjNEofZROO23Fg
	WbRs+FD2HgfHSGlpAuTwDBd1Cyx6VT9Z9u/jUz8ECjioFVfmlAHF5c+N5zwe6mJexU1HX+bzuF/0h
	2y/tI/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XgZ-00000004Qgj-0ptK;
	Wed, 25 Mar 2026 23:30:51 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XgF-00000004QRm-0JNy;
	Wed, 25 Mar 2026 23:30:34 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 467677A01CA;
	Wed, 25 Mar 2026 19:30:30 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 19:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774481430;
	 x=1774567830; bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=
	DmnULdkBTosmdnjtq+TN9Yt3ITQawp8dY2P9ldfMkwh5mRJVMs8lgqWzXrn6X4g9
	EsYHIcO0b1xTLXU+MFP5NeV2oAVu/Xi0c2SFBHjauKF30yczURnOLZ96ULWNhmn7
	gr4QI21B6/d+fOXfdfD7imaqEs2zWaQdYuObg7nf+hHJ3VBfn3MM/InC6mQ5wVtu
	X0tvCi/hDYAKf83C1SJRonARPxCr9/NgF8tnnZqVkJULjJLCvk5bHu4rH9Dorjdl
	lrCUR3PWtxBJn5eEz2YgufmaYb1RfhuVfu8oaHd9bOxYObF1um2NEQALtzN0YmgA
	Ivz7yQpJEJsYD4D4pqhdVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774481430; x=
	1774567830; bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=h
	isHzS7Xa48q7lynVFiXknSI9DAl+u3sNdfOMo5JAMWcdfv3GWHKW7/b2tfBJQdbV
	bSqzfMutIIKvsbL/EDSzC9y5JKVt0vsmPmY+5s0x2UfkqqBZxq28zzeESHqKu1Bk
	8M37TWM9t7Cj7vcOYBPYGlDFKqxzPmCTkjZeqS67C6OOBPQYcAANiOyZ4kJiJHPh
	462YD/Wk8uUiEKuXLKaj8ijejz+at7p+2JIo1Hfsm1H1GcCtCIxoEdV4o/Ppi1SP
	6ADzS67L0lRXZyMOatcYjm7f4hZOwRAL2QLQK9e1/4VSk9W2Ia5cdf9wk8xLsLvC
	lfxTttkc/ysfAwdvIfF4A==
X-ME-Sender: <xms:FnDEaTkutrV4MP7TDy_jM-mXY0rDq45Nrehirp4nnnteupCAhJRUXw>
    <xme:FnDEaRq4M_LSSv86xiYgNp7Fn2ZIdHmFe2YJgKwB1dfYwT_Wv9c3OztGxNq_Zdhvn
    pNqIBiPDbg0H_oHUngGTtANXKyy8GgrMvYRqdSRlej-1ROxiqyF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    efvdefkedutdejfffhheehfffgfedthfeuieeiteetgedttdfhveefledvkeejnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhm
    vgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    grnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgr
    rdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdprhgtphhtth
    hopegthhgrphhuihhsuggrrhhiohegsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhu
    ihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrd
    gsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtvghlsehhohhlthhmrghn
    nhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtsh
    drihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgv
    kheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqd
    gslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:FnDEacQLCqebV92VOkjNohdTOLu3dvqO0q6oS3CruQEZRjUw7ZIJzQ>
    <xmx:FnDEaYCgAVnfwdsL1maFaRTF3S_9s7fhdFEI6Rb-MF_lv4ly6FjthA>
    <xmx:FnDEaTKaMklbTIdutXiaf27k4-zCHdpfoA3hbDXY1-QOVLmogh5NvA>
    <xmx:FnDEaTBmERpQR-3MVY_uxPRGUkehf8khC5roNJ9RCSbnL11CjZYgWg>
    <xmx:FnDEaXHrmypgRMWaK0F0WqCvsDRPwfMzf44zkuYxx58k1MDlE0XNSNu_>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F31561EA006B; Wed, 25 Mar 2026 19:30:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 17:30:22 -0600
Subject: [PATCH v2 5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790
 AORUS MASTER X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mt7927-bt-support-v2-5-b892a3252880@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chapuis Dario <chapuisdario4@gmail.com>, Evgeny Kapusta <3193631@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2229; i=floss@jetm.me;
 h=from:subject:message-id; bh=em1RqiSQd0riysmowuL1VUyKfo405wv/OJvCy5th3/Q=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxHAKvSQPPovp9IOhLCqst02LQ6CuMOBqGx1OY
 WHlvP5SFCuJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRwCgAKCRC17sMLqGd3
 H2xqC/wONw6gRWaxDn3O1a3zeifViGbV5XaPNdsdVO0vzqVuOlyazcmuX7kq2dO+WK2ByBHMa8r
 UBfv3u6eX1Ndd5pSqwGEf7ME8bVnNyU+S3v4K2VjeDuvfaytKWcckpQfZAqi5A4g524puHpgVzf
 hFsjuHJl0YLeA/SWdYLOkgfvsVxquo5UUz3Pe/WFlYGtNCP7f8Up9XDu1daQh9cpKwguY0zAkt9
 Rf58MTLcsVZOLm/VvH3mcKeGtBzXX4Q2xjNaaej/10xaeywiSDlRJ/OzR2oq8ppWt72P+rDjJNh
 cfqizrJP4Nbt2hih7V9VMLSpoEJYFqLDK8jOfZR1r5zOxZd8XQcdXOFTwfsXjXMvRezy1NhPQQ/
 /2dSKbjCvNLAE5uLp2hp7eRex35X9emXT/8iD+9kYYGh9rr2oXpsLIH0HeM2lDpI19yLtnJr0Cj
 JTdTF5bwE+lfwZBJ2cmKQRkvwH/Fgu3Jb37KSUiMCkKqiSaZ6uzbAaOWGgiz3f/Jy3wio=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-bt-support-v2-0-b892a3252880@jetm.me>
References: <20260325-mt7927-bt-support-v2-0-b892a3252880@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_163033_052029_3875B3A5 
X-CRM114-Status: GOOD (  11.28  )
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

Add USB device ID 0489:e10f (Foxconn/Hon Hai) for the MediaTek MT7927
(Filogic 380) Bluetooth interface found on the Gigabyte Z790 AORUS
MASTER X motherboard.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=04 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0489 ProdID=e10f Rev= 1.00
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
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 2c9ca3d6016b..d60798331bb3 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -755,6 +755,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe0fa), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe10f), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14e), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |

-- 
2.53.0


