Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52576C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BopDih7yHOpwj2R0KkzxFkHGfVydC8fjj8lntQcg48=; b=bTo5QZG177lNQolahrKwfG54bb
	1wFqqO00jk7Wq+3Ghh25pI/6YjxVz0QsBiSR9obLTYpw+U29Kxh7L4nWdbrgaxhmcs6P8caBzjQTQ
	LbWHG6ZSG8D1oaUFDm8SGy1P+eZ5SVMzr6RmoLiMsVDb8QwPVvshl8rB8MNFzjQo18ub4j0oOKMAO
	q/SRhmE5dt1sXiqoJOa62yUKvcas5+7X63hduk+QJ0Fehr0iEE3rlS/upsu7AEVCfvoU8haYVA7RG
	kSJLcPIrQ7GJy7Bs0NCjhkIh2UkViELpmi1lcjNSeHpZoVn2wZpMKlLugpy1LApet61RvwijvQE9J
	aWe8sqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWDM-0000000BIYA-1LP5;
	Fri, 07 Feb 2025 21:48:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwO-0000000BDWx-2ZbG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:31:14 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso452759966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 13:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963871; x=1739568671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BopDih7yHOpwj2R0KkzxFkHGfVydC8fjj8lntQcg48=;
        b=W5WS8woY5ipHM4alc9W7PpqUWZisg/xEPw7WJIomD0WxJJ7ZYA80dbEyzjPFXyGoEu
         wLDMoAv+VM/VsyaCBwI67r9FgfLkZbprQNnEtCiyDTms5ZmeHGAwytmmYugQ+Obz/umW
         ePcLUkZuuCWlRcwc+Hs2xs/7vOV6pvlXHJ3cuGo15sgGSZONRFvlnx0NjSK6gmJTWhKq
         SPAM+s7jEDvpyQXCzRw1bu+VqrikztV1U46eQz+7LYmTctwhrXPKlkkG/wAGVLN3bQTA
         9gi0Dt47iIgRGmOXRkjcqtdFtLvrxyNcOkHNpXN7iQjuCo64L/vKGWPwlmYP3I8pzRrl
         CA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963871; x=1739568671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BopDih7yHOpwj2R0KkzxFkHGfVydC8fjj8lntQcg48=;
        b=haRR3zy6/Ce5YcTdWeVXTD3th5rn603VLOPRIJ9uzHE2sxQWIb9s7HRSBDTZZCFtrm
         FWkSDyT9EWlbJnVs2TNdgttRdzpMRSN+Z41d8tnkEPUYWaX9c2Rvb0xrrhab8/OGwkrJ
         qjv48SbtY8+dsn2ebRW2JpKj3eOLbGwpR8U6PZW7xkim3MCVjK9Of5y/0f2Q9J7lLmh1
         BhAd3l/lLWcMJl+89ULEG4sV0VUFbsGG9h+IP9g3xjzlp7Lf8EKmE4WGS75HP+UJx3F+
         xxOhloGwp2WoY3c6K4LMERN40Q7Kqvler4tavzvIAMlpXZfVPLavX2tEWsVqZekv6FDf
         iILA==
X-Forwarded-Encrypted: i=1; AJvYcCWcF+bfuLgH28W9RNvf+GlckDEdFIPsycGQmsFwSd0sYEiD1sqa6JHpu8OjKOLr6DV3dEyOcT4mrnkQ2uokq24h@lists.infradead.org
X-Gm-Message-State: AOJu0YxW+ZNEPrG2OZjqxvbQQLiCjhdlj7ILU0EPXDRJZ3p79X1mUCjP
	YTmlDOXd3cuDoJkR9w281nUQRUNBFMbEczQjZGpxW1WYoTbQ0wQa+7vdpQiqpLU=
X-Gm-Gg: ASbGncvvVUxy/mwSgxrg/Y6iBT2eR+kvpe1jzB8Dn7UnuWs8sKhNhHTDb1aBxxzt5Fb
	iWuCRBo50afGfh01CFOmZhTE8t4t6RtmQp/9jBKHrAJZyFjFReTChjMQ0PXHqcQZ6KF1IaOuS5/
	RZP35XMMRuIE8S0cRh7LCLh9xlgNPncfpSZDHv7P83YnwmyAA1v4qwb7qb2vOhJRe0DW882pmyf
	YuJa5MgK5ctf7lyE+7mFJnDi2noARqs56UjTwdtXXx+QoCiaIVxZC6xAOh39SOM0HuVCVnNwqZb
	fBToQBA2sZDdNfwpyhL0/rTmRQ6IrQoPsniXeu6dRSiSplBQupY+bDKRZ0k=
X-Google-Smtp-Source: AGHT+IGwqrzJl2/ax1uP9MqR28vcjX4PkKe1oIs/IEEQv3qf1oee6es3/KbGoTL6JWHdxGwK20xnJw==
X-Received: by 2002:a17:907:c285:b0:ab6:ef94:6054 with SMTP id a640c23a62f3a-ab789b2886fmr568618966b.33.1738963870964;
        Fri, 07 Feb 2025 13:31:10 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77365fc7dsm330339066b.182.2025.02.07.13.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:10 -0800 (PST)
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
Subject: [PATCH v7 11/11] arm64: defconfig: Enable OF_OVERLAY option
Date: Fri,  7 Feb 2025 22:31:51 +0100
Message-ID: <49da5d0cf961fef23a1622253825443eb51d660d.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133112_664200_F378A3E4 
X-CRM114-Status: GOOD (  13.38  )
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
---
This patch is *OPTIONAL* since I'm not sure if OF_OVERLAY is a desirable
feature to have enabled by default. It would be advisable to have it included
so that 'make defconfig' can produce a kernel config that will work out
of the box on Rpi5, otherwise OF_OVERLAY has to be enabled separately.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cc70793e97ef..ca492fbd2773 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1643,6 +1643,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3


