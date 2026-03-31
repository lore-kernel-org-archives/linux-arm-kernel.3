Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514B210F92E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIPjhe0ooozuU4t14Rzg0U/ZHVJIieutYDq/fthQq0s=; b=vV8iCXto4+b9bOw/oiyP81vuBq
	NMgIlPDamF7UQIZT0Cucq6uU4QOjAWjP9QEBLuKoBboSck1L8+4SbyH5iKg/QNd9O2X0bE6II/Iwe
	0Vd3w10oglsZhizd5JVuB3sjkhLS6LCyUqQYIkoQCMdrcq8JWxNkpdhM6cOhElkUCDy8Tz2V/eQUJ
	KVq/A9S817eX4UII0XclCpMu5LR9e5vOJ66o9W7Zv4j3c19+yCqBfZ7QNo/0J6BGgBtGJIkKR2ml7
	Ms5Bc69G1xWCcEtrkNQh4vRkVlx/P8SeU3ynPYWf9qwFllkEtPh94bFQOwcT1FrRwAqwbAz/Ekki6
	hBysB5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dQh-0000000DONK-3brp;
	Tue, 31 Mar 2026 18:03:07 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dQe-0000000DOLf-2x9h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 18:03:05 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3000083a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 11:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orb-net.20230601.gappssmtp.com; s=20230601; t=1774980184; x=1775584984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIPjhe0ooozuU4t14Rzg0U/ZHVJIieutYDq/fthQq0s=;
        b=gQ1h3g6mxU7PqCvlHEvI7k5uBXWkl19a004LtBWZol1qDaPbYq4RFVBdcbVraohJcE
         rSf1xeMupfbWXVstfD21HvMDkaExxnrV+IKli5Pn/+ILJuTnPbdGjoq9yt+HoWfIAemj
         C3/wEB4MCoVwilEMHFNyuc+qlhZGU64dNa3wh/t4xORT1LXL42UUZwYpKdm7apUHHW8+
         bOFyVcVga4535UhK7pJxhzdBBWIEBS22xwjnZyllt6WVyz0JWy4kMATTlFxJE7NKoamM
         zEqC6vLwODpXKfwnuzZXy01yJ1CNM9olpeQiXViWI1G6soHFsGiIHwvR/pt7M9KqtCnd
         SNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980184; x=1775584984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FIPjhe0ooozuU4t14Rzg0U/ZHVJIieutYDq/fthQq0s=;
        b=GGSC2FdTyOwd/MEgp2WCbPIRHT4dqfI5AWU91N8qA2JH5FYLSO1E9JhP7KZE1Bxmg3
         2x0QYb1lWOyoLV1CsIKO8OSg3M7k+xYu9yplaUIGYY2y/J/qJ0eAJNjd7hBja8gNCfiy
         0EDI9twKlTrF0tqQ6GSKUkCP4uxTG1HCoEplNrwaxHmNBJsKOfSByLA4hiLQXjae+6pb
         GPc05qjPF2ennuqlJF8OEheZhUJ1ywdxJR+gFHxKEDswRzG57lqZIYk+gqyEEHMTsP4i
         cdwWHVgqEaIhkF9nA4+CsMTmlSivuoH9siRI34LnwZRHiixYH9p0bduZat0DQbO0f+ok
         ZcMA==
X-Forwarded-Encrypted: i=1; AJvYcCXg5iC+jNt9J6/huoxZwuYft2IegV1pPHND7UIMTY6q1mvxD99/EwC4poT6L6dvdsO2O+yf/Y03dc+XqnjrklTX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0h8Q7nmPHdl+vyGKors4EwEHxw+OWt4rF366cr00flBf2xbIx
	ZQ0SZSxMPMzh43Q8fNBGycAeil0K1m+Tl4uNdJxULJAtowqcavDf5j52SPnlFj3BCGk=
X-Gm-Gg: ATEYQzy8rFoYtvTt8TQRqiO88ktaqr2fURYl50vGFtS5k7qKZK4UZacxE+oeWcLHETF
	gKFkTHAOYLsK14XOWzo9rkcmVGzRBoOGVGcS8K1epOLaLuQHaKm/oMniVBiq7pBVAnVVEQbrc9O
	ArCCwpf3zN8N9+IcSJjkfeMGJB4mxU3hl+9k9fOBv6HOCzEe1M3wQk8LeBoSC2xRYxohE5ambuF
	slK24TQb/PwfamwB+yPmd4mLncT3VzrKEoc7itAkpefiq1vEhwVv0pSox7nqBmivrWMFmO8acN3
	a+RrK9SZlLyGmtmkStoX9853c+bWreiOkBHCk3l4p9sY/IQQA8KKuDrKhnocK+fWaeZc0/MHUyA
	p/LWFiP06NVt6MnZQctByrR3au3j7xT5/k5sxpbwfCodyCucKqUE5rRDJ/gnd9uYoA0l6RS0rM/
	p71XVjkplRKG71rw1kzKSe4nynf/Z012iyFL99Os7YM+lcJtNyXT2dScAdBxnPNw/zbtu0sjYHK
	Tq3oA==
X-Received: by 2002:a17:902:ea05:b0:2b0:5548:7d84 with SMTP id d9443c01a7336-2b269cce951mr1369705ad.48.1774980183702;
        Tue, 31 Mar 2026 11:03:03 -0700 (PDT)
Received: from claude-dev.lan ([50.125.94.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242680132sm125240315ad.32.2026.03.31.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:03:03 -0700 (PDT)
From: Daniel Bozeman <daniel@orb.net>
To: ulf.hansson@linaro.org,
	heiko@sntech.de
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Bozeman <daniel@orb.net>
Subject: [PATCH 2/2] pmdomain/rockchip: skip domains returning -EPROBE_DEFER
Date: Tue, 31 Mar 2026 18:02:23 +0000
Message-ID: <20260331180223.1682283-2-daniel@orb.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331180223.1682283-1-daniel@orb.net>
References: <20260331180223.1682283-1-daniel@orb.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_110304_735268_08F9C0B5 
X-CRM114-Status: GOOD (  12.65  )
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

When iterating child nodes during probe, a single domain returning
-EPROBE_DEFER (e.g. due to clock dependencies not yet available)
causes the entire power domain controller to fail and tear down all
successfully registered domains.

This creates a window where devices in unrelated power domains that
would have registered successfully cannot access their hardware. On
RK3528, PD_GPU requires CRU clocks that may not be available yet,
but the idle-only domains (PD_RKVENC, PD_VO, PD_VPU) have no clock
requirements. When the controller fails due to PD_GPU, GPIO
controllers in PD_RKVENC become inaccessible, leading to synchronous
external aborts when GPIO-controlled regulators probe.

Skip domains that return -EPROBE_DEFER and continue registering the
rest. Skipped domains have NULL entries in the provider, causing
their consumers to receive -ENOENT and defer until available.

Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
Signed-off-by: Daniel Bozeman <daniel@orb.net>
---
 drivers/pmdomain/rockchip/pm-domains.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 2eecae092a..f42880c94f 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -1077,6 +1077,11 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	for_each_available_child_of_node_scoped(np, node) {
 		error = rockchip_pm_add_one_domain(pmu, node);
 		if (error) {
+			if (error == -EPROBE_DEFER) {
+				dev_dbg(dev, "skipped node %pOFn, dependencies not yet available\n",
+					node);
+				continue;
+			}
 			dev_err(dev, "failed to handle node %pOFn: %d\n",
 				node, error);
 			goto err_out;
-- 
2.43.0


