Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A0BC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7xYExPXcLxWEuDQU75SlP21gV8YC9MMREgK3xao+T0=; b=mafvqWujIJx3fIQagfC9eb7LZN
	nzoX1PcFmaLmgn4NFpsuGiB2mc8IEL+uXbDA6L4p1VSihaursSbsBxj8egoOr4HI/1+CPlv5jsuoA
	Mr4Ye1P2tISCl3nYVAln+eFciNbpuf4QxVKfMifqrDvS3R3xz7ohjIzP/P1Dbzgg6hjwiZoIWfNub
	xKAL/IeKOBi2K0TKwb1PABXMZ+8idBPLPmnbO+xPN0sZxvX+8EY03qCVMkQHYds27JqRgeNPw/YMA
	hPkK0stfQEGPzNcMapGEa5hgd0kVZ1ZlIzeex0adK0Z6BDK6HyglL4YCD8xWbLhIbACMwFvo4w/Qb
	19gEahkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW0V-0000000GpXP-2ZI8;
	Mon, 24 Aug 2026 14:50:39 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW0S-0000000GpWj-2Hnu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 14:50:37 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-4b1bf68b387so2175281b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787583034; cv=none;
        d=google.com; s=arc-20260327;
        b=InM6v7vWl8Bb52+LD5E30d9kTvOPzvpwYAZ1czOEsyAT9C4fRJJH0pXRO5W5Zg/9oF
         sET7DRgjYHh2RwvObdxINYXM/xLH7xnAaozftrgPVvW/Layz+i+ah2L0DpjgHpzugcdr
         MNTQ26H2PPQJAH0KgCgpDS7uATt01jd0Ii/KwNBC3EmcE5evs+Xmspw7FcZEX08p0BQK
         tV0OhU0GRk+OI2sFWakvPfHPjoyr6cyO0krEk2Pfy+VxBnUGnMv8YKeSha0rGdeKhg4Q
         xKhrKBrhhcO9RmLItP40mkgH3pp7rvuJCU5xH1h758PznyBuhDrt2nZKcKM8WYRznx6x
         IkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=L7xYExPXcLxWEuDQU75SlP21gV8YC9MMREgK3xao+T0=;
        fh=e6LAOaD4NkL7Ulid7auMMwraUtZlJNTLPkhRJoUOYEc=;
        b=A3ofxMX/6c3LpitZsnVHPEbG8Sql6xeMVZL12tfvIR9rolNdhDQay4M1VkYxwNKXay
         jvQSZtaYiDM9Hh9+Hvu0qukxNKj69oS5zuUhHet4JguQB0o/QzPsi5VwMhW5aSD0AL3a
         LZU33/cLrDzhKbd9/DJOAf5awQdqCo36Kypl0+a5uz5oQm8lPCBXOTFlXxFYocVPe8kg
         B/cFDqO3wPRxIpm+jDp2tNL06jpGXkKi9qU0Po7zfLx5G7i0aRLmlBbdPMlPTjQ9AFJ9
         uM4/tqueugAi/1b+Ph+Lev5r/Jn7GUfl8iNT+i143r1ZE4hP5O++syoPms9kRUOREs45
         C8lQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583034; x=1788187834; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7xYExPXcLxWEuDQU75SlP21gV8YC9MMREgK3xao+T0=;
        b=Mx59aX6F6h6ZlcOTTfNri6qgieXYsZ16vOPkAI8I59gKK0fuI86S6bk0HwaRHcN0/V
         CRKXFOes0FyKvKkQfu31ZQSg12weyrzJE8KgBIKB2xvdQaD2Y0BPtTK+PNFB4AuFpJ5M
         plFXYR5myXLGM8Ql5gPU5sNfJ9kLcTB5LzncRj82f0UlqBSjr0VbA9QQD4yuOjwvUzF8
         x5nZdq/UjrEVN9D569BDD7XpsSIuqVsFh16n2uzpH7NUhO9wkJBKEm+JVp/vyOeDSc9R
         96rAT+RYUb8GzIYasV6vwjXCTdSmdEbWmtgn+LscRGTSyLNtVgYqJaNrCPLy9KzGV872
         dzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583034; x=1788187834;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L7xYExPXcLxWEuDQU75SlP21gV8YC9MMREgK3xao+T0=;
        b=carbGcI45G5qhlejwND7/HYtMU/gbKM8ZfcGKuhgGrO/eCNkpowarX1bTtDt51hYs0
         CbteNHTHBtsfBSq63A0hV5eeua0Zf1/pJ58j5uMmCcHHKQdvNmeaaBQ2JOJFv6QTeHZK
         0tCgFMLY3uO8KJcD7wtAWMcFn9Xs8kB/AC0ydPc+1bgQTSAGqXEYr3pJzsRhJc1K7vUO
         sd5tvg3l3qaaU3V0Rbh2HotQH9NKK3bgS+jBg6iTYyCx6XnN1gIqMKYuuYjcMYtdBXNX
         WkOlyaEZ38v7CujOKUQgnAnXoykzHwhZMmn9YatnVXDQXqelKs2QKrD0K6PEg1zrCy+a
         uRiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrf436PHGyh4u5Ewu1r2smbRgPWqZHPqjg6ZJ605MHzZQVby1QGzDqdYItP+5c0/HsZkHbO0/RRM56C/cCXTmd5@lists.infradead.org
X-Gm-Message-State: AFuF++kyYua4ddnXSY/hNxOzQxXfOJVGmsBGzT/8c+ItwCSgTYFjmBT1
	XHHao4XqQG7l4rWgJWalGFzdhA7bURagFD8+yvaJQ9wd+4/JSm2SnIBs++rtFrIK7SXg6YFnro+
	GdFBmupc3vXMNApdxO3/vFMMPWm/suH7kHg==
X-Gm-Gg: AR+sD11RbpIwAGXFI2T2Jxgmjjtf3adbrf9qjOU+o/C+OCWeyBg57VQYrd0yPlhWxWM
	rngJYC6pJxMW/wTdWI2EmFTmFqCbhMcL0W3dUlwwUPkUILyxtlb6RXHLPvCN1Vp4EyT4jxrRpG4
	M3gg6uzkJgBj7/uVazV4jM6d8QtMN+2oLac3n178V3GBWohzHyGA0N5yfTaXCwJYifyR1Sv0Dke
	6Fky6jHPlpI3fBeLlp8DaoITnw4EgTfyeeU7kbzMyAbuH2JgykgzixvPo6U+vQKVjEPfN9Reu2h
	Nh9CkSUqV+PCszCzgA270lAsKE18DL6uxIV4at+H9aVm
X-Received: by 2002:a05:6820:1609:b0:6ae:ab01:9199 with SMTP id
 006d021491bc7-6b16b4c89ccmr16078610eaf.34.1787583034234; Mon, 24 Aug 2026
 07:50:34 -0700 (PDT)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 24 Aug 2026 09:50:22 -0500
X-Gm-Features: AcwNN1WKjMBcWxC-ErsANLZ9k5sS7TbRDGPAfjYsEYAeoEch9TosN_CPs7rf0pI
Message-ID: <CABb+yY10r9s2czQkkz8BPjhUy+kcAgxjqhFCiBEAwPv2ha6S9A@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v7.3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_075036_600910_F9907E2A 
X-CRM114-Status: GOOD (  16.79  )
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
The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v7.3

for you to fetch changes up to 14af7a96afa39f4f3c1972705489b9ba15c01857:

  mailbox: add Axiado AX3005 mailbox driver (2026-08-23 15:41:13 -0500)

----------------------------------------------------------------
mailbox: updates for v7.3

 - mhuv2: convert channel translation to fw_xlate() and use generic device
          property APIs
 - axiado: add AX3005 mailbox controller driver and DT bindings
 - bcm2835: use platform_get_irq() and simplify probe error handling
 - cix: fix DT property string typo and use dev_err_probe()
 - exynos: add Exynos850 mailbox driver support and DT bindings
 - microchip: add null check for devm_kasprintf()
 - pcc: fix missed-interrupt command timeout, verify shared memory signature,
       and notify clients on polled completion
 - qcom: fix CPUCP PREEMPT_RT deadlock and NULL data crash, fix IPCC duplicate
        channel allocation across holes, and add IPQ5210 APCS and Nord
IPCC bindings
 - riscv: validate RPMI notification buffer lengths and event payload bounds
 - rockchip: manage peripheral clock with devm helper and drop unused
struct field
 - ti-msgmgr: convert bindings to DT schema
 - misc: remove redundant dev_err()/dev_err_probe() on IRQ request failures
        across drivers

----------------------------------------------------------------
Alexey Klimov (2):
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox

Anup Vishwakarma (1):
      mailbox: qcom-ipcc: fix duplicate channel allocation across holes

Deepti Jaggi (1):
      dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC

Eduard Bostina (1):
      dt-bindings: mailbox: Convert TI Message Manager to DT schema

Griffin Kroah-Hartman (1):
      mailbox: mchp-ipc-sbi: Add null check for devm_kasprintf()

Huisong Li (1):
      mailbox: pcc: Fix command timeout due to missed interrupt

Jia Yang (2):
      mailbox: qcom-cpucp: fix PREEMPT_RT self-deadlock in IRQ handler
      mailbox: qcom-cpucp: handle NULL data in send_data callback

Kunihiko Hayashi (2):
      mailbox: arm_mhuv2: Convert channel translation to fw_xlate()
      mailbox: arm_mhuv2: Use generic firmware property APIs

Linmao Li (2):
      mailbox: rockchip: disable pclk on probe failure and unbind
      mailbox: rockchip: drop unneeded runtime pointer (pclk)

Pan Chuang (1):
      mailbox: Remove redundant dev_err()/dev_err_probe()

Pengpeng Hou (1):
      mailbox: riscv-sbi-mpxy: validate RPMI notification lengths

Rosen Penev (1):
      mailbox: bcm2835: use platform_get_irq and simplify probe

Sudeep Holla (2):
      mailbox: pcc: Notify clients on polled completion
      mailbox: pcc: Check shared memory signature on request

Surendra Singh Chouhan (1):
      mailbox: cix: fix DT property name string typo and use dev_err_probe()

Swark Yang (2):
      dt-bindings: mailbox: add Axiado AX3005 mailbox
      mailbox: add Axiado AX3005 mailbox driver

Varadarajan Narayanan (1):
      dt-bindings: mailbox: qcom: Add IPQ5210 APCS compatible

 .../bindings/mailbox/axiado,ax3005-mailbox.yaml    |  96 +++++
 .../bindings/mailbox/google,gs101-mbox.yaml        |   4 +-
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |   1 +
 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |   1 +
 .../bindings/mailbox/ti,k2g-message-manager.yaml   |  67 ++++
 .../bindings/mailbox/ti,message-manager.txt        |  50 ---
 MAINTAINERS                                        |   8 +
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/arm_mhu_db.c                       |   1 -
 drivers/mailbox/arm_mhuv2.c                        |  24 +-
 drivers/mailbox/arm_mhuv3.c                        |   5 +-
 drivers/mailbox/armada-37xx-rwtm-mailbox.c         |   4 +-
 drivers/mailbox/axiado-mailbox.c                   | 395 +++++++++++++++++++++
 drivers/mailbox/bcm-pdc-mailbox.c                  |   5 +-
 drivers/mailbox/bcm2835-mailbox.c                  |  37 +-
 drivers/mailbox/bcm74110-mailbox.c                 |   2 +-
 drivers/mailbox/cix-mailbox.c                      |  16 +-
 drivers/mailbox/cv1800-mailbox.c                   |   2 +-
 drivers/mailbox/exynos-mailbox.c                   |  72 +++-
 drivers/mailbox/hi6220-mailbox.c                   |   5 +-
 drivers/mailbox/mailbox-mchp-ipc-sbi.c             |   2 +
 drivers/mailbox/mailbox-mpfs.c                     |   2 -
 drivers/mailbox/mailbox-sti.c                      |   4 +-
 drivers/mailbox/pcc.c                              |  87 +++--
 drivers/mailbox/qcom-cpucp-mbox.c                  |  27 +-
 drivers/mailbox/qcom-ipcc.c                        |  21 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c              |  12 +-
 drivers/mailbox/rockchip-mailbox.c                 |  19 +-
 drivers/mailbox/sprd-mailbox.c                     |  12 +-
 drivers/mailbox/stm32-ipcc.c                       |   4 +-
 drivers/mailbox/sun6i-msgbox.c                     |   4 +-
 drivers/mailbox/tegra-hsp.c                        |  11 +-
 33 files changed, 814 insertions(+), 198 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/axiado,ax3005-mailbox.yaml
 create mode 100644
Documentation/devicetree/bindings/mailbox/ti,k2g-message-manager.yaml
 delete mode 100644
Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
 create mode 100644 drivers/mailbox/axiado-mailbox.c

