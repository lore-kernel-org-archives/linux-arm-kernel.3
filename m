Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00F4C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwBWVtKLvZUX90IaL1GXJa6X4Osy8NtQPUZg6YVkZI8=; b=PBQx/QOY1ESq9dVxt/yt1x2lw3
	mM0hC9Vbow1vsRL6nJKlftKUHkbSOtCyRt24xznmIXgSoOekqaueY/wM0X5bb/dv5CiRE1aprrQo/
	BotBUdGAmjm8NfDJl6MNBxsaYax499KEG13km+TNZYXUL5ZkS2JF8R8+VoY5jwSQuGcAFki5pD/Ps
	/IoNvFP8tsq59QS4BeM4Jtsd/cHCSNfYPfb7EpFXKcBvOWXzPZ7vQwVm9J7+DxyG6sC+62afzkE26
	ggry6i1q/JLZlmvgmQ9vvOmWes2i3FgsRbQt3RGKWybxc0tn/qu6DPRw9bDMq1Ol6lwZoNRjImXNe
	LBExhSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lxJ-00000009Sxz-0X2r;
	Thu, 10 Apr 2025 07:04:09 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lYU-00000009Oac-37tb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:38:31 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-af9065f0fc0so339322a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267110; x=1744871910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwBWVtKLvZUX90IaL1GXJa6X4Osy8NtQPUZg6YVkZI8=;
        b=nBNLfmlNIXZm115m4ghhadPvHpvRL4GF0/X+UGzhPYkJiOA9CvoDih1xFh6K7YPYzQ
         AXmp/jZ/8slkZmQyjJ1oGUlYG0pcnZQXciI8nXbHjZrsf4sROPkQ1KHh4ywUiLw9k+pm
         a7vLYrHzWMvhZZ+p00PQS9jm6FsNLF9c3RhWhWszBJzz43iOObSGvrXS7c/k8Bwpa4SZ
         NbY6JHS+nEPvgMP+rIcbCsmR+N62XCrigyn3d3LXNOfTR1ILBAUCW+MOVhJPw8WZAHUg
         kSECrO1TiBqiQuCCQYMucWkFjrLpy4cPKv/aoDVKCC4Ech5Vb0HE1ST4p0NuYvdff6+4
         UeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267110; x=1744871910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwBWVtKLvZUX90IaL1GXJa6X4Osy8NtQPUZg6YVkZI8=;
        b=Sw44aXlDMG06RyyzCJ2K8VY7OX/1zXry/+x9fKXC9QWRVFNlAh8XR0/5ywPUgJKAv6
         M7t2KQ76FQD1kHf/A+BSHqZ/rxrx7ZyoFOlJXJD+hdGfAYJIlbtqBezaIxRuV0UgEY9B
         Ih2qqdohO5xqMcWU18cIa62RUZgdjhBNjoNeYsYk2Q1l7Fy5nov80LhiQFLublqIppev
         VgANH+zQccX5BeatuYdw5f+tXpYH2qLRttSf2+Kbu1y58IpDYLtmtZPmZH1gl+H8EEtv
         cpsJ7SD25/AO0wIPA2eyeEMFH6BZxHWsx/vZoPRVdFNv48pINIwgaCYl8zeSlwNsr8AY
         2l4w==
X-Forwarded-Encrypted: i=1; AJvYcCWv2YZZNYjIO0Yh98qB58xmvPhUhUy0fidOyH93jT8phvijUJ/MDU3T32n5Y+OjS99NWb2RpdazfhfTTmVIkDDQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxFj0EIR7Nxq7TiZZ0CZpzj1HPljrs22FOcFnYoyl04RYVeY/2V
	O8Mh0/XO96aNOmT3QQLLq/2AhzXVeZReDq97+elfYYnva0glWSqo
X-Gm-Gg: ASbGncsQKRhzTD3qiwEuPUMJNgDadv3+uFSHVG6sBZvaOD1mBi5tWeQ9Lfb+9vVUbv5
	w98FM3pCFPtXz8FrBZsGs2plr4vMJg5uI2ZWM06fApaoMtoVBJoUwTj5Carp8DAzc3P54QT6Y7H
	grPniz+bChtv/MQC37UNG5Gx86+COW+CWGyCT0ssZnEwO5GQF928IpMwe6RxuYDgcN6fwfTPhoa
	d+fEji8CJ1arFgWfSPOJSFq8E+WxadYAjIuQOLPtNFx6nClgflHwvTDPFnhTPWDo148QQ8i63JI
	5ZlO5noxUskk2mwOGiVAhs9gZhmcoQ8BVRP/j0IoIlSwFl8OVNn8msU=
X-Google-Smtp-Source: AGHT+IHqaItgHXzm5GD1OOSPTM/mlSU8yR/6mCWuApDW+XD5J+FRkiOjtHdGHPDLxBBGTZ1nuFcFiw==
X-Received: by 2002:a17:90b:56c3:b0:305:5f25:fd30 with SMTP id 98e67ed59e1d1-30718b5408dmr2785207a91.4.1744267109577;
        Wed, 09 Apr 2025 23:38:29 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd57865csm973145a91.2.2025.04.09.23.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:38:28 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v5 3/3] drivers/thermal/exymos: Fixed the efuse min max value for exynos5422
Date: Thu, 10 Apr 2025 12:07:50 +0530
Message-ID: <20250410063754.5483-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410063754.5483-1-linux.amoon@gmail.com>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233830_787111_35380ACC 
X-CRM114-Status: GOOD (  15.41  )
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

As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
if e-Fuse value is out of this range, then thermal sensor may not
sense thermal data properly. Refactors the efuse value
initialization logic within exynos_map_dt_data function by
replacing the nested if-else statements with a switch statement.
Ensures proper initialization of efuse values based on the SOC type.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: None
v4: None
v3: Improve the logic to convert if/else to switch
---
 drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index ac3b9d2c900c..a71cde0a4b17 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
-		if (data->soc != SOC_ARCH_EXYNOS5420 &&
-		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
+		data->max_efuse_value = 100;
+		switch (data->soc) {
+		case SOC_ARCH_EXYNOS3250:
+		case SOC_ARCH_EXYNOS4412:
+		case SOC_ARCH_EXYNOS5250:
+		case SOC_ARCH_EXYNOS5260:
 			data->min_efuse_value = 40;
-		else
+			break;
+		case SOC_ARCH_EXYNOS5420:
+		case SOC_ARCH_EXYNOS5420_TRIMINFO:
+			data->min_efuse_value = 16;
+			data->max_efuse_value = 76;
+			break;
+		default:
 			data->min_efuse_value = 0;
-		data->max_efuse_value = 100;
+			break;
+		}
 		break;
 	case SOC_ARCH_EXYNOS5433:
 		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
-- 
2.49.0


