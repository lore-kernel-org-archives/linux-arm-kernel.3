Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93086C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hAdkFjzlZ96J9ZvADDEOxzZCwxKXpOY5bpgjR9cuyI=; b=GP3t47P5QZcLpdaU2vGKJsGqDl
	+M5LHVQk21ZWGGg23Jrtfl8Eq1BKHyaFKVt6ddRoPkZMR9zrxTknRLkCBBPvBosADuPSMbscCGVF6
	PpNdHYkZpBDHgXvDr+oNivGFs8kkOb1eW5+cJH3a4XB30rYvApBIHLMlzn8UB0MGUY+EY5z1w5yid
	JxQWvjWrIOlCvx+1mqsNrZVZfg0CnY1I/muDHt2Wx6iEdNtVvXcwR4zqxWcLrugQf5ocxmD52GhSh
	gnRmx7FbqrQIQN6pmuHhrLOOHU+1b3xKJglao4wDmj6lPoPadgX0liN89UAP1hketgpLAgmATnYVB
	tS5ROqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMEc-00000009umm-0OWR;
	Thu, 17 Jul 2025 10:53:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLvH-00000009qeB-3qW3;
	Thu, 17 Jul 2025 10:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5hAdkFjzlZ96J9ZvADDEOxzZCwxKXpOY5bpgjR9cuyI=; b=rBHwhE5idsTSPbvXznsw8R89Hk
	tVb9e+N2OxSBWWnWqVqFOnRqYR62IHbkHIRc5+RkwbqbT4xiyiFem0ZkiVvnHNX+oOjU5ixlHHf2u
	7nt/hoCSXV6wcNc9fGFsGABHA6mMW8dYxuRVKadu1L7tLVXyN8nSiennvoOR0jXTYak694VE85/X7
	Q0DWRtbyYQzmKDqrRFtbJOJsfKUvI3P5IjClZb+f56gNYP7MZ4YfEH/l7f/G3+FaB0ilzBaWvzqt4
	vKhDil0CmOIMc2q1MOxQ0WPUzahq8rOhiyE8Mtw6x9S0KwUJfoAviFpVd3ocgzrPDfKYYxeZVPelc
	Xi8e4F9g==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLvF-0000000AFqB-0Zlz;
	Thu, 17 Jul 2025 10:33:06 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3b45edf2303so700823f8f.2;
        Thu, 17 Jul 2025 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748383; x=1753353183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hAdkFjzlZ96J9ZvADDEOxzZCwxKXpOY5bpgjR9cuyI=;
        b=X/pMkgQB1Wm05b3Hl32aKl/T5OJqlz7jlNtgvekpSdEGMXV+M1z9dsQgcUrEeooAVJ
         WtNS0x+gH/8exvOzNtedbNPe0amYWgogdlXwZo5bKAGIYYBdEPEn/FgAEQtfpAR1iTfM
         mMKHkLo9jE61DQ6NmWbClfbyQ45LAHc0XtLWcwkYM2AXBYnarXC6aTRbtYsr5IdgLz3b
         CGimgKobqglLnppWnskhVR2O+MfvMIO8KFa1ZPhUL34y1/DCrg7b8S0V2p2Vk6RdhcN/
         s+BMWY+hgd+ixnYmslras3nfp69S2Se8Sc8mMmtstKkTVVAKFhrL4vOjNSHXdeM6O+WA
         i7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748383; x=1753353183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hAdkFjzlZ96J9ZvADDEOxzZCwxKXpOY5bpgjR9cuyI=;
        b=adv1JHb7D1cfm2Z4VcC9SAYEO3AO36g8BQJY52I4U9PF6597Ii+84V0uQmw4bSTqKw
         4nZh6jp4r+7v6AbgKwMihCkuw+d5yX1MnqgflWLceE3/Pb6p1QRjHCRNiJriSXUXycY4
         HK2JElkbcezwQo6WPsyNyLRAMYetPBOmFJxBTg3fNMUvKpPnYwHG/o+sQte1j2yK545S
         OkbBYI9abnIq1Y1wFEdMhVZqN7uhCfEHmMOh2+uLe/JK9uJxl15H0saqTvM4x5FY0ZyY
         UfK5lYZB5dRVyuv3kRyHJ0HNZfy1+Pz7KqmpHPjTjxXGu+xPSiSWtUu7/1EBLGi8ygNd
         uDaA==
X-Forwarded-Encrypted: i=1; AJvYcCVtkqy5OkZlo11I0v+hVc05LnbHHa9dWf0i4LpSj5aR0p5wtf3+2Dw4ZfUYMAcHgbZG3D6Tw4/eyhXFzXw=@lists.infradead.org, AJvYcCXplLgazXYCkaDIwhw0LOnvVh3qkf31TKrhOVwrluUPi3HfW77zv6H3Xh/6+bgc2TvDsWcbt/seZLD0nigNY+9H@lists.infradead.org
X-Gm-Message-State: AOJu0YzeCmylooO53WRfdyWaVsX8KI8nXIgZBUGS4V5ghdlQBNe/Q5S6
	md5c8z4yINEMCPwEyNNp5E7xCM48yAH/pKimHIkhGKALgyLhdlWCfAhd
X-Gm-Gg: ASbGncuCdD/pL5N49Gju3VOo9rKkZpiTsWVG41gY33rm0a3uhyTjmEi0nyt+Uu3m6sy
	eWR2eVZ9fmAX4dszAH8kRF2r1NEnrMUiUkdkenQLkwFxM6o3bmUdhjZ2GlE9I5gvT/oP5nRWHmX
	Xm9uhSZ6HDEE+gPr8bwGPmYknlCbph8CbzRKltYWkTTEmEcxjeGcROheKFLQvMUYEj1tt0Ncns0
	oykkgm/b383CBJ71p0wmPOtsDwA455suItsMjSxKEqyhM5clxB99oeE3E3bHtM6N5IaDwZ7B1Lf
	0aabUaEhOJaqka5Rz383iRkFqB0BEWS6UiHfQZQ7qgQ3T+licxaimDbXFeoSf2MHCKT9a8w+Xcr
	1GFcmMRKsrMo6P+ZGs5LXXgf902ypslFevnBaEYmgUrAbkD6Rb45R42t5y7q1nihmhon8hN7pRt
	QHJucvCGhcJa4yCrza8LxyWfNP
X-Google-Smtp-Source: AGHT+IEqfCFpIQcuogdtVlks+s7mtGT9PHZg7lN5UDyP9j1DEHEgnDRrYCSmStX9iLPaLpOJf76oyg==
X-Received: by 2002:a05:6000:1ac9:b0:3b6:d7c:f4ce with SMTP id ffacd0b85a97d-3b60dd88801mr5936545f8f.54.1752748382518;
        Thu, 17 Jul 2025 03:33:02 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b612db7060sm2629613f8f.52.2025.07.17.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:33:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] soc/tegra: pmc: Derive PMC context from syscore ops
Date: Thu, 17 Jul 2025 12:32:41 +0200
Message-ID: <20250717103241.2806798-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_113305_316810_555CCCB4 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

From: Thierry Reding <treding@nvidia.com>

Rather than relying on a global variable, make use of the fact that the
syscore ops are embedded in the PMC context and can be obtained via
container_of().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 455e55cbd2cc..a5c179636a69 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3143,6 +3143,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 
 static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
 	u32 status, mask;
 	unsigned int i;
 
@@ -3156,6 +3157,8 @@ static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 
 static int tegra186_pmc_wake_syscore_suspend(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
+
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
-- 
2.50.0


