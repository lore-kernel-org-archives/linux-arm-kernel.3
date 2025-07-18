Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E376CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/nEPBqEpSBX6wiXaEWzWfHLx60QtO1oMIXeti88dk8Y=; b=vDKLdMx8V0eFMeBxPd794ZmkxP
	Vjb0aQTSL78RALSSIuNR9pRcdTws4WeGHmcJ7QYh6IYLgNxvAGMw/7qBxAeY+XyMAvuV7kXdAMqAS
	mS5hpf5n9GmYRrBzWxhGkE5KxCjy7dlAgOjz2hxwY1BJU+qJC+PaahwYNDSbGOcUPBgQI2Z97Fchc
	p+P5WT5y5loybEMRiZBy/FfhWzjXA4ZDqN1KGHRS2fj3fgENitNxaN0ps7i1B00hne3Q7DFfBHZhH
	mpigry+PXgxJH6A8RmccGAFIxSAJ3WnPdAksNFqiiqcoXbSBkT3zjSgruuJTlTMuNoSgyKJtQHwAx
	OyUZXN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckJV-0000000CakD-2eti;
	Fri, 18 Jul 2025 12:35:45 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjMm-0000000CTzP-2uxG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:35:05 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553d52cb80dso2300336e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752838503; x=1753443303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/nEPBqEpSBX6wiXaEWzWfHLx60QtO1oMIXeti88dk8Y=;
        b=Tud0cj4BPH1afu/WrI9VDUpThm7Umz9yDqDgMkA7Fx0yL+I2yioGi/dspmEFBSe5nb
         q9AvAPFZECdkfHc2voFCWtfVbdkHCDZhKCIpxCrrMxTJfMaaYBe5PFHL9TdETuYLq+cQ
         kc3Rji9KIiVEl6i2QKbfUSxxhRDsIXe/3znnH06ZlgDgkF4MOKHRGQSxAs4ol3RrfpPA
         LCoOp3XPZiG0KFTXWMuR90Msphc9MugXkaqEGpObqcdf0HdmfPCvSwlGZjVyFiTrDFCm
         cptiA1AajRAO6Zc2VzYjHc0RDL86Sp4zPZ+QW379XX3IysutvrBtYrBuUBXQlSSlZTSg
         R6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752838503; x=1753443303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nEPBqEpSBX6wiXaEWzWfHLx60QtO1oMIXeti88dk8Y=;
        b=mJtzXZuO+4c8ReD3PyghViTXOPo+GK0ng6FnajgZ6jGVmJ2laFETIeCGI1D85HdWwY
         S+pv6FcVUwuSqfbIDLdi8/E5khsCUQxffss6PAptvk0rWQd1CWjaC2fRuoW05qw3/oZf
         B59fzudE2vtNSL/yfGU5Ml/hzrsOU3FcdEWvtCmM37ELms9uoCj9MlNh18AP8nvBaf/d
         zEdcmfFAn/cTHt2reShAO4Bvn0v58FCkMk1FsIxmFPMbKA54QrnJvCx6HmiYRttti7Cy
         CtOfSk9JAPzL7ag9PqefGmfRRWap2BBkkYFeSUkUoXhwBlq49zivPiIIoFNISvKxl7kd
         PeEw==
X-Forwarded-Encrypted: i=1; AJvYcCWcWJt69AXkQ4iWJdf0ctN4NYBBoXUU/dgreMmspQTI0aammQ7xw503DWA5aW+GvTClYOG7euOKcUVG21bYNM7U@lists.infradead.org
X-Gm-Message-State: AOJu0Yx69gKZY5eEfaS3QWFxHz+nXoH5NNTfw7oM8Keqi9HZUUouVX4c
	aVZ3XGxyBoM+bNnWlQfDdGo/VUTV5TiTgqGiS4nP757FAYXpv9Xi/0X3tr+tm8UMayI=
X-Gm-Gg: ASbGncsjivCdpGyFF3x7Mspw1+rluQGyjx4C0duAtg7meyxowSPodWjXV2jINaVOPuO
	/nwo2FOjUkq1bUY5q1W912yPaQ+93iJruMmQUf9ysmCAiZ9cRgyyYsHf66JrhKfNHZeVbvs0QZf
	2Fpb4f3vFg4k+mLZkSW2wYN33hHCXQj8fqguuMkOB5XnE63OWCfy/saoemabeWzT/EbCAGMzYjj
	yXk6/zJeYnqoeX62mW7b+TtyIX31LT3xJXBWEnp09ARa8hf//r0sCda4RcqCPMR4jaiHv7x5fzj
	w761Er3F8MWBUlBzNzWGAlZFHt/gJck8b7iZY85NNnb0aJxIXSz74YLCCN6T6ldMUyMwSrWQw+W
	bpOFdISYya38TdKAwFOgt3Pd1CvQ9ylWa/1KE3fgK3xD+/8pcaDeS0fUEr4pbnV/olfxJDZyZ
X-Google-Smtp-Source: AGHT+IG4/1xEJsLz+qOzcVFluQ/WLouAG1pqXqN4pbEVpAjZiEuAyzyQxw+ookED+NDC66AWax4jCQ==
X-Received: by 2002:a05:6512:3411:b0:553:2912:cfdc with SMTP id 2adb3069b0e04-55a28ca499fmr2104268e87.9.1752838502793;
        Fri, 18 Jul 2025 04:35:02 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31a9cfb1sm226928e87.45.2025.07.18.04.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 04:35:02 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle-psci fixes for v6.16-rc7
Date: Fri, 18 Jul 2025 13:35:01 +0200
Message-ID: <20250718113501.80851-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_043504_758917_61BCFF4E 
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

Here's a PR with a couple of fixes for pmdomain and cpuidle-psci intended for
v6.16-rc7. Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.16-rc2

for you to fetch changes up to 621a88dbfe9006c318a0cafbd12e677ccfe006e7:

  cpuidle: psci: Fix cpuhotplug routine with PREEMPT_RT=y (2025-07-14 13:09:04 +0200)

----------------------------------------------------------------
pmdomain core:
 - Respect CPU latency QoS limit in the genpd governor for CPUs

cpuidle-psci:
 - Fix cpuhotplug support for PREEMPT_RT

----------------------------------------------------------------
Daniel Lezcano (1):
      cpuidle: psci: Fix cpuhotplug routine with PREEMPT_RT=y

Maulik Shah (1):
      pmdomain: governor: Consider CPU latency tolerance from pm_domain_cpu_gov

 drivers/cpuidle/cpuidle-psci.c | 23 ++++++++++++-----------
 drivers/pmdomain/governor.c    | 18 ++++++++++++++++--
 2 files changed, 28 insertions(+), 13 deletions(-)

