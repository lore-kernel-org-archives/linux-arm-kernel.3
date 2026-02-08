Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A661EF06E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 04:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oUKaI1Jl6BOBoZBMk5DmhJ8i+x4ONVWqzInJUK5fe+o=; b=E8VswTjkuKeLyVnqxBEteL+P9c
	Rb1+tlVuD0qQ4pjt3RpMoTsT5mqPcMgCFwawmwbRgR1YpqMi7QeFRaYfBsjGRw3R0P+pT6/KnPuT8
	R6q9wOqSDizMuLtOb2LKPx9Tec0BZq8KFc0SWfnTlNQEHXp5+T64gZQQt6PB31mpGkV5xdegwj8n9
	O2C67cgcip7/ZZoUQlx8H85BrUNCf29tLPvz/vubkr+bPOncnsktiCFujaiYb7OZ1pFpxLiE/nYTc
	PvsjSEy34jaqFxEc5rMDbcjrLR0BR28ui3QHKCNPzgWC6hL7pMHlLzFyLbUa5pdZ8/BgLuRe6rFmt
	Lx9rg0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow1m-0000000CzVc-119f;
	Sun, 08 Feb 2026 04:04:06 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow1j-0000000CzVG-3kHx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 04:04:05 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1270adc5121so1642065c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 20:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523442; x=1771128242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUKaI1Jl6BOBoZBMk5DmhJ8i+x4ONVWqzInJUK5fe+o=;
        b=JIzRxPz20VWnDtgZnDVSy7yXr1XnxZV9SsdHv+dYD4UghDhGW/LsRm7udDyL3wPTRq
         N0Nan9d9lSAG+VABqduyk47CLMQ/LDVFBV/JtznuV+pjxyWDjKN00RWRl3oe5KP+tHG0
         3KNSBEGS+aC5MPkbiDorZpcb2r4F5wfoJapVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523442; x=1771128242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUKaI1Jl6BOBoZBMk5DmhJ8i+x4ONVWqzInJUK5fe+o=;
        b=ZKZOw34L/Qw2mPZdsZoGoYpb9v06KFUO5GJWL7yFkgd+lrb9gNsuQZXrlXP7wbxJ5d
         77cubS1HHmhICpqClsBvc0jZXJyuv/aT/z+Ds7cVwIdBRItOrg88OLN7EG1i66yjAg3D
         KJI+bsWKgQ13dpmoInUQLKarXUb9hjJLeNKQZkewCK3pTsKtKOcu3Akgxcwca0aoMbZ9
         rXRdLiDQMtcypMS1DWDU2xfWypeX1w32UHVXY/nFTt863aaPycJuqWnONWl7Cjdx0daO
         Xxc5JUMULsIy+wKRBSW6dkHBws4EIi8llBnoAehW41UkEHkSPFO9f/IBeBBTbiTqkAdH
         YZXA==
X-Forwarded-Encrypted: i=1; AJvYcCWmmJ7GWBllQ+uwphzr5JSjmUHqfAIAsFW4EkrMuYP4vVSXqq0IZB8k4NKm6NPdqmA+WsYQdgrtI2BH9aZwh7a4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgl/kg/7234fFvM/eSVhB0zNx9OLc2qo7Bqi9JowmQGWki3X77
	Jrg21yU+6Hj5GPN+3u4r3BK5fXZAxBF5PBa7s6p0bSAuE3FWNrFjYkTddyA/xe5xXw==
X-Gm-Gg: AZuq6aKhXELTMbeiPTa2XYpWF6s9ye8Xc7VwJaYyQDlegsd5MzsHrGtf14F2XHA9nH8
	m2gry8R3vRegEg1U/MC9ITAz/mkAst/G2rJME80zH4gWdqCoz6WKLTjdS/PZsm1/7GfY6DwZBZz
	lydFhPk3WSL+mlUZ7DmPru74rVkF16Z3p7ViyvOJrVXvdwV2VVNXujH46oXpSHvqzoVCalbq/XU
	vrylRlFJ0v5PhKrbcjwb5azB3hNY13gTdEvMQbP4FVun4KOS+WFNOCSaHRaJq6MdHMZ0KjvFkAx
	o2Z7eSDyEWN7RmrMARuymE2qWHqslvLg8q3WA7MKjD9KiWUhJHLPiwNq/JyF1TJIlNeqbkJ5uEo
	GFz5U54eC8YKrCukjGX9zlidq1fhzln+ZOM9PJbcehLrIXHz+xHbCvp+U4vvYxqFtZ7orwKVema
	tjYymZ7g6P2HuYNtqxY5d7WBu/iRTrdL3HmbOhrhs5C2+zY5PNCQh462237kUiVAJ3rF2N7O8=
X-Received: by 2002:a05:7022:6184:b0:123:2d38:928d with SMTP id a92af1059eb24-1270405aa72mr3860925c88.36.1770523442099;
        Sat, 07 Feb 2026 20:04:02 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:03:59 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Frank.Li@nxp.com,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	andersson@kernel.org,
	arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	jay.buddhabhatti@amd.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	mathieu.poirier@linaro.org,
	michal.simek@amd.com,
	nm@ti.com,
	rafael@kernel.org,
	robh@kernel.org,
	shawn.guo@linaro.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 00/15] mailbox: Stop sending NULL mailbox messages
Date: Sat,  7 Feb 2026 20:01:22 -0800
Message-ID: <20260208040240.1971442-1-dianders@chromium.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_200404_007318_7CCE93CA 
X-CRM114-Status: GOOD (  15.12  )
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

As talked about in the first patch in this series, passing NULL as the
'mssg' argument to mbox_send_message() ends up causing confusion and
quirky behavior inside the mailbox core. Despite this, there are a
number of drivers that pass NULL.

It is plausible that some of the drivers passing NULL may have been
taking advantage of the quirks of the mailbox core. Specifically, they
may have been taking advantage that calling "tx_done" wasn't truly
necessary for NULL messages (it was a noop) or that NULL messages were
passed onto the mailbox controller right away without queuing.

This series introduces a new API call: mbox_ring_doorbell(). The new
API call tries to mimic the specific quirks that were helpful in the
old behavior and it's expected to be a nearly drop-in replacement.

There are some subtle differences between the new call and the old
behavior, but it's expected that all of these differences are only for
cases where the old behavior made little sense. The description of the
first patch details these differences.

The series attempts to convert all in-tree users to stop passing NULL
for mssg. As per above, there are some slight differences in behavior.
If any of the patches are causing problems, they can safely be
reverted while debugging the problems. Eventually, all code should be
converted over to stop passing NULL mssg.

Changes in v2:
- Instead of just documenting NULL, introduce a new function

Douglas Anderson (15):
  mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
  ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
  firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
  firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
  firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
    message
  irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
  remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
    message
  rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
  soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
  drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
    message

 drivers/acpi/acpi_pcc.c                       |  4 +-
 .../firmware/arm_scmi/transports/mailbox.c    |  8 +-
 drivers/firmware/imx/imx-dsp.c                |  2 +-
 drivers/firmware/tegra/bpmp-tegra186.c        |  4 +-
 drivers/irqchip/irq-qcom-mpm.c                |  2 +-
 drivers/mailbox/mailbox.c                     | 82 ++++++++++++++++++-
 drivers/remoteproc/xlnx_r5_remoteproc.c       |  2 +-
 drivers/rpmsg/qcom_glink_rpm.c                |  3 +-
 drivers/rpmsg/qcom_glink_smem.c               |  3 +-
 drivers/rpmsg/qcom_smd.c                      | 13 +--
 drivers/soc/qcom/qcom_aoss.c                  |  3 +-
 drivers/soc/qcom/smp2p.c                      |  8 +-
 drivers/soc/qcom/smsm.c                       |  8 +-
 drivers/soc/ti/wkup_m3_ipc.c                  | 10 +--
 drivers/soc/xilinx/zynqmp_power.c             |  2 +-
 include/linux/mailbox_client.h                |  1 +
 include/linux/mailbox_controller.h            |  4 +-
 17 files changed, 108 insertions(+), 51 deletions(-)

-- 
2.53.0.rc2.204.g2597b5adb4-goog


