Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EBEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eU+aqIverE9tAv+d28dt9NBQjOVvi+UK7ah2xbq/hR0=; b=P9zLL7NrRCaQxfbkXHSKR+b8Z5
	AmLAMNxYTyt8O8LWEkp1qJAeizds8r5wLhcKQW0ff80jFmJ+EcmQ0E3iiDtzkjrzMOUcXzc3uKmPB
	kU8TjmILS1BOPUsVTOqyCEEt6KjPK1OIX/2Ynx7YVWnjhOEsD91u42M+sTTKgfZXCkkhuixKyvD6W
	6HL+by508XfVSLdT3w7Ep4t/hfpzYmKgJFQy4ZI2ra4fFVneqU3u79P+VXFw78IEZiWo69hMRZE1H
	JUGieYFOW/hpHMPXhdrZbTirWkNun9vlKqnVoBOIZaiDrSYYw9fOtKQ5xu0hAVR7fJuZ3p3pUCsMN
	+BFDm+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu2X-0000000913z-0mfp;
	Wed, 05 Mar 2025 19:04:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptxt-00000008zxy-12Os;
	Wed, 05 Mar 2025 18:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201171;
	bh=xcB6EmzKAOke9OP1EloteY1ttUjle262e6h5WbQPIxo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ocQdIifdNRcwaKW40ydvh9gP3FJbAQnPFKbUblqnNk/qVbY/7tjLDbEyvLr44Fh+c
	 /FYs5yNu8DUl4hka7U+58oAQj8HRbZ7T1Gmbx8DHLAIi2x2Rj+ePL5xCQWz5z0dL4T
	 f1+ix9Z8yra4sn+tI6XWChaq83jSji+f/jLhMsVrNcvxuZrzmO5Q3NGY1YbgJsy018
	 qVBYvn7/FM7G2FtJB0myqrp90629tGryYwACTFKTWmHd0129gaDOtzwYCKwKPIJoZl
	 Xpf6QqvhFQmZ/OcoVAK2bQGbO4kRoPvQFYcwPaPOi2QjeUZjywkDhg/kXQJ5pKoidm
	 OOQmDCzjP+a4A==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7377017E0599;
	Wed,  5 Mar 2025 19:59:26 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:17 -0300
Subject: [PATCH v4 02/19] mfd: mt6397-core: Add mfd_cell for mt6359-accdet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-2-e5ffa5ee9991@collabora.com>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
In-Reply-To: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_105933_446626_6F1B3B3A 
X-CRM114-Status: UNSURE (   9.96  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


