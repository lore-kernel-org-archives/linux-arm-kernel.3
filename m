Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F651E99076
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nm+wP/DxtqDeb0bHdnh1xnktH2NnKja4jlZQ2gGkpXg=; b=1Z4+basIxNOpbmrlhtc9U37SU3
	fzRxdM9RlTh+ddpF1eCT5USULvoZjnS9vETIpc5ksQ9uw9ql0Tanpkml3zxphude667UdHUc2ZxEN
	54c1MWxCrVR8VEv9+3IcfeWnZ5b2so/Ib2fno2XUllkxyunv8C4/jjjUt0t8r9ajaRt+gVv5fPtp9
	H5QH28GWrruMv8h/a3GP3xNQKuqBm9e4zu3691xJG4iLLNDTufCE/Z0FOPAWV4pVIyJ8TJAJelINj
	CKmxejEMkOL2NIgz+diQsy8jJT4Ujm2h+Bu6yCFwSs0Fh2aR7zvdXbOF19j6jHfjNGvr57ln/WgE7
	o5Gus0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ib-0000000C1J2-1tmf;
	Fri, 10 Apr 2026 10:41:17 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9IW-0000000C1FG-37k9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-38dd9c6840aso16060701fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817671; x=1776422471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm+wP/DxtqDeb0bHdnh1xnktH2NnKja4jlZQ2gGkpXg=;
        b=g/3CPwuFNdDpVm8Sd1JPPYtuODcjnh/VDOwANM2Pfqx2R1FvI2sZc5PM7fRtS5fSv+
         PfF4xGiiFuoqwzVFbp3x6auninhmYi4NYQJGCgxvtTykUnF+Pp+RVJ1rcAfopiv33gMO
         akeaw43Dtejl7KoBbVCn9VDIjPALstq5JmnwoWBoaEHQf+QBbfvNPfg+6j548dG2ivFd
         vu1YiTs+032v6XGOvA58q8ORO3XDK8ZXxMgisdXoko+rCQW3Ol2BcA9xRp/vK2YBb4yN
         kADY44ykfBdBZukAqfjyiU50fOX57IlIVmJ4GW/msA0hYi7cqm+4m+t1EJoi9kO6Ygle
         Vhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817671; x=1776422471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nm+wP/DxtqDeb0bHdnh1xnktH2NnKja4jlZQ2gGkpXg=;
        b=f85m6YtdMHv+U7vXyNQranrNo7Qu7VLJRrxvLtwlE0L3TChAdIXb6H2yclbOWtEZhj
         9utO+uMwsfIYZkz9GxlOpNrlV/WDS88zlDOZDiLP+70Rqw85v1kHr5U3tGEzRjZyhLjZ
         3Zj4/QZkc8SwTv8+pdhBzX2HynEJ6sU4Eup57c+UJKHSxic/Vad3jEyDYE/r4Dl0KPdH
         eqSAT47/lrnnCpJl/vNE5h0/9vxPQ4kl2E8LYh5pHvr12SwXbL4za4gazPCcRBn8sYOJ
         PuqtBzCB1Lpe3VGlL/TQjkrXkkLikEXRULz/T2fMVmTh2VlA1Xo2uFyHI0DembXYjg0c
         Eztg==
X-Forwarded-Encrypted: i=1; AJvYcCXZnZDw0deuSE5R0w3INaX0oqhVh4a0iFDmZS4Fhqcv+d2UHc8SVLqghq2IXunR8k6nb2sSXfe2nUm3syzS12KV@lists.infradead.org
X-Gm-Message-State: AOJu0YzTKmJOeSi4Pzb1old3Nxdq0AmvzCu4UH+EpuQFIll/IatOGvxr
	lViYyN8l0gqArudBMryI0nsnxT4HNeKN/K5U1tldlNrltLZ4Hk6sHjnDHcCQ8CzqMHg=
X-Gm-Gg: AeBDiev+vxFQcwnJtwki4vFC2NnkwnST1J4p0j3Aj1LEdUFIBeECBx7WFidVRIU9ycD
	wc6Fpf/ppvvBXLOVDuQl7c1o8ZI+LTpAjOolKgL/y7Vwy6G726mG5zVPznND8wMrR8lzdswPFry
	mKzq2a3nnQnxOVF2jEg6kZ4wuYF/clukOBzhAiqAm8s2rPof4jUOyCwNl5A5CsoDXEV7NYO/MWv
	YTpLtGLRrELqUCcAaz/F2pzx0IxSSUVgOwk7u6LsJ1blk724TmfUxE80NmF1r2aZele8x+yttvS
	54EEE3J/DTIw9edu800kK8TJ8g7HqI5xoSmPhSI7qzPGidRqVAnfiW4BX2QdzTU8YOaApMTaYOY
	U338VANVgAhOFld8NuYZsCseZsipLs20qAsTMV9rJvMJxBSfMFC6p8ZjWw0AFgL3C9xVxXpGA77
	OKEvEhH8BuQmmhy80O+19lEX2Zu2eRHa6j1jLFjO6jEK7PsT7RoAi2x+4DF44KMVsTYu1+EzBJ
X-Received: by 2002:a05:651c:b21:b0:38e:2445:fca2 with SMTP id 38308e7fff4ca-38e4c052e2bmr7575221fa.31.1775817670439;
        Fri, 10 Apr 2026 03:41:10 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:10 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/9] pmdomain: core: Move genpd_get_from_provider()
Date: Fri, 10 Apr 2026 12:40:46 +0200
Message-ID: <20260410104058.83748-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034112_813717_1F2994C6 
X-CRM114-Status: GOOD (  18.19  )
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

To prepare for subsequent changes and to avoid an unnecessary function
declaration, let's move genpd_get_from_provider() a bit earlier in the
code.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 70 ++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 4d32fc676aaf..ad57846f02a3 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2664,6 +2664,41 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 	return ret;
 }
 
+/**
+ * genpd_get_from_provider() - Look-up PM domain
+ * @genpdspec: OF phandle args to use for look-up
+ *
+ * Looks for a PM domain provider under the node specified by @genpdspec and if
+ * found, uses xlate function of the provider to map phandle args to a PM
+ * domain.
+ *
+ * Returns a valid pointer to struct generic_pm_domain on success or ERR_PTR()
+ * on failure.
+ */
+static struct generic_pm_domain *genpd_get_from_provider(
+					const struct of_phandle_args *genpdspec)
+{
+	struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
+	struct of_genpd_provider *provider;
+
+	if (!genpdspec)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&of_genpd_mutex);
+
+	/* Check if we have such a provider in our array */
+	list_for_each_entry(provider, &of_genpd_providers, link) {
+		if (provider->node == genpdspec->np)
+			genpd = provider->xlate(genpdspec, provider->data);
+		if (!IS_ERR(genpd))
+			break;
+	}
+
+	mutex_unlock(&of_genpd_mutex);
+
+	return genpd;
+}
+
 static void genpd_sync_state(struct device *dev)
 {
 	return of_genpd_sync_state(dev->of_node);
@@ -2889,41 +2924,6 @@ void of_genpd_del_provider(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_genpd_del_provider);
 
-/**
- * genpd_get_from_provider() - Look-up PM domain
- * @genpdspec: OF phandle args to use for look-up
- *
- * Looks for a PM domain provider under the node specified by @genpdspec and if
- * found, uses xlate function of the provider to map phandle args to a PM
- * domain.
- *
- * Returns a valid pointer to struct generic_pm_domain on success or ERR_PTR()
- * on failure.
- */
-static struct generic_pm_domain *genpd_get_from_provider(
-					const struct of_phandle_args *genpdspec)
-{
-	struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
-	struct of_genpd_provider *provider;
-
-	if (!genpdspec)
-		return ERR_PTR(-EINVAL);
-
-	mutex_lock(&of_genpd_mutex);
-
-	/* Check if we have such a provider in our array */
-	list_for_each_entry(provider, &of_genpd_providers, link) {
-		if (provider->node == genpdspec->np)
-			genpd = provider->xlate(genpdspec, provider->data);
-		if (!IS_ERR(genpd))
-			break;
-	}
-
-	mutex_unlock(&of_genpd_mutex);
-
-	return genpd;
-}
-
 /**
  * of_genpd_add_device() - Add a device to an I/O PM domain
  * @genpdspec: OF phandle args to use for look-up PM domain
-- 
2.43.0


