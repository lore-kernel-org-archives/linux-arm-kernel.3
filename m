Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7CCCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=heEi416LkX8py4ejS5ZQNBKZJw/dtjDhd+4HdFbuaRE=; b=kdkozJxVho1CD1veWzywVAhN+M
	CZigOWVRLm/SO0E/ea7LefhL7oTtC8Xy1+NDDqeurz3fpJZik1r7BWlGJpqqwS6CsctoXrNiu3dbT
	F4Vu8j+6c6Bm5VZ8oQH8MX97AmFlFiuXNlY4Cgr7dzWwVOANhaAAB9CqOE6xlw3+cGJEOMr3tVszR
	SVDeIutJnM1SwFZ4Mu+bJGZcQlXADoqodnRi+gikMvwZG2c1N9kGQEjlhtVBtvw1Fj+ijs3gNNloi
	1mIIxz6TU8rCiHaI2C8us8Jh0eQozRZeFdD+B/yBOtxciSQv5685TLbcQf8cijiGwqQbcs/YAj5Uq
	y2t7UNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvCbm-0000000Adcy-1kF0;
	Sun, 07 Sep 2025 10:26:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvCZ0-0000000Acs2-2cUx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 10:24:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45de2b517a3so4476465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 03:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757240641; x=1757845441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heEi416LkX8py4ejS5ZQNBKZJw/dtjDhd+4HdFbuaRE=;
        b=HqF9tIR9++Ku407VDlw4jJLgFnK4CDrf+vPL5BKL8tqyxpp5pAkb+nO4TQqBD/Uyb8
         3cFiQddNlaG2gJ1GUPnnBWlgsHz5tkDIZ5Ws7VBJF44nB2n5I2n9k5ivJwfq5PD8WeZV
         7hdqk5KCHQu2NfwRDmRPIH1sbzXWOB7RsCP+lXlTuanH+6jvaYbZ5h2PCVOkZ/WJcn+H
         u0rkB20IxHJm/FkPV7XGOnXdwpbEiKGVWhozk/n3357i8DYcVjdSxvprw2l3sjA5pTtr
         rV5umw6h3c8CtW1esEp9QhkJOoEhNiRX8ZU+UDTnRrDu2mDG0A5i1TNRiGW3DUUBk6Eq
         viGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757240641; x=1757845441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heEi416LkX8py4ejS5ZQNBKZJw/dtjDhd+4HdFbuaRE=;
        b=c3xZIJAJISobheGJWqaTMrGwMEafr92r69bpsBeU5hNCN8XpU+6wb/6cMeColFvZ7Y
         IK7nc/J3qoXzdGlDpheiA+mFxWWxzLwSPfpXX4QPf12MwULKDJF5XmSVKmTz74QMusQ4
         MOXX1bAelV9t0x9x8x3MLm0qmDMUAbwaTHVQ0p8raT/9YpcfBvskp3pnpcUtCAB4ySzP
         l6mn8wV8XJWHpH45XCHwJ8jEGAQsr/y4ohaIoHI488aEzPzv718sJEtwI/j92ZKb9Y2g
         lfm7zD3P79ohe4WBYMkrno9Ve+fNxxnTi8qHGO68YiJRUO5V3tmhFOcVpt5ZWPuhUbVw
         AKzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxWjc0H1ZfdDNnF9Pq4d2NTwQkhERgA4U8uXCRM2H/rEhJDZPmmkQaRQ5uiNZ2WBsbAoTGgc3lcGqc/kB68bsN@lists.infradead.org
X-Gm-Message-State: AOJu0YxUsDU1iqNpWZJYRJA3er/iYpE1jaSj+Q67ChGphqP4To58XbEN
	qLlglnEafptTDR5UIri4sa4t0Y5eNSxoPieVRwUUhij2ghM8GrQphvpHLdrtl07g
X-Gm-Gg: ASbGncsmvylqF5pjYP4KmWtj3HpFFeNzsWNfua7crhq47uTTn+6gHBF5aFhDrg/Dn9m
	PdfYslqST1SsNd4pmAJf/SQhTVZty5fBDlV1taULvvt8djO6BOfn8YFTmBqsDty237AlkytsbJB
	dy2wQSLiYOzDdfXyK0iezDLJronRlIhwBfZ/NCn+7EB8OcSsg7KI28wfvUkaRl6QtmEUb84a9YZ
	BvXgr7AJyXZvLJOuuFccRr4xqQvgbZ5HKppLA0NJOyjMqzvwEU4OavK30rdX2w2wd31sZR6IyxD
	L9Sx84rU59ErmVDAmNnu/Ir4pNQkN2uFrXszCF+/YPP3GadlNVwayh/zDFb6CuIVqRBGBdCepKW
	qj8KrB6QCYBvTsqlp+KhHnY++23eU6epCaxS7wQ==
X-Google-Smtp-Source: AGHT+IGAQugrVy2ibYrudSntWDB/4r6Xm95+Vcag6ocvEAnmm7jKzg6q+K6hmYLhYl6fHTFJ/LNoPw==
X-Received: by 2002:a05:6000:4027:b0:3e7:42e5:63dd with SMTP id ffacd0b85a97d-3e742e56a53mr1926383f8f.56.1757240640977;
        Sun, 07 Sep 2025 03:24:00 -0700 (PDT)
Received: from mars ([2a02:168:6806:0:267e:37:6a88:3fc5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm37655439f8f.43.2025.09.07.03.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 03:24:00 -0700 (PDT)
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
Subject: [PATCH v2] PCI: mvebu: Fix use of for_each_of_range() iterator
Date: Sun,  7 Sep 2025 12:21:46 +0200
Message-ID: <20250907102303.29735-1-klaus.kudielka@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_032402_663896_3E43C8D0 
X-CRM114-Status: GOOD (  13.80  )
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

Issue #1:

To determine range.flags, of_pci_range_parser_one() uses bus->get_flags(),
which resolves to of_bus_pci_get_flags(). That function already returns an
IORESOURCE bit field, and NOT the original flags from the "ranges"
resource.

Then mvebu_get_tgt_attr() attempts the very same conversion again.
But this is a misinterpretation of range.flags.

Remove the misinterpretation of range.flags in mvebu_get_tgt_attr(),
to restore the intended behavior.

Issue #2:

The driver needs target and attributes, which are encoded in the raw
address values of the "/soc/pcie/ranges" resource. According to
of_pci_range_parser_one(), the raw values are stored in range.bus_addr
and range.parent_bus_addr, respectively. range.cpu_addr is a translated
version of range.parent_bus_addr, and not relevant here.

Use the correct range structure member, to extract target and attributes.
This restores the intended behavior.

Signed-off-by: Klaus Kudielka <klaus.kudielka@gmail.com>
Fixes: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"")
Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/r/20250820184603.GA633069@bhelgaas/
Reported-by: Jan Palus <jpalus@fastmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220479
---
v2: Fix issue #2, as well.

 drivers/pci/controller/pci-mvebu.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 755651f338..a72aa57591 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1168,12 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(struct platform_device *pdev,
 	return devm_ioremap_resource(&pdev->dev, &port->regs);
 }
 
-#define DT_FLAGS_TO_TYPE(flags)       (((flags) >> 24) & 0x03)
-#define    DT_TYPE_IO                 0x1
-#define    DT_TYPE_MEM32              0x2
-#define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
-#define DT_CPUADDR_TO_ATTR(cpuaddr)   (((cpuaddr) >> 48) & 0xFF)
-
 static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
 			      unsigned long type,
 			      unsigned int *tgt,
@@ -1189,19 +1183,12 @@ static int mvebu_get_tgt_attr(struct device_node *np, int devfn,
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
-			*tgt = DT_CPUADDR_TO_TARGET(range.cpu_addr);
-			*attr = DT_CPUADDR_TO_ATTR(range.cpu_addr);
+		if (slot == PCI_SLOT(devfn) &&
+		    type == (range.flags & IORESOURCE_TYPE_BITS)) {
+			*tgt = (range.parent_bus_addr >> 56) & 0xFF;
+			*attr = (range.parent_bus_addr >> 48) & 0xFF;
 			return 0;
 		}
 	}
-- 
2.50.1


