Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E71C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=; b=J9NxhKsEhQ5T7/XqI/bri4H+p0
	XmkTS70OauK60QOULqvtbkNsUV92i+jlWv/gfGvEqAYhE2AdPb9l1wWvewuOIj386qGTIBhm0J86A
	iFywBTo/yBBDSJHN2lcR4aRXi68ucBsh3IX5oOipoZrQee5wvAe0GQzuhVwodjht9cfW0JbH6xVHL
	uOxI3kZsxxmGMtaD4wxY4CMM/RFrQhkG6XPWWJOAguBzE9oakKv4fXHT8iQvbZ81bGt0+mrsNvH6t
	5AHbnVlpEGX9X73mfhnnBicmgpgyvyi1MjLQ4wR5CM87vylxya/nR2em6eSYs84zCuTkezou41HZH
	JV21HAHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWXN-00000007OBA-2QUx;
	Tue, 17 Jun 2025 13:39:41 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRW3e-00000007IDa-2LCy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:08:59 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-adf34d5e698so783775366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750165736; x=1750770536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=OpkOGMAxwxGl2ic0jpE1U6uwFVU+Weue9SyQL4x9s9hmxLhCT6VMBCOsA8pzZPLq4M
         wMIWXtKNC9mkBTAAiIQ5t0oaCGZjOnJQ3iVbb0mrv8p/JXhdD47Jcoauqg3P6BHv7Bbi
         lqdspzSwXyiwvCQ80vh3YBmv4ph8OGXGK3kefKYiAuCA4mS33CxyH2M5zLRpy3014tqa
         Yy/jcp/Xokx6xlKHL6ckQ5i2dViKIs+1qRqKhIjSbePQepMHKURqE7Jsef3S7ljDmePU
         TIaJKn2gzXQTHF6OhF9R9WulSNPyDOCpeYDIyOxHw4i0RlVDrFtAg0V63ausnuxL20Nr
         MtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165736; x=1750770536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=eiBGS6E5Znt2k6dT/o2cV0De1r4/ShFiv7IBG/oGlmYepNgZNSE2M+XsWkrNAh5XvD
         3ohbpn7kCCeN7fKkOq0ADFcMFVbhBHorTlvPut/mzPeeHH4Ax9pWUBxIgQXSuEa3ODPC
         3Ew+upL26hSI2vMEgc7NqjXSnqqumKrJv+ORmfjrzGzT4b3nfB1zpHhQw7AYytmOwW4J
         c2dct9U6Zk9SktSCqHvyV9DdE7yRxv+iS7La8ZR4KdZ8z4VRsqGNIfc1JHIstX6kABMz
         bSG9PfeOO2vRRSkKEVc8hKGwsSCxOZRJS7vEAkZpdu4BgdhdX9uleLqCRExXsITh1Uj3
         eecw==
X-Forwarded-Encrypted: i=1; AJvYcCUP+npkGA34RCGMFnbN7ol37dSQRcJqcGII5+KjZeGFrq/pxQ3BlsEbZRjXqqeqw7UiL4wVkc/g0XGGXBm/MbV5@lists.infradead.org
X-Gm-Message-State: AOJu0YwroTdBRBnsY5AhKCIHOdCggg/Nl4fpTI9ITNilfqph5ofdqDZj
	utLyKD3OCSi3t51wBn/sL3HSXXZLd/BSeniKfuaZhWsCla+gKNkkP0SoaHxstuQ4NRI=
X-Gm-Gg: ASbGncvFVkGziryu8BTx/vOWtHnoBnJDCmBeIpaGrOGowMVqEa7qHlMGYCEOwCirVg+
	COGh9wTVHOkJHux//FKjbR7QejIu7oBmosScyv1FeGhORzM69TY32YJhoAKlp6KH27tL0o/eJQJ
	yUpxKDJbavXIiTcE43hUWtSQ/N1lSGKVW+C/dBQPsk1WGIPIuBjmZHrieLI8NzvZDQKSM9f8Tg4
	HFR55dtqANy4nOaMAkFG7fVcALWGa1tY9TLu9eHt4LdCv90eMX2QlXjvtx34jD//fhrIf64GQ16
	Br79KwhpEIy0YIzAJ9ALGhmkkdlFr6OII0aIZuEeq4EFPfpvtcIUGRNfRiVNWqGXVjhcpwjSZf4
	O1Vtz73ZxPBtlMYmQQ68lfPNzdld8Qr5h
X-Google-Smtp-Source: AGHT+IHZb/sVwRJgA/UO9fRUeHQ7VVUZbqfIWG3k9c+U7l75XFG3Nw9yzuD9XOU45EDledJ7H6W3zg==
X-Received: by 2002:a17:906:c143:b0:ad5:2d5d:2069 with SMTP id a640c23a62f3a-adf9c458189mr1334205766b.13.1750165736215;
        Tue, 17 Jun 2025 06:08:56 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81be674sm873602666b.53.2025.06.17.06.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:08:55 -0700 (PDT)
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
Subject: [PATCH stblinux/next 1/2] dt-bindings: clock: rp1: Add missing MIPI DSI defines
Date: Tue, 17 Jun 2025 15:10:26 +0200
Message-ID: <b8a54f41f6393e3b3cae6dee561fcd040e3e5fd0.1750165398.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_060858_592877_A5FFE1DB 
X-CRM114-Status: GOOD (  10.07  )
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

Declare the positional index for the RP1 MIPI clocks.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
index 248efb895f35..7915fb8197bf 100644
--- a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -58,4 +58,8 @@
 #define RP1_PLL_VIDEO_PRI_PH		43
 #define RP1_PLL_AUDIO_TERN		44
 
+/* MIPI clocks managed by the DSI driver */
+#define RP1_CLK_MIPI0_DSI_BYTECLOCK	45
+#define RP1_CLK_MIPI1_DSI_BYTECLOCK	46
+
 #endif
-- 
2.35.3


