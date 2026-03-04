Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FF3EFCE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbrHSPPxep6X+vivH1+ezOTNFT57/EKHgyG9LJdna2A=; b=oZ78oj0PUZdkr/oF6vqp6GG0Aw
	n2ydhD9b/+jsxbB5fO1zWIdjka8kCahAOCyctS2H/97PCrd/bN3FjrmBfMIo18c3zFZnzn+93wjEO
	F94Ctpn5D6z1hcF23TYzyeQCa5iWuG9o/ZA+qAeJ4ywM2CJ8bCQwKoRXLwHaG0tkO+iuASCg2I2hs
	Qtr5/PyOTe2ZCapLVrULW2Xj7xzi21rZKGfWJayQdm1a853je2yhfuvZf3XaDjSoz/GkkfH14TFWL
	nyyVfzcib2/9P7IKSBfEMfgv/CDr9Mh24XvjJj1wTe15dbib6Gql5BaOACwE6k1kaZUW6OGj3JF62
	wbETO1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqhA-00000000JMH-1S4v;
	Wed, 04 Mar 2026 18:11:40 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqh8-00000000JLC-1GAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:11:39 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8272c559597so7158834b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647898; x=1773252698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbrHSPPxep6X+vivH1+ezOTNFT57/EKHgyG9LJdna2A=;
        b=Ips51icFPPsiluaIGBhc2dpzkqm5ElP0mSlJs4MHGDarssEJO0/gGhVo2yAUfzOq0x
         EnAcAHW2JvSwmxs5cR68gO0Zi6+iBJgklnjL2sP8Dlg6CTcq0dPsGSDEb9Ah8CNVQ36+
         i97dvpkgJFoBkKl3gnE8HqVqjN3bSdfRNhIFkP8mJ5cpCBzEBQ1vatnFSw//Kz0dUR0h
         sk24yjIjeu/6slPZCLsvHYYIS6PnOVmDGOT0KJzMA/Rw0Z1l07ynVZkMjSzTRKV0p7Im
         Ia7Jn8cOdVvcQ9AxR17xhaCGQU13YEWHLw3WR//EyFt+WqhpSwomMArqzSuRYX8e3Mkv
         T0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647898; x=1773252698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IbrHSPPxep6X+vivH1+ezOTNFT57/EKHgyG9LJdna2A=;
        b=qNTtM36A/11ZpimUTiFTCbQoMJfzVWXuftkPuVO5bvwT3JRzmOIAaBxF48t9dIalrV
         7XRlUSJifCErrCkTZaqa23Sxs1tZDIC6JWftiivUSH7CsRjbf8JQVoX/sjpo7NkwSimZ
         1q3hoxQ0jfDzdBXcU5BY55P82cB7Eet+C1XZQry1Lp1Fe/VX47FWeS6keA/xumdqJdkw
         Ljg/m003f4fDpdguEfjrDY1Kg6zOvv7E3NjXO/b0G20cA4Ajd36icOfFPK0LXSB26Isr
         96IAl4NYvLIr69Ca76YpCC4EqVz3DWd7aTEe9/rsmtzThB9pOW805tcBhJJ3wErB0lgp
         ab9A==
X-Forwarded-Encrypted: i=1; AJvYcCWJEcEEDgTLx0S2EPEvndOxWhcloee2LK7bo1F3Q2gArRzT08RFdbxtwT9QuMOojMEVYj7Zf+cDCPdLHTsYsjqa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp3X+XfcFdln1fd9djFrUyRQ8G3fPL9CUbrVqKSwtSJU0Rj5ix
	WakP1HjVXGFuluJfUEhqhK2c6xp1VEpuxLwhIKI/Y7HgO1eCU9F5VVgt
X-Gm-Gg: ATEYQzwsoSujI939q0vuIN4WI7h2RS3LyORxp12yY2Et6TqEmoELAqawjJn3pPUxuwS
	9HHnt47agxeyFZRIDNtrmw/kj/sUoXiBZY3aWcm5ESm2LwZOSWvVffzlqKtYp7DjJ9qDYhmkdMX
	5w3OhKHKIehtvFyEV3pazLByYBZRPV/qkvZyHEIPDQFOn/tO0ars5UkC4eaTL4W3Ap84Zh4Og8H
	Wk0RfwF4g0u5nc4gy54wSpFmm5UkLN0rnXMYGZLCSErm4udR8pW1QzenIFJ3eGPhct5P3DuOg/O
	Qk861GfQWUzKEwAupxcRedXkWN3VqKgmPv+L3KvmIr3C1GNvkQA8dlQIDV4ozW1qqtUkgOFVP9/
	O+l/MYcy2/r/fy1G9pN2zyENTPb0OvHuqY7HyBigy/GYkuJaco1uGxXa8qxIK1LW1Grm+4RaGLd
	XHrOXMKoCXXNzD7NEn7LrGlMsyCiOvSwk844mB2ATdLasFt8DDuR+csoQ4a3RNQtLflewrhl6mX
	O2PqphzAPWOyuVwJg==
X-Received: by 2002:a05:6a00:130f:b0:81e:2bca:d133 with SMTP id d2e1a72fcca58-82972b49983mr2518364b3a.24.1772647897597;
        Wed, 04 Mar 2026 10:11:37 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:32 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common probe/remove helpers
Date: Thu,  5 Mar 2026 03:10:22 +0900
Message-ID: <20260304181024.738391-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304181024.738391-1-akkun11.open@gmail.com>
References: <20260304181024.738391-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_101138_344928_EDF00108 
X-CRM114-Status: GOOD (  15.47  )
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

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to support
cpumux clocks. This reduces boilerplate code in drivers for SoCs that
require cpumux registration, such as mt6795-infracfg.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3dfdd3a422f8..8148c21e6099 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -19,6 +19,7 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 #include "clk-mux.h"
+#include "clk-cpumux.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -513,6 +514,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
+	num_clks += mcd->num_cpumuxes;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -542,6 +544,13 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_factors;
 	}
 
+	if (mcd->cpumuxes) {
+		r = mtk_clk_register_cpumuxes(&pdev->dev, node, mcd->cpumuxes,
+					      mcd->num_cpumuxes, clk_data);
+		if (r)
+			goto unregister_muxes;
+	}
+
 	if (mcd->composite_clks) {
 		/* We don't check composite_lock because it's optional */
 		r = mtk_clk_register_composites(&pdev->dev,
@@ -549,7 +558,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 						mcd->num_composite_clks,
 						base, mcd->clk_lock, clk_data);
 		if (r)
-			goto unregister_muxes;
+			goto unregister_cpumuxes;
 	}
 
 	if (mcd->divider_clks) {
@@ -605,6 +614,10 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+unregister_cpumuxes:
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 unregister_muxes:
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
@@ -643,6 +656,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
 					 mcd->num_mux_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..02fab4b166f2 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -252,6 +252,8 @@ struct mtk_clk_desc {
 	size_t num_factor_clks;
 	const struct mtk_mux *mux_clks;
 	size_t num_mux_clks;
+	const struct mtk_composite *cpumuxes;
+	size_t num_cpumuxes;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.52.0


