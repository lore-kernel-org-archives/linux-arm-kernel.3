Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E803CA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 19:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIRhhPwVEVzpUkFOiFr72TjAQ//RWYZjBPnhQP/2UH4=; b=pZernkhA2u+FxRo+OnI36JMUWj
	brAsW9uoRHASKaeXnAD5jI5rN+5KmX0ktBcOBMEMYLX/ue3ffyNBHYFR6nmgajAxTi9RlZctdceLv
	2PPE1RPLywyGYaoJRtHQ9xG8dIB4TZ9B/7WfeRdOAI6taiwDIwtpm+CJWbofFXNVNoTjxxsD5flrv
	5/Ag/alfm+t0FCK2VW/wKwIWZtlR2ivUBs9MzmzC4CiryA+8ts8iqWRrxM8/nHgthD3GoF8A6mxou
	R/fYFPD65jkuUkK4vac8SV2uFfzR3dF9idK85TZWi8GfG2+C/y2zrTViH/uMka5Q5UOGmVQsltnEU
	HWtZyRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGWU-000000077nd-3DVr;
	Fri, 09 Oct 2026 19:44:54 +0000
Received: from mail-qk2-x04.google.com ([2607:f8b0:4864:34::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGWP-000000077kv-3x4s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 19:44:51 +0000
Received: by mail-qk2-x04.google.com with SMTP id af79cd13be357-93cbbaba944so2506385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 12:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791575088; x=1792179888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIRhhPwVEVzpUkFOiFr72TjAQ//RWYZjBPnhQP/2UH4=;
        b=bDftNMCXzIA7wQWaQuI+4V/LkoifqycN/MGceNOkjhZ+PZUdBj+JfZ88+OQ6HC3gfc
         KUnANmPNv9ucJxhg63TSTKvdkpx42/z4QicpOL+zGb0RggcXupq2/fCN/2y+FcE/AU/M
         ZIBvxkhgZdu9peSPXooxMvsF3UO0pM+vvFhXsYO+D5NRzCshMeEysLMMkQcTj0RjEHNJ
         Y58aFWyBkvcQIdJb8jFXdYdZKrkWqH5XuEf7pLj0IiVgPali3j4E5pgIhMyHER4Dt44v
         DOqGW5W642f2Y3VMSiVWYjup4LupzyXLrZmEYOiV2rMEUkSeZL2mXI9meFMANu9jQCYm
         HAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575088; x=1792179888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIRhhPwVEVzpUkFOiFr72TjAQ//RWYZjBPnhQP/2UH4=;
        b=L5ZnjPmMi4TU0XEraXC4ULQRQ7xQZiK4Tj2rnumM5ldfZpyFR3l6gloQwdXfKkvqy4
         ygYwfsiVy95joXVOieahHCYN97VQ0qs6Ovy4R2IWHNxca74/DUTCsd6muH8O6qGkpmD6
         m/eFCUxoZKx9qkl9m3JKLejC/BKWAfboQo7toW4jofB7ru1mFK3Ysxue9PNZEVTuVIAX
         +imIjmDth66EumPa0oTDMrnJDkoT2b+3EhigV0tQZ0Lm4dop895eHn8spQifAiib7fYu
         xWd4KyQiqVgvt9HIZLCk3MIqtzHAaECuejON8vIJC3IrPwmmc+qJbPzEtGro5fr1dCeo
         WDoQ==
X-Forwarded-Encrypted: i=1; AKwUvBylzKoMLGaPqlIwT8Kdwe6vPH3HUxYKkYArGfhXBLeSa7Eg0usGbE8oGi7UiyIVRCuqOmgRY9KwhQrUGfsGHPz3@lists.infradead.org
X-Gm-Message-State: AFuF++mLTyP6cCCRyZYk2QfKKs9jYzxJv9favjtWtOTo2Ngf/MKcfjgJ
	91XVSGT0G4xmKQPlIwFdC34vvVBZ884qzvUwaTQkGaWDd1kuzSZKf/O+
X-Gm-Gg: AYBFou3COEYUpK2vMrncLh5qxG1sgnO3QU/KPq3pyxwPAzmzOGX4VA6ahHep2E8Rkyz
	jmeJMPUed1XceYytpw8SP8HxPYeSeoJqYb+cQrpkTWRuZ2pVl6Mp9J2dnYqevbs+4ogQacq0UET
	BCrpzfXw/TYqhAFFPYpPKk58KQ2yQLDt0d00QemfuJQG9Siesofp/ZF/ny/AcFP8HdMUAnEZJqc
	LenousGtGbKRKFnfaCGpmoj13PSlSEDn8sXgYbFqDCVwO+XB6YDIo277w/zamNLosTrK5L3qPJY
	yxw11uLc038EbaGz6Bb+WcyS+QPK98gHdtuUm/5CdBsov22Rv/VusDhlmAO7x2WeGnuUHBYXXIS
	ESpYJxzxF1HzP536PUQq/NS+oN2uJl8hhHSh42syAVHNqh803Issbf+BRamtGId9Ni5b6jXIOsE
	vQ8wgM+3c5YoH23/k0wvwvha66dDXJzH6F9KiwoV2abQpeYXS81x1TqFRsdUXZLWgjfJ/7AbUpD
	v7UKN9IgkL4vgG7aHi87IMGhOrlKvAVnwqESplZjtpYykNGaUxoEkzlIcHDGhEH8Q==
X-Received: by 2002:a05:620a:4081:b0:939:f27c:7433 with SMTP id af79cd13be357-93ebd2838aamr439833785a.50.1791575088641;
        Fri, 09 Oct 2026 12:44:48 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm259293485a.35.2026.10.09.12.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:44:48 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 14:44:43 -0500
Subject: [PATCH v2 1/2] cpufreq: mediatek: Enter system sleep at the
 suspend OPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-1-ba13f826eae1@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791575085; l=1498;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fXj+/b1tWQ4CVun24kWnp5+6QFowX8kLlyxSUkAjW7I=;
 b=CqC9lqTPvdYR4kD85dq/pvqLzd1/IPalGGl65+mjFDLrpnZOKrs5SCOfPH+nkdDqRTmBh7PVZ
 jArMCG90vxuBdEJ2vJ9iJkvSIaILZcIp/Ir9MeZm/bqwB7pplwroPxV
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_124450_031857_DA595679 
X-CRM114-Status: GOOD (  11.74  )
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

cpufreq_suspend() stops the governors at the start of system suspend, and
this driver has no .suspend callback, so each cluster sleeps at whatever
OPP it was last left at. On an MT8173 tablet (Amazon Fire HD 10, 2017),
entering suspend-to-RAM with both clusters at their highest OPP measured
63.5 mA. With this change and the lowest OPP marked, the same entry
measured 52.0 mA.

Use the generic suspend-frequency support, as cpufreq-dt does. Tables
without an opp-suspend entry leave suspend_freq at 0, which makes
cpufreq_generic_suspend() a no-op, so they are unaffected.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 052ca7cd2f4f..f9b1eca176eb 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -603,6 +603,7 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->freq_table = freq_table;
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
+	policy->suspend_freq = dev_pm_opp_get_suspend_opp_freq(info->cpu_dev) / 1000;
 
 	return 0;
 }
@@ -624,6 +625,7 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 	.init = mtk_cpufreq_init,
 	.exit = mtk_cpufreq_exit,
 	.register_em = cpufreq_register_em_with_opp,
+	.suspend = cpufreq_generic_suspend,
 	.name = "mtk-cpufreq",
 };
 

-- 
2.55.0


