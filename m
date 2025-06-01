Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6A8C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 22:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQBtyBckoPpDZJKoZg4EzGegksEO0utLn/9XYWq5qDM=; b=mkZc55hJq0cwn9drkOGJShMBAi
	EBIJnbg+VbLGX0EAzxrZwCbElnXC3Fkfx6Zz3YfWoQM09OWl55IaUHXi3E3P5GPnuIhQ6JAI/RSW7
	9zIsv3QKXEz/NpW4r96UKnwYFlck7k9MD3VVaVY95KyIWV8HzACemc8+Oe6KRsz4y6X8MoLm44DLi
	yrP/1ntbtFJpZ/R4MzeQjiZrMOpRxUg+Kql7D4Dgn3KhP18uw6/QhvcZUjNft9X1xLKfXeX8M4qBw
	o4fX+wtcu7bl1Fsjtygrr0dW7fwC+LUR9OkhzJQStlyVcAY/0yVuLViO6L8gNChTM8ZXSehm5i0Sp
	PXjzXFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrBn-000000060LP-2fF1;
	Sun, 01 Jun 2025 22:29:59 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLr7I-000000060Be-4BEf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 22:25:22 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-40337dd3847so2504201b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Jun 2025 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748816719; x=1749421519; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bQBtyBckoPpDZJKoZg4EzGegksEO0utLn/9XYWq5qDM=;
        b=JDW/X/ha4fOJ8rr+hYro1pWWdxLjV9tOErcNYLUCAVjwr7ryJnHCkyDNyOnIpTyHG/
         h9yUpAXrj2L6VX/HgSEtcaLxO16giW+rdKBHngLR44a9XMolQ246aYIJ1Jyz96JbhJOO
         P0ugBT1tI41hSPY/eg0PAFgsV6XqHWgEEBx+bEmd1qS+uGCDIx6kDjFv1dmp+AGedrvW
         by35Eh14VFPdrzDwx3PCjdLSNkaIDKl6CjlKpOMJfrxMbm6Z9l1pJUJCqG+26mDSU178
         7bs/zThHv7C2uf5Z1G57SsWkUlsn8LGi647XVkJdyZctpuJhkzrV7tWx/8AQ17grghUZ
         DvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816719; x=1749421519;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bQBtyBckoPpDZJKoZg4EzGegksEO0utLn/9XYWq5qDM=;
        b=VZ0atNvxuK+4TWTi7TLx8UpTK/BPD+Z/yIvIw68210lwjki0GVLE2ev49PfFTkcg1U
         cy31QyxQ8kzuOoauTGphFhmOpE6PEsCU6Bv7v+/U8gzMppdgFZpj3uwaTZExY7ltOtnB
         Y9wFdw6WFEHe44fJi0NGrKEymDo8O7FNl7utDI6rh17Bv1DmoX7213zc8EHgWwGyAwVD
         wC4J1Vv8y7+JqUH990W3hbIixfnDtxYwfJ+tjBxxkAdri7SYlhRcQkQAy49bX/rN07II
         VDm4pRveClwIklZQ9gVWk3XG/PiSYhVexAHqo8yT2R6Iw+J2Uv0FpPyKoPzTxVRpiOII
         wn7w==
X-Forwarded-Encrypted: i=1; AJvYcCWkdCbv8JwRygSRUndQw/1+EXxv1iDK+ZmF4K3vrK1FDDuwyBEGXLdsSjfnHsGqWzXuUwCkYToaTxqbWEw5fQ47@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJoQ7mRCoz6IYuvQ9xqmhCBAdLPs+rIfLpX0o520rsIp4nb5/
	4ITGNCucVdWOAtZL3kJ5d0pyyi+azoCU1PFxCiJfaWgZikkW0GkamAJ4uYyrv2foGUe2EPv9O4Z
	EwEOk+8R24MTJb+JLmbBgw8E9CkYWJ9w=
X-Gm-Gg: ASbGncudYpWP34WRANhuzmUeKzFibxI6vq8ur6xYXHG7eJO6AKPqujRLZK9QYQ13C+R
	585eCD+SSk/ypNCuxUNkmEpeiXjChDBiIKMzpHfnVuxyOnZOXa7w7IdYe4xbk4bUTsCZJ1MO7wA
	IEO46UPRLGObN4J+YAFPM3LA7t+fzFIPFQlw==
X-Google-Smtp-Source: AGHT+IG8h84cnoDGmPM2wUQp8K6n6nIRYzYCfzkJFo5ukI7macMT7pJZL3QEYaCjlzX/N63TOTdFmooErb/s7w5n5MU=
X-Received: by 2002:a05:6808:1d02:b0:406:7704:b2e9 with SMTP id
 5614622812f47-4067e550230mr5491095b6e.9.1748816718917; Sun, 01 Jun 2025
 15:25:18 -0700 (PDT)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 1 Jun 2025 17:25:07 -0500
X-Gm-Features: AX0GCFsDsAzayrx7tSJWlDUSaooEVCAH1bhCRroOmZTwTH6Zg-oJiU1qWyBmMac
Message-ID: <CABb+yY0mDQrYH0Z6=kRyCft5DXgUmhT2X-trRfs+PPd8i8ppbg@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v6.16
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_152521_040516_02F1D923 
X-CRM114-Status: GOOD (  12.40  )
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

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.16

for you to fetch changes up to d0b497df02e9b2ebcb5771c7b16e424c0614a366:

  mailbox: qcom-apcs-ipc: Assign OF node to clock controller child
device (2025-05-29 10:01:35 -0500)

----------------------------------------------------------------
sophgo: add driver for CV18XX series
mailbox core: misc cleanup
qcom: add SM7150 APCS compatible
      apcs: added separate clock node
imx: fix tx doorbell send
microchip: misc compile option fix
mediatek: Refine GCE_GCTL_VALUE setting

----------------------------------------------------------------
David Wronek (1):
      dt-bindings: mailbox: qcom: Add the SM7150 APCS compatible

Jason-JH Lin (1):
      mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting

Peng Fan (7):
      mailbox: imx: Fix TXDB_V2 sending
      mailbox: Use dev_err when there is error
      mailbox: Not protect module_put with spin_lock_irqsave
      mailbox: Propagate correct error return value
      mailbox: Remove devm_mbox_controller_unregister
      mailbox: Use guard/scoped_guard for con_mutex
      mailbox: Use guard/scoped_guard for spinlock

Stephan Gerhold (2):
      dt-bindings: mailbox: qcom,apcs: Add separate node for clock-controller
      mailbox: qcom-apcs-ipc: Assign OF node to clock controller child device

Yue Haibing (1):
      mailbox: mchp-ipc-sbi: Fix COMPILE_TEST build error

Yuntao Dai (2):
      dt-bindings: mailbox: add Sophgo CV18XX series SoC
      mailbox: sophgo: add mailbox driver for CV18XX series SoC

 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 170 +++++++++++-----
 .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   |  60 ++++++
 drivers/mailbox/Kconfig                            |  14 +-
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/cv1800-mailbox.c                   | 220 +++++++++++++++++++++
 drivers/mailbox/imx-mailbox.c                      |  21 +-
 drivers/mailbox/mailbox.c                          | 199 +++++++------------
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  51 +++--
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |  16 +-
 include/linux/mailbox_controller.h                 |   3 -
 10 files changed, 536 insertions(+), 220 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
 create mode 100644 drivers/mailbox/cv1800-mailbox.c

