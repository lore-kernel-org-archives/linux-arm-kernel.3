Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59D4C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=; b=A9oKr+tlctpaah/N0DlvFgnPbF
	XxjQoPJot8UX8C1C8c+GBDbuZXg8fj2hCYd9k1l22daeW5lvD2lsKAt4x6R/DAwqdjzSXTzidXKsd
	nwkNuG875FUH33LLMe82yckAt267i+BinuzgJC0JtGhuzGmgxkv8u63kUG3lEbGEdLt0UxMooPU7i
	D5TSbPZy4CXX6W51ewbcYQEtHgQhZvcPsFQpfbb+D2GYNDeBP6byuL5L6/IrnxaF//bIAposHvMPb
	Etw7lvMcH4ryoR9kdc07cNf2BXHY/sEb5bwNP8zBaoq2VPtk/D21U7YaHjKN8FN5J3tQzA43yXyBD
	wZA9cS1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdJ7-0000000Fr7j-3gqN;
	Thu, 29 May 2025 13:28:29 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcar-0000000Fkkw-1lSO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:42:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-602c4eae8d5so1739304a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522564; x=1749127364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=JbUs8bS9m6yb5qGuBfLtxODQxA9KGAhB0KXbg4/V9VjG0vVL9MePtOQFHoKrgjpcpt
         wH2KYc1gVR5wfmGTB8OKIBCBMeB3QqTfsuZgaPqSD8d12z0tz7/SiMieVUFWuh0XBiUQ
         u5hb2Gt/Rw+B1feoelZlr8oKW3/9iFPkGoZ6pG1nNysE4T7KecMy4YaolQiof8vlt3+c
         kY7hWOqiCSdMQ869n+jjXlI1LRoFIQIObvRG9qeaR+a8QuGU9x3Jj2Y1dGynv/HH/CQz
         ZlsKsOe212T7g/QL5rvpSt+O6To6St6MP14pnqBp1MqUXeXHiK6uu/m2vbPreZjPnMtl
         Wudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522564; x=1749127364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=ODg3M6lZ+hEzbtm5lvNarQVPm4EzVUvaWls0KF6bxkVEzKk5Sytv7ADtQXlovl+Sii
         FNA4F4lVDJN2TZafoIDp/d2rgdDG5X3w5k/23dno+SqW2rD2dVNEqcB60FkLVEAEGmwj
         sRctjtc4OpkYq+ERa7YXuNJPwIImuu68gBX/f2+EEVCAX5TOb05SS+r3nRZUaa1O+6lD
         +SJletimGqO4ZZBb3iBzfqER6ufvbSKF0geU3hvSUA08jLiNdjup2h6xxPPis+JJXtut
         eMToEfKcEooZSqngOcSHnipG8mlrGeEbqVnKhv4BQeZjsjA4LkHT8+U7XjvmvNr6HuoS
         MHIg==
X-Forwarded-Encrypted: i=1; AJvYcCV8WVL+hgWvNDjOyC5EOpcoKW4U0uFSvlMehr4V4FXdhzP5XdSwXjJaxt+GqfwlwkqcIDxxHL8pAbgAbTUUlj6h@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2GwgD8/s6HDIpCXeL6p34OYaNZEBiIYlTVAlgDH+UmYXmz8uy
	bdyAAqI0oJWNkC0WFKZkGi0Il807s2kuQvvaiJ1ndAqOxoZhkqvvmd4wHBWMyuHEJ0Q=
X-Gm-Gg: ASbGncuCydyWs1XN1o6V/CafbTFsbRiUiR9qrwrhkW3IrHXWRFD03pIdKBS7tTBTOzF
	4zFFwODzYz4vWXpSKLhhc45kHL+lCZ+YUWvzSWTJFRK+qummyP6qF1C/sneEAdrSruhfDEf4M7J
	RAFicdB6/WajaSBX5y/twWnr4pLAdYkFcD+YhBLqdAzjzvG31obyJU6iFa1F1biDd3JuSoS1xzq
	5wMJFWB+yo0gfnC8V5TVGrn2TynxJ9f4xqWiSIX2iK1cAzNoVGAEDzEaToIxJ2Vs8IItHqGENOm
	wZ0RcCztATf51bqBHvvjKTLSEJfJlmJWW4DVCg+QBOBWBDq/VO4VPaqWEAxm74CaWJiTBWqH2it
	xwpyKsGd3UC4P9zPGMbCbG/rkKs6UGkF/
X-Google-Smtp-Source: AGHT+IGU0cArmNGBE3alDxaSeS0c7kho0TQ3gbduZH4lCYtigEniaEd9Y5YqaiqYC9HAzb90Z71eXw==
X-Received: by 2002:a05:6402:510f:b0:604:dcba:dafd with SMTP id 4fb4d7f45d1cf-60536c20f82mr2597026a12.15.1748522563913;
        Thu, 29 May 2025 05:42:43 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d79e940sm2308553a12.67.2025.05.29.05.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:43 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v11 12/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 14:44:01 +0200
Message-ID: <20250529124412.26311-7-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_054245_455518_A92B1DED 
X-CRM114-Status: GOOD (  10.91  )
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

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6e9bb2a3578..ccf2f50673a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1659,6 +1659,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


