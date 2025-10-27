Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175D9CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P9OYt/TVtRqFlVbtQUwUoKw4zIYro3RdYxyw20BMr/A=; b=5EUxecOv1kiH+1pVauslMBvRr1
	K5p3TAWaxLPJbuQiZwVrm50ho3xTaMPGIySgnjclUpZrKPEG4EEayACCPMZYTl4RuOW0dLa/9Lfhu
	Lgc0CDgIS07807ceEmLPlYQJ2NNcHCnJFUyCuVXslBpCbxTNDFz9XBaEgCZzA+GH9mEpa8Meut/Mg
	1zHjWz3lWdRCDMsBOD1NOP+aUx0j7rsiszN3PM6bqjekU6A0b6scVIU49mjs5bVd72xoC6vQ1wVWi
	rMoPyoRY330LiKu5rGvPvmfg1zKL00HW99P25RFpbSmTLiIQ6hFFWWj19xYytREiQ/Yxp0yP6dMft
	cpiFfG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWf-0000000EmGI-06dS;
	Mon, 27 Oct 2025 21:13:13 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWb-0000000EmDy-0JDD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 21:13:11 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwR721FWcz9t39;
	Mon, 27 Oct 2025 22:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P9OYt/TVtRqFlVbtQUwUoKw4zIYro3RdYxyw20BMr/A=;
	b=ECos1Apu5Egkw9B6hybGFMS2K73AwLbCk1La+iEOSBIr30wb954icsuHAVwNIQnUG/QWZG
	+hUr7zGF5mXJkSuuE+pDAz+ADSxSYMLjOdc4jU/a3jKexShIOUX/PHZYFJxONokwClkka7
	r1JT/XwjrAgZlR7N0XWIAkg9Y6sK31rSCqgs44NNm9zbNZ45PaD1fs9D8P9PaeOFDGkY4l
	ZGMWO/W/6y3+/zzuzzJBdscFyCGn4xLn2OE1t/hmoC7htYZ7wRPe87R1PKDPwFqGm61BN+
	+3w8ed8AVqZWG9Kf3/3gEBredClj5nRwvxG3jdUjVdtkoAXSROkIiX4SKcDO8g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CTJmc6Yh;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P9OYt/TVtRqFlVbtQUwUoKw4zIYro3RdYxyw20BMr/A=;
	b=CTJmc6Yh+S0Gg5bcv/Nn0L3KzDM6vko5mIe+/OwS7prAQCpm30rodgFSb221KgJNdjXx+Y
	XyqNp6AGq3p+Wg3xLO3idZJtZJ70KLZLyCX1poY1f+gdkydUPzDlNeqnXVQpWS0+e34Kwj
	XJRAydl/2HiQyYZsoK3UOX3nzZtdXDIXVRQ+aRuK3Q3wrHLP8LZKzGZtNHbExJProIxgfm
	vPEm8tYHJagCw4Bf3xcNeTAZi69sWxYgqvV7W+SQPC71LjwJw7H59U5yRDYL/ZYH/mY2Qo
	kDBYHizj6iE7gAJYhfvL0+K9MpcOlhcwoFyeXcy+Qi7eg9s4+pkigmDbOo3qeg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:17 +0100
Message-ID: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: aqa83zx3pbeywqrbia83sjswxm745px3
X-MBO-RS-ID: 92c7b2c63661db9e584
X-Rspamd-Queue-Id: 4cwR721FWcz9t39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_141309_253457_8C44A572 
X-CRM114-Status: UNSURE (   9.20  )
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

Enable GPU on M3ULCB with R-Car M3-W.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
index 4bfeb1df0488d..c3282593346bc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts
@@ -36,3 +36,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.51.0


