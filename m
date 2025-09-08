Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA68ACAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16lNfyPp2lVpupbRAD1MY+eMmDibLLbMsLULc43CNdM=; b=OJCmgT6UXthpnK/hKloT9cmTA7
	InxqRBsBc65n1yekpkut+sHhRNxcJ0DyCzhq7m0I71eD+hsIK6BsTaREAO88lrolTRR1WnY6HnhRH
	V6bfFyc0vFfESBO1emk8xqabTA44tqdgdxj4eu8h7WEBUYSMqE0FugBmgTTYRVNDDrgxTFbSeZGpw
	s+VSndc6lTlAo1rQhgr8YCi+EFOckBmPcLGEDAAWCyBLAksl+YLTl8fuUjlYEFlnXNkG2wRii5Bq/
	cficpZB78cNK0hzX2WgolMcdXL53sYh+QZaR9MVq9QE8DH5XAQR+KTSNLOfePBpV9IIfpIzCsoyX9
	qR1J99Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabr-0000000GqR6-3Kfc;
	Mon, 08 Sep 2025 12:04:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYgR-0000000GDsn-3ZrM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:01:12 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-24af8cd99ddso53160935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325671; x=1757930471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16lNfyPp2lVpupbRAD1MY+eMmDibLLbMsLULc43CNdM=;
        b=GCDdiMDEUpvf0kT+K76zUhDzHpGNJfjImpC4cWEF4jKspcYRYXCveSoXGMlQKw41Tq
         w7o6TP5aXf2nDcKg83HHORgO3PjwElEIvpSOuxRRTqB6dmO1nFm++85T9b9n8tS+AZ2p
         1DKb+792KYmh9jxZZEzo8JtkoIaUSulw3kj1svYOLXzhnxobC/vZ8tDAVXyxlc1Uv+0w
         f/G4g7Bzplb7PqhQJRuaEBvs8l5bJKWp6T1dhylBdo2vPonxPlKx14DioKUDyl9LKmM2
         Z5smewJooXu0qr113NlljlZNs81ScYrPD0R9uU9re/HpRkAAP+XU3q3F/vBb8Ua+bdFD
         Q2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325671; x=1757930471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16lNfyPp2lVpupbRAD1MY+eMmDibLLbMsLULc43CNdM=;
        b=UI5Z6iAHSWcBhU3swSrXoFW8xSiZ3n56BD9T/qoMmmXFZQxjNFJRUdtm2m8OfVi0C5
         mRKfEkwTurWdkFCW2Pa194gq9OP9ELnIUf1vlIgy334cKWD0mbZvXGWVvX0lY+zJT4ei
         ZAfD5o6BoTEeTmQH1FyFswBrsd0iom00GeB0rDP3v1iJzIJM/HKViSSkQJf22Is33JSL
         LDbBVhExCsJYW3U0l9xVQmEOG8aK+L5kBiIK357AiyXXotNWvJwYak3RFPZ3gW5LXvoF
         R8xVeDy1Nml8LcW63p2QiR7qCescMpqUC4LhJi24uCwKuUC6pvAAeqEvWslU13RGVvIv
         MabQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4jMH0g2llJhUsKqhAq4apyWERhmUvWoNvMfC+Xbn3fI7SrJiINfqqtSuouyFdNqyWUecpSu3cE2sFprVKfbBS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr9V3w3SsPZ1yOA0w8y60/L7I9Y/829IWx+YWNLo2w4Epqg2HK
	JXc17uUs/xcpVZZvYHwZTBsDtKREWzKn2oZUpD08LPQpdUng3M30IDih
X-Gm-Gg: ASbGncvIGBo3YTOVijrI7LAU8ld1g1OJf+4g/SS+HFjXrOBg5RAFDCqZwqAe5lvQ/JB
	9w7RvSUrPxmM5ud94DH2AKhhQwshYjr4E+ZXL0J2RJtuJlbwiqz+VTQmTWyr+t8uC0gQAqrVFWS
	D5AX4yLuG/x4EZ+1/MbuANzsKp+Lljoo7ZKM2tOwzbXZQ8iPunCCx1/u0MkaeYtFpNShwO1My5i
	0UvRiTXrGSJXTBUv2jdpXk4ztWq5K5kN18i0y5iNe7wYxXcDO9TGFu2pvlNIDduvuzEwajq/SCS
	fXTdhRBV98BOIvmURe+nYCEFFfYoAMiJbd2fTe/q2n5eVub25ODxOFtkNa9pd7sCdzEnV17WaRq
	vjUJwvriUwM1tN89Rj12p+4pTVKHh4PlfhKbSnw==
X-Google-Smtp-Source: AGHT+IFG8nlBga9cu765ON1HNtnAJSKtln2AiuFotPMwkoUfxyXOesYWBBY5/ceXgicQjppuNNDlcg==
X-Received: by 2002:a17:902:d2c4:b0:24c:e6a6:9e59 with SMTP id d9443c01a7336-2516d81a0b3mr106521115ad.6.1757325670620;
        Mon, 08 Sep 2025 03:01:10 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:10 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:30 +0800
Subject: [PATCH RESEND v8 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-6-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
 h=from:subject:message-id; bh=HTqUsRXqv0uayXlXxBww3HqeknMt/byBk1GhhunGYGY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlDETZgMV+/MDSD5BsxF9IFaobbIfNhofPoV
 +IcAuRUXBKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQwAKCRABygi3psUI
 JCbzD/47Ps4GiPxo5vmMsl9FdVJxhCkkddSC8f6nDjwiU6Uoo4+9iniHA/la6Wsqo5kMop7B8m1
 jnWyUbA74cLg6IShxozfTVhrHgqLTi4m0lH+wvGX9yywsSyIvM0vqZ+q2D6ZzfkHszNlhqVFS1Y
 jwTEbBVTJ3Jnp7JbeZCSXxuReIUYn3nF4gRIJ2xUQaMIVtbjjN2boRFbYOsebNR2PClLUlxilXz
 b5JNoBopmGVTD2W4xUin6DpNPAqMFiFeIuV85zgLDvs34jtlrxjTZPMBxuCWmHrdEQ8mIvuIder
 iHez3j6nHY2ZMwCh3fHWTDv2Puvwks2onUPRAmfqSs2+Sg5miSj9mko3chyvdvzXRK9X5/r5aXo
 5pQ39e8R319HRDja2LibYoiS8OD45CS2GpMMYyqQD/s5sVOg9AKKWNpaMMLk4Cb3qL7eEo/extD
 TWzyhVZx1+fK8dwQuoGLjor8k2BeMR1fDObLUHw6jroeevMxjKZ5zN/SPCFVQl9XffiHf5jsUBm
 C13RnAnhSRrJ2siY7CZL16widt7oDmzHquniHTD9jeLFeyrW7B8HhWjMVsnvAAjycR3ORBftw2x
 oTJoJU4LaYLqYGzhTmeXBFkgpFb1eNyi582FQb/bPNTRGXBxdT9I74q5J1gvBnHbL0xFfzeuycf
 ErbyjMhO0s5pRzA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030111_895408_E3AB677D 
X-CRM114-Status: GOOD (  11.79  )
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
2.51.0


