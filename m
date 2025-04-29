Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F8DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 03:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=; b=G6BPb7nT3RHkh2G1QgDRdX9tou
	aMkfSeKBz92fz2ZRer2V24TMZUJO9yti3OHFu8iEz8pdu63Pxx3h+dKC1APnJKfz4+J51d+Xp3cv6
	J4QwebxPoaBERxIApyuMdJsRipKMRbv5WMjii+UkEfEwHfDRnh9kDbyGnR4o09gJ7eZMwSPIDdAx4
	2PQ2Dy8xmAs8f/2JYTS0fiYjTUXmqTVE5OboU4p6go2RqFIu7ArqxDIzVgv2STeKdGR4s+JsLlGdJ
	kMsA87MBnpmxw6Q58VrcPDLHFlevFPPy/jn+ocIECeP+75luPzpSWEvc16j4jczYySnIAsW5KOeyf
	E1bQjeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9c5x-00000008F4B-3fRB;
	Tue, 29 Apr 2025 03:57:21 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bt1-00000008D5L-0dEZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:00 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-af51596da56so4678689a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898238; x=1746503038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=;
        b=FnRb0EdtOzwqxjA3+ndkHy3tQkwRUcD7vChrvOjNd8X4C/NlMBj1AywKWR5jVrBMK+
         OzKmVSe0fRv2G8GIRWHnjWKIoiwW9vZ39JEVo545cj1DXqTBlfElyj6RVokSHyiCLXzZ
         gDssaf0u5acZKKxzbQfZyGWeLx1QuV2pZIycCv8JfrkvE3K9StWP2hlSDRpG0HUTZua3
         6wzM40D07i3Iyjlp6qJsr//U+0MCWs7oOCmScWGqx5AHNaMFzQVQN8eq5UKW6SzqzEEa
         aRIOaOZYS1YeCqgijqjgJGa/FyHbTrCvBcz6h08o46ZLSmnuDPsg1iTs+vlTg8tY1qkE
         Jwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898238; x=1746503038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=;
        b=bepMtucQ6eJ7b5Er5hrfUuI3Mr0j14td+t6yAJsw0AXc8clGqOC91yEI4IpCd9qLVO
         6SnMUaCdkXpEP6MUkKzcfh9mTBvT5gXTJkzNMqoRX2qGVeUoTL8gJ7Sei245rySZdLfW
         R7klr0iB9QWEQYsKgf32fxsTybEvqxCZWDx5Uv01QZpMLPMtEufSULXOgrPBj2xa4Tm+
         g4IjUeDL7U0v067pLZB+/dB5fCA8cl62/dnkxkQ8bqPZDFo0oq/bZo6fj6CVbtrczi1M
         LyNShhz6/+BDkEjC9ZPmkL5mW5u5xDLOVK6TVIP20JJsNR7Bgbbt1oRBJr9EDOXNWgKy
         AMaA==
X-Forwarded-Encrypted: i=1; AJvYcCWDWjtPbRMRfGM9sAa6eY/mdAQRXzi3v7dIlPo/Qdsqwjj4SFZi9HV3wcmGV0WTn0YzkpAuHwY3ffgcumPqGh5D@lists.infradead.org
X-Gm-Message-State: AOJu0YyhR6ejyfoniXx4+yqx/ji9kYYnzgUZm5KzS5VzyQ0efZxygTqL
	Dpebe0N/Iitki9++WtfmjEg4+5LM5Lkiiq+k27NGmB1jLafzmO9R
X-Gm-Gg: ASbGncv8uGMynnHLAOJKZYn0/tVHVFjEtccLwcnEulMv9/aX/n7YLlXln8GhvfviNqU
	CPFh1rGQ2eHufu5RLG8wvS4Tz/C+wKuUBss6X2X0pLup4of1fTNnHEpEvoL5k9ckRw2hf/gT7SY
	EICKWMeFJCWp5yChLOQj2fcqqFo+BikRUkDgIBf6LE4aug1ILlAUoXZCINy5+nWS3rsJ6CP48vm
	EQxtbYZTy+8exjxnowxvbLiJ0fSEPxYWihkyFTS9r5lmgiI3njgveevdh14ulLOk3H6VpQ5RMgL
	GsJclcKPs0EwElfZ0Kjh8hyqsQPlJj3bxlsB1iNsTQzvQshGp8cig1A9hg==
X-Google-Smtp-Source: AGHT+IGCv7NUMuwkZrzMAT+2m6PloicFqMmCpwFVHUHLjuZ/63RjqjkmuWX8FBEwwdaE+kDW5LKrYw==
X-Received: by 2002:a17:90b:4984:b0:2ee:94d1:7a89 with SMTP id 98e67ed59e1d1-30a21546764mr2708379a91.1.1745898238312;
        Mon, 28 Apr 2025 20:43:58 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:30 +0800
Subject: [PATCH RESEND v6 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-6-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=XuN7zsZ7YOoemig6fmya2Ywu9aWxTuisbfQnSd0HHz8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErkVcoNrjaCyRf0B+oVVlF/FnWvNI8GVPL/9
 /6IEObFdLmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5AAKCRABygi3psUI
 JHcRD/43EY45WDCCOHH/tCk4vG6bMpTVYoxMtOmM3AG6ssXxy+0LPTgCeIbIKhrKVlPPNNF15Kx
 2zGMBcMedxpKxGE38naXV4W9pnSlKLwJsrRJfFtmn/wRrmqtgOh4HEGmrCAtd+1vgop0WVdjXSe
 WJxwrIfA3rtr1qDT3uvdrNqzAMQUuVIK5bxK3IZmaMccEwowCeS4K3m0ljdCQhFlx8yK0JaNOde
 G9Wv6SCT9BPpcXL2yBqDA+qPdnx4pwghspuCxamgW//wFGOnDmUBA5RlUaOG7DtLTqn95yig8Mv
 5UfX3iDNRv+h6/E+cbv74gTyGf9Y4FIsg2T6h0lgXSr1/zE3PyZMZobiHLwvMY/nG9cRoS4sHZs
 WK7bUTPwDGDdM/gF7sybcIDaj5FxG92PRuwVGxUV5XMuDx7/JeOYaQc6jz5cixN+6oLsmCNDP4d
 r5dLJcUTVkVLbn64bkXAhGZ0fLqeuPQrNqXTL6I5m7PDPaMLg3Gre1oTHDBxa856QqxbTND1DM1
 ezH6qet2/HJwAHenrwxnMfkwLEemNnvQTk4AWx2JjUjUw84hUbaX2khnnQrsEiJ5BqCzv5DwAzR
 jeDLZCiJrVFmi2aOB+LGw4dhCyMoe+AlsehCTNQ+3R0eu/4q5K0K29drrMCGgiC1XWEDjTpEXGZ
 jvbwtgkXUgZOdFA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204359_193656_3C07C6E6 
X-CRM114-Status: GOOD (  11.64  )
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
index f2566a0f8d330fdc0d71ae298f16ee9700a13c23..38fb9200369c11d0d7674bec4f350915c67352b9 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -660,7 +660,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -682,6 +681,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -691,6 +691,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -700,6 +701,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -709,6 +711,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.49.0


