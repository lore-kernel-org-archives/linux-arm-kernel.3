Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEA0D65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEO9StCrTxXvNpc0CG6gz+jT3FNQyYyGTLdJvKY2VFA=; b=QE0/2MTSS5uJM7d2Pc6juMB5sz
	UDX4HKC/ugRtCxKAknQOnIxltp7EbyW3QQ9pv5xUlvP+pghGzQ5RLVd8H3A/AtITlgIZ4GMc5ZAnY
	9DN/F6YrrXDMPDJczeOZoylzNaXVg6x5OSUmkzB7FkyhnlkRTepjxwcdjWNWetcvinpTtNBc7AaJu
	FtF6nUQAU9JMRtHE76BlXdl+ybpYhBQ24/Pq+d2Q8ehqrdabeRprYqRYUCVsDF4BydcQNrnfNye+t
	N1yIJxBj+U9twyuJ57JepdktvngJRhcsGKsO0+gzun+KcYANQmc0YZKPMX5jrDemtnDpOgGZuGmw5
	NGr327IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKg-000000074rN-3ply;
	Wed, 17 Dec 2025 16:24:58 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKe-000000074oz-0Xyl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:24:57 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0d0788adaso36179835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988695; x=1766593495; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEO9StCrTxXvNpc0CG6gz+jT3FNQyYyGTLdJvKY2VFA=;
        b=TY4zZFrlKWaP08fczcYlR47PszyPt+GvSMlNsEEw4xLrC5N2nm5xJGTeZvopU+gm9k
         j3yYv/z1ppjXtiZkfhqf3/iMzCUcNi7c7PhyrvmqPwKwB3ZIhpZ5MpAXbtckG5zUHyJ5
         XT5cmDy4yYb6n62LPcLNu8iOBfDyctnexbvKxI61jXZH3jAifGLkL3Oi2825+RZlbICx
         IiuNDuPFom1qK8tziHAc6HMwRy7Dsmw3ES9hUCXwmf/Ov0+E8yZbA3O65wy/sjhyTa36
         cwlmp4Stb+rvZaCPoy9dst73MwWu+VRzOwIE55W3jG4oMT4Red7Jumq4McYnHPn6gNrR
         5iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988695; x=1766593495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZEO9StCrTxXvNpc0CG6gz+jT3FNQyYyGTLdJvKY2VFA=;
        b=NGSyTnCTMUmnZz0nAiTNi8VCXjqazeJRCXTFauYym+8J7mSUDDTFXsVIAwOepiTY1f
         6bluBM8n8Ew3ewJeFka/86WwP8ToeowMYyflfZgRjDIBl9YfkQzDqkeH5tJJxUGxUbOH
         NB5Jht8CdY3+lJYmobg3UbmQZl35xrRPGe3RGXOmdKAxWQD8ecW04WyBEeYwZ3vaABPf
         YPUr4pBQ4vrnfyeP9qa2qF08tMCQ1eJ4n8ubgsx/04zdlA4HZF1ds5e52iHhPvfgkc7H
         Vjo3Arg2LR1QoBWlDcB5lRxFADewQH+bPHCyDk1N2L8rUw3upnBJQ7R8xpFl6cm1TTdH
         NyjA==
X-Forwarded-Encrypted: i=1; AJvYcCUpCnn9vz9RRWzzoLFiKWZZZlnk98QyoYlnyAaiI2FOCH0RM7bdykmbz18uSLNdj1Nr2tSGfPgtOhoh230F28wc@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvi3Vp/PwY5A//E1dLYAYQg5fVtaplgp79lICMqF3UixlwcgZJ
	yijPk1aPTL5PmWzrZ2S8bRo9QqzwCKgA2KPSBSlK3YzWmE4S/9PRFFTH
X-Gm-Gg: AY/fxX5pSl0iW4Xqi+fh/T3l4wW8nOb5J6TBHiEfdJGnIDwJvd6pZjuHP83m3OQxNfO
	CFV4dqpn6pXgXw7FiAzvER9LBn3Go5CTWc3R6wfuMV7dODJk5wDxcex2EKjAAyhdZwPhToa3Rqb
	ltjG0Rp1BFZUsGIfOcwLrSks/DOS4t+bLAWmV6PslUPwe6GrBBDOjeMHlhIgxvQeEIFYjSmllOf
	6IYUSfY1GQgPRKFkRxmBSki/VKgQIuXHZRlVioKazvKi+xACMOPoCCQkjn6pRmgDT3j0fNf5FvY
	QF0j6ozEy3HvE3foVOs5T+GNTNnzWA3ZzHSyfxOqM5AY27+OZcfx982i4DKcnagAtZjun64VLPR
	iHf4d8lWlpMgXpq8b4TzwWIgXK2t8CzVeYXhhLRx5PEO8bgqIqal4e/Yy/wHRCAV0rOMxkrlmZ4
	E23V61YoQADPw7
X-Google-Smtp-Source: AGHT+IFmpldl2EnfdJLLNFecnxN4BEn3qLT3U4ZtBOkfTCMmNYM64weQR42jpdgzZIVEBX+DVu2log==
X-Received: by 2002:a17:902:ce87:b0:2a1:c72:a41d with SMTP id d9443c01a7336-2a10c72a703mr119320995ad.40.1765988695124;
        Wed, 17 Dec 2025 08:24:55 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:54 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:18 +0800
Subject: [PATCH v9 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-5-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=7bXhbqBuf3L7P8BkQE01YWRVlFsdM2eh/RfdYjmLgaA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlAef+nJhReDRN+pVlLcv8GiPeEbu1GXItBX
 8NUJwhDxyuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JJnYEACaUligWBNlh+4Cyx5bBd2haSpcf1uv8Iyz9L80+F6mnLCgzV4ucw5xjJPPSAtsm+v9Dc7
 y26/bEmsMHPW+MH6e3CUZCdt6N5juF9tPbRZ5G24neEkbHqq5crgYKZAuv5xmavOxSnzk+fkAiy
 Ud9v5zCtRqxzrnpiFvPLKE1CmccaHrLi4cM/C+yfeFq8YN5Dp3Nw7xFciXBONr8SUMvErVbRTOg
 UGTSOuZSsHUH5ZIVzo01laxXoE1ALejU7nDN56soAPhmfI0YwRFZ+Mblz8ncNx51KeSE2QnQFIN
 vkWiooyVaJFc/NnDqevFvaP7FJ7yyeXs7ZvEVB5J+r5IA4u3YdxnssUbYGiOgPoObRorWtmQVdj
 IHRC+TT+JBOVs8KYGWv3smgwegxMzqCaRgzSJ4FfezmgUDvocsUL3X/4TSkhl+ZMVjPZm/NTrRQ
 yAb7ATWidvyGDNSoU87pS+qjW//P4dizYcH1lukjGyUZbgY9M8bOBCuxMKfhwjdcrU24oisCG1Z
 0yC0mOJFPzVeBc854OPDSicZ3QnUvkQ/5XhNTln/oTScT6A9/q8rIDNothx5ALBCDqDN86G8KWI
 2Q2ZQovR9cQkc1+cxFWZQ4aHYzFuHEdyUv3KVIBR8J9fpuIrmbQESOt/L/oXk/HnE5aQ8CfVTvh
 QVwkpRwPTp3jEQQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082456_177494_871E34DE 
X-CRM114-Status: GOOD (  10.50  )
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/include/asm/apple_m1_pmu.h | 2 ++
 drivers/perf/apple_m1_cpu_pmu.c       | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 02e05d05851f739b985bf416f1aa3baeafd691dc..8a667e7f07a517419c22a4f930947347be8546f7 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -38,8 +38,10 @@
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
 #define SYS_IMP_APL_PMCR1_EL12	sys_reg(3, 1, 15, 7, 2)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b5fe04ef186f04b4af32524fe433afb79979b791..fb2759069fe9e47146f0342fa46e40f3ab836926 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -348,10 +348,16 @@ static void __m1_pmu_configure_event_filter(unsigned int index, bool user,
 	case 0 ... 7:
 		user_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL0_0_7));
 		kernel_bit = BIT(get_bit_offset(index, PMCR1_COUNT_A64_EL1_0_7));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index, PMCR1_COUNT_A32_EL0_0_7));
 		break;
 	case 8 ... 9:
 		user_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL0_8_9));
 		kernel_bit = BIT(get_bit_offset(index - 8, PMCR1_COUNT_A64_EL1_8_9));
+
+		if (system_supports_32bit_el0())
+			user_bit |= BIT(get_bit_offset(index - 8, PMCR1_COUNT_A32_EL0_8_9));
 		break;
 	default:
 		BUG();

-- 
2.52.0


