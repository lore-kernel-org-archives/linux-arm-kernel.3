Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB693D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HsH55Dd4lXD8RaepfS+tYZBwCj18S0+Osi4b6XYRas=; b=OVfwhfuAkY78dGwIYRn3xTCm6S
	0+tPMxFz2K5Hqp0yMBeIC2wNu3I5vQ11U1UIIcrgrTZwXE5/3VpYUpgvRtUm8uRd+5G4d088nA5Cl
	v4X2l+kA5qlNb8ZZNIVjLgAQhGdNELyglb6R9sASTc+p7dYlIJVxvTLkDi1AAUoacTJfnGb2aGXkR
	F0hdP3sUiRv97NjKnbj5uKx8htTIQUs9GYVSs95DbtC6+Zjl3Sd4NDkf0hNUBBnZRtpyn313LlCSr
	0ZgJpzb7Bfds4yb0v8W0XBh8Q5cTEnP+hfUKNqZL0eRVzeCsOBcF3y6zmsEjidcRFE4Uhi7H8l/2+
	dj/MKGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XAl-000000040cI-3Maf;
	Thu, 31 Oct 2024 15:33:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfV-00000003tk5-05DX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:01:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43161c0068bso8558075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386858; x=1730991658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HsH55Dd4lXD8RaepfS+tYZBwCj18S0+Osi4b6XYRas=;
        b=ibBapZNAKM7pwEvTbH0cqNTUdw9OzEkH88j19b5lmVRprbPT07KHUo0WGbR8Xsx3sG
         dbAt/wiWx6RfZRmUlpRZ3/+IhvYc64Fort3fzbN4iXxN8aOzHNljdnu2vwAYWKwjTsPV
         Q8ZYW8XVtdZu+qbwyRqXU4Ylgqg6P/UcUJQwrzfNHuUPCW7uCtpSBIbpymTtH6bSb8cj
         RGCk/x/bRSqhNOc8c0vJr/aBj/mXekultBkRXYKy4k1f7WMmr+jgZnFP21aeZjtPdOLf
         /GpyuEzPYQ4N6Tf6Ebf/7TzF/xY6q5zQC9jPV0rS7F5z3XR/pcVszC5vLzunwAQTAi83
         Megw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386858; x=1730991658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HsH55Dd4lXD8RaepfS+tYZBwCj18S0+Osi4b6XYRas=;
        b=F6hDL2a8fY2aIAKrt3SwnvI0hcCYCgXFXUKWfXCOJG36Wz6wzMbWbvKCk+GRMK2Pyd
         tUM2hsYrOwicr3TR2Hg4JLyFrmQ66fRwNeJmF9qMYXhAYM0sUyZVuDZHRD0o1UG5am/C
         UfSMhi9QMBGVeAi9QfvtvLvqOLVr8q31FGXiy2WY9HUho4/MzKxNR93HjyE5WlNB/equ
         MP7lBP76wwpWBjtv8QYL3uxYIBNxpNxb8Njm0nAgLYtJcbqmyobBRQAwYDZqSPPomLG1
         gZcbz31v1CEo8GbOgJFpaeHm8FY4qp1I8DhIpfMDzvDGBYzxGSHWam1+bY7g5NIhmVql
         uAWw==
X-Forwarded-Encrypted: i=1; AJvYcCWyxNe3KYtt5hX1RZ14dUwYrtjSr4eDA5qnZUnhgDYm9kpp1iQ9D/sIMkSbrbmR+pkUgjG2WvN3RnSfqJkQ1A/5@lists.infradead.org
X-Gm-Message-State: AOJu0YwwF+9ruGvxlwbGItPGfSwGwYIC2Udo6SI0FUk/KSbmVI9LyQX8
	uryRGu5EsKzmRZtz8wH//fxcVeqg91j2wQ8CeyUhrFiUHJGDGxD0CEjPJ1somyk=
X-Google-Smtp-Source: AGHT+IGnBCp8cTrb3nL5Yu4gI9ybHFIG3eHfaMc7SBxhRN7NF7+XLcEhVXV1Ky/UKTvujdddg7F7rg==
X-Received: by 2002:a05:600c:1ca9:b0:431:50cb:2398 with SMTP id 5b1f17b1804b1-4328323f576mr1510895e9.2.1730386856237;
        Thu, 31 Oct 2024 08:00:56 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:55 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	ebiggers@kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 14/14] MAINTAINERS: Update UFS Exynos entry
Date: Thu, 31 Oct 2024 15:00:33 +0000
Message-ID: <20241031150033.3440894-15-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080101_102208_FBE0B24A 
X-CRM114-Status: GOOD (  10.40  )
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

Add myself as a reviewer for ufs-exynos as I'm doing various
work in this driver currently for gs101 SoC and would like to
help review relevant patches.

Additionally add the linux-samsung-soc@vger.kernel.org list
as that is relevant to this driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea8a2227b822..0057faff6239 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23826,7 +23826,9 @@ F:	drivers/ufs/host/*dwc*
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER EXYNOS HOOKS
 M:	Alim Akhtar <alim.akhtar@samsung.com>
+R:	Peter Griffin <peter.griffin@linaro.org>
 L:	linux-scsi@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/ufs/host/ufs-exynos*
 
-- 
2.47.0.163.g1226f6d8fa-goog


