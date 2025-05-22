Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740A1C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgSYDCFyOFl1ODnG5fRD1TrPKu6WyFc6mOzCNie7R+g=; b=g6hCp/P8lHoYRXkBG06LePl7Vk
	eHlChIk3gQvbL000IcLyKfoke1cowe1VwbQEcMqnzYNnzyVfM1XaxrjRV2um3L574d5kLvIMv5VDV
	H4ZHF3j3QDTtZ/iHRKByug6VaX98nnoA9rjmfGlMQaMmwqL8k7K1bXzSXpfmmhCIzbRY2URYIyzFr
	8l/PxVxSuvV/6Cbvr7beXDm4hXVwjGe08VL4ckSRJu5l4LD/fdydIUMDK7bCXoQhbCanmlKYab0jP
	gWfJ/k1dCRvhiXQU3KVJzqT51t5zwCHyvRxuE2e3QBm9A6jcGy4jLYLr5fXuZ3B3H9AWdJ/wpQKsk
	yI1aZUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBKs-00000001ygf-2xwC;
	Thu, 22 May 2025 19:12:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCm-00000001wMD-0kvb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:03:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-231f5a7baa2so48163335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940628; x=1748545428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgSYDCFyOFl1ODnG5fRD1TrPKu6WyFc6mOzCNie7R+g=;
        b=IQHipMqfaSleJ00HcPRRVhNNadpsxzL6AFW4sD9jdFb6U3mq1HJEcrG/5G90rKQT07
         JEoSpwLreUeT0XXtAAdB0YwmdVamm0nErWhn6y0YOWE5XMGII+5NG3UW14wRS+y3LfpW
         ak2aua+t53C7f69f11pP6EneUsWEEAxCY3hP5lcCAWhu4AgC3MqldUHkS7UBcAczSz2H
         xygq0cDnHNDOE45xkiob+ETOibP0Sis5a0WIZ+YEhaHlamSpjXUfS4zevU86N8Pu5ity
         CU+Q3ozS9r9Qvvf0e5NReiw2O8ugnaC/6eokNixHghj3r7eZdtheqVPAKN9dVthxmnQW
         XP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940628; x=1748545428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgSYDCFyOFl1ODnG5fRD1TrPKu6WyFc6mOzCNie7R+g=;
        b=G9mfzJ5HKZZL9UmCVEHHNUoi/ngGySx13OTq6+lPWDwZXsJD/zp7/qgwftqzJ6Htn5
         8der030wuD3ktbA+Az6jE9tVX67KolS0T3qD66GZr2Nebnjqq+NW72jB9dbKkJmLFWlV
         YEE9w76VYFRCVoKniQ/bkDgbx7M/OlVZ6Dje8/biT+V5Mst2PR11chrwGBLErmVZt/fG
         igeZZV2lq2QcFa0yNFX/3Y1iTOZZGl1a6yEnVJZzxHvRbsTHFFZj5gkQBc4V2zS6DNY1
         8SxP4Owbh8xgSidOXG/V9stkZkADAdGqPwS0S1EaCR2T8op/aq6SOMhqLd5+d/uJ6ouW
         N7ng==
X-Forwarded-Encrypted: i=1; AJvYcCVbIpWT72mAcWJBJ4W0zeI9NyOurV1SSdVx4XcXqQMBcKuEEe8NVu7VW4bPqR45J640UVbtq/tGYkGSkl8WyCGJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCCfMtG3Vdfs9IE+K2ds8lm6sGmogeiBCNE0HuyCBMppJsa87G
	ZNNzpdDWnZxtV+WxXfC7YUFD5bup9ZN+MVkEpterriXPgX/+mmvBsOZV3/Y13lTIPM0=
X-Gm-Gg: ASbGncu2qlK03fphtWWBNPADW3VxurtLA5H3W5rHyN4Mi57QZY8+GSbGwbe5SJUtEv1
	otXyNbO/WiVuIlas+PDvb+NIujRoKjKPB2CxbjoWuXaAJOvpngY8sC5QxaD9Ezk1M6X/Y6TzxdV
	AlHyPM0MnhMaNEzSnj65qNGyW9Jw7iAIH2jI5Wtfv8kKFm64GX1ePweA5NbmuJAy0IDffH4q43W
	i0HAXH2Ae7y8VkOg8euflsyIhcfrLpsqE46d46nPPd5rEL9AiGxQqM3MoDW0EkBvVbV74m6MILq
	+d/kjFweg8u/DSkYa3XlyuxVLZf6PW3nmTCyWwxk06UtyZv+s92Yzm7rdGPlaZBO
X-Google-Smtp-Source: AGHT+IGs856eL1BrViuwG7Snet4kjwTZqseUJx/cN/TovXlD6rlR9pixORAh5bRSKluNwVXzmFHaxw==
X-Received: by 2002:a17:903:2301:b0:22e:364b:4f3e with SMTP id d9443c01a7336-231d4562cc5mr379326455ad.49.1747940627664;
        Thu, 22 May 2025 12:03:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:47 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:37 -0700
Subject: [PATCH v3 3/9] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-3-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120348_239556_1EFD3050 
X-CRM114-Status: GOOD (  11.37  )
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

SBI v3.0 introuced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 78ac3216a54d..15d71a7b75ba 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.43.0


