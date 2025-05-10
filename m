Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44610C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=; b=G+LMi1ALdJRl4QteFgQFoCUr3K
	SujNuELSZOSpoV8TDz0aGSqmi1FhZPVZeunQGfCs6yRT8aEz8A0b31Es+eMe8xWB+NM3PqGlG9gc2
	RK72Fhej+4UdoTYkvE+wFFGZc3VmugvQgVs6kEAN2CZjo1v94TxJIsoiseQ1e/Bxo8mFvfQ6/wcuV
	lNwtO2nr7uwTXS8xKwfYRZdL6nh8XNQr0Kdzmilm6cxKG5Ry3/yYV2ZKuBniXJyqLh0H/FJXU7HpV
	B48aMHhkdHttm5n3+M4XvTCEYY0yBihIXGxFI/zEhLkz0i/xJ+KO+6w6uJQY9GpAZpnMTSC3IrsrA
	veJHJ3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDm5m-000000065go-3wDJ;
	Sat, 10 May 2025 15:26:22 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlrl-0000000647q-0LW9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:11:54 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7423fadbe77so1558798b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889912; x=1747494712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=;
        b=OZmAOu5McMlYUIMvb0yd0G/+5V0nBuq5CqCIOaASmnC+Kafm59OwGEVHi8V9/o+eAe
         HKM4cX9A7ElZHe+n2JO0UoHXdGSGdp/950Y4gzOq4/5xHPH3E426utsxsf7SQcXXxJAi
         Lc3YtzzH6W2ZHs2cpR9wDqGeX5UuqF98xHHJmlA8LNeaEHFQkPv9FaRH1nre0yyNgWVB
         WPwjQprW5eG64/vfHBnSQjp6XA2rrpqo9KgAXKs2j4eo+eJjXk3/Q9zWpoh6zij57nij
         WVY71DIupMWtykR/DZQw1C60gLliOaCjnOV2ZUg7tg98xVylXRAk1BtAcCiALO9PNDTJ
         D99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889912; x=1747494712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=;
        b=wIgSSbbPNTNhMBDFqaGNRq/Sqp5AE4mrGe5vqUyWyi9SanJbIiaPvyqjJxhS6/LGCT
         DOv132uxdh6T/BsZcwAweJqqBa+stHsjxHzlyMQAAnD301BdPxxpgBzrBng/dFjuL4+i
         dCcx8ENXN+vTjj8jCY4FFNN2LFNILEm+mXEjGMUPk0gps5yp8kp/m+Ezii+f+9atVvSb
         7knGP2n1JcI0Em1Qn/EszqhPJwKIO25UG4HbvDN3kOO5p1RCz7NEGM+HYgd4MVAl9PGo
         Pc4/dczrl0JgJ7NOqxH7mueQjzOm6VTaxI+KleO7ijiN6QuyaOtu00T/98ZGv2KTlKij
         a9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUZTVgZbyELovBzn2LG/B4rRr7JaioOr/fmssuLgO/xRflXOwZyghC8NzOD/ghwzRpElQADzr5ou8+bRPyJiuq0@lists.infradead.org
X-Gm-Message-State: AOJu0YytEcbVwVtgANXd6qfp8VSETym+fqMl47hFDRdYcthAbvkuh2JK
	aHPSbwveIze42WApPIF5vp0OzlDNrtqyHGVGr7EoqaORwLLDIQZE
X-Gm-Gg: ASbGncsCyvJ2UATO7bdnwbuTPQDMp3KRKDcckhgwaoQLP+64bieD7UIRmcYUDI7i26c
	Z/qmaQahoTvrW04QgD8SaIQc+psejS8jSrDDuShexCTVOSgmx/qCkt972VBVF7I6uomti1UUBoN
	vKgJeC8J35gESL30MpsF/VPG8eaV2UjcWAXnNmP/buRrm/FDRpFtSdwtzWc8/83HzVFQTm9n3hc
	eLr+PKHqouVA6uX4T0f8zq4e7D0T/391lxEXh7eOoy2t4hcZhzmmn9NyD6jQRWg/DsY1+D2UVYz
	Sm5dk+6YIpQqscEYNdTGQLYaiNKNNZb4J4lIT0kbIoZDgr+RykAeyw==
X-Google-Smtp-Source: AGHT+IG1oolXpZC71xiAK1KDLMdOMfFPZFR+zlNsziZN127vpwNtiOQFawx3Ol2KIxb9Dh20vgJuBw==
X-Received: by 2002:a05:6a21:1645:b0:206:aa42:8e7c with SMTP id adf61e73a8af0-215abb03fbemr10867630637.18.1746889912215;
        Sat, 10 May 2025 08:11:52 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:48 +0800
Subject: [PATCH v7 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-7-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
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
 h=from:subject:message-id; bh=rgncqluFC8hqHT0y83Q4VleXE9Vishjne/f3KrvYdxI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yb7rnuCR7Li8wbbvfQFTwLfFVHzy6bxk2ON
 /21Wc9QrAmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smwAKCRABygi3psUI
 JF9LD/9CH1pB+i6CUmG4pNuZ2YBvdZwzfb8JRt6cxM/87YohcZxQbGI/3lrVqHmcaLEWWyFez0N
 i4Va63nsAm7S+vWinaCwzBufEyhbneBRTmL+Vr2hXow7Q1v0ubMg5llq+e11EZIU0SwkenR4izr
 Cf9suozi3ke/QNH6RiOD/8bOHfoLuv2BhefxXTf/PDjO6pWdJqwcyk5SGFOieFpSZn/Yi6pVTlI
 78zH2nSOqAVyg9/JfjPMcE2ilWZUWDhtciYHclc3oh/Zf7UW0KBtevYjTsRfJwag/hB4ESaeDe1
 UjVTqerq9sccgDDRqIGIWbtuCHQWC2ru2ValsaKUr96CIlpBVMoVigMpCymCXW261NWYvYJDWYN
 c5t7jhHYPkw3FOPAIs/38lW/fpfruX76X4uOGcpJAG8II0qJ2IaDOjKGGSmegJhftIXGKer7gkA
 2UUYxAcQK9DlJgLrDNYbvmo/5mRyVI5OyntCY02k0BPCTvoZH9HHeUj9rzdAH9ujEAfv7joVBiL
 YsSw+zN+TQTQlPp7gzmPB5phcoYVhhBMnTSGnf40L6fAT63gMrF+HfPQepU6GPQMPTnqx9oz835
 ZKldCvRWQ/i/QWgGWqpPR7HRThpmRD1Pw3c87goMfWaS/DGX0+jJjcZ2nzx6NJT3MfE+qQhmx+1
 bl++riHSQxrXkUg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081153_128906_75490DEC 
X-CRM114-Status: GOOD (  11.74  )
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
index f4d8da4a8aa0c197cd16af422b33f4cd943d379d..74e9e643cef7f9a3c9ed599da36cf9b04b124810 100644
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


