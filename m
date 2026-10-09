Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD89CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+W1hX4qQ116GBN/dEZOF3zgezRpS4RsRBfyuf5dXS8=; b=w5Bvnx4uRv143UT1XYPPzt7NXG
	dfgOtGW4KTPe8GH8L7T14ZMJRkVbAQqDzkIRmtmZx1BZgqcmxMZfXMgtWCW8VdJxgHevh3hYOXgWF
	W7V5trY1R5OzvXcwy6bZcnxCcBKq0bgqHXKdiTdKSkcuU3flm69rjYTbJOX2dDdqtkgmSO4vaKGDI
	JGyUqphn4cQujo8dLnlCHkh9XbGTr9A/34KHjSkNc5esjgO2/RiDi4QanewwRNT0EWKdi6RS1I/kY
	MgFFr+uyAa10l1GYNREKF8B0ZJuFVzeuNY2DpKknHuU1Lr0ApK3uOw57rbmTAh+HviKoFj8xJTVSk
	veLxMuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFNw-00000006z97-1Agq;
	Fri, 09 Oct 2026 18:32:00 +0000
Received: from mail-qk2-x06.google.com ([2607:f8b0:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFNr-00000006z5u-2Zwu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:31:56 +0000
Received: by mail-qk2-x06.google.com with SMTP id af79cd13be357-93c56ac78c5so70890085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570714; x=1792175514; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+W1hX4qQ116GBN/dEZOF3zgezRpS4RsRBfyuf5dXS8=;
        b=CdUHg335Cu/TVSj5Rvg62uIt0vCXZSIbxT5GgGMWkY9dudfKHUdBlhGwYvDmXuysme
         l0WKaVjlT0zbW7WP4IJjQ8mKtIV3d3vREIop3a+AfqgyL6XzTzQsuSRxAkxkLqkMmN4C
         Z+vSZh0+MmhwdBdFmqMy3x1loipVkdM/+OxJvmN9HxzqPCpRdQ5LOM8KPHywEYtHoxa3
         kotoDIGv6HUt83PFSOpwviCj4m7CfjPBZqzNdkc7Ri69KMQBF2ygdPNIjz3Oyxh/0ZUX
         nqsLlK1Lc9EANtXrqwfgEcs/cBMG+hyD/ymTv1uqtFdbSiocKP7IEgz2qNqbkXu4YH9M
         W+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570714; x=1792175514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+W1hX4qQ116GBN/dEZOF3zgezRpS4RsRBfyuf5dXS8=;
        b=p1yW9DVrDyf+ktpt4+pn3qL6AzR6XsMfa0U+zmME6NKjcGr9ltYNj0ARRf3Utuo7WF
         nk3i9bCs5mEvCN82zO3kcRPR+2N5DQAmZtqWAnBpQ6ogy/HXu25nknEKNlbNyG6QKzUs
         fQzw35z7raIDfk/qPV1BNYaOu6shUCZ5udAKpE9KtZTUkbbFd716RnqELdmVhWs3rwMV
         i3nVepu79PgQTg9VDC90aoeU78ZN9AjZhbDkx09A8IhOJwB07H4y0MFealKLWIUBd0yK
         OWMosEVDiN8gnprGPmgn25tSHaorqSw/rp6qP/3NZZrr7E60HwP+Ljjc+m58+CG+aIcG
         DBtw==
X-Forwarded-Encrypted: i=1; AKwUvByyMgkviMdv7STLhlYp+SdZ+6vKtqVmmQrwukP0kJkCTechciOVaKbNsvl3u9koLZtmaTYdRhEuQF7t3SAyvZ5W@lists.infradead.org
X-Gm-Message-State: AFq9FYI+uVs5yGdg0stE1ip5aPAlrqTSVmS+wCzGUe5ePIRhnbl59ySM
	syyPwX5lCJXSFiccdA3LwkEksaB6uCObnkIPU3ndGGfu51vuCn45Q8RN
X-Gm-Gg: AYBFou17zyrqvmSZwl3VyeCas8QTSSpZuoLju/fd+CGFNd+f0ErhOyj50jW5ugCEi62
	48shZuY0RxI4h1GmHHb+pXnQ/lZm//Hq0QqswPXtoJ4jzpbcsGI/JIBb44NmM/jaeExlwFkOTNA
	gZRhMiY+h50Ni6E8FUf6NqH4QVxIeYnB3Zww22TaFZ1T4IoZNfgl8vrVOH6Kz7NwaD7oX45BLM2
	DJpBEjofi3M2cy89ZWBsMQd7qwDWk8cceoEb/FLjqWB8ePMWEN99w9mpUKvTEHnLVk4JfL2M59g
	ZdDKBKHKpfAXn6Oaq9WRWbI4r2fCPClSuEC1NXyz5CvnH1KLTjdobXq2CjC6cONhA7FFswIDChb
	nB3ncANIlRHdlS+tTDPWoqNznTje2Jy0S1pOvQDSLivHrqiLRHS4GGDt12IIu71sWH8pms33n6h
	OwPuCn4qsamO1tLYQaQRB1tF897NEIvS2NI7otMPRmmQt1ng+V4xdj2nEQEdHBVhfQ087i126kX
	Epy4wFu0BE+rZSK4nMQo+QjxqtMJu+gPaaAu6c9dSed2IO0Heo7QzbK/a7LYlNBUg==
X-Received: by 2002:a05:620a:6844:b0:93e:7156:f814 with SMTP id af79cd13be357-93ec134f9f3mr293228985a.11.1791570714330;
        Fri, 09 Oct 2026 11:31:54 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9898b5fsm245594685a.32.2026.10.09.11.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:31:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 13:31:46 -0500
Subject: [PATCH 1/2] cpufreq: mediatek: Enter system sleep at the suspend
 OPP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-1-9100f79b4080@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791570710; l=1447;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=zKnuEKqqe7edCKaus1RgpjuKXXy74FsY9bBojL49qiI=;
 b=TKIssWZbu9V/Rs0l3vFTMGDGJenHiseLmnrhDQeH01mZIX62p3RKiyzvqCiREuXBeGpC/DcER
 7x+myhDBZs8CLEektz10sDGJuS0qBbKpqx4vsozFQjfwzRdJRvxM5Ep
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_113155_667943_479F23B9 
X-CRM114-Status: GOOD (  11.52  )
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


