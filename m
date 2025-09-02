Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1001CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z/+y/tdM/NG8BWfS1y/m+V54Xiln8R8eIncX37hI0yA=; b=AmZba30WuegoGBridhX3+izN1h
	2sHYyWGK2zT8sX7suQfb41/th3xGNVr4dmwv2p4oylsju+bV2CIQKlD23KoLQTUgSjuoyj4yoOhaM
	sIG9fehnIhYqncQjsBoxByYF7NBwuuYd7jphrMs6T1ZaQZ9JgNqblZKrGDfIsd0ue7Fu9+WCM8Zsu
	Wklr4OZEu93mVSgXTFxpKAHYwarLfl5w8gbfuH3V4jRXOWyPkDzSnA5NFxpxtnWgf1gcwLPxajDJ5
	7vIX1MBKVr/bl0eaJxAj30ckOA9jRnFuOQFJtZ9JwEfIvHtkaz1JqgOjLZTHq8OBPe63rZ5sX8R+s
	PA8CISrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmI-00000002Av4-1vQ9;
	Tue, 02 Sep 2025 21:42:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSkt-00000000d03-2Fk0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 15:17:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b7c01a708so19340355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756826226; x=1757431026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z/+y/tdM/NG8BWfS1y/m+V54Xiln8R8eIncX37hI0yA=;
        b=CO2QFQYFKZ0ZvHFmkAzGCgg0vuXZFJ8G7Y++/Al+Sd7n1sMWprx0WV+HbWeuApG4n2
         Q5OqHt7ag/kQQNyKIawM4FP06moc4074I5vzFrWBSBNpFrKxKNF/zuPBNJFymLwe5l4d
         l2g0QUOVbb0rR9IkFY6y0IWZqQ+ncWZ7Q2W7gaCIDuMD0Y50WJhrLA7N3hfG9PRCNxWO
         a12k3p+S1S5Stv380GU3cJ+Cqc6vcg6hSklcmg/JKJ4eJ7ydVRz90CuMFzn8XdHYcSe+
         TEgzpI+2xEAyCbl2dZcOJQzbc6jcXCqCwxKuBWcdrQ5bxbdCY7f/3k2CfFcrqE1y/SzB
         YQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756826226; x=1757431026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/+y/tdM/NG8BWfS1y/m+V54Xiln8R8eIncX37hI0yA=;
        b=CgVqYFck7EQoJ2pSHKTmmt9e+GGIgJQ++7bDg3yYuSXuQc8lcVgO3um1Qlnrnog0/a
         IonMJ5AwRHD3eDphxy77pnHtg+/MMeM3M29EF1SEGt3am+ReEz2aDr/NPFbu6IVM2nHq
         0MWgc2OcZJMeY64nny7nlsU/a1j1U+R2OnmnHWkk5OKWvW6geyWlSZ0EgpZOly0ipPrA
         9f8qAWRIC14CZQPb1p/XFnGCs+SfmHUMZkrA9MYCvkakVHoojyiATkFhCNrICE8DuH0l
         0D/KRl0KYahAykEg+oYfiSaBqBgMDity5YX+SyluAxSc9LxQS/J+ZgOA/qaPc2LHw2oq
         ZlOw==
X-Forwarded-Encrypted: i=1; AJvYcCVdGuhuYvwR8KBGIhMKh/Ts/nEJ5HkWy9savjKe2GO8rxJdnNtGnL3h775z6J5pM2lFtAQDtcmQSzl81oupTMRa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe56m7jWEZFJMxNkjgo2CTiXA4POz4si1eULXy8Oi7qw8SUmd5
	hbIoqpyecV8ypEunrqRewAPUdWCR+4Z/DnnuDx0PXOQPFVBmt5A4HkhU
X-Gm-Gg: ASbGncsvDD8L6PZApDNAPPp4sEuhPepwB3KlpwcyFakrBoLGQJVkIawDt+kknldWdTx
	iU1UpdblxWnzTtzpp58IITFf5uXNGsReGRVdneDRz92XUk71r03LLRJc0CilLurdxBo5ACmfzow
	sgXeqd/k5r5XUpUFFm4HjtgNLDbdbW3XTZq6ncqDy4d3ON6ICcFyC382qYy7HfjDwClNJE9BJzG
	IqpU4SdFC7zmug90eQjYnhn7ObH5w1o/Z9K6nxR59ET5/wC+6b5QJujJdAGVGvTVVakn4joi01n
	cvt1lecyHgSddECt2ea6iSWosK27BFquHcAR48cv3LoG+PgZl+FiLfHRUnRMMnYoFjVLzXCVko3
	Br1XPwz9V79SJHFwS7cc9gDc+rjyhvA==
X-Google-Smtp-Source: AGHT+IHPrxWG9n0jv/V9dHimweE6JV57TFo0vu1l+QiPK2mACEOvsa8ilVRABmpFuv6uFYWMmNxRuw==
X-Received: by 2002:a05:600c:3ba9:b0:456:1a41:f932 with SMTP id 5b1f17b1804b1-45c6fa9a71amr2875755e9.22.1756826225515;
        Tue, 02 Sep 2025 08:17:05 -0700 (PDT)
Received: from mars ([2a02:168:6806:0:3f02:d36b:e22e:74c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm308037565e9.9.2025.09.02.08.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:17:04 -0700 (PDT)
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Jan Palus <jpalus@fastmail.com>
Subject: [PATCH] PCI: mvebu: Fix the use of the for_each_of_range() iterator
Date: Tue,  2 Sep 2025 17:13:42 +0200
Message-ID: <20250902151543.147439-1-klaus.kudielka@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_081707_579978_BF842D49 
X-CRM114-Status: GOOD (  13.68  )
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

The blamed commit simplifies code, by using the for_each_of_range()
iterator. But it results in no pci devices being detected anymore on
Turris Omnia (and probably other mvebu targets).

Analysis:

To determine range.flags, of_pci_range_parser_one() uses bus->get_flags(),
which resolves to of_bus_pci_get_flags(). That function already returns an
IORESOURCE bit field, and NOT the original flags from the "ranges"
resource.

Then mvebu_get_tgt_attr() attempts the very same conversion again.
But this is a misinterpretation of range.flags.

Remove the misinterpretation of range.flags in mvebu_get_tgt_addr(),
to restore the intended behavior.

Signed-off-by: Klaus Kudielka <klaus.kudielka@gmail.com>
Fixes: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"")
Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/r/20250820184603.GA633069@bhelgaas/
Reported-by: Jan Palus <jpalus@fastmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220479
---
 drivers/pci/controller/pci-mvebu.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 755651f338..4e2e1fa197 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1168,9 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(struct platform_device *pdev,
 	return devm_ioremap_resource(&pdev->dev, &port->regs);
 }
 
-#define DT_FLAGS_TO_TYPE(flags)       (((flags) >> 24) & 0x03)
-#define    DT_TYPE_IO                 0x1
-#define    DT_TYPE_MEM32              0x2
 #define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
 #define DT_CPUADDR_TO_ATTR(cpuaddr)   (((cpuaddr) >> 48) & 0xFF)
 
@@ -1189,17 +1186,10 @@ static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
 		return -EINVAL;
 
 	for_each_of_range(&parser, &range) {
-		unsigned long rtype;
 		u32 slot = upper_32_bits(range.bus_addr);
 
-		if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_IO)
-			rtype = IORESOURCE_IO;
-		else if (DT_FLAGS_TO_TYPE(range.flags) == DT_TYPE_MEM32)
-			rtype = IORESOURCE_MEM;
-		else
-			continue;
-
-		if (slot == PCI_SLOT(devfn) && type == rtype) {
+		if (slot == PCI_SLOT(devfn) &&
+		    type == (range.flags & IORESOURCE_TYPE_BITS)) {
 			*tgt = DT_CPUADDR_TO_TARGET(range.cpu_addr);
 			*attr = DT_CPUADDR_TO_ATTR(range.cpu_addr);
 			return 0;
-- 
2.50.1


