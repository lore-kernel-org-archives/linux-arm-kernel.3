Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C22CCE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cSNhX2pkt7zcNqtt73B/SxXjHG2Uh9RLAgF3dQ2MWK8=; b=h253fOl2NDFxqUaWrt3o6X47To
	u98VS+8ow2a1HLG+1h5kNGoYzyd1e47Ogohbw6o+7dTirA5RtBVCU3cGoK5W58/iGbdLsVFKPuZZ2
	R21p5HDDJ1h0eWEkEmiH2N7go+cwK6KK/Wbw9Hfdq2F86OP0ioAy8tT1T838zE1ypH9JlWpS8FHKU
	L5/a4AQwzqBdD1P+6UtDGUsmZSBRIJBa+5VJbrFw3kUgeGbKFTC7aKo24PXdiwZ86NnpxM92HC8qY
	i/sBLQFb4DWS1GhBIKo6IrE8meubwgkco35o9Dwe5YfMfNljP0Mj1O3sNDe1FfIbGlw99dheE8shg
	PpZjNKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwP0-0000000CiEZ-3C3L;
	Fri, 14 Nov 2025 16:11:58 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwOy-0000000CiE4-48Pc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:11:58 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-37775ed97daso30206991fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 08:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763136715; x=1763741515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSNhX2pkt7zcNqtt73B/SxXjHG2Uh9RLAgF3dQ2MWK8=;
        b=h/lhJmC7O0wP+Ut9UaLwHoLiDNfmUbGY36ZAoalf4yAnZCBMPdn355BMYMtwv0kvgB
         i6sJxd9R5buVxVofG6Gg7zFkgcYfDcHDnWi7kAQ2tH6u4yDZmfnbUd3PQskl07EosAyZ
         V7PvMcW/67VITk6GvdozvKwG6ZDRUiUo2kOFcQd8JFGc4GrmTKk2CI1aGBUzKUKbyVtb
         PNd7o90SH5qXjfOqXR2rxcB3kNm2Bi+dX+zXlA1a4TfFhKdqa1KIiPNJORjbEBtX3Pr2
         rs2s6+BA5CuRpqrYSUqpP856E5Tr9dJhoXt+XEwV4eIrZk3kz03PnFunH5N9Xj+iAKZ/
         pj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763136715; x=1763741515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSNhX2pkt7zcNqtt73B/SxXjHG2Uh9RLAgF3dQ2MWK8=;
        b=Avh9G7DQP8DifSWEFNu2jPmjKRWPJdmbBJnabWZD9vfM8DzaOUYfPcDY9fSbdFXa8V
         wEJM8JxZ1eu1IjTaHtO5a/lSgyQO42Gz/PeHcWkgXpFHeJJKNOhSra85UeAUmLl3h8K3
         1MID6QtiL3UbRbfq7Zg8wD0KlumtxPhvT76q6e8kODzdVqvRRF1omJ6huPA5fvf/gi2x
         UlFIUg3ZceDCk47Fb4pa+U8kj4k76sbi49Tqlbx2R+S7T5n7JNE8wPqyV74BWhWZEGfS
         Q9C2ss25D5xf7LN8WSjO6n4SC4YYCVmEoGWD+1YhSCBAKHDFQAl4PqKVMkwFTmgIVZta
         8DBg==
X-Forwarded-Encrypted: i=1; AJvYcCU5aVKMQhkwZ3Jrz2GARce6/fP9UsygyFKVK9jzEJK8c8QAtX0PV++oLiTFvh9utrnbU88fSipNyZIcMjew9u9s@lists.infradead.org
X-Gm-Message-State: AOJu0YyUi1BdXScJOR74i6g7kAnPArn6VKqvAIg7QBw7vFiZdfKY/K6Q
	KfLMmuL7X8iETjpZrw+RGu7Rk0+1q0SiSIzFo/aLMmThENsOwAwhzTrX3EW0pR/Plc+cyJEtAgO
	FXELj
X-Gm-Gg: ASbGncv/YN02Q0f1h9fr9xtJBXJWtZ+OicBK6ks/PLnerhNmvimvUZyqwAmUiSPfuM/
	O/5P3+Ah22+6RGc4UFpbvRmmpzk95swBL7aYor5bbUYd7eFjD5JkikkHaWdnNbt0wb9yB2akpIs
	sC1vTvI8qyRV7f4HJMtGHnEu9uiOVvRACDhp4+Ovkl/vlJYYoOWS3xxbJIr4B+xcJGh7r231X8L
	V9b+fHEZAMnlS/n0XEwkup6LGE/DuhatHlblUsdCpn0ePpk8kT1R1neqODSZxbjVDXDF2dUqu18
	fEtzQpKBg7DGNHbipHrN4Fn+PJ+G8LjwqVedmjqrzAmSU+OR64hhqcQWVxR6W/0c3mcpio5AZhH
	rulCmib9L0rKCSAPrKbeNwoSQG4rDq4W26ensLyRzCd1T/p6N1mvEKJMJRqGI1e0KcXNmmWgri2
	gLK203sW1EwXBGEiORXumZZwOUx6hZQFSyiYAWRuSCUlzu4+Gg4A19zriPz+xu
X-Google-Smtp-Source: AGHT+IE/hPBAWD9qBVjQMVIn4EUSgwCIcA9zVNyR1z50W4cCJMeA0fLeL7x9Slc5b9xh7VmbI0rqbA==
X-Received: by 2002:a05:651c:3041:b0:372:221a:b124 with SMTP id 38308e7fff4ca-37baacd9bbamr8456321fa.0.1763136714550;
        Fri, 14 Nov 2025 08:11:54 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce080casm11520281fa.5.2025.11.14.08.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 08:11:53 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.18-rc6
Date: Fri, 14 Nov 2025 17:11:46 +0100
Message-ID: <20251114161152.92955-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_081157_052771_23534599 
X-CRM114-Status: UNSURE (   9.06  )
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

Hi Linus,

Here's a pull-request with a couple of pmdomain fixes intended for v6.18-rc6.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.18-rc2

for you to fetch changes up to bbde14682eba21d86f5f3d6fe2d371b1f97f1e61:

  pmdomain: imx: Fix reference count leak in imx_gpc_remove (2025-11-04 17:29:00 +0100)

----------------------------------------------------------------
pmdomain providers:
 - imx: Fix reference count leak in ->remove()
 - samsung: Rework legacy splash-screen handover workaround
 - samsung: Fix potential memleak during ->probe()
 - arm: Fix genpd leak on provider registration failure for scmi

----------------------------------------------------------------
André Draszik (1):
      pmdomain: samsung: plug potential memleak during probe

Marek Szyprowski (1):
      pmdomain: samsung: Rework legacy splash-screen handover workaround

Miaoqian Lin (1):
      pmdomain: imx: Fix reference count leak in imx_gpc_remove

Sudeep Holla (1):
      pmdomain: arm: scmi: Fix genpd leak on provider registration failure

 drivers/pmdomain/arm/scmi_pm_domain.c        | 13 +++++++++++--
 drivers/pmdomain/imx/gpc.c                   |  2 ++
 drivers/pmdomain/samsung/exynos-pm-domains.c | 29 ++++++++++++++--------------
 3 files changed, 27 insertions(+), 17 deletions(-)

