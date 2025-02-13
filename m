Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F398C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=; b=BknMm0zEqB6HyPZ3B50bSUS4YX
	M4EOBxMfE7acE6cO67gWjuFzMDv/XWM3SgZOVHKPlQDBgZpM2YB2pSSdwRLv2nFSJ739QyuW3Q2h6
	L941DqTykpKhllpUHtLKbpEt+HqNQ8tCLtAwKPHJAYeSVlLxAeuiCMnM6NQTAnBvOCNJiuOgNOqJY
	yj2uwn+PIHHsnAoePC5k5sAg3VTceiSBeQ0UM58/1WX+qiromndQkPnSOsFfVsxX8VKq3FkJpwxKZ
	+8IKvm4dGxDAbdoKMQfCjQbKrP73j/L4ioej2lzkZludIT8i7dYRTmmGsk7TWO9ryPgzgEZzg/q4J
	GGbVmWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaRL-0000000BOCo-3IOU;
	Thu, 13 Feb 2025 14:43:43 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaKS-0000000BN4t-0RPx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:36:37 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fc261d4ec4so283373a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 06:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457395; x=1740062195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=Bkt8DGxjqphtJr+v+yW8xq/u8vENnbXEMGD+iYUHmGC3OUB8a1nkfao9Ms9s6CqgWx
         Sqx/x/YmAYCNE2FWIuhLq1KXVWvjiqH9yoOm+DG9ss4o060dSgz4p/9Z2kro0xfyw0vb
         W9svrdoRntTMi89AVqC8NcsrNVXd5oNuf9K4rrRFZngK3MBK1o4q7iRGa8rKcTMjSW0b
         qWRVFL29rfzD2ss/i5iZ9OIPE2aPLKWy9sy5Bnvd5KsestSCavGb9WJhHM0K5Xaxbp3/
         2ftvnOHMK+en7xPZ9IfqiJLhydnzBnDwAoO7ezra2cm03G6OhFsZy+IRs+bPdACXhowc
         pbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457395; x=1740062195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=xBANBz3VTjP4woxw84nBuHJUtrIyrYOll+q09B1WDQKvnmlbg1zSKgPisHTJAZIYBg
         Rpg7y9wTFxyH8TULhG1souh6ZJe2c3Aje/94c7Ar/msXEdcfwxEdMKUO6Zp9SRgGD4e+
         Jz4kHfTBSj72iI/8f2e+nSkIMdpCiaZXwQBbiowksLaYr3VmQeEKQ7PrvHm5kXag0r97
         lWLNKU/SSQAP5WbqxL4Mkxq8d70TFDJEoFSDZE0NEA5QTO+IKejGNvecbOOPk/ufmudb
         tvrRAXWpkMgRDa2QHf7jvNuiDPN5WG6clMABhWo7mTiEoJigrRWg/dB6i7QA342WSEai
         n3Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWJoqo4fF/n52KG5hCoI4YtZHpRUJwNdpKCBMXSWMi7spbo4RgcQy7J9JPd3kgqN3QiQctCxxSC6njKN5H/IVWz@lists.infradead.org
X-Gm-Message-State: AOJu0YwLw/NpgWVAAA/ih/AtgMjO2H/khVQXNPnzDOYXKIdDih9skgo1
	FBMAKAdSnEAEJt5p2RhaZrQTsL7XH0rzt5C7c7zTlFulxfqNAaeD
X-Gm-Gg: ASbGncucFFlOyv+pbq+1v0UGqUWcCS5XODNkeYrsmJ6lZnk/LKBoRRIvEE4fb1X/oxe
	pUiccGbDaF1Se+hR2t6H6XLzUbsjU8uE8WjyVFjnPkU/xduoB5ah1s7h4D5E5K75c0VAl/lWz15
	8GE/CUkUd9p0h1OJc/sQXw4IPQLcLFQh2VbBfwMqdTDUCgeHeSCV2mVG52SMoSL+8OnAtPEkTpN
	tZdLex9oqK5Ib27JgmkKWTytRdIZ34zDr5AXiwyA6bKJ2HLuwLmrNZCP4jtzxVWtZVwHlzBjGsm
	Hb9V70SQ3QXbyP7P0w==
X-Google-Smtp-Source: AGHT+IE+IzEmh99k8e5LtSg3CmKmVTOX8Nit3XAE4gsqDcdvOIrzDYawcvAU7K49o8FzFkBHNudGGw==
X-Received: by 2002:a17:90b:2549:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2fbf5bc1e3dmr11295490a91.7.1739457395506;
        Thu, 13 Feb 2025 06:36:35 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:35 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 22:36:06 +0800
Subject: [PATCH v3 04/10] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v3-4-be7f8aded81f@gmail.com>
References: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=JtntoT+/7KJ8q2fmzw/EEFzk/pZROlC/KV344Upuyvg=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNiS1k72FP5Vi8yzUaV70bEMzBky32iQouFq
 9hIdRhC1G2JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYgAKCRABygi3psUI
 JJNxD/4kWh0+R/dtz0Y+C8oJSBVp90SpR2M0VAJxr71rhu3sK1EN1s+4tZ7KevDVNDQ2PmgkKNx
 jtMXSJu/Jr9pPTWJh5cEiHqAWGWgp8KmGK62WFx2oeCkh/d/CXC/8xqI2XMQcIVXpX+Kstxqxbb
 cua/JIbj78C290rvFDL/bc0EHI4WPZEw2+DMDfu9/CMw4QVrDAATi/VqJjZzJf1ybYLWio/zcRn
 5zUmEIal92DmFZDp493LGF6fUKudvEflb4e93F9Gd8gDm4r/Wk7HX1vaKpsQP1fTgy5NcaY5c5v
 1kZ1KNbcKbusKU+up33mSIkREg1HMJFvdCLBjaoPc0p4PJu+Limq6iRIVHfo3LI3ZsUwVL7XOsJ
 wowVAAk1uqzDEK/qw+JSQeD/+9+Csc3bNPleZeO45HMV0rWh+l1rORpabuqjRec5NKRIpfHq5mw
 sd5TZpWHA4neV5UW9gVZ+wKFD2EyyS2sObiLW+y25BWfFsakND0Qu7kzRXy43DahEEqFImgCPal
 DKVixg7rc7L9rj7L5fk0xpyoNafq8tjGM0BEx2aNWL892CnatL4iwVuvrDHV/JR0R48aVSAJmFy
 yC+3kcwoU19FkONVISknjxj+4HueXKjBYbC1YZ61drvdnxZa34HcHDiBVAzMUwPPOQV2UE4zAmo
 o4SfSN4Lti44YQQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_063636_154201_0822FC48 
X-CRM114-Status: GOOD (  11.69  )
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
 arch/arm64/include/asm/apple_m1_pmu.h | 3 +++
 drivers/perf/apple_m1_cpu_pmu.c       | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
index 99483b19b99fca38483faad443ad4bcf4b85ef63..75be4b4c71f167a6874e22b38dc7c0bf30d25a47 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -37,8 +37,11 @@
 #define PMCR0_PMI_ENABLE_8_9	GENMASK(45, 44)
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index bf397fd81230007dcf52888f148e3158dc02e29d..73ba9861a15ff931b5e388b6d809dedb140e2292 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -335,10 +335,16 @@ static void m1_pmu_configure_counter(unsigned int index, u8 event,
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
2.48.1


