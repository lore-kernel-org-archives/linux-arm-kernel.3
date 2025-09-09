Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611C5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euHGryHJ8QWDxT7cesCDLU1KtKBsI9gmyEIIx1smyRQ=; b=CxbLFF6Qz2ITeyP3ip4EqKFJyI
	2x5ZO8ivaC0jh6/+Q4o9O0xNIQ7ys1Ba27W69EWbp1+bxFm4G0OTKOSdv9Ao9ofmVVwMEiQy8z//v
	bCJ+z9rWAUq5/iIPo9/rqCHemc1LDlKIvsXO5LlImEJqu22yh/PeIlcW91gkuDsXNkg9lTQI4iYyc
	8Pw1/1O7LF2Ssm4C2zQZ/cZVgl9fgmjHvTj9ChqQh7kjzOltfbgwQBLmo54Ph7FP5mNt3DM7GAsup
	Hg6e2du7mcnjBXgZymqO2mYlHS/ewA3VwH9GGah3JKWt6l+tW3EFBfeN8aZFHygowpHxsqTB0ZNEf
	V8RzCdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1w1-00000008nxm-0kGi;
	Tue, 09 Sep 2025 17:15:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwGG-00000006d8c-0peQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=euHGryHJ8QWDxT7cesCDLU1KtKBsI9gmyEIIx1smyRQ=; b=m3OC6rrnKDY6tVk7oYMGZucxXt
	BCsoDXkYC4dBtBk75r7Jvgz1qt979B8k0qgYGYDD12OFEr8XF6OMCPoB0+PXiww6DHtRBm3dAnaro
	eqTi7guKnLo089vSSiO/3zQ7XcxXZMMFbXyCDMqpL8qwg++s/xnsiyt/gfFY1Zf7oqxguOw/sgzQJ
	kEed8BGagq7fhZq9v89MWbCmM/8wG9n1evLlocLl0IuuCao6Ql++ae7GXOLhjn84BLI6VN2Sa9smp
	XB+jE+SOYJgLx7EXdWgPgoSV1hvGNENDR/4eQsSeZ+MflLMrjLxN0VnboWQ2wdShmpmAYiKV1Upys
	+guSSX/Q==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwGD-00000005IUq-0F3V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:11:43 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so5204418e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757416299; x=1758021099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euHGryHJ8QWDxT7cesCDLU1KtKBsI9gmyEIIx1smyRQ=;
        b=F2kvgVGkIRuusH3C2p+VfQx7QPwiSEj5Bjcf2tW2kJv/kFfTzpLXACjiFFXClNWf+v
         kVNoR4VHCNP7hjxoOr0AuEVHlTZBaLrhv0lyFzInpicsO/QNpzabzKqBDOa3CitElTTQ
         gn9pPqNLdLZMu7vdb6GhkuPwlEnT4pGU85XCW2vYRAt5h2ujY19Bo3O8b/b45FiuYbOK
         4veAVP45v/A4948guxVus47fz6rUKyegPrtP2Usp5rOLbzT06utUMCiBqQF7oXHexHXx
         lAmLxHMaRpeGX2fGoYXat7aqw1EmEdf4iDNrZwD/pCfMrEio4dpOO8yP1wW962z2jFWP
         qfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416299; x=1758021099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euHGryHJ8QWDxT7cesCDLU1KtKBsI9gmyEIIx1smyRQ=;
        b=UQ8wFoYEcCoR81vy1/qr4x4mLzPb1XUjfLnc1gwbOVIWISFJOrspWvH/rYZk9G2fcI
         pRqzLhjBczdMQJ331MfRpFDfiZyDaR7mP13ecS/t6IYFjuJ3xQI3KhJOD+8ucc2IdEma
         UMhJTBz4brCB9uSzi8HYDbUzvAU1NzhOrQHFhtry633WZ+bTWhN3+iMJ2Y0xQrmu8gpJ
         Q7X6kB6C2/lPva7rhRO09ivG963bXgo/x0hcftZlv3SBbV0UBlP2+o0UGo0y2dhBVx0Q
         xGS2kI/NLWbiuQuFpnq/d3T+RxUtNRChq7JNUVJ/xRMFBhKhaXsYa6BMKh8/Fi36f7c4
         3ISQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWBNoUaUZcPsiJpmGupJBqK49TqQU8hOMFyBzlaCItsQvHpgDUCnYJXjEnXdrvWul0kvmsdq0Srir0uTWWoGuW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6OsmJPd6bx1VBt7OvkBRq4mtnkIPQaJwDUMhEOlA5JAGDEunc
	p36/Cy4vZAD1doLlxDr2bcIBtvNFKfGt0HfaORRhhRl97iqlTqTV6XtxwLI6AJujMzI=
X-Gm-Gg: ASbGncvxHXRzt/4zpz3k5HM3HPbiAAWuuFbU1BQ0bo+IsuigZV4yJMPr7lwkbQGCVm7
	hTOSg7NXwzSpi58v7U7JTpm2viVYYF8zvQH9C8O8OXRYswTPhaLR8t77Uc4CvW27GXVvSYPEZiC
	UgTKax6DWhAiffGPuehpHDRA0bOYv5/85nWQsX0UpkjCabgxvvd1sf8mLetIjuEBJ/bg1IvqJoH
	Yc3521LeQnxkBltkmgRvII4/cQU4hU+/ZmLE+Gt0HYCqU9QLXliDNM2lpM/2OL/qPzd6RWluJHF
	FBCSY9lnj3GLVhTTOfC1BonMtr2KivrAbQs3OeUxPBzGL1jHWBsth9xmRP3eQvC37eM2gHj2zaD
	bT30pKnGpcKcBlBhK/hTjRNZP9Q1YD2EgtRt1JSukp7hOOZAkjLl63CRD1mEghEm7T4ZVrra1re
	zljiFXJl8=
X-Google-Smtp-Source: AGHT+IFfaEg7KARMsiLKzyUcPFhDsGf7F+a3gcOB6C+SVsQx9Fu2a+sXO0Qgm1wWuW8uSP6aIC1C1A==
X-Received: by 2002:a05:6512:108a:b0:55f:4db1:e450 with SMTP id 2adb3069b0e04-56260e3b836mr3025626e87.22.1757416299071;
        Tue, 09 Sep 2025 04:11:39 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-568190f8040sm445440e87.148.2025.09.09.04.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:11:38 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-pm@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Diederik de Haas <didi.debian@cknow.org>,
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] pmdomain: renesas: rcar-gen4-sysc: Don't keep unused PM domains powered-on
Date: Tue,  9 Sep 2025 13:11:23 +0200
Message-ID: <20250909111130.132976-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909111130.132976-1-ulf.hansson@linaro.org>
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_121141_316783_706C04CA 
X-CRM114-Status: GOOD (  13.20  )
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

The recent changes to genpd makes a genpd OF provider that is powered-on at
initialization to stay powered-on, until the ->sync_state() callback is
invoked for it.

This may not happen at all, if we wait for a consumer device to be probed,
leading to wasting energy. There are ways to enforce the ->sync_state()
callback to be invoked, through sysfs or via the probe-defer-timeout, but
none of them in its current form are a good fit for rcar-gen4-sysc PM
domains.

Let's therefore opt-out from this behaviour of genpd for now, by using the
GENPD_FLAG_NO_STAY_ON.

Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index 5aa7fa1df8fe..7434bf42d215 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -251,6 +251,7 @@ static int __init rcar_gen4_sysc_pd_setup(struct rcar_gen4_sysc_pd *pd)
 		genpd->detach_dev = cpg_mssr_detach_dev;
 	}
 
+	genpd->flags |= GENPD_FLAG_NO_STAY_ON;
 	genpd->power_off = rcar_gen4_sysc_pd_power_off;
 	genpd->power_on = rcar_gen4_sysc_pd_power_on;
 
-- 
2.43.0


