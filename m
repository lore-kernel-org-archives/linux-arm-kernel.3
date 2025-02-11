Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27344C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/bCCPIxn4KDDZBLFDUwD7PiQhomaVfOF5iK7lDsvVw=; b=oUAK7B0VnlHlh6Ue+IyiJxVpPe
	ZTYKhAJebcGcxTkrn6EXRFYVDK+x9FRT+5zMOnR4zhxbsD38g4qq1y27t4Yt6EKzS1CMRMD4FO428
	HSWjhtFZ43ddzvNrw2UpqyhZNyTomqiPwrt32341Hw0Ijf5KNMvHVzErGvctL7fGfKdXWWQ+4PxLn
	5CGLuyLU9OLp09FN1LxY5twdybnhu2vuUsQenp/OioeUXlZ6KRBLEhyx4b8aIU7UHmhi90txLhCgZ
	ceYni9eFZOAaZMKLGl75pGadkCWQEE3DrID69x3ssE11mSdENwtqJPtDCA2G5iD/ZXGQ6CsVAz0QT
	ofVdv5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsxH-00000004THN-2iTo;
	Tue, 11 Feb 2025 16:17:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsoF-00000004QSG-30SX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:08:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f9d627b5fbso10897713a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290107; x=1739894907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/bCCPIxn4KDDZBLFDUwD7PiQhomaVfOF5iK7lDsvVw=;
        b=mkbt3BG3TD7CpQ1Ah2gfER/56S40ykYOSHFUXnixHTiMklS9NA1RWBmJ2OD1YFdHTJ
         jUmwAH9OAsE+G9T+TGOj5uF/aG5D1Xn6nvtOvZFkpXGVrSD7TKM8WtQIQaNTuPvgSll4
         tmgTAgP2IKXgaZz/EJ9AclFwEwttBaUTGoPAVxjBT50+Se0dwIRCK5+jTopUFKc96HzA
         oYHxe0xWz9xxYDTateAeIWRICVotv9HLdeGODbCL1n6ZJQKwZz1NseLbb97/o69m6nz9
         OVluA3pPBrGm0x/Aib5TJXSsYwWiF2PMltZM/u/SxJGX3XEUeeXcRuKkEG/w2Zogg2tr
         dGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290107; x=1739894907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/bCCPIxn4KDDZBLFDUwD7PiQhomaVfOF5iK7lDsvVw=;
        b=NWMWNsd5C1NGyweMKOSZlXlSwZjZK1AkOH4nyFI9shMjxTXO8qJCxSAkmox/ZIwG/B
         //YMes23q/57iD5F9gGuVmz4g1CB1mPxH8Uep0gg3xLZ3TtHvEW2q0hrfzP8jXki01wY
         PBIrQBDYSVI2KGwc3AvXkIPciDytfNeEAANX98mKHktfQ8nwyPWeMDkTV7WerNh5pCw7
         UQrNHa8r9Bmk2iugk4s4yzmwqGQNrhCO3L7lnYd4/7KdOleBVKkMLwn8PhB9AJsIcKRf
         QOJBbtb4Wvu+PYL6wr/vZA2z3VjubDigMZ+PuMSwWnnAc3/K8K1cODxnZM/4bN1BuC6G
         Vv/w==
X-Forwarded-Encrypted: i=1; AJvYcCUrFGfwwMsAA/0P2HXdNb2XR/1okQ1gjrHiKxFoSjhekB0pQQKa6TMeGcYqOzZkoVP7UEEqybjP3P2FceMgRpDR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqfx4j7M14KHkUNK40Vu4j87urqs9zWLOr6GjHSfB/OvVm9JyO
	PvKCPHX5r06i4yZHSY/RX2E0q8wwyta/l0g4spta1PIPKBSjmUEA
X-Gm-Gg: ASbGncta/3FZqFq8ScyHvn9rypdBMIaZsj0js8143XE/D7li72a8xO1znpR8sGiqlZh
	esLe9sQ9wKUDR+T/GgIyyz8IpL/8ipi1ta0mUKZ56JyhN9g02FmCcqOZHWBAwyKngNAFIj2levQ
	uJFZvKs6AFEXWQXrKPxqD+h+ksen2jVVSJOUC6bQqKIlG+sc8XjoTPXtxKsQDr1pJ+oLpLk/HhA
	k4fuvrtntwICXxgwttzWwvU54geuH/d96C6maxy7kgAGMtJntoE9d2cd8fR/mNyql+axf5WLRGN
	fhY+xpQ8TvCDolUcyg==
X-Google-Smtp-Source: AGHT+IFDoBSLFXS8fc2oKxZ7u11430kH7lpuCMLsImbDx0eDbX0du8ImVtICDjL3/vMG4Cm2HPnt/g==
X-Received: by 2002:a17:90b:3647:b0:2ee:74a1:fba2 with SMTP id 98e67ed59e1d1-2fa241776aemr27656016a91.20.1739290107060;
        Tue, 11 Feb 2025 08:08:27 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:26 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:26 +0800
Subject: [PATCH 05/10] drivers/perf: apple_m1: Support per-implementation
 PMU start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-5-f8c7f2ac1743@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2292; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/xQSzk950FCuvtHGQpngGIk6ngOfd9HdKv/UR2YVLS8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3Xn9nZDkPLT0KDldq05E5uglg+bM8uK4wN4T
 UIOBBR4oGeJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15wAKCRABygi3psUI
 JF7FD/4wv/qAAOyZdCHLlU2G+92h/urYiFuL3iJJOQ5sxB/pz44kEDVs9qEL4Dy9QvoUYnldG1P
 tauf+aYAe4YLqfeicHvZNYljYUcvTQmpbTjfPTTr9gkAweHEiRJDKXszaioauKZyLGn8Iy24Ss2
 gjEbPZRw+eoaO7K1PtTKXzK4vczJuV71a5Kd/uscSzJbrqV80sBTv4frJkuxcdU3KcxjbwuTeIv
 jkJibsOCUPhIdRew5KVoeFtnAaerGdGTwK6hm384aRdHT336p+hEO+6k8RacaCZLxfNLRMEPXDN
 tl4f54G93X4MJrUzMMt5dPh4JH/A+PQ2ADKJtWnKdzYFF7GWRkM7tQYkEBaXYMpxfshBDDJjZmp
 EKdvD2Heb/qqF2ivHp5tRPG48BV3ivXH7ZaETcDeNzetX6VaIVwPMv35jw9fVrRrZsMIgv+MLxU
 QNVyB/+dOjnJ59Oof+9Z/E0pgT7N90MpS/pG18fP7EiBSFJ74BUP14cISabTNY60rpcdLR9D41O
 5UHtNR7WzCyzCvmDKMr6mH4q7lMf6djqpIjEWVp5qUaX0pHnKolIcTygmzd8GvQrdlQwtvuY238
 uG8nIgpQJ/ygvxt/A+vWw7LR8S1YNrnxPatPvi5vHWjEF39RULSbcqvhBmzMfpEHVYSpRH2cNi2
 9oFASIjH+CeKwLg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080827_758611_7DCC810A 
X-CRM114-Status: GOOD (  11.88  )
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

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation start function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 06ae20332e79f7dfa819f764a3752fefe53bf5b8..39fcdcdb9e5dd6d4edad0a182dbc2eef62780d8c 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -605,7 +605,6 @@ static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 flags, u32 counter
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -622,6 +621,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, M1_PMU_NR_COUNTERS);
 }
 
@@ -631,6 +631,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, M1_PMU_NR_COUNTERS);
 }
 
@@ -640,6 +641,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT, M1_PMU_NR_COUNTERS);
 }
 
@@ -649,6 +651,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_63BIT, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1


