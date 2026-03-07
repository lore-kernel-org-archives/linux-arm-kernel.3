Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972C7FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KON0o3mhXlKIiT7zmG2tCzJu5hf3PlFXU3DpYimtRDw=; b=W0OQvtyP+N6SfJwB/Ezo0RMyfp
	hLZeLl+L4FSXl42tJBTPhpLMbaReHBiMEg4yJqtHM1xAwVvYd8YvL/R0QGsG/ITBJd8YTvTmN/jIY
	+vvME5EK61j936ox2pUwa4ZbgIfNFPqwZy/+kpdkuGIvPXu4I8LaTDIP+me0dGMee3LvM8C131qzd
	9jUrV4XKyX0oPhGos3Vqf4U6hmAb1Op2qqz2P5/h2pqnik08P2livcfYvVmq5l/DNNFBEWXkJaFtI
	PkJQsTaAI8S8jv6tStMS7yBo1sJzC5XlL4TZYTN++e2EW+3ytZZz7/1E0WS5N3PV6QCpkJpcR2fAs
	tLIGUXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcU-00000004j28-1wzx;
	Sat, 07 Mar 2026 00:34:14 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcO-00000004itD-3Xqg;
	Sat, 07 Mar 2026 00:34:10 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 5A5AB1380A8D;
	Fri,  6 Mar 2026 19:34:07 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843647;
	 x=1772850847; bh=KON0o3mhXlKIiT7zmG2tCzJu5hf3PlFXU3DpYimtRDw=; b=
	ftfnOTqQFiUISO+qXyRyQCKkkK1zj+U8cWelIJVd6nuWtzgc11OTBQV59RKxj/n7
	/QIK9aBkS5WYYUlrQBpJ/PvVg22fuQxa3oNkhr5IurqBH/rJpG7r2lOe1Epk9DmF
	KUjc2aYLPvZy2FN8yRo2PlrGqS2SU1AMCz1HzV1vuqQUOzaPShsB7Diho2OenN27
	NJShXWs7hEVgr7eEhyv2xxRTkhQOezButbVkDPwhTHRsBrjKC+BCKsrvbWDxGkHR
	yulZ/KDtW6OKZqV7Zaw4Q78plF4olqU7wAJhOpuYTcwKE7NHZgYnpM4Yn2FomlW+
	aUP1h69ap1jEbhMdaPzY7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843647; x=
	1772850847; bh=KON0o3mhXlKIiT7zmG2tCzJu5hf3PlFXU3DpYimtRDw=; b=X
	jy426+8vhAb7fKyTDbV4VFEoluCRwFloTfUJURH1oLAVsjNKfPA069P2afWJz3vo
	MuWkmMXZK4NuwIpvOEoXbROi8459/6NckZxuVQkeWRTGjRUdNLStTGD07/3hDJlj
	1q6ITfHQVtx7VEbKUjlnIAIUfKvdfJTpD2apFB01473t//tvsFnFpyMVLVt3CBCu
	ScgUR0p5p5uuBy7iJEChJECLVQeHTOpQxj0tIDwymkwAJeahLQjK9IH3EMuA8ng+
	ZhgmZyhrqwyN+nBgjMcbD/At6aTN/8MnvVRhMBcuCuYrXC9yVnsaHvYKlzoDN3o8
	rLCbSxy5kslhKRZCy5cuQ==
X-ME-Sender: <xms:f3KraSyYxgWwm_vFS8xsdrXIT9NIjcweYKQN7JlJHZ44yEStKw-x0w>
    <xme:f3KraZEmZS6Sxt9l0QDUgopPjYhg3_8TsDmfWNYj77Fcq5AyurdAKi_dH40Smj15w
    ENLFx8gVd3bC0X9CjWEgvllxWXJq8Axy-p4DTtG1pQr0fpVgYT7aaE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepuddunecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhhoshhsse
    hjvghtmhdrmhgvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholh
    hlrggsohhrrgdrtghomhdprhgtphhtthhopeefudelfeeifedusehgmhgrihhlrdgtohhm
    pdhrtghpthhtoheplhhoohhnghdrtdigtddtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprghrihgvlhdrrhhoshgvnhhfvghlugdrjeehtdesghhmrghilhdrtghomhdprhgtphht
    thhopegthhgrphhuihhsuggrrhhiohegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgh
    hiohhsrghlledtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgs
    ghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhgrughoihdrtghhrhhishesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsrghmuhdrthholhhjrghmohesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:f3KraVLxkdrLvN0iHOx9KKFL-kLXyS96mtSu845tq_9xBZK--GlVOQ>
    <xmx:f3Krab58txqPkkI8pqYA9o2ueLJIpKulWEAEbZwD5OR2PaFnWfSaWg>
    <xmx:f3Kracmg_QnelJi4SPnmFvT33nCEn-YP8S7kNVWwRkWhMeH3E_CigA>
    <xmx:f3KradJkBkOPsb8-lYaPVPG5240I8zVn5rsIgg-MMTph_9XYvJMkrA>
    <xmx:f3Kraa_tAOcYVSRT9AK9HVdxA-Q9bbVfiwBuQk6Byj0_6qvcNhksXJqM>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 30B741EA006B; Fri,  6 Mar 2026 19:34:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:32 -0600
Subject: [PATCH 13/18] wifi: mt76: mt7925: restore FW_DWLD_BYPASS_DMASHDL
 in MT7927 PM wake path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-13-c77e7445511d@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=floss@jetm.me;
 h=from:subject:message-id; bh=zsKSZ6XbfqOeGxStPL+whgnb6wkPhoFUKNokNTtSVR0=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JQX3+JxeZEXN62VsVO5lnz+WTaT65EnrldH
 CJWgaPIScuJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyUAAKCRC17sMLqGd3
 H2CiDACEFAV3qPs/nohNmPTJ0CopUnOYlP8GEO3F6wWjuQM8rO1q/DgKzmbfYyRlgKWs3fOQNZx
 SaF2DWQzWwiE2yz8q6khhF7+IPLc2Ap1B0g8qB1uEoeOwgPNGeGKnNqXJGn9VOP9tYtYz7sDqOP
 Iq3mtn6s44Fh2OccwQwhK9ylp7uvE695HbOYOugWleuzY+LOwKQVVHhk1GliJpfYLFos7kuyg1+
 8qaJWNASj/Ht39JKbVu9PAJe+xGQsAxzyk8Vkjiw/LdyHuWaSIQxsiNlRf1WjZHKbd9zRB1R3x2
 RfFq+c+Z1c6auSnxOhA82w+56oGMV8kOtfFWz9lCVF8xTW+6krx6O0NpzASN6pVYYRRgT2EJzmp
 NxKr9A1XM+Bx8AHaNedkrAnRFNHM14Oj065SM2cRb6DNxHyyNhAT+JgArwJmeg3lVxnSqaf3yX+
 ikvUuXTQx0GyYqjbmIsQcYUU/YGDzJmWjeap/JCk7eG1eMEvB5/CScPBbJJm9ONdUkEqI=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163408_981088_DE5658DF 
X-CRM114-Status: UNSURE (   8.06  )
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

mt7927_dma_init() sets FW_DWLD_BYPASS_DMASHDL (BIT(9) of GLO_CFG)
during initial probe, but mt792x_dma_enable() - called on every PM
wake cycle - did not restore it. On MT7927, every CLR_OWN causes the
ROM to reinitialize WFDMA which resets GLO_CFG. The PM wake path
already restores ADDR_EXT_EN and clears CSR_LBK_RX_Q_SEL_EN but was
missing FW_DWLD_BYPASS_DMASHDL.

Add FW_DWLD_BYPASS_DMASHDL to the existing is_mt7927() block in
mt792x_dma_enable() so all three MT7927-specific GLO_CFG bits are
consistently restored after PM wake.

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
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 32364f19007d..95082d64fb69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -168,7 +168,8 @@ int mt792x_dma_enable(struct mt792x_dev *dev)
 
 	if (is_mt7927(&dev->mt76)) {
 		mt76_set(dev, MT_WFDMA0_GLO_CFG,
-			 MT_WFDMA0_GLO_CFG_ADDR_EXT_EN);
+			 MT_WFDMA0_GLO_CFG_ADDR_EXT_EN |
+			 MT_WFDMA0_GLO_CFG_FW_DWLD_BYPASS_DMASHDL);
 		mt76_clear(dev, MT_WFDMA0_GLO_CFG,
 			   MT_WFDMA0_GLO_CFG_CSR_LBK_RX_Q_SEL_EN);
 	}

-- 
2.53.0


