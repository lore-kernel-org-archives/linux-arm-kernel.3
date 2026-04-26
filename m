Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417CEFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 22:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DpolBNQI1ISDHWJRF7n4gmHjOHDLOhmwHwmZt6RCU6Q=; b=LVuI7D95hmjel7DR4eblIYCU27
	hImDBmol5pVo5Fc0bfX/gccAhpZpxTByuK6YLI9YnKDYAQoofCIn8Dc1hAjUa8T1IDicVARRdOVHz
	dWJWoYKapQPNGZmAk0oUc8TcUM4meZ5f2au4OaeqUXmDoj2D1WDczimMRw6C+3LgXza0Yaf/S5580
	57Sc4QetERnXDGvr76cj4JbkL/zCsAWdzhlQYig4juWYsjHSzzR5fXE7EUCFZ0Mjm4JxS3ZMpTCp6
	H1H8P8tBNQQv+yviRwhyEbe/sN0LuflXGKY3UUx8eMlEksv0WLRkZKFVkHjfntF4c+aCsNp50oUeG
	ohhvGq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8K1-0000000FuJB-0mXo;
	Sun, 26 Apr 2026 22:51:29 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8Jy-0000000FuId-2DJh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 22:51:27 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-408778a8ec4so5844419fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 15:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777243885; cv=none;
        d=google.com; s=arc-20240605;
        b=CTmzREXJIpMGHZq7uNr21hcKI/mlGGEi26Hhy7GnCYIkVaGGtTXMovooDDTCeaD3Kj
         viLj30qCdfNwNNijDt8QGjcqvdTMEEL5DnUCWaMepPPrbEehBGKdbnHpdCOGEBL68gsW
         G1wvYKglue95jQIXC4vMr3jYZjewCAS/KPcA+OHaGg+rXvwkcu184tx8WunfoXif5bwZ
         QhFVkUjT2g/wCCcv1t9EbNcq2Y83YF9MUagSlWIcqsO4KUvrjgZ5f8+U2RvhwvBOVQDp
         X7Lmac+YZkwFqyHJ8e5DyDZG6La5jTtydubFIIK8yJbs3f0ihqgViMTZ/OfvEmSyGVGQ
         4vhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DpolBNQI1ISDHWJRF7n4gmHjOHDLOhmwHwmZt6RCU6Q=;
        fh=pF6/PktA7FeWNVMTupqRKo7fdBM43NHIhYQuZj0R/bw=;
        b=atkl7islO6JTmdl1EZXDIg/PsoaMBe/jsn9jYb0swMguyYjuruIwYtranzZjJ5IK85
         V2r6yJlgJ1L96PkG13AuRzlqKCJAJ9NHd2BzWPHePD0ooOp6T9rFHXOUeS9rZu3Db3/f
         DlpKv+ePXh4fAsQyTQuHlBL1W4ND04iGlCmPhjLO/rvLh5gDL/UnENl9NNBZv2LS5/W7
         lyyxeBx/oSMJapdpqq/fXcBmeI3C8Nx4Igp2OpudSLSoH4nZl/R2mG+2H/zXt+aZGrXZ
         p/4EtzFT99eAkiTFxVa7j+2gNXsivSoDzGLag2PaVbf0OQEUxUtd1A7Ig2LsIRSVuXsP
         Ju4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777243885; x=1777848685; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DpolBNQI1ISDHWJRF7n4gmHjOHDLOhmwHwmZt6RCU6Q=;
        b=EuYZZnQ012hp2WIfKYRUfVtXr4nI5kODxq8EzNMvO9p2yh90ksYnvgpM5F4VAFyQde
         VAEsilGFWpIoqi280/1FzFQ7xrDX9dh7w2ukuhuXL5tLkT/rpM/nxS9BqzWp+hfqrRTA
         0rTCDvg3PVCFuWAjLx3KLjAKubigSx3I19PjaQZ0TwRWiuMy+vINCqk5ovxnKpHtcJgF
         TWhJN51O0aCwlROjSIcSeQU1QW3/waavw4c1N7IkRcrYR7RiZg2KCa2P9EdGAKBu32C/
         PYnbqHeEYgm/WieKbA1WeIxmOTZx2C1Dx/QiQrD/oeYI34XJa27Cq05anV1dSuXgRYTP
         hiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777243885; x=1777848685;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpolBNQI1ISDHWJRF7n4gmHjOHDLOhmwHwmZt6RCU6Q=;
        b=mdbt4X6gJuVb1otRa/i/z74TcRTzCv5gB6Z2KX22BfrJee92lpCTG/KoAn30iileRD
         fOhJe6qrAzTMjrqvxtCCXkI8BbbWY+LYWPi9KumPmNodydRCUm2kwizlHHI4No4RKMVR
         WQ9Ir0M+R3zj6r1mz4i+XzwBvsrxkadD6YBhTxGaOZRMSGO8cB2IFYOenUOheikT+BXK
         2SzJm5mV8tkEDn1F5Ke8JcinsiemHbsodEQE5F7g+3gPDZ+R9cR9c8JylhNNpAhu7GIF
         4AlEuoGneFf60GDLYpPhhSV+ZD2wwzxrKglPH2uJ3rLk4l7G0RcGWYCwDDmlNhOalSwb
         Xdfw==
X-Gm-Message-State: AOJu0Yy/bWrUV9EdZUjSGAFcv8eQgevQn4aV8pi65QycB3SnVs51bZo3
	BhSopF77vQgJ8DsmqrVLbVRvRP8zsOs/KE6SttORRcwIJJKSXnhfUy4L6hADgeYGLEryU7HApMZ
	RTupKuZDLrqbovOShfcO/8LrmoD5EED6Yc2ZR
X-Gm-Gg: AeBDiet3o2VehrYPTGwCoxvS+5XY02NJ9ZXj5weE5pX7IiyRZWGmqrY76ZBiT+T/wy1
	Y5fuA2xuonYueg9TWMtkLevsMzpgZ9+T2rRhLzzjElFItdkHWwL+LTz0wZGyvIUnu7UNoByCDOp
	eUJStTv8qgOW9e8j9EgBk2e/lIQGckJBa4W223gGJ5TW/eAdceBlVPziO0m9fy8CBTAlz36jMrW
	wHxgwyEh6t78TpqoU72i4Idr4tiFXiEXj8N4sAXcnADAqlJhGeuTxb9vVEeFJhvKLLeR1aliVbm
	kMuYWc+08rP9pgoSECQ=
X-Received: by 2002:a05:6870:a112:b0:42e:a647:5615 with SMTP id
 586e51a60fabf-42ea6475e68mr14125429fac.38.1777243884824; Sun, 26 Apr 2026
 15:51:24 -0700 (PDT)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 26 Apr 2026 17:51:13 -0500
X-Gm-Features: AQROBzCvzYr9kEepscCiHqoRhMvlP1xV9RgMfzLZaOzWVC3-gBHxM--Zuwgn700
Message-ID: <CABb+yY3-iRU8m_UQw2hsmP8R3aTVRRfuz7VgVizVerRMLNdS1g@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v7.1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_155126_604632_D01B4440 
X-CRM114-Status: GOOD (  12.51  )
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
The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v7.1

for you to fetch changes up to 6e937f4e769e60947909e3525965f0137b9039e8:

  mailbox: mailbox-test: make data_ready a per-instance variable
(2026-04-18 13:10:14 -0500)

----------------------------------------------------------------
mailbox: updates for v7.1

 - core: fix NULL message handling and add API to query TX queue slots
 - test: resolve concurrency bugs, dangling IRQs, and memory leaks
 - dt-bindings: qcom: add Eliza IPCC
 - mtk: fix address calculation and pointer handling bugs
 - cix: resolve SCMI suspend timeouts
 - misc memory allocation optimizations and cleanups

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: mailbox: qcom-ipcc: Document the Eliza
Inter-Processor Communication Controller

Dylan Wu (1):
      mailbox: cix: Add IRQF_NO_SUSPEND to mailbox interrupt

Felix Gu (1):
      mailbox: mtk-vcp-mailbox: Fix the return value in mtk_vcp_mbox_xlate()

Jason-JH Lin (1):
      mailbox: mtk-cmdq: Fix CURR and END addr for task insert case

Jassi Brar (2):
      mailbox: add API to query available TX queue slots
      mailbox: Fix NULL message support in mbox_send_message()

Rosen Penev (2):
      mailbox: rockchip: kzalloc + kcalloc to kzalloc
      mailbox: hi6220: kzalloc + kcalloc to kzalloc

Wolfram Sang (12):
      mailbox: exynos: drop superfluous mbox setting per channel
      mailbox: test: really ignore optional memory resources
      mailbox: correct kdoc title for mbox_bind_client
      mailbox: remove superfluous internal header
      mailbox: prefix new constants with MBOX_
      mailbox: mailbox-test: free channels on probe error
      mailbox: add sanity check for channel array
      mailbox: update kdoc for struct mbox_controller
      mailbox: mailbox-test: handle channel errors consistently
      mailbox: mailbox-test: don't free the reused channel
      mailbox: mailbox-test: initialize struct earlier
      mailbox: mailbox-test: make data_ready a per-instance variable

 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |  1 +
 drivers/mailbox/cix-mailbox.c                      |  6 +-
 drivers/mailbox/exynos-mailbox.c                   |  4 --
 drivers/mailbox/hi3660-mailbox.c                   |  2 -
 drivers/mailbox/hi6220-mailbox.c                   | 14 ++--
 drivers/mailbox/imx-mailbox.c                      |  4 +-
 drivers/mailbox/mailbox-sti.c                      |  2 -
 drivers/mailbox/mailbox-test.c                     | 80 +++++++++++++---------
 drivers/mailbox/mailbox.c                          | 67 +++++++++++-------
 drivers/mailbox/mailbox.h                          | 12 ----
 drivers/mailbox/mtk-cmdq-mailbox.c                 | 10 +--
 drivers/mailbox/mtk-vcp-mailbox.c                  |  2 +-
 drivers/mailbox/omap-mailbox.c                     |  4 +-
 drivers/mailbox/pcc.c                              |  2 -
 drivers/mailbox/rockchip-mailbox.c                 |  9 +--
 drivers/mailbox/tegra-hsp.c                        |  6 +-
 include/linux/mailbox_client.h                     |  1 +
 include/linux/mailbox_controller.h                 | 17 +++--
 18 files changed, 124 insertions(+), 119 deletions(-)
 delete mode 100644 drivers/mailbox/mailbox.h

