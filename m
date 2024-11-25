Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2152CD3B7CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 02:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XMwcKynH7+09/OSOjd94cHqbXzeJ+yy/TOIojBiv5Ww=; b=yQU3haX/TkgW7GoWZXLHaJW1+I
	/ufcCGiaT697JiD1yBqXc/X6CCFcfUwGkFXnAMDiy0MdwQf27LuDqmSiM74tVZMlzX41sh6lw3V7w
	uW8q5pnRd02tZQkvI/nsLZQpJJVcwLJQrISjBLUWlHg0Phc43rc2u6xZUkTL1kMQV5bNFHGxyHjjg
	rKFwfD58G+7yCFz6Bd632gXkbGAaMHyOdVwclYS0JUvmUWhLd1/6m+goRjB3HIdESLrnEd2jD9B/E
	4XdWOcCb4cvlx/qW9rinvzcir1lAJ/ughO6hArM11It7JJBqA+NhBljxMGB0KaaoDC/hKC9465wYO
	pdMy4lIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFORu-00000006u45-3kO8;
	Mon, 25 Nov 2024 02:03:38 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFOQy-00000006twL-0NIw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 02:02:41 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-71d40573d03so457791a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 18:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732500158; x=1733104958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XMwcKynH7+09/OSOjd94cHqbXzeJ+yy/TOIojBiv5Ww=;
        b=g26dSBCwF4rWPiVpp+9eLxUahgQnK0s98onc0iwMofLkid9UFFNflVlPtN2MUpxm7j
         ME/0YP67rci9wG2l9UdU8Vub62nuINav2EK3Z0ntUw5Ey6tJUVIvi5DvxW75M3iOfyNP
         hEKmh7rvexJqwVWpM0kTOkjW1C59nh+PS+GdiACtTWtU/VdOQxsIbxqOWbkICKmaEt2V
         Mu/mYqp8ZWVUwdL1LyAtmCkCG7lyhbMRzqOqsoI3TBcaCmfsADlsWGjVug5PgVQinK8/
         Ng6vu1W7OugPDXRZnbxZ6PkThU8tpGpS7JWpITG1Cx5KkuBrLl4hLSQopw5pROOCs6jv
         6Spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732500158; x=1733104958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMwcKynH7+09/OSOjd94cHqbXzeJ+yy/TOIojBiv5Ww=;
        b=cSkckc8JcSPDi3SHP1iiiGghp6rEPNtwic2qVXfRz5vrYrRdX/tOjavRc9mULINJKN
         LQiX+lHS5/LdLvyLKe9VMHfpJ9sPjjtvTjvoaV2lO931/eQbO8XjABzxa9DnxG3mYkNx
         Vwkbpm5LBfhEIDbm203sTE5q+ye5xxrvOXaLeF1CZtmY3l9v/RJEGK5EtUYuh6oFNc2U
         4QOSixWVeGPSx8YN1KhLSXuvRn2qaFGfEY5pEOTiFIBnx5RT7aznyWNnxNt/u7je/zRS
         WDxBfI/0XubO9ViabzAowlY2uCJhRXu3nLeIF5xmS6xvRs1KHkC+8HUBFdBu2iXXhVxZ
         lX8w==
X-Forwarded-Encrypted: i=1; AJvYcCU6oOPFK0zG0kLwChUxf9YlANqrDYIUgLKKtdClamsQGEEWbjzerEB84MYCNDzHzuv9KfDCuMZLUZ1bRAjHWi2a@lists.infradead.org
X-Gm-Message-State: AOJu0YyF9Cjfa6p1YMo4WCVMJCSgEmp87GoiC9Hc6+70MmoX+pSyT6Ek
	6kUoEhuUbPAP7//yIvtxHJ1cYrhQ0+YXhxfvdjI85I7FV+lHYakI9L45cguMg8Rj1+udowxgJVK
	0FJ1W/ElAZgVyN99j1zG2FTlbYXA=
X-Gm-Gg: ASbGncs110NDoQca+R2fd5RL7VTry31MnGo9PQACkWkvOV148L33dhtAWajD7c2XV9m
	BOQ4419vFq6HpCdnfkS0iWZ/93xAQErMm
X-Google-Smtp-Source: AGHT+IEtOaD7oLcnxyggMG+Ec+gDAtY5hNLtZ1XpHdnaA/p5OzbK2Vydk1KuooGB1YAj4/Ir1JBzAbUc/V8uno4v7Cc=
X-Received: by 2002:a05:6830:6e92:b0:71d:41dd:30bd with SMTP id
 46e09a7af769-71d41dd3564mr3188949a34.20.1732500158617; Sun, 24 Nov 2024
 18:02:38 -0800 (PST)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 24 Nov 2024 20:02:27 -0600
Message-ID: <CABb+yY33qnivK-PzqpSMgmtbFid4nS8wcNvP7wED9DXrYAyLKg@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v6.13
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_180240_145750_2DC03632 
X-CRM114-Status: GOOD (  12.05  )
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

The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623=
:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.13

for you to fetch changes up to 7f9e19f207be0c534d517d65e01417ba968cdd34:

  mailbox: pcc: Check before sending MCTP PCC response ACK (2024-11-24
13:20:40 -0600)

----------------------------------------------------------------
common: switch back from remove_new() to remove() callback
imx: fix format specifier
zynqmp: setup IPI for each child node
thead: Add th1520 driver and bindings
qcom: add SM8750 and SAR2130p compatibles
      fix expected clocks for callbacks
      use IRQF_NO_SUSPEND for cpucp
mtk-cmdq: switch to __pm_runtime_put_autosuspend()
          fix alloc size of clocks
mpfs: fix reg properties
ti-msgmgr: don't use of_match_ptr helper
           enable COMPILE_TEST build
pcc: consider the PCC_ACK_FLAG
arm_mhuv2: fix non-fatal improper reuse of variable

----------------------------------------------------------------
Adam Young (1):
      mailbox: pcc: Check before sending MCTP PCC response ACK

Andrew Davis (2):
      mailbox: ti-msgmgr: Remove use of of_match_ptr() helper
      mailbox: ti-msgmgr: Allow building under COMPILE_TEST

Conor Dooley (2):
      dt-bindings: mailbox: mpfs: fix reg properties
      mailbox: mpfs: support new, syscon based, devicetree configuration

Dan Carpenter (1):
      mailbox: arm_mhuv2: clean up loop in get_irq_chan_comb()

Dmitry Baryshkov (1):
      dt-bindings: mailbox: qcom-ipcc: Add SAR2130P compatible

Krzysztof Kozlowski (2):
      dt-bindings: mailbox: qcom,apcs-kpss-global: correct expected
clocks for fallbacks
      dt-bindings: mailbox: qcom-ipcc: Add SM8750

Michal Wilczynski (2):
      mailbox: Introduce support for T-head TH1520 Mailbox driver
      dt-bindings: mailbox: Add thead,th1520-mailbox bindings

Sakari Ailus (1):
      mailbox: mtk-cmdq-mailbox: Switch to __pm_runtime_put_autosuspend()

Sibi Sankar (1):
      mailbox: qcom-cpucp: Mark the irq with IRQF_NO_SUSPEND flag

Tanmay Shah (1):
      mailbox: zynqmp: setup IPI for each valid child node

Uwe Kleine-K=C3=B6nig (1):
      mailbox: Switch back to struct platform_driver::remove()

Yang Yingliang (1):
      mailbox: mtk-cmdq: fix wrong use of sizeof in cmdq_get_clocks()

zhang jiao (1):
      mailbox: imx: Modify the incorrect format specifier

 .../bindings/mailbox/microchip,mpfs-mailbox.yaml   |  13 +-
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |  13 +-
 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |   2 +
 .../bindings/mailbox/thead,th1520-mbox.yaml        |  89 +++
 MAINTAINERS                                        |   2 +
 drivers/mailbox/Kconfig                            |  13 +-
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/arm_mhuv2.c                        |   8 +-
 drivers/mailbox/bcm-flexrm-mailbox.c               |   2 +-
 drivers/mailbox/bcm-pdc-mailbox.c                  |   2 +-
 drivers/mailbox/imx-mailbox.c                      |   6 +-
 drivers/mailbox/mailbox-mpfs.c                     |  81 ++-
 drivers/mailbox/mailbox-test.c                     |   4 +-
 drivers/mailbox/mailbox-th1520.c                   | 597 +++++++++++++++++=
++++
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  14 +-
 drivers/mailbox/pcc.c                              |  61 ++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |   2 +-
 drivers/mailbox/qcom-cpucp-mbox.c                  |   2 +-
 drivers/mailbox/qcom-ipcc.c                        |   2 +-
 drivers/mailbox/stm32-ipcc.c                       |   2 +-
 drivers/mailbox/sun6i-msgbox.c                     |   4 +-
 drivers/mailbox/tegra-hsp.c                        |   2 +-
 drivers/mailbox/ti-msgmgr.c                        |   2 +-
 drivers/mailbox/zynqmp-ipi-mailbox.c               |   6 +-
 include/acpi/pcc.h                                 |   7 +
 25 files changed, 875 insertions(+), 63 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 create mode 100644 drivers/mailbox/mailbox-th1520.c

