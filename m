Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274E4C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hon0A+RaNlvqPfqyKNkIXyr+XGvXZKWonIIqQqeswT0=; b=pXH+fWKwV2quiFkvU7XfDUBSF0
	EcKy88B3Dg/czWMKZlD3mkwwdlY6XkjJtKYUInMNy8IorIpqQUulVSK1/2pBAsYOfJ2pBLItzdbPL
	g7wBzL5OcohetXsIIRiHd+GPZDD7H6phwmF2JFi79TT51753iUClt1kbv+v+6UeyxtOnaJBCSFWzQ
	cpiCsbeWE7HQ+NLuOxodrI+gSyvQoRwvjG1WCWTq4oqGJTFtyLCRqP5Mu+Fv01q+6BkN1cnY5NijC
	vcvfpyYFrIapGU3M7DKP2Y5znQsL9qm1zGc24+Zj6DS+VBjUKcEADxXUkgPW5WwaYg7DJ1bH55s+o
	dMRJVuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1nv-0000000AHCP-3zeY;
	Wed, 19 Mar 2025 22:22:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1K9-0000000ACX6-1mTd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:51:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac345bd8e13so32035166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 14:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421100; x=1743025900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hon0A+RaNlvqPfqyKNkIXyr+XGvXZKWonIIqQqeswT0=;
        b=LMki8ae2reTEx7FeDxx7kyl+wl+hG8Z6yXoUC/7pYVnYvJagcegk5ch/yH9YSDK6Mf
         BZKneCo4jfmbqQMzc0UialXUwrd/pCyLTFkS+O2/9ro93WKBb5PcV1k4163bh6o0W3W9
         UGdLsMEkd6BPUi6CnB3miCU8J4o1Ae2PWLTaojSsyeHUAJIBIIJ6nX0/OsYgY9/QvlaK
         aRc9VJcfkelJOQHDLTVn9JYKmlpbcT3ogpiadAVJWqyeWJRHW/lUBW9h9m5xl+rRGZNM
         rzdEVzXJmOqKl54mkaLM7ZC/QPY+ohDfU/8XS2DIl8WciSPKvsvAwEMi+k4aR7JPZdL3
         TEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421100; x=1743025900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hon0A+RaNlvqPfqyKNkIXyr+XGvXZKWonIIqQqeswT0=;
        b=s+q2z25bOeyDC0SDlC7o+y4Woz12I600XS3d8J1UNJyexY16pI8TYxB6GjZTp3As+g
         LcxoHC0X56FSqGiADJWYZs1+6nF9vekk3AxwBya3KXZFLTrOqZlHy4xF3V2UXSY81SlO
         lM/ENnV/oH40+StbKYdXIaIZ4e+gA2P4wPnsQUk11e0EOtOgOC5gSM+sfW6VabzI4+0n
         NB7U5vaEjFEAYCbqxD+ejpT69m4iNYCuuqtDKOmZDjC1exy0SIwoNxPWiexVOhnDcNuy
         BhLzU9fANJz5zXu0COuyIBTasFJhEBbvgZQQ84mFdHpmWKKSYcEKP2uJRBYv4bcLbppS
         s5eg==
X-Forwarded-Encrypted: i=1; AJvYcCXjLz6JJi292Z2lcGi4Nj5cLM/o8O5rcnagWs5aaPUSCJrvMBTFn3YhxaKtDZJlhc24iTK3l6teo2RjMnfcbYwk@lists.infradead.org
X-Gm-Message-State: AOJu0YwwrOBcbQrm75hJK5BLAD6/qtgWY/NgiLceoGb+kzjXReJ/E6D2
	OprmCMgm8bw2aTXcIHxhq7RYDkZbHQUGvZpbVCa3U/kHdrHkborIR1G7qX5pmYY=
X-Gm-Gg: ASbGnctwluTdFwutmDTQnmn8Mw2yvGVs6ZIT7GeYvLu52ykUyPwfujF7P1rjxkMcC8+
	PDpXoRNVu+qXmXLh7ArIdjBbDXXdWv96fiJ94oTNugKNy2bB6Cjm0BWMPXyp1+zvyINs9AtZvzM
	suKiOVN7UNiPOpKMNEHiv7H/p473DFnE7R+SfQZYJVDMeo+577NMXdGDGRKyDSqNDbN/nZ4NVC0
	WgI7N73rdFRnBdG22uVA8g6rWSzIxSidBDOEsp00KRFOPQhYk6RTAop+RKNTqvObpli76b7e5yh
	P9gooXsr3U6+w0Hx+NxUGH5OTwVwZPzILVRP6zEx0MLqrovtkajohZ4bmGoZTRZjNBJ8VqnAyg8
	3BhD4BvKdPQ==
X-Google-Smtp-Source: AGHT+IEubZjv6HNcMkLRF8KIKKnDt5E7yfE5umLCedVB6lCh54dmHwyuBtrf8bjfetPJOMQZhmUQZw==
X-Received: by 2002:a17:907:96a8:b0:ac1:e1da:8744 with SMTP id a640c23a62f3a-ac3b7ed0692mr400259166b.38.1742421099920;
        Wed, 19 Mar 2025 14:51:39 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ced82sm1045348366b.123.2025.03.19.14.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:39 -0700 (PDT)
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
	kernel-list@raspberrypi.com
Subject: [PATCH v8 13/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Wed, 19 Mar 2025 22:52:34 +0100
Message-ID: <9d5b41bf6d1565f0de96c7c1680bd404cba40189.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_145141_463422_E8569890 
X-CRM114-Status: GOOD (  16.26  )
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
The following metrics should help to decide whether this patch is
acceptable or not. The defconfig kernel with CONFIG_OF_OVERLAY=y
added (wrt to the defconfig one without that set) has:

- same uncompressed kernel image size (due to ELF section alignment I guess)

- ~7Kb bigger Image.gz

- 3 new modules (all related to RP1, i.e.: clk-rp1, pinctrl-rp1 and rp1-pci)

- 27 added symbols, of which 5 exported
 
hoping this is enough to gather a rough idea of the impact.
Please note that OF_OVERLAY has to be defined in a way or another,
otherwise the RP1 driver won't work correctly in case the dtb overlay
embedded into the driver is used.
Another way would be to add a phony target to the arm64 makefile which
just add that config option to the target.
---
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


