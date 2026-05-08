Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D185CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9n9228Bd6H5JKp1KPGvBUKX9yk7WrbeWnXK2gI0yqVU=; b=YLjXVvwJVOUg6xDAPGNKd8soT0
	3hZpPXezn2cUQEUaZhYV9OETIIUTyHXzpu4HOj5iucS1LFW/hMWBjXeO3dTPlHwBcYSdlyM/Se9Il
	EHRGBQyUhYP3GrUNXKwAv5Q9wyodnEJIgzqVIREOGF1pAWN6pasmhPxn0G/9QxHsB+KG7p1GcLc5S
	SnnkdAmbyhYHYRobg6WWxNT9KclMxCjOLIjCAPOTBwljRyD4hCm7jIMwnZb20yacRaLxiTglUgC4k
	SDwBWyNALybF6hYMazQaD6vy8WSJJsLeF837jHBz97wZI/5KMHzNK8dvxCmBLdI18sDpwLseup6Wa
	Ypd531AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUN-00000006T4m-3Two;
	Fri, 08 May 2026 12:39:31 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUI-00000006SyO-036D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so2092581e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243964; x=1778848764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n9228Bd6H5JKp1KPGvBUKX9yk7WrbeWnXK2gI0yqVU=;
        b=vnuLR2EuZf0PNg4QKIyMKq7lRRwp/bfOB07q5H0pVgInaWNvB9NDJ0Xs/qW1+6+Onv
         kiNSpL4ngFmZL/7kU0Op9ISB/HYvqqDMUTCYZObdyyf0wPg90DPK4hCL4mAdX8/RWkph
         w8BpKhw584M/UZ5fMjgyR3rv2PSd+iXQUmvILHK0z8wocgXez0x8HxlnYvOyFWEB5zVG
         ZzO7C2vGwdm9e49tBZWw9EjlGoLTfyQS9y5vWi1ij4n1Nd5AH6NtPe0f2n4AbgRHayEG
         sSL4Zt/G/TjrXlQ4G0My0S7qVxwxye5dljtI+JE9FlCNhaWK42YKyMwUVfBJC2XU+nMz
         AdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243964; x=1778848764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9n9228Bd6H5JKp1KPGvBUKX9yk7WrbeWnXK2gI0yqVU=;
        b=HiSIt+eKGIPZ8lVikVSEpWg3p+FJe4AQbC3/kxVBIjCG+XKnLO+eKFqJh0ZFHotJNg
         G/7KLJN1IdtCfIu9wxU1feoJ5tBzXUvZP2ocXlOTXemK4DpLjtLh0LfmVeoWKNtW8g0O
         J4HcWRNYlK+tKQNFA9UEiXkXdPqqSBlT0/0VfV08WJ9Ubj4sjB38fBeHBm/7rbmvPHz4
         nYDgIUHfOs31JumxLCPmgCZSNvUUY5Feo3dBL3UzOQ17yasQzyYTy3Kxv6UcUWM0pcqr
         Yzuf4w2Vx+Lvpenl4oKpYdl3jdY24fZT8wJuq8jpKVJK2F4ac2Jhwf2doxihTyJQcCXe
         OGgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rSREJS61BT6tRi7Y+7rULAhM7h0bY63ZykqPzcd5jAJGoaRyc03UdKysW6H6wHzxZZVOqHCo4CByu6yZ+W7ZT@lists.infradead.org
X-Gm-Message-State: AOJu0YwiibQcqBtv5dTiFVB46Wn0m+A6QdQ0LVWbH9i2Txa5J5fB6C78
	BpGq8S0xcSmsiZO9s242iIgA4uGuwHMrZ8Zs5mZc9LFrvbU2WvJT4obRJ9xk06JlYqI=
X-Gm-Gg: Acq92OEowjUps8CujattnvitNp2haDEqUs5FcsBtgUJNNX/1IgX4AxztI+W6sQL4HjM
	wjfZeedKK0F6BYSc8+0Q46lDG7W9Cf7PdLC6Ov31FGCDQWFZFiI2B5HgMdV9KnTpkSwqeVJWfi9
	79N34qkEY9lY8/HpNxe7uH8WCcdegIJYrh0PvB2/GRzuK+kPa0oHpTRc41zq0rI/BwmJjasQKKm
	yfj9l1GEoO9/cN7kO8xrSguvqCFO/dbKGkT9qZW9Td5ZM2qVkPpk+ePHLmCh15OsBU/Hi+TqRnd
	fGa6Z/MU5e+LGfIexrNuV0szzOgQyviWYneASSmwhvhrgPVi4zMxfYQSHCjn0itaJsz5RkHEr+K
	ZTMz/3lImS1HK/ioNriNjW8Q7XXX6NrFl1NuyRrNnINEmoTwkMYyJAPlncekRf5h3MbXu7dKQH0
	xOR9EGKHVLUQivEFWsxTuIQUEX31CdVSz644MNwvW1xIsxOw5ULl10w25CPJgSJ+8Jmf6cAnM00
	5fPGG4Vvjo=
X-Received: by 2002:a05:6512:15a3:b0:5a8:837b:3d80 with SMTP id 2adb3069b0e04-5a887cde91fmr4509411e87.22.1778243963646;
        Fri, 08 May 2026 05:39:23 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:23 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
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
Subject: [PATCH v3 05/13] pmdomain: core: Move genpd_get_from_provider()
Date: Fri,  8 May 2026 14:38:54 +0200
Message-ID: <20260508123910.114273-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053926_113231_1D93FD6A 
X-CRM114-Status: GOOD (  18.61  )
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
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No change.

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


