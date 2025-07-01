Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85126C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAJ6J4GjiYlQlRHxgiIta0TvQOYhp5UxqNHtxTsiWvY=; b=UbrmmbDJ+pKLO9Yo74nWYx3KOV
	WxdOqk0hVOSwXeirESYIRrJQPmpNMXxS5s1j+ZbrInBRY7eL1Gi7EqBf6nZoV4Z6pFEThxlB0qr0u
	JHS5xuIrwbuXuCO/tb2ohBks5V0Rpk2jnhb/kr3q1AObYn53PMJUaXnudQx1xTRUWFlVLAZJEfLXD
	LTipDLux8XEYIPmPN2CcK2/4VxpJ7U2Q2x1bkZEKzR2NezQMH8plYkkh9PLUKpbMGZ2SGhVD13fIS
	jmuv/HEPTRZyDuhnFvza9JD6eJ5iMjOt7GZHtQXaCgDdVQ5KKbzsKV91I11QB7YHEfeWLZD1/9ove
	Lph0YXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZc4-00000004wqj-3ts2;
	Tue, 01 Jul 2025 11:57:24 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSn-00000004ucR-35Se
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:47:50 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so1769909e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370468; x=1751975268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJ6J4GjiYlQlRHxgiIta0TvQOYhp5UxqNHtxTsiWvY=;
        b=vOxzl4bQD9NGa85XyZAYwkrwyVIATKdo2AUA5YdxKuBFOafP/w9EeeaVgdntvVbKsm
         XNpfBGVBqL30rho4jBXSQy4x+RN81oQgOYc4RubHkbDbVn844ai4iF7MbWsQg/eYk7XR
         /MayOj+RGfJR+ZI6TFkY4GpuhUayiKYHTGwoGCFZjNyp4md+hZ2KFM2M0w8Cgamp4BL0
         KyS1dFBSqWqT5hQ/5vS+DgagI4F3pc6sNM+VYCNWWdF61ClYJ4HmguXZKKXvGcGdx4f3
         P+pCktVihesc+lEpjVyO4zmwMIwRjIlriipTzWGqUz42ZSuKNlsV0WkPBT6NLtvpoJ0s
         Qkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370468; x=1751975268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJ6J4GjiYlQlRHxgiIta0TvQOYhp5UxqNHtxTsiWvY=;
        b=aM0hzIEi4jCCiVAmvZEJUwFtzDezb11ogF3p1HeoYaGUnzo191zn/ytkkpAkHxtlAY
         sIoqtiLz0flvpPObw2RSiJd/NItdiXYsR/Jl/Y5E1DeJgTQsB4Z5ZLr6sykktt245cuA
         dv/sc7URg76BDvEfWDII8X3R1JznbOb+rj6HZvfI5Q0gKtRGdh9ZJb0iB5ioA0REGUg5
         5S2FMmAiuQxMsFJvvFxykX2V4wgWmY1Jm2e7vq713PH4Cz9WT+4XL9Lf1oNMqVc/1yxM
         4wMIWmCse/+nHGF0CJ1G7xV3+HEdvurmMmQEUO3uKuS2TvdxagUWvqFvGgGsgXWb21lx
         nRpw==
X-Forwarded-Encrypted: i=1; AJvYcCWnIl6fgNLc5Ecnde500u2yQ/p7GIdzLPubVkub3wbtb5BC0D/zqaKZvOBaJB2SxVGSlvyy9fGPBvjLePZMM0hR@lists.infradead.org
X-Gm-Message-State: AOJu0YxVl8lX+0nObzisrwXMTA2vqxA9NSHaZsTj4Vs/HDvZJBcnO0Mr
	v1N6dcLIh4FqGLNO23BKTJTiLAUIz80DgGFWFq1nsut0gEw6lPLvQiwmf7vAkYHjK7M=
X-Gm-Gg: ASbGncvxF+Ii5lvxfdHnujjI13PjtjPT1LBRxCu3Lj+JUa+uzYgUVHVFXt1rrse5v3z
	gDlxE61juv2SBmdehuEW4jwflWd6mxSscQ/3JEeuLUNwviv2PjuD+EXAleDtM0B9M9N/8auAF/k
	4NUQdPb+aL3xvISFTAro9+gRdViXDzyFsR0BVmpLA+q+vkkHwsJm0iG5kbD+p5S0xWzV9Eoh5ff
	2lZm1voDsyrlGuG43NEr/QNfaAkXcaeY8gKOiwIxTL1/0I7TAQfSdiCACHQpmk5usiBdVdtbT95
	fL7hcqWYa+C22xXgH9lawvXpI3SN4zkqfCTPssRBPlwI7gvPyo1t64ufLZT0SL4L05febP4pAmK
	796j+7QggbypjHWmTiOjhwwdLW84m/eEzCeff
X-Google-Smtp-Source: AGHT+IHA2zFo5pnzsu0lhBpGnceUmjdKPW3bEz4nAMuwGE5OIZ/FIvjbr6dJfXztba7RBDcN4Dq+2Q==
X-Received: by 2002:a05:6512:138c:b0:553:2e37:6945 with SMTP id 2adb3069b0e04-5550b89f419mr6638377e87.32.1751370468065;
        Tue, 01 Jul 2025 04:47:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:47 -0700 (PDT)
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
Subject: [PATCH v3 03/24] pmdomain: renesas: rcar-gen4-sysc: Move init to postcore_initcall
Date: Tue,  1 Jul 2025 13:47:05 +0200
Message-ID: <20250701114733.636510-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044749_776412_E1FA5376 
X-CRM114-Status: GOOD (  14.56  )
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

Subsequent changes to genpd adds a limitation that registering a genpd OF
providers must be done after its bus registration, which is at
core_initcall. To adopt to this, let's move to a postcore_initcall.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index e001b5c25bed..5aa7fa1df8fe 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -374,4 +374,4 @@ static int __init rcar_gen4_sysc_pd_init(void)
 	of_node_put(np);
 	return error;
 }
-early_initcall(rcar_gen4_sysc_pd_init);
+postcore_initcall(rcar_gen4_sysc_pd_init);
-- 
2.43.0


