Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9ADFD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9CY9S+XfcmJA4+ujnIwwclN0Srt+SqHl5c79qw+b3VA=; b=ESjILw+zLpTP3+VaXrdSbfHFmY
	StdCd+H3xKa6YyhHStbOrEHLw2/1FefjIS2GEa8wixa0Uj/HQRK+UcybBlmXrXOlnIRLyNXe8li9Q
	/SZtlh5sGq1Mu9YVliJZwdt+qJcUaMst/pghrejI0QCohz+ZfiJQIKXDIyewR5JIqah1BBNn+kW6P
	t8DKzAUPyM7Yu0gvMDDCXIc6Fr2fofCBfvnSXD0CHHefEJGx+ccttx9z8SI6vAcNTpkJjIO4dQuhE
	/9zJYvPhaE+TshFwcxsRUq9ZRwtxJLMj+eWA1patMHbTwSKKLi/PMIvisiOUxqhKhlPfIJ2h46w58
	GSC84xuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUpq-0000000AQCq-1xHq;
	Sun, 01 Mar 2026 00:39:02 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUpm-0000000AQAw-3zBO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 00:39:00 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5069ad750b7so28839501cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 16:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325538; x=1772930338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9CY9S+XfcmJA4+ujnIwwclN0Srt+SqHl5c79qw+b3VA=;
        b=TSXMuCo5jysK4FTIxp5fuWTKdwm3Uyo3sZdzfCOXuazRVivJJPeKeUgcvTAc03WIKk
         AyoDVZVeY1Vzf1GwxYHu1GG16auJrQyYlPol0ECFrCfDWy+ZTyMgKC92SWbWTA4FdeEY
         pZV9rpNGNuQMPGDcE3CG+IfyPUhMAH0wAfgcHEw16PvouWSeiXUc3gqVuIypW0n6yx4K
         WY88+f8bcGMptWQfB8014UyfaaeO8jtb+V3inbMYQ6G2UYx4M/4wS+M8VhAygaslSG7K
         F1eHy2BuIz2zxWAyPfDHiFFmjH0Wk9KEMSAB7jq+oE+XsgYNf6HSR3QxoDhlwh8ZVKjF
         NX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325538; x=1772930338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CY9S+XfcmJA4+ujnIwwclN0Srt+SqHl5c79qw+b3VA=;
        b=Hx8l+BDI2CVXXgoUZlzZUXAPOi2BCWAJJB6o/AQZD4vdWI+jAcZb4BHBeFk8QDuIJ8
         Zwo2vvG/jXqc7hfyR+j5in6Qt3wZQ6YAtrVeCgttc7x0KC8CaVuHhT7IG6TNFIQlC2VU
         5LluCHCMBWBJ6VIiQ3w+6KxBb/8WiqM+EIjksIday/j1PAq9O01qN7tWsUTEtlgiJJ2y
         l8sEwNJqKKe/gyJIbmtDd9OOp0Mn8My5oKqgKT92w0f23JHuHw4bQ04JnMF5hvLeJ9mZ
         e+rG4C6cP5LrkvWD6a2WnXxKjgv1fYchmoAyxjmbn4hSgwF/4z/LJ8Gwap/T42ZgD7g0
         PfCA==
X-Forwarded-Encrypted: i=1; AJvYcCXeXXnhE8oZ6vTRLhaOk/cDUFMuMSV6yq8LmPHY4x7mE8DIjAaKHClEUNEOrFr+cN1G4vZ9Luekxo/OpwCJydLH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6ijGB6eU/WMsLKvLS5kh8zP8fCUi1UwwI0CT2xtM0g/YVNHXc
	D2vVgd7iE5U6KOamQWgVnCfcvPuvFJx5HuOno5yqPV9kczHao6IhRZpd
X-Gm-Gg: ATEYQzwDhLbmrYhW/4SQOE00VcPfXcVEacb0a0Y1NKIF5r4N/bn2mDQNRbT7ND9V/K1
	3AtxSnl5ualOhClbJhBdRc6dhR6McSZQFPU/pBd+8v25MN6CuvcVwAF18+oh3izHCjRKC1cr0UG
	4+g4vZ7JqWsXbMssHaJvVNiMeWwIqDxuagRXhIdxMBD4bUJuk95fJUvUcI/7b1sHFQ7CzXnLshW
	XTbc0In5ZwkQDt32Mlwv83BJEGqA7BvinU/AcMBgqbtxEO0eukY0T6dFfh71sieGLN+pBe99nAo
	YgtIhUz0ik/e69NrZ8NxvnIlKHzGtU+G877yCt0mOv9jDfLmqx/h8g9CPEYmLqw185tENl3s2AR
	JaUv8LIU1f9ZIDlEiWfYiB8qMUAsyFQgbWpIw9/R9OnXQj3AFW2axVocQ0Hbf3s4eKYEwP6ahQB
	dFlJZWNxhzeQUY/xboUwEMVJjYQlsKiQZPZVbM5obNou38fRAyXXYYYSsDr/wWCLqQSO5Q44zGP
	B26Rg3r7ckGj08=
X-Received: by 2002:a05:622a:1651:b0:501:17b4:d559 with SMTP id d75a77b69052e-50752760149mr98477021cf.20.1772325537675;
        Sat, 28 Feb 2026 16:38:57 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5075feb4db9sm26610121cf.22.2026.02.28.16.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:38:56 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 3/4] arm64: crypto: fix SPDX comment style in sm3-neon-core.S
Date: Sun,  1 Mar 2026 00:38:55 +0000
Message-ID: <20260301003855.2504477-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_163858_992801_AE1663C1 
X-CRM114-Status: GOOD (  11.30  )
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

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/crypto/sm3-neon-core.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/crypto/sm3-neon-core.S b/arch/arm64/crypto/sm3-neon-core.S
index 4357e0e51be3..c232b716cedd 100644
--- a/arch/arm64/crypto/sm3-neon-core.S
+++ b/arch/arm64/crypto/sm3-neon-core.S
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * sm3-neon-core.S - SM3 secure hash using NEON instructions
  *
-- 
2.43.0


