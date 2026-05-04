Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2AFCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONlp9b1BBI6f716sKEiSIPM1GeGje3EDpZgOtfKwV74=; b=yFyW1qxIE+4QaKjxOPLoa5JSLI
	LTFZ9qpzO2dqv9wp+GuGPvPmv4EdS4Sf8ttEF8BFnG3zcfSIp1wWgmi/TTgLXDnbseMb3YUpbj1JS
	x4kcqbBYHp9izeivIkzq6CdLAUC6+6HfIZ5hahKzJM2x87PP1lTI0701ySEFiXTCS3nEujxAcbcAE
	3GsxHBJZ9DrhzXTzrl3ZjWsZEjKdzowZgsudbnQXFcFw+1HPxsj8JcWZWXBRBM9raQShBGtUuJGTt
	npe6D+HrnwdLO2ucCvYbIHn8vucderoSlJsZ5vtCC/GyVOzj5qkVlUv59xTh1/97/ZVXxIIxZgIv4
	Yb8rup1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2EA-0000000EXdu-1tSK;
	Mon, 04 May 2026 22:57:26 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2E7-0000000EXbO-3qrj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:57:25 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8cVB2MKMz9tyw;
	Tue,  5 May 2026 00:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONlp9b1BBI6f716sKEiSIPM1GeGje3EDpZgOtfKwV74=;
	b=AyZ1zB5+bX3joWBG7eQ0CfJDuh5DTnpo/KmahNOGX3BW7+7JVHfE6pHkSvTgfLoBc4iiCx
	UJyqSx1VCD8HB8S4RupBZsQnexBAqiNn2IoFeodDuzsOZtkBBPJpILnMCJA6Qv6wNFMatt
	0po6wc4mPIzvg6Ul7E6/7WHFdZKCylXZlq8LxUdi/8lD2hh6ZLeuIsbhH3iltCcMWv2wP3
	unzps6KQJGBeGhcM3vr1HUB+vZT6JG6cMOU2haEupaTVi4uOxFfRPWxCVhvpOFr+l9doeo
	c+NWEqDjMJs27FC963Vtp10fTh/2FAC+r05vOYXCxB+U5t14a37sWUAp7aMzTw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONlp9b1BBI6f716sKEiSIPM1GeGje3EDpZgOtfKwV74=;
	b=adU2rUiKQpz57mNrgpnoTZG1uhVfxt5StL+ItgOySe/PhZWL0OAVibglQ475NF89DMg13J
	wxC4HR63xgQ9J5lV4Y9wQPH2NiddSrrtANjA4y8QNaSE3wjHncwUQt5gNB4Q32cL1Bu4sR
	UeObThw7SZ8fudDtijYsGfCWm+ImXcSmFROQ6HtnlxBQihsdnf7W6FPmiAan7WgF+G+B9U
	4NWW/g0+qZgZO+W8hS9Fyoco+RG8BcfknA5NHwpXIFU4dmV7gJE+XJ7MIrZP2SivmAp2IT
	MFXWKG5gDtYSskDanETBeYUjrR/o1pGt/KCxgRPealQle2fWCK3eL3uxXUyA9A==
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
Subject: [PATCH 5/5] arm64: dts: renesas: ulcb: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:55 +0200
Message-ID: <20260504225704.115125-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: yndyu5wue89wcaj8nqais4ojgwgkk74s
X-MBO-RS-ID: 5077995fc196c0f2ef0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155724_125184_76E4011E 
X-CRM114-Status: GOOD (  11.00  )
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

Use standard clock-controller node name for the CS2000-CP.
No functional change.

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
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 67fd6a65db897..ae36a2e66948e 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -221,7 +221,7 @@ ak4613: codec@10 {
 		asahi-kasei,out6-single-end;
 	};
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0


