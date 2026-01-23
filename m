Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EB3D7237B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kjcefJz4wS8+wx0G0+wWmYZBrJXxWpwsLQGj5HJOf1Y=; b=WDjMmiHq09pTi8DCt7Yu5VSpUq
	8UXpvg2Nq9Orcw/FG8aolZZEUZsZ1xDuvti1evi6NVFAFY/wclRNdvtxLItwHZQxIEqja3IbfMNqo
	Be3grkTdZC9t1PzcMzRxnWzinPAYkRZlRx3U/OfObENM/0tYAmwdwX/tqvzQjelUeiDref8TZRBhg
	p2FSfS6/aiEjwC/PuKvES27ZZ0sNQ7+hPid+LItaSKscl259lX+nDW98p9Eo+g62EHojBCyI7SvCd
	UdYbB4QwbGA33FQTetJ4x2IGpiCDI/Pfqaf9OGBbMjlsaDbnUWT/mBquoOyqOQURfUN9NZJD5hcsp
	JA+bGLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjG3n-00000008tF5-1Gza;
	Fri, 23 Jan 2026 12:14:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjG3j-00000008tEN-0x5D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:14:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59dd263bf42so2587222e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769170477; x=1769775277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjcefJz4wS8+wx0G0+wWmYZBrJXxWpwsLQGj5HJOf1Y=;
        b=jjbkFzlGxczd6W+W+a6tEJTTdIupx1n46240zCldl8kw5cuDZWaGLlFsiatR3c1Hpz
         +q5TZA3k/Q0CPQkn5JH/CWGTe4MfrimRO7kyFSKkp1YHAznIeC5kZL81IEIeMU/G/7cW
         mLU059MJHRpgaY7D/NiqfXsY+u0vNeJ0GhpwYRG8OH6YQV4SJKSDL5nb9K0uf7AVry1k
         6J7p054HRBjZwcLweIzWAWi24DPhbHs9mwbAYW4nVJs0PbF6Yzl4+2IbIRHuS0/ka67/
         9CYTuI4V80FfsK02g6+lLepQTXfDrzJv1RpurzfC91wCtOVsI5UWhN0vsesgAUv1oZ5w
         4g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170477; x=1769775277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjcefJz4wS8+wx0G0+wWmYZBrJXxWpwsLQGj5HJOf1Y=;
        b=HF51pKkBlxyBEukTsnD32xa7ko+fWWhYZETlWYYGTyU4ty6/Z3JhofbuvM+FbNhgKL
         CY98DNmaV4DCFMjJzyzfW+qKhGd7i93yZ0B5luTF6bSJL6dzXPAUiNQVMukPYZpUQ5cz
         i037NvuBYQEeC15QicM/Y6+emJdOFJSyLsIi+NwPmevw5/GTEqnf9wZmNvYgWaUWJsdo
         c8JuNcaFvDe73HZ/0S2t8j5xLuU+pQ9NRxE2KhjzVGm622aShhwuW8s9zYbRJ6kyATHa
         w5YBr8Endx9y1Mk8CrDp93k+GxsvnwNBf/K8iN38dYy2VkEGoJpPWaOgz8AXvJx8Nw8B
         uGLw==
X-Forwarded-Encrypted: i=1; AJvYcCUa6HL/SzoFtzluPDuzqJRGdIhf0Ut0AgV/ir5P47r+uM7pM0Xd0PoT78wckxsp/unq2YDym71dxAOJ/A3nR5Z+@lists.infradead.org
X-Gm-Message-State: AOJu0YwsmPPucipEV7Mg8kkjMRqyZ09N2TsY5gZOY/VA/S76xzD0jicc
	mZ0Iykz5S4/8wf6HEGlTcziJha9VkAikHZofbnq4KE18f2/K+iDgu0Td31JfY761he0=
X-Gm-Gg: AZuq6aLVjlnf16hA6E+UjPWyAWRzHyaHbc4k7SUxtXYTm/9MO5W7K/0aEDEzxbrXpi4
	jq3/KAE2ujEC0CzLTYLABhC163nYuUnbiR9RdJJ+qUnyZZ3OF1L5Hhid2Ot9EgnouzIVjTSctPi
	cRA2wbID9916fKKbnwHHCYtc4RULPIMuvOPI7AEjp5TvC6x2tK2yV5Y9kUqFeE1MuWvjk5r152f
	x2v81+in2wHSTS0nBSu/vaYffPvrP6lGxEogztJp6gVOESuahHUN24ugSf9DoRDx5CgfUUk40fJ
	1QmR0Lhujhb69D7kBJ1h0c4izISJ09RQBAqcbJ8IABGSv3Q8yEzM2Rou9927jjpfCepyZ672O51
	U3USAIfilXLFczzRH8NuGIAuCKDbOAPbfVomaUxzcA2Qa7yHTHl51OJMXc21lX0e7Cok2nc0NjX
	CgbvOklr867/GHI56nGxu1+izE3StEGz4QZRd22nRimbscIZDqijO5alY6hXj4
X-Received: by 2002:a05:6512:3dab:b0:59d:e93e:a8ae with SMTP id 2adb3069b0e04-59de93ea9demr413953e87.47.1769170476892;
        Fri, 23 Jan 2026 04:14:36 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48eb4d1sm639031e87.39.2026.01.23.04.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:14:36 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.19-rc7
Date: Fri, 23 Jan 2026 13:14:35 +0100
Message-ID: <20260123121435.245253-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_041439_285503_DE9A9161 
X-CRM114-Status: UNSURE (   8.26  )
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

Here's a pull-request with a couple of pmdomain fixes intended for v6.19-rc7.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 73cb5f6eafb0ac7aea8cdeb8ff12981aa741d8fb:

  pmdomain: imx: Fix reference count leak in imx_gpc_probe() (2025-12-29 11:41:09 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19-rc3-2

for you to fetch changes up to 861d21c43c98478eef70e68e31d4ff86400c6ef7:

  pmdomain:rockchip: Fix init genpd as GENPD_STATE_ON before regulator ready (2026-01-15 13:39:16 +0100)

----------------------------------------------------------------
pmdomain providers:
 - imx: Remove incorrect reset/clock mask for 8mq vpu
 - rockchip: Fix initial state of PM domain

----------------------------------------------------------------
Frank Zhang (1):
      pmdomain:rockchip: Fix init genpd as GENPD_STATE_ON before regulator ready

Ming Qian (1):
      pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8mq vpu

 drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 11 +++++++----
 drivers/pmdomain/rockchip/pm-domains.c | 10 ++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

