Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762A0D767E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdJwrtv6R6hjXktx6QL/5y82lOaBKNXG+b2XzR89bZE=; b=C/JGQMvJIO4SgfLm3/2OAIntcB
	8eG9WrqXXCEXnv2vVscBbUKqhWhzZcqHYkfpiQaW4TXNyI+AeafXQT1EcDIBmgzsTRLCGx62NyKnV
	fhqt1NM491wXDSIhMYN/ufUCqFuGfe+4WGtMsGM/TjWqX07YAEO9gkOL3sNuE05trjrTcMZjKMyRA
	QTwnx3D1M3fogQQ/B/xYZvE5SCdqgB4SC80wrkxOdBjNWTwjtLtMuN5ssKBfbaL5d/E0nJs0NW9du
	a+MpRhgzLeZMtXs/tT+4ri+aJgV+c4/d96dj+11MaZ82mEw1MrNKMSZhYmD8Pb4msib5CS/BNoxeo
	wHQ4BRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XAh-000000040aH-1sEk;
	Thu, 31 Oct 2024 15:33:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfK-00000003tg9-44E1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so8633505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386849; x=1730991649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdJwrtv6R6hjXktx6QL/5y82lOaBKNXG+b2XzR89bZE=;
        b=XtMh+AedvZQSEEQoDI1Ko6HQ0lehrqF4GtWc8lLAj0ahB92e/RI0pLQiWYVHoVXkZj
         KXzhuZSHr9EiMUIbnpXxjJ4/tuJx+zabGEis/PJqbkxr3TvwS9jlSWts3l+4oKITwFUx
         SDdGJOrvCrFfASIjmCKDtTwfRMIxbit1GEJ4JyONEVWxqVPiNRks46fnhWeLvHhI75JE
         vgMgWUwdcv8/Ydi7KnSt5zHIqK1Lj9o4kHn4/eEhwQc2S50FxVSp0dR5qKigJpYsXizf
         qAJfgqlt9h/xNDtINigx5tRvk5fr8XX5MSndeMNNr4lDx4BCuHu2g3ACB2BTTIX06JjZ
         IEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386849; x=1730991649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdJwrtv6R6hjXktx6QL/5y82lOaBKNXG+b2XzR89bZE=;
        b=eFoXXNF6oylvMG5sHfMnlfMqL/wXkp6xSjXvYlcGozb70vY1NnoBujhL+PQUFa5iAs
         cQYnz7yNTZXc6JSbTclYwnS6zps8o/lzB9rH/oxDzMljdRNqeuKCRJeBibJXmr8sZZfD
         vrWE8/JQ4wHYxh06GDc6k5rocF4LAL1xShMR9BlVGjQW5PiHawXABTHMiGe0bnew0x0S
         8LRglgE8FPpZcbBjbVV0yd/Er5fjAm59XmkwQyFTuTdEaF05HqxQIIXEagt1f5OzZsry
         yeT0853c/arJ079pJSvBGo/2CwJXM0oMX9d1jkt3hjGhIctRTRWlM5kANlrdlBuZs1EO
         fhgg==
X-Forwarded-Encrypted: i=1; AJvYcCUUgWPk1cwdp5Wbx8n/ep4z3A+FXhPpUH/9Hw7h4aspOPtPA/PRDJU/UuCQYfvzMzv8ylUKY3OLfaKSxKlG8zsZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/kxiWVi8avrRD4Zm2FvmNng4qJ1C9bqlQUMvcBbRAPJEKZTbT
	1WobFbRmuFyB4GJ2r0spU8lB9Vc4Gqe4AkVqBcAT1xivRv9+HEV2RTPxcrmmozA=
X-Google-Smtp-Source: AGHT+IGte4mqUxYrFCHTiw7rYYrBl9FrCw5E7TjmHzs9HacaVeMVUjhzif1Rg3DaulCZuAOdHbN/KA==
X-Received: by 2002:a05:600c:45cd:b0:431:5eeb:2214 with SMTP id 5b1f17b1804b1-4319ad363eamr152298075e9.33.1730386847155;
        Thu, 31 Oct 2024 08:00:47 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:46 -0700 (PDT)
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
Subject: [PATCH v3 08/14] scsi: ufs: exynos: remove tx_dif_p_nsec from exynosauto_ufs_drv_init()
Date: Thu, 31 Oct 2024 15:00:27 +0000
Message-ID: <20241031150033.3440894-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080051_028951_74E8A8B0 
X-CRM114-Status: GOOD (  11.47  )
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

Remove the assignment of tx_dif_p_nsec as both users of
exynosauto_ufs_drv_init() function (exynosauto and gs101) set the
EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag meaning that tx_dif_p_nsec
has no effect.

Additionally both users also set the samsung,sysreg dt property, meaning
the execution flow will always return on the regmap_update_bits() call
before the assignment.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: update commit message (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index e477ab86e3c1..378c16d905c1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -200,8 +200,6 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
 
 static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
 {
-	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
-
 	/* IO Coherency setting */
 	if (ufs->sysreg) {
 		return regmap_update_bits(ufs->sysreg,
@@ -209,8 +207,6 @@ static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
 					  UFS_SHARABLE, UFS_SHARABLE);
 	}
 
-	attr->tx_dif_p_nsec = 3200000;
-
 	return 0;
 }
 
-- 
2.47.0.163.g1226f6d8fa-goog


