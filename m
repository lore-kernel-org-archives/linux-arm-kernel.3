Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC06D25930
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 03:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Pkv9We6VscB0qB3JOZ4IWBIxIdEg9kD0OQiQP9LbKg=; b=akngSq419O40aDS9UzxOd1ia4w
	bx3AWl+XVFYPHqowk690jtSCu5W1BBX1gCZal6LPeRb2xqFWcPxyvW/IzK6V5I+GgMvOmBRfyfbAn
	3EaX8vXsRnehxR0BjRc4UzyygvBc+xIusjXYYLXrhZLWE4BLHqVQ7gdwneHpjRAsMtIf8X81A+Lmg
	Uiyb0Z1MhQYcsCwW1gZU8uhf4k8UWil0fu7fjmoVuVQGErCRvyIfLEeb2TCkubJ9xQUpxBaF79tAN
	pO+aTxzYsKGubuLMy/XnpbyqGEynPNVMWRfOZ6/Rxy7aRBXNVd3eDEC3zala0pyEqcqzyZD0vHr3L
	f4xbHBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZxG-0000000Dc1a-4BxL;
	Tue, 27 Jan 2026 03:41:27 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZxD-0000000Dc0H-2wvZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 03:41:25 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAnDOPgM3hp1sXoBg--.10824S2;
	Tue, 27 Jan 2026 11:41:20 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	ckeepax@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: sun4i-spdif: Add missing check for devm_regmap_init_mmio
Date: Tue, 27 Jan 2026 11:40:25 +0800
Message-Id: <20260127034025.2044669-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAnDOPgM3hp1sXoBg--.10824S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWDXFy5CF4ktrWfJr15XFb_yoWfJrc_X3
	ykuan5WFykKr9I9a4DJFZIyr48XF1vkFy7tr1UtFZxt34DGws5Z3y8AryrurWDX3y8CrWY
	vr1YvFZrA34agjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26rkl6F8dMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sR_EoGDUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_194124_115028_1549345E 
X-CRM114-Status: GOOD (  10.70  )
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

Add check for the return value of devm_regmap_init_mmio() and return the
error if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/sunxi/sun4i-spdif.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 1e755a716c63..65de03ca3ad2 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -684,6 +684,10 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 
 	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 						&sun4i_spdif_regmap_config);
+	if (IS_ERR(host->regmap)) {
+		dev_err(&pdev->dev, "failed to initialise regmap.\n");
+		return PTR_ERR(host->regmap);
+	}
 
 	/* Clocks */
 	host->apb_clk = devm_clk_get(&pdev->dev, "apb");
-- 
2.25.1


