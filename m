Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA26E668A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/azjLItm0kRcZGnRsfAiDqYz09Bjkw+3gf50DzO5cz0=; b=TYItMfVXpAChfeUtIOCrcyL3Ls
	70D1z9fGiUde40MAmyFC1iOqEVj1qd9P4oQWNnS7EwErCyaSBSX+yht9Y1AQVB+lTsZX7KX74XqSB
	0NY4r79luMtLAG70LTyoLwlJz5CBGMDydlv/9rjjjGe6Za8OcZ2Ze1tu+Zeylaee3meYW4lSpiqC4
	ASOS0GAJiQ3nsPtPgm6WwxA/AzZlVrDJ6/CaCvlIzO82s2Dl8MwE66RypxZswmK2TwQHlizp9C+HR
	6fCAJn9bfg2mSoF3C9cO8fPAKH2ZC54UykOxozocePDUTtVzX4Q6knSkhsM2YrAHdYC2cXqiIw2eV
	0qQjbjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF9XB-00000005bah-2szz;
	Sun, 24 Nov 2024 10:08:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF9UO-00000005bBh-0tFK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:05:14 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a9e44654ae3so481179966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732442710; x=1733047510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/azjLItm0kRcZGnRsfAiDqYz09Bjkw+3gf50DzO5cz0=;
        b=bao7GUyms99Fl+cSLmYDDESE16gst0Wq3+8VtEnwJJROYd6FoahyVn6SZW/s0LViy0
         OPJxwsz9Y0TKqyVJjfzMu4XCxgKf7ACdwkuknUHIzueZVrdIYCCfZUelyqFq+jlILaBD
         tpKdrnWHTe+dZxqWEpG3446xtWKi98NSQyFwkBGqaYeLMOFBCEj7hmhr5oSz0xc77WLP
         azvRBNIstDzumBi9n2TUdulUIuYuvkcnhu9n/CEuZP9e6jD9gmSu363LPAskFOVtnZse
         XemrL7sEHsYse/wDr3438B+KmaeBtATbdjwvnoda5hVu6+DKmSDxzO3sfFM4umTH4F62
         OFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732442710; x=1733047510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/azjLItm0kRcZGnRsfAiDqYz09Bjkw+3gf50DzO5cz0=;
        b=eyG8Xz2L7JSMOIhRpSbRDqd8zjAA8v8LGP5N9/xly1f4zPMwT7Ir7nfPTM0SGZgiDo
         +N61ag04f4QhN4keaVxQbJ5zDDHoyhkhjDUKlBpaeu4gu6ktQ0GYp5ZtyuW4w+09qDaX
         pmRbojzoALTLiJZZ/aDUKfOKUlWwK7VwGCS4fgbMDX0MuouDooSiPsi3wt2ePP2TuQP6
         vWvQNrKvPuK3vaFXNe9iFS9Q1JfFD5efWgPQC3H+iYjMH9xHLECX+L0+Z61Uc04cJBqO
         h3q5jEjTBFXU810IU/VlR13/huGCLNCmBLOjRblbMfjo8poHAY6Key0I/qwQ2y/WdEzn
         YV9w==
X-Forwarded-Encrypted: i=1; AJvYcCXuY9BH6qaMH/+3KP1SxLMqRLCIKTon+2l5svULj1lzMZqg0XXa6uuYwsK/uc+4Q0N+bEj1I2wG/dD7UXdRBfjQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzGBUV7wr3e40lyVWQTXiMVw4CHL77fusKMDrrqgClt0uQtnI/3
	dHavcbqyTdZ5PzYfBpx7Z5ItCCwptxL82sqjzUUCe8fAX+OEu6r2dSgwf53wOgM=
X-Gm-Gg: ASbGnct2Bwph8mcvUy8kCFBJcq/DGJsXBSJV42qy9QwyoLue8x9owZ2BzleA7YNX4dO
	tf5ccEe9gTKvAMXAs5nRu/tbtSYhzS8afklOZEkCczIAqI+XsCZb6QlKL0D1CLZ7cEULujRX06a
	iNlQSX0tuvxli7sqFYjD3lp8yB3Xn97UcC8rNR7U0nFRztibHdhMIDQj19nLYK7HFN0cTCuuH78
	LgPEPCdnXUjqe7vY1olMeXsMMkxOLKBr5iIRLf+SGBhMdXQtF8KZPnXUkIspmV3N41X68Nbm8xa
	VDCpuM3dzZSoDg1m3TDn
X-Google-Smtp-Source: AGHT+IF27avX+bMlAPUDjojXnihXV+/+kooigFr7e9ZVvLkYgR4oL+7yerxVqNUweak7WLSGulhdMg==
X-Received: by 2002:a17:906:292a:b0:aa5:2a71:1646 with SMTP id a640c23a62f3a-aa52a711b3emr430419266b.33.1732442710505;
        Sun, 24 Nov 2024 02:05:10 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fd52sm322314666b.116.2024.11.24.02.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:05:09 -0800 (PST)
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
Subject: [PATCH v2 1/2] of/unittest: Add empty dma-ranges address translation tests
Date: Sun, 24 Nov 2024 11:05:36 +0100
Message-ID: <08f8fee4fdc0379240fda2f4a0e6f11ebf9647a8.1732441813.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732441813.git.andrea.porta@suse.com>
References: <cover.1732441813.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_020512_312897_6AA29718 
X-CRM114-Status: GOOD (  16.70  )
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

Intermediate DT PCI nodes dynamically generated by enabling
CONFIG_PCI_DYNAMIC_OF_NODES have empty dma-ranges property. PCI address
specifiers have 3 cells and when dma-ranges is missing or empty,
of_translate_one() is currently dropping the flag portion of PCI addresses
which are subnodes of the aforementioned ones, failing the translation.
Add new tests covering this case.

With this test, we get 1 new failure which is fixed in subsequent
commit:

FAIL of_unittest_pci_empty_dma_ranges():1245 for_each_of_pci_range wrong CPU addr (ffffffffffffffff) on node /testcase-data/address-tests2/pcie@d1070000/pci@0,0/dev@0,0/local-bus@0

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/of/unittest-data/tests-address.dtsi |  2 ++
 drivers/of/unittest.c                       | 39 +++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/of/unittest-data/tests-address.dtsi b/drivers/of/unittest-data/tests-address.dtsi
index 3344f15c3755..f02a181bb125 100644
--- a/drivers/of/unittest-data/tests-address.dtsi
+++ b/drivers/of/unittest-data/tests-address.dtsi
@@ -114,6 +114,7 @@ pcie@d1070000 {
 				device_type = "pci";
 				ranges = <0x82000000 0 0xe8000000 0 0xe8000000 0 0x7f00000>,
 					 <0x81000000 0 0x00000000 0 0xefff0000 0 0x0010000>;
+				dma-ranges = <0x43000000 0x10 0x00 0x00 0x00 0x00 0x10000000>;
 				reg = <0x00000000 0xd1070000 0x20000>;
 
 				pci@0,0 {
@@ -142,6 +143,7 @@ local-bus@0 {
 							#size-cells = <0x01>;
 							ranges = <0xa0000000 0 0 0 0x2000000>,
 								 <0xb0000000 1 0 0 0x1000000>;
+							dma-ranges = <0xc0000000 0x43000000 0x10 0x00 0x10000000>;
 
 							dev@e0000000 {
 								reg = <0xa0001000 0x1000>,
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index daf9a2dddd7e..80483e38d7b4 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1213,6 +1213,44 @@ static void __init of_unittest_pci_dma_ranges(void)
 	of_node_put(np);
 }
 
+static void __init of_unittest_pci_empty_dma_ranges(void)
+{
+	struct device_node *np;
+	struct of_pci_range range;
+	struct of_pci_range_parser parser;
+
+	if (!IS_ENABLED(CONFIG_PCI))
+		return;
+
+	np = of_find_node_by_path("/testcase-data/address-tests2/pcie@d1070000/pci@0,0/dev@0,0/local-bus@0");
+	if (!np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	if (of_pci_dma_range_parser_init(&parser, np)) {
+		pr_err("missing dma-ranges property\n");
+		return;
+	}
+
+	/*
+	 * Get the dma-ranges from the device tree
+	 */
+	for_each_of_pci_range(&parser, &range) {
+		unittest(range.size == 0x10000000,
+			 "for_each_of_pci_range wrong size on node %pOF size=%llx\n",
+			 np, range.size);
+		unittest(range.cpu_addr == 0x00000000,
+			 "for_each_of_pci_range wrong CPU addr (%llx) on node %pOF",
+			 range.cpu_addr, np);
+		unittest(range.pci_addr == 0xc0000000,
+			 "for_each_of_pci_range wrong DMA addr (%llx) on node %pOF",
+			 range.pci_addr, np);
+	}
+
+	of_node_put(np);
+}
+
 static void __init of_unittest_bus_ranges(void)
 {
 	struct device_node *np;
@@ -4272,6 +4310,7 @@ static int __init of_unittest(void)
 	of_unittest_dma_get_max_cpu_address();
 	of_unittest_parse_dma_ranges();
 	of_unittest_pci_dma_ranges();
+	of_unittest_pci_empty_dma_ranges();
 	of_unittest_bus_ranges();
 	of_unittest_bus_3cell_ranges();
 	of_unittest_reg();
-- 
2.35.3


