Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE1B1061B1E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpy+NjFmQ1UZzVo0QwIuf1cqhqfKorIEk2o2QMNh51g=; b=WCGTvTuudI5WGbR7dQi3ff/fFD
	TkMRFkFhVOU4UUXqMAmvTzQEDcsOKJwzzyUylzqPKGYvOD0gK8nnV00K7fJeDmpVpYXwjXfBAEsKd
	loBAZU1JBzQK+m+ubSh/RYJNZb54+0T2YfK/j2oOLyyHJWSgJpsGRDzEAidoy438B14ZJdDq5XG2V
	SNLUvA+MFptcR1iWcHeTPkdZSNFR8/Xf2hTWBs0CopbDToljL0EqgamltUiXcJZ6D/0cf2fH9H9QC
	IBC6VLk/xwK0/bS56xSFx1QMvUBhgLQ/nqx5mZtEQGC83Ar+UzpjEkJBD7UkXi3rPnGqxxwqZ+iFV
	dHwyFcjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JP5-0000000Bqoa-41ii;
	Mon, 30 Mar 2026 20:40:07 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOX-0000000BqLD-3XLU;
	Mon, 30 Mar 2026 20:39:35 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 183E5EC026B;
	Mon, 30 Mar 2026 16:39:33 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Mon, 30 Mar 2026 16:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774903173;
	 x=1774989573; bh=bpy+NjFmQ1UZzVo0QwIuf1cqhqfKorIEk2o2QMNh51g=; b=
	i3Bt0OcZUVQyo3zJwYMiCS6eUU+IOHdwFirH8aguQS1zlOwD1WyFCkxm1+4igILJ
	G2GvGFOHOFwtskIQYrTNVzdsEdjLL8MXP+pdlbbbyNHaEzgc9ycfRvycuLnxpaJQ
	exTWRHYZ9MeU2o1x91gJ0fPXtnAS/qfiyjXe8TsoIyz74lrMVtEZAmf8W0Hon8Kh
	SPD8M6EoGGqnNtz+YnniCO3h9wp9jWLg/4g1t5HCPBNsLkFpuLeVTHrs7uqOYJs+
	qvRyC9JhpAxmo+HHJ7CmkYAhShN49s7ZHB0iJLjrQ+gdw/GKd4dRPyANEdousIHh
	b6G8W4F4IE2CyZWY5+tT2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774903173; x=
	1774989573; bh=bpy+NjFmQ1UZzVo0QwIuf1cqhqfKorIEk2o2QMNh51g=; b=U
	hys8nzTai4t6f0BEeVhl6LSPg/+YaKYrfVuFZkXKQOqwnYUgJpM6LzXUS081YWHy
	7s6mwZK3EOcSf6REA+fpkjRMQmTQ+abVZbNt7lN8MTzyMqj3ic+0DvhscY0R2ecH
	nyE18zkxV5TFgtOpxmASiUekoUEQkuCQ7/k7mE6B7u7HXEj4h4I9MFWINb36VQyz
	QJ00zeXB/g/wJJte9R2g/H8S1Kg4QC16iLTFMeh4c/Z0LWtuPREgdEf+8DTtU9+m
	52OyjlFB3zYcsnIa7vUu+wNQ5QLfaPcnLn8EOIrQZEygLglWlLRQiLiE8qdbIFNY
	vOhWcAgZOHxW5yHrM8iQA==
X-ME-Sender: <xms:hd_Kacv7U-LDaM1oq7MA8KxSDFKDli_KnFaALat9Rn0lqtV6kmZ8aw>
    <xme:hd_KaURrrdZnYRMbD7GOTXgwdpbknjU8FIIaaQKKy-boRFh4zrFDE8miLaHUQ8k1X
    NAnfuZjMp0OAHFDemKZ7lH-xARiCpngJpMN2Iq4IAwe26eUjapfBnZ6>
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
    htthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehm
    vghlihhnkhhovddttdefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtvghlse
    hhohhlthhmrghnnhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:hd_KaYNi6mvtFrwLM-1bymUmp6xfctXJnmMhsu5grV6bPJEXBwcApg>
    <xmx:hd_KaSClhiIo3edj7a24D2_QRG5JrDeuxlQBos5mo9S8Itpln8BlPg>
    <xmx:hd_KaZ7mTAHhZSGbc-oPvkgHqjvQLWQATD5-mSNUXTlyCu4Ut4aeWA>
    <xmx:hd_Kac6cmhv2oW89j9QBGfJbNP99pKTKNCRoHW0WgpzBL9qs3gWZCg>
    <xmx:hd_KaWoY9WHiicwcFLr5p3cGOGTOxYVzkF12HvVbmeexgcsE-WmKkDwG>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E749C1EA006B; Mon, 30 Mar 2026 16:39:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Mon, 30 Mar 2026 14:39:26 -0600
Subject: [PATCH v4 4/8] Bluetooth: btusb: Add MT7927 ID for Lenovo Legion
 Pro 7 16ARX9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-mt7927-bt-support-v4-4-cecc025e7062@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Llewellyn Curran <melinko2003@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=floss@jetm.me;
 h=from:subject:message-id; bh=9VC/j/XdBMGnjdaMjoJsd1+eJl2LQOX2dwL92kQTdgA=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpyt97CPiNJOAEXVwrEfpjgVNH8JhPhYhdU4FvH
 tHsYov61gyJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacrfewAKCRC17sMLqGd3
 H0p8C/9ggMvJ9k8K8lcoa0z4EPoXJxK8OpqiiwBYQ/5AnqnPWgs0aadwVtiY3C5KkSnrVtHcHpY
 KrxG43URYqV0ZiKHDiWB4omoYLRiA6cu82LiiYaVe4LXoN3UdtBVgXxtM+7W2Rm7NSDaSEvWDaU
 3u0S54cvMtDUg3x3rsmVygrBqGqc5qA0EZLdfJveVUBKgyGcbO3AsyGwr1rdVXOg6V9ft7IPqnP
 N9usKNQ9qccfcWvSTpSBFNV1icvhIDnz1meQNDx8DbE5hqZtlxrt6jIWaZ3vj//y2c4YZNY4ch3
 icrzyQOcKPUi+GZIYeOoTXt+QOIISbScV8SGnO5l0ifm6qRP+RXmfCURFatBuJQDM34IId3XPbL
 0xaQkMYBKZ36qcP2Ru3NASLEgEMmcvI/fnCOCFSFaGtFsTzRY0gnG2iS6oMIWJ7yVnnGJWyq8hh
 NmpzufVq99GWFlP5vI3T/hS7YTQ69gi18LznEgJVc46tuEbkRgn0rFRmdsfAQQlj0Ikc4=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
References: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133933_961909_58BE5633 
X-CRM114-Status: GOOD (  10.36  )
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


