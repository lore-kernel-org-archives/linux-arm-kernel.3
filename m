Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3C5E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MZ9i9TKqyFJYaP3tofrGXKiXPGdGikHg00tCN/Hbfmg=; b=EfdmdBLRiFfXOQA/71cjYvqu9S
	zfFj9U7uhoBBewoeBHrVQxPomVQzfIEepesMg9htKSkJymj1iqY49eWso0S4DaiIx0JFAS4gnjd7j
	elrdqbc/+2XxXfwavXpscGjw8dSLuK/Otr9BWH/BjkJYmxYoDIxw+iTayH3U7XnN3am/xE8tn3P3d
	8cAmkTDzN4qfUNTeCX/ALBqWZwP/8yLvq5eUqfUBoLAsP4y8dJugedE4mV+cvlrX/hKvMAZ9CKkri
	Se2BLPV67E0In6xPaHMq/h7OMKUfHItSg3mE9A2VJkJ0xo18ua9fzOgUg8TfQbuX8CLNN/QdYysM4
	W8cAQZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBPj-0000000G2HQ-0a9p;
	Thu, 05 Dec 2024 12:57:03 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBMj-0000000G1k3-1mOt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:53:59 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by andre.telenet-ops.be with cmsmtp
	id l0tq2D0093EEtj2010tqGy; Thu, 05 Dec 2024 13:53:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMb-000LOY-HC;
	Thu, 05 Dec 2024 13:53:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMc-00EQDG-6g;
	Thu, 05 Dec 2024 13:53:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: white-hawk-single: Add R-Car Sound support
Date: Thu,  5 Dec 2024 13:53:47 +0100
Message-Id: <cover.1733402907.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_045357_602338_841CE915 
X-CRM114-Status: GOOD (  16.59  )
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

	Hi all,

This patch series add R-Car Sound support for the various variants of
the White Hawk Single development board, using the ARD-AUDIO-DA7212
external audio board.

The second hunk in the second patch depends on "[PATCH 0/5] arm64:
renesas: Add R8A779G3 White Hawk Single support"[1]..
This was compile-tested only, due to lack of hardware.

To be queued in renesas-devel for v6.14.
Thanks for your comments!

[1] https://lore.kernel.org/all/cover.1733156661.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  arm64: dts: renesas: white-hawk-ard-audio: Drop SoC part
  arm64: dts: renesas: white-hawk-single: Add R-Car Sound support

 arch/arm64/boot/dts/renesas/Makefile                      | 8 ++++++--
 ...audio-da7212.dtso => white-hawk-ard-audio-da7212.dtso} | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-ard-audio-da7212.dtso => white-hawk-ard-audio-da7212.dtso} (96%)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

