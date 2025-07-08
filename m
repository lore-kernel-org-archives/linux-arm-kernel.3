Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95735C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxRK07a4qzIkQDxq5Q17ibY4wC7AQZd7p4t/xCAI5n0=; b=reAq6PDRRFDfyDD9mXGBWq0hGb
	NKTvNFKGGgKBpzlLO6iCw5+/rZQmhxbElBpFaMtHxwbNt6lS9oU0BJsVYJMjapRlkE0nthi93R6n5
	Rv0E0Wsm7HFYcNmNi3V8GN4ak7HFsXBeK5TZd61E1ai5DvoDuOTlRAKPd7ohxaZfHChY05eoLfBUC
	atgmRImiK7usyXSbRaqyNVomhBHyt1ufAu3ZGiHLBkH9wi5VJHVcqxLj5A9E54IdFSMzaK6hhezxG
	tH3OfPrQUk/xFKf5IsYXx7ePX+UnETsKGVb/8vrBbFcwocC/KRlDin8c4sh1Jd6JDQyZ/Q+uc6ndO
	CMEiN4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCco-00000006BjR-2ppB;
	Tue, 08 Jul 2025 18:01:02 +0000
Received: from [37.205.8.231] (helo=mx.olsak.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC5o-0000000677s-1ev3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:26:58 +0000
DKIM-Signature: a=rsa-sha256; bh=wxRK07a4qzIkQDxq5Q17ibY4wC7AQZd7p4t/xCAI5n0=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1751994602; v=1; x=1752426602;
 b=cNx/Mx4f5mw+wfvKuvG/l3a9Doy21xFyyRQ3+YysZAHTImk5FlPbt7lOl/i0e6umnsjodcdT
 Md/JGcZ5afMn+if2T9yLDj/svKLpLFB6Z2MEyPZznw6bI83ZZrl8fo7UVGw8APNdguKNXu0z2vI
 mKYHO1DqWbNheuazV7vt/HDKSThx7l9yFrchAu+WPDpD1Ak+hJXIEmZE32sR4WkEJZecoeDHb1H
 bL73uED0WiLbjn8/H22+uMwVOGTmwBhihHgoJWex8++HuXPHJ/yVx2LcDPtUIkacGiXtZw84saj
 437e5PZWMzh+APxYPdTe+Nfwv8y+sC83sGT1V/1nSAmgw==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 04664ba4; Tue, 08 Jul 2025 19:10:02 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Tue, 08 Jul 2025 19:09:48 +0200
Subject: [PATCH v16 3/5] arm64: Kconfig.platforms: Add config for Marvell
 PXA1908 platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250708-pxa1908-lkml-v16-3-b4392c484180@dujemihanovic.xyz>
References: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
In-Reply-To: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 soc@lists.linux.dev, linux-mmc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=9NGI2J7Fw6nRPJV9SJV2GZ5jc3YN5DXq0M2eQqaNt6s=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBm5AY/led5OuMB0cPU8uTjZqbYbLWatTj9m+L7k6InQ6
 qsfL0wp7ShlYRDjYpAVU2TJ/e94jfezyNbt2csMYOawMoEMYeDiFICJMBxlZDhY79j4KyzC8soi
 AfFnvuv3VCc2leT9ZO0zEmdljrhy5iDDL2YnW+vKOfLWEd/OlFkbLBVl/b+g6c9qxdmdPE+9WDa
 9ZAQA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_102656_581119_5D52C4DF 
X-CRM114-Status: UNSURE (   9.33  )
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

Add ARCH_MMP configuration option for Marvell PXA1908 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4e1bee095ab3f44e3a52294905616..74a8e1c113dfc04c28cf06cc58cb45911d69f757 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -178,6 +178,14 @@ config ARCH_MESON
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
+config ARCH_MMP
+	bool "Marvell MMP SoC Family"
+	select PINCTRL
+	select PINCTRL_SINGLE
+	help
+	  This enables support for Marvell MMP SoC family, currently
+	  supporting PXA1908 aka IAP140.
+
 config ARCH_MVEBU
 	bool "Marvell EBU SoC Family"
 	select ARMADA_AP806_SYSCON

-- 
2.50.0


