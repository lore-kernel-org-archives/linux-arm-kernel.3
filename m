Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9470210F92E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKYvgQ1t1lSRkNHRJOJY5btuo/K6VYFBYLipl68nHhQ=; b=FTJfmeNxI/y+pbKZ38iXXa0T9I
	tZhFqrm2H0ajQ2OyH7VKRoTmS1Mu1J3ggC9Dw+22Ye0cxevxNaKAQSGbfQ6H7vePwu1pkew0LR0dA
	C0ap0F/abGa7xZbCWNQwffPu5S19sOZza7fa4JmxbshcoKrhf/LWiest6klNM6Bvfa3YAfO0u/3br
	ZWPJfQrstQxqW+7mqeEzUH0lzsh3UsfZbjls2Q14Uw71Adg6oXkEopaU2xBojEbXmjxm9aimBkbo3
	mUaF63TVxtryP3QJky5XMaAkuRCgVOFBi/rjY2iCYjpftG1s4ktsfVYNs6gSQa0x2kuwIIPggUBg2
	KDbqmS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cbg-0000000DJJy-3WFL;
	Tue, 31 Mar 2026 17:10:24 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cb3-0000000DIuX-3CoU;
	Tue, 31 Mar 2026 17:09:46 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 02CB71D00165;
	Tue, 31 Mar 2026 13:09:44 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 13:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774976984;
	 x=1775063384; bh=OKYvgQ1t1lSRkNHRJOJY5btuo/K6VYFBYLipl68nHhQ=; b=
	XEk+zZ0eVZi6lGtzTQJVT6gF4X7V7VXrq6FDzlG/KPDrjg7uD5jLgSTsk6Y5iqYM
	Eruf16TltPnJZHo68Do+REthaeukYCm50xxVBlTKiFhw+2SwsAH29wc4gW3F8Vqb
	Llw4qnwpVONqsBTyQrBB7x4uugMd8NBK0Mt5TUcOaHUNZq54Kmd909yxkVGeryRg
	xxaC2qj/yTAKC8nAqGfsA0No1kNrfXyfQb5KuuTvVFjYyrWQFPyIEa2loBeRZw1q
	IHoe3v3pwjzdmJuVEA3aiVViESZC92gTfVPz2ZN0XUhhRYfDu6lywrWfvq2p2b06
	5lfFPWHeFbIZqv5PlD70PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774976984; x=
	1775063384; bh=OKYvgQ1t1lSRkNHRJOJY5btuo/K6VYFBYLipl68nHhQ=; b=d
	w2Hc1GJPmJPFjvkztw86UFbkVvHbIgnOMHPo4DE3TDVI9N8i4TRl85VkJTBtKavh
	QIp9DESqK5Cv2a7CnxoIXrpGOFJ6bBnoB0oM540X245FStzlFzcGMMqhpIMoYd9g
	OA+NyRzuUuUEqPd3uEayFuKBNJA8Q90gqex7kASRSHxZb3HvqWr1/IUmZpjBGIxj
	7in1u6yFwe6uOtQbs8TFdErO4b++Fy8GJem8SJUfjjh+NDBgtDjV3OTn2qUObX5z
	dCQlWvTsqbsTJ2xFMT2jgXjJsgIn7LDf5LbQ9LG+5km6jChy8onQ4OKOpRFlYIKh
	jj+j+8nCHbXEcZu6u0Iyg==
X-ME-Sender: <xms:2P_LadDIT6yl9WdF1jWH_5iLjCtzRhF5Hxmhbp6TD2x2rCUVTzNocQ>
    <xme:2P_LaWU0smc0xzdkIAfhh1JPkz9ZMiJ03ulHQvj8PGyshSE7MBztH4OaxtdtHrDnl
    pTLVyUT198LVFoM6gIZbasKGvWenbh1wH3V8WFRE2SQ21gH6HQTZS4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fohfffufggtgfgkffvvefojghfsehtjeertdertdejnecuhfhrohhmpeflrghvihgvrhcu
    vfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtffrrghtthgvrhhnpedtfedvfe
    ekuddtjeffhfehheffgfeftdfhueeiieetteegtddthfevfeelvdekjeenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhhoshhssehjvghtmhdrmhgvpdhn
    sggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhgvg
    hlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhm
    pdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgt
    vghlsehhohhlthhmrghnnhdrohhrghdprhgtphhtthhopehtihgsoheshhhumhgvuhhrlh
    hisghrvgdrfhhrpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    htvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:2P_LaYg8cyHguv4X_bwBD0hRAgZibFdlSBd7lDWQoD7kpG1pKbHflw>
    <xmx:2P_LaUH3R7RdnAujsc2BH7HtfIGtgb6CZNxC8oVsan4W4x1vOiwiAw>
    <xmx:2P_LaauE0hSTGaejVyL_MIkGf1RFobZwiKvScZhIpPY5EjGVORdx4g>
    <xmx:2P_LaVeWenGTqs6zE7o1pYTAJXD0QGrZqXoTqizwZK84scoGK0dCmQ>
    <xmx:2P_Labp_MURsVgdLpylyv5NcSNyvkvk746-bg0PuV5BjSDG6maXAoTp6>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AEA1D1EA006B; Tue, 31 Mar 2026 13:09:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Tue, 31 Mar 2026 11:09:37 -0600
Subject: [PATCH v5 7/8] Bluetooth: btusb: Add MT7927 ID for TP-Link Archer
 TBE550E
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-mt7927-bt-support-v5-7-6f31b4342daa@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Thibaut FRANCOIS <tibo@humeurlibre.fr>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=floss@jetm.me;
 h=from:subject:message-id; bh=0X9iYzgDtL2noTXAFbHuUBjE+Gu6Hwn5WtC2t2VD+ZU=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpy//LhfZJL3xMG6TBggnoBvOllg6WAHyp8S+kc
 kLu6uSLpl2JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacv/ywAKCRC17sMLqGd3
 H6NgC/9YwMbmVz0nfvi1tz8n0qR/uAriTTp57XV988OEujsSlPw7Jw3/hEcWM0GOz07YbQhQ8hk
 9sCP2ROp1wNqk8faUPX6AHcBtLPfOGfGT11nvKuNcs/4jH0wXcvW/QR7Y4zgXvN+ypSc3rt4x0F
 xdgA9kYqQyDTULZ0h04yCT5OBBmBgNKgLbl9/J3jdvMyPHKt7gdqsr8dS91Vyjg2Af9NMzxPO3X
 yLC6Gg2Bppduk5mm7RrJGJxNudvhj2Mo12ycEV7DTT8V2fLhcQB547xNPRSL9qydO4p/c+vItIJ
 uCThJCr0lLrTCNKaa8JgocTA8jOWvlyvGvvkXBpA8i/U3tjn5LYZIZqlMprOD3jwdMdE1WM9+vl
 jayTxgHoMrFC0Ix/IRkUk5moKSsNOgiF67ghPjYKjNzfKtspYZ5zRABHhfRtcr4AV2Qhr90HpsG
 hUh9Eei+MZZRbY0BHPMHvm+ektb388c5fnXPqivq1SHImkbD9SoWzHN/C24QNfRCoItn0=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260331-mt7927-bt-support-v5-0-6f31b4342daa@jetm.me>
References: <20260331-mt7927-bt-support-v5-0-6f31b4342daa@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_100945_835922_2716AD41 
X-CRM114-Status: GOOD (  10.28  )
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

Add USB device ID 0489:e116 (Foxconn/Hon Hai) for the MediaTek MT7927
(Filogic 380) Bluetooth interface found on the TP-Link Archer TBE550E
PCIe adapter.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=04 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0489 ProdID=e116 Rev= 1.00
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
Tested-by: Thibaut FRANCOIS <tibo@humeurlibre.fr>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 96882e9b831c..55a000540439 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -759,6 +759,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe110), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe116), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14e), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |

-- 
2.53.0


