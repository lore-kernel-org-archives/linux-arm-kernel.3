Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8243CCD182
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6I1cp+HxhEc7B3vUrgn327X00KQrCoI8VrJ+oGMKDrk=; b=4QJ+vQBNnEj/8TFOJS0eiv8dSl
	8glhVSy+M6IJce2BCSaz3IwsiLtIMP1Pd/2NxlKJUsWUMvULF64n7eXDft2wmpmZcQZAW9c6N3pZ5
	RhzLZcPH7LeLvBrHRvfHoceVehaf2DypVURALMayBOLFAJk22thmL5cgciCDEQg/pV6bAp/oP0gGq
	Wlr+u/UjtJiQaHhpd2DJp0BYAu7jax8nGgtueetajm6lSpA1jowqOi0/dkC8nFJIyRAlfB7IWGYh6
	HDAZPfvcQ1OrI7lgYqbriXE0f2gJ9qUJP9fwqzemJIkYWzw1PKF0/dZVGR6DMJFkSpRhe8InfbIaA
	Pfnclwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hJT-0000000CcR5-2aOk;
	Fri, 03 Oct 2025 15:03:15 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hJQ-0000000CcPk-1jIW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 15:03:14 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-579d7104c37so3356187e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759503790; x=1760108590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6I1cp+HxhEc7B3vUrgn327X00KQrCoI8VrJ+oGMKDrk=;
        b=fj7WH9R8xJ/RgeC0cyBJvZgk6yGW/6yZPeGX7JTU+39R08c06gmUKoUSuLC1LZAhFF
         wL/qNiP3XrwD17aZAZEol6dI3jUpoDJBJnyPseZOCMI3lBVQawGSSadTike8gYOOmJtd
         Ayde/0ccY5smKad19GgaGEOYwK1WThr/UvmgmUaJXDlg90W2m9A3ZeNZnJ2uzxl0Oqp+
         WDyfC77up5ZjwiteEyruD1KhW+kPGdsFLzWOr7dFFzKiLKTLsReQ3CY3h9bvFGXCGAHF
         jwKiSShctO3OwGOKzTw77YXXRkiLha+/SCPsVtzXAhXDHUbHn381Co7ziQvav9WLYJOz
         umRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759503790; x=1760108590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6I1cp+HxhEc7B3vUrgn327X00KQrCoI8VrJ+oGMKDrk=;
        b=HZh6Kydrf0r64ZdPGji0osUeIZKUAKP1b07ubUsKLxVYXNCJrGLP9958p3i3g25HhU
         BhBcbdFvIoJmfVf1nwCOW33K65S0IxOrg4qHbFn7BZvcZo5vwfwKMv4X0QyFSzIo4yTJ
         6UtXrwPghOFOKZatBrP3En3Cem2Q90viuIXczI/Tay730uV2GUr9ktjxbxfy8eOrNyEH
         OhZ1u2MIYKUwT89smW7o7KzP5eS+zasRuBQ0M6Zq6DkKLO3rRMp73H7r8P6tKk451ATW
         ewFSQZhRd49SeCL+xMHqfjEINe9Rg8u26SLadRVxgzc1ERX/Bq4znNNZ/OqHFEo4S8cM
         7lxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjJ5YYyJ0wq9bd98aH094Wb5fTnyK2sy06TYJppRFFx/Od6ekyoxNMoIq3Q98crHXuCLlB5wvBbC1tZP3PyMXb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyep7RTUmQiLXFLOuwBgRdl8xv0F6S2jcj2Io6zCD8Mh7KAptpZ
	PuYqp6tXWSGpWrxWv6JeTlv6VTaVbz+P29IylW8LXux3XOLw+UtJJCDyc/06bUNWtQ0=
X-Gm-Gg: ASbGncuzz8ONUamW+X/z/oycF9y2Tntwc8RkU61CGGv9eFSKO/5HcHjfcabYZ0qAZ2n
	F5ZCUPBL6p3TOf88+z/JVWOUOp0TrhjT0EZ3IFg8e531r1//LKphcTxzJMmF5UPeFZWDyk3LHeg
	yGd+lFtJTjoRnu77YQhy93kI+Z0W/DXEIvxl/t+nSk5obrVm4xlzs9eTvqK1Fhmw02+Fme4Tn0V
	l/x5BBh0xXER1Z6VBzFfeOmua4UFYtVISg8FUyAamjJBGZi7qauZeI3ufIhQCVjuoWgcG5scIGZ
	2iLpEDk2bY0+y3LUBtcpKR8+RgDbeTDSVZjIUkR5yPGJFErgC/O8cPv4YyLrt79diWpVZXCLYDv
	PsHq1/iKVGwHhCbqgDK5ZwW5FtPHOPKa31Q7NRX0Hfso/ATez+jrF3hotcL4/5cYkZH6qYfRbuv
	Y0IVx5i3/fJRqkZUm//1YdcHj8Du0D9lnvnZ87RT/O52pbpQ==
X-Google-Smtp-Source: AGHT+IFDyf2CAvnV4x29ZpVZ+szdDhm4mElGlYbHAAsCPKVjg7GYU5VG2tOvCk368uOv15rIxkfSIA==
X-Received: by 2002:a05:6512:3f28:b0:579:ca71:2750 with SMTP id 2adb3069b0e04-58cb9f0b673mr982744e87.2.1759503788264;
        Fri, 03 Oct 2025 08:03:08 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011343b6sm1933369e87.35.2025.10.03.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:03:07 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 0/3] pmdomain: Improve idlestate selection for CPUs
Date: Fri,  3 Oct 2025 17:02:42 +0200
Message-ID: <20251003150251.520624-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_080312_469776_DD73A45C 
X-CRM114-Status: GOOD (  11.20  )
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

Platforms using the genpd governor for CPUs are relying on it to find the most
optimal idlestate for a group of CPUs. Although, observations tells us that
there are some significant improvement that can be made around this.

These improvement are based upon allowing us to take pending IPIs into account
for the group of CPUs that the genpd governor is in control of. If there is
pending IPI for any of these CPUs, we should not request an idlestate that
affects the group, but rather pick a shallower state that affects only the CPU.

More details are available in the commit messages for each patch.

Kind regards
Ulf Hansson


Ulf Hansson (3):
  smp: Introduce a weak helper function to check for pending IPIs
  arm64: smp: Implement cpus_has_pending_ipi()
  pmdomain: Extend the genpd governor for CPUs to account for IPIs

 arch/arm64/kernel/smp.c     | 20 ++++++++++++++++++++
 drivers/pmdomain/governor.c | 20 +++++++++++++-------
 include/linux/smp.h         |  5 +++++
 kernel/smp.c                | 18 ++++++++++++++++++
 4 files changed, 56 insertions(+), 7 deletions(-)

-- 
2.43.0


