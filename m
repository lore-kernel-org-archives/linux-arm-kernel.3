Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E0BEC1441
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1I/ac7CjNwYFvttLqOBBZxSN0B1UQ8w+5WLt0DDXeQY=; b=y7+TOUs6foV4m2+hsNznb9MEzB
	ixosMlkOl8VaxFbp2MvGoXegoI9/dCRheezXGVKdDsuN+QSUWGE+eEx2yCeVaMXXR98Riwn+F2ZwV
	Ha5HPGNKX/qTBBVllWdTOPjBiz1gHhH7yQLviV9QfZ7qTfUuF+5Z36eIKa56wsl7d145xROrOTkbN
	/wKBl331WO3x+IJfL4qDJhz1C6SI+k757pmw3w7NdW1321E9m+bYS2P4loJBM2zP84q+LziuK+C32
	WAiQHtlQQw3qN8VibKe+21No2ZJbhl8Jib6t9bwSCxZO0sK+c0+w3DB8DwbPFJJXYeU9LnXRI2g3W
	dDwJiBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPin-0000000FDBb-42Av;
	Tue, 03 Mar 2026 13:23:33 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPik-0000000FD8k-3t3X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:32 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3870902760cso93881891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544209; x=1773149009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1I/ac7CjNwYFvttLqOBBZxSN0B1UQ8w+5WLt0DDXeQY=;
        b=MLKXnvp2ey2a31TEGWs0HQwBgeZJAHj77tyPiwaVE6a8sHOoc9pGXcR2j9yAvw6NKX
         N8eYHbRj7bm8UQ0fB1XXpYkhSI0A5OI6y/iHXNClZqJFAIgNKCIW4cu89zJ93XPebH9z
         wGoUutJnkgckoGK6toGdcMUqNEPazevnz1YzhjTqK4sk+jtnV8LyNvSdUR0COYjkx+Oz
         YNYiGTxusgfpYeSbWzB4JE/kslAS8Jso4ykIiToIxUNeW2bxORl6IpicFZbfO9PKJehk
         05uza1G3SnLpzWs+ks9XECiiYTzj01VhtQt3ti5bAlzBlpEweTxurFonIBN5oTPhFjvI
         PFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544209; x=1773149009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1I/ac7CjNwYFvttLqOBBZxSN0B1UQ8w+5WLt0DDXeQY=;
        b=MfijGQNiMkNrqureF9rShM/4Aul7DyyBfXp3sZjJmTZiQTvbMkU7WTDR79PEwu4klV
         7z/KIBvdiAyK+Z8nnr973wqOntqrJ51ZWrnccShP3ARS5dWAdK4+aO5YVA/25eTE3Djm
         XlcbqI8qMXS8DT0MDoiEFAMFcrE4K6uMxhuV5zjpjYe5xGb36hIkUvl+9JLp00VQ2Gwv
         MdqKQRmVJuFvLNaZ+GGG1iRcyRTExv3pJSdeIHraJe9AXoypL37KAEMvFNW96UUbJlrG
         izeGqzrYi2gC19SKhPOpb+qPgNOZuPrkgsCNNwe6gsL5jMerDmu/5ySpe/G0MgZGo6Lg
         KY5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3UiB5hykpguqK/m3NMgNt7E1OjUolyk4ihvJhrVEWmHj6zVZembhCCzGzihDVVs5X/w6MegaVZGrUGJhF0SbT@lists.infradead.org
X-Gm-Message-State: AOJu0YxLnfBFrJAWh/rN+M+P/H0qH/0CxxTI6CDfSoTSKZLS5HhlauUl
	2VMpXZBOwRfBYvnG/tlcYuz2EWOjmVtgMoZKwiOlexy907kl7Gn0CFrlZGlXbT8sy0A=
X-Gm-Gg: ATEYQzyZZ8jnvGrM701DJ2xt9/tZCuoolW4JjcX15Iq4ARQDGHkkETeES4YPOjonY3L
	3Zv3xyGs65lcrdvPvp+6LZukLvj3SoZjk0fg4HJ2h2zphwFm51zNGAke6YROgfaIwIhcPY0zXBg
	rJld5PNOBqKuGqJLQCYL+NXfHjA9gTaVcweajWm2DtslWeaiRQr1tf5oN6M30uBP2+NnpgxI+X6
	StmVX9a56wY351Hqu/a4k+gd4Hxfeb/lxURNcPPoxV8a+gb/fPWA91Rn/oaUZQzFND86dfb7FQP
	3s6WUjQUP7zYid7ZbpxTYP7rSO9zBlyv0bb9wNZQAXjVvMlgcPURn/F0U4G2tj/ssMawl+ODM0e
	n78Mh+fG5WQwnE/zzV9wMt66JHz7DL98xGZUOHvvufRBI+M5PsGepxjwRLwCxqWBmM75jF2cLBG
	niKN/LM7cVSDVkMlxNL94n81WgxT5AMJaXo/Z+Gzp6iFK2ZNqe7zgO1bCVGpvN03r2EqH87K1J
X-Received: by 2002:a2e:be25:0:b0:38a:9c3:f0b2 with SMTP id 38308e7fff4ca-38a09c3f59fmr82542031fa.29.1772544208542;
        Tue, 03 Mar 2026 05:23:28 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:28 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] pmdomain: core: Move genpd_get_from_provider()
Date: Tue,  3 Mar 2026 14:22:49 +0100
Message-ID: <20260303132305.438657-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052331_000981_09B6DF28 
X-CRM114-Status: GOOD (  18.27  )
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


