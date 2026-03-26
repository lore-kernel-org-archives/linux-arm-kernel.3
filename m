Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293DB109E546
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjJ47iz69kffMqjrmrab+FRigiZP+JvFCki4MhCjrAw=; b=Q6+QAaemHA0LWfIvd3BWkzOWpR
	1cSmlybUoRsb/j45N1+9rYtktaq8pVbGlgDwENTXAmsy5lIU6ks13sFekSaHqkQjkYML9PFcDNy9C
	3oQ8umMdTxT4kI8h29Mg8oh8kIRy6kBcvsI1I82c0bN9jQvRjSGu3ckepGIMSWQl3eLRCceZ9zJbt
	+vbw4A64XFivNHjkVc1UZ37AtGAc+/aw07Ub/k7OeOcfMeafv0uvJ6a7u9CS9am10aa0IBAYqYYRq
	o9P9jH+7ftZbCmm1oYGCRTB9y3i2jvTI/0QCwnueIh+cXtundKhJ/g9ia2eacth3Ivwq8viJX9k2I
	l3noXFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGu-00000004fga-28Ze;
	Thu, 26 Mar 2026 04:24:40 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGn-00000004fdG-1wy2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:24:34 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fh9f60H5pz9v01;
	Thu, 26 Mar 2026 05:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjJ47iz69kffMqjrmrab+FRigiZP+JvFCki4MhCjrAw=;
	b=BrjI85Uca/IG5hHM/bNDRYDl7BITyI5UD2zAIVB1CD6FOowWah1bDPkkfnaHJgkIenvU0Y
	CDCMppcq/vPmHRxRF8V8pcCM03mA7S4YgGpT+DSdfjMyYkQ8JyOWLGk1H8qLMtH8jwRfo0
	1Df+w6Ybz+KNvv77TSgrinr3L/vxwp9ovmIQig4fpQiPt1fpcDZnoyE7EJoG8g0pNKKn9c
	0IL4Jp/OJkFvdzUDUMyxOl++8eistHyzM+MQw8syVkXVKijm7JZ4v16Mqmavj56x65h/xb
	3zKteFV5JwgCBWPAU/z2P5PdzO/VgRjqzB1MFSjMYdDDjlujba1De87R/hku0g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjJ47iz69kffMqjrmrab+FRigiZP+JvFCki4MhCjrAw=;
	b=AFRLrZtadueE6nkaAXnOCPfuKtPNXnYDuoYrUydn1G1D4F3lHp5sUBMDf30oa5obA4TpuG
	ERzyRzPwYmPk/DFk4QRC4+ZInFG9tQtkgFKvjuMCvU3Fn5UFXZ2YKTL7zu72QaZFIUt6hy
	4OJMopvqNNdQi5VK5DiHr82a8z9KNb82ydORFnlBH7WC0mLdb0WnfQu8X0kjzlRLMgkPCf
	xIZfa3crTftonRaxWKfjwWJ67f/DB2Vx45pwqYqqLavcOD+zH54ka3rmA6ezuzg1yBp0RU
	2Ih9T+txicJmuNWyOSKpTg02ArMxMCHLEaENdSgq/lxUZqgBDLpf4O9hFxo8nw==
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
Subject: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into DU subnode
Date: Thu, 26 Mar 2026 05:24:01 +0100
Message-ID: <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8195f495464a61884c3
X-MBO-RS-META: 4os6sgow5fx197emqeseecb1h9nh57cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_212433_656158_599A51FF 
X-CRM114-Status: GOOD (  10.47  )
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

Add missing cells and reg DT property into DU subnode to fix
the following warning:

"
arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
"

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
 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
index 36707576030d4..f5412578ee65f 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
@@ -26,7 +26,12 @@ &du {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
+			reg = <0>;
+
 			du_out_rgb: endpoint {
 				remote-endpoint = <&adv7513_in>;
 			};
-- 
2.53.0


