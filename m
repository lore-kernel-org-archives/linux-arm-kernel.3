Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81012C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEntLtHz4WyreVvdYG90vu3xiJUwTFLXejk99s9G7I8=; b=s2xyjSYeZ+bSsNpfz/mkiXPMn1
	EcPkKC6jZDHAQ4qN+DtpENg6esEwahdjRdZSBmQ7lGKqjzBecr2/rrjMkyG/A3Omg49BJijy6M6fw
	XbKuXYwo5Ql4EVrY8jyWVAmGjkrzE6RkQbavmdMXDiSh1reyyYy76EuEn8M8E/Jdj2L9zbtn77MbN
	gn3je1zo3NFBUA5VD6qkbH0DODXWJKthNjOixd2/Cxb0bQa9oXbx0oHs2CiQA2YttFZkCDfuB/fSe
	yQbWB4LutxtKRhiiYAodegaB1PzLnn3D4o1iWZt3rwx4IdlOdMBePDg1QhYf4IC1yxkzhYri0Zl5Q
	7Xt99MYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsvt-00000004T0P-45PG;
	Tue, 11 Feb 2025 16:16:21 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsoC-00000004QRk-2kmX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:08:25 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fa3e20952fso7081172a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290104; x=1739894904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEntLtHz4WyreVvdYG90vu3xiJUwTFLXejk99s9G7I8=;
        b=ajtBdjo62uJiGyZ20EveG/ZS8grY3Ff1BxvSh4VArjGfPDh85Gl6TPDUG+CH4KRi1R
         a2UKal1XAZWZjbLtcI/VZMb2oRC4U3OrC3h7FyuqMSMi5PwCnenVNyzOI0s+I7W5/2Sq
         QS9racwEZtkWQTpJNj62qMbSiHhiwxnfQf6lHXGd7E7ani6ZvjprzCJmCInqkIjvEt0w
         LJdnpirsYLGtQBx2pNOMUij+YBcTAGAFp2PdTh8codC7ks5HhPJfDH4bwktoGpWutW3n
         DrfsHz5mS1hn7h4Ul2xPKR4i6R+UHO6YiZX03VEvVR8bcH48FaGCxaFR1EUnsyePvsdk
         ZTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290104; x=1739894904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEntLtHz4WyreVvdYG90vu3xiJUwTFLXejk99s9G7I8=;
        b=jqHhNT2k4FELqgBrZqu71PoWSIT7boSu3rz7J/gVaoxLD/BNVk1yK2lGuctHkspDjH
         8CDKVS+g+hASKviabOrtuL0VEtEf8r6KVGQsms8n6WxTUwKG9I2CZ4XtTVHAEhssOiNu
         J5l0+ORdorbi6LIeF0aunzhhbt9F6X7MHLaeRlzyyOh39LUKoLEU0XRGo3oOzS6Da7vC
         jkpkNLecOWpfoOR128ZW4JuALvm6+iewcxAzO9J9xdrRTcpjqfH6IxyW3ZuXb9paEprJ
         crFIHdq6wHrM1QM4U9qrBm8BMQLyT/nsX0REoyUhgzAaMRknEe3JZyCfP+8/r9uhysoJ
         +ZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmrCX8oAlvMrqWViuQLJfE2y73QbBLbhHodY0E5CVMUp2wjTAt3QVTnd3zqMH1i/z6aIHAKVHCmgGE96T8jUcd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6O5Xgu2N9Jxic7eC8BD/MqpIoufVyZiEbVSrZYLBXFC2c9N70
	YbMPf8R91mEnoqrH8Ugg31GZvWCL2fsqUeNAu9wSgqkFmaU0pK8y
X-Gm-Gg: ASbGncv/wVcVkBOnxWB8HiK4czGFJer+glU4SkXIP+Ksy0hcBlETsLAnMrtaWhUleDu
	/GODtUJanuZxS0/POxefqYk9xIUcj7iIdqBpzl+KTzn0pB50rIkZrDcGdZSXYDsh+5wtwtsl2FG
	lSIpSq5D9jgVc+zg4X633AKzXb2G4fyiocA5vQg8r4QTrR5bj70Pq1JHOZ/Vp4CRCZj2E2AHAEd
	TulWtZ75WEUrD+Pe+DSjN3r25xK4WZ8/bebWg04wEo6HJ5SsBjR+Ux9ohFROdAkBZjKUBmOrzWp
	JHkdEvpiXB8J8DLI3Q==
X-Google-Smtp-Source: AGHT+IEMlQ8kqWyBtETjcYInexsO3wrAznZUhzIxMTN/xckLpbtrZpA4GAT8HBvg6O+adCuJbKKOBA==
X-Received: by 2002:a17:90b:1e4e:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-2fa23f565d8mr23851683a91.6.1739290104015;
        Tue, 11 Feb 2025 08:08:24 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:23 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:25 +0800
Subject: [PATCH 04/10] drivers/perf: apple_m1: Support configuring counters
 for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-4-f8c7f2ac1743@gmail.com>
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
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
 h=from:subject:message-id; bh=gQs9caovUGQok2nCifAixdGJFEgkZT2VLjuftKNGAZk=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3XnrvthgwukKuQgQqkT+wKNLkCh7f6Uj8zfB
 3RsovLrxOSJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15wAKCRABygi3psUI
 JJcDD/9Xa3lG9+foU72POXq17q9s3tzKS7KN12596keegPogu+bO2b/Hxb/kdQUrKeU2Cid3aWM
 QDJ7quwXGR8GjRg/3YQqvhZPjOIzqknyV5sD7UJsR5IFEtVYX/TkVZOEnyNVRT8QKiqT90CBlT9
 WyVpnSymp04tTfQUR+7Af9p3T6pfIJHFoUQeqq7+eaCNRziy9WH5wcaPpgvaGm3GpnGuhye8nB8
 uIzx4rEnbHXIdC15u6zs/GXkMJT8J6HRUwmS7UUL9VjS3VxGSSu/bi99MsU/ksd7Qyy6Y0ImnNq
 3eOHrZaEy1NvtZfGh9R05MLvj2hq+RY8pMO2x/od/HvyN+9XvZ+Aoy1HVaHCS2c8l7lBRAaDVo6
 z/sdKOrFSdaWkLkO27gb9eb5xzXt1LPTLyCBxBwRE+m78V7ncXWlhfgXtQ7XO67ZNIYKAhJpZr/
 8cJtR0oEr+Md874UgXV4rCeeoHvF7nu3405cKLidESyW5XW3/HNuLnaPzHNwsnUeg6zkicA5xbD
 LeenyCVjjkudXVnenBL7HuL2df34xtCuLxVLG+cUUWfgyDf0GfYbZAhQQpbJcDgrDDnzXA9tpl+
 0rfTDIIYo7lz8SNfMXpWn/F9mkJbPTMTCc96K4gYM+mXqPDSo7vdSIXA4FV/Z7sBHrVeqqZAyuA
 kBY4khho2yLIlPA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080824_698343_5005227E 
X-CRM114-Status: GOOD (  12.25  )
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
index ae91848bcd828be197fc21bb2195f3e2460edc65..06ae20332e79f7dfa819f764a3752fefe53bf5b8 100644
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


