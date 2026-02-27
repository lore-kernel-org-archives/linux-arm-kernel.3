Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD42FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 18:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IJQBuqJIDFLF068ZEeM//Jn8YuHmvtnbJIbkjKaD0TI=; b=XP1JVSeMFnSbnELwDPlIr7ZOSE
	5r9GCnXa5J9CvJSOS53i5Wv/LRRU5SuGyy3liwhYn59CrBQDmzqVqnQXSN7Se1csSm/ioXYE5044a
	dxiu+XwA9bVS1XlsyIJ3Nq+MVYDdwKnrhAXoQ4MmF4Gm/UylTvW8dal8a7WFjiMTFRwoizMkq0v05
	Q6bZCotvH+J5rYpvuLwtrDFlFj5yfBvRGiD3WQNuLRSxImEp11Pvzc8/XpXZJIV4nekX38eqEcEIS
	kFywx4uIzc4kexmZkuWCGeSsU+8rrecPDxvmNYAU8XHBj99kC86aY+W1gc+6TQq970PN3ih75Qy8+
	dnQagBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw2NW-00000008uCD-45T5;
	Fri, 27 Feb 2026 18:15:54 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw2NU-00000008uBS-1usU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 18:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1772216145; x=1772475345;
	bh=IJQBuqJIDFLF068ZEeM//Jn8YuHmvtnbJIbkjKaD0TI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oyctG9i/fhP0IwGW7lBNWi5EXeTgSsLoEIr65yB+dy/aKzk8cnRE+EXjuPfqqXTPp
	 5CBgaGu0fDtLYbI3Zs9///0JJs74omxS8LObpVqa9yOiRHX1vTzTKA/a9w62wVk42b
	 DsacfO6cl6wawLL0s0YTsSov1DMPX8VUE2Xc3wPx6DW22aB+OP2W2xRy0JUaUZrgP9
	 Hb/wdZsoprdiFHb8tBTVZLC2R/7bgoGpuHeYho2tTEZ6g35EFMWcyKZpJzSKsZ1MyE
	 o5kfJUeoD1JFDQzV/19BXVO1bGStZTMys3ihiiKatmilRdidXg0VS8ebxPx8F7wp6i
	 eIM9llNPE9dPQ==
Date: Fri, 27 Feb 2026 18:15:40 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v5 0/2] clk: clocking-wizard: add user clock monitor support
Message-ID: <20260227181507.19890-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 0612b8fa22ff3219816b113f35263756f3547ea4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_101552_671457_37B758AD 
X-CRM114-Status: GOOD (  12.35  )
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

Add support for the clock monitor functionality added in version 6.0 of the
Xilinx clocking wizard IP core, through use of devcoredump.

This is a follow up from a patchset I submitted quite a while ago [1],
where I was attempting to utilise the UIO subsystem instead. Stephen Boyd
suggested use of devcoredump instead [2] and I have finally got round to
giving this a go.

This is currently untested on hardware, so any help testing this would be
much appreciated!

v4 -> v5:
- Add Krzysztof's R-b tag to patch 1
- Fix patch 2 by moving dev_coredumpv() after iowrite32()
v3 -> v4:
- Patches 1-4,8-9 dropped, as they were submitted/accepted separately [3]
- Patch 7 removed, as no longer creating a new UIO driver
- DT binding patch mostly unchanged. Slight rework (removed allOf) and
  rebase, so removed Krzysztof's R-b tag just in case
- Clock monitor support patch now reworked to make use of devcoredump
- Rebased on top of clk-next
v2 -> v3:
- Move kernel doc variable comment to bottom in clk_hw transition patch (2)
- Remove extra line (and add Krzysztof's R-b tag) in binding patch (5)
- Add Krzysztof's A-b tag to dynamic reconfig binding patch (8)
v1 -> v2:
- Split and improve clk_hw+devres transition patch (2+3)
- Fix/improve DT binding patches (5+8)
- Utilise auxiliary bus in monitor support patch (6)
- Add dedicated UIO driver for monitor support (7)

[1]: https://lore.kernel.org/linux-clk/20240826123602.1872-1-hpausten@proto=
nmail.com/
[2]: https://lore.kernel.org/linux-clk/1bd17a02bab46391872e4934895b83e8.sbo=
yd@kernel.org/
[3]: https://lore.kernel.org/linux-clk/20240913191037.2690-1-hpausten@proto=
nmail.com/

Harry Austen (2):
  dt-bindings: clock: xilinx: add description of user monitor interrupt
  clk: clocking-wizard: add user clock monitor support

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++-
 drivers/clk/xilinx/Kconfig                    |  1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 69 +++++++++++++++++--
 3 files changed, 89 insertions(+), 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f

--=20
2.53.0



