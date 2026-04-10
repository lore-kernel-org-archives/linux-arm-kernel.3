Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38429E99076
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t1NWY+BWGARd3KdW9zy3+VOHdHry2FwciZ1/FvhAvLg=; b=ieuc3gdzs/35+omZdRI0MONudY
	G4k45NY+mcYXCvOBjEg6HdfUfppVNT/3gnORo/zT6ECLLcQyTjtXV5o4/81zjjYmdWvTSlth4L4rB
	O8YdJJR4hjcwCW3vZvi+glWe769mzwOCxJM3Vw79w4oufpRZzfe3Q5BkHBK6tI9fzTzCe8K16JU4o
	QmL+w0PcxAbwrEM0DV8ppczvaG+2NqT9Gp+qtMR0V5vN0mayTXp0tefBm1VOJ6sJgo9B9SexVG52y
	9CQW30/J3tSRyY7+BoM6XE+/aFpNDb/FMpT0MthE2CCqORKrcQQUwOZ/AIRNC8nzMjVwESKCUy2aj
	UspjQxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9IV-0000000C1FW-3Shk;
	Fri, 10 Apr 2026 10:41:11 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9IS-0000000C1EU-3Ftq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:10 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38dd575bcf3so20249891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817666; x=1776422466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t1NWY+BWGARd3KdW9zy3+VOHdHry2FwciZ1/FvhAvLg=;
        b=s4sZq2wKnqVMrIUoPZ4rKU2f535PuDbhNc3HsSWas3kyvrdhttkfNkljNN2FDgpJMS
         1uOc8+UpT2vA8PZGCLp3M6+G4xW9siJP6d0jEwfYyVQSzZnyG36N3zYS1mNzpdlIizEe
         rWux6EumPiiwS1r3ZpBCokiAahU2NaPw6WbMVvh6xOGuu9U9pgM62stwEIUEeqXeCVMI
         WxkPCUPq8R76My0g9dcjeadof3hTMm0IV/IypWxcrrjth2NlHFqe8U/H/k/M5uz2H8wl
         F0WBuwYI0artqfbbIb1VbjJdSm2p96VnlJuZYK516DMiB6Fo4BPbgSXMqUpLArze09jX
         67NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817666; x=1776422466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1NWY+BWGARd3KdW9zy3+VOHdHry2FwciZ1/FvhAvLg=;
        b=QPzZEbeJJGPTAwV8pCUAaZbcXYtl3yYLeHH56/o+OshA2qhisKa7GzkcbPghRGW8S0
         a2rWmSLoj3dgPwUoBOHc9eAuxsm/0HW57xds+kAGbA1/aTsuDm5jGUON0TOK450QN6HZ
         QmfOlUbAgJU7ZOtaSTD1+Aw5eBJSH3BG8Lv9MGHDbIQrCAHxFRS8jcaHiOQMWwSL0uj7
         4X6K7ZQLZUl14wT7rrFWEbx5MdE08N8C+4DR9rmEQ6bkdozhDjLVt4QVJd4mKmztYQLS
         frA36QoP9M5GNpSo5cS6OIkGgYc7Kxk4Jf0aAg02NDRnHGC53tMiq6Ayl67j2tQ1xKN8
         WCzA==
X-Forwarded-Encrypted: i=1; AJvYcCX90WOq4xQo+JPly0nTanVDFUAmMBCAxAb06jDOhJAAfOjFm6DQdlbAa8o5BDkAG7GUNlod3xvtp2AxJssZNXbn@lists.infradead.org
X-Gm-Message-State: AOJu0YxxJs2DO5vtdYlq2Qok7VSbDI6JkE6BnLqhU+QbEdArshsoqkgp
	VNo8YMa11u66nEWtqexXQcUjOzV/CKIsZ7g2uD9ri6F8Xvvenjy5iZpNM+xr28v3GuY=
X-Gm-Gg: AeBDietQQt71vGnSKxfwJsyU+ag2sYu3CCHa6BG1FbnFdtyBGcYHrHeSUCZUSgM5EXE
	U0DtDaOp1vPxudojKEduPWPDYMft8rCQN3HKzwx24TzCjrQGD+Fld5DCows74h6RaDZ26/YwL0O
	xXjxsvnZ5Fp5zHZiIHrpQ8r3eH5SFgaARZxPStOHfka/NN2cr2yPCTjuJNhc212i+PWM/NzRE1d
	F6t1HfM6lbvbdn23XCIZrPW41WjTcquBpR7k/KxSvFBFSvGIJ3j4/eZrvb/vk11gjzqUvDeudZH
	vXKGOjB+qIrzgNdkNW8GhW2OhbrvteT+wddiD8Dv3yOS/5o9KnXSOOwJtFvsx7yExWpszZBhw1t
	QG0CYxqEVZhDZBXhhK7zc026YqlRV+XEf0BHx+6XY/id2MZqeFhholIHH4V4oXkD0VpR0AkBMMy
	gcXROIozoC8GKDifrsrZz8hjAXEZxtmin4q2n+S/eR4iifR3wpyJdRUYcVcXWbDyFydijLCAxG
X-Received: by 2002:a05:651c:f1c:b0:38b:50c7:8239 with SMTP id 38308e7fff4ca-38e4befac2dmr9365121fa.21.1775817666197;
        Fri, 10 Apr 2026 03:41:06 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:05 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] driver core / pmdomain: Add support for fined grained sync_state
Date: Fri, 10 Apr 2026 12:40:43 +0200
Message-ID: <20260410104058.83748-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034108_846425_C062F524 
X-CRM114-Status: GOOD (  12.45  )
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

Since the introduction [1] of the common sync_state support for pmdomains
(genpd), we have encountered a lot of various interesting problems. In most
cases the new behaviour of genpd triggered some weird platform specific bugs.

That said, in LPC in Tokyo me and Saravana hosted a session to walk through the
remaining limitations that we have found for genpd's sync state support. In
particular, we discussed the problems we have for the so-called onecell power
domain providers, where a single provider typically provides multiple
independent power domains, all with their own set of consumers.

Note that, onecell power domain providers are very common. It's being used by
many SoCs/platforms/technologies. To name a few:
SCMI, Qualcomm, NXP, Mediatek, Renesas, TI, etc.

Anyway, in these cases, the generic sync_state mechanism with fw_devlink isn't
fine grained enough, as we end up waiting for all consumers for all power
domains before the ->sync_callback gets called for the supplier/provider. In
other words, we may end up keeping unused power domains powered-on, for no good
reasons.

The series intends to fix this problem. Please have a look at the commit
messages for more details and help review/test!

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/

Ulf Hansson (9):
  driver core: Enable suppliers to implement fine grained sync_state
    support
  driver core: Add dev_set_drv_queue_sync_state()
  pmdomain: core: Move genpd_get_from_provider()
  pmdomain: core: Add initial fine grained sync_state support
  pmdomain: core: Extend fine grained sync_state to more onecell
    providers
  pmdomain: core: Export a common function for ->queue_sync_state()
  pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON

 drivers/base/core.c                       |   7 +-
 drivers/pmdomain/core.c                   | 205 ++++++++++++++++++----
 drivers/pmdomain/renesas/rcar-gen4-sysc.c |   1 -
 drivers/pmdomain/renesas/rcar-sysc.c      |   1 -
 drivers/pmdomain/renesas/rmobile-sysc.c   |   3 +-
 include/linux/device.h                    |  12 ++
 include/linux/device/driver.h             |   7 +
 include/linux/pm_domain.h                 |   3 +
 8 files changed, 197 insertions(+), 42 deletions(-)

-- 
2.43.0


