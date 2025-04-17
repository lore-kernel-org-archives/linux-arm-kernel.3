Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B92DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAv5QpD/3W+QIUIAEsxCNkQa5aZqJu5jR8/2XBRcQ9U=; b=NNNl8XxIIgK0boz6Y+K3uupnF1
	DtHFc3Y4G3JTNPq+FLFzgf9WYdulR/pRKyn8uX0ygtd/WFbYU/ABmG2wmZvJrbfFTgeN7Gr4hY1rI
	K56SqT4LF369hyCYLhGntec4kgHoC+6DuVoub6dEwMaiGCqEy/4gKexwg0xHlPSBXVUI3QPTEkgYK
	+6rtDcxVDEpzr/yZg1i9UHEwwkTUPFhYvPpGp87yxjzDtY+Z+6NYq9cVb1BmvYcjZSqIEh+tKDxVZ
	hmouuCbGL+zBX4ScfsUto4J1QpSkLOdP7ZimzZd89vwrhpIcyrVabBK+i6HE0A3UnvsWKTfF0c4IG
	vB5gEguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QHe-0000000DKa8-3qQB;
	Thu, 17 Apr 2025 14:32:06 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBM-0000000DIdp-1n9m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:37 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5499d2134e8so1015022e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899934; x=1745504734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAv5QpD/3W+QIUIAEsxCNkQa5aZqJu5jR8/2XBRcQ9U=;
        b=LXTb+u2ajyC37xUhWm1iksRJd2oWG1aWHTWr+II807u8O6EauU7AwEXgt+zyzJlP16
         c7D+kvNXmZhJuz7p/gnroe3M4CqVyeUllfwZVakHxe/kqEeGBJXfmca34ISm0gDoeYNr
         heNgeGw7JFfLC+zD73V6/b0j160+0LTAWlwlNJtAWS6H8Gonjl3xJSz6s1EoT/Fh3Ccd
         CmqCVRsRMtAuJ2SQZXhAZWaMA8xdpNcbjEsQzIpyhltRLIHkFcYmCObkVO9Geg0MYP/E
         AYJceAi+2f9uQa83iyMX3aDA5vwd5vvCPx92gqrrSab7va2C+s5Of0Sa9eB55zyCA9XE
         9DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899934; x=1745504734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAv5QpD/3W+QIUIAEsxCNkQa5aZqJu5jR8/2XBRcQ9U=;
        b=M7xkuKQIEVw8pOQpoe5AXj43/IgItynm6FxIQOAZ7t8YqUYXCY8V9Hw28rgFkEibuH
         8T1Ax7FZrDM1zERhVd7QhU/yfBh/xyVWZtnrImzJ6v3gqOD3XpDe0eF7HZlnansKAv2K
         0fsor+Cmkdvxe8lXvSyjqly030y40Lxu1aOnHLb8hoskYKAQTgAU56K4i1y69r/XaWFA
         w9tFmWL1PcYjO3j2I65NgMfBzGlgkLgJtt8a7qxehmhErUVZo1vdNVHdmZ/C/tJNSoXS
         0kD1jfxs517yFA1nq3J4JFQI60rkaigghzYq8jTnAkKjbstUsxjMnwLXGKlw0DeEQ8C3
         h1sg==
X-Forwarded-Encrypted: i=1; AJvYcCVBjGzAYXyeOhT+318fIFiypOITnHUhLvJNflEKCEjqAnIH7oydm/lYrkDDOmyMotaqscL9Png2rKy8zCA4uVUr@lists.infradead.org
X-Gm-Message-State: AOJu0YzKVnoBPcrsCj+CTJzd1W515aIcosz4Hxp0pFhI7o/tkNGlArIb
	4CTPFMgzJ8jeLQoNqDp40AvJES6Vz99AJjbujCZeCPc5SKAYerSftijPYeeVhc0=
X-Gm-Gg: ASbGnctEXkL0/gViJqeftdGhM8gve2JIFcgFIh+mT7MlzOOFT1ab0EpHd5xGc3PuyTj
	Nrq0zUPOHNW+8xzE4vSw8HAoGOW1LwgKjQnfpHSMFRT6CU+8fnrOdq1cgL++QPdKRbdxSAGA4h2
	h4H9AIHxKBDMHoX887VkRjomBX9pCTcHXjSB+85IASRy/djaJOCJL1zfgiZtiHUaKYpTQ+WLEj1
	ssmV8miHog/4oyOgWvzzjtup58xLNEuNJCsGHL5TNAANZw14YZKQm7m1R+entkPNRBovFABLYZ0
	L+JB6vLsBKXPL19dc0EDzbERdahvOAAci0q3YRUvtTx8996okNVtwPBga+JR73FJ6e62RVrICbc
	7VOztuSEo6CrfsQY=
X-Google-Smtp-Source: AGHT+IEdRb+byxDtsaF938ihBQexYxdm23PnPrnwFBeiHnuU4i+1SkPOaDcL0cyZpoToJUlNYAezMQ==
X-Received: by 2002:a05:6512:334c:b0:54d:68b7:86da with SMTP id 2adb3069b0e04-54d68b78b62mr1388539e87.42.1744899934579;
        Thu, 17 Apr 2025 07:25:34 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:33 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] pmdomain: core: Simplify return statement in genpd_power_off()
Date: Thu, 17 Apr 2025 16:25:00 +0200
Message-ID: <20250417142513.312939-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072536_462927_E633732C 
X-CRM114-Status: GOOD (  13.23  )
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

Rather than using two if-clauses immediately after each to check for
similar reasons to prevent the power-off, let's combine them into one
if-clause to simplify the code.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 574a0de1696a..34a85bf347ad 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -917,20 +917,14 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 
 	/*
 	 * Do not try to power off the domain in the following situations:
-	 * (1) The domain is already in the "power off" state.
-	 * (2) System suspend is in progress.
+	 * The domain is already in the "power off" state.
+	 * System suspend is in progress.
+	 * The domain is configured as always on.
+	 * The domain has a subdomain being powered on.
 	 */
-	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
-		return;
-
-	/*
-	 * Abort power off for the PM domain in the following situations:
-	 * (1) The domain is configured as always on.
-	 * (2) When the domain has a subdomain being powered on.
-	 */
-	if (genpd_is_always_on(genpd) ||
-			genpd_is_rpm_always_on(genpd) ||
-			atomic_read(&genpd->sd_count) > 0)
+	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
+	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
+	    atomic_read(&genpd->sd_count) > 0)
 		return;
 
 	/*
-- 
2.43.0


