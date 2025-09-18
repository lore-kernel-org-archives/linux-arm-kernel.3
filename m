Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2C0CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=33NI10JupNvzF5LVk088MZ+tWcPvXkOtTzuIPkgIQlE=; b=cO/P9bMqv5LUOajkkCNRFs9ZNU
	WZnIA6nQlSNOipCfwUGU0cL045ZR7UxDh/wH9oYWgZOZM6y46yFjIsbCYt79TOPXCZlGqpuLzHl6v
	6qPO/5rW0JiLyNGLXMeAiHY9Rm3mghvuu7WyS/B1PXBDe44lopPw0i3MlLDSgoH2llDSCg2aXqPwa
	ClDoQ9l4RsBG924VC0utOw7oTOjh7+0gDFU4QR3iy+zGkq6qJ4AmkqTfR1sje6Y9QV6nG85np9gSL
	BpbDxAO9najtZdrN1A/jUIx2B+viUWbVDyP5uGT/aT1DQCm80wR4+l/TBCYNnufFdXWywUNHdlDgu
	slyA8sAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCjf-0000000HCr8-02em;
	Thu, 18 Sep 2025 11:23:35 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCjb-0000000HCVA-2lvf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:23:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758194484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=33NI10JupNvzF5LVk088MZ+tWcPvXkOtTzuIPkgIQlE=;
	b=OV2lcIeGO4gg71RHX8vqR+xJ1Kdl1nvhZ+LCImJeLBcA8n7apT6HhRPvU2oZ/VtqZ22kC1
	hFfrqTVvTvdAlWllI+eBNmJhyZJ01qXoiwWkO5QvEwQrziAHrOnNXp5H3lwniaXxMVGkIR
	juG1QjQX/mspF/P43V12sAub1fCG9LY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: pxa: Return -EOPNOTSUPP instead of -EINVAL
Date: Thu, 18 Sep 2025 13:21:02 +0200
Message-ID: <20250918112102.64314-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_042331_836110_655C1D9F 
X-CRM114-Status: GOOD (  10.11  )
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

Return -EOPNOTSUPP from mmp_sspa_set_dai_sysclk() instead of -EINVAL for
unsupported clock ids, and remove the obsolete comment.

Replace other -ENOTSUPP returns with -EOPNOTSUPP to comply with SUSv4
error code guidelines and silence multiple checkpatch warnings:

  ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/pxa/mmp-sspa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 73f36c9dd35c..38815ca8f152 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -111,7 +111,7 @@ static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 	int ret = 0;
 
 	if (dev->of_node)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	switch (clk_id) {
 	case MMP_SSPA_CLK_AUDIO:
@@ -121,8 +121,7 @@ static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 		break;
 	case MMP_SSPA_CLK_PLL:
 	case MMP_SSPA_CLK_VCXO:
-		/* not support yet */
-		return -EINVAL;
+		return -EOPNOTSUPP;
 	default:
 		return -EINVAL;
 	}
@@ -139,7 +138,7 @@ static int mmp_sspa_set_dai_pll(struct snd_soc_dai *cpu_dai, int pll_id,
 	int ret = 0;
 
 	if (dev->of_node)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	switch (pll_id) {
 	case MMP_SYSCLK:
-- 
2.51.0


