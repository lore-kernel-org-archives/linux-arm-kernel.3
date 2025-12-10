Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D47ED3E785
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 23:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=swsMAmHq/VlFXVeTSw4EL9yHfJFR122Bl7TuSE+/U18=; b=WcahPk026WSm4gkXMJLzsZnmp5
	Ak9PJwIMzK4GMak4sir5IqgM/miieNRV2Eh/SQFst+0lMms1Dz5JdZh7CKy69ljhejqD010WBR1u5
	xFcUguJUhyeEBP+eDEFy1dVMoMIZJIq3Aql5LNdPiGLs7Bm1UfUk4cUqumtiYlYbYwytHRhnYmFOc
	5daaYdWp/eOva7k2UYj69FZVFGHvkDrYt75CShdYgf0hRvyafTOwJ7RttJqZk4oWLZYQfuNMo1Yqd
	So2Fzn1Ps7+ALg8X091izCZ8FRi+n074wXOkV4DfZQYQF/eIxTWfsfanp8uI4OtcU8NcqioyVZeS2
	FFoNAJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTTeV-0000000Fyq0-0T9b;
	Wed, 10 Dec 2025 23:31:23 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTTeP-0000000FypU-26oa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 23:31:18 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-3e8819eda8bso129631fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 15:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765409475; x=1766014275; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=swsMAmHq/VlFXVeTSw4EL9yHfJFR122Bl7TuSE+/U18=;
        b=ZhjEqeodpp21S5R+NYFTWkilkGLgNlNnL6D7+hZg15GJxFji1zu/G3t3s3OnyA7cWO
         6UL/S8Mg6bSATmukNICacd+dqsxFPfbJPdTzCiePlUs+hRdpEVC4yJim1Lx3i7ZmXNvz
         4nhX6G7jVtiT/4Y48Ig3hgtD6a6juIwd5LZYdNlRJVVCzw6Xal0nvVDY+JpEt26xeZk7
         +CfQOTupApVKV/xw7aVKmjGky0GQ9qmUAQ+56t9/a+heYg3VmeKytFc+rnjJbdbg7jL+
         1ko91Xusl3E2QnNLSRgHnYlq7i/VjniY3sU/cBfaWRBqxuvMRuhOs180XHqFit1f28B9
         fueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765409475; x=1766014275;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swsMAmHq/VlFXVeTSw4EL9yHfJFR122Bl7TuSE+/U18=;
        b=Wlb8M/+Hqtr7vhe6SRO2XOXkfI1h8BgEt3kEuBUREtkl2KTQ0NwS+sYaIW1ggHnv2Y
         95vV2otFtgHYFrU2uKQOAowwPyAReevTMtOnOOj2inqXgXrQNNonpk59EDrhSmckvPJp
         PgyQGVVMxLbquSsUIjGZps3gVADfIeqQq3TwOcW5HYWKZQSBFeJrDPh7DawSh4AzWBZ7
         JL8KXYBsozGJVz4KMtl3kIR6oB+IS39ZZtAhrrlmo/P6VkMtU/+f6KURf0yWpXSFjS/f
         vDBcSKbVImdpLr0gD2P7BBzhA7Q6k+j+3FMuENABwdre9qEYtWJsT77QsD4NkJJegdCa
         RR2w==
X-Forwarded-Encrypted: i=1; AJvYcCX5RO26SlXVVE2GYOpmN6sFvim+DvsFCVIganfcU2uFuajqiHQG7q5yaardUq25Wgh+mejwKz0ay8pWJpmOrqVL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo65zVEEg8HLY5LKiD8eald1Tqcdhh/k1JfDh4TPN7Kh122W/i
	S781NmR3r+iPukRaLdK0FFIRCrycfrXrz7G8p4q2QYuDBoJPWJO5DB47F3XVPyh2+EsobTHdBb4
	FIupUTculDjNDVXTuK7pk28rl0K7drUI=
X-Gm-Gg: AY/fxX6Lpv72g+99cfNjyR9aaQzOKGtWLp/gkY0/ryWrSEU8OqfthRaEhC2IKDcW2cg
	f3JfxP4U0wzFj+sj6DYk2KeJAxd1QlNg5WAn+BOuP40Z4Ox88Pcj+vox267SEBnQteTcOOYs7bg
	pTPqOqYa6kj8L2AbUBhVKqMOszyIDpFkh0IWbX0ilLLEo9xubutkr+Tb3rwjy/lcNajHgznxHRt
	uN+4H3gmZCsnftFbNMOvrcrX586TegvKcmJmg4OZxELK68i9q8VzGl4qb8pE37nMDxfRQqR
X-Google-Smtp-Source: AGHT+IFkNoYRV7SrsMIM1uycdogV7gRtyz7BmmOpQ2r7VNjxu9DVX4ARJAhOk6ogXk291j0y/A5EUZg9/EwN2V/Towo=
X-Received: by 2002:a05:6871:290:b0:3e8:21e4:2752 with SMTP id
 586e51a60fabf-3f5bdda0e42mr2602364fac.36.1765409475584; Wed, 10 Dec 2025
 15:31:15 -0800 (PST)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Dec 2025 17:31:04 -0600
X-Gm-Features: AQt7F2oUxtlAptnQSG1MLXV29934JavR8-Vyx8y2ncf4bWsKTIbj2KjBxYAU0u0
Message-ID: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v6.19
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_153117_552208_66628280 
X-CRM114-Status: GOOD (  10.02  )
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
The following changes since commit 7d0a66e4bb9081d75c82ec4957c50034cb0ea449:

  Linux 6.18 (2025-11-30 14:42:10 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.19

for you to fetch changes up to 175956b6672f93491da9c78d686f310311f0855e:

  mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa() (2025-12-10
17:17:01 -0600)

----------------------------------------------------------------
pcc:      refactor and improve initialisation and interrupt handling
qcom:     enable Kaanapali and Glymur platforms
renesas:  add MFIS mailbox driver
mediatek: add mtk-vcp-mailbox driver and bindings
          add support for MT8196 into mtk-cmdq
misc:     mtk-cmdq: Remove unsued cmdq_get_shift_pa
          remove unneeded double quotation in Kconfig
          drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
          fix out-of-bounds access in mchp_ipc_get_cluster_aggr_irq

----------------------------------------------------------------
Conor Dooley (1):
      mailbox: mpfs: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE

Jason-JH Lin (5):
      mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for
generating instruction
      mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
      mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
      mailbox: mtk-cmdq: Add driver data to support for MT8196
      mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()

Jingyi Wang (2):
      dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali and
Glymur Platforms
      dt-bindings: mailbox: qcom: Add CPUCP mailbox controller
bindings for Kaanapali

Jjian Zhou (2):
      dt-bindings: mailbox: mediatek,mt8196-vcp-mbox: add mtk vcp-mbox document
      mailbox: mediatek: Add mtk-vcp-mailbox driver

Joonwon Kang (1):
      mailbox: Prevent out-of-bounds access in fw_mbox_index_xlate()

Kuninori Morimoto (2):
      mailbox: remove unneeded double quotation
      mailbox: renesas: Support MFIS mailbox driver

Pierre-Henry Moussay (1):
      dt-bindings: mbox: add pic64gx mailbox compatibility to mpfs mailbox

Sudeep Holla (6):
      Revert "mailbox/pcc: support mailbox management of the shared buffer"
      mailbox: pcc: Wire up ->last_tx_done() for PCC channels
      mailbox: pcc: Set txdone_irq/txdone_poll based on PCCT flags
      mailbox: pcc: Mark Tx as complete in PCC IRQ handler
      mailbox: pcc: Initialize SHMEM before binding the channel with the client
      mailbox: pcc: Clear any pending responder interrupts before enabling it

Valentina Fernandez (1):
      mailbox: mchp-ipc-sbi: fix out-of-bounds access in
mchp_ipc_get_cluster_aggr_irq()

 .../bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml |  49 ++++++
 .../bindings/mailbox/microchip,mpfs-mailbox.yaml   |   6 +-
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |   1 +
 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |   2 +
 drivers/mailbox/Kconfig                            |  22 ++-
 drivers/mailbox/Makefile                           |   4 +
 drivers/mailbox/mailbox-mchp-ipc-sbi.c             |  22 +--
 drivers/mailbox/mailbox.c                          |   6 +-
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  72 ++++++++-
 drivers/mailbox/mtk-vcp-mailbox.c                  | 170 +++++++++++++++++++++
 drivers/mailbox/pcc.c                              | 118 +++-----------
 drivers/mailbox/rcar-mfis-mailbox.c                | 168 ++++++++++++++++++++
 include/acpi/pcc.h                                 |  29 ----
 include/linux/mailbox/mtk-cmdq-mailbox.h           |  19 ++-
 include/linux/mailbox/mtk-vcp-mailbox.h            |  32 ++++
 15 files changed, 567 insertions(+), 153 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
 create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c
 create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h

