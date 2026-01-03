Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31B2FC6177
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pWZkKPiFtnR/rs3kiMr68GAakSXnMiP1ZnZ9OMgWTpU=; b=E61VdowrgfMIQUzlMoZudDdyIH
	m5p38kaE6+SyQWzPsofUBMAGyiZoH5gBnCTIuODeti/KjlA1PFpmzZtDGaUXfkyULOiGGCbCxkl2+
	5iaHhRfOA90EviNfBvO/fbgkjGH46N7mCHLgyPEVLSuUH9RLh260OKHwQCQQccnz769SStcmDoJ9g
	YabEGxIQaW5EssAoR8wncrfEEcSJIze7a+KpdWDE5u2jXwOnMACIKvFpSgfnSTS390g9QkczGoodS
	cOKo5lz9q+it3yFe6FJEWvj+BdRnYHn550EH10BHhT942kj08T/3C3bBGYkUt5Yz3VwfjVzITeNJx
	MrMYW5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vby58-000000099h6-1IaN;
	Sat, 03 Jan 2026 09:37:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vby55-000000099gk-4AO5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 09:37:57 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-598f8136a24so14125033e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 01:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767433073; x=1768037873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pWZkKPiFtnR/rs3kiMr68GAakSXnMiP1ZnZ9OMgWTpU=;
        b=d9ZaLEagQeL/arg+56M/YTJZ8SjfwI5nW9hHR8LZ0biCZntkCu9lxulFm1+wHwwtUE
         O0E5BIOeBPPJcrbDhZKU1NA5yOjHIVjlyuu383Ehaza7GKqhLPDycXmEDo3JvJtR3LOL
         aDXwjeDISDafJFW3KkKHQY0lhJu12YxD2LDKZIP+8pnQqGkdqHMxpj5m1ysymMg5wPF1
         n4/0JuiRHPSxD9IXPxsnamDvpz3o2I7MhjN5ULEIe6LFEJ8E5YEHGtRkpeV8LqOw/iEe
         iRflB8lR+ZQyAzK5g06hP6F4KEPkcpfir+x79ZnackMtYee/8hjKsMBjtMYGQlhyCFyl
         Jzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767433073; x=1768037873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWZkKPiFtnR/rs3kiMr68GAakSXnMiP1ZnZ9OMgWTpU=;
        b=IiTcIjHIjlNEJDl2S417Eh2E4ujju5PKZ6V+YEkozHNLsPI2hz79FPQOEIq9TVk2gf
         jYvWeXfY0qK+Tw8mYDcPRtr0suLDPmHrP2x2NB0J0MzLWtaLmvCjHTP5J018Org9TWyZ
         AbzW1UEQ/IusTAYz4kP7khUwMBcT12zzry62XFu3Gb9Xzd/o1cjxexZbx8BLMYVn9xSW
         buFkk5HXOkENa6jtVCL6UW/ghpjLtrcMGBzAkHZtwQeIElX/FplIHXDHy2rgl9xXjEiV
         VFbZwg4t4/P6xI1QIFUrqXJa7mf66L8LUx4I0y4GUxMjFFjGaXWJ/CoyKjapzKEEa5Mk
         Jo2g==
X-Forwarded-Encrypted: i=1; AJvYcCX+6XVL8uZwOjI4JuEmkrWU4Aj30Yj2hwgO1LyqQnG2u/BuVRGnavBWhqbspmsGUlrJoQ8lwKlrAt2izrAN34sK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/JkuGlzk/uyz89/eL9BrgC8J/Z4EIEyLd+rzs5LcWn6mZICZV
	l1fm69tHOkO4de/YR1LdaKchLKPnQqiQn2NSnr33octvjSeOdv+soDP9DU03qhsRnQE=
X-Gm-Gg: AY/fxX7o3ZHCRSWC3HH6jlgUR8Pm/xYvF/ILRx5fbnkJ8ok5LVK9GqlQagI4+5L6GzH
	BJfcgogg2iPfpUj/Dz/bBxtSt6aeb+zh44cl5+RcD8UfAACVpCL5eLDlYTzAQAi963R0DSsBWWM
	kovzHrs2NDsV5+0L/90OHm7RA8/T+A/CuWxrqazlobaRAY95ux4IMVGjVUeJFfIjvl33LwMXl9K
	uMWbRUcDn6u6ur0AL7h/P72MGiEKHrUqACv47fIYagQepH0HJa2VnZsOL9PxqELMmalRUhKp/yB
	uzxySZUCcfgVStu8MGMCqVR+EqAQTlckRGMEbTd5/Hoyry5Z/SBen9oJrVXbDSL6BhT/NNNpf6h
	HFVEoQG18z5EsfGpB/zt+8KTk0EZ8Re0bqFGi+vulbSaFWnMLxGy5oM4oc99I2G19YFo7pLoAvG
	czTcI+wf1YbRBozWShHsNkmVxVMzqtFm2Rs+ENisIdcxRw4zU9mTI7d0hZZdJM
X-Google-Smtp-Source: AGHT+IE+2jMoWfH0mG2kim3lvOWpG5hQP8AXw3e+htxPH4TjM8NTe2jcV7wlyub4Ua3gnsY82BxoQQ==
X-Received: by 2002:a05:6512:747:b0:59b:29b0:11e9 with SMTP id 2adb3069b0e04-59b29b01201mr7236169e87.53.1767433072874;
        Sat, 03 Jan 2026 01:37:52 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ddc12sm12970431e87.37.2026.01.03.01.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:37:52 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.19-rc4
Date: Sat,  3 Jan 2026 10:37:51 +0100
Message-ID: <20260103093751.58526-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_013756_069735_38CCE0EC 
X-CRM114-Status: UNSURE (   8.53  )
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

Here's a pull-request with a couple of pmdomain fixes intended for v6.19-rc4.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19-rc3

for you to fetch changes up to 73cb5f6eafb0ac7aea8cdeb8ff12981aa741d8fb:

  pmdomain: imx: Fix reference count leak in imx_gpc_probe() (2025-12-29 11:41:09 +0100)

----------------------------------------------------------------
pmdomain providers:
 - mediatek: Fix spinlock recursion fix during probe
 - imx: Fix reference count leak during probe

----------------------------------------------------------------
Macpaul Lin (1):
      pmdomain: mtk-pm-domains: Fix spinlock recursion fix in probe

Wentao Liang (1):
      pmdomain: imx: Fix reference count leak in imx_gpc_probe()

 drivers/pmdomain/imx/gpc.c                 |  5 ++---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 21 ++++++---------------
 2 files changed, 8 insertions(+), 18 deletions(-)

