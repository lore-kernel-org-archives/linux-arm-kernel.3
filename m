Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A5AD3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awcNgOinq9mb8rRdpT9oztyZ0WKNu1hzxPR/YyKgUD0=; b=vD3u7UEJd3A/VBnuYdAJU9hxuU
	4CRBHwzhM6u0ie3wpWk+Gk1rJc7au2BOjz8p4qH4kdb4+glPYGODUMGUmTIMK5zxXp1pbJzHhCy0J
	3qUM9BtraA9B+Xsv6jjZYB81qBRUfpKs2AGIKopeEgCvM7p/WhzY1Lc1J4BMd7jGXP55bfH9EiamE
	z5/SM0bW97CH/Lyg3RlQgzeiFMUKGtAcMnW1a4f+KIUsyeJsf17jNFQKHfDOUavhZA+NRFznihIK1
	X30n+pbbaFd2CSnBb2zfg8zK8vs65Gpuko/XGjSfY6SetOSe7Wt/atGXApA1CRVWUBJAUkDCQjthg
	V3ZSapeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o83-0000000EvKS-3TRU;
	Tue, 29 Oct 2024 15:27:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o3C-0000000EtS9-3oDx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:22:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so52997595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730215349; x=1730820149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awcNgOinq9mb8rRdpT9oztyZ0WKNu1hzxPR/YyKgUD0=;
        b=QGfAeQYWY1ftLYr+jE/iO0Lsxu8GOr8MFfkc/5Dd5NPjMkgQfMMGXMgfUXoWxcznfm
         PX22EpF43/cxnpbxVd3OIbLbAIvxBqsko0iBh7ydffis7LnqJkQekHZImix4/nj6MZmh
         7ZFdOTrDNebyM+Uyhkv2pQ3RHoFMMzPGZnhNv1Z2Ok2KOxMjmNibcS8veOo1JmW19aVs
         YZe9P9f0S+y45EgB1FzJs8CEl+sJdlxzgHgMmiiEEFSyttYnelPoT5PBEWQymnj0UEa/
         2lmvppsqmF8feFXbgGDBcgq2N5d4H3/NlveJp7ehAlMj74PU5frBmFeI9IHcXQSwVDN8
         i27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730215349; x=1730820149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awcNgOinq9mb8rRdpT9oztyZ0WKNu1hzxPR/YyKgUD0=;
        b=E9pz0IQq90G4aWinJ6FDwY45yNQm17fdpViijYF1KDyDLjv8Vt9k/1mEnEAZ57PdUg
         grmISxmDkVbmXqvozFJgnevdHx+Hpmc11vZVzy9EZO1f/Ru3eIxm9QhR+6oFZBXO9stO
         j4jBndn3FFZRr6BcQs/9ikRwXCA56vSNI0qbzcMXGUj9I4tj/SIAk1GFJDre2yYNJuzo
         zsNlAMpL4ZTZ+LumVJ+595TAv/eTmO7eAhi32T3OKcXUbvPo40iLxnFhOy3v9xPtmawU
         yMPHJ2CLyD2OZ1wCdgt+Z7nbE3NpURW5ZBvbMHWeO3R3axr9ChqlPtljHAKq/Nuct8dE
         hSVA==
X-Forwarded-Encrypted: i=1; AJvYcCWxRvSowlr2fOoQaaIFTtSYyIIvvx11DjpOjUcHUUneF7u30gPiT/UVmNN+XhVSYqsZ/2V9ZgUYltzAwb1hx0MU@lists.infradead.org
X-Gm-Message-State: AOJu0YyEUaEornYjehLiLFITmFOlIFC4Pul4zk48sptFC9qFy84CEEXS
	lgrIzTv/oCliU+js44rapzm9yfia5KKm+QixYQZrlnag1Ell8YbH
X-Google-Smtp-Source: AGHT+IE9vFhqscMH2XH7WucYsm+7424jo51krLCV1bd7E3yubxSEK7J2dRuiCubpICZLlhVPhD3R8w==
X-Received: by 2002:a05:600c:3593:b0:431:4f29:9542 with SMTP id 5b1f17b1804b1-4319ac77f6amr85365695e9.6.1730215348801;
        Tue, 29 Oct 2024 08:22:28 -0700 (PDT)
Received: from localhost ([194.120.133.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b54303fsm177639455e9.7.2024.10.29.08.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 08:22:28 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Markus Mayer <mmayer@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Revert "cpufreq: brcmstb-avs-cpufreq: Fix initial command check"
Date: Tue, 29 Oct 2024 15:22:27 +0000
Message-Id: <20241029152227.3037833-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_082231_002739_4A43D18D 
X-CRM114-Status: GOOD (  13.76  )
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

Currently the condition ((rc != -ENOTSUPP) || (rc != -EINVAL)) is always
true because rc cannot be equal to two different values at the same time,
so it must be not equal to at least one of them. Fix the original commit
that introduced the issue.

This reverts commit 22a26cc6a51ef73dcfeb64c50513903f6b2d53d8.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/cpufreq/brcmstb-avs-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
index 5d03a295a085..2fd0f6be6fa3 100644
--- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
+++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
@@ -474,8 +474,8 @@ static bool brcm_avs_is_firmware_loaded(struct private_data *priv)
 	rc = brcm_avs_get_pmap(priv, NULL);
 	magic = readl(priv->base + AVS_MBOX_MAGIC);
 
-	return (magic == AVS_FIRMWARE_MAGIC) && ((rc != -ENOTSUPP) ||
-		(rc != -EINVAL));
+	return (magic == AVS_FIRMWARE_MAGIC) && (rc != -ENOTSUPP) &&
+		(rc != -EINVAL);
 }
 
 static unsigned int brcm_avs_cpufreq_get(unsigned int cpu)
-- 
2.39.5


