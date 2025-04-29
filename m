Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D86C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=; b=QvXBwlZfqgNIc/J7ziKpUFGtKg
	dv1RcAi9EXYd2dU4Bstyw5CqIXdJmnjlqhKslFVZMAETTixQtdd5tt5Q1T4nBU7tHMSY6NPgG9u/7
	R7ef1mLY3kkbaznfXVMyvhp/lA2kKZW6Vvs06WPL9p0KD/eSsWBCpf9P3fkDMpAEd7TLkrrT+UR+3
	KYs5vdtkxrFBzdjgwySH7qVWNu2Og7KDOyVYY4IeRb70Ye7Cpl6/VeddL8iljf+jZImHpL8e4BZpq
	RJDnKWubvdmF6fV4tShEaIYGooPkiqZcUh94bbsYv25csZwDTXchY+qRnw/9umkoj6bTwaf2Gmt/8
	OWsscbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cBd-00000008Fic-45lP;
	Tue, 29 Apr 2025 04:03:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btD-00000008D8u-3CfI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 03:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=; b=DyMT1MfyZCQSCpB97pP/7Q/yTa
	PUGkNA8TvwWLM1VOD9UIsErNaBz2CpENGwGIIy8c8N/w3Y01no7vvVAoU7SbibPMDThAjWn28VEct
	psRASYDp4oCCZKRA9dlSyQqVmobRI2fkLX/z3Fttyy2n3vJz43Wog3Y9w9w/CXyRUwxSkG649gHiH
	XQuylYkvgOi+Yv9sLpWfKweUwIzNOv6DVVw1Sc28+w+0e6S8OnsHx8MmI4ZoP9iTH+VbXTl535pXE
	tnd2prb0xYvwdd+vdokUA6YHoIUxVTYws/7SFU0deHcpUOTH6vpPVOsWfZ5hrfyK5RZqZTsVGdc78
	qduQpQjg==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9bt8-0000000DBJM-1xtF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:09 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b12b984e791so5332295a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898242; x=1746503042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=;
        b=Kq7w/TW9qAzBM58qoEMxiYNPiN1zXRRaLcw0HutTzLEEtxsYArx+cmRJOWdsGe7Cz3
         v3I08P+NpSnUMsC4soZnb4rNdncBo3M6oxMq7A/PXXNulzVKzpEytvHSV0nBhoCk6KsB
         w+itP0BjFQk3IT7umYBF40nlWsgRxd9VbZviQBcBj0mJIt5nb85glLopt2LES+9+hgwc
         LAnScn8i0yk3Mw8ozw2lhjylQfVnHhIzAlzyiZnwQVFGNGYnZD6T0oyiatO3zq34hNeL
         AX8y8sxFaPJmqVAQB87g1baUuJA3nDpExaDy3jpmTAklWU2MdMZeFq7E4JVhq/FxHCsc
         g+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898242; x=1746503042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFRFlIe7m8d6IQT5KN9JYG3eex35751hG/N5r2y+/nY=;
        b=cbc9seQ33GwZZN/SeakNDaRTtLNbwqThe0JxOyBTwk8MEJ1Jxb/XUHHvyCCqvxcUJ2
         S47+mHUxUypO5L+K1RxcR5XtJCEF3QujDlfdT88kv1UYHtLha1uj6xzaPw4HNqG2YnIF
         BKAmMiOKBggsZHmcVmEBe//p41H+Ze/Y8z9LtTDHQ6JSnrhbEWKhS/O9lzWA8YM4YQmz
         Rwnj0XffEiH5FelYfhA00cBMBlQgsQeYM/aLoAWQT4AFl90eryxXaTECrk73pTEbhE9S
         xQJZ1xxXI8uQM5Oc9WrB0pjIaXC53l3JoJYAqa7jRGUgJoP7bUzKnuK8k1kb3NGNsRU+
         0KUA==
X-Forwarded-Encrypted: i=1; AJvYcCXOErgLaPsjLIFSYUa5Ye2mYTdDqmIYFWpAwXfc4h7qyhLfoaW6NPDybUdjAlT0ql0/PAMHKELu56iwfAjUS5J2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+vUypqzDoXRjyoAytvOTbvYGy32h6FNQ9XMIahn0JoV0jyoox
	XfSy7bACaZWOq/RQbeTlfTCtGuqq3HzZ0I6dCVBwYt2Ujn7j0VNc
X-Gm-Gg: ASbGncsduPqj/dAtJYSDR2sKa/IubcMkxCvNr6yuoOj4QT/ZlBUkb+z4f6tU8mNJNbU
	u5C1gn/iDLx588tt7wOcqEJaHm/ULHHu65zuyPQHyzDaBE5/V6Ni3v06aPciW2T/XUzRKLbeG8m
	YCKBqKHkcabcYUDA2qm392+B66ESF1pJvI4BgLbBfcgalZ47LM+ntvWhmSF9Av2vwqL3zFKiILp
	NTMDnKo4CiZKmJO1HIuFk3sS7xuSLMrKHb9XRUd+5d5xul/Y+1dTBubdN2dfsq9vQHEuTT30mgi
	J3xxQexIPJG1T7DtOoWnOmrRh8sQH40fvh2JQ63F3RE5EXEyAJQtgF5cmtzt6knaLxUN
X-Google-Smtp-Source: AGHT+IHDwTFEW5fMEJMTCAe5bu1FvynuHvjqeFfz4UrKJrWoqpXUDYx0ood7wdnra56eD2L29EYWYg==
X-Received: by 2002:a17:90b:4fcd:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-30a215532a7mr3313636a91.13.1745898241653;
        Mon, 28 Apr 2025 20:44:01 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:01 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:31 +0800
Subject: [PATCH RESEND v6 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-7-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=yx4ulzghzXPNnasdFXmt4DIvCjCuPnUboqBEbKM2bdE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErkGoM2RWg0VDlbXiGWY/HfVc4yzBpXpB7XY
 woxK5/rLeOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5AAKCRABygi3psUI
 JMDrEACtYSUEFb/komcO9xfM4+iYf4PfbQ9GJmuP6RrVfz23Yo2dm29bjUoeAwfvld16KTouLrg
 DBM5vBZTQOhc8nVNTh9NRNMsYbn1Zffep0SeMhQUDEBNb6NIXhiOHrTY8Nc8KTew4jtAm/h5VmN
 q2t5U+9QXA8+oV6FpBgIEfM66Rli70AIGdTkcyzZsOSx+cPOdM3B3YPLWGCywlRky0nxD2sD6uc
 Sch4WVH6GF/vpAodNYpe8t/BxxKyR2RAz3l1bvf2EmjmrOzLRt9L/GfT/YAE91wWePlgA/rdDP9
 xpEWOJRDVCdXgBAGqVz8npNYMAxC4iCRNFS4g7zhHs8iswoYTYOA4teUDlsHmZKJ2fS4QfE5+d4
 IQc63gns7yaojgY8npYL6c0aK9ZmVkpAzLrrBe0RrR/Q0eedgs5BBDjRudO7l2Rk/hX+RkPrOWp
 5WaGpOv6mZQHQuAtb7+im0jH02X7gcRCZMOUxAFtMimUic5fFIl1yK43fT9sibB4yuh+QN2sAvk
 eEs5+Rxm/2Jl2VpRiTfLtYdwYvtHu8c+KywQyaVsSBaOHfIF4/TIoeijKvpiembgYXRyYm+nPlU
 9SL5FMHxGt40EVGE0RfF7IlfYbfCsTjHw2fs9g7LqaTGstLqxFBud1C3kRfxhtYthe5IR++rsCu
 VV1MRAyn8hGlwpg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_044407_431188_8EBFECC2 
X-CRM114-Status: GOOD (  11.78  )
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

To support implementations with different event numbers for cycles or
instruction events, event attr groups needs to be per-implementation.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 38fb9200369c11d0d7674bec4f350915c67352b9..523ad37a07521692206cc438b8d777f505506c7e 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -669,7 +669,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -682,6 +681,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -692,6 +692,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -702,6 +703,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -712,6 +714,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.49.0


