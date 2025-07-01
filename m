Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F12C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZOLfR72PXqOLw5WtFWDE/MmTe35xsn3qkEJhynzf0Q=; b=OtcJMsz5Gmrr1qMna2t3iavcE2
	sNfo5+orgK/nZwhXfF+s/Nv+Zpz5fgygoi7dbZjuFP2TN1BQ/UChU6AUmcCltmSqcx+tbxvceGuO4
	61plkQ0T/i+gj+SdYSPJe2gk8so8a/pecs6RMuRsRNIsYixu10kidm9hmIfREiGXdjG5HPDMhSi6+
	PWxu3PaXwcQ6QPYYTZja4a55DUNW4MJuPT8R+ySnPNJO72i7wxrSGoMSzuLJleUzqJXf7AQraUOo8
	r6vsodE57skR2bdKaL/VS8QxACTjSID/FwGr2rehHGnQh2qm+rFdidWEemmLNIK/zG8jV/ndYslfv
	XFe5rkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZn3-000000053Et-0ugo;
	Tue, 01 Jul 2025 12:08:45 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSp-00000004ucz-1Mdq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:47:52 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55502821bd2so3663103e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370470; x=1751975270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZOLfR72PXqOLw5WtFWDE/MmTe35xsn3qkEJhynzf0Q=;
        b=nEbrJPCeSZLhcoKgrm+V+mtrK/GKos1672zQF0PGEKiocXZZlDtWWWIVDYgN3kh/07
         JYDaiUOUUm2qC12u2F0/Eu+TdORWh1HgqFPVrakdRhIbhGlTXWVH9IPbEsEqgO9D3xxl
         Ih1/e7tzvznF64aQ7GItDwuax2xXDexKIl+bbsnzk2/GCI+7um4q8MlIsSeTo8yuVeMk
         9qfNDadIbRzWC3iqSNhWVNIxxADU/0i6MZKS7YdPlBmBqxe8oX+4rPoNrtd+szma+MEM
         eQji6cL9lU4uNv4rzYNbOjBP6woXpxyLNK4Gpj8uEQ/32Y9Z5JYN/wG8b5c9k11P3aTB
         HQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370470; x=1751975270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZOLfR72PXqOLw5WtFWDE/MmTe35xsn3qkEJhynzf0Q=;
        b=sGHvJKrcX8JTjjJrBx1xagLSGhO9i0IhV0LCJv+m3VDeJcOLCOomxpxBy0xEG28dii
         P/lSJ1smrhWdkTKrsV8yHhv+v0nxxzmQ6gZhwOqpR2Av2r2UF1bIfpD1yjrz3d39PJVr
         UKvD6AAxjYERNfs4sv75rPw3Xa6/yuTksJAhWB+fCMADo9PcqnMp7G336cZcjP84WTqP
         AxCsXXtC6kwiZCVHl4APnyA3RXA55Mh+eaPCB1kGBOufE1fpFoWvYov3gMXfJIYiceVz
         0mUphA6eENBJ+JVlZ+eLHLqnnL+DHp+LU6SvhFO4MBCAtW86tVI1QQ2smM1UIP+W8Xr3
         AcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX8CWtfmHPThACdnudLzZhBOz+j9Avd/Y+heVREs8H89RE6jNtVNEtK9WVZ+6E+IFrIxCRX0RNXAQTS0HYPf9j@lists.infradead.org
X-Gm-Message-State: AOJu0YxIgX7kHC5UOEBN7c4Drr/u83hQaE2d096WV6ujmjrjEnRIpzxB
	pSK/dMbN9oz6Sci9gKTkhg4tkUFLga1U6BfMdM7Mh24N8nlqtx56zAj8KY/nWzUHdZ8=
X-Gm-Gg: ASbGncuHSelArLLfEB362GTJrHHr8d/qfXXbHS365OUjZpwDJ1e/PUofRKKYQ++GXzV
	TSJ+Bx1x1lwFutiGnaO29uT0N1JjPwKtKNL2dSVLZ0pajbo0cq2JTlRJ1wdgHODLW6Tx521vj2y
	U7OT/KKcaCc4z3LTGPBXUcFWoVycuYPAvu3YQKhBBcOc4qNbxU3Ft8IWAoyKbPMRjQzt45s3fnS
	S7vV0Qdz0xaXIqXk9ahUBy8foJo2nOMP3e375s6gnSxTuOUs2dsaODmVsPZajFEkhdoOQIfks+g
	zG5hISAQqiGG9N0sjyx9lwJVHmMEcWtpKt0kYcyXsEvwRdnVENczGOgqi1051JtrSw2Ls2vfNv3
	nb1UoQ0oqZUT0EM9RK8DUZ17bf9SCgAalPZcV
X-Google-Smtp-Source: AGHT+IEFlqH5aVFiMAtrKQEMVhHjR3b0DQN5zCXSWC23vo3ub27qmEf/97Rk59xwHI3Cjb9MA+KM7g==
X-Received: by 2002:a05:6512:3a86:b0:553:a272:4d18 with SMTP id 2adb3069b0e04-5550b82b648mr4551995e87.20.1751370469527;
        Tue, 01 Jul 2025 04:47:49 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:48 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/24] pmdomain: core: Prevent registering devices before the bus
Date: Tue,  1 Jul 2025 13:47:06 +0200
Message-ID: <20250701114733.636510-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044751_362623_A264D8FA 
X-CRM114-Status: GOOD (  16.70  )
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

We must not register a consumer device to the genpd bus, before registering
the bus itself. Even if this doesn't seem to be an issue, let's add a
simple check to make sure we really avoid this from happening.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/core.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 9a66b728fbbf..93d71164fc56 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2491,6 +2491,8 @@ struct of_genpd_provider {
 static LIST_HEAD(of_genpd_providers);
 /* Mutex to protect the list above. */
 static DEFINE_MUTEX(of_genpd_mutex);
+/* Used to prevent registering devices before the bus. */
+static bool genpd_bus_registered;
 
 /**
  * genpd_xlate_simple() - Xlate function for direct node-domain mapping
@@ -3179,6 +3181,9 @@ struct device *genpd_dev_pm_attach_by_id(struct device *dev,
 	if (num_domains < 0 || index >= num_domains)
 		return NULL;
 
+	if (!genpd_bus_registered)
+		return ERR_PTR(-ENODEV);
+
 	/* Allocate and register device on the genpd bus. */
 	virt_dev = kzalloc(sizeof(*virt_dev), GFP_KERNEL);
 	if (!virt_dev)
@@ -3357,7 +3362,14 @@ EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
 static int __init genpd_bus_init(void)
 {
-	return bus_register(&genpd_bus_type);
+	int ret;
+
+	ret = bus_register(&genpd_bus_type);
+	if (ret)
+		return ret;
+
+	genpd_bus_registered = true;
+	return 0;
 }
 core_initcall(genpd_bus_init);
 
-- 
2.43.0


