Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EEFC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 03:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VaH78BxSqInc7YWoloFx3Urvp7YqnyUZb3BPxUwn1CQ=; b=GH6B5MlEGwcx6eyrjqmfZWqHJK
	ufF2zd2uVNit8D+D0gzSgz7FwiQN3HmgZUi8RLUC1VhZCOgS3HmLSG3LZ7yW/oL1DSKI+QVBXbQeg
	xWNH8Yk1HHbyD+7f7PTr+vJB6GYn7uNEkPmRlv6ydQNssdpoH2jJE0XkgxlaXxXXBlcctulDMYMHk
	Og9/+g9HsYSRysRvMYcpI0lsdZTD37HZ6Vp5O2qAzK5vnPRMVTDFfRaJJXNvIzxG9iaBkWH+Modwf
	CtYsFPkCi3sQU4MVXHNcwHIpbl3edLYxsxricXTQxoiETsQzAGTbIdvI4vCR0QxfgvZWH1vfD3EEU
	H4UEEKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugbPd-0000000Fri1-27wm;
	Tue, 29 Jul 2025 03:54:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugbNA-0000000Frb4-3AJe;
	Tue, 29 Jul 2025 03:51:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2403c13cac3so4780435ad.0;
        Mon, 28 Jul 2025 20:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753761087; x=1754365887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VaH78BxSqInc7YWoloFx3Urvp7YqnyUZb3BPxUwn1CQ=;
        b=RdnSpMfUarR2gx0MyP27u+YUnfM3PkNyS2FP55twLyN5NdOxfRO6Ic138Oju3qhzdj
         td64XNGr9Zmnr45Ait5d817E5MuK8OpNG9XSUZBd3/dbHxOUTj8LUiV0Seo4qFliiW9N
         hQifzYsDr+Q4zfzDipOQ09K2TMNV+FehSrAKSwxBuMrRng1jWRUIv9pOECEZHAN5dx5k
         G5SDy7czfFDqPF86tQCNYwZI3XcBmKrsa47PERMwJ04qtjsMSCv0sJDH1wuXexiOdx2Q
         jK+VeOUnshgIGnAXYjN1+7Z0Nst7oZ1clggVrVQQ8JxAQhqnmSfcH4fS1QFT7w097/1l
         uKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753761087; x=1754365887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaH78BxSqInc7YWoloFx3Urvp7YqnyUZb3BPxUwn1CQ=;
        b=VbatyEoWWBuq/xdhHGwN8WeO9p6VuCJYEiNCi3EuH5vI2OgU/fsJ1XngfnQaZnZEd5
         6Qu7L+qII80m+Z+8EyJsgYQVvWkhdRnrZg79Ubb95HPpdSRPkeykkzMaV7kxvv39XR9N
         uzGBqJhpSrACdFGRlZfy1vGGu9o6AdLQKWhn31kUJOQubTtaJA2kM+ijSV84AUX90CiT
         g5grWENiSZrg/SVbFfszW8MdTjV8MpZdq7MG7pqh4oT09RgCfcDEtk3E3Lf6D/rLgcaH
         MA+N9APCsqhI65UL6Ulvw5f2AwX0VG7laKXLvMwwRkkOrTQmrX998lYGAinbQhrIer8n
         HB8A==
X-Forwarded-Encrypted: i=1; AJvYcCVVTJE+5pbxOFbNqf3lE2o0hSfR2bC4q9ECyVSmBVEgK7oLZEuFXoy28E3P4S/g6iahfGCyEnucGW3oPgqOPBs=@lists.infradead.org, AJvYcCWoZjJjdHVatBQdTh65p6j/9maObu9BzGLtX7ra2r1JVGF3K0PVFZU6BZD5hazdq1/cGxLSmm1zxhnbDMhdz2V7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5TGQ3xc7uA628nCadWeaw4CIfNZZjh7rLU9FDhFQ7UduRbgNQ
	9oKlROd4RBEDPPdhLz2gvS13NebCiZ2jDnL3ueCmzR+K2jSMGSyXSso0
X-Gm-Gg: ASbGnct7exYh0JgIcZx5ynOjSgmjpd7tPmFhBmrr4BBaWIeDrSjWQMKT9lFHCrczaC0
	M1HwNSn4F/bXTXMOUDXsuruLT1N0O8676lhHR6MfUENDASilT5TiURBKtemR4QJM8TslZWuD5EO
	56C+o3ZFsl9U1UDgshAQqS47OSUFLhrMiwtr/mVD4njiA1lsBpFVI0pTQLYIesObPysDU8+W1jv
	eGHP3kz/+tMHtyvO5rRYMuxoQWVG22HAWvPQOjD7XenPr0lK6BP/LGY4vhjFeO7hv/Ku8ru6iHO
	lag0h7dAqOHfqi63crb6+YYuff4IYlHU4/g138UU76fstumPakrHRJQ1tzY5gHTbFUAK/yLBYJe
	TOjb8Wub4KhNk7+pZde6gmO5qTzkfxG8s4XWEJgEoDGMXemwGhBc5fA==
X-Google-Smtp-Source: AGHT+IELJXUiKm6KGXwaWiJUOPXk0c1EvlpOE0FOhZcoN6Z2MeI+X6ZgSi+Gg/tOSGKg3s7RZBPU3A==
X-Received: by 2002:a17:902:e84e:b0:23f:9718:85f5 with SMTP id d9443c01a7336-24063d62911mr24916295ad.15.1753761087280;
        Mon, 28 Jul 2025 20:51:27 -0700 (PDT)
Received: from CQSWSUNAO.transsion.com ([107.155.12.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24025f5a3cesm34549145ad.72.2025.07.28.20.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 20:51:26 -0700 (PDT)
From: Ao Sun <aosun718@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	geng.sun@transsion.com,
	Ao Sun <aosun718@gmail.com>
Subject: [PATCH] watchdog: mtk_wdt: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
Date: Tue, 29 Jul 2025 11:51:17 +0800
Message-Id: <20250729035117.3170-1-aosun718@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_205128_831935_5FF12482 
X-CRM114-Status: GOOD (  11.21  )
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

During the device resume process, an interrupt storm occurs after
interrupts are enabled, preventing the watchdog device from being
awakened and functioning.

To ensure that the watchdog is executed before interrupts are enabled,
Use NOIRQ_SYSTEM_SLEEP_PM_OPS().

Signed-off-by: Ao Sun <aosun718@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d6a6393f609d..5f2179dabd67 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -327,7 +327,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
 
 static const struct dev_pm_ops mtk_wdt_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
+	 SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_wdt_suspend,
 				mtk_wdt_resume)
 };
 
-- 
2.34.1


