Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E94EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QEal24nNpFB1sUg3m6xqbmF2yfFZnIAbP+jKYgY2yI=; b=mPSc5YLPA7LQ1TryJ8Jcfk3j58
	5JGA+K+VhvCyxdcNwVKu3r+NtNC8sIsiQejoQRpGZ9sgURDivvZw+2yh9UROcd5B1wIIkbGFyKhuT
	lDS+Qk46yRYmR11z22pEG3XkzQPsCFEq0WnlK86r32A1YCbeHyz/qib33C7M2ziakaMVHmPtZzHfN
	L4IysLm9ipKkPdfbbeuJP3tC5oYYVqA54B7Tc0fTGLCD/BHMKTVLmZyqg6o8d6UyFe+Q5kEuRHwjN
	BgVFbfK/P1vEFTCXDhCv4xfZKxWO+q3SM98tdVSrkMLYxBGA5E5ZvwatGx14vReeuFOT0Oh0DgNpx
	GTo/e2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trf9r-00000003BxR-219s;
	Mon, 10 Mar 2025 15:35:11 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treDw-00000002wZV-39PE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:35:22 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so4502340a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741617320; x=1742222120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QEal24nNpFB1sUg3m6xqbmF2yfFZnIAbP+jKYgY2yI=;
        b=V+P60lmx4CzA4X3hGSWHk6aJjHvSlqhWhzXvkh5aIcRVbR4uVayu5MwrkRXdBi4DUi
         GyM+inpk4chlUPyEblHwdYGusUyEU0v9MJ9nfzsDjnejVV2Sg7XI+EJoFGpaz7cW3mHE
         Se/udJZgHzK232w5qp8Dd9tVqNasnn+H9kLVPC94nLVtdX4hmPCATOtzkBd3P7Jm5zTZ
         NAmy7BzZGxZhniWNGDX3mc+ZkKf1YM183Iogtg2xj5eBa995GDITxbAFbq4oToyLKomy
         vLB6cEIaqtXLUDxV7xEtUWS6ztuYbuHIwTgzhb9H2XN2RX3hCTiov2IdJYMJye2gq8aZ
         C6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617320; x=1742222120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QEal24nNpFB1sUg3m6xqbmF2yfFZnIAbP+jKYgY2yI=;
        b=ZSxDt3S4CK5UDhG1F/LqgeyZNXqtZzm668I8PBSdgQQxiEtIaxKUQ+RE0kipj9+51F
         UxUyxC7eQasd+MsaUI7WS/UPRrvnVDpmhWkWO8QbPPrnAY6PMkLaU0mc47Jg2K1+QOXN
         4mgs8zriVUqDZLxrFrehnP6wl6CZeUDcqF2/1lhUVs1EQdANtnxPKLDOcE13U3JKPFKI
         qmYa7fXXZ8Fn0d9b7ZjfAi/BUVpJlWqdQsecKYJsTAYfdcPzP7tt8heKScaCDchtCdLS
         HXH83qSA4vjudFl8PUmDtFIp/9U8BrgL4w/PXrr17ljGw90zlym7xIFZaIZn/Wg5tP/Q
         OnEw==
X-Forwarded-Encrypted: i=1; AJvYcCX2JPTsvLI1dj3A4jCwswoHa7EzjiQp8OFZ+HdAExWz/D6k7NQFqllTrtY1wyqcsQzS2C0Sz3c3Oyr/hTlfET7X@lists.infradead.org
X-Gm-Message-State: AOJu0YyBPxyuvGTlf9VF3gyUz0C5Cw7WduNbP5uGc2UPqeD7zOMPg8TL
	196bgVzAULQd9sflZ1PyAeieNfuXFdCBO3vICZSTRR69Dh2fTyNb
X-Gm-Gg: ASbGncsxJi1Lq9YULOKmA8PKCbCxoxiwjqMPn0LzceXE3MuInDMcOWv9I00dtTeNqzI
	nZiyqgD7LAIPW7RSKWQvD0nT1TrwVcvJrn0YTrpxJZbNSGRr7PKB5fk8mM9wztFzWU/rYgbLZmw
	+2I97ZrUkE1tL6GHddEKL2G5BCvfwqHJ81VkDz9ZSnFhRg4zSfTCMInQBQUwKuZAeyRNn/cArTE
	XmFti+WjJ8mk22iEn+919BaxalzT9W8+sb6bAoB2E6KBF5Fc0jnbI3oMHc3UfL3hxapOJCoTtN8
	RrfD1qdX/wIB6+NIhH27Xsr5u9QSOiA/IGZkaOuMI2IOBmgdrWVRdUU55a4=
X-Google-Smtp-Source: AGHT+IGcgMPRI9hdBCeUstUHpb1PU/WnBc4AvJsnipWByXBWrlcqIrz/Leyj4EN8DuL9JXzghzFyRA==
X-Received: by 2002:a05:6a20:cd0e:b0:1e1:a789:1b4d with SMTP id adf61e73a8af0-1f55611c851mr13246121637.15.1741617319780;
        Mon, 10 Mar 2025 07:35:19 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281096763sm7785900a12.30.2025.03.10.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:35:19 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v4 3/4] drivers/thermal/exymos: Fixed the efuse min max value for exynos5422
Date: Mon, 10 Mar 2025 20:04:44 +0530
Message-ID: <20250310143450.8276-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310143450.8276-1-linux.amoon@gmail.com>
References: <20250310143450.8276-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_073520_788701_51F31079 
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
 drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index ac3b9d2c900ca..a71cde0a4b17e 100644
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
2.48.1


