Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7360FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=; b=IWB8PMLM6DSyCXDcy3Sr+L7Khq
	tTBwKzOhtI9KBXHYPVK0mlINSit2mXs5Uv0jeJOYSk2yUj8V9YQ51qG02jYR1Y4lFT5T+Ti7uI1j4
	jEl+kDTnX4Afxn2NA146B/lz9Zy64wO5ESYuFMEtGvQ87T+njmMcaVq6CBLqvgXxDvbEBDvut/gW2
	IVV7zi2mXz7mpMdLywY/gBvAXGP49NS4Riokxpgo9wNiuYVUKXqrs0za/kAuWTt+GUth2keIJ5m2F
	MTjJABdgWhs9IFblb0Iv8o/wNQcsz/9U8th8XPw+qdMXY73F95jsOE4eZ5TUeY/BOfg6ldTe+2coA
	i6bK2pyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeeU-0000000G13R-2XPW;
	Thu, 29 May 2025 14:54:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKddR-0000000Fu3k-0piH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:49:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad89f9bb725so179173666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526568; x=1749131368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=bxRtac8Eqb04f3T7gsUqj7ZROjbXdIwXCXcXD47SRYTZnTYTz6C4PGAB66A0XZZKO2
         fxHpQx+INknpkWoNkv1HpJJYj+h3Wp6bQ7X9RTPNkiuwEbenWpqtwldlUkwdv4OZklag
         BFRNip7HXHHhkzGL12DuymL3KOpTmef6KvQEYqlhm4b/DqRfObiF52tmW7fM6dF86wcY
         ClkcpOL4uifJ3yX4b+wenjMGDtb+UgOoD4gmawEwj3iYUcQtfbev+TlQU0VWd4spbqCd
         LVwL46FuN1B+a/VHwIYD72RsL+/9gMqTTAJk4NP32N6mijopR5xdA9zonWvsKBImcQYl
         +83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526568; x=1749131368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=ZgCynvNqyuT4CXbdDCUfPiaIlPn4hBL7a3VNZ0T/tAvw5ylyiXErbWx0+uUOfo+EYD
         u20hnNoru9zUZPJd0k3YA+gLBcsm58o74pgy0Sn+g8U1HzvswnAhZ2wTf/TPAlE7ntyE
         IWf/wCYc93TsaPv9hEv1E8/CuiSGlTxfNRBkrN1JOBbyYbujYPIzOtiD6MCjdEe9/WX+
         tAxigwYpPGJloMFOCobzX2FHzyqUm3j0NxPgZbHC7PFEDGPF9w6iFMTIJq6g1o4DQOcL
         CR476YQ5PUkyBI3vR+VVB7+l7UWBIm2xZ/pZzDRf/5h/CV3RvDbKj3k8p/xPQfqSv1vk
         /a5g==
X-Forwarded-Encrypted: i=1; AJvYcCUj05CxxVfeA5CHsvWRiZ3Ufyiqki9wdTZ+VIaia/8i5VGUSqfS7N+NuSy96Uo/gFuBzL7rXKTNZKzY8vWKDiSE@lists.infradead.org
X-Gm-Message-State: AOJu0YxtImxw6L8pn/l531PtrIetX/tP9VcZL9QIA90bS13vWWpcwhNq
	Sl47F+MichTanUDvB33zxc7wWBDk5XqhQMN4HGfftg/m/JIfEicGJcEvC/1dppdV/zk=
X-Gm-Gg: ASbGnctooAOQgwcTM4TgPhYDlKGXhYUijzLMO828QjLBgh6qLBktb5v/PArxrd/CC8o
	PfHKcMPV485UaqFN2JP/bLp9FY2WgYtnqHUER1Tjq1Wipz8KylGM+y9ZZVQhNhCmNybkjXSOILX
	jovGesOT4QQV6Jd1x9tBR5KacQyfG+bSRpFxzuBie7D7xP5uPLXH4iMPf44L0G05LFTZndkrqD9
	GJG0WFlQR0FAPUfM5PpqYmyMTDohMnO2GKRoizUlD5J/ot//Y6HycvB5tJ5+Was5iJqfvhkDM08
	qG7uxqEUDCrNSc1tjmualxzVEXzmaiVWl9KUmzGqeOGEr66i6q+vk9OLW3bVv9i5rNJ2w0iQfMH
	h6rO5h6lHW/EPtmsKX4WnYQ==
X-Google-Smtp-Source: AGHT+IHauMo4PO8x+p2QJnQMGgglReuXaviinUw97Q2Scu+s04RkVaYUYy8ri/br/b6wUWptGayevA==
X-Received: by 2002:a17:907:3f9f:b0:ad8:9c97:c2da with SMTP id a640c23a62f3a-ad89c97c73bmr736928566b.40.1748526567679;
        Thu, 29 May 2025 06:49:27 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e88csm149038466b.62.2025.05.29.06.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:27 -0700 (PDT)
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
Subject: [PATCH v12 10/13] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 15:50:47 +0200
Message-ID: <20250529135052.28398-10-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_064929_231494_7CF914CA 
X-CRM114-Status: GOOD (  15.10  )
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

Define the RP1 node in an overlay. The inclusion tree is
as follow (the arrow points to the includer):

                      rp1.dtso
                          ^
                          |
rp1-common.dtsi ----> rp1-nexus.dtsi

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 031875a277d7..83d45afc6588 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -14,7 +14,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb
+			      bcm2837-rpi-zero-2-w.dtb \
+			      rp1.dtbo
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..ab4f146d22c0
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&pcie2 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3


