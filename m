Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CC9D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6G9w+Ryvc/yoCttIxIe5r+mytw1E04gHN1Ic4fmMSno=; b=txYmtRN9GGbTlVeWA/m5o+Lbl/
	CYJ5FTfGFAK4WPc7LxnE3cv1ksUw1bQmYig+PjD4CNHmtkyZHjTLLXzkVBO8ll42jDWLQB0O8DXE9
	X39ke/ZTJuBjxH6kEepTPlMH4iyEd11i0BjcNDM+307Sj6CPA+yXinTxP3jpsIxKE0VmHcnyrYeeG
	Pfv6suDT99ke7BSJKAAUXm1Uljgh1oEAdKGyNyGLC0ZX6MCK0c5gdWrh5FWTkaGSilkVvZlFKPm9S
	aNCO5T5BLYWIHoyv282ILAwfuJelc6NPnjv1bgmFBj9wQIK70TCihlaCWPYvdZCi3kggZV2Z5Heih
	1bHlqqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP0sB-00000000biu-36oc;
	Fri, 28 Nov 2025 15:59:03 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP0s8-00000000biX-2FiQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 15:59:01 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6571763793bso783918eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 07:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764345538; x=1764950338; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6G9w+Ryvc/yoCttIxIe5r+mytw1E04gHN1Ic4fmMSno=;
        b=KtD+p/AyWKnf7/lIBHHibMDL9uNU1gvcmE4K3bUOtjv3F0CNjJEkSHbkkD6/XNj/ro
         +Yhkr5mRsFg/5nHfedkhvomhYuKcF/PqvllAF//q+Af7N6mrWoC3W/Tcv+GbAY4Li7SD
         fC9GyZd03MHiDE3DwALymHtrhk6iIE9Ih/0E0wrOJJYiY1e1sD7bOKhsUZ1Rxzsn6VCU
         9be0Ye/y916vMq55y2LelrM0hMBrEi+9lhFT0YnDRshOTo2XqT2ZxW05LzMG8LvjmjpL
         Bzwaw4hYgBa67yX8cgHwA+omNecCP2MMXseB5Nbx4XMIbIe+MEUNaHN9xVqaN08NpiJw
         /jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345538; x=1764950338;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6G9w+Ryvc/yoCttIxIe5r+mytw1E04gHN1Ic4fmMSno=;
        b=I1/RARYjrewmxk9+u6vUYas90J/5OiG6qqB9AVnwXgvjfs4umrzN3B/XA/BkZtectc
         Cso0CV89QYJihn11D1kobjZLJNUNOBqgqTG8ILv++h1vp6Ebwlr1CK2pM9xF0/m/McTo
         UVWbWBteKAuxPd33WHM6rW0+h30BV79FSD3iSrSdcxm4c0zVcG8FxSgCINype48ZXgWu
         1IDS975qJnalgTf+zEmiOL/ZEnLMZ4XlBDtte/oT1N/6ow7oWPBZfNMY8kgv279GNMIu
         7eSP8k6CmB9dFn8VLiqsynhHARJICIKDPwUBY27t6yOexaAyI7FH0TsR507bC5CpmTcb
         kDqA==
X-Gm-Message-State: AOJu0YxMklt/+fI8MBOu6FzZM+YhI9qCeN+UFhSjJgnCJGhkr5UepDqb
	fNsZ3DO5ZE9AIO8d6Y+uJk0VYbAvAyWkekndGAcxVU+YN/h/ye/adNEVm0JX/eXTz2q/rAWp9IO
	n/Buw4TyjKzg+19Ih3PM9V0851B70gPE=
X-Gm-Gg: ASbGncskpCfBxmi+abH/NSTeyxjdx01RO1JHd7ex5L+9UH5L6KpXpV4v3nIy3SGfBxE
	ZWJD+3UKAO/2GjcuUnkCBcdhfo/GJ9nataw5kbtw/yFfyme1kNWTDV6bhqn/WY7Gq4dBGA29zA+
	mI9snimOEmlew6hZFJZqWWb/LcbJJG+xdUtgGS5qtAglGX0sixMTYWFaP34nWsQsUEcrJSwkGK/
	lNODhrKmXCuiZ3U2YSc6+IDGZn3Qf9xbMn266soeLEXDvqvzI09K8WSMuxpb4tnAU5sm1YUafha
	rvhOG5c=
X-Google-Smtp-Source: AGHT+IF7owKgq270ff4mC4S6WCU8yNz48xTNjq0uNXU8/otwyakODkPqjCAFSAcdbeG9IuY1gLPbBeqeDW0VlSlRhjo=
X-Received: by 2002:a05:6808:1a26:b0:44d:b9d8:9b69 with SMTP id
 5614622812f47-4514e5fa4b1mr7382148b6e.2.1764345538443; Fri, 28 Nov 2025
 07:58:58 -0800 (PST)
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 28 Nov 2025 09:58:47 -0600
X-Gm-Features: AWmQ_blPBFlF1EVUL0FaO14UkS9F8JpNFxM7S3_8lXPhAB1_2zzHeeWbN8YSRPU
Message-ID: <CABb+yY2GeWHWeASzemit8XvgvHg=Cse+46CqF3KJfsBXNPEBAw@mail.gmail.com>
Subject: [GIT PULL] Mailbox fixes for v6.18-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, johan@kernel.org, 
	jamie.iles@oss.qualcomm.com, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"jason-jh.lin" <jason-jh.lin@mediatek.com>, vulab@iscas.ac.cn, 
	Beleswar Prasad Padhi <b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_075900_580224_083AFE71 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d:

  Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-fixes-v6.18-rc7

for you to fetch changes up to e3cee98f2fcc2234be7813c0e55a7f7a5e77aaf2:

  mailbox: th1520: fix clock imbalance on probe failure (2025-11-28
09:47:44 -0600)

----------------------------------------------------------------
omap: check for pending msgs only when mbox is exclusive
mailbox-test: debugfs_create_dir error checking
mtk: cmdq: fix DMA address handling
     gpueb: Add missing 'static' to mailbox ops struct
pcc: don't zero error register
th1520: fix clock imbalance on probe failure

----------------------------------------------------------------
Beleswar Padhi (1):
      mailbox: omap-mailbox: Check for pending msgs only when mbox is exclusive

Haotian Zhang (1):
      mailbox: mailbox-test: Fix debugfs_create_dir error checking

Jamie Iles (1):
      mailbox: pcc: don't zero error register

Jason-JH Lin (1):
      mailbox: mtk-cmdq: Refine DMA address handling for the command buffer

Johan Hovold (1):
      mailbox: th1520: fix clock imbalance on probe failure

Nicolas Frattaroli (1):
      mailbox: mtk-gpueb: Add missing 'static' to mailbox ops struct

 drivers/mailbox/mailbox-test.c           |  2 +-
 drivers/mailbox/mailbox-th1520.c         |  4 +--
 drivers/mailbox/mtk-cmdq-mailbox.c       | 45 ++++++++++++++++++++++----------
 drivers/mailbox/mtk-gpueb-mailbox.c      |  2 +-
 drivers/mailbox/omap-mailbox.c           | 35 ++++++++++++++-----------
 drivers/mailbox/pcc.c                    |  8 +++---
 include/linux/mailbox/mtk-cmdq-mailbox.h | 10 +++++++
 7 files changed, 68 insertions(+), 38 deletions(-)

