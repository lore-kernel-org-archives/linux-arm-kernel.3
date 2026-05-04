Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0A7FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=; b=vcyOEyjUYJHNBmXs60G2h7A21W
	U1GTcgHT5gHq6jIUMNKQgwihizR4dPgF9xoEAQsa72W7qSTkmQhJ6gI2ZVdtzsJ8ebq0EpKQbaHjK
	solX+yaPznuooUeCGWwnvY6zpwLUAim3qPt8ghs+QGvsmVNi6YOgBeLv8MYQ5i/B4IdFnO6N8bWVw
	UImuUkUwA4cePN2YIvdBfu+++EBS6Faa3lz93HIrlp9dgsM6AQacGoN0r0RQYPJeR4eUpNRpe1pmc
	SXq9yJ62CHLqaq1BPurz+tVUKKmquHr1SGGct5uORiWS2Bj6i4H5FjjZpaPD6hPhkx08iz3+yMYRS
	9isUnlkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLF-0000000CtfO-1J4z;
	Mon, 04 May 2026 10:15:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqL9-0000000Ctaq-2DdZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:15:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-449de065cb3so1461582f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889750; x=1778494550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=;
        b=ZLJ/O+32mo8peqCCTGyT32QGUKJwlsH5DDat0rgfA603TTIEuftbA8Im+Hd2eEzree
         ojSwecKRx9ABPufg04zJw4bGtfYqoNnbYjKac9QIl+rXeutTXlQiTmx3vQsKF96ilonI
         +ZFFna1fvzwCNY0YwRIHpgGPqM3bCHwCgzyc7uXko1wiWf8Z5HKi9+Dim+BTzTjR2D7z
         flziJH4XYQZoqJoa3MjHyp2FmmhHgJS8JLIsoGRAje2bxML+b4oFcXmOdjAfgvvCe1YD
         LFbt/7zZO4kaRVzjlQS/yiIE7i2d1GSf4ru6gGk+Ay4HBtdJgfc1SqaS5iYzY8yC7PsQ
         gjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889750; x=1778494550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7zXNbcb1r2bmykw+LmN/b7BGBlvkjjNT8szr48jA7Sk=;
        b=YmwFTMNSeP7nLY5UGvv3sIhDbe4GJ0nMu/kDj+nbvo6Yg1z8VSrxi7a59TjcRY5vrp
         vTkb73hpMWMZ6qsfFtTD7STyzdY9gQdCAeFGMBvGz42D4t5CKD5hiadh0HX7/oSL91aQ
         NofYWjVbQccUELxILxu3oQT+cwT/oz41jNzulkwQc5UfDonKfhYyCRGHNfBrKrjFFu7k
         B/gZOYk5tyFRiYs1wUO4zOQ+jtvgtyJW7CF27sCo3kdyXQkhgMRouCVHxiEeTX2JJpr4
         n4cD4x5qhEXx/r7HLBOv0TMBmk7h9hBYoAt9AFUJSVo6UMZL/nAhMsYHMCs2TRW7pJbn
         FHug==
X-Forwarded-Encrypted: i=1; AFNElJ/oXpRjKL5mq6+GIA8EYwDhRdqjFjjz1Cvvz5lKyMa9v2HiNOyqVNvL0GMxn5EynBfKZAuSdiRnxjve+9ym8hm1@lists.infradead.org
X-Gm-Message-State: AOJu0YzqHg35KiJBWv4Wpt7+d61S663+1bHHi+q59RkzWEbTUqMWptbg
	PQnfJzNh+dvy6p0xTyirVVr5avvTOGhNy9hC+zI31nn9uTSBxp/+Op/tK5Hsi0HdR1k=
X-Gm-Gg: AeBDies55LNR9NvbuUDv2Y5ubkYV2zXs/6OQlGrP+9jHOfJzDMWz3O8QGVRVaL58hd1
	xS+2H+3zABSKTBBGsBnectFRtiW4OVck1MkFFmoxmA2w59rSltu+vDNsLz/h34Vc8lt0OpgwP2N
	VRkFAFNuNqjx6Cbessh9ei+NkkLQuO1ru16FvQP8G+NNpr+01BM+VA52mMylOVmsGAyFx0btwty
	hTuGS3vYcuDXZMl3FNBdteqZJFxlejt+Gm6vkzYbQZf0LMN6Wj9xQ27rgRZcVzLH509ziZ3Tqdh
	4k42mE2TY0d2z9KutUfwbnEldXyBtegmOfjR5PNYd9FVOJJAtNoQ3Q1mSPfTy3L3H64YjpTZqVs
	uJCWfDDM3QGGhAZf8mRGAA3yuGcGouMspN7OrPCV/PMCTU5mWPYaK5ajR5Huw/+i1Y1Ed0CXrwL
	IPzN9FrdgeYGEMSaWyQPECCBYsBlE2aI3Rg/NMMCIyyAkuzpZLvNtUpmkgidATnnp7skg/dmImj
	J8vGTlN+WMYBTI+YA==
X-Received: by 2002:a05:6000:1a8a:b0:439:beb9:5a96 with SMTP id ffacd0b85a97d-44bb6ab21e9mr15653154f8f.31.1777889748670;
        Mon, 04 May 2026 03:15:48 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:48 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:45 +0000
Subject: [PATCH v4 2/7] firmware: samsung: acpm: Fix mailbox channel leak
 on probe error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-2-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=2402;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=d7vm0U9qdAXbH4NbIyamvNnVpjWmz6WguBCwDQ3CBjQ=;
 b=0rNQ8Y4iQCyOFXljmUsK4qxlKqz8T5lsKjJdTaI1xueZa/M4bjprLdfeJPxcebI5j9oy37Z3F
 lHwd2yowtI2AHXEbLPaxKxhmQ4iqTdhtr+bGVHVA1ymMWJdqABBvTvX
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_031551_624041_E458E464 
X-CRM114-Status: GOOD (  15.53  )
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

Sashiko identified the leak at [1].

The ACPM driver allocates hardware mailbox channels using
`mbox_request_channel()` during `acpm_channels_init()`. However, the
driver lacked a `.remove` callback and did not free these channels on
subsequent error paths inside `acpm_probe()`.

Additionally, if `acpm_achan_alloc_cmds()` failed during the channel
initialization loop, the function returned immediately, bypassing the
manual cleanup and permanently leaking any channels successfully
requested in previous loop iterations.

Fix this by modifying `acpm_free_mbox_chans()` to match the `devres`
action signature and registering it via `devm_add_action_or_reset()`.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e95edc350efa..9766425a44ab 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -527,10 +527,11 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
 
 /**
  * acpm_free_mbox_chans() - free mailbox channels.
- * @acpm:	pointer to driver data.
+ * @data:	pointer to driver data.
  */
-static void acpm_free_mbox_chans(struct acpm_info *acpm)
+static void acpm_free_mbox_chans(void *data)
 {
+	struct acpm_info *acpm = data;
 	int i;
 
 	for (i = 0; i < acpm->num_chans; i++)
@@ -558,6 +559,10 @@ static int acpm_channels_init(struct acpm_info *acpm)
 	if (!acpm->chans)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(dev, acpm_free_mbox_chans, acpm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add mbox free action.\n");
+
 	chans_shmem = acpm->sram_base + readl(&shmem->chans);
 
 	for (i = 0; i < acpm->num_chans; i++) {
@@ -579,10 +584,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
 		cl->dev = dev;
 
 		achan->chan = mbox_request_channel(cl, 0);
-		if (IS_ERR(achan->chan)) {
-			acpm_free_mbox_chans(acpm);
+		if (IS_ERR(achan->chan))
 			return PTR_ERR(achan->chan);
-		}
 	}
 
 	return 0;

-- 
2.54.0.545.g6539524ca2-goog


