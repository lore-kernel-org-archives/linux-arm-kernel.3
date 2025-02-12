Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A894C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/QZ9Cdu0zKxLgzr6zBi4dxJDTj6qdFAvLYx0NNIbaM=; b=1DxFjDU/zEb3L8Tozoa8chmNuK
	P56lMcO1Xbz9se8EJu/8EMjwrZti0jpCPWywPPMzx9wMpCGm2DQ6xI8D2QHoDlmBMYCwUwnqSOJ4L
	dnIkUKfx/pwxDCer/mylY5Ej2vzJAGqYoD8HlHcDnsTUyyZ55yfim1/SssEOopQbTj8l+pA+AMJ0q
	LIXGq9iRz45LhLaeLGew/FlA/IxOqcaTs0+t4CVMoUdZ0LXFm/vafVG9OClce5ap84aPgdm2KTUr/
	IpSFZD28d6RamQIsUQwG63qpoETM1GOrTVTjFInh5/nud/wpraQ4AOcZGm7mY4rYemWBPBgD2UiOk
	RlARdLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGaw-00000008Kc1-1eF6;
	Wed, 12 Feb 2025 17:32:18 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGS8-00000008IqK-3moV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:23:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21f7f03d856so78448035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380992; x=1739985792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/QZ9Cdu0zKxLgzr6zBi4dxJDTj6qdFAvLYx0NNIbaM=;
        b=j1IJPeblv1zWLFgK1SKEcjXTGSB33DZ43J3tAo6Fu0NXws+eZBmav9MG6cMLyWfFyP
         +ePZsgV4PXkt+aSzyqmjURPb+6xqPEh0iiT1bkbTp8pz9/QPKs+HUI8s/xl8/YBGy+a8
         q+EjOmjExjNg+fIRsoabdtpDnH+jM26/VEiAphYbX66v9+vUADDcUbg7og3SIsef5Ha+
         Cpk3QMczBo4hTbtHxfLj5raqy+n8oYJ6rf9Z22tHLaRsOiwoJJQxE6qyRsX4nADMsheK
         R9B5BA9k/J+yj5IkJbTuPj94lW6v5cboSDdvtGYGdKCU3Nw1dDQzxu+cS9iRvmQv6+Zk
         vofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380992; x=1739985792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/QZ9Cdu0zKxLgzr6zBi4dxJDTj6qdFAvLYx0NNIbaM=;
        b=jPpg7YwxHxj1jMzi77poC/zcBFW/2m0NnXdpgN41dDFz6zYY9fgXNyVlZsAWdQvwFr
         EZrImZqd++R/NIawa6EpqYuYtNV4pWtM4RBKu8x2otXU0hkhzMYAuqFX9MdnHhkI0fcg
         dAu+RaBZ8JXSB2k75vDlScMp8knKcK5ddIXJ5CjpprRpr8+0bhk9PuFy7Yn1fBrS7RNu
         IHYnwEDRohooD5IJkn6oB3iYfXUzN6bIfZ7TLl0UxY5CXpgQ7JQLDufTJMh3m6Cfawu3
         N57aLw8gmgDFH+htAIbEmiM7E/XE3GKraISPfZ7wrqX199hx1xXT5H8XeImGpngVTZLX
         PStQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLnhnhndkgoDQWV49ZNv5zslseoR9Z3szpCini0HiJ9KNj/q0FpolcBb90dHQX1iFSjoZvInyiYShwsS0A3Qq7@lists.infradead.org
X-Gm-Message-State: AOJu0YzD7nJQL+OMsMoCY1cZGiz4Mcjw3+g86srN9d6PDcPMvozt2+OB
	cD9gQHNk9yc5YfVWy8cNj0rZnw4HFyIOHNSglMWncAQpW56+67EW
X-Gm-Gg: ASbGnctEcLWkaSwvHVKsRAWUHT4AQanQrJvcTmONc9W1OmKgGUQYe3qXogJsTBDeCkK
	wsPQJoKa8wcwa+7r2cDySknv/sFvBOhQuHXC76lv19G1UpVBVs85hMaAlYfq/MiUV309yADm4vt
	uvMftVGTJbKE9Q+DzhFv0ZPFy8AqKADA70psqHSuOK6ytgk+G0+uEejE5coDyMxvMWOdR3HcMWA
	AIAOx5A+e6OsVzPKPV2VrPAT0lucXX/cqABHSAfPW7aTcNmNa9ygItsL3zeef18GCtGicVB4u/+
	4Gu28NE1+HAlwYApSQ==
X-Google-Smtp-Source: AGHT+IEQNqc0PtpBXRyDkY5pgMgEWMrDmrw+ZKbtGlw03mhdng3NDc681UXDqGWL92QJmsEpIhCbeQ==
X-Received: by 2002:a05:6a21:730a:b0:1ee:6af5:e4f1 with SMTP id adf61e73a8af0-1ee6b33e88emr573879637.13.1739380992047;
        Wed, 12 Feb 2025 09:23:12 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:11 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:27 +0800
Subject: [PATCH v2 04/10] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-4-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eNXZKKJOVES7/Y5XuX0Dnwa0JJ327tz8i8Lgu6wPJJ8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvIb/r8ezHFnAwCF3de3uLKdW1k7kFV54zH
 bkJcFnundmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JAlrD/oDU3LI5XOuz2kAuUrzCCL7EuJrPUKPGH3a6pgI6lWbl55C/oFWyYH4L2aaToPl2s233nn
 nz1HO0vBiAKN6SrAD0N+VDLc9MagLJPU4AxWLGmQPpToGVQ2Cfggl3Yf42/xCiLhw3NZgKwSiys
 0ZxfhVoDX632zynf4Nbdb57UwIeVP7dxkl3Wzj/Z8fEpa1TUJvGvboe8QbIYuYsHVR51QVhUDrW
 ad92ICZ8m0XrvopqmwIlQyzZOsVrjoCwfWdajKfTPRJIBZeFXT1QcVTlf4K5XpNknTkMNzSxADZ
 AE6fEIV0mnElmoNML1efWjfttc4hho2Ynr9HGthMLDk0zv9+XGD0CrQb81S7spVmdaLvwhC+Lcj
 vTX/7v75j9UClPRkvxbw/0xGNq2MtRk1Ow5ye7FdgEXsCV7DiMnxNGbnfiUGOsNpyDF6fzp2f5a
 l1EqfbVYBB1Nzw2CiVqnk8njj6fA37mwo9t+uwtwYlNeSwqPH3Swm51GAy+3azCln/Dm1ba4eeT
 c839YOHRLbrxEOLJKgYKAjRhFoOfuEjDRQ5n1WyXTYxajbbK0snI4CDnfzTPTLk1JGVvIlRBvTA
 EM9LnBLU6w9crPfZu5PY4vSpps/UwCZUyUSYD4Lu3W/2jDKXt0j57uLvLXtnPSjrp+K3K9vLdjA
 griTJjfaIYv5MkQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092312_944362_B1B2CA52 
X-CRM114-Status: GOOD (  12.32  )
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

Add support for configuring counters for 32-bit EL0 to allow adding support
for implementations with 32-bit EL0.

For documentation purposes, also add the bitmask for configuring counters
for 64-bit EL3.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/include/asm/apple_m1_pmu.h | 2 ++
 drivers/perf/apple_m1_cpu_pmu.c       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 99483b19b99fca38483faad443ad4bcf4b85ef63..835d602a9a33fc812982839799c0bbabef656078 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -37,8 +37,10 @@
 #define PMCR0_PMI_ENABLE_8_9	GENMASK(45, 44)
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 14e6fd0c2653912a6bbbcc31e6f4c54ee2d062a1..e7b898aef45e9e18899693774ad673fd370b19d7 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -335,6 +335,9 @@ static void m1_pmu_configure_counter(unsigned int index, u8 event,
 	case 0 ... 7:
 		user_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL0_0_7));
 		kernel_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL1_0_7));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index, PMCR1_COUNT_A32_EL0_0_7));
 		break;
 	case 8 ... 9:
 		user_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL0_8_9));

-- 
2.48.1


