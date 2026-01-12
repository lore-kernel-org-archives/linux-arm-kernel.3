Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8E7CF45D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 23:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vAsObKeLs+Vgon6vSaaSKnPA55myfQZCA6nJALjAJ6U=; b=fF1SX2XoDDKUCD6xEBWZotazuP
	mPkwgJ+vTPg5fQWhoE4yKhYLXIHG58EapGVagD+Qoe94PcFI69ZMZNd57wJIeKmJj8otAj+zmzKwU
	VYg8ctNSrO2YA0FVz9fz86x94zBMTcUv9feqqLb8FZwZqCHjqNtUYaM3Ec3egJadNM4x3iq747iHL
	LwtWrb0dFGtDo1JqiP0Im3iJsI9slxkx9CpKKaV9KjR0sWX+hK3uOMOedy4xVPOItSPYONflO0Mop
	Q3Yhz2GZfeb7VeJUjPT20xXqYuCValcsa2BSybhOzYYykkftZoO8Mwupyt5Hj6ZQAVbsw5kvxyoWD
	IuCNkRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRce-00000006JxW-02K6;
	Mon, 12 Jan 2026 23:46:56 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRcb-00000006Jwp-1PK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 23:46:54 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dqptw5FTFz9spP;
	Tue, 13 Jan 2026 00:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vAsObKeLs+Vgon6vSaaSKnPA55myfQZCA6nJALjAJ6U=;
	b=Y9kG7IlFHMtOQOnJkaIiCufSmZh96+kX5MzMqrZ4rEBZ5Zc6de1Ox9seoNlR216qjjTdIS
	IWIlqKDFTT6p+TOgUXEJEBa9rJj8yIgvnPXsG9XKes78HsevRlpW8RSzbq3oHlKR9QVn1p
	b97CmEpu2fCj/L2UUpOiTkdbH/720QQvoVM6igemfk27ADkAa/kBp9kXncgPiPItuqnrTK
	sSOGII7LQCyaTOWsJeA0rtLaKUkTjUCLg49Vix/BPQX9/W/UQIxbFagXO3N+aJPji1cRFs
	0vBeF/UDfydxepAHZt9lTT/WLqy9oN+IT9CPn6TJphSUrQfDLJ8TEgM+zmZioQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vAsObKeLs+Vgon6vSaaSKnPA55myfQZCA6nJALjAJ6U=;
	b=ANXM7HMqOV4HZBdZXTj3VXdIf46NFUysaVhYmSSMSLrrnNFfYiR8y+ohRKCavbg1SFpFW7
	tcsWWmvi91AfRw/o6s5BWvQmne667GO3EQesaf/N2Ir7I7/tojS9rUaDNBeVpECDZYQ0fl
	JXOHF3PVjMQ6jH9hEDIh0WaE0Pagl5Z6DBeOhu+tBtO1XUZzT0mwqj0lMfC1fOGzMXbjL9
	dUUP7BWCDA+gHHQbzTwQviMn9mCycpwBOpwSYTlceKUoD6rwjF/8vkvlaIM2Jl1oEBwyOK
	Bea1VeyV9PSZfaSDzKvA1C/6y9PmVD9fOFnyER5jC832h6w1u49HmVe+CRnLsA==
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
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Mark OTP and HSCIF0 pins as bootph-all
Date: Tue, 13 Jan 2026 00:45:56 +0100
Message-ID: <20260112234642.225993-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2e354213ba05c962de0
X-MBO-RS-META: ypdydd3izjbcjbnttkndu1kt6mscbknk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_154653_540917_5287E36A 
X-CRM114-Status: GOOD (  10.34  )
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

The U-Boot SPL is responsible for initializing the hardware and it does
also initialize HSCIF0 and its pinmux, mark the HSCIF0 pinmux as needed
in all bootloader stages. The SPL also uses OTP to determine the exact
V4H SoC variant during DRAM initialization, to determine which is the
maximum allowed DRAM rate, mark OTP as required in all bootloader stages
as well.

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
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 9052d9c954738..bcf8270a3ed9a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -541,6 +541,10 @@ msiof1_snd_endpoint: endpoint {
 	};
 };
 
+&otp {
+	bootph-all;
+};
+
 /* Page 26 / 2230 Key M M.2 */
 &pcie0_clkref {
 	status = "disabled";
@@ -625,6 +629,7 @@ canfd4_pins: canfd4 {
 	hscif0_pins: hscif0 {
 		groups = "hscif0_data", "hscif0_ctrl";
 		function = "hscif0";
+		bootph-all;
 	};
 
 	/* Page 23 / DEBUG */
-- 
2.51.0


