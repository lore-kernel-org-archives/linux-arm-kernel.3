Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD82C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRhFukVlfvQMsLzBFVuMG+Qi50dL1WntO88bS057RO0=; b=K+x9npa6eFiOS81JXqrbegsHvr
	958vZyRHQGkwlCfF/F8lcyqNXcu9D9CtAbZ5WogQiZAqavIPueI7WDPfNcatWhSlphC6Vf4JBJt0V
	9ovR6Iv/2VhDPufQiTvmoRspc0+fsmjCPdMJeCQoOttyTU4BP6XTQTpovsBVZGkF37e16cR/uoRX5
	8D3pkz+jElLkkmROPQ22q6FeRALbGVKYLEJE5LweUOSfNyLwUmX37CXmMRtl7xakcGyJeYzRQbYYh
	DRsgtVoM/N+Pn0wcapuuEbEgg7y1tL8fJzaIKN76Md7snBSXyHIxO/RLX62vXpPibYbimEb6N60W3
	lSS6CJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCGL-0000000Ef3r-2kjR;
	Fri, 11 Jul 2025 11:49:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCDz-0000000EebO-44Z8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 11:47:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so3546230e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 04:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752234450; x=1752839250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRhFukVlfvQMsLzBFVuMG+Qi50dL1WntO88bS057RO0=;
        b=zqAwSvkfPFxU+9la7EWKPPmZYgkbOfbvdyKAjHXuX/5nJ2PcTKUP4EwuSLYmbVIREH
         f2gV022K7zJH5urQ49VbLYwV9DAWJGK3YcDiiNATRP26KfmQllEpeLFq8dUBGE7R7sIh
         Za2O2lPgTx9+4/bZaLcm0k2OslKn9QLt5ymD73+3McMEUPuscsdnNFzw/SIyRVfMlyA4
         EWhITflKFW5MGHbM89tITaOIG6Gin2mOoGNL8U7jBj7MbC+RCqJxOBuBb6mXZ2rQ+b99
         qNn/73jVw9HpBFYMgLCe1rZ/Bkt/dmsZmZrsxIpypm+cm5/N52PVmjBfiil0X27L9dFx
         mrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234450; x=1752839250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRhFukVlfvQMsLzBFVuMG+Qi50dL1WntO88bS057RO0=;
        b=H+Nb+6k4j1o2W7jikPZqx2RQ4tx9/v582fWuSAnGcQ/Cw3000DB9Hr2rzye06kgMt2
         tBenSpDVak6tfRRybT5qsIdlu3kbWAA2soOZK/joA6DPgpBJffPxVwupiUZ2XLuqCKzX
         tooXRfhGfmbuX/r7i1NKukctvPbJB85D/1SAog3MV4tE3JUiNs5Gxx+nVNJKuyznFqGo
         DlRDKsqU1nAYXDBjoDKl5WfeLNXk6Y31oHj16j4fPVNB4mma9O8hgfsMGFSkHLvPqzzN
         Nsy9NdlACNr8A71WVpPsV5TdAIYFh8/4jvvzCU//AUdtEh1EEk+hnxPDa+4mDZ96x8Z+
         Az9g==
X-Forwarded-Encrypted: i=1; AJvYcCWNYT52yJGpf6RFjowGO9jfNy0pk/djKqorDy3H4IENrU6ChiqmRZ9mHRWPNKpClm+Fi2bED/kiN5QzudcVY5bj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5rrCS9y2SqT+h2MNdDp2Q7YkMF9MftgTMWiNWnDzmbecY5WrL
	sPoPEyuVYLsVTzYq+A1hxl9SyHVL2/0HKAEb8djNLT/597MR184SpU07ilE2T9c1xnI=
X-Gm-Gg: ASbGncvBInOEojCds5ryBnEf3r6GakUHxwenQwvbmS1Dc4fiT8a6qFXfATFcGa8KJtD
	rWFII+ot1ULu2cnrjmQ2/2uwpS7FU+IcZuCw/mPM3G8fUGDvr+1zNWm2BF1eDB69ag/jQedkFz3
	OWKDm4pNmk/BvBUixHPwgwYl0+F4x3c2w0friKFs/NxC2LE5D/fKy0wnzapk1rpPcjNkAuhARUI
	4MNMcwXJOHjEP7rwDipasewPEsO6u1r/9ThBV2YcumRqB2E0ruSaCQy7QOFrmiq45bJgbKz9l5a
	eq7gewFaf/2Ya9RfxBavBmjBTCJEUcoYHEsb26wCaXOuGk6fXtmARUll9jrXsZHh98K1kBbsQXr
	9jLociORZVVsTQlUVarKMm4hgkoBkW6F03HaBPNLcq+PSxHLhDu35eJg5c+UxYIVF5ucaDvx0k8
	g7AsWVxV8=
X-Google-Smtp-Source: AGHT+IG12UDrTXalEDU0YKI0OWyt7RE273XbDSoBAUX3pRGix+0Sj5LWHFUpgBtVPKp9Q0+KnL0ueA==
X-Received: by 2002:a05:6512:3405:b0:553:243c:c1d3 with SMTP id 2adb3069b0e04-5590071bca8mr2492286e87.18.1752234449986;
        Fri, 11 Jul 2025 04:47:29 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b60f09sm915928e87.154.2025.07.11.04.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:47:29 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: samsung: Fix splash-screen handover by enforcing a sync_state
Date: Fri, 11 Jul 2025 13:47:19 +0200
Message-ID: <20250711114719.189441-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_044732_020745_EAF09513 
X-CRM114-Status: GOOD (  14.47  )
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

It's has been reported that some Samsung platforms fails to boot with
genpd's new sync_state support.

Typically the problem exists for platforms where bootloaders are turning on
the splash-screen and handing it over to be managed by the kernel. However,
at this point, it's not clear how to correctly solve the problem.

Although, to make the platforms boot again, let's add a temporary hack in
the samsung power-domain provider driver, which enforces a sync_state that
allows the power-domains to be reset before consumer devices starts to be
attached.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 9b502e8751d1..5d478bb37ad6 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -147,6 +147,15 @@ static int exynos_pd_probe(struct platform_device *pdev)
 				parent.np, child.np);
 	}
 
+	/*
+	 * Some Samsung platforms with bootloaders turning on the splash-screen
+	 * and handing it over to the kernel, requires the power-domains to be
+	 * reset during boot. As a temporary hack to manage this, let's enforce
+	 * a sync_state.
+	 */
+	if (!ret)
+		of_genpd_sync_state(np);
+
 	pm_runtime_enable(dev);
 	return ret;
 }
-- 
2.43.0


