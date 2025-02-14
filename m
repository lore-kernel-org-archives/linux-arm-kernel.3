Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2245C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=; b=N3j1MmpJMJYqyxSxelLIyfJhpF
	uGpYodLYA6ledvYvIJHfy0kV+s+3XNYMRlHCj0ww0TlkCfFlI6KBGXs+dH14rDXLVIMX1M079lzFG
	+yqFz68+k2OYLlWUuMlNPGHYNvS1YlByu+qiUY/dxNFWhNe9+mE6pglwMyHkZupkyG4CDm6+cFUuq
	gi26oRDvhYpzDEBE9RFf3SoP5Y3NMqDPmkvPYe1rMsnqGfLYb9e8n3AjAlFcNu1kiR01/uGuceMZc
	YHvHVBE/8qsX07Y9wsWqkT3zr39LU0JQgDxSTf6j2szb5mLyA4fDRl4PO7CIDY3sRMRiyCUzDJPzc
	1ZcuyuJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwqd-0000000FBUQ-0mKB;
	Fri, 14 Feb 2025 14:39:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwiL-0000000F9pS-2X6K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:30:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220e6028214so28720015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 06:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543445; x=1740148245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=;
        b=nkSkOowPAOIu4mJ6QdgTVkTKLWEE1Nxpbq3IqknCL9zmZqzdLwn85XMLWEUlj3p0QJ
         6WlsJL1P0VqZv0zG2YxYers57a71cla+jH92IOLrDDAAMzUvJsJL/ctmO2/cYBG5EW3P
         u0BYGYqoAH2CnxYgjj2J0ukb6NOreJM3rsFVru1WUaXPiI6x3rPNa8M90BA6qizfcacA
         oWy33tiBi1v9+QFrV8BeY9qNouglKzosUSCOx80fXABPPUKofiz0IqNTZsYY4DLqNYii
         W6JRHCoe7Mo3BKpkjbPwEnbfA9DG3n59s1OtkzkRvttBFa0cvaPM0yo3FO1yBJ3WU7kR
         5bMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543445; x=1740148245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=;
        b=DSX7LBqMLJMIe9o4JXq/Qmplfq/QXD6uLkvqsaJzZMO9izKEoxPgCzIsMZ/g/pmH0A
         LZEcCe0SD037y0ykxIyMACIPdSor6+T90QzgQvn5OYP+BQ6asxUEqRe/PC8qLW+iXzZx
         j0EDi4huWK4viNcwI+CYfmTwCnH7/tTuynYCWt/wVMZQBTP0kgbZYJ6J9HCPUF0laqxB
         MeERc4UkKiqYyuYk/vVM8gQP7XWfh+VstellGcFeQ5ihNHlH5wctB6/8bJJdCV3cipnt
         S1pGMIdD09/G1wMN1YCasiBRb+g2afJShAMxbdCN0l+mUXQtjmHOpNTgSlOETBmxpse/
         c+GA==
X-Forwarded-Encrypted: i=1; AJvYcCW5KHLcn82N/4r+gqc7dNGe5PeCqOZTYiEvIuKVViWRaiAce4wgua3tV5M3scfhCllqrCJsQxNrjCjcoQ3lu9rG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+m6rLBawwtWyQhvFVeWYR0lh0LZWszfQyaW5Nl3t1ieEBboE4
	/miBiOlAHyat1ViEMCKr44Uty8bwpOesMD6TAnNdAW8+ZMahrvdb
X-Gm-Gg: ASbGncvBbc4LjQFQfeIU5VSuPlmF49TZ0xhdwHUMdH1+Qz244JcPCGjVF1Jp3/UIabY
	dK7tCD0m/YADe14ujstupfW6TJKZ38HQExxPfU787WWTl1NEZimC35V2LtJZI53ZioJuHDM2hzM
	S6U2dMjBLK8M2X4uAomzMzjYw+uE62RJip3p5KjA7z2ppjb8/9W2yNE2p3LvbIn9k/EiyAZc9cx
	U+IHG8y3+aS7EVGO9VWI3vzZwlW2358eINPejytTuMOn+2CYUtooLKRuiG9JctgH4hfyz8h7Hbn
	2vYejWw8nC7fT9X09w==
X-Google-Smtp-Source: AGHT+IFRr54NQGh/IgFm9UJ+j+G6mFUuuYOyOtSYg0bwbWseWMm/5RMmaT7XUoR1sxFLmmR2C3cCYA==
X-Received: by 2002:a17:903:2350:b0:216:410d:4c53 with SMTP id d9443c01a7336-220bdfed345mr189976225ad.41.1739543444569;
        Fri, 14 Feb 2025 06:30:44 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:44 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:31 +0800
Subject: [PATCH v4 05/11] drivers/perf: apple_m1: Support
 per-implementation PMU startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-5-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6YoEPxJ23tlB05Hr5lEn9IwiUxu3JyxaBoeQXV7L+7o=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1OARxgd3D8G0gBs1fVW5W1xQkJOrG7rToycf
 qFi8+KQB+yJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TgAAKCRABygi3psUI
 JA8zD/oCREdDsqvpz+u5NdKYTBBxaf5oGFqwWIjo8D6W1NxIjU38x5hUAaqm0rDKPyPI5EI4Iog
 SMLIRHb9efzNadiYddp/P+y/5m2Eag7+F30WnxRpPNrdpBYix/vyMzCoxl+RzMY5B8l+eYC+HLy
 h7k+Vjkn0Pw9OMZ3qUF57pWV4iBgvQecShwPNjQ7AAhC8fiQqQjMHJec6+fCllGR8BlgOQvCQd9
 KM0v4GCIyFnvSZG4gUNKqvkBc9DReuHvE9qKtu0PQhMnoGlKag9AAHxSE98ZbDoHRnyENW6Ww+Q
 R5/nM/o7WN3KVqrh4sNKN0E7NtA8gNx0K+AhPveEnxrZleME+zKfLFzvYQLEY3xwHIWPiMJQGgZ
 4goZ08rZ5zlGU0NLTK+db653yIrp/zht+pqJuYMJPcrQszCWACEkwfLRgZspy7W4zXcWKkfYOsT
 w+QsznZUU90mHFQU1QRe6g0YHVtm4RaOPVWOQvzgEIYQCllqntlCRjqGU1ZcgWFAT0KbQivc2mn
 z3zbP/OQPBnzL+nQG/ygneSGzh1uy2iA0pFfX0c945SzIEQ+0LEr12/aSSW9wDUbZmjYf+0ZjPZ
 mMGbCgWSxJufQoQ29w8cnpjHeo5HdY1gBuux2zZDzgXozqtV4pO9+yTHbqjWXXL2bNcw2fomT9X
 a1Ip3ibTj9oijog==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_063045_647530_27A4962B 
X-CRM114-Status: GOOD (  11.36  )
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
index 73ba9861a15ff931b5e388b6d809dedb140e2292..b601d585d204f9e59ad7f5216679b97852a46a04 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -608,7 +608,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -625,6 +624,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -634,6 +634,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -643,6 +644,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -652,6 +654,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1


