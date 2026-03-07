Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F36AFC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlsWclDzlhTjQ8Ta/CwNPYYabJSU+nDKLCQBiW8BCiA=; b=G4YH8V03WGA05VDXMzp/a+fhEe
	wgISvt1angdrRGswsOwqSLJJUJATBtmTZuyVC7BEtQ8Fsibz3wHCvf9pr//pv0KiSGZCwAW6RxU3o
	1YDTtbzJmYptvjVFkFIEErQZLVIZJ1orCoWcGKOKAacCAtrvSz5PZfK+/eEwKKGNE9B4+Cc+480XA
	lYTeDXLCnP7KGAHHruuYAJTGPrZ6vHHziJB8Sf9KGTBXTIwdJqA+qanPliHEBuI9LX3ALYFYgFHdf
	P0U7RQdho0mmAwEECPpEBRQpYxGQPiHngSNAKCeNgYAKLiKQPsHmZVYy5cN2olZV6eNUZvWvjNcJC
	vkOaUYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcO-00000004ite-3wsq;
	Sat, 07 Mar 2026 00:34:08 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcI-00000004ikW-0xnQ;
	Sat, 07 Mar 2026 00:34:04 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 6430C1380A85;
	Fri,  6 Mar 2026 19:34:01 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843641;
	 x=1772850841; bh=WlsWclDzlhTjQ8Ta/CwNPYYabJSU+nDKLCQBiW8BCiA=; b=
	eVkEMip1BqyABoMW88eAywA7sUTiajUdqOmdiYvVVBLRenOBuvEhZNJPeI5h/dEk
	PnSBlYj8bici9Z4GabyS9JUDy7367CQlSdp8sk5myBmEiHgdRompDBrxoMaib+Ab
	htspHolcHSCFdFOm12+NarnSnqpJGIfyKwP3H7wYseUZIl28ZQrEVBp/dNoOJmXX
	wvOFGZX8RqnLjfuhrTIX9a1oPAjI/10ipKyVhuae2+i9R8SvO7tYfMR3hNM6zo6V
	QbaCP+oRFmYZ4yAQ2yvxucXrsgH8Twpd69ZQbZDozr7r5BIzb777TkaDjoyE/93f
	fDNtg4hEL1caKxm0Y8VMlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843641; x=
	1772850841; bh=WlsWclDzlhTjQ8Ta/CwNPYYabJSU+nDKLCQBiW8BCiA=; b=n
	ckAU+8ElgtAAzIq9u0u0LmvafJHAugMNOWgCP9LMfErHY6GQx+cCRTB/kFKMgzQ5
	ofAozBsSnia5GFzyei1ko27t1Z7fOfe+n9Ap4vMNR+YMZK4d5cQ/H9Xc8xw1MwvT
	QlmDpAtroi6jd21Tp3ro3JT/zQofNkdS/aLDtCooOF4aV9P6hpRqZqvinESogPZv
	0Zsrw+blGyCIkmURDf0P8nZn3KATQ17UU6G8IDgF5tBUF8gCQpPazpaStcUQwRo4
	cLQOd9J+FmdMgtFa5SLOdXvfvEThn/nN3jGtZK0cGYY/jXvLQE8Zt3DdA+XSG76n
	A9kDTHdzjXQ6BfyMXO8fA==
X-ME-Sender: <xms:eXKraSCKvokXUgxmT5LBUekK0Z8JBZ79uKwn7BIp6EGc51ASrxzDTg>
    <xme:eXKraXVjSMeJi_8J35-Gh-56DByFc5R8pzjwaJMM8RIUS0FzWfCAsrHjaT9qvaap_
    WxTU67fNF33nm9kCHa7gSA7egv8hn_SxcVUDQRYFmGiljNAd0IURTXl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepue
    dttdfggfdufeeiueetffegveefffevjeehvdelfeevhffhteekgfegveeuiefhnecuffho
    mhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehflhhoshhssehjvghtmhdrmhgvpdhnsggprhgtphhtthho
    pedvfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnghgvlhhoghhiohgrtg
    gthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthho
    peefudelfeeifedusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoohhnghdrtdigtd
    dtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrihgvlhdrrhhoshgvnhhfvghlugdr
    jeehtdesghhmrghilhdrtghomhdprhgtphhtthhopegthhgrphhuihhsuggrrhhiohegse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepghhiohhsrghlledtsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprhgrughoihdrtghhrhhishesghhmrghilhdrtghomhdprhgtphhtthhopehsrghm
    uhdrthholhhjrghmohesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:eXKraQB2JGs3XZUYR6Fcz5lyfe3HGyzBIyElPIJwqJOQGTOqoUnYdw>
    <xmx:eXKraXYx2yoIwQBjAI0LM4CO_s-46g12yk50rAGJk9ZqvYs1xIf6fg>
    <xmx:eXKraRIkuHLFjJG5ToT42L91ReSj6AwNMrujH9j9x3QLa7vFRZ2hoA>
    <xmx:eXKraY1XCjKwsvNY0EdvEKemCAvwcNX6Td1LJcfJb5jyDDEj2bUFXw>
    <xmx:eXKraVtg7P7Q87FXpvtquKEZtdhUo8VWFKUMBAr4LJgZPmK-Hk1C1yJi>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3BF151EA006C; Fri,  6 Mar 2026 19:34:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:30 -0600
Subject: [PATCH 11/18] wifi: mt76: mt7925: fix uninitialized is_mt7927_hw
 in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-11-c77e7445511d@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2768; i=floss@jetm.me;
 h=from:subject:message-id; bh=04bcnVWlmhD8WzR5rT1ISBOfh8iqnfyzS6JBSRD3OaY=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JPe76/SbsUNiyacC4Z63lQBdKpgmeRRaeJu
 B9vDFMMiYuJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyTwAKCRC17sMLqGd3
 H0a0C/4gZbVomsWvAYlwUczBLQwa94m+fnaoAzHzW8bXOMvc09ncQtrxZxbnKF6q2g9ai7Shplp
 89fMSGGKA+fJ7AwHrZwtRktIS9pynfoclL5MM9R82zNsWSrisdwQM7jUaXlzrjNFARI21wx3TpY
 CNGPY2g/L5esmfV95yj2WW5aE8jWfrY5+JuiaWI0pY3vdNDIbjI5TXLxL6BQYWqvet/K9VtywRc
 /GmPuJG60NAOmakbMHJv1T4yJ6WXN5uGFWuqw96bJzSxiettcedQXLmNW+PRbSbBnmkEzQ957Dr
 Ziv5p1mE3ROJgcJ1dYS+G7wVqtYLOEsxJmkrIZci1PRyBOHVpcpA4YEf+dzamaTdNCShGOHEt3z
 6smUkhHA64fR1nu9DUAhtLiIpxt8oqQJfbIntY6GDSJh0G/qNVlTjmUfgCj2CJiCIYbpaiuhhU/
 TS9/CHvgGhBW6JmobCBQtElM1lWsNHoN7ddal2dT5h7xFyWkqO7WuyAGxTG0QYnMmsL28=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163402_991818_2C906876 
X-CRM114-Status: UNSURE (   9.91  )
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

is_mt7927_hw was declared at the top of mt7925_pci_probe() but only
assigned after its first use at the irq_map selection. The uninitialized
value (typically zero on x86_64) caused the mt7925 IRQ map to be selected
instead of mt7927_irq_map. With the wrong map the driver polls RX rings
0/2 instead of 4/6/7, so MCU responses are never received and every
command times out with "Failed to get patch semaphore".

Fix by initializing is_mt7927_hw at declaration from pdev->device.

Also remove a stale MT_WFDMA0_GLO_CFG_EXT1 define that pointed to the
wrong register address (MT_WFDMA0 base 0xd4000 instead of MT_UWFDMA0
base 0x24000). The correct BIT(28) write is already handled by
mt792x_dma_enable() via MT_UWFDMA0_GLO_CFG_EXT1.

Reported-by: 张旭涵 <Loong.0x00@gmail.com>
Closes: https://github.com/jetm/mediatek-mt7927-dkms/issues/15
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
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 0f76d9197230..6275e78777b0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -418,7 +418,6 @@ static int mt7927_dma_init(struct mt792x_dev *dev)
 	/* MT7927-specific GLO_CFG bits before DMA enable */
 	mt76_set(dev, MT_WFDMA0_GLO_CFG, MT_WFDMA0_GLO_CFG_ADDR_EXT_EN);
 	mt76_clear(dev, MT_WFDMA0_GLO_CFG, MT_WFDMA0_GLO_CFG_CSR_LBK_RX_Q_SEL_EN);
-	mt76_set(dev, MT_WFDMA0_GLO_CFG_EXT1, BIT(28));
 	mt76_set(dev, MT_WFDMA0_GLO_CFG,
 		 MT_WFDMA0_GLO_CFG_FW_DWLD_BYPASS_DMASHDL);
 
@@ -489,7 +488,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	struct mt76_bus_ops *bus_ops;
 	struct mt792x_dev *dev;
 	struct mt76_dev *mdev;
-	bool is_mt7927_hw;
+	bool is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
 	u8 features;
 	int ret;
 	u16 cmd;
@@ -574,8 +573,6 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (!mt7925_disable_aspm && mt76_pci_aspm_supported(pdev))
 		dev->aspm_supported = true;
 
-	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
-
 	ret = __mt792x_mcu_fw_pmctrl(dev);
 	if (ret)
 		goto err_free_dev;

-- 
2.53.0


