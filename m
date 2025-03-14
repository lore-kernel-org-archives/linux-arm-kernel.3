Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C45C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NUgcdMszcZT79fuSYG7PG9+8zG6HmJmlZyIf7W0iDLk=; b=Ecrzbif3wpf0YtiSZN+f4nqWlq
	ScgYYfqv3sgS2DyNCxOdR1ZmLChlf5ZGAW7QXVHEy9PDeEIpwmSdVX2kDxWaqBoItbCJlb1FhBRkG
	Zt0M8E2V/CCnwm5kDn1rDeQMiI8UUL2xG++XH5XpRRZlW5kqPLz1C3cyX/boBvC+YvPZxkqtpUEG1
	wm6TImCk7oUEoh/4JGFactZKHYAjPmc3+0xHYfvDhNfXAIybLuCZzJHLelLQ9db2A6xPVzAbytyRy
	stt5lNxzyivS3e2ZCfTc0Gz4rVRx075lAaOMi3a3Nz1GfS1RCzUUWttkqS7CD679vQhfyBBFP5KA1
	swoCNqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1v3-0000000Dlva-027W;
	Fri, 14 Mar 2025 10:05:33 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1qx-0000000Dl1d-2DJc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:01:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-549a4a4400aso2107214e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946478; x=1742551278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NUgcdMszcZT79fuSYG7PG9+8zG6HmJmlZyIf7W0iDLk=;
        b=iKjFXwjUG6mBlU/g9XLBPo/jP1t6tQk0j8eehC9/gp00UWl4X9pb326xA/pjJqdmU8
         RLOABBmeZBbaX183q78MffMflHETf62kknRcYnbiXRIrkhVveqWoIY/2qANwTZ1buCb1
         CWIFoG1nA+0iNh1+QijNfhlybGcraMV8x/sd1jwoQ7HDu5mZZf72/zTG6yPztteg740M
         SS7G9PiDC3mqfhCMW2W5eTdCftrjywMd1YTPssUFg85F8I6mrpJ7+XB+e76wG8N6NKai
         ylzKB30fWBHB4W++GVzjnec+2rI7xZKvj7zYBQvRmlKZaSb1av+UQH7dLRqlUWNvxGX2
         xY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946478; x=1742551278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUgcdMszcZT79fuSYG7PG9+8zG6HmJmlZyIf7W0iDLk=;
        b=AfHy7cXvTWAib4fmgb6bkoLD3Euq3TVUTFfOIGpSNCDh3Slw6xb928kCYMxvvPU0gy
         7E3d8QvV67a7b/nXkLzOvdSqZOXuOJQAEM2IU1CqK2vIisGTozGGYpVU+tdACjgY8aci
         k1ftj4DQ6n0cjZw6awhep/pjgrmb3XuafBc+JuDba5zAIsgZaqyfOavQ2NRMBPNtaYy3
         WLfFxR3DUl+xTuhJHIUvGVwIsHdiHPLoR+De3S8C3qG4iZ/4up/jVSzB0P6/6DslhNi7
         WMb1MnequgEZdbCmPlpF2frGgfMfzyeKHF3xu+JsBCantmX+9hmsztDWyTDJcoidfbKG
         rVHA==
X-Forwarded-Encrypted: i=1; AJvYcCWB5cBrXMr7TUN4Evxv/RSVJiCsbgf/xnGNNDC13Jq0jZ06z1gxoAWKLa3CaWj1vXHF7NqkFhbxzrvNEXhVpBB2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3B+K8f2Ya1Zqn9y8jt6QTo0k0L61DFnDNQ1frNB28JKO8OcRz
	R9DWL7i3CpGW98Ff8AuDeZ8y4lVLJ3RYavOWNMxgQHWR3BTw7+Dqe8hMcafxqas=
X-Gm-Gg: ASbGnctDzWlYwfD3Nj0OH+B3gs/idR07d152Nl2N4j7KqfDN1WedYAcJBO7NtBkXYq4
	QHrPbCUNvQq3Z4zySc7la+FvDiTXcxwx16/VLiLoeyfPT/p9LCEIdELM0fJQuso6cISkJp0K/Hr
	gkgwphbDVH2NjOUa2IaHZGoJJJzrPMTeOKg20HKPql7aJHIRVPjG3eJOWXr6YfLJ2318RgSHeYv
	AVIXSjdp88YR8JWRJ9jbMrtZAVSrv8sP2Vn/T603LFRV1xu0JG5XnwdNWcuSgy62XlzIR9lZXmR
	gP4vo+8HAn8BKFU7/4+AT9btJroSh1Qj5YqcabTNqlZ9WqEgbdvgObURi539BrEeMN8n0+77sqF
	uOugbR0twbf/dTGZrEJw=
X-Google-Smtp-Source: AGHT+IFr9G0sLdjjGzAEmSADvTJYSJ3/q7bZeLPAORPr3YpjeuD+P4b+VCcMRGSP60Xi47buAS1RYQ==
X-Received: by 2002:a05:6512:23a9:b0:549:8d07:ff0d with SMTP id 2adb3069b0e04-549c3987fa1mr605518e87.45.1741946477176;
        Fri, 14 Mar 2025 03:01:17 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea468sm5168221fa.41.2025.03.14.03.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:01:15 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-pm@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] pmdomain/cpuidle-psci: Improve domain-idlestate statistics
Date: Fri, 14 Mar 2025 11:00:54 +0100
Message-ID: <20250314100103.1294715-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030119_563761_1F4B10BB 
X-CRM114-Status: UNSURE (   9.10  )
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

This series improves and extends the support for domain-idlestates statistic
for genpd and the cpuidle-psci-domain. More information is available in each
commit message.

Please help to review and test!

Kind regards
Ulf Hansson

Ulf Hansson (4):
  pmdomain: core: Add genpd helper to correct the usage/rejected
    counters
  cpuidle: psci: Move the per CPU variable domain_state to a struct
  cpuidle: psci: Correct the domain-idlestate statistics in debugfs
  pmdomain: core: Add residency reflection for domain-idlestates to
    debugfs

 drivers/cpuidle/cpuidle-psci-domain.c |  2 +-
 drivers/cpuidle/cpuidle-psci.c        | 40 ++++++++++++-----
 drivers/cpuidle/cpuidle-psci.h        |  4 +-
 drivers/pmdomain/core.c               | 65 +++++++++++++++++++++++++--
 drivers/pmdomain/governor.c           |  2 +
 include/linux/pm_domain.h             | 10 +++++
 6 files changed, 106 insertions(+), 17 deletions(-)

-- 
2.43.0


