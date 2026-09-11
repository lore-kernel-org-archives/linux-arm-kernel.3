Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD9EC88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 03:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S9ZL8gXFgJqiskXHicHGLASvBh5QA9FwPPVdwmC2QNQ=; b=sJ1QLuzPFManh/
	F3EhNS6FZefJbHlzgOE7dg0l+v0CCnbcriEq55/4/6okhfIfNF4RUmxE2vOncbZwbunXk/cvO8rkk
	9bfrVOeqYctG1Zr9uwpdXVX/Gjt51hMaCI2nR4sVT130xhmiy5zINjsuvhmQ2EhTKWe4tSrSYOnJa
	QdSwcGBzl+hCOO3gFigYyDxKX3RdJ7fNJwpfMw/JwdH94QLb8Nlk79yWBwGmcFRRkntYuepwK4GhA
	AAWIF018ZsOMOMrEkuONtN8g2O8NGId3v9gyonMcVrUPu2CwDftMXJySTeBt5qBpZSkYX9QIVoeTC
	F1nYRKHcKQSLteRS5ASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rvm-0000000FkyE-0QKD;
	Fri, 11 Sep 2026 03:28:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rvk-0000000Fkxr-1iX6;
	Fri, 11 Sep 2026 03:28:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2023F601F0;
	Fri, 11 Sep 2026 03:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582441F000FF;
	Fri, 11 Sep 2026 03:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097277;
	bh=S9ZL8gXFgJqiskXHicHGLASvBh5QA9FwPPVdwmC2QNQ=;
	h=From:Subject:Date:To:Cc;
	b=UOqrtC/iqJPmJBaQBRFzBwLv2zdHHTCN7JJM3aqF+clJQVNp3rZ9AOx0EjRjunjaw
	 7NpcJfvsx1ZuvJTacqO3mt8h1UTIU2IU1WEVoOKJP5dxq66MNvPGaEcGzccI+tZlOm
	 JmrpV1AJdiX4EGgBSn2j3jVTccf2vV+HftfOMfRG5peNme1hBwbI7lNxNU76u30LsJ
	 ZGo+UDKY8vJ5YqmMB9+jobYQrY4pcjFSNclAHQFBZp1YT9yvT7xr1u1wwA52Uti1uN
	 OF182eHi4oahdRD05RdaTRjERPf9/moY2EqONnE583aypihiZK/Y28EjjebH+NIxY1
	 Gld69vS5DWuog==
From: Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it consistently
Date: Fri, 11 Sep 2026 03:27:08 +0000
Message-Id: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAx1o2oC/z2M0QqCMBRAf0Xuc5NtjC176j8iwvROb+UmdxqC+
 O/Ngh4PnHNWSMiECU7FCoxvShRDBn0ooOnr0KGgNjNoqa2slBI00m2oF+G9U4h1661vIdsjo6f
 le7pcf5zm+wObac93w3McxNRzjv7Ho7LSSWmqUsvKGaOFEt0cGcP5iRzwVUbuYNs+2oEHo6gAA
 AA=
X-Change-ID: 20260911-ipi_max-ff71eeadf6fd
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16.0
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

This series removes the implicit assumption that RISC-V supports exactly
eight IPI message types.

Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
separate IMSIC_NR_IPI definition set to 8. These values happen to match
IPI_MAX today, but neither is the proper source of truth for the number
of RISC-V IPI message types.

Move enum ipi_message_type to asm/smp.h so IPI providers can use IPI_MAX
directly, then replace the BITS_PER_BYTE and IMSIC_NR_IPI uses with
IPI_MAX.

This also makes adding future RISC-V IPI message types independent of
the current eight-entry assumption.

A follow-up patch renames the MediaTek VPU mailbox terminator from
IPI_MAX to IPI_VPU_MAX. That token belongs to the VPU firmware IPI id
enum and should follow the same prefixed convention as IPI_VPU_INIT
(and SCP_IPI_MAX on the SCP side), instead of reusing the generic
IPI_MAX name.

---
GUO Ren (XuanTie) (4):
      clocksource: clint: Use IPI_MAX for IPI muxing
      irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
      irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
      media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX

tip-bot2 for GUO Ren (XuanTie) (2):
      riscv: smp: Move enum ipi_message_type to asm/smp.h
      riscv: sbi: Use IPI_MAX for SBI IPI muxing

 arch/riscv/include/asm/smp.h                  | 12 ++++++++++++
 arch/riscv/kernel/sbi-ipi.c                   |  4 ++--
 arch/riscv/kernel/smp.c                       | 12 ------------
 drivers/clocksource/timer-clint.c             |  4 ++--
 drivers/irqchip/irq-aclint-sswi.c             |  4 ++--
 drivers/irqchip/irq-riscv-imsic-early.c       |  4 ++--
 drivers/irqchip/irq-riscv-imsic-state.h       |  1 -
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 12 ++++++------
 drivers/media/platform/mediatek/vpu/mtk_vpu.h |  4 ++--
 9 files changed, 28 insertions(+), 29 deletions(-)
---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260911-ipi_max-ff71eeadf6fd

Best regards,
--  
GUO Ren (XuanTie) <guoren@kernel.org>


