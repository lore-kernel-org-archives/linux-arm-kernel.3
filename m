Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42C1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=; b=UlmP4jeYQ8ukTPZzfPL6y3DQGg
	XEeS2O0gW4EkGHzO1tGDSJ5YDYLsHoJTQpZzY8wjsgL7T1mQZlEfnMXYzzEzl4fXhJe/Q0Ynmsekf
	J8BNFy5zO+z1lAeVuDipmz144/2Msg9j1PWGlhzpmXeGpom4ikBr6ANFtZz3EbjyNXdmzZ+JhiSjH
	udtCLecCb2LMKBzsLemPN/cx/eIef/NKW0ptpO2Z4FPvy1Yzg6SLktAP1jdlI3Da+tSfN3+nYHPar
	tLnnU9qXonG/hgAP710cE5NcMbFiD6Y8X3SiFPzd1AvjVWEZ6ZpvvAbEkdJnG/NhhTqLB1OZqglI/
	Jtr8RK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDm9m-0000000661X-1kX7;
	Sat, 10 May 2025 15:30:30 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlro-00000006494-3BLO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:11:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7376dd56eccso3292491b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889916; x=1747494716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=;
        b=Z1XTtuaUXxRJUGgm3UaLhf9XxV9T0t31MY2GzvXI2x0thEHa2HkGQw2mvzoGRz4Ru8
         5HOUBvlBbMo90vg7MtoygWueDBJpfj7U0L6KcA7VSqQhlLDgJWK6PfWrNC9sfgipv3Ok
         +ntF9vCN8kqHDyOIZiaV4PwN7vb9ha8MXjNIXS8wy20La8qCOVmT3plLuWuumX5K1c1L
         YPIlspTAsZ3dgin3UYeBVeDs2QFpfBUM/tgwsdIalmddcJaf0abvFiyreHlt9QEtJEJn
         Qm846Mq+NxSlMyZIYZF9Nh4j2hcyBN8Hhf35AnouBKQIo7X8J5wGkFfVSPp9fuRCfon9
         un2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889916; x=1747494716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYLyecdN8PG1dIKA7P3TjdSo4FSHEY1UF26fpLNtgEE=;
        b=NGPihIxttT8J8RHH0zncKrkOiBhfca0Nb5Ebz9CZqZdvefb7mnpdhi+e60ySMKZtEK
         Va7A/krOE3NSoLjPLn6DNWeljPrliiNMdKOzk3Husw/cVmdF/rpVYa2YzBH3qeMtz2Gw
         SpaNtX5ZJDrMaYinrp1BK4J7yUL9NUK8dASmEdOZ8lPpb7b2R7S5VW9fC4SKUk138kTW
         /1RcsMhcpFSr5hVeBOcP3fkvnp8/vvhjTfIFMzcbctd20pjyjJaH/vpQfMEXEnzOj0yl
         1hYKyRpSKmX/fZjqpUmOfNKyN2+EFQngK2q4RxhKwlF7YS4MTCWvGQLSDgR9DqyERDy8
         qGXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNeW5c2C2p39fVtFPEXqDwLwQ+Rkp8fR7QMU+U7Kd4sW96Ku1nPVI+w0+qpxQTbkT3QPykW7oAVxVH9ZgDg1Kh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqv9sSoFexMUrI3lRZCF2F3oUTvHheQJAhKJeUed9nWMl+3DO+
	GTaerrF5WDQyXgNvtGOOGUCddfsPj4pZl4UcGHaejeIQHcdtwVZL6RwZGQ==
X-Gm-Gg: ASbGnct0Nw8ko8sfEmKIYLbAtizqWiMShfGkRiy+BrdR5naZhmBsfyph5bspF0H7C+x
	qEXMsK1wQwWaGkU+rqvMo2VZB5+JK2dIFZBjLyBj3qFX13zC3iFGNuJCwTmsfLym8j1qg5JtPVC
	61zbuthLMUbbMLoWl1GxSJI15jzx1/rYQsYFUUrDC9ArPsLagBWvzcCnI7hkGqRWYoCJyhb4t7k
	9Vis9YRmze9zwlnStx9l9PeN3krcZlxsAHSO9/ZUXuQ7hMLqe20XKXVR06ybXI9OII8Ny/vBrbu
	RmNeYVYoB4WIurSZeAPz+PVfSO1NvElkTUo5WKpaB4g9/t1WSyaVqA==
X-Google-Smtp-Source: AGHT+IHcSsJsPUQJf19qnL+lf/YcX8LuJ79ufQZ2jWGNDgK47ozv2MZuV1cSxeZMATMzYf7GqISabw==
X-Received: by 2002:a17:902:e751:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22fc8b5fc4emr119601235ad.12.1746889905538;
        Sat, 10 May 2025 08:11:45 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:45 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:46 +0800
Subject: [PATCH v7 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-5-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=4vsiGjbxOOsY3kUJRZG60u58GR8XjzbCD4n5XW1wFKA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ya/JiyijSsDQMrBMPaDuhz7cPbb/hJgSRe/
 SxItRnIMquJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JDuED/48k5PDcjnT9sL1OYQWDPVIRxhEuQxRiOmqJbBxsSKMghmvGpumRcR5TboH5ts1z+zAG9F
 lfRhwbVySCEc6qd2KWhGPEP4XYrzVUwqG/PkDMLVVU6V7nMLy9m/ZRmFXaevGZ7+LTLSIUC75Ia
 kD5WK/gbm2c3xNlj+2+oTky2hsEW2aiO719Touqvan79rlqktfg84ylTbAQk4MRaJbaI8WDt3yq
 Jv6Pe/O/ceDRE1jIv75l8NhYtCh9Stgq+BGXHlZadrHSlnEOLlol+TWcGOE55xTOEaCa/wCCn4E
 lHOyIP8lGMcSsTigEcG1Me1c1y+ing5J1KrKW96HipdJUyWaO9i5OsFjRrqoE4PRSxy/Z9aXlhz
 SuY7qnQdOwh5bCWztB3ZiMVhcV8s8OI42jxzyZ99MkCYWkDh7HuzDeEokckyrniqziPm+Fp2Pna
 g2CNapN6sj84RnrGRiD2aK7ye1AlOi/t5O3T+WcAhA6bYBRXM8c/zoJIswM2n6lqlLg8ExZS6HE
 5uPzhINeXJaXLSfD08VlKs/d+QpdRESR9PJtbCQB2GXInxcAshAWlzhUstt/Yp8Ai4imMhsRtW1
 v0YBd3t/J9WtBhpP8+3F2fbrEDbZ3k3Q8KFg45drsPYHWAReG4LBB36ZdV7/mTwzAKcXjusRCtx
 5gZnszXtva9kUrg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081156_800961_CA25E327 
X-CRM114-Status: GOOD (  12.08  )
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
index 02e05d05851f739b985bf416f1aa3baeafd691dc..6e238043e0dc2360c4fd507dc6a0eb7e055d2d6f 100644
--- a/arch/arm64/include/asm/apple_m1_pmu.h
+++ b/arch/arm64/include/asm/apple_m1_pmu.h
@@ -38,8 +38,11 @@
 
 #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
 #define SYS_IMP_APL_PMCR1_EL12	sys_reg(3, 1, 15, 7, 2)
+#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
 #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
 #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
+#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)
+#define PMCR1_COUNT_A32_EL0_8_9	GENMASK(33, 32)
 #define PMCR1_COUNT_A64_EL0_8_9	GENMASK(41, 40)
 #define PMCR1_COUNT_A64_EL1_8_9	GENMASK(49, 48)
 
diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 35a34eca403384c4908c2bba2f8186ea854d63bf..6736909a7df672a08938a392d450dc9b5b7bce9e 100644
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
2.49.0


