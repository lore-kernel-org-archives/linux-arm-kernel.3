Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0EF10AB827
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 22:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=IdCKdkxKv18Uy3JJaApBvd9m7I
	CzRom03rO/kRBx4oQ0I6KpaORmVEJJFkiwTRGDD/qpSIQzR+VIAoB65eTliNfDYwj669inJuqwq5X
	J2mN0NFot1PXlJFlbeVHqt88dqFjJgN6N1uuJm1jxDXqIQ06ksBmOz+V8A+oere8K2deIFBxeGk8x
	yYPHL+mQLN0iWjGUzZXmlUAOG4MUyBEnEvyMjupDosV+FlCqdfT8Fw2EMsF4MvxAid6s8wD6p0qtm
	vQ98dtuETReOx/jl1dZyCFNa1q4UX+XxlSQsgD8nuM3G1EbLK5B4m0qGA1N6DCBoCdAVeHP/YSP8O
	f/FCRPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sxU-00000006I8d-42vA;
	Thu, 26 Mar 2026 22:13:44 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sx4-00000006HqM-0D3d;
	Thu, 26 Mar 2026 22:13:19 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4A84B1400230;
	Thu, 26 Mar 2026 18:13:17 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 18:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774563197;
	 x=1774649597; bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=
	mP8dL6x9FMpfZTA5bhZ1P8vGzrHvzoL9l9nZGfH/lYsnM84rS5WGZOt8IxgUO8hm
	7c1LLXWXyU2UhSHv3NzAffzCAHt1xUYZJS+AAysFC5nS8O41Q+JT8QSgVV65Hwpf
	aGKmol654shU14rnGD7cxC8ahw7u3WClGTWCuBDhG75nyb2L8xPhnj2hei1qYYxO
	CmpsQZXSt5/8vSwhTemt4FmGS12JDNgIJ7nVrGi1eOdWtVGMqCZAUt19dqmThzcj
	Qwj8RpfnUFTtceINGAglgKR5gFZkIzAi1hDHXNHm838L7F7a/kkFzFZQ/Sip+GJt
	04n6+ymaqsWcEq45Z7b3zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774563197; x=
	1774649597; bh=yOxP62o7cM1WT3zP9+AmG5fhiGJNqhZB89OLn2KAGlw=; b=F
	fytWhveWABGxOUNKjeJAMkTQyU9gaAcy9Kmv3Q8vCl4iWGzksUuhgbQUDFz9Q4r4
	DUFXBeNQpF3zxNkmt7Oxn2FaFhtcUkZAP2fBsYeY0QsNULS+Vb3xhM0i6C1XcR4+
	igwt+IpkbHz2VX8TAiCTal9oR/bfrhd2LFB7zX3bEqStmfyNkgvL45euelWn//HZ
	zZdmJGS0B9y7Q1YzcTZ+oKDnWPL2B6p48vWI4amnaJp0lQOAgpRTRVb99PQAjAgl
	oU+eiExMs+S0rz/PTh0de2aX63k0YWu3Dc1J06T03KKEHudfd5aDbhsWqDsOCYsG
	+6M0Fa8gmlkXCiyinw3Tg==
X-ME-Sender: <xms:fa_FaWQ0mzkpFm7P2obUqV9GhmRvcb_KeUvNMVov6Z-GaUBSx0V0Dw>
    <xme:fa_FaWn65ddWIEx5noEhkblbLSO1VQ6jbJQ8jMbGN-u5cPJdWEpDxs2uwy85Fly5s
    ilhkSRRtg9Po_gUcmrsmQXpHixkLkKCvYAtkJIIUbm51V_2JJsUpz4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    efvdefkedutdejfffhheehfffgfedthfeuieeiteetgedttdfhveefledvkeejnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhm
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
X-ME-Proxy: <xmx:fa_FaZejMvxl-JLKRuyTlDaP0MCCP-zzOMq4rLzaRyaTJyKiFHpeZw>
    <xmx:fa_FaVfXNQSji0a4vKHQbQDd08fC0fN_2h6dM78AEELZZxBV8FdxYQ>
    <xmx:fa_Fab0d5xeavwGDpERv5ss6DN8rVruhrMtkrh8ghPP9bJD1-O_Prw>
    <xmx:fa_FaV9KQBlLyLjmC3cOSFbneUWFu1jLMp8cscvr8AfnNSNSaxlc6w>
    <xmx:fa_FaeBjwZAfBIzqbqA63ssi6fREOYhxzPhQSPQ9e5bK_wp56rLHoBfq>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 26DA91EA006C; Thu, 26 Mar 2026 18:13:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 26 Mar 2026 16:13:08 -0600
Subject: [PATCH v3 5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790
 AORUS MASTER X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-mt7927-bt-support-v3-5-fa7ebd424323@jetm.me>
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
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxa9vJ7ThBM1Sx24HtocK8RLstnVFxVLCTO54/
 NREptWT9QyJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWvbwAKCRC17sMLqGd3
 H9YOC/9e28YK0+vA/ggsoEq1B3Th8JvyrL7dlUnMRY108wms+T4+2BhEFinjYlmmLn5wl8pAYrm
 7+Fx5VP6liK3aDLm6vyaiQI5Y7DAZpURl6sVBka9yscYRBCN+1OE6/JdhncQvz2bwt9/Mobuc7c
 Za2itdOBk80QvU5V5hmlG8Li58LsQk7sfXjJ68kizeyBkrsWNkmNpSl4dR84SUVNUkpchBGm4xu
 WmXAd1v1SLGrree8DRbbJ7L3860ShS2ODmSKy3VE7+Wz9nHosLYj6qqjCRnnLjVQtkr6pqkjE5n
 R89Nt/eGKiPJWpLR0db1TNCn38XXzzbkz6GeF2CGzyGuPnclA7gJ6yO6riH+HVbQYZB3sJSW3ZE
 zws8q2kDxoh6wjCEnV9GmtWpEIkk8Ewvd4duYOsNBnvQXz3UZLJ3UmbkXBWuAUpYGI3xUy68Ts3
 S5SP+vz+UQor7FOzMBAUF3QtEZQkB+xhkTIH0VltWb23u4dMMS0tXRZ4U1lWy8bZ5+Ap0=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me>
References: <20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_151318_158780_7317DC93 
X-CRM114-Status: GOOD (  10.40  )
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


