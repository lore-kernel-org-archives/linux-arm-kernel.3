Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED735FC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AV5pjfr8DB4LzAYJo0LZOvg+vcORVwMVJnNA5YqOM1g=; b=BhbOZ05NWUPsmh1IQpy6PeC3Vd
	NfSkVK45INaRuMhZFV/oI2eTRtsHSA69DjMizIdds3hUmLhrw7tm7ncCj0oXeZx6w/LLCiGMujPWi
	goHYGo1hlbCgxG7HPTzH9SQEfe727WjYGfJy7ec6yMJq9bDAqgqSEEVtIdu6o3FQqyOTsrMgc9b40
	AiQOpblm52JgfmXw6Gq8nubZ+b+CUGTk05/JPaZzsdot7rzhueAvA9bOiMiFZKJIWsphR5KnzURxu
	QznBEkfwcJSXDhBCBNNlyfpzmgrn1DOxfqt3L3QJXJ4stBBem8SxE+xobdMm7bcdT7RCsjQqWzFpt
	8O+7P4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfc1-00000004iOy-3OwG;
	Sat, 07 Mar 2026 00:33:45 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfbx-00000004iJl-1I13;
	Sat, 07 Mar 2026 00:33:42 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 8B3D51380A3E;
	Fri,  6 Mar 2026 19:33:40 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843620;
	 x=1772850820; bh=AV5pjfr8DB4LzAYJo0LZOvg+vcORVwMVJnNA5YqOM1g=; b=
	FQ8Mj8SA/lqtFbHg4yYxEzGXo/TXW1cm45MI/fjEg6S6HRqg231tlcmdd7FCXcMC
	p66JlQ0+DPsJYuP8k88yoN3JwL8KavoKCqrnfIlPQm5TdMis2HnjzKEnHKnVRDkS
	zLdeRzzZXDxceQA/OiOZk/HiVdSfmdt0brSEKdRm75Y2xKeFbGZmzz5GRYKP+IL3
	NHx1kvQFsv8KY+UY148YxKI0PYVg7iPA3EM1YBlw/lAEA53ra+cgfAv4hK5G18ai
	15UZ7Xu5FwMRNTKuPCl0a36JUangWIYKvsh5uTT+SYA52LqFu30L8OKKhpCat5ks
	2CWG3suK3Ii8u5+kqecPbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843620; x=
	1772850820; bh=AV5pjfr8DB4LzAYJo0LZOvg+vcORVwMVJnNA5YqOM1g=; b=z
	kozg72iS6ADapSXG9DkoV+rVk0bCksC0GyhUOiVw7XJoM6F4e9YhqOuDERremdSy
	5P7o4ge0xi8bBF47k/vr4QYYCuQcN4aRGJLPuZMC7iqDgvCIwxWW1bnX5Y5zzcPM
	ITkj6m9zWTo6rdrLuVEhI+Z+11l5jcX4dd6QsRmUB8uw3gu6Cp7poKtQgv7XuP6R
	+1Jt9Q6BYZUnsA00Uzg6oll8wSXO+bf/4Fvzdq3MnvBhpRHrFm93jNK9Rij1RMXL
	NdVdgMF9YBBngLsvo7GmGySbrtSXsuTh9rsalWkdDVYYVWcwddHunhf/VxI5NTAw
	1So+MzmTaudYk8XQv0Zcg==
X-ME-Sender: <xms:ZHKraeUfiCW50Ex6eoB419vNw2bRtxUSJMFqJMWhU8QdoCeDhe9pWg>
    <xme:ZHKraVYmSCBkct6dsumc8GfBwmPpDjhr1rf1kfduRCKGRCV-bhzoK_uBnWHcW2Pc2
    CHWiOfxATn6IbTbN9QF4-VvvcZ7c_MmO99pmHWFESA8J-QB32PGxMGN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ZHKraVWsp8mg3w7PwlWbHjd4K5fYEaIj7kS2_ghjl_PmzD8pgViQaQ>
    <xmx:ZHKraaex5Rfss-j9385Jehtz58GsVlDlqhOo1wtZDiyg3e9UD6hC2g>
    <xmx:ZHKrae--iHo9b7Jh5F0fqcLRlAtqEcI9D2ZIh6yakck0_njFYrrjOA>
    <xmx:ZHKraabVulp8WJOfGHkWBiqWOw4BlXzwGCebNumpKDbwP58xhaFokg>
    <xmx:ZHKraTS5DhWwQyGGNjOo6DtdAayThibaO5D7SBBVQ83f6BzbjAeixgJU>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5ADF61EA006B; Fri,  6 Mar 2026 19:33:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:24 -0600
Subject: [PATCH 05/18] wifi: mt76: mt7925: skip CLR_OWN in mt7925e_mcu_init
 for MT7927
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-5-c77e7445511d@jetm.me>
To: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Marcin FM <marcin@lgic.pl>,
 Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
 Javier Tia <floss@jetm.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=floss@jetm.me;
 h=from:subject:message-id; bh=fB6otMGIwko1yonItoV0W4EcmOF1mpMAMxLshlLLqx4=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JP5Mpt9lS8a/Lf2blvrfs2Fodgx8e4mRQlI
 oSw1PgK/1uJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyTwAKCRC17sMLqGd3
 H1X8C/0VHd6bjvKOIqAdusuJtLoSCCk9t+e+vfNGLFaCw3MfemEChkITad1xYNjzb/YkVvViEnt
 iO7PWdfVTQBnk915cpdyXVErc78+SdOwa/4NOKWPnokTYjxpOldhHWcGDpebN0hg3yTxaFqzxq0
 ejd5GwBgvQHmLMZSFXaMeyM68kdGMXEF1UeWjTnWXFk63SLElkCygZ/HTp+VMSWHaU51tWk4OjW
 vvUuf5Mg6UkP2J5X5nIXCCMF4Q8GKDiCmsDFYMbMSLaQYMrcG7HGwwBZ+jKLjysdDEZ4snIUbZ7
 frH/N/8zy7kNhIIcKRyCNJQXNLk3RSm/VQLpv6sXbbWy3Y3YxEvWLzu3zQ1hhmnoN+Up+b56dfm
 p4AjqdajHcApTVCJXIO8rja/ew2qS3C75I3nlOR0p+1GlpP4yQioAlnAwBnGLv+s57a0JB0QEoV
 G38ep8746pwkjd+TvgphytWBXMVyB71uEu4JPnOFGdhNUFjqsNYGvb2/V6xUvgodyfm5I=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163341_415584_49596F98 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

On MT7927 hardware, every CLR_OWN triggers the ROM bootloader to
reinitialize the WFDMA engine, destroying all DMA ring configuration
(base addresses, prefetch settings, descriptor pointers).

The DMA rings are already properly initialized by mt7927_dma_init()
which performs a controlled CLR_OWN before ring setup. Skip the
SET_OWN/CLR_OWN cycle in mt7925e_mcu_init() to preserve that
configuration.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
index 6cceff88c656..206d525eb550 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
@@ -35,13 +35,20 @@ int mt7925e_mcu_init(struct mt792x_dev *dev)
 
 	dev->mt76.mcu_ops = &mt7925_mcu_ops;
 
-	err = mt792xe_mcu_fw_pmctrl(dev);
-	if (err)
-		return err;
+	if (is_mt7927(&dev->mt76)) {
+		/* MT7927: CLR_OWN was already done in mt7927_dma_init().
+		 * The ROM re-initializes WFDMA on every CLR_OWN, wiping
+		 * ring and prefetch config. Skip SET_OWN/CLR_OWN here
+		 * to preserve DMA state. */
+	} else {
+		err = mt792xe_mcu_fw_pmctrl(dev);
+		if (err)
+			return err;
 
-	err = __mt792xe_mcu_drv_pmctrl(dev);
-	if (err)
-		return err;
+		err = __mt792xe_mcu_drv_pmctrl(dev);
+		if (err)
+			return err;
+	}
 
 	mt76_rmw_field(dev, MT_PCIE_MAC_PM, MT_PCIE_MAC_PM_L0S_DIS, 1);
 

-- 
2.53.0


