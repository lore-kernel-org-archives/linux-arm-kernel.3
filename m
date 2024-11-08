Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C70FD5AE5C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/azjLItm0kRcZGnRsfAiDqYz09Bjkw+3gf50DzO5cz0=; b=uZkifSrJ5tl8YqepVpm9u2RP7o
	HrOOkKjeg4idgqYNS951Josr7AnRnpeFhPBFSsqQO5ZaLymYopZpaKIhcO9TGhLkyRo/G4OAV7SV2
	ugcam8LoH4AK0OAVuWVpvrh4Por4Y0S5ifibCVgONcEdIMIMa/9CE9MAStZqRGuQtw2673v3CMCxY
	SWvMkrlGejUUdzpvDgyyiKjoC6qVUyrhqR/vygu44sOoo6Q4gSsuAIBneay/hYNW47CkDRUXA//S4
	kwxuBOzUJl7zw670hHcPOmcbIiw+JIsBrdg/MOIpMechnX5qnOA7y9TGWLhrW2VLrFihcrIjmcCT8
	6FgHMopw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Nd4-0000000AQp3-1JzY;
	Fri, 08 Nov 2024 11:58:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MOJ-0000000A9Nv-05ip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 10:39:02 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so2722708a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 02:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731062337; x=1731667137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/azjLItm0kRcZGnRsfAiDqYz09Bjkw+3gf50DzO5cz0=;
        b=H5aTJSF62AYcGNmTEzuaArKVZYXc6Nqb4GMTN24nO7U2WyXTY+ATd+Jqsj3jNlOGpS
         Lh5+rl0vJafSOxK0TEOct/s8IFDuiU4/jIk23rfJOU1TMHvL+zR1Zr48i5bp2BfgqRcR
         U683Lft7OEO6ixLQgMEXwftCParo2dvVT29rZbDm8UHlO61Sbm0QTNt5TAc4D02eoo+U
         VhCfuXDo+WZis1s+7DXHCluCG0HeA+Cy7MKBwWdWJVAABmk1IWj3RSlOyAM0dK35TXq4
         Ymrgst0pRs3pqZqqNmjcuqA6ogZ1haVwGnfuOvy9ZPbnqny/Jue+6Fmgs8dMymoMzscB
         n2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731062337; x=1731667137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/azjLItm0kRcZGnRsfAiDqYz09Bjkw+3gf50DzO5cz0=;
        b=il+tHVGep9PF7881j4eXrreDNJd7V11zSsTIEN+AnweQi49Sc8MBvktASTUNmALoav
         wWxhsIyGnv82WEMH4nBpiUpaPwzf0IhhQhQb4VW5YDo5bBRezoiWDUi6XuCWOuFqkqgx
         it7ykkSLlA8ufhHGdjS/Trt9qu+ys/2Dx/BDMFSR15zoltZkBKmiNXHt+vNeD0JIDfMM
         wJBlTZl8Wy8zI6TuB+FixotykPP9BrdpiLbSiWwiOax3NDA6YllA0liDTvudUtOXMQZQ
         Vt8L1AEMcyToLbTi1EgdLqoB2bMOwOT4iUuem/WlLX6WboUrb390G7IhTwHd0H2fYIRW
         TXJg==
X-Forwarded-Encrypted: i=1; AJvYcCULdV/L44OqOqJ3jvAhkvL6cA849MQIND2ZMgXkITVUJ+xbzcIrbCj/owWKSf+H3QeEGJstzgg+6vSkvo8a5CKx@lists.infradead.org
X-Gm-Message-State: AOJu0YyR/0mSiqgcqVql0f0WqyNj6wd+W176GWU6IL40lKxldz1xFMJj
	Ji1iL7bi6+dZ1mtXT8F+bPwUOPLoB9fPKdrSeAGHb54b2qAgp+WHlfHGVxf045E=
X-Google-Smtp-Source: AGHT+IHc0Nm4EeujQTsSiAthZ5sn/djXgAGGTqX7CDsdQwDobH57OcRUGR+bcR0+ZbLG2wRvWj+K1A==
X-Received: by 2002:a17:907:6d28:b0:a9a:2afc:e4cc with SMTP id a640c23a62f3a-a9ef0050e63mr178709966b.58.1731062337230;
        Fri, 08 Nov 2024 02:38:57 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0def8ecsm213746366b.152.2024.11.08.02.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:38:56 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Michael Turquette <mturquette@baylibre.com>,
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
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 1/2] of/unittest: Add empty dma-ranges address translation tests
Date: Fri,  8 Nov 2024 11:39:20 +0100
Message-ID: <bb889701c1aae2a88157c9a75be2b83c4b51329f.1731060031.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1731060031.git.andrea.porta@suse.com>
References: <cover.1731060031.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_023859_168059_4A9D0738 
X-CRM114-Status: GOOD (  17.03  )
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


