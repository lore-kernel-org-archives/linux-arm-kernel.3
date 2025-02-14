Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8789AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otrCHsdfao2kVoDQN7xHYLDJvx8Ap1uHO6er0CH61hU=; b=ygyzeGTGAmi/x9UQSpbTRP2ZNS
	b1mXFew7ZaoodVgZeaf1ICkzPOvY02yM61aMvHNvUlks0uMVnTSk/bVXO9xA4NTIFbpu3FBy6KDan
	BNb9/BZKAlDVCveNYLWUjhLohlVA7ZkX0dk1vIV+YZnDkOCYZOA2EYYgEIsuj8Soox9xGBaZPgCD3
	My5Fz0wBVM5J0F87Q/ZgN3VJFKchmrXdYzfJUc5Chf0P18QP70Hr/AekBBSNFjP3W9XzwALeCBZL4
	8u5dU0xQj6s+0HokzzNfR8+nmoS9e7Ii8kzbnECAihee8UWq/F7p2Wd1BJtP1sg4VNYGawWld+e2A
	4E62vs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0rW-0000000Fx7X-1ICx;
	Fri, 14 Feb 2025 18:56:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizLf-0000000Ffts-3Cov;
	Fri, 14 Feb 2025 17:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553570;
	bh=wI++aCyUGB25LBiHVhu7McH+lo9hKNW4TKBihjV2t5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IWrbobA7J++IfnQOw9xWZ2+m4v9jqen7hW+JDSNXSiUOt6shIZyidH35E3W9NNlrd
	 IVPMdIiT1MYRz9LAv6Wq9JPOpm+Vl1JlzCsiiihVBAcSQfKC7u3o2ZRkHKlec4WZJx
	 a9AE5x0r6RX7ca2y8nl7R/uFH3nfMO65JSeovN35VY/oBEoEu1zxzKeKkXzx6FoCDy
	 LNOxSpkcjeSUNPD41iPJDBJhtnTdywV3hyKhCncWMwSu3MCdtCb6e9b/v4zmZuDOoP
	 6+XqrVWcRpKBHwk0KkXN2fmUdZpj7+m809W0K1f/mIuJnvZl4PnN+nrOoSnR/BJ/UO
	 a+RGSXpTfQiKA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8109E17E0239;
	Fri, 14 Feb 2025 18:19:25 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 14:18:34 -0300
Subject: [PATCH 03/13] mfd: mt6397-core: Add mfd_cell for mt6359-accdet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt6359-accdet-dts-v1-3-677a151b9b4c@collabora.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
In-Reply-To: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091931_974385_94CEC240 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Andrew Perepech <andrew.perepech@mediatek.com>

Add an mfd_cell for mt6359-accdet and describe its IRQ resources to
allow the mt6359-accdet driver to probe.

Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/mfd/mt6397-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 0e5d59ae064a696ae2111e2b558b316667c14773..5f8ed898890783c0ce4e34c7eae0d8f678e7d7bc 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -84,6 +84,12 @@ static const struct resource mt6359_keys_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_HOMEKEY_R, "homekey_r"),
 };
 
+static const struct resource mt6359_accdet_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_ACCDET, "accdet_irq"),
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_ACCDET_EINT0, "accdet_eint0"),
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_ACCDET_EINT1, "accdet_eint1"),
+};
+
 static const struct resource mt6323_keys_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_PWRKEY, "powerkey"),
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_FCHRKEY, "homekey"),
@@ -239,6 +245,12 @@ static const struct mfd_cell mt6359_devs[] = {
 		.resources = mt6359_keys_resources,
 		.of_compatible = "mediatek,mt6359-keys"
 	},
+	{
+		.name = "mt6359-accdet",
+		.of_compatible = "mediatek,mt6359-accdet",
+		.num_resources = ARRAY_SIZE(mt6359_accdet_resources),
+		.resources = mt6359_accdet_resources,
+	},
 };
 
 static const struct mfd_cell mt6397_devs[] = {

-- 
2.48.1


