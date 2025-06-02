Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11F6C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U2pWQ8XYInPzY7yzvFzb84/7Ia0EnVFU8WNL68zGHlw=; b=oEM7ZUSqJAAC/YboKARluYGxiS
	7tun45hRJ0rlXFZY2S1YZMm1dL0xmD+zTPJRkvKCHwpBDmE9vv8vm2qyzOh77pMhZuq4fYf2X5oPp
	GqR/sc+8LfxjMMYU7QEwUxl6PWI1qIuDTLaceK2a9MQN77unzQnJlYnA0jtMn0LHjFk0WcIRV4u3M
	JG7X7KgSnmdh5RBRmeFtc+y0VqieXI5IB/poF3xkLG1uTc1bzbnx1pkg6m08KMjfNLJGWSOWIoQFJ
	hn/b/EOga2fAhHOHWJciRFh2UgP0TglDUhGL41LVcjTeKDPdd9PU0MbtfpcXZpMLsqHTYUxjGyTka
	mQK9FgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM577-00000007SAP-2Vlv;
	Mon, 02 Jun 2025 13:22:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM54u-00000007RtK-0v4x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 13:19:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-312028c644bso3469136a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748870387; x=1749475187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U2pWQ8XYInPzY7yzvFzb84/7Ia0EnVFU8WNL68zGHlw=;
        b=YnazHo0OMM/4hJ3qokFtrjr4b/N+5N7FGqHu/eQ1QCcF1KZeTdV72ButHAlk5Tpajq
         JoQC59PnmzPxl3QBloVjfj9VDiruPzNH0imL3yLxexuN+8NceZSlIWUvO0ZTmuZZpHRE
         qMj2RB7FLX9UuhM63lGveWPF52XvC5QONVFZB71URNAOTlpsoiA7yqoI8S+mfwxSsgdI
         yQNvVb49WbACTzZCwy7B75C9Rga8VrcbNDkELnBlb9wP5z/MHR5PiVIBV1at3pT8u13Q
         E4AEKukoC1yMllnTTxJ7HFqfhZn6GL+inJtVOhqAP1ss1KZBEn2toFM6x9m/ZEM0j2xM
         2oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748870387; x=1749475187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2pWQ8XYInPzY7yzvFzb84/7Ia0EnVFU8WNL68zGHlw=;
        b=W0sqwSoVYxj6pShfvl4X7OatYWWsgLZhfQZwQY6byhETvkuSB7ayStRroRlGoGdNid
         aBQirEGpApmngY7vHUzWIODI0bKt+jbv3TlBO69DGdRhTrJif1qKXQDfuhQRZuBqjbJF
         I8y9s80pJuJ8xiSX86KxGF/XDbYRN1+VpYrQxHUSJ7VZbwuDolIxk1/RR6axPpNanm12
         ksi5Y9gxWvE0tlotoMEBTcB9eQ4zPTNzYe0qS4cJMoH64gvozCWG0QbkbAsPqPSBj0EZ
         nMzWn13a/rxfXox9mZ0+XTLxVyKvZvxvdpYO3k+1hfCxq5J1wB+d2cTv36y48Yu6V7Z5
         bKtA==
X-Forwarded-Encrypted: i=1; AJvYcCWnfzj9cJquYzqTe0enY9X+NcdAImhkcoAAr2IC1YwDV+Dkkdv7BH9FF4iXAoe/6hE9I5ucYmLXxHU+WBh28HGE@lists.infradead.org
X-Gm-Message-State: AOJu0YxlcopWZk8dhh3752YIB0CvRf8M9mUZPCWp14LFy+YcH5yxUr3/
	PAUH1mF7sB3lTIDcNqXTZSosxnbl6hBFLAOIuAhfwfwCwAxjvEQSwSUA
X-Gm-Gg: ASbGncvM6suVqrjPClrtfhJXJ3PLsRAhINRqQIJmz+OZVt3E8FeZIv92EXj2DzpahvH
	58ui7osECEjruBGo5GOpXTpE3MCnoneeAn6g27+P4IXOUiQ4BqsfNZxkVeOjyayQiFxRqUqNpiC
	rTjK3X/ZCXkitH7Fu8dOnvygArIXQsaZx6szxWtok1asg4ejs+v9es7O8mfs5iIh7jDlSOwQ5mO
	OOEZNBWuYY4D49icJirWsgd/27ZJI5i+xr0ZbtvzzevA4NdUbVQxQDjIlekS7AZcRaiHPSJXaxY
	t6teUY1Aaa2EZk2KuAsoLIZe+e8cN5URY2Wk0R2ySD3SjC7+DJ00TalUXaYlqPcuSy8KzrC4ig=
	=
X-Google-Smtp-Source: AGHT+IFDyEzGFaym1wpwRqsblj24xGVKJRt91HFE7nLSINnTFLOY+Zcd+cdYuE1FMCys07O3cnvoUw==
X-Received: by 2002:a17:90b:4a0d:b0:312:1d2d:18d9 with SMTP id 98e67ed59e1d1-3127c6a9969mr11777603a91.5.1748870386764;
        Mon, 02 Jun 2025 06:19:46 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67bcsm6130983a91.8.2025.06.02.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:19:45 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v4 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Mon,  2 Jun 2025 10:19:02 -0300
Message-Id: <20250602131906.25751-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_061948_261270_F46CAA79 
X-CRM114-Status: GOOD (  12.38  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

This patch series depends on Ulf's patches that are currently under review,
"pmdomain: Add generic ->sync_state() support to genpd" [1]. Without them,
this series is not going to work.

For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
started by the bootloader and the M core and A core are in the same
partition, the driver is not capable to detect the remote core and
report the correct state of it.

This patch series implement a new function, dev_pm_genpd_is_on(), which
returns the power status of a given power domain (M core power domains
IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is already
powered on, the driver will attach to it.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [2] and from a reported regression [3].

[1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
[2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

v4:
- dev_pm_genpd_is_on() introduced to drivers/pmdomain/core.c
- imx_rproc.c updated to use the generic power domains instead of the
  SCU API call, which depends on Ulf's patch series.

v3:
- https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/

v2:
- https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/

v1:
- https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/

Hiago De Franco (3):
  pmdomain: core: introduce dev_pm_genpd_is_on
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  remoteproc: imx_rproc: detect and attach to pre-booted remote cores

 drivers/pmdomain/core.c        | 27 +++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c | 33 ++++++++++++++++++++++++++-------
 include/linux/pm_domain.h      |  6 ++++++
 3 files changed, 59 insertions(+), 7 deletions(-)

-- 
2.39.5


