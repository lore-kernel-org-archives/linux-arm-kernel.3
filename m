Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526D7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfHdG1ANNWPpZE2kjiBnSExD56hP6zWfFTzaWahyQ5I=; b=ifQS7ZdL0A5ay/0pjyfshQvckE
	U+dkqrCTcSz9mkJkyvS7IteqHz02HvYQPALhuSmL5Ptg+txHhCaZR9E1UV70WGeGRuo63yh7XE4Ij
	tNh3yOxLG3wTQLsMMpEFj6hcVjIBWvg0elYssDyn5RRpTv0lpZvisjTu3OXB2qeLOc4/R3s1VugVU
	baM7jEpMtinv7QG7JUZ81+EkLX5Ua9a1WjgBSVrrRUhV7N7qCvfzwbj8rBhZfksBJBr3Jw/hefXwS
	5P/kPJCB0cM26Ye2fj4vvLfBUmzWn+uIarx9IS6BRSDv4EbIKWF8lq+nrCoPuUgxgn4Ez0vQbuIar
	r55VrOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFz8-00000006Dk8-0iJY;
	Tue, 07 Jan 2025 20:15:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFsC-00000006CUj-0WIu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 20:08:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21680814d42so200112175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 12:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280499; x=1736885299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfHdG1ANNWPpZE2kjiBnSExD56hP6zWfFTzaWahyQ5I=;
        b=Qb+/XSrFqqjxvhxlscBdEbgesN/1ygfqAxQ57DWWWgiPPrNb7ynyvSa9AYoca+PLlc
         l2WBw2eQW+a7CYYtDZHBYu9qd1QxRsVRz6+ZtAuHZ0PzNbw+MM4+MyQX4+VWotEOlG6k
         YVt7twarP+N6wY5258dB2UAjRTXZsPGuT9a0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280499; x=1736885299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfHdG1ANNWPpZE2kjiBnSExD56hP6zWfFTzaWahyQ5I=;
        b=mFKZYnvtbL722OE+mwu6uf1d3e59tG6zbGDGUdq0OFjdUgx/bZMX5WDSWaMVmg0jDf
         9hBr+MB81I8VTFJiWjOyTmJTxW4Zj1QSx53hn/ujVAZOSc2Ik6xWO+zbQIpqcbJwN4J9
         uAqYsEI6OB69Q7N9tFEnHgBr0XKdNoMANW6t3Isa0xcD1IePgvv9245DQzePDrPa3afX
         utftou+itL8c7Y9UJ+prwg76Ww3Va5S1mBIlbnM4/niObL7H0nc/V2TWyprkcSZQotrv
         Wze+44GoSxDxk4jk7DIU4+8ErQ0Tbbv9Un6yDhaH11I1Xs3CCPO9RqzxAaN2EVp53mmb
         L62Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo/HUyS9nCv2lAnSVZqRsLilSIzSZkcguuqIrBahhTFu3GyC4Bz+5T3BZLxtsY1kdmECJoxAA8+GDcsskQKdiv@lists.infradead.org
X-Gm-Message-State: AOJu0YyoTLAwI0r37D7Ip1Osp/3soN/HC88a6Tu2PYR8Z0mBbaUxpCLe
	6WgXb6mPHj0zKO5EDURkwMcTgLIUNGNYX22n9rTxp9x8xoGjQmsl1+KUncDD3Q==
X-Gm-Gg: ASbGncs5480/xEqBsQpluj+DskudQBoTSBu1Pb65ymd8+4xDkQu4IeXVpTrUr8D/n5l
	BPDcilwywc9IviTgT89W3RvN4BV5zmB7qjAFONFBh5zu2YzgQbk2xuy7UCCupqPU/YHFw6QEL3X
	+mRmMahmYcB9ZHBMvEXdlSven0vX1ddkANrR12FDZZzIOm/289u6i4Ps2IBjLAk6kwi6trwAjRK
	86a3b68s6NFNIsWPcNqXIdbOdng6rA5fdAIfKNKPeDfOmC1UX/ou5wwy3otGo1LQ4izYTcEE7BA
X-Google-Smtp-Source: AGHT+IFu7otqKCCIAbXozs9Yi25BzurouHYPRUn+yFnfSXfUKFQHp3WyFH7S4/kldp390+NNufFNOg==
X-Received: by 2002:a17:902:ccc2:b0:216:4165:c05e with SMTP id d9443c01a7336-21a83f67982mr5749945ad.24.1736280499600;
        Tue, 07 Jan 2025 12:08:19 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:18 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists
Date: Tue,  7 Jan 2025 12:06:02 -0800
Message-ID: <20250107120555.v4.5.I4a9a527e03f663040721c5401c41de587d015c82@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250107200715.422172-1-dianders@chromium.org>
References: <20250107200715.422172-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_120820_159572_0696AA08 
X-CRM114-Status: GOOD (  14.36  )
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

When comparing to the ARM list [1], it appears that several ARM cores
were missing from the lists in spectre_bhb_loop_affected(). Add them.

NOTE: for some of these cores it may not matter since other ways of
clearing the BHB may be used (like the CLRBHB instruction or ECBHB),
but it still seems good to have all the info from ARM's whitepaper
included.

[1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB


Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

Changes in v3:
- New

 arch/arm64/kernel/proton-pack.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 89405be53d8f..0f51fd10b4b0 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -876,6 +876,14 @@ static u8 spectre_bhb_loop_affected(void)
 {
 	u8 k = 0;
 
+	static const struct midr_range spectre_bhb_k132_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
+	};
+	static const struct midr_range spectre_bhb_k38_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
+	};
 	static const struct midr_range spectre_bhb_k32_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
@@ -889,6 +897,7 @@ static u8 spectre_bhb_loop_affected(void)
 	};
 	static const struct midr_range spectre_bhb_k24_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
@@ -904,7 +913,11 @@ static u8 spectre_bhb_loop_affected(void)
 		{},
 	};
 
-	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
+	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k132_list))
+		k = 132;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k38_list))
+		k = 38;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
 		k = 32;
 	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
 		k = 24;
-- 
2.47.1.613.gc27f4b7a9f-goog


