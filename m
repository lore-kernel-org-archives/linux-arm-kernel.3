Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F5DEF99F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 02:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6NxJTt8x1pN1xYEpvvm4x+ssOBAPxMVEtMmjTeNfX7w=; b=3kzjAiyHviPyVpdE1kP6cxxcZW
	lwWKn6eZUIqLct8pog0MXp2B/+B4APM3oP9Q8vQZgfmx4RlW1Q27alH36P40Yj98j88Q17XfX3Txx
	Wx8IzouLeLednMufrM8Rdi6xeco34cFINL9pZ0QKPHn7/uq8ADMCtYJ890hzbu7IK+46mjXAQ3sTz
	NoyjCYL4DUwJmOj4Q5xFHOT6AoK7gldcLDrfkp0FPRvd4V14mcKsRt00qoib+TdPZ2Xtd1HBltX+n
	8LOlNbArADh1v73WUFK6e3K9kp8LBKzw/ApPs5xrbK+hKZCWKcnmGnhsBHEEaUTvZ9/U+/CXtG/1m
	t4usXb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5hJ-00000004BAR-2Y3u;
	Sat, 14 Feb 2026 02:47:53 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5hH-00000004B9w-2C9c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 02:47:52 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7d4c65d772cso1042675a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 18:47:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771037270; cv=none;
        d=google.com; s=arc-20240605;
        b=L63+onTUX95LB4gxlGj3ykOXwllF5Kgu9maSEVVtElb/taCTsZZeRpPFEsC3hs01NI
         UgCFjYzyJcQ2aQrHU14YLBuN06mlsz3PoFjDv0SzFynFIbqif537idcOlYRcwsR3PbQu
         BeUOV+RJYh7u8I2XlNS9WMojv4Khxu0jBqIAfOk1E4/WL7qSXJOMbWw6c0YrbCe1ntbV
         cPSoUXOJCpv5tiWvPBKM9SO37+ZtVjeYA6LqW+dUOQq2pTmV5DbACcQCaR7G7e2g7a7G
         lfPvNobX1VmJP/Wf5uWF+gq2EOy4qOthp8VGoc+4vNWF5x0V1K4IkEZdc9z38lel54zB
         H2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=6NxJTt8x1pN1xYEpvvm4x+ssOBAPxMVEtMmjTeNfX7w=;
        fh=pF6/PktA7FeWNVMTupqRKo7fdBM43NHIhYQuZj0R/bw=;
        b=WddLmrB7scimmxnez9TSi7pA18GUASBfZnEx5KTqVT0j43YCxiucNOgCVeOYRXpenM
         a8Wea2Tns7VtybQYNzX/+37XG+UybK1EVXBi5GlwuFmHKQb0gioOmhkSH0YbUd8Ku8mG
         D5xvEx9cYz/l2qrjSwqJVzTEGWd6YC173YV2Z/s6j8jJwg7uXjUhfWmjuYIE122YzCDo
         yoxftSXulch7X/wxqs2N7Wkf288CBzkKwh/h2/9tW17fOMU8U5SALOYjgMmsceHDzJRn
         DxtGEIOwvL/54t9ioCD0o8RJmw1FoLpatWe9Sh5am9+4Zg1mYDkDchZuOC6zY4aF7nmc
         ueFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771037270; x=1771642070; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6NxJTt8x1pN1xYEpvvm4x+ssOBAPxMVEtMmjTeNfX7w=;
        b=EXaIS19NinzpWbkkssl7fyhb6VTON8zkWI5w9sUOcw6mhTC+h4jivyaRTTXVcTGLth
         l7NANfDMlZg/oRxesRGPjEuUBl0oe4n8pJ3hwUKCTD1+qcD9aAtVQa+05YU05o3uAEEh
         /dB+CpCf0Aa8SKSGtu/0ViuI3IIxwCkg2KyGJJ3sDzHTyaAkEGGQ5+ovwm/jcgmJ1Bw9
         VpfJeABOuVkFE1kBycSJwN+OxQdO4fPc7APgKsR2WXFshhBVWcBfHUSkVwZFUiLBxii0
         5N4MEeTA8hAwefLOmhsDRHWb6GZACOPMfSuPjVDJ1e0t4UF/rIHOHozhkRdcsJKS9esU
         /vUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771037270; x=1771642070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NxJTt8x1pN1xYEpvvm4x+ssOBAPxMVEtMmjTeNfX7w=;
        b=ONDhg7/8twHjf5ft97+p3c4rSzJR6bZQxUzdsp26lu6caY4OLIXC+xWlX3047VUfc9
         Q0TOiI7xZ31DNZ148YEKii5fOlsSrKHBBeZPo8o7fUMk/eL9ICpN9DeIA0Ey3YR4aWQU
         WAcxbi2A9cKtNKw78yhSBNVV2EsaVjbUc0Niut2HIzslSCVopOm1T1hYdrKvcvrGjOsA
         UdRh5sWtzr8B7j7EanY0fY/q+KrJ4lhyDruDp4JRtgHJJp6yNwvmIdxz2NrAVCdwUXly
         z2r0WoFueLjDqUq9hbgzJbYMMlVRhRaFPm4/yjBxczODybOtO8tZLVUgE6xYG1atc5Kk
         2UuA==
X-Gm-Message-State: AOJu0Yw7MsX/oHve74OkmwLfL1B5nCSxBxsjWSjVeJIqnhsgHEYqQUnr
	my0P+CZHp8cg7M6NCpIF6wOYlQf6WihCXmjJPblZnRRHUTVyCrg5rvii4qB+GuBLu60jsFUg6iN
	EWPT/25t8a2dMKOTLINkQHxIsVPXUoIU=
X-Gm-Gg: AZuq6aIbZiVOWlUX3sEjCv5j9vrRqm/UQ7tqh4WIqV5bVBGOqt5eHxYuRTnB3lU8fQj
	cVlNNc3KT7XFPFeo8vZW4/c2xFxoWYe/v5VIVfDDQ4AYtTlkyc4155rM7hLBgDj2UyW9vlmRqq1
	vVYkWPBSFz4xXzzOWzyMnQFqXg72axlpTbcYVmc++dOCrBe1d8JHNcTPwEPGdQk5dAaGRZN0tRy
	uM+GNano5GCadyR4mxzEh6u5poFS0EE0LUb0otlSHnbJOKRe4USnSRgmvO3UWxZybY9FfT18YTT
	6P4eeg26
X-Received: by 2002:a05:6820:1803:b0:66b:299f:f2b6 with SMTP id
 006d021491bc7-67769a7b2d2mr1807799eaf.73.1771037269843; Fri, 13 Feb 2026
 18:47:49 -0800 (PST)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 13 Feb 2026 20:47:38 -0600
X-Gm-Features: AaiRm524NS-u7iOjrFPdjDcPr3KsQEfv-RCl17RpvYHz9wtyB0xxb796zkibnFM
Message-ID: <CABb+yY0ErLA7X9OgU9OErDSg3Z3zXVLgp8JOrqAAuumTnznJqg@mail.gmail.com>
Subject: [GIT PULL] Mailbox fixes for v6.20
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_184751_578681_629250D3 
X-CRM114-Status: GOOD (  13.86  )
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
The following changes since commit e84d960149e71e8d5e4db69775ce31305898ed0c=
:

  Merge tag 'for-6.19-rc5-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux (2026-01-17
19:29:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.20

for you to fetch changes up to 75df94d05fc03fd9d861eaf79ce10fbb7a548bd8:

  mailbox: sprd: mask interrupts that are not handled (2026-02-01
18:59:52 -0600)

----------------------------------------------------------------
mailbox: platform and core updates

PCC
- Updates to transmission and interrupt handling, including
  dynamic txdone configuration, ->last_tx_done() wiring, and SHMEM
  initialization fixes. Reverted previous shared buffer patch.

MediaTek
- Introduce mtk-vcp-mailbox driver and bindings for MT8196 VCP.
- Expand mtk-cmdq for MT8196 with GCE virtualization, mminfra_offset,
  and instruction generation data.

Spreadtrum (SPRD)
- Add Mailbox Revision 2 support and UMS9230 bindings.
- Fix unhandled interrupt masking and TX done delivery flags.

Microchip
- Add pic64gx compatibility to MPFS.
- Fix out-of-bounds access and smatch warnings in mchp-ipc-sbi.

Core & Misc Platform Updates
- Prevent out-of-bounds access in fw_mbox_index_xlate().
- Add bindings for Qualcomm CPUCP (Kaanapali).
- Simplify mtk-cmdq and zynqmp-ipi with scoped OF child iterators.
- Consolidate various minor fixes, dead code removal, and typo
  corrections across Broadcom, NXP, Samsung, Xilinx, ARM, and
  core headers.

----------------------------------------------------------------
Andr=C3=A9 Draszik (1):
      mailbox: exynos: drop unneeded runtime pointer (pclk)

Conor Dooley (1):
      mailbox: mpfs: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE

Geert Uytterhoeven (1):
      mailbox: Improve RISCV_SBI_MPXY_MBOX guidance

Harini T (1):
      dt-bindings: mailbox: xlnx,zynqmp-ipi-mailbox: Document msg
region requirement

Jacky Bai (1):
      mailbox: imx: Skip the suspend flag for i.MX7ULP

Jason-JH Lin (4):
      mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for
generating instruction
      mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
      mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transact=
ion
      mailbox: mtk-cmdq: Add driver data to support for MT8196

Jingyi Wang (1):
      dt-bindings: mailbox: qcom: Add CPUCP mailbox controller
bindings for Kaanapali

Jjian Zhou (2):
      dt-bindings: mailbox: mediatek,mt8196-vcp-mbox: add mtk vcp-mbox docu=
ment
      mailbox: mediatek: Add mtk-vcp-mailbox driver

Joonwon Kang (1):
      mailbox: Prevent out-of-bounds access in fw_mbox_index_xlate()

Krzysztof Kozlowski (2):
      mailbox: mtk-cmdq: Simplify with scoped for each OF child loop
      mailbox: zynqmp-ipi: Simplify with scoped for each OF child loop

Kuninori Morimoto (1):
      mailbox: remove unneeded double quotation

Lakshmi S (2):
      mailbox: cix: fix typo in error message
      mailbox: arm_mhuv3: fix typo in comment

Mark Brown (1):
      mailbox: pcc: Remove spurious IRQF_ONESHOT usage

Otto Pfl=C3=BCger (4):
      dt-bindings: mailbox: sprd: add compatible for UMS9230
      mailbox: sprd: clear delivery flag before handling TX done
      mailbox: sprd: add support for mailbox revision 2
      mailbox: sprd: mask interrupts that are not handled

Peng Fan (1):
      mailbox: Remove mailbox_client.h from controller drivers

Pierre-Henry Moussay (1):
      dt-bindings: mbox: add pic64gx mailbox compatibility to mpfs mailbox

Sebastian Andrzej Siewior (1):
      mailbox: bcm-ferxrm-mailbox: Use default primary handler

Sudeep Holla (6):
      Revert "mailbox/pcc: support mailbox management of the shared buffer"
      mailbox: pcc: Wire up ->last_tx_done() for PCC channels
      mailbox: pcc: Set txdone_irq/txdone_poll based on PCCT flags
      mailbox: pcc: Mark Tx as complete in PCC IRQ handler
      mailbox: pcc: Initialize SHMEM before binding the channel with the cl=
ient
      mailbox: pcc: Clear any pending responder interrupts before enabling =
it

Valentina Fernandez (2):
      mailbox: mchp-ipc-sbi: fix out-of-bounds access in
mchp_ipc_get_cluster_aggr_irq()
      mailbox: mchp-ipc-sbi: fix uninitialized symbol and other smatch warn=
ings

 .../bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml |  49 ++++++
 .../bindings/mailbox/microchip,mpfs-mailbox.yaml   |   6 +-
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 .../devicetree/bindings/mailbox/sprd-mailbox.yaml  |   1 +
 .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  |  11 ++
 drivers/mailbox/Kconfig                            |  17 ++-
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/arm_mhuv3.c                        |   2 +-
 drivers/mailbox/bcm-flexrm-mailbox.c               |  15 +-
 drivers/mailbox/cix-mailbox.c                      |   2 +-
 drivers/mailbox/cv1800-mailbox.c                   |   1 -
 drivers/mailbox/exynos-mailbox.c                   |   9 +-
 drivers/mailbox/imx-mailbox.c                      |   8 +-
 drivers/mailbox/mailbox-mchp-ipc-sbi.c             |  41 +++--
 drivers/mailbox/mailbox.c                          |   6 +-
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  86 +++++++++--
 drivers/mailbox/mtk-vcp-mailbox.c                  | 170 +++++++++++++++++=
++++
 drivers/mailbox/omap-mailbox.c                     |   1 -
 drivers/mailbox/pcc.c                              | 120 +++------------
 drivers/mailbox/sprd-mailbox.c                     | 117 ++++++++++----
 drivers/mailbox/zynqmp-ipi-mailbox.c               |   5 +-
 include/acpi/pcc.h                                 |  29 ----
 include/linux/mailbox/mtk-cmdq-mailbox.h           |  19 +++
 include/linux/mailbox/mtk-vcp-mailbox.h            |  32 ++++
 24 files changed, 528 insertions(+), 222 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
 create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h

