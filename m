Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615EBC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=; b=2un+DY7p53zAHnS1KLHRnTS6Qq
	PrMlxKcA31RgudGg0sg2/lg+QOSvyx1Y5QeVF6GDKOwoECXTSiJdExYX81Hkt8BAxuj2DlgyJ87ux
	Ajx4GGg/9iDFS5Bkuajpqld+oThhY3ZlvrK7gisHne/ZyWeugBEPy4gpi+DvXRdp1XLsDS4Pw2Gqb
	DgxFAo1wzZ0sdUWtUjsMj63fLeKY4e5ZTzwqsAPBgZhn3EniJD5iTHKAD/JGnFt2ymqILdkQ1VTEm
	54/iZaBrQRXnDVMXzZsaEabQfbKheMBmqH5fuxYzK9LDRxj2DaecO6C3zZ0IH3lTGODc17oDmD9Ww
	gL0acx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrbJ-00000004Hre-2lAM;
	Tue, 24 Jun 2025 00:33:26 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToyE-000000042SU-13H2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 21:44:55 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ade58ef47c0so948402166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750715092; x=1751319892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=HPRFr7nJpTe4zWR/+wd63nK3BYGNKcEFBNjfccxFKumVRcYsOhmmHPCSja2rm2G9jX
         KqSQwl2YtN1CAJqd6A2CLeNHMLVINV8RSH/6U3o5Q0+j0f44yLaxb9PPcms+CSKWNHHB
         ZptrFE8S9/mtj/Zhof+dpCn3na+hH4ygxtSxO1U6k8AECu5UoRKTBcc9McYzsXj3UcPL
         XM2g0zYuPwn9RIOtqfeW5dAcNQ1pgbZD1GswZ1qOI2D1gE9sR3lcsvdJ2rlgTJeSh8uP
         f39iGf+yz5nEhwL5jn9r8IJa64TMyUe6VSj2P7NqB8AodTSHMq7X/hkhZnjKLOarOtgY
         JhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750715092; x=1751319892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=Qrlgmm720gcepWOzl1a3oi0AW36rdp2OziEuKM4ttDfaMyFl458hFOLfNWPYBV4Y3K
         9GU2JEaoE9hw+Ph7yikk7BeVLj87lkIny2wT76jf9LYT7Y907xDrdA4kmwxZ72x95xzQ
         Fq0SFFhAJ6WwKpOG5oWnjlHskMuDUlF8rCHTPtrsM3if5AJcsth4a3X4JQ8+pXB13WTB
         b29k0itn+SH+oSMX+427q3GDb7mY2r6H+aZAG1pDKSU+GP06laXW1/YHKDgmSJvEmAQY
         rW10P4DLraS2gnuS6jOrY2rf36SY1nIYCocbyCqRrImRNg+JJc1aRIUnx/hEHMzj7+YZ
         UZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCWD0VekYpDLBobW06CnD+e7Mj7P9uWra0BKdYQsnyTqfyusONNr7ny3xU+HNY1YsMSakio5SBXB8w84p8zdapOg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/IPb34WNPOKokrIjsGHni2SFg/TnmBXrblYyIeDjjCoFPLSGM
	bKnBcMimRoBp0/TkVzRLkOJCIIPCGp+FfVT0JwdMr5trehYGSYg2KmDMnmq3d4omBHc=
X-Gm-Gg: ASbGncsuyYeDkUkvH+LYI0Ku2FVhtStwo4lsw3r7mfnnRAYpKmkQuFh2608OCA6nO44
	4rFRIy4S8FHKGD70DxCfQKbYqacUyJg80EqOUH8u/01MAtmebr8UTbG9u1CKBHhU7EwXltRzKi/
	z5vWZwZTvnoAWP/CTT1a+QkF38M+jS5CBpmMj1qPiNpfUQn634pqIvXlx8SOSMJhtAZsSuZp7nQ
	FsKJBiXGcRNKJtopSuxYHVIVgzl/Eo8wp4L/eOKFb7vpBCHFI34L+otqzQ2dHuBQ8hF620nxrll
	jt5PkX8Wc+jTrY46QLuNOI2x/msNYtuSWc2LYEP4XB5JUfaoj5Y3ybiFiMXvBpkhuoq2ZdYDhSc
	Z8vJy4tJI9AtExgk7rgvANpI8cPogNmB3TF94535xSxY=
X-Google-Smtp-Source: AGHT+IFCBGEMw6diC/0MRBmRK+mfhHRRzOPyJ8RG9tL1So/53qQwBJoVq147ne0xzxnIzQxsdYUCdw==
X-Received: by 2002:a17:906:d7c6:b0:adf:3cb9:e3b9 with SMTP id a640c23a62f3a-ae0a71f4c6fmr113325866b.3.1750715091959;
        Mon, 23 Jun 2025 14:44:51 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0540849a5sm778326766b.99.2025.06.23.14.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:44:51 -0700 (PDT)
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
Subject: [PATCH v2 stblinux/next 1/2] dt-bindings: clock: rp1: Add missing MIPI DSI defines
Date: Mon, 23 Jun 2025 23:46:27 +0200
Message-ID: <c20066500908db854aa4816b40e956296bab526a.1750714412.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_144454_296030_37A23C2B 
X-CRM114-Status: GOOD (  10.58  )
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


