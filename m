Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F4D7830D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=; b=32zcHSNesGZb9J6h8R0kTl5JcZ
	gPgDViLfqM/5NKGWoQKZmA35bBF09ZisDzkPMU7niXoyb1p5ppnhE07hP3Ly2HTudixD56zjxy6aV
	iRMq41//mMJZcHe76AWNdhZWLDo6kRQpjlAqcJaqY9IHzQw6aioEOSH9UrhlvWdvTsQaEMqkYTpO7
	Kz9tNSie7DHoqDuWfv1h0ykzLlZjAqbPuNXSdnX+xwABWkTNhjqqONKcyUomjRss+pawUaeqShHx7
	5dxss01CCUfHg0h272vDuBMlDNqVu5UANYqj6GtaPN7w4jWUY6K4SrITIukaZpZ6cMNnYaXF4Fnx7
	IQ6FVvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4bA-00000005taB-3Zix;
	Mon, 02 Dec 2024 11:28:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4SR-00000005rMx-2lRX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:19:16 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d0e75335e3so1339692a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 03:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138354; x=1733743154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=PDQKekEYFJ3d93MhIcUTpDxYyCdRJaEHX8QtFcTn9lmPJcjd+2R/+JzYjZ8Q4kl5eA
         XsjYy7kxunwA6B9zOSqBwVxSc1jbhvdDYFB1JN6Mk1eg2PbNYuyTP/R43S8ogZ/LeBQ0
         NNYIJ8xRX/f0q2f9zRQBOPaWADLzhvhc//zcC2k6BpD6LziZSHIwAJC0tGugsTFyktHD
         QyE802FnbJz0CLKfqH5Ee1JmtU8IiYq9UkJcbQeKUa+bRdcLPPX72ZPqazJ3ihV1Bza7
         DL8gFdw/MBMqrTLnubT3EHA1tG68Cn5z0iYgswqBVbbXuKTtf/IUWDTu6qREtY9Vubwk
         qSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138354; x=1733743154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=SDfDjnosuYgC9M+8TZV1HLWe6L9su4Is8+ZR2zPMhr7f/huvvfLp4fDBJTl8aYOLW5
         FmRjXzUMWjtjjLIdpGlqwAqfHyB236oLPP2KVJiRiz334KtsHHdULC0pbflS8eMSHmgs
         viGWD/XuJa4O/Sm618+h/XpoqGBtU+Tn6K+jQRH+Y1APNwOs+g4y+kUe46EhDyuUh3xf
         c0JVNcnNEke+B0JW476sa/70YfjyHHz6n9hqKFOG3ip0ykAyQYnLezwOBjm4tqam3Iq3
         kgOdI5Ga+bijlawmPi4f4GVMVVYn5pFSaDVEte9hwLUb/GvdxKsH6h1aCsu+YaFJpt4s
         Bzhw==
X-Forwarded-Encrypted: i=1; AJvYcCVs9X3apmmf2B1dPqIq9Jh5TebsAlPNEx0NkMF/dcuWRZqjZ/DxtsPZ95PYihkMHT6NXjl0j1qZzYbcrbyMrxrF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8vxEFu9TiJShm9GMLpIiP0+JLLzYI3j0ffpcukzez9UEu8Ett
	4RC0YXCL7b5lC2h7QygzuGIRk2s/R/Bq7XIGrntD35K7NFsJsVzn2i+TEKKMjFw=
X-Gm-Gg: ASbGncuoZuIZIC7Pycx69FdrTIOz8ZUEvkrZazyiySwX6c/9pki3BYxsVbHzJl/FNiA
	tZCYXodhAG99GndhowlNTT4hSiBabJf565gtEw4M3jiNYLmiLMssEbUYQ7efzhUFWujmAz1TQf1
	EEA6hEnmc9RtpnL3kfsV4z71vmNPLzBlZqBCtXPbb3p1CwJ4K7b9HzKjfKbxUqGvb9brfOyp4ON
	84JgWuoBOwSeFYJsvvX9yQT6nelw4+rxhTV4VztoLShmgfy4MIwA5yD6ixlpz+lRisAhW/bNI9J
	QD4uoEmXebOpwb7yjNXZ
X-Google-Smtp-Source: AGHT+IHeFnhQVvvNV6Unz5SbIu5RmIoxGk3I5zBFBtPc8jG8aJ1mwarpKQV7x9LB7y94ybUWdyYebQ==
X-Received: by 2002:a05:6402:5206:b0:5d0:f088:c675 with SMTP id 4fb4d7f45d1cf-5d0f088cc59mr2379116a12.21.1733138353742;
        Mon, 02 Dec 2024 03:19:13 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0e1b6903esm1763679a12.19.2024.12.02.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:13 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v5 09/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Mon,  2 Dec 2024 12:19:33 +0100
Message-ID: <8b4dda91fae156a7f28f2807cd6d64ac2ec07dd7.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_031915_691925_E88A3CA3 
X-CRM114-Status: GOOD (  11.92  )
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2bdbb6780242..ae3c0c153cea 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,13 @@ chosen: chosen {
 		stdout-path = "serial10:115200n8";
 	};
 
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
 	/* Will be filled by the bootloader */
 	memory@0 {
 		device_type = "memory";
-- 
2.35.3


