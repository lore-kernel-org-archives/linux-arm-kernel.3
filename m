Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B6CC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkIjPnn91/SRZervKGZC0B8yDAzqnA9SsHweWh8Mdhs=; b=cJrU8oYBTmZpj1I0Kug71Ee84k
	j4WTGtJQvE/oHm3MSvjhnrTSUP1ADeecA6KpRqBTAJVh7LwmAXdPo280IPUpORqPFel+cP4UKygDl
	Ol4E0tLRVrhBEXZVjV8NKHImS0dmDtK1kvmuFJMS0lcVRd7e5C0fg7jcNz9rjrCol96FPhpuFip7a
	LVavaIgVC+dmDkOTv4vzeVIy4LYPNYHg2n13w1gwmaFHfUrhicKUL5nAKPwptDpvs+LC5R7g1vxHT
	QA+qIHeSE/37s2XUk0xPjR/IkazbNngDdxkIgYwgpyxLE7BysrCEt4hF0GCSd6hPbP9JjqaO8MQmV
	z2Kr9dBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrtw-00000009if4-0JxV;
	Fri, 28 Feb 2025 04:23:04 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrje-00000009gpM-3bST
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:12:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fea47bcb51so3143611a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715946; x=1741320746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkIjPnn91/SRZervKGZC0B8yDAzqnA9SsHweWh8Mdhs=;
        b=jEj76J8XU/Hw/MAy/s15Xea+hhS6pycli5Rbq58QDM/jJ5HjaouFg/L8Rf2lPY2Hnx
         T63X0F/Efc9i9e+rTFFyDMm+x5QYUd7ZbYfRHPS6WI0Rcj3pmGrylDOf1h0XNeUz6Jlc
         4wrviTUxzHMYlN5i0aNeCgot/gddAPkRqzK8uRlVeiBoMew1wyG0G3kCEyjVi7M0ax7b
         RvKJpq0lwRZCeEo4CNRu/aQ/C/qGBVEwn2LaZTt5n7/Am+BN1V9tNdqyTqSCrcKfs9yc
         t8UOFK5KORA353RhZ9RgyBmtH853HyMhQ+SVjes5FdBW0dNCiU+9xvF5Qp1TykRCWyCx
         CA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715946; x=1741320746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkIjPnn91/SRZervKGZC0B8yDAzqnA9SsHweWh8Mdhs=;
        b=sm7oDMhHobO0b2f50wbkhnLSehPQgdWBWcHH1BWCr8IgSC55jZeorkNY4XEY/4qVol
         oHXvaP0MthTKZprD2cUlLSiYpZQwrsbgSj64m6DGNGm17WnwZWmSnQOx+SdtDOlaR8mG
         N5EKC99G7Vf0C7dm7gHDsQRJXhmk+VDkYgniH3jDQ6bBxf9jqrCHRUBHL0kzIOglO8RX
         CaKoU9B6TcqbJPtV14O/y6iDPTSOYHr1Cv5X/ps/9sTjlcn5cG+hlyn0I71wyp/PsCRf
         D99N7Xws2lwH15cbF/4e6Qd1lAQhJRq+mcJ7+GTjrWt6YcD+i4oB+ztVTlud9OklWE2k
         lt/g==
X-Forwarded-Encrypted: i=1; AJvYcCXykeUkE2K4jNRXh76V/NgMZOIZKMyu3/BK0QCV5ndJzRQFjulWIf4AwTMn/Q0Y75XVdw2NrnR4MmzOGTIYEhTz@lists.infradead.org
X-Gm-Message-State: AOJu0YzYEQVC3qHtlo4LKo6m333Zoo/z/Kxid08uLb74+47MaEPmfWVD
	19Cbc6QcHchqnhfngozlMiZOmJ1Iv8w3rv1YghKcikgHkRVr0SIx
X-Gm-Gg: ASbGncvyj1kI0S9XpWp36xHC+zjSfPz7L/wZ3uvJblG02dK047MSELRLCPdBbbeimFN
	lFhHLiQNEEPnyW+Z20TCjUz6VQX4eGUYvvVenNXUasRL5bHlenMLrJJJJdweFZWPWmzG2gcD8DN
	dYA/BCTpO4mwx/vV70dk+MqiiL794kFNE2bFI/cfdex+by6d/dJEcJXKoceYFMMO7LXdAeCpcNq
	JpAE1wRXhV6ufOOjiVamqqq3Sb4XZKSmI+FI4Ykab2RIJoUyCkaWr1o+xx/YNBIwHzPBBd2cB5N
	sSs9Mi9tC3Me3yD7bJMHMEtc2h4=
X-Google-Smtp-Source: AGHT+IGHEIpcdEcISrBwhOH0M3m872e7avIuk+po2XsNHsz/FvPF88+rn1jimOEudTdFV276zI1J3w==
X-Received: by 2002:a05:6a20:2585:b0:1ee:ced0:f093 with SMTP id adf61e73a8af0-1f2f4e4de6cmr3653744637.36.1740715946184;
        Thu, 27 Feb 2025 20:12:26 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:25 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:46 +0800
Subject: [PATCH v5 06/11] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-6-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ODunfawf7CVe5hX+5as3cMBvBCM9oIodivRV8l+gVA4=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeIh8PCw9htkPM24Wl/Zh/QTeVgaglkWxNlc
 VysG94JI76JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iAAKCRABygi3psUI
 JIddD/oCNTgA7arcUloG6g0FN1Dv2auoakexelhUz9xCaAin3goV2BFzBBzrgyLx/1RrUJc1jAx
 4iosM+43Sn2niLgfuaYE4K2wzgiot9PrXCmT7/GKsO40Ox6GrnaQIa3eR1k0+Xv+mzwYfgpxYac
 GDof7/+DamAVN8Xp/vbH/E5bccEmIBOlpG9FwCR1YnlU1IsEQg68R6TaA2uI/arrxjq1I10z5aI
 Ftu2jI6NnIIkncYiev65c4vupqTnluwGM0tVf0r9qqRpng8w/sYCsj7ibB6kcQ1GxrF6EJw5DX/
 +YfVPt42+zpa4BisT/49FXgdjouDNmF8WO9t12PYKcxv6TN2MySK2BTUzGQnVpkyOX5U0NkObAR
 KdofpVJTBQWmeCiMJnp0oWAv23MN3Dm+MT3w/Tt5rfl7x0belHAIq4fp5EpqQVBUIoLjEuuxwoD
 Vxe5jwJddjAVbOxp/+cx0cNIoSZNi3bzpAMLmpB2N6rebTBULPtWDLvm2aUEB8LmQKlkpRCPBgo
 UMIWEPe3rJYx0o1M0nk8RhgmiNVE1YAF586sWYvptu395XJF9VkWtgwcAalznMx2FhNos419Arv
 dPi20SMdNwq8zhysiqAma33qdVeHlY69Q17Mzt24u/eJrTdbR7YNDvZm+LG2zm7vc30/u/F5DdC
 uD/Zm8N5ETVXPvg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_201226_901562_E32601D9 
X-CRM114-Status: GOOD (  11.47  )
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
index b601d585d204f9e59ad7f5216679b97852a46a04..f98f3e95bfdbb5e9d0fe66357f6037f056fbf25c 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -612,7 +612,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -625,6 +624,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -635,6 +635,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -645,6 +646,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -655,6 +657,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1


