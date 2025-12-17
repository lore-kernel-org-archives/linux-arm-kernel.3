Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60084D65C7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VV04TP1qOyPuEJVZ8EkDOfgn7C3GBNsDLm8LDcSrTn4=; b=FC8GmyQJAYxZlPRqk14PBXUYC0
	pqaNfTnm7PgM5rSVoqdWFunfN3Jse4cR8kNrmqWvoRYlsTJfwWJOahr2Uao3hz9fLvQL0r+4XfOK3
	1dT3ekEURKZNDXW4KZO8hdzRrk3h44Us1j0MrLQtmqQ+YEHfOzwPHEngrLbC0YxQ4Ar+seJZkYZkV
	jJkSYu1JflEgX87bQzXus+MfFdo/g2nVeKc7p2woF7H9zOAhAIuj5DbTinhdhOmCfTD+2WYUJv8Zo
	2qhbO0xLZgRVKiPw6Eh8Vpd2BXO0/qFpmqm7bDxnqhKwavxPeVmYPU0yDCtc6B0CEjjd/cs/bP5Xt
	KJsIdlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKm-000000074vN-11vZ;
	Wed, 17 Dec 2025 16:25:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKh-000000074rP-1SsE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:25:03 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a110548cdeso39962845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988698; x=1766593498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VV04TP1qOyPuEJVZ8EkDOfgn7C3GBNsDLm8LDcSrTn4=;
        b=Zss0bcic0hiXvbmb+bgdeFbSRBe0RLZym37UEhpmhfJRg3glHjyYllISB2qQowpUso
         ZM3hALHM8iTDd9K4l0Wrke1uyabTVr8fhEDCVVjcUwvrjUm1niiuQos8nG2rmmPcUJQ6
         sSEDnxan7KrTk0tHkN/Ybn2abFYwsM/HsQfVw12JfcioQGRLYVwmWZ/EZMgTrkuC6Xdi
         bbpKW4X1R6otrSBYHE79mSa5BTbs8MUCycqWcvjT/qStJQ43Sqftn71KGgYnGNgxxAC9
         rCzh3ChUkwBnyqa8iBAIkyRF5f8AaE5nY0cSkkUO8TOOMNrpQ8FPQQpfNx1BCPhMEIsi
         HjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988698; x=1766593498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VV04TP1qOyPuEJVZ8EkDOfgn7C3GBNsDLm8LDcSrTn4=;
        b=GyTvZFO/KCXuVKAaZYlkzWXLO4RPwDay8Hgdq+tg66LUti1j3bND1goFxkRUzBWgNt
         uBs7UzZE3E6s+u02J4QKr1B6KjZJxObYbrL+yWSZKb1N2ESCAuukp1qRZrzHMDyW+08u
         AqsXbmxJEUslYHGMKwgYwUu00NGulfTQsr+0VMHzA3b6+voJdLs2m7L4KuSF3tCfoNy/
         Oqd+iczEKW6hegEpM2/l6Kba2672/mmgIJNVC7P1psf+sQ6JuV0pdrnhaMaFaGXZWPxK
         KTLbY1lUs/aiZsJTsIgWu27t2B9jgj/FlRU3xmffvmHrpNMsyngGCdwFPI+tyIK2mtnJ
         4r5g==
X-Forwarded-Encrypted: i=1; AJvYcCX946tQUtR9YCamdLGUITMEDZljBtV3Cv/wUCspU++GaWq4SjNK9QtDEbe3vDkE8IHcrxYq6spoVdB8Ds/Vab9W@lists.infradead.org
X-Gm-Message-State: AOJu0YzILfTyqkfVB6bv+QQ0JiBiz1Lf8+F2CQKL7dAIW+uPeLW5Nwl0
	EcPTVKC0LwgT5rJ9M8iYz2M9U8X0Yvq+svUTYr6XXRQom59yv+4yw8u3
X-Gm-Gg: AY/fxX4njrhFyXqqf3BX9Q4LYvEnkcUlKWqXQuy8WQATNmY4JwkQ3uoC66HQUTvDoli
	f/+1UdE+hotHGAQvBAJBPhQHSXnEPk6MuiJrCvOfa4e6yUQ+5r6zn919uf24RVsI6pjx/DcMy0X
	gaXhmeE8PbLxh7TKzDZeYiog1YMuStUeQNhUUrVYEJk/lVg4CFSy1yY/nabUu/ptTwq0eNZeR5L
	ll+8Ei3jgVHu6G+dwaII7hkIgTBaJ+poXBF0Sr85VzRfWW8jbGOBTOW6uMXzoQU/SMvTKGhi+J6
	VOp4U2JVANAGDSwz/jaIjOVMWZzFaEI/pH2hm/CHBVs9FDFT1LwdBLbjdDX+4U7ihcQ2Cbu4roX
	RULk5rzTavDP1WHsH7fXp+V4cu2pW27ADOf3U2MjE/kaV9ioPsVVWnpVoK7klrGyeQUc6L/3Pm1
	TKIMMwoab05ERx
X-Google-Smtp-Source: AGHT+IEpTD54HFdeMnaw0VjZN9vYnC7ljfIwzHHvSyRXdlKEsVX/LGgWNkU7U3alrGNq/8FyZgpAeA==
X-Received: by 2002:a17:903:1b45:b0:27e:dc53:d239 with SMTP id d9443c01a7336-29f26eb2a1cmr188775065ad.35.1765988698277;
        Wed, 17 Dec 2025 08:24:58 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:57 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:19 +0800
Subject: [PATCH v9 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-6-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EvpktAwcuUmIVDFq1R1ot/bW7FD9M9oCQoJjxbhIT58=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlA5q5NsoNM1LMrGXCePOowzgKrUqQ5mi42o
 JBGkhTTFRqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JE6kD/9DDhF4RO/JQidMPAlnqSVBd/rn9UAjC81WNu/nQnhSoMkXh4rdDE8vZciufv4QYb5SHVt
 QsALf8hFy8NJUP8+I51BSwqEHtNPQoJAFZzKgAt67v16ZQ/yyDHYPhY9y8ZxmEoljjFGCSsfRoZ
 7DzFgEnkPzogAVTazoe17QqJgIuTAEoJMm7TrG+WC97CDwCgUjxJkA9cvt8Ftv7iNgu05124gOz
 exyhpXoV1ZW9gX7ZDIA9UBTQcm02nK2GekfaInFaWlnULiMfjotmGu+QewVU+GHG7uZO0friYTL
 ayTSCvbwYwzjw5PODzRpzKQbKyjh/Z3WC5npjLjPOpLAB/evsOiAthhiyhxdYVmd7Zojv2JdpdH
 XQ0V0AEVjB1Nsh28NwC9IxpbDZdl3k+yOIu3yoKcFftWTWrOAVKcmVsPJZGPWP3T0rDhln8ujk6
 Yp2PvnOh9IYT327M0oKe749VDt0oXMT0pL+qxfgRXlCb9cpPlk0iat5MbpCHuLGKeWS3IbRAhE6
 i4Ie1S606zj9ud1IC1Uz9YHzG9+LLGt4j2lztc5NbzgcA78gGJLEp2YMHNrwJ2iGLcSe03jyYie
 gLn5aHAg44Pw2FOdPsvsmk6mgcqXPOQaiRB378X2CHxvOi5j+hw5Q1osulsXl/fucqYcNJYExPA
 a3XIWmgZ1cngAiQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082501_904454_51CF5D54 
X-CRM114-Status: GOOD (  10.86  )
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
2.52.0


