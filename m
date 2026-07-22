Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F0C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Torbo9QkuXmjC9uhqrdt2cyIRnXWvhPFN491HA78teQ=; b=RZ/eq5tCx7mEl61V5O6Wb1K/33
	qwJ/TDGrDm4a3lieER7b16qbd/6CyM2rNsHTrdQGpvQjHp97puGKnsFLoc7Yfytzl4zHqGPWJLp4L
	hfzjB1XqR3i9Ftd/BqsMdjwsB/tQM/HNrHFJ9H4NZ1nCrleuIjr7EjUjaeMIhezV6WSrXzXDCoZZR
	m6PdCRGd7vRwlMZ9rnPueUiKs7aGFoi8uxCSI0FXCejAaV0wIAokWRyu+0tQyHBOBM3utqF6I9evH
	FoojgJbUHmUm/ayqv5UL47ho/K8PvwkwAGBkNxgPQXKoFROXQwcN0mBmOWI3/AsgoWI0Q4zxWv69w
	gxE4M4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVVg-0000000Bgj6-0nqi;
	Wed, 22 Jul 2026 11:53:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVVc-0000000Bgga-1Bbl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:53:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cad4170e8eso177653285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784721187; x=1785325987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Torbo9QkuXmjC9uhqrdt2cyIRnXWvhPFN491HA78teQ=;
        b=ewAmflaquGa6D2OCls/jvmxeJeFuye37rczOwnSyp5kC+6OH90rql00/YZJr2o2CeS
         YcKw9/0v2kCq8yP6WR1rPzN9TSJ+4j+dQe3rzFroMzP/PK0LKptEKPnTgkK3F9H+KRUw
         FNK1eAV6OeQzcP0N9q1kRa6XwnkU842FiQ0R5Fx3BAFvDP6lNpN73Hc3Cu290vv9ujmn
         rH8sNrZsFwBtIffpTEZY/XRsbJ9qdxl22zzZmmOGUiSMXn7BkjO6d48AcnA3bAh5Ecvq
         NygSfc0gFmKchYuwkXdZqW0/UdvYpTS4oru6xXghSy/gNQoqhQ9gA50yNIzJyWnaWvmb
         uK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784721187; x=1785325987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Torbo9QkuXmjC9uhqrdt2cyIRnXWvhPFN491HA78teQ=;
        b=EJKqoKNULWlYg1fYDd8AOrl71KxzqK0zCF6l6nXGIBLa2mqYiQPrboP6kPGIwNXsw5
         BNFw64tIetBQn1EPwYVVq/6efEq8d6RuBKA3MjrILzjePgWi0VIFxKfImENUJp7Vtp+m
         iHKzq2VM+QK4uNe0qh1KYuHpl5kGkIMPFK9rrWlMBcw2IVTciw9Z+9BCDsSMiN9YCw3Y
         NeLUR7xWkwe7dpCFD/oayY1YqVRwgee2S1H34FvFahH2oXh8UnSMHZy7NRIJPEzwtpuc
         i69iDnStw7CAq1iNr2yikeMfHjcNrEU2ihPxvjV38m+Qv7UsQuq6mFmLkzgLjgzHLf/w
         ZRXg==
X-Forwarded-Encrypted: i=1; AHgh+RobCDQADW5EAZVsDzdeQti2VFgAyP1MhM+0f2V+fGCb4AMXMzRwdwXUV1Tji6d2vn6/gmgWYQDN9EGy283sBnPw@lists.infradead.org
X-Gm-Message-State: AOJu0YxauAJVLLIFEjH++o+qcZIPr27Cicqw/HUs7s/+GB+0j51jkIAj
	spN6GOiDI0ioctswbNcY3DGPwskeH/A20+tLDy7aAWUxOfFJ9VcxRQJ2
X-Gm-Gg: AR+sD13IWJJg9dXZlKXP85QbRqlkjluHTL8ZrSB2HEDyIiT2M06zG/pI/ri/66Ye+Eu
	NQ0wwqgYrfF1SYOkw4WHroqloxRP+RVAJ9QN2J187Wfo3bRYEg0D+22nAumMEE422Q/3PEZbkD7
	Gdo2GQzvCpv10BL9QhcQmA56659w/SCDFYhF9dNE76fIhtAJHQ3zFizZ5lAQ04aCCxTUhuu7JxL
	VTN7yki9y1CsDkY562xNEydoH6N8qMfXDhSKVr40fD1dVCsIIw9Nlvg08kMsU1+JqSknH5ZI7/T
	NxLG5h4UQvU0WQubPIZA0o54BA2AfpoZ5XM4BwZYjEShWGa/TewIpseFfkgNoSYqc5YpTiv10ut
	5cQ8R71eQJD39MtCf6HiBAqJd9CviiQNzgBIgdawti/7RxCJiTzKg1qMBKs/rrDwVEvYLYak/3n
	gimMhj6bdiGDQCs8WX/s163jGU9AxT6gZFWGlV
X-Received: by 2002:a17:902:ce83:b0:2ce:ceef:6632 with SMTP id d9443c01a7336-2cf34948972mr262802425ad.26.1784721187139;
        Wed, 22 Jul 2026 04:53:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6247sm13376205ad.54.2026.07.22.04.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:53:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] ASoC: rockchip: rockchip_sai: Fix runtime PM state after manual resume
Date: Wed, 22 Jul 2026 18:52:50 +0700
Message-ID: <20260722115250.62588-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722115250.62588-1-phucduc.bui@gmail.com>
References: <20260722115250.62588-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_045308_332769_7F76FF42 
X-CRM114-Status: GOOD (  13.99  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Probe manually resumes the device after pm_runtime_get_noresume().
Since the PM core is bypassed, runtime_status remains RPM_SUSPENDED even
though the hardware is active. A subsequent pm_runtime_put() therefore
skips runtime_suspend(), leaving the device permanently powered and
preventing autosuspend.

Fix this by calling pm_runtime_set_active() after the manual resume
succeeds, and defer pm_runtime_enable() until after the device has been
manually resumed and marked active. Also call pm_runtime_put_noidle()
on error to drop the usage count acquired by pm_runtime_get_noresume().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 9a80e120dbda..55d17536c3b5 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1474,11 +1474,14 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	 *
 	 * NB: we don't rely on _resume_and_get in case of !CONFIG_PM
 	 */
-	devm_pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	ret = rockchip_sai_runtime_resume(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		return dev_err_probe(&pdev->dev, ret, "Failed to resume device\n");
+	}
+	pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
-- 
2.43.0


