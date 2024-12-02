Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E29D78337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yBrDNTZ9ZtdIP0z59HJMnmRQmmBHlcrfrEwr5IfKxTQ=; b=MGnKLIkQNEIrAbej0nYY4ege+Q
	ikl9sUzYaXv/HCnCpxvptFq5ymQr7THKianHR1uual19GSNia88gJbgEO6UHkP2f6Hy2UFMFrvZ6t
	jGPRE26Wi2VXGHMonIsOIO7NhfyuOCI36nS8AMk7a4GdiOq189ZJwOM+hipcE33UYX1m2BvGthtDI
	KuWexaQPXygEJdY978xW3WrE4xJtHz0YAUWu/Iq6aGReSuuNEcIaPclnOnMbXsuzocactIaemPcAy
	SviXo/G+3Fj3BL7DLPo0lLb5cT7zH0qWsmjtu4pi3sThF2YJCvn47QXi0pDsPaNJ9eqRJ8v9qAQLe
	EQNC0azA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9V2-00000006tUW-1JpG;
	Mon, 02 Dec 2024 16:42:16 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9JV-00000006r1J-1yOX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:30:23 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by baptiste.telenet-ops.be with cmsmtp
	id jsWE2D00N1yjZj401sWEo4; Mon, 02 Dec 2024 17:30:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007u9-LW;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007PnL-I4;
	Mon, 02 Dec 2024 17:30:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] arm64: renesas: Add R8A779G3 White Hawk Single support
Date: Mon,  2 Dec 2024 17:30:06 +0100
Message-Id: <cover.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_083021_647592_8AE72FAC 
X-CRM114-Status: GOOD (  20.31  )
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

This patch series adds support for the Renesas R-Car V4H ES3.0 (R8A779G3)
SoC on the Renesas White Hawk Single board.  R-Car V4H ES3.0 (R8A779G3)
is an updated version of R-Car V4H (R8A779G0).

I intend to queue these in renesas-devel for v6.14.
Thanks for your comments!

Geert Uytterhoeven (5):
  dt-bindings: soc: renesas: Move R8A779G0 White Hawk up
  dt-bindings: soc: renesas: Document R8A779G3 White Hawk Single
  arm64: dts: renesas: Factor out White Hawk Single board support
  arm64: dts: renesas: Add R8A779G3 SoC support
  arm64: dts: renesas: r8a779g3: Add White Hawk Single support

 .../bindings/soc/renesas/renesas.yaml         | 16 ++---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../renesas/r8a779g2-white-hawk-single.dts    | 62 +------------------
 .../renesas/r8a779g3-white-hawk-single.dts    | 16 +++++
 arch/arm64/boot/dts/renesas/r8a779g3.dtsi     | 12 ++++
 ...hawk-single.dts => white-hawk-single.dtsi} | 11 ++--
 6 files changed, 44 insertions(+), 75 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3.dtsi
 copy arch/arm64/boot/dts/renesas/{r8a779g2-white-hawk-single.dts => white-hawk-single.dtsi} (78%)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

