Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94903D3C521
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 03:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiLAj4/ZoNaJJ4VlwZe/n3HvprgNfHlkv1I2lG9xQWM=; b=NPi+0g4rznqPTz51fNzOY9nXhL
	VDz0PzsVkiFc1s9cPaXVsjo6Wktj6zhyrcp+UcYFRLYruWU1/R7gLYre/081KbuDLGYb6xQUvcq72
	hSpI2k4kZTCi7OU+FyGtcxOZZlvH7YnEP7MwSIXKildTPHhE6RxX3agPlAPJQ94/4CKGFolEGKudw
	GWo2SPWVMO3HGH3qdYNVB5Nt6PucDXy2ZLstcYr34ksju0x22LcPmihlQ/XgUYo19qmZSisYDe3cl
	IHW5XD9zmfaYkp+biQEoWGdd0CVv0OsbiTScLJy3DUUa3BrAsmh8+9TItsJ+J8LxmMT2jsaf5UPa9
	6hX88D+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXMd-0000000GAF3-2wr9;
	Thu, 11 Dec 2025 03:29:11 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXMa-0000000GAEZ-1n8L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 03:29:10 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-3e89d226c3aso297981fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 19:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765423747; x=1766028547; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BiLAj4/ZoNaJJ4VlwZe/n3HvprgNfHlkv1I2lG9xQWM=;
        b=D931ib7ylV79IiU5D1Fx1cXzQ7xOMygkyD1PZvKU+s1TwIcdXJepVC8bAz41anMbh9
         EaYNU5VEIWYB5yR1OzEEBT1/Da7WqlmurypBFsO9ABLCOiWRXNVclTkaBChUnAQ0ihlf
         JAcD83FaDcjxPRHKD/4p4GAYuz/1h01VFI95gBYDXgl/ZO2s5Bjxv6o4yhGV25kotCqC
         OsFHwe8xJ7NdhuSv0ovXiF0jF7vEh+OThaYTRqoT+iwxRE6wnu4KOudbo/DM6/hTkglZ
         fRlegL4KXg/56RgPKoYUJWznH8I2RnSwuauD1fZn8/qVeNUYfck2nb0XNEwjrTT6UKZu
         HCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765423747; x=1766028547;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiLAj4/ZoNaJJ4VlwZe/n3HvprgNfHlkv1I2lG9xQWM=;
        b=WHDatX6y/sdXkIHXOL0EwmsLVfpPItOF+tSQXacv+s/9fpJFac+MWMYrUYzyDWNDKb
         DO67Pd8JzpIXTKu+KlnahXd9K8epT9LnYQV8atRxgpxxSy4Vyl1cRoYh9OOk5Fe+pZnv
         QZ5vm/oyIW8Nf2K7Je1o9NiVjHo/oZh57yCrsVS5t0UP5moMU/8cq00MBBWQLc8ceQI4
         iCw5P9CEh/N9xlJ+neemIVg5yrCY5kUc392PPiw0doCF/j+wgiTrd5Sk+KlJeOM1mV3t
         YbtkrOTY6aJ6Xjwxc1MABZlUMQfV6ITMX0ARkMzDtjJqwyPdVVLBuXWkek9XyQ+hRtWL
         n4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWpoXJiEinhdMEtzm8Wquk3nWq+c5kC9sUA2CblSeq7Ppy8MxPXddc1bAZFjV15mv+o8AsfxnAUn4yIUy0XwUW1@lists.infradead.org
X-Gm-Message-State: AOJu0YyS/M3wkvNq7rk4uUk98MMTdykMI7G3QOwdNNDK/E6AR+qZfa4I
	Tt1vFvlXHKbJUkIoQdzeiLLxLq4EORbTukiOtpmZFoQEqj5pa6HsYWOP1qyYVmlIVJSY1Dws801
	sZGIELjQeAwjNr4bPV2juyhb9r8QFdfw=
X-Gm-Gg: AY/fxX75c7fD92O0KF1ApZcNPW5dR7I9ZRxSMP/tTw9Ta70qxosX/X/IKv8ImuyHcb9
	k0kT7iOQIX9uHh04AfAo1jLhNKnzAQSpDJucec546CJKa90jmdgqU4c7ja9TDHqiB5Q2AsUXhDU
	6FGXMbLPuyFPbJRjZuFpi0n02gUp50lsGfo64uxfLwXoMfE68VV0J2e/w7rS9IXhe2NvbHdEkiv
	r6SaGHmXGeRQqOBQ40+9q34W+mUwTeN4RBgs+4wjzAM6wFj+JLwsTuD3bcjoNVlitVQrKEK
X-Google-Smtp-Source: AGHT+IH97W6DY4w34Ex5xS2slpPJJrxfE4qTeTDOsmFtBRI8Q6nlrOjBEiQsYS8+mMTCLT06bakV7FZbmfoMb4e44H8=
X-Received: by 2002:a05:6871:2e14:b0:3f5:b976:a554 with SMTP id
 586e51a60fabf-3f5bda2b5afmr2337152fac.25.1765423747244; Wed, 10 Dec 2025
 19:29:07 -0800 (PST)
MIME-Version: 1.0
References: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
In-Reply-To: <CABb+yY0Uvkc4g0=gi79j+CCJzKkeuHGD9u_6P5ScAFkNS0F+2w@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Dec 2025 21:28:56 -0600
X-Gm-Features: AQt7F2rT6y6HelIUQ3DOqpiT9wp4lW05eTX32nzAr0GvtO06tCze4I0JOgQ_ei8
Message-ID: <CABb+yY2or-wT46Z3jGZ_ks91tHGM2D-1OYeL0xtHfuZURatg9A@mail.gmail.com>
Subject: Re: [GIT PULL] Mailbox changes for v6.19
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_192909_560048_5F8D8B90 
X-CRM114-Status: GOOD (  11.26  )
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

for you to fetch changes up to 1ec6e0e8c0dd6599472af944b8d703d526ff1031:

  mailbox: mtk-cmdq: Add driver data to support for MT8196 (2025-12-10
17:17:01 -0600)

----------------------------------------------------------------
pcc: refactor and improve initialisation and interrupt handling
qcom:     enable Kaanapali and Glymur platforms
renesas:  add MFIS mailbox driver
mediatek: add mtk-vcp-mailbox driver and bindings
          add support for MT8196 into mtk-cmdq
misc:     remove unneeded double quotation in Kconfig
          drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
          fix out-of-bounds access in mchp_ipc_get_cluster_aggr_irq

----------------------------------------------------------------
Conor Dooley (1):
      mailbox: mpfs: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE

Jason-JH Lin (4):
      mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for
generating instruction
      mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
      mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
      mailbox: mtk-cmdq: Add driver data to support for MT8196

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
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  74 ++++++++-
 drivers/mailbox/mtk-vcp-mailbox.c                  | 170 +++++++++++++++++++++
 drivers/mailbox/pcc.c                              | 118 +++-----------
 drivers/mailbox/rcar-mfis-mailbox.c                | 168 ++++++++++++++++++++
 include/acpi/pcc.h                                 |  29 ----
 include/linux/mailbox/mtk-cmdq-mailbox.h           |  19 +++
 include/linux/mailbox/mtk-vcp-mailbox.h            |  32 ++++
 15 files changed, 578 insertions(+), 144 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
 create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c
 create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h

