Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6038BEE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYhLngMqNJ6OldqM8uri9fztTRs+E1nPGgcMJFZEiIY=; b=OEgh/C8CMpS+o7RkZduW7wMiCb
	Ro//IrqxoE8dJa8UjDyf6Fv0nvnjPGIHEkzZsHDzJWfaCmkJbo83+oTubkz9ToaV2xkF5Vc3ynzHx
	Z20pJUZbkqnojpKt59uN91ea/RQYGf18YfKnvIJY1JI6BG+Fvpqc1BZhqBtcSEEYXQGRvZhfJ58wk
	Vof5kKBtTsy1S8mhzVHs9FNztCSjbpbGCARLi3vnGmn2D/RqTtNRd8YrKgTxPqRfHoUDDBqa/JBCI
	5G6FAZrYL/NibS6S2HN57wqhdrdNhoke2wCYyRQQYe5NunxhSAW29OsKE7SyVXTgpEAU8/taZP8Ll
	usSzdQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEa8-00000006idK-1bFY;
	Thu, 01 Jan 2026 09:02:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEa5-00000006ibK-2tTt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:02:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so101169445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258173; x=1767862973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYhLngMqNJ6OldqM8uri9fztTRs+E1nPGgcMJFZEiIY=;
        b=XdKzv6tWDLkEV7QLuu8xYAbLPiNenBQcHQUvSpDGenRR0o2pDrhFvxhD5yNX8t5gnn
         MVdekd/b5oPkictAo1ZHzHiZqFI7u8cbVMDe2HREUZ8yD+GIBIOZaW9u2mdNWPUqYhTs
         ciC1SiiQht+brcvE7zRY8FMwgePs2Zj7UHBiuPTEcxAPgZ2LYlrO6xcid3HXVxmiQTP0
         dXq1C6fCaVlK+u08D00w17o3n942W/1Colu3YXsQct04c45G7DzpINHZS/lyUWtasPoj
         4q+opDxAM7Od8NPqnVgd5p6Ba7sif+eO5FGvaiQKTBuCjiiHfVlS0ogAN/4QAaUIZb7N
         CQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258173; x=1767862973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LYhLngMqNJ6OldqM8uri9fztTRs+E1nPGgcMJFZEiIY=;
        b=O8dGoOt6T01zjqdoOkgJH2OzM3/UseKnpPkPxGRhLdqU/eEusw5/zW59yBZnRLnJMM
         DCaMak/6009JwtlDqMVGGaYHSr0tyiOMTZ9xxoILl3Ubqz+KszVD59KcSvto4mrXZG33
         DxhyWyr1ap3aY0kHVGmlibcSZ2C0Vyl4C+SRVT5m4pieygwur6SmUmJl+m27wi1Pvac2
         vHS6x2WGxVKdQMt4dQJ8Lato3gkxk//9VySTRJy/tMFFNwiE8HIqhtIDKUtygoNyfs83
         X5GWpmxIwQzrWafZ0cgm78B7zlZZV2EKM3TYcRA5MxmQP5+FxQ6i/lrYLsdyzd6MfPED
         cYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWljyTX2KoI2NdHbQRJ8xa6ZMJ11W6c2Ui+Pkh1bT8jPR1lCdqwdq6/TpqTHk7NQMNWi3cUSj+k1PelXUtqc/xE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0riSGF/YVqq2j5LUGA7rKB3hF0FAQ4h9FFWv9ilRD7grS/v6J
	9VBwmG58Ajt7E/AC9Ip73OlxXmHGqlDwP5dNQcUB2ZYgsimrpxSHxiOL
X-Gm-Gg: AY/fxX4n4yy+LXVcR6mqksWGmzCeiqvk6f06KDpT3odF3/DJQWrPGBrk1nw/KOs0Hcf
	7jxk4VOEEtyjJkTVDzi0zuWNRxjK52r0ArMH245GsL83eOhcqNv+XfiQbj4zwtWhmHf9Mk//hZN
	8RsGoYCoCfpMgyBglCSvOk445aMaTMMfPVaRAefNF0e0OnW6B/7QetoSNQqybsPf12F1rcpG7gd
	+xHqgL0op4EfYpAJYZiwR1zV4hkOqt2EelOtAVp3PyZeldyUCLKd/RGp6n2rEZfFunauw6UnpVe
	i7aIiwnyTcdI6V7bkqBV3/fnnnm0JDWrqlcH8WdHtFPDtZmAbfZZIwqpuoQUlVcSsmPsRXvDjed
	xkGVWnqxmsDsuG8rznVZt96stELtxUO6tUr+R9QSJLTbUd8BU++glS/aj9b9iqxfuAk9zZcy7Vd
	YpzOU2VjEZjyft
X-Google-Smtp-Source: AGHT+IF2DK/wudcCjuHS9KGm1WeGhjtlIUvpoPE63sH8WHjKNF73liEZe8dOYBfzDMRjLKw9kdzJgw==
X-Received: by 2002:a17:903:1cd:b0:258:f033:3ff9 with SMTP id d9443c01a7336-2a2f2a4f072mr340888935ad.48.1767258172838;
        Thu, 01 Jan 2026 01:02:52 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:52 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:41 +0800
Subject: [PATCH v10 05/21] drivers/perf: apple_m1: Support configuring
 counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-5-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
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
 h=from:subject:message-id; bh=HP3+BRpxCk9vu8k0Gmg3N76nZU0a4qyvZesmM5VNmx4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgn0cIO4FislP7e3t8nidSA1+CQMnbCNH3pF
 h1xmqm6xcyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JwAKCRABygi3psUI
 JDnRD/9gYiOUD+XFPH6CuOvFxz6OirPhj00mypSpKS6xPDABNlbRm6Gpq2c8l/14xhRKhcTEFWE
 wppVRTTwtKjb2bicRv0dx7ReyAY6SSGq9rLxVnWb85qXeNrxKut2up5+QYJr0v6L6X/wqF1IGIa
 UgQ24vn4LdN+SCNi59WaZ7X0QJRb3w93mznF6mCQJXYRiTIDWifB/sQteUprkUHxzlwT3ID2lvp
 hx8f3tl24RDYGH2qccljtXnVWrHO8tYZl35zov2s1cjkwQdINF4UO9UxGjo+GCHj/xTETx1atcF
 /SvGj0u91ifTnPB/j7/nizOSZh1JifhmoQO4kNd7acRZivFtzu036oKoIernRQvQsnWDsTrfvxg
 eYPZkSaFQL5eC259rFHjkJoVX7dsPExFJMEvkbbu9uhtJeYp7O2vji09NAFqiGRCOdBU4dkO1b0
 CmIzcWKl6BvlzTKm8G5LJgm5XPtyWtdjddecvLRsDKkQC6Iy/vckYLjUj1eA3HOBWDp69NmyNeE
 n+vS1Z0/35HwheeHocy1/vDnuQXu2J8NfoLYa57FjXj1yJkQjZldfjGQ/O0e+I4vpf+MN0MchKs
 WYScYjbtt2U34OzHdfHxOhsSm4cQYiyHqCLm11bS+UoqE7qkQDzL+Llk7V3vajXFNv3myxXuNfV
 5n2Iqm3zjmofrnA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010253_738331_4784F41C 
X-CRM114-Status: GOOD (  11.39  )
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
index 0b0ee2b9ad4b555f66b9b478055a420b7eec8f3c..6340ff7d3b75d7f0c7ab159e4114d49cf031daca 100644
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


