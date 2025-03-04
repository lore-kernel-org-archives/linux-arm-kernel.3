Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A3EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0r41c5vW1t6txIvh8fXSv3uc3lwlvw+Uq+X3LX6zcDg=; b=rqWueNZd2lc7OeSLhv8bvH6o01
	CIEx6j4roc1QmLFc0afDvSZ3Nw4Nfq/sIkkZxElhbLuofYBK40zh84c3QzoxHFU94/0Ll5HsElCbE
	vLoDVK6PfWr9wdqCRkQTAQFjHCZ91kuUXMzInIfhK7t2LexJQJ/bJxawjBk2pt7e+x7iwoK5A66Yc
	ZUH7WZJM/kr8Kn7dK9oca1OsjwxFGvAftuKlVDJViDNBfqVtpdMNkYUYhtNRHvMkYpUK+YbjtxVm8
	LLSy7JE1zLdn6wjTEDaOMMzH8yxUy0cdNDcw1A/6mtGbwc8wG9PyWwKHGdxvKFoNEYsTSH6surm4f
	OjE9Oa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUgg-00000005KMf-1rsh;
	Tue, 04 Mar 2025 16:00:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU0r-00000005ADb-2ClQ;
	Tue, 04 Mar 2025 15:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741101412;
	bh=ew/lKKPHiRKrKA2kFSoKnjYv5WzKBHZsXi8V5xGuf2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FYOIyJweYYKINnMYJPP9wB494LAj4xFh2nrerDSid0E5+E9vMi3tHRreJTdrb5g4y
	 wPEYPU9kUx8JhKgB9xlmjR9X/A4VquiAuKK5VCPPv6FUIXvYkzMO/r5gky7bKxZx0J
	 wSNsWeFyEgNOw31XyNISLK3UcjEOHjeq/FbxSjwb75slmxi0mdx/PjdTHssPF8fZS/
	 NwvGeuQR0CBlmLADB0bf/lHGIci9w0A8MWVK5djhJrFW86B975Etb2y9BMncV809rV
	 ajRfmcuUu9gIpOTNMYRsnwbNLLhn10aLcwSckpbhTzOjcHLhSrURcYfcz9hRR+h0ER
	 c1QVmfaASAn/w==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 152F217E0A4E;
	Tue,  4 Mar 2025 16:16:46 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 12:15:49 -0300
Subject: [PATCH v3 08/20] ASoC: mediatek: mt6359-accdet: Drop dead code for
 EINT trigger setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-mt6359-accdet-dts-v3-8-5b0eafc29f5b@collabora.com>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
In-Reply-To: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
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
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_071653_732444_B84DDE8B 
X-CRM114-Status: GOOD (  10.03  )
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

None of the EINT trigger options are implemented and the DT property is
not described in the binding. Remove the unused code.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ce8a5e64e0b9ca508124043ca1f93aaa3cc5f9a0..a21c6544174517e3eebc8cf25d1ea3029ba014f6 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -35,8 +35,6 @@
 #define ACCDET_PMIC_EINT1		BIT(3)
 #define ACCDET_PMIC_BI_EINT		BIT(4)
 
-#define ACCDET_PMIC_GPIO_TRIG_EINT	BIT(5)
-#define ACCDET_PMIC_INVERTER_TRIG_EINT	BIT(6)
 #define ACCDET_PMIC_RSV_EINT		BIT(7)
 
 #define ACCDET_THREE_KEY		BIT(8)
@@ -593,15 +591,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	else if (tmp == 2)
 		priv->caps |= ACCDET_PMIC_BI_EINT;
 
-	ret = of_property_read_u32(node, "mediatek,eint-trig-mode",
-				   &tmp);
-	if (ret)
-		tmp = 0;
-	if (tmp == 0)
-		priv->caps |= ACCDET_PMIC_GPIO_TRIG_EINT;
-	else if (tmp == 1)
-		priv->caps |= ACCDET_PMIC_INVERTER_TRIG_EINT;
-
 	ret = of_property_read_u32(node, "mediatek,eint-use-ext-res",
 				   &priv->data->eint_use_ext_res);
 	if (ret) {

-- 
2.48.1


