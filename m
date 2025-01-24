Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C25C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 03:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IzkbIemVnuwiLLIK9y8mVhnQ/6V+p9dfR3FEtwj47hA=; b=hPNNb+JHkssWbqrN7DgD9nOkJJ
	fP7KD3mZq+Csb6EknSeZe8onihiNIf4Y8L4hBB0hD7xwvc/roV2NXHobfUM5SAabQe8kqa79VEbzb
	ESsz0aanrGw5VmlA3YQ8UmGqY80qTN6o14yVyrDLvB8Mwko3vhylktvS6OtBiMlcBF7OQaZJP4e6L
	6KP9/bJ2AZ5Sr11ZcJjWC7K6OATv05jQpIlvuK0Iy1dvinmI1Xv46YbAm0TRrwgLoFBwsnjMdwV3m
	x/QWTYRWrDn8dmnxwd+1dC+or6ux+iK7OXgj5kMkMspqn1HaMslgcEwonNPfQPTbqamjquDTjryM0
	8A4Z476A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAj6-0000000DpzU-1bl2;
	Fri, 24 Jan 2025 03:51:24 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAhT-0000000Dpn4-1Jh2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 03:49:44 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-29e5aedbebdso913391fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 19:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737690582; x=1738295382; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IzkbIemVnuwiLLIK9y8mVhnQ/6V+p9dfR3FEtwj47hA=;
        b=e4zp2T6qxwViJ9TBnKWbyVOCKWBDCP90w4vbN7UYjpKoqv4BnNTmNHKSFMGQzW3Bly
         0FjmX4Bk0rQ8OmPFSDAUZpbiTMOPPYjoGu9lGP+7xXE2VByYAQjfqJ69WW84k6N8AaiC
         /5u6B4HRbv1iuKW0CukdEaTi4/CF0imLw7EYkqqt4AhNGEL3OEv08OugzojGLXm9Royb
         W0fBee0RICFMsuNObyOS/wJltrrHAOHM9ljWp2W0ylm5IBltaC3mSPiDp1GBwSk5jhPm
         8XsVR2XRtZ8+n7eqOz51NwVreGR5TsHV9HmlOrYZEudyxc2seUiHyeArpljq3XgO/Myr
         vi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737690582; x=1738295382;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IzkbIemVnuwiLLIK9y8mVhnQ/6V+p9dfR3FEtwj47hA=;
        b=jUsuygXJPoGKuoRRuTuY0XqM/2IUeSIQFV+jOKPbrGJyZrnaBQMUpD2IQH9/zbZhxP
         ZGeV7+IWJE8egNwH1xq9N2Drq5oNlAhlEd111kHZXQpbwu4b/BgGFAnpyBgbyjpRhPxe
         9JBF77Jk/6n5dGFpCFJR5U3UKdFcdf89WTJW4O/xiEkOaduc/JvUUGpmEwtHcPpDG2J/
         kgb9r9p/hh1xbrlx5HYAEiJvR8zy+WYSkk0+iskrcdfOlnRCwhEcTHqmiCebaYfh9x1m
         ZOQf6u7napGYoDuYXt2+jL1iNAjAQQMWSks7OahwPqfB/O2j+aD84Cs2byCt7WUn/eab
         U0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeALSu7M56dLfAUSEKFrjdEjTQHVaG5BTnX9K62S//uWub+WK6rvz7unUFOV4VTj+gH++SLxJFs/yHpzjRlGBo@lists.infradead.org
X-Gm-Message-State: AOJu0YwXspIxjJoYUaqmXI/znWhs9Gn71sNGl9nzoceYCxX/gBflDcp9
	N8+3kjt3p2ak6NDzD31FEVCaj2GILupjdgocVcxsOqbyLUZDFK5ZKJYnI6OIuKHwOwfnMq3UaRp
	yuVmtSMLIVcNM7AydvF1JbrOINe8=
X-Gm-Gg: ASbGncuB8ALZe+k8puC5BZ2fN0E7quzvnSHjt/9RViFsNcM8UfEv13WkvIVFOt3uWWi
	dnhJ2/sZtRIbIeY1KfcSBWQAyuZQ7Vd+PAw1IcnYuBITir+ypDuFN980ORiplb+U=
X-Google-Smtp-Source: AGHT+IEJWelIGE1J9YedECXyoOMvgyyo8zbUUFNY7kU7UvOS0+99ymHvFDD3XLLi+kCPbUHdIzTxmRDgcZfNjVE50z8=
X-Received: by 2002:a05:6871:788c:b0:296:ff26:3cd1 with SMTP id
 586e51a60fabf-2b1c0b08f68mr15657007fac.21.1737690580375; Thu, 23 Jan 2025
 19:49:40 -0800 (PST)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 23 Jan 2025 21:49:29 -0600
X-Gm-Features: AWEUYZlFsD1hrC9yWFcWD1hz9rxHG1qET83nn7eCErcDD5iY6iyfy6W_xiWpBM4
Message-ID: <CABb+yY0QX4PLU1wSfz7DsXCzoeOD=VAR-E0vDH2LLtwfp8aJbw@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v6.14
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_194943_371910_92BE2ACD 
X-CRM114-Status: GOOD (  13.31  )
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

The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.14

for you to fetch changes up to 4783ce32b0806911287f35cc65b799876d6f9547:

  riscv: export __cpuid_to_hartid_map (2025-01-20 10:25:11 -0600)

----------------------------------------------------------------
samsung: add gs101-mbox driver
microchip: add sbi-ipc driver
zynqmp: fix invalid __percpu annotation
qcom: add IPQ5424 APCS compatible
mpfs fix copy and paste bug
th1520: Fix NULL vs IS_ERR() and a memory corruption bug
tegra-hsp: clear mailbox before using message

----------------------------------------------------------------
Dan Carpenter (2):
      mailbox: th1520: Fix a NULL vs IS_ERR() bug
      mailbox: mpfs: fix copy and paste bug in probe

Gokul Sriram Palanisamy (2):
      dt-bindings: mailbox: qcom: Add IPQ5424 APCS compatible
      mailbox: qcom: Add support for IPQ5424 APCS IPC

Michal Wilczynski (1):
      mailbox: th1520: Fix memory corruption due to incorrect array size

Mukesh Ojha (1):
      mailbox: qcom-ipcc: Reset CLEAR_ON_RECV_RD if set from boot firmware

Pekka Pessi (1):
      mailbox: tegra-hsp: Clear mailbox before using message

Tudor Ambarus (3):
      dt-bindings: mailbox: add google,gs101-mbox
      mailbox: add Samsung Exynos driver
      MAINTAINERS: add entry for Samsung Exynos mailbox driver

Uros Bizjak (1):
      mailbox: zynqmp: Remove invalid __percpu annotation in zynqmp_ipi_probe()

Valentina Fernandez (4):
      dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
      mailbox: add Microchip IPC support
      riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
      riscv: export __cpuid_to_hartid_map

 .../bindings/mailbox/google,gs101-mbox.yaml        |  69 +++
 .../bindings/mailbox/microchip,sbi-ipc.yaml        | 123 +++++
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |   1 +
 MAINTAINERS                                        |  10 +
 arch/riscv/include/asm/vendorid_list.h             |   1 +
 arch/riscv/kernel/smp.c                            |   1 +
 drivers/mailbox/Kconfig                            |  24 +
 drivers/mailbox/Makefile                           |   4 +
 drivers/mailbox/exynos-mailbox.c                   | 157 +++++++
 drivers/mailbox/mailbox-mchp-ipc-sbi.c             | 504 +++++++++++++++++++++
 drivers/mailbox/mailbox-mpfs.c                     |   2 +-
 drivers/mailbox/mailbox-th1520.c                   |   6 +-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |   1 +
 drivers/mailbox/qcom-ipcc.c                        |  16 +
 drivers/mailbox/tegra-hsp.c                        |   6 +-
 drivers/mailbox/zynqmp-ipi-mailbox.c               |   2 +-
 include/linux/mailbox/exynos-message.h             |  19 +
 include/linux/mailbox/mchp-ipc.h                   |  33 ++
 18 files changed, 973 insertions(+), 6 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
 create mode 100644
Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
 create mode 100644 drivers/mailbox/exynos-mailbox.c
 create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
 create mode 100644 include/linux/mailbox/exynos-message.h
 create mode 100644 include/linux/mailbox/mchp-ipc.h

