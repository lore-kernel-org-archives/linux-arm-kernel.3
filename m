Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA02C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWF3GSE/4dfsA89aZ5XCm2eNtW6YZVBNZAI7dFS5mHs=; b=JQp1ETMT9+dKDWz4M2qJAIKWYc
	XEEjV3SAxSdOrckZXlu+M63LaO+sGudYdAshATgW1XsGMau6/3AZh0qH8qLhhtAEX15HWrn7HdCdz
	g7I4Y1xRWX/2lMvdZMk7iS3Qxea3mXoNaodgTYwL7WkSFtwSy0rSJKIEcQrsEhrfrzvnS8r+1yN/K
	yLUDou3HYhRuOnsQBPNqW81yBMrR2UxP2hY8oRuQdtXN4sVCGzG/CDpAkfoBw/rftX4V2nQrrPvlI
	UdyfLQNl2chtyd+B33wRzW33+AUwHLpXYdd/QFMGShIyUX40Bfhh8vqAGLm46VX3i8m6+CWhhrY3l
	V0gnDILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulU0C-000000087Jq-1vAL;
	Mon, 11 Aug 2025 14:59:56 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT05-00000007u2y-0GFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:55:46 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76bdce2ee10so3405562b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920544; x=1755525344; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWF3GSE/4dfsA89aZ5XCm2eNtW6YZVBNZAI7dFS5mHs=;
        b=XBPWtE+0Ty12wy+OHoVBNNjCSVApvok+it5DbRRhZQmlA+lwWVRrSP2MxjoGeg4HV8
         /LUVkfIWyi/YljtgDRtLArw8OqqTu5KW40R0mkvV/4+XUvXj3eSqoPP7fiGYf1TUgf30
         4UxcCokMeON1DoFi4F13B3in5dzZ81RHylXfA2GTiX3eNX4JpAaES98CcjfMEuUEWAjv
         O7/S1Wb8WWmjOL5vmBrpCxHKSb5/PZnMNM6KGDph2tZQbHc6MZozFwcP5aexIE27m7ZR
         +bOSZwQMFYKf1Lsdmz7w9uDGRyk6sLvpMRbBxspFGLTK59vespuXMMZK9Kb4iZPA0bh/
         zmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920544; x=1755525344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWF3GSE/4dfsA89aZ5XCm2eNtW6YZVBNZAI7dFS5mHs=;
        b=P18TnB+qzE4tpQ/+X8Ue8kf8z9VwLiDShWlwvwHo98l+kis+/hXN1uHmmU7NR323go
         tTHiJk/opVLUtAU1UYyMwq9BHvPADKjq4HZICgV/yEYKHOdz16P+pZV0LnREHcHO+V9h
         0CNY8MPtpTvHDw59TegJmAgAT5wWVkwArvpdYP/L2QgJGOpN7IZetx0cqkXsHAyGgRp5
         TdJJG8BXki5yNmI8osVCkfHjeEWocG/OcZ5uvrT+MjQUqpBffqJ+bqV+KTQgOGA74sEe
         5OoanFSP4PGYUMssyR11+avx4sd4iBsUHT6TzPKF5dv8bzt5jZdQQ0KDTXFKr+5/ijNd
         1VsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdYBrabW4jLL6gKSdjbQqYTCeRzzEKB2o23drru+/9wLQgl9oVyskRBmn8eINkkBd/Zc0VrFBmwU6mj3yXTInK@lists.infradead.org
X-Gm-Message-State: AOJu0YzljGUTUVLHZ31AIReyIV5HPiopzeLtjXu4DfuOuWh82LO6al+Y
	IsmxrxPhp3CM6MaYRQhyHwZQUzQMoVEdhUo6GHz/kruDK828D/2q5IMg
X-Gm-Gg: ASbGncuJpZu4GcZHV7If3VSwLVj9vG9bfH2c8QwiAhsmaRtfOS3lZp7VvTwYqKr5alO
	FsdbUR9R7Q1G8q4Zi/EX+gO26wS6un8RFo06CE2CujZ7yWpobFToNbg43rhsza/WOzTnvaRx4gP
	/+Vdc3ZOSYyjhSY+oynhHSJdSyWy12lg8VkVKKIKWsU1ALXcRAZO50WQiveDlfBmCn5Dbkztkch
	/IE9Nve8fSgIFEVJJabDl6vVnBZ04MEZ6BZNwAvz0zE5lRW3wrbZvI4PFEJ5FKCy87JPqwEAOAh
	C9gEpRCMlc7OpQqnx7+2+4mmGAd41wwnCEbIFIR56jCtjIil4Uiopgo790k5QuyNBDBe8a1hxjV
	9VsK/LuHuWa8UINgn17BPlVbt8enHbs19UywwhinBKWCkPZfkI6OroFjWtA==
X-Google-Smtp-Source: AGHT+IHBmVFZyoKMG8Wg6h8Jh5M6Q67rGKi2jNKuxRjU+SqT99Vf6o2r/iuoEW/+nJNGDHEjArMQgg==
X-Received: by 2002:a05:6a21:6daa:b0:220:78b9:f849 with SMTP id adf61e73a8af0-240551603eemr19802309637.24.1754920544346;
        Mon, 11 Aug 2025 06:55:44 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:44 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:37 +0800
Subject: [PATCH v8 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-5-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=xtnMIatmASrpTNqfCZXR2dLamBkEP1A2TcLh/eTOrpY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZB/dg/RHdFjAxNBqXHOldYRPqycv+vcx/Ez
 XyK2llBy8eJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QQAKCRABygi3psUI
 JMVfD/45BRjXAHLm5YqyfCfUhQP2PwOD1WRl56SyuyNQv36fUcBNpM/ERYzgfNT1UoLpos1chxh
 lehGTKQAJUZY2OwIs279qILgKGXBRqlpaXQVsUcnNsm5TAagvITimAxTIRnwC4YF0mLRO9cN0wz
 ZzOxVaSGztxeVB2IKT40AR+3Gwomx6rg4ZSM49NzkdPuRx/2D64MUlpC8Jpa+zIr3IbAiZfzP/O
 gLAAJ2BwnTemgwz8++KFJw60xaIOm3hNJZW1clw2oFwlehs/UU+XrFwddK5Dq1hnGk45x4Yqhc7
 8481K4CeD/pSxQqthFg08WziwUIk8oTznh6O02NpE1iZgbKHzEelS4vOC5OEPbLvfOIGP+5h34O
 GhLRGVDu4unyIjoGtzBNpsEgt2VA8+zrAz5vGhudSimkZM8UF3Lt11vY9IQyLpaq7H3oEjc3RiR
 X1juNO7oCnP59Zve63U2bqa9Tro0OSb4msi6e3XiOrV/czprHQA1EFGQ3F7skVOBstcKajJwN8n
 lQowfiEbdPqonyh0h8MUvtwSSifc9K7P9078aHUlOtztScyZK30Q9hvHsY7xi2nMe85sm1FRGZ/
 GQwV1HuOs8Jw1AJpX9L7jXM9qXFEZZfIP75Nc+UcGIahVsjtB18Vw6EFwVWQopg9EKMpvaTZp6i
 YSGO4GAp69cwg7A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065545_116597_CC9D69F2 
X-CRM114-Status: GOOD (  11.49  )
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
2.50.1


