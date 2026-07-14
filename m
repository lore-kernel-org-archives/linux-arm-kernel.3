Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF70C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wdEQwuEUahv4QQFaS1sdtIP8s6BHiaKdfz0pUGmYp4=; b=ISqiFzEy0AkB2zNUOE+NF1pICM
	F4olDBdC32N7Sbxp+lBqtNGhsaYVbvdt12g+t5tKbDT7+VoUTxjcKH7ie2foCotYBvuTq/AlnkRsE
	lasXyaAXWf1qUd/Qh+iIYl9oN5HtISBnmzlx2QDI7HpELeJ9AWRSuoSyp6JDtmCyydhhslbATEf1r
	rhX0NAhY41GnrmsIzi52LyOjEGdsWcm1gaElkpG4T2DT0VgAFG1aCxkBq3wcN8ccBbF/I8CDNS4bo
	VNVZAxXkvTh4yhQOczkfibwaUIoexM1/Ufx7m05ofSX8niRuo49EmExmrCYeE2avjDs+kvzrrCJJN
	1LMuwfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcpK-0000000C5cR-2xM3;
	Tue, 14 Jul 2026 13:05:34 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcpG-0000000C5Xa-0pFU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:05:31 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h000S25LKzKv6w;
	Tue, 14 Jul 2026 15:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wdEQwuEUahv4QQFaS1sdtIP8s6BHiaKdfz0pUGmYp4=;
	b=lM1R9OcM7/j6sZj+sIPbEFx+Ax8Y/8SH0Sz7RSaGbqW+czsZadXp2mWdFuepJyrL2sx55d
	Z3QaeWOAA64AovSFC2Une3LSCMOsa7psybzATg9LTy6aGZQeAVd18UHBA01ke3qqFgaB9a
	W4Q6JBXO6Li4PSGoo284jP7h2PQZ55Ds+8c8RcFYn/dMDlUxVYvbkjfT98e0GXR1b6Ougs
	pqaLfKEnssw1kSCWW8DZ7ClSY5RAqalS/7IhY+hvG3ea/vT6zmwAvFJD5LZT3T16enJQdk
	s0ok6lgJ6vh682iK9iwtEhu5lrQObPO/wIs9RW/BMKDntavWnAXiqbc7asjiaA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=L6OMjVBs;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wdEQwuEUahv4QQFaS1sdtIP8s6BHiaKdfz0pUGmYp4=;
	b=L6OMjVBsyzwsVKDL2kL03YQRGeY4X7CdWYkpO1yzg3MILKfKhU+E8cKstk9Bw1xgLLFLV+
	D5nsvWdQja9V8HPX4qSosrXMnVFZVqL9uLpf/NzMgqtfxXlpLmpo17dE8bQXQhAIesmTi+
	2oV5lT329lEWJGvI/6/T6Nb2wxhTcFhBidR8OSZqxydUadahLqoSEMv2M717u79PJJKDlt
	/J85eO5LfI4xq0f+vP+SfO5bdAG1sn1tKd0NgYGK15rr2baoMJMbuhcouiVG/7vP4IxWH4
	bQ4m1F2aorXModGt9R1KxDcOI3yfGK+3Zgts7afMnYnyme6iDR2lyA9iFgQEhA==
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
Subject: [PATCH 2/2] arm64: dts: renesas: hihope-rzg2-ex: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:58 +0200
Message-ID: <20260714130515.11262-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
References: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d20c130be33f70fa70f
X-MBO-RS-META: twbnhowye6ybzzzuns4d9twi9fokanr8
X-Rspamd-Queue-Id: 4h000S25LKzKv6w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060530_394484_ED07AE77 
X-CRM114-Status: UNSURE (   9.45  )
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

The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
(Hardware Reset) states that the PHYRSTB pin must be asserted low
for at least 10ms (Tgap in Figure 10) and the system must wait at
minimum 30ms (for internal circuits settle time) before accessing
the PHY registers. Use 15ms and 35ms respectively to provide some
additional margin.

[1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf

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
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 83b6c04274ac9..58b787db0f24f 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -25,12 +25,14 @@ &avb {
 
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <15000>;
+		reset-deassert-us = <35000>;
 	};
 };
 
 &can0 {
 	pinctrl-0 = <&can0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0


