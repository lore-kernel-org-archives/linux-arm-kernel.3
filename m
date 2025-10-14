Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6710ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=; b=1BRslv4ozR7wzigyD4sRGV2fy2
	WlhCPtnpwM7iRrcPGeMnf+Z6HNNJo6c+0W7az9ecOV7JbyAK58+9d/rVMFzFkFTwJC2Gqu21V9Z/6
	hlrisuBPfp7fe/jsGxPvVFoBn1KySqKVlESUVnMfw09WkTbd0aPAx/zK3FhEQMsb5M6OPY9aFXJRk
	PbSYl06z3R5QLnbf4RjlelXpQqI44cANFi1R/i4BpI3fR5fbEoNv9rQ5Tbk9Q1VHYTrgDJ21Fj6yO
	ohLFIusveb8zR9UiPoSD6EYWPTrDNvXU+tUEj7cKIGbK1fvmtfUGBoZ/vhKRuNDDNzAN2AfsP9Req
	wr9T/U9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZw-0000000Gimx-3S4B;
	Tue, 14 Oct 2025 15:04:44 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZs-0000000Giiv-08md
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:04:42 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-330a4d4359bso4514886a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454277; x=1761059077; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=;
        b=km7/u6b7qVwLLK/WeEm1GG4cmdCTmvbgjqnpzrfuJTMAxNhOe32DTVgtomKVjROFbi
         Lv/p+gbr34oBHJU2HHQK8T2cIJqFqOXDStExVeQR5iWsq4AOp5bj0WH44JBVkLkenkAw
         DaSQ1nZKx+qXgDepY/gMA4viAMyOGLMXcRV0tMZfaimC43ZcpCLewPNbhogMixxnpUd5
         H6daF/FXkirQBi259V4ZJSaD9OHefMYvqPJlopMPfoO0HhTWsGJH2YvjHxj2QlQr5G/L
         kTcTrrSZwAyTlkafIdUsy9fXei/lV6MKyJkeinbgxDCe1KTfYB4xRVT0cjbwJnc16ZI/
         URlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454277; x=1761059077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLtZQAdEAm9Qpl1KbOMuUjIonMp2MqyrH/XDjYnJ7DA=;
        b=lBogGp9QHGnDCZOJIb7DrOLL4VcjesRBfjcu99eesZXmaAn0PV+ObjfFUOvUind1ha
         0SqJK7RLOUUI6mjH/Z8bf6V3rRG6Rq0GhrieFFP4LBahofvA9/ofAyu3oUxmKuS4A8FC
         4graPajVf1Dg2U9cdoM5MZ8OR/Sx74ynjIyjqsRSo4YYPm2Uo7YruWnV+v32wxHIH+B4
         cm0wKcAEOzqwbL771+nikGTiZgI0hQ3q/v4wbjhGPvkd/0ozn++us6KcZ7roi1TsaFng
         w7vk4jgoWn33JrJMYsDYWaYD97xj7rzSiwRqNEkSvO89pejPsR5bree69+YUBoxK3ahE
         ZJTw==
X-Forwarded-Encrypted: i=1; AJvYcCW4c4PtTWfwsLkQ5XzubO7vEd1Yr+oYcTvblgmc6s2BM8vDdyfWxwbolCLPzd7YVJXsy7kfaILN+XX51maSvW1h@lists.infradead.org
X-Gm-Message-State: AOJu0YyCjIg3rtNRXNmjeEWfAOP6gJmtDl6dMobuA3JIYciIravQUEL6
	YrhdgjOhCjM6XVKcF/gt6SUqThym++YTU3zksPsJgZOOmuKlm7Dz2jSCgUoLjg==
X-Gm-Gg: ASbGnctmbmoYapeP8KrU8XdxefVjvVRSWZ3hd3r1laxLFBvuuLtEahBqXCDoB8G8g/q
	Xxzi0vk7Vh1Ytc8aHNG3xD4RG+Qg/pJYrWJ+OOACeTqUuB3Vs/XrQedWMIfOV+YbJr1D4iq2t8x
	naN7w11DM48l1nmT65YSQ3XM4tV7Z6KHXp/I8UGmJlkbgnbL7PhWLOEqs2WOzXZlchwyVks2XKG
	n/+q1YMT2+ZUmu3mtwhXenzglLyvufZnVdg5nq4KxA/ahEqxZJzJ5W5GIheBkdAkHr8op/+nHmj
	THZzTonSKcBDNReXhkLvFeUd2aZT30EJ62jx8rif4lv80rbGiFJ0JRRsZiL8Mic7pFaRWFQaz4Q
	xqA6MtO0+c4/1eJcqIiH2y5NxsPNl+y08uJeh+lBHs01QN97lSv1LKQ==
X-Google-Smtp-Source: AGHT+IHOP13PRRe4fGKU2dX23aWl9ytYNiSEVee2M+QWQRc3N0N3lx+44qmDmxKAuSsya1+ebXRuBg==
X-Received: by 2002:a17:90b:1e0c:b0:32e:87fa:d975 with SMTP id 98e67ed59e1d1-33b513ebbedmr32981127a91.34.1760454277165;
        Tue, 14 Oct 2025 08:04:37 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:36 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:38 +0800
Subject: [PATCH RESEND v8 05/21] drivers/perf: apple_m1: Support
 configuring counters for 32-bit EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-5-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 h=from:subject:message-id; bh=C6Dad8JPpdCuqjz4s5GhSEa3XOS5lpXoC8lCTSueqRM=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZtj5N/ZWQEde4e5ZFUO3AlX4qFFD8lhBDKy
 EoZXWDxP9yJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbQAKCRABygi3psUI
 JG4BEACXO8SeA3FJFQKbiTtnTJEBCSvQBz+ZfDqNYwU0oRv29B4KlTl2p+d4t5UTnHnfWgMqObs
 bkqHaEX/JgaUrBV2p3EF4JiZuTzDM9CSxpmhMX78n3PBWBy8eEiYI3dnXWyVW+kO82Aift2PjhJ
 On99dgGH/wkolrZE9y5qo7X4YCBQ2s9BeaPSnqmH71jKw/IEc+pGDvAaZqQyx3/7A41BXBRBgeU
 x9oNiTPEw3rmIoTtkb2V2125TXN8qJNdiuYLNJrTALHCJ69Fk2T4oYy9HIbRnK3s34PZh0Nh9IT
 cSokHqlhB9GMMWwsyBnHu5PTPME6609MNPNZNrQ8kjBWbXrJiZoWzX9x1wJDmUz5csPVa/Io34Z
 7dMfpQTdGa6ihQARW5mJvso13v9zKBeEvZUi4LjnLZ0xtv7rX759VWCnEKRpdLUdXECWI3FHbEj
 IHSQLtDohunqO6ZqtI+I4y3rSqxYhSOKSkqMWtU7lOlNjcB4PUpn62xKm09AknM5UGAwhwO5KGb
 R3gW+qMf/ZxKw4hat16SIjSQq7JlO2jcgviXIEYRO2k6lWtHYivbJKTJ3bS2sOJJXHr0ME80/Tk
 bd0GUypd7crXvpMhwfv59mKAtj9WrEUsPNIKVbZMZ/dympBIbjomJCSo09nTQShOGWVi1PBN4cF
 X5JBu3phEhVYSCQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080440_218223_5A544A10 
X-CRM114-Status: GOOD (  11.27  )
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
2.51.0


