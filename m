Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA51C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/mnOzr3VUFjAXVfJVKgy254i42mcNI9/0Eo4cq3orc=; b=iGDs4l9pbOY1ZWhFBALJXm9owT
	3APAwby7ygKDjCkLkp2Gw5WjuK+zWlsWtKlVfnYojrOD+qHB7Ue1mEzjPWARpAdq1mmk7D6xzpTh/
	Tf8HvNIzcZVwJ6H6pO2DO5WHaVJiGxhWXP1yOqdQ4Qmv7ywSdW7BVU7KLWeDVVl/BSGe0PfczbMe1
	RzncZJOYRD975Pr5F0/blwhYF+n10o6XMYnF7G2lcZJ5l0LJF/x+67cwKcqTWJB4Xwl/xgxg9stNG
	EnrqFszrJPBLqovuI4IAEFJnxqT93BuYI09CMOSOzjyG1qgQ1odnFrx+ggAGnvruUmO66ELE/MkMn
	K3JEv4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulU2o-000000087qj-0Zdc;
	Mon, 11 Aug 2025 15:02:38 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT09-00000007u5L-3o1Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:55:51 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so5287990a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920549; x=1755525349; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/mnOzr3VUFjAXVfJVKgy254i42mcNI9/0Eo4cq3orc=;
        b=io9+YI/RS2GdKS7DDlEynq/Gdvfced3eMpzB5bAcX7Hf5Vin4+1ZOWFnXQtABHuASn
         9j8aPoEIYUUYHGaM5hW/aQxgzGD9/61dMiBzIsThqzTWyzdmEzG/Hmu7FejzAUjjTzjr
         0w+BPdhhvsN/po9sutCq/fm8xCb4gbK72LTapndjj0vzaAChHFaW7aSPChgB3+uP/tZL
         SGP8NczdnpMUmxtD7j0OYD09wAYisCXS0aulWBL5/TsR9++vSczNxQWfyIZeOYrM7Er4
         C9m/Tb+olKuZVDnG5qQlWm252Eis+1cg3/te4dr2rfGsfLMkbpmESw1fOiQI+3qR6IT4
         PL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920549; x=1755525349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/mnOzr3VUFjAXVfJVKgy254i42mcNI9/0Eo4cq3orc=;
        b=ZQWbDZMo+Lj8u6q7q3ZnzunQQ6zHzzvuP2CyrWPBohxV5VetSSTAsrz2tzUkvEKs8k
         L0iaqvq6Hb1/TiA6ZYvJ4AbYfltyrUyP9L9QuSoTDZuK430wfcwA91O06slV6WicQg6e
         fsdzyo+9W3sxIAhUpbUkuvGxazdGjBKB/ykfYnvVAR2T9h0riA8WjWVyqESYS7p+41ms
         cTibt7crqNddwJziZIieANGjIiYyS2d/zF2ThFacom1swm8/p0R7MFfygYdeRn+NIhpr
         DH7tgQ4nzQ5upfEbPv16n+HARWr+Ebd6iISZku7EwDK4X/z8AHdBVaHHPv7ylHKXFjPb
         mLTg==
X-Forwarded-Encrypted: i=1; AJvYcCU1b31rlG44Pv+y+bG5FrArdDvVDJ0QxJJITvBSe9NKpVcBeUFJ5oW7/ZcJ93sOevPcaDyHA9pJdH5esETdkpTh@lists.infradead.org
X-Gm-Message-State: AOJu0YyoIzAOnSzZCGJP3VACm0g9drhWtvqpee4L35loAQkKO4ebcQfb
	4lJd8UKkxQz59TCxhLNXa1NnemFHNdHPBdtqgRbj5DM5+Aji8aTwXxJ4
X-Gm-Gg: ASbGncs3yv73ibYXbFAk4waORs3vK4NOsxolUS9D2nAzHEVWFdA1j5DrtvQrhF8DNcb
	Y3Me8egfcACbBkZivGUM2fiyV2h2pjZEx8sUQGi2jJuOy+qHlhgBZJqa+FiwnCPPGypaLfBT5Y6
	SAWLbiQaGIH8/CFs/6k0yfyX0Yju8orV1lwKI6ZFxta2Ce0jI8f87gZ3oQeOlXtg3O7JjPZ+exJ
	7F6x6E+/zqx4sdTJoaTItSAsBEA7GVyOyMgiWV13wQnfcXhiZp/8tb5KHCjnuuogdjVrkWDR65I
	++KO7IDHv3KyvbFJTHb9ZC2FPx1TDNGnVcUkde5Jr5yRlJOZ3wnWgU1EiaOtDyS7B7oLQiVkvjU
	/11/tKhVMGCrMiDwvPBArJ+S5dzI+kJXheUS88Oetzls/MTOchNbm85VCEw==
X-Google-Smtp-Source: AGHT+IGcGOQc/b1r6JOl0o2juyTRwQNWPtFwlqjVOFrEFp3jVQx/keXJWe93BPYVrzH0bIv448I9yw==
X-Received: by 2002:a17:902:f549:b0:242:e38c:89db with SMTP id d9443c01a7336-242e38c8c3bmr77391645ad.35.1754920549020;
        Mon, 11 Aug 2025 06:55:49 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:38 +0800
Subject: [PATCH v8 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-6-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=MBYkOMp8zRY3vG74r0/6XW89V1iPdN6l9V1/vB4q2xk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZBt0TVBcxz/c5qr7JmkQBF5U88g5YmXrAFU
 387FXSG2faJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QQAKCRABygi3psUI
 JMdqEACWf9cYzVRAvPO4kE63gH5ewqMqVwB6jD1J+tfwEiXp+Fr7BHWs67QTeMB1RvNG3dXs+zx
 8LYbi7RNJ9O1fpDHGdrxl7GREHlp3U7Fc1GpP4OZJS68TxsDbB+tPSy/i6lGK1H8E3zJvQ1LlXu
 Fl/WZQI7Qfx9lR5WoTjeV3PjAGmCWjj1Kvuw9tA9ortgG5KKU8uST4yxb/hwdTIJiRFoz4rwQsB
 oBuaimMRGBFV6z2vC7N+B18V4+kOFiwLzl5Up3okjP0C4OcSMA6W8kBrnQoVGHnjHr//s6cmSBT
 4woRXP0MQkbu4ueQhA/fgJCub55EzKWfxIA0IgdmE9xHoj5mrVIsAt5WiAHiSgSXqFmO7AzqJcT
 fLgvZZJjddkfFJTsvGZ0TPOeUvBGOUcK0i85bpqdTpd2E9MdFBNxlrtDwmny1o6oo527I/7msbd
 3nWgozb0k5bRBgQgadcrYHbZyWSQY8GdCQJEgpe86+uwMiLAR81Xn5SVcaRHz2ckmixDJhNTIqZ
 ds2iEckJkQVKP3BW/Dp1ptrx0n4SHqi590VzWSRdCSOjIXuEPJd17F1uFU4u+aBsS7C5KFmloed
 dGG8Eg1ZZmZZYfHmtNXIPpK014nExmv5LchT02piUGLTv5xkfxsNgQlnpjhyN4Uep2iZi0lOLtV
 5J9LY8BGXyzbHTQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065549_952978_DBF9288F 
X-CRM114-Status: GOOD (  11.86  )
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
FIQ will be added, which requires a per-implementation startup function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index fb2759069fe9e47146f0342fa46e40f3ab836926..303c0e62432281e899a33fc197365c70078d6ac1 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -659,7 +659,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -681,6 +680,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -690,6 +690,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -699,6 +700,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -708,6 +710,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.50.1


