Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCE2C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3YEUyfDTrDdv/X9cKczpOY/bvfGujRsuEaW/USYXyac=; b=1sThrv0bouOH2U2QAxHEKb7pJu
	n6M7PW5z9P0b/o/OatVdeZUxisN+kaBzyPPJVTiETiWhFS04c3pPpUqWCfzNme0hlt/0T+gz/uM82
	LwceyTGYYfH/9jCS3XkcntRQmmwxbPW9zZ8suiDWWt4BhQu5PS7nmi82uLfEWmAVm9NM0LFMa1xxN
	5+e3gQ02RwAQ4A6KOJCJBGdCAZUxbFzNQsGMfqK7cU3j/0JjdIAXxna3QPYR6HqoZXGLtBreEqUmi
	18CmRBzFQbR//yCXA+pL9Rr8WF3ZuS/fExz0MafiQ/0rcW4MAWcqUyxenwTx/avGhHnm8dt45bM6k
	p3wHiEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoky-00000009qe0-02hR;
	Tue, 14 Jan 2025 21:47:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXndk-00000009h06-15tm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 20:35:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43616bf3358so7513845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 12:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736886954; x=1737491754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3YEUyfDTrDdv/X9cKczpOY/bvfGujRsuEaW/USYXyac=;
        b=QUgzoThKmhhbGTl9UfOkuQ42UHqH5WVQhM3kSeia8hBakSV9zcm3PiIMHXsawMk1Mt
         2ThV4VSJra4+wakpFpmGD1skkXSSSD/dwfwfYurNMDn2UO7uFcCcpFjWCoFtLqGjqJGQ
         h/UYsxaewvGNWl0lyFJvokjKaG64VdnkTbayRSrYS8kg77gohValv8ZCNvBpwpkAwtwT
         mA5QdeoBwgCwjhHkBjS7ahyVaqDQPyccdv8RRRBfApN3+tdYNG1n1TTdolXnJzRwbSBv
         vKnOJfYZK3p2T9Anbg79s21xzT16XG77bIOzna/7gTq96/Bi6A9NOhmcnq8SRpDrfzrw
         U/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736886954; x=1737491754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YEUyfDTrDdv/X9cKczpOY/bvfGujRsuEaW/USYXyac=;
        b=pOyXL5QIOKFNe+41A7PTOh+8P62/P38JTfMIXPe4f59skKeUqLawXvF5uQeh14qi/e
         V3CKaT9qyw9vw65hkMqKU/Jqvugvm80a2OTVjCwPInwrjbFDEilqsHvZpB522nYhPhoc
         hqA08kiofAC+emxvHvtaP7OOzHFHLox4vXJca8/0HCYgHSAE9t/dpVmsn2xZV14TX5r0
         AQ4IutmR4NGXgaNHFHyP/+WK28Z/wP/DfSH02WhXQtt4vefbjZ+lnekpjJIcXeRDDPTO
         ZQiObgArOtfN7h1ChJ1FqOu9411EaH03AEP5cVFSirS0P/4bPwcHZKXf+3JLdis4VIUL
         mSmg==
X-Forwarded-Encrypted: i=1; AJvYcCXoLXHckuRgkrxCpjMhdQCpD3HeevUmcD+CxXXiMGlxNfCwiQIPLFNu6mGKiPwPxVO2JyGGbjSQKZA3lCLQCTpN@lists.infradead.org
X-Gm-Message-State: AOJu0YxKoKzrF736xXHVtKhaHfkIymme9r3aJmprxb1Yi3Ppk8SA/ac+
	8ngksH4zWgHgPanWHeXk3OrFNMkFL+mHAH9VSXbWYboiJuNym/97Bp/Qs3OsoFA=
X-Gm-Gg: ASbGncvffA1JmJb7czvdtF62f4HCPKIa3cy5rCxkResoTh+YugA1GDF5EfNlbuB+rqG
	Vf85tF4kbhBIBxR0TzoomegZXbIxT6S6auX5SsqU/TurLUgQa3WD7jWB86U0saJn207OkwYruWE
	/fMUfTMZieKofSQ5NpoGeUN9XgOeHzJ5attkCTM7tR6udM4r/y19q1zeYfwPDWa67AffJeQo+ig
	KUaXoxuBivRCsUmSEf01UGl0Y0AQgNI9oaedNOdu8uobD0UxxavV3PSGAyscZIAS26wGaE=
X-Google-Smtp-Source: AGHT+IEGIFldZ+L4k4Dl+6+c14xQU/JWpFaLddSCbKXPeGIlOQ60LNvgiaZaK9zGFGqW8cmq+2DOXg==
X-Received: by 2002:adf:9ccd:0:b0:386:3c21:b1f7 with SMTP id ffacd0b85a97d-38a872f40f3mr8004257f8f.7.1736886954611;
        Tue, 14 Jan 2025 12:35:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1c01sm16042789f8f.97.2025.01.14.12.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:35:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pmdomain: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 21:35:47 +0100
Message-ID: <20250114203547.1013010-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_123556_298420_721B6A50 
X-CRM114-Status: GOOD (  13.29  )
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c    | 3 ++-
 drivers/pmdomain/renesas/rcar-sysc.c         | 3 ++-
 drivers/pmdomain/samsung/exynos-pm-domains.c | 6 +++---
 drivers/pmdomain/starfive/jh71xx-pmu.c       | 3 ++-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index 66409cff2083..fe9a0c1deaa3 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -17,6 +17,7 @@
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #include "rcar-gen4-sysc.h"
@@ -171,7 +172,7 @@ static int rcar_gen4_sysc_power(u8 pdr, bool on)
  out:
 	spin_unlock_irqrestore(&rcar_gen4_sysc_lock, flags);
 
-	pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
+	pr_debug("sysc power %s domain %d: %08x -> %d\n", str_on_off(on),
 		 pdr, ioread32(rcar_gen4_sysc_base + SYSCISCR(reg_idx)), ret);
 	return ret;
 }
diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index b99326917330..e3f2c7edf22a 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -14,6 +14,7 @@
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/soc/renesas/rcar-sysc.h>
@@ -162,7 +163,7 @@ static int rcar_sysc_power(const struct rcar_sysc_pd *pd, bool on)
 
 	spin_unlock_irqrestore(&rcar_sysc_lock, flags);
 
-	pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
+	pr_debug("sysc power %s domain %d: %08x -> %d\n", str_on_off(on),
 		 pd->isr_bit, ioread32(rcar_sysc_base + SYSCISR), ret);
 	return ret;
 }
diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 9b502e8751d1..1a892c611dad 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
@@ -38,7 +39,6 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	struct exynos_pm_domain *pd;
 	void __iomem *base;
 	u32 timeout, pwr;
-	char *op;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 	base = pd->base;
@@ -51,8 +51,8 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 
 	while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) != pwr) {
 		if (!timeout) {
-			op = (power_on) ? "enable" : "disable";
-			pr_err("Power domain %s %s failed\n", domain->name, op);
+			pr_err("Power domain %s %s failed\n", domain->name,
+			       str_enable_disable(power_on));
 			return -ETIMEDOUT;
 		}
 		timeout--;
diff --git a/drivers/pmdomain/starfive/jh71xx-pmu.c b/drivers/pmdomain/starfive/jh71xx-pmu.c
index 74720c09a6e3..30c29ac9391f 100644
--- a/drivers/pmdomain/starfive/jh71xx-pmu.c
+++ b/drivers/pmdomain/starfive/jh71xx-pmu.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/string_choices.h>
 #include <dt-bindings/power/starfive,jh7110-pmu.h>
 
 /* register offset */
@@ -155,7 +156,7 @@ static int jh7110_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 
 	if (ret) {
 		dev_err(pmu->dev, "%s: failed to power %s\n",
-			pmd->genpd.name, on ? "on" : "off");
+			pmd->genpd.name, str_on_off(on));
 		return -ETIMEDOUT;
 	}
 
-- 
2.43.0


