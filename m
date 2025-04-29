Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4497C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 03:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJlZQxAuIqr1JT83/pU2DIYPeCs7+afDmDUJaJYT1ts=; b=Kemg7ZL5K5S0j3Lfyu9Qwl8RpO
	xreM7bzHUO9O4jD6w7aPa31n7o8zj2GRoaiXUT33z0RQsPRStik02EPOoG1blE6HZ9FIwzKU20jbO
	EAkqPEp7E8Gz03fzL4ybN8X1KyNmsaIGrxqHFVGIxb+HGp6xHhOWr/yQl5f9afoWFWvHOC5jM6sXZ
	TocL5rJeHP89C56HCVrT81QR7weTvVau7XnGmJokrFNDXrQs2+fd+sV0uUtHCMMZE2h2Y3kMlk/lg
	PvQbvBFeYqXJBjHldqt2NevOea2VW+dvctcngE5oHhoRUPu/yxGnQQxs2kpd+VITd7fXh8fhqevKf
	fR0AtsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9c45-00000008Euw-0kXf;
	Tue, 29 Apr 2025 03:55:25 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bsx-00000008D4m-3RKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:43:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-30384072398so4778061a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898235; x=1746503035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJlZQxAuIqr1JT83/pU2DIYPeCs7+afDmDUJaJYT1ts=;
        b=GySVnb6wL5x6J6AtqNbtZfwkoJzvPGAqUrOTxEZxCkrW7Wgs2t0Um2uNvNwANnAagL
         0Ssu9A+Cl1jw9ahdeh7hHZzWzkuv5fe4QYIqME2qNfASXc4/EoBPAZT5sbx7dCtAOizE
         q1MODAG2nRna4K/iS0ECt7Kvgn/F1AiIrucTfzXvuGnK7j00vL30Z/bhmMSD85azn4ON
         nKMlq9S5mSyZ1m8hG4Y7phzEov6CasBPzaGkhSIwrGQt+zmIVKi92Av5Y2uTNpbUAod2
         soglubRmG2yAblgWFw0v4ikbOsyfO/kGC0BuPSqi/d/tmGOGfLcR6kNdQYIeXnXI1J5Y
         FVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898235; x=1746503035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJlZQxAuIqr1JT83/pU2DIYPeCs7+afDmDUJaJYT1ts=;
        b=XsvnzVsVcmEpn8fsbwI+r+OAKMTxyc7Pe9iGdqcF9wY4Ee4gRw1RecdxcOHXbAn2ZJ
         fjk960fXSJpCWacf6LtErELmWGvmVfuuzCuzdvDwTRgAhnK0RvXAU1dJliVTsehh17CF
         neFmeLjADj8lR9rMQm1QZOId2JuQXvvAOHdlFqVbLEgU9IpFNz9EW4XOqrDJBoWSh2nB
         FyYijSwqpBgR/+/17fdMCyT1zdlsIQwXQQSZ0tkWofzEFUZeTP7MESSWYFlLpJ+QKAG0
         IL5mXeeOlO4b8+6rcCBDjZ/quTfwXUMZFNOrLHSKDtApMSym6FjCsYf8zFjuw/9itp/8
         5R2w==
X-Forwarded-Encrypted: i=1; AJvYcCU/3j0+wxMANuZ+MGOoBsno3+RCxwVeqCWI8eJbtMC/7k87AByYqUn5HaGrbigJMjjaH888RCbMvBt9UvfPhRlH@lists.infradead.org
X-Gm-Message-State: AOJu0YyfxfVaFtKH5kG5tOxwyLTkCQTuwcoBAoHpLJDKkGCNwcTA0PSD
	XO0V2rrQomNKSFU+LN4yMAfPmoMHlXgNHvjPFzMUhOjv8vTycxgE
X-Gm-Gg: ASbGncuuYPQPdbRqew56wd+oDTf5+ao5kgtea5uQcliip5eN93xr3PQswnKF+csWlno
	1i3DK90SYmvA8y5hbcDLSUXatc2uD0IohZk2YdhaLkiVnUQi/gKiLWEanqnZH3sn3EixyjDvKS9
	V0quHLB13Hazz6fuEu7lDDmHX0iOARqtpycoiFgTXxvzfjYY9s6RoN2vxI/OTQAYbILvsRRoXdY
	mt5Egf3tf1/NB8wPF+mLcd6BrvMV+GDS7xeCa3Gi+mWfUxD3yLrw8lLyfeSNRoPML8/1XBKKMRf
	o6UVYD/VVdGeWEfrqQJSrT4Y/1ISrspsp3NEeZVg7Bs6bXyquOGhK3WA8A==
X-Google-Smtp-Source: AGHT+IGEe3AhsETphSlWIph6FXEsmPwCoLFqhyrdsd/Ir9BZysNPL0e8X7R5+YzLiTUPjrkveBRuHQ==
X-Received: by 2002:a17:90a:c2cb:b0:305:2d68:8d39 with SMTP id 98e67ed59e1d1-30a23dd6d1fmr2058283a91.12.1745898234956;
        Mon, 28 Apr 2025 20:43:54 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:54 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:29 +0800
Subject: [PATCH RESEND v6 05/21] drivers/perf: apple_m1: Support
 configuring counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-5-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
 h=from:subject:message-id; bh=ow2nagzt8cdbi88jV06ZnLC5cMis8xMzKWgyHSgosSQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErjmkrzSmluSHWpPcLuLDWP98UII4msj5kA2
 ggHtP3TV8uJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK4wAKCRABygi3psUI
 JMfzD/wOvdaDI0puKAZ/mBBR/RM2CGIJHx1W73k4qAImQG2d7LjX6ZB1XJYDIH31FYuSz1EUOUR
 PsUNC9HgogHIa+HwSQXOm3gIsNqcdPFTf2wrmt/U0FlGJ/3Va2M2fZqO1cR6Rqa/U3FvgdWPioZ
 gz8QMUiIAcik5zNGkfAA2lC8Q9OxP9fLjQRib920ucOuxgyDUecskWWgNkTAED0ajkgBBSuUHvR
 Rw058GP5Kq/4SwcSGpybBCjuP/lvZ8kmLFWUORqtZQef8pQH/L8vFstLXUSumAlu4azAipJHbSw
 HgA4gIslgn+wsTMJIM8AYS3qgjyH8+3hGjaf2Dr6OiG3qHT9vyoezxjPidCA4OpR+iIqbO3TWyT
 As1nv47Ka4snM5MaX7s/6CHpWlXrMVFMIZ08EZjHJo3nU9f0RxYqMizdkR37xJkyswIrg2T5bvS
 ctfh68fdTC8I9pu0VhjjXmXI6lHmr13+X7DETjsC2BYJgh5+YHpWj+iEHUB9kWJXPzh7MCh/f2a
 tnoNTqsK1d8Z1dG7TyVOzW2leAENkYuxtuswY1k9xxBQu41GR+Pb2LxfI2lGp1WS4TrGoUQDMKM
 yPNaHFLi53Z7QlcrlQjrFOzz/k1tD+SmH0b6HSVEnpMB6SSHzpH4UE0Z4ZoIHG/p7o9d/wZPGFV
 i60irA/fg1MBlzA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204355_866648_5A12A280 
X-CRM114-Status: GOOD (  12.21  )
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
index c03eb7acbb66790e17967d570c71746f72e40867..f2566a0f8d330fdc0d71ae298f16ee9700a13c23 100644
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


