Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD5CC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=; b=UfFKTCH4szBWms2tE/L4vJ4gUH
	wxoINbbLetwNKPd5s478P2MyELZbExih047HAt/AXoWiw3NiD8FGdj8pgwCCwosB3d7K9BOzLFvmc
	iCjfoUIpnTohi5RhLdXkw03aKQUcfM7jjvgTV0Eni1R4j+jnKwIcYA2s8uKDZkUSDp+KnCgcsce4G
	m8d3tYdHSNbrGqYa+JUX8UBk65deySKdJ8Rsgl9yKAO8htEx6fd/Jtxv+fED28EIX/yI1Koo6Kl0G
	31a2hpO04AxAjwuhSMHY0/Y2R76V4HmucNaRf+pCHoouCxMBexQ5rccvX/Wg2XCjVSsbJ8s+xxcrh
	4cLrY5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrqt-00000009iPZ-22JV;
	Fri, 28 Feb 2025 04:19:55 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrjX-00000009gnI-2U8L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:12:20 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fea78afde5so1942058a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715938; x=1741320738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=mIo7z99EiomC6YvxfTy1zCSRUcOeXKBSj/UcVK669IAHZE20XECmGVHyOoa+vkUigI
         aBcX2ZqTR+3LCEW6uHrXarLkFol5RNDsWQ8HHH3kFLvBl5H943cDoTmcNXkPIUWhOYdZ
         xSARv6caMVIy1r66Dx0dDrCSAxZgzzXKxAGOk57Iv1RfGb5/V/WHBLHMxM9xLg5h3Cs0
         VXalS0ie94uWgWKRWkKeNpXe7uSRalAzpeDomJbK7SivbadRXPaEtIl0bHbSKt57Zojl
         8R/pH3k5yHyyUKA/RTmGoQOldQo9MFDeP/dCPTLYTlTj3nqbuwN2OVRqjSKRyg0Vuw1w
         3AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715938; x=1741320738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbWzWCt8OHucPUBoPro0Zk6O9SHBNwoLoq7UIHpho+o=;
        b=IGX69TsbEtOmU7yc4BgbZaMzCz/Isw/V5HGppTHAhBsI/HAae9sS6cv6Von82iO6s9
         Rvk8oanWw1/ezf+btyrfPxQ0QJBuI/+ujjOG/qUeX2sPfj2sv5IoQQkUum26hXgxf4mR
         Co2fTZo4PHWPTPkHZbz87vEvozdyqs7VL7Ry/mcIibcwP3KewKysu9vdqzi8T+/utuxT
         Gq4GXa4df1P8XJjfoqoDhVgCJDFYSXau70AwWCrLr6wcQJOeFkCqnTvGmG0VzRuxGiGs
         bOo99wIBMhrtA3uPcySrxOPa2wN5131aZVWSM1g+jTZFekVdHqrBD8XePFNqY8fnQm2W
         Q/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCV2nyRi1ePe/vBZWjCIVX4wtTYLNH9098x69ac08NKBa50vWhKHnHbo78kl0GHlWRpNxVng9LOyRcTvbuRl+JHf@lists.infradead.org
X-Gm-Message-State: AOJu0YwTMgwN2+DhKBjPsMwGV11IwbMK9aI/zwpm9PHH9xOjPpCSIjXZ
	2kX44e7D+9tYqyE85Ku6xGoSJ3ms3vnBrAz1Q7ugykd0sU3sY+tm
X-Gm-Gg: ASbGncsBQYq2IdWzdgh13+rwjxm9VkSQ8gx3bHBXJfE+oveFLlxLW/OqrMF2zmPZuPY
	dfw2Tl4w9pkw+gaTBAtha0JK0/Y6HWtG0EzN7SSJPD5cISRnL0D0pJWI24mPwhH8mg9+71MjasO
	aMfyilkErayOSKky1dX3aD31xJFjZB4sT8rt7oaBOMlIE9T9fTLMifEqekkKa2heQxqP20kPvAR
	7u0loJ8h8D5L+RFVXh3Gf/J77/6m2v/gFt4duS19aINlji7CWCmdt8LxmTaJJBqzkBWEF6M8Keg
	HOXPB5T0PJaVpfyiiBjgXtEGy8s=
X-Google-Smtp-Source: AGHT+IERIaw8yIvvI33eg2OCDKzSmy+Yox7h4/BTE5+0YIEmIign94Y8U4E/+SpJ6o86g3lwvdcsDg==
X-Received: by 2002:a05:6a20:431d:b0:1ee:8c93:c90e with SMTP id adf61e73a8af0-1f2f4cc0cf1mr3018964637.17.1740715938561;
        Thu, 27 Feb 2025 20:12:18 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:18 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:44 +0800
Subject: [PATCH v5 04/11] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-4-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeI2VdJZOOjTGE9uIIIQVxJ8i1GHE0hgd69/
 jSxub+VqWKJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iAAKCRABygi3psUI
 JKhsD/4/WmSMYbZ81VnJK3jgPs6enyxsl/w/5aDOv3Ne9UxU/40ChBvI3uieXq584y5AYzgd58p
 nz/L4FqUSQnWi+PC4lXn/kAENM+8nz8GsanCS1KiSBbfAfdjGJz9crz5LhFqgbwOLw/Txm/zQBn
 EvOIuSVo1pTEFRASfM46dpZ1j+YmGiCcsU4U6lwjUkEg4dr6h3Pf0D9iXlA5+FB0iLrzmIrRODX
 qI5pJUPnuarEf8eLXUa1Lrup+oxmy08SrY70DOZkGlr1qma0idQJ8JgLb9dD3mnRvVnKxGuSnhh
 6JDUAenQXIMo5EtmFtLlNvVDVH0Jgk8xZcSzbgHYIMO9UUTv/KW9ju9+fR7eeYsmcAHzRozhBEM
 OOySpBt+OVu6XbNIjGfvJV/odKS4BuWTuLDiwvutUjpqhhluRPE70rmQepFNmOs1GY3JBrBmi9g
 wmXQy5IIfaY8okhNXAlDvncOgmzwkK760qhTRc9zH0Q/t3Zb4VVR9PMBOeo+vnvoLnfv3TrUQmo
 0hQ57nUydTqyOq79T5v4FmwggG//1S16qtkxAGpHcG38X3OSh2g6x6wUY7e3sCEYKf9JNSdjfnI
 vYd5sJEt3ogAIIoQkOjsNujN8XNZow+rldB6wrwglmZPJxfNIaHn9cUL9yhQt/MShu3NA3QiUip
 SRpeluoRzf9LJmA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_201219_635488_8C7D3F08 
X-CRM114-Status: GOOD (  11.84  )
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


