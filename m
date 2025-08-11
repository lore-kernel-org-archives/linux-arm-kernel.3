Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5697C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDVY+floFa2ezVtey4+H9rO7T7eR2nRSfvvxjj1eIPU=; b=J+d/EB4fAKEE1cwb292+iyR6vW
	op5wjydJTCR62SGuSu0yjbNIlPP/W59BxFRWA7V4ck3rS/tR5GrIlJaF23iGS6yakCtPrFjz1AAiM
	sivS0yaYSy+BY05hzDxiphfh/8+oKReiJ7RFb3GO14UdXcJhnTClOaxIdimjBSAWTmhFAB5xtacn6
	xdGcpxa3aqclBQcwQ2hz28FzwFGeRxIEgOqbBipn0LDVBwUZ/jvQ4vtc7nN0hLDbTErGXOxpCUeFd
	ufo/6cwOsHTQBZUhb9yhEB0bFyi4nCCcLfVPiNiWk2RsuBHNVgD3d24E8socu3NsXMi7tqaF0Nhl8
	NcCzltog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulU5P-000000088NA-01Pt;
	Mon, 11 Aug 2025 15:05:19 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT0E-00000007u6h-0rsi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:55:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso4810084a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920554; x=1755525354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDVY+floFa2ezVtey4+H9rO7T7eR2nRSfvvxjj1eIPU=;
        b=kvcS5IoSeBnt666J7DJfAprRDNT1PxhzkDbDr0unfi3i0gkgyaqrC/80Qnk5itFgkF
         j5M8XX1/OuHtGjfy2lQC0slhgOvRCrUDlo/MWOHrEj646VRllz5fVS1fAcowDZ3fVujL
         f/zruQ95K2X8tiLQk4nRdYwvlYxh71tags3XLO9UFRmz7fgWTSsoCnEymaovSI2596bG
         tBbM3/Fu3McY014SXDNykNygHKNXyizNraJNHMyojaTgZxWhrI+FWF+Pt3VfiKkcmNcE
         jPyL0broo30zRi+JZuqzyxM+LdJ/+DvQw+3vV4y1cLBngbliaXrZf2wLj9zPt7pWw8Tp
         YqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920554; x=1755525354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDVY+floFa2ezVtey4+H9rO7T7eR2nRSfvvxjj1eIPU=;
        b=dMz8/SCIjeIj8lZ7QMmkM3Y7lJyto8er3jA3lq9fJZL9fbhZ6jlP30MsBhDLqKQMw8
         ocsviYb5MqCkatlPlMcn/c+g/joLK4oyLt6VqA3jEI9FK9sVHOY5in9Hr0rScqbI5NIr
         9r39SC/TL0wR195imNAokDUEvs7vktY8BUxaf6/sG+DuXVVYr0yF8nmPNF0eT2XDUhY3
         0Ik06NgVmmP8iHpmKBkM3LlL6IEsgPHPPVkqLzkjmZfYZYZeO8sy7/xbd4pc75Ck7Tky
         MGdUeMFxQrrI7xQPeLop0ioYj7wJnxRGXXx7luo01XEIN4Zn7PzySU51O/kLHP4lNFut
         tnIA==
X-Forwarded-Encrypted: i=1; AJvYcCXQc0FvqKAbGjmBPGisTg+J/umVj7bJY+47m18r72CPobU4KXa+knoo1zZ3UlcCx/ARZ2KeKhvv/Yf9c8wN82SK@lists.infradead.org
X-Gm-Message-State: AOJu0YzSjPWE+EcUSxDnDk6wGfive7t1iBsafJCiiGW+SptjZcaH2i7e
	FSYrklcQPqhaPArufb8cjiAtOaLqukYuem/pFcY9GX90hd7xhUCELvav
X-Gm-Gg: ASbGncvRg5MZU28quB2wvVlJUp+EGN2cPxUzrfBXVXF2t2tOlXr3DrzR3XrU2RjezKj
	d6qcVDuGTNtWzKucFzPMHkSv3id5lnkkeV1oCd/bmc1OLkJbihgrbeJ88z27rHNx6OfvDJ/OvTx
	cijW8PewsHTr5xN1VHS3JOXapsOh2el+qNTKUWngMoXANvfyeVJyR1b/Wutz65zrEWI89dLZMpg
	JXWXDB2xlVQQsxiEYTJgp6yFBLXCNUolRA33XREzz7vl0hxRAZLZTYTBHezXVeyMlZj2ZN82Zc1
	+69milo0LWboemSzSgE/e4OCODInHelCr//oafJv2JXS93vjWdSleDDHozTfpcdUuE6m30xPfJk
	AywoLHnQPNpgGyjVo+4K47v3lkPIlY6pE0j3IFLIRc72PyGk=
X-Google-Smtp-Source: AGHT+IFHYu4SuygTS2Pv64OtW/PfhQ2vvq33RBw4veHS8wGA7QxBbIvP3IPZUwQnuYvJwPanzLoq1w==
X-Received: by 2002:a17:90b:3951:b0:31e:ec58:62e2 with SMTP id 98e67ed59e1d1-32183b4372dmr20235148a91.19.1754920553651;
        Mon, 11 Aug 2025 06:55:53 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:53 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:39 +0800
Subject: [PATCH v8 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-7-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=rJEh82wGCRPwRPPohQLW62LiSlqQUIRYkK3du7yGRa8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZBAE1ZeRU9azngbXDBhjZOrauWF+RbwzpcH
 d151f7gM5+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QQAKCRABygi3psUI
 JLx9D/0RwIYF7uC/co4Z4YfJCCCwa4GKOGenRwclXld7Mei23aSRP2SbAu7AdS5Lisyfe2ZnnPn
 oY5NZR7E+Hbv5az7uJqmlJhD0Adw7RYeTKwa3IzegadLYOIaOtiqYY+jysGgka6O9L7pZm8YpDn
 T6JmnJ8NI99qmvjqLBQre9fFV0R3h8tMPnuRIrt2RwdANnB4Kfbpc7m38+e/4A0wKbXfaDKZ3GS
 UnhiXU7GHIYMBeHjmE8JOZa+HKxses2Da49GiBDEPeP4BBDrMmWRY/yd7pCdRZxM20JkTpVhib+
 uTJMoCFT7j/+DgWS+lQuNPmzFlMv3a8mMG3p52jkxmY00marEBVFf4AkelJa7zMAa+5haOPNYHs
 9RYuo+LeGIlrTi7PjnqUCqgStXq/pgV1Qb8RFpYlfTUCN+5guVHjBrlbO9GB/46X9ganQXaAHt6
 MjwMD+1TgCgsVJMqFUPjnXq8vVgUgN6PmU8QCTkEnfPfS6oyWkPkXXp+5c6j3GWWMKH6DBC7SZH
 ngFn6ruLwIBn/bFK9P0iXNwva2IWVpIKplz0NF2TXcFkGBdwyMIiiYQvHAxgysB8gWp+9ysjqCx
 cB8hjO+bC2z6NZtIw7IRnSM5DNVM5Sfc+PL13ROLXPAboyr0c06WoaFTs3Q8HYSlBXBNoTj8cyk
 Mw08b5AaPgb0EgQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065554_254409_172188EE 
X-CRM114-Status: GOOD (  12.05  )
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
index 303c0e62432281e899a33fc197365c70078d6ac1..d0362a1813788776f4210523efe33a3018cfef2a 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -668,7 +668,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -681,6 +680,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -691,6 +691,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -701,6 +702,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -711,6 +713,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.50.1


