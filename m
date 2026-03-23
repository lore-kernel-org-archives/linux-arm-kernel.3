Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADD5EC01A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=; b=matJ8PZeRtNZ7wOjrerICSz3lK
	x3RSDwfySALl/tgkzEeCSaacBLGNFC0FaKBFw7COyzSxnik4rIVOU+uV8OlwATK3ahVIuYgmWgpJe
	cQMwuLQaI6rT4BBpPO9ZhIqt6trLx6LJxJ49KAy1UHzwoQynoObXDVAekGKjAgdVrI5wcOuHPlHy/
	xqoMXXOGBqJlBaLFF2F2Mqrl7mD9Rpk148GkANzQ+cExv28KjHpdY+MtWJvh2L9h+HCLzqXrx/BGz
	hv1IknWZWabTLivIfkl4srWWvx8NMzTWKKCqgRg7gn0Er027OnpY6QAgKuKSZOPMp5Wt7ko6jpAix
	EALHt7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4axW-0000000GIrK-3iku;
	Mon, 23 Mar 2026 08:48:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4axS-0000000GIpR-2QRb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 08:48:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-483487335c2so30197235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774255701; x=1774860501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=ZhcnU+6QfSG3AJCoUO8n2YmMN1B1O/DT0ABbErvhHnT+utROV2mYsg6+YHB5q2IdJs
         lu5QFRXr2jpjYnA12/fX3M6l3IiuN3MN1VXsAQqsJFSf4nNGzFtnBMcTICpVl+P2rmB6
         iQh6xyPLdwWI4KYh7WUWXeSsBoyBx9nmol69XeDGyOJ3ULqnys6pvFvoAEeWXGYbo50C
         bMLR8LFeBOVO58/khXJQW+A10ODXhNQBpeHHe1yJyJhAFGmrkp1/lV16mZklX92ki0t9
         m/Gb5XWelSjLyefpGhG0DmYPxl0JntkWGV+qtYWMosZ9jo/vfrpkuT6gluvQfphFtlci
         NXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255701; x=1774860501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=SKJJ8XwZVAwvwgFT4PmaW5BKKE79VJYUZECLRZ71yM/c0lfErPz5OXbl959EIst+Jp
         aoX0YiI+2YHaR/KtG1MymuPmc+dYxgDW/9VBSf5EOa/9lOMJVrE/TMrzg7gTqY0w8MAw
         NvTnjZt2g8oxN5zn6g7rdnLKmVtLijZuWDUx103V4s7RFkDzv1veG9A2tBGwF9Gxkfbp
         oPqWN6tH/DgSLa24uXObdJQjZvvxp1Pdxg55Nwqt6Jh6hEUngHKPg71aBEqaNb6hep9e
         ThdFEOMV5MVUa9GvML2lNTpBnA4lsv/ugfgFcfRzNBhSJWEy9W3sqEe5aopj/ueCkVup
         PRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIzHf2x5Cv5dQ8xXcChxpf3ptWXCGGzrNiCVcd7P6tgESSwc/7dasb+dzeiwKct/GcVBlf9Z7vU7SKh9/mdJAj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9oJ5mvUnC5rnkMyBJ8vlKL4sxnLkFUtE/3LdqTrENvGYLNU2t
	D+1n4+gVBNFV1Aw+YmenOUw8fk+S76vWyAZYJgx2SQmjHH9M7CpyONPQ
X-Gm-Gg: ATEYQzxh24fEEZJsNmZkrLzS5TXFGVBHQLkqnCZhd0JZuxYxhyOiHK+GE7tNFVFBYnf
	05NabQtT/YN39WbIy6TlUrzsM6hvSfibthTW2ptqw/Uo6SiuufuH4lip/YN5afG5qtDrPhI1OYh
	Ada7jlPZHqJNygLOaCImDODaEEM1tFC+7yUZSv6PlfQBR6EaMqjEOT7vFKrh3BP2mrnUMtr5QiL
	s4S9J8SC0XKPiW/ihKKtOy1K1Qflv9DJNfQcPnpwwGgc6W0Bc9nzZHPnG8RrxphSvl1O23MHv4Y
	C07ZH5DSp68Y7r0GB7H+dFDoepAqBZ0YxgW++l4EjTasIVbWWjjWfiazq/NSy5LCh1efrTT9RXI
	4vQT2aZ9lgaMC9gl1z6bWBgGl6EHZqB5LuRbXyRRThZQAdZ610VymtpNdL32FBhbecbLJEsEtne
	I+/I1BFb4+84Ft
X-Received: by 2002:a05:600c:3b10:b0:485:3f72:3230 with SMTP id 5b1f17b1804b1-486fedcc4d3mr161337325e9.15.1774255700647;
        Mon, 23 Mar 2026 01:48:20 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486fe8367d8sm316822715e9.14.2026.03.23.01.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:48:20 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog
Date: Mon, 23 Mar 2026 10:46:13 +0200
Message-ID: <20260323084616.10469-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323084616.10469-1-egbostina@gmail.com>
References: <20260323084616.10469-1-egbostina@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_014822_636426_0C13165A 
X-CRM114-Status: GOOD (  13.27  )
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

The Technologic Systems TS-4800 watchdog node was previously named 'wdt',
which violates the core watchdog.yaml schema expecting generic node names.

Rename the node to 'watchdog' to fix the following dtbs_check warning:
'wdt' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
index 5118a68db..3610ce395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
@@ -155,7 +155,7 @@ syscon: syscon@10000 {
 			reg = <0x10000 0x3d>;
 			reg-io-width = <2>;
 
-			wdt {
+			watchdog {
 				compatible = "technologic,ts4800-wdt";
 				syscon = <&syscon 0xe>;
 			};
-- 
2.53.0


