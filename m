Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2E0C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eP95ZPeS8Uq3g1fOmw+bjaH0iUiNCmHgM7HcfPKHBbU=; b=ADu7yK1gkY8zBHX6roBV2I6I5n
	vewN6rrbH9yp6ktgJp2OlOI4LYr09QVLTDADeAbt/abVpTF691Rd+GtEqACHGNKvVvtzo5a+Vr/MW
	98oSILrZ6AHwqqAy/85U6qMT8tYUw8gNHW+VsQTkmJcDHg9KWG6QQRT7UmyCN1LM4P6iaTcg+XgzP
	NGJB+AO/LHckGbcsWWsnMNiNSvO2jiZl7/SSKdKTcFCKVkjsl5p27tmSIujBS8L1oMTcDwXbYI5L6
	WcW5ctI4pd6affUBWuU1NY4hZYRiPrXnAyx7ljBFG8Cklnqq+1mpNCS8QGpqXACbplw+OX08KEr7p
	t5jqSceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKBG-00000002dp9-2CK6;
	Mon, 27 Jul 2026 12:11:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAk-00000002dQ8-0iZ8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:11:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954afac04bso31110745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785154264; x=1785759064; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eP95ZPeS8Uq3g1fOmw+bjaH0iUiNCmHgM7HcfPKHBbU=;
        b=NX04c/swykvjIRraXBxKh27Jt3+VDxsSHPR5G4c9kI59FkmgNiYSnR/60v5+jXbjJG
         GMpupggeBhQDVesMUHwZWyBToKuZL3a7/TXqPaxk2OI+hMl58LYLRjc2NkVtR32moGoA
         lFkPcgu2jWGOcnXkpKCTWG8zHxQ8D7r9RQBJBl1fVn1i8v93dyeUU4y3qElO27ANgyAR
         xuMWzDvmHXHO0bpcWJeVaBxrzfJXmC9UKy0Pn/tnwB02rc4DGxKBpwv6PGpNFI5uskse
         TSJaU4wowli3NzmPah/ybsEfyLpY7vXO/W4FljDViZphzCki6AEzpe/tV48gvvdRutq+
         U/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154264; x=1785759064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eP95ZPeS8Uq3g1fOmw+bjaH0iUiNCmHgM7HcfPKHBbU=;
        b=W08+Ktam1HamI7KU5Nxunnia6meqG9ehsuQjsbiKZCltRRGCEGKgG4S5jp88uMBcgd
         4b/h/xmDvVITNEcVIvZIM/PxkWpLPKJ5MJKvhLY9mZSJvCPaptXd1OUDwRX+Oh/e9bVf
         0ueRFYXVBDCIRtD0cj0Wu62o/oqI3VRVVcuT071zFYgd1QfOVOLiqvrkbvcfMZ0bSdzk
         MbH2/+8AJxBjWETB0O253FbKbCudl7OD3NxwohHv+frs6qbX923G1Ab1EnUHvWaXcTxT
         1fLHXE5wcjKaI7RDZvqrmbxdUXxfqI0cnUKzCEwWiBN1iIgtEe0dw0cDiq4kt8FWfcHh
         2bOw==
X-Forwarded-Encrypted: i=1; AHgh+RqL2G+O/sq8feab4Qz94jASayerIBoLwjdVuSfziNYiK9daghHfVcmKhCxVBrLzFbTlilbJl1wjEM27ngC7F4W4@lists.infradead.org
X-Gm-Message-State: AOJu0YzikIWD1Zwm5p/QzJvqJkhAaltKcLG8NA3nlzU+3tfvAoFFRdsm
	BPIp6tnJ0x+63Tcbai3aNyx1JicCJQFrcUQzN+zv6bbsP7p2Iv35lli3QJM/W9/9T8s=
X-Gm-Gg: AR+sD137h9veyp5+ZOxf8nkzUg4rgtflK/ai5owq8iF+cf+BG/b6JsITR4qwuYYFqnY
	G9f78ktod1qj22whPj2fajsWL2CGeWYIOMOTM6YTiaVot20fIFuxElImyAil9AnF7fGE43E7Vvs
	YzU/lvhUnpHUPvHACfRyOpySGOWmIt0Vc6eFWLUTmDxIlMpJNkO+KUXYYrh2+69skJvX4429Skk
	1x5tGBbqDHT3bMgjc1yNGbu0zfscg0N5jSdPQ/2arDGF9r9nTlH/XHpQ7orr4IaLpXWE6Psjgwu
	XtauTmnKM0Rmi1pEUgXH1djqdAX5oYwYN8UWdztNPDI0lqsw/Fd6n4RqfhaKYMqS2BNpn/tbQfp
	8TDbHmDYlbslykjSqIwezK1U503DlFj4BrPZrEQwiCLDmOAkkiR3i9vQ1Bga2UZvxMwa7seU/4B
	B6b4A9QAnQov2NuTQ4HMM=
X-Received: by 2002:a05:600c:c16d:b0:493:f822:ac5e with SMTP id 5b1f17b1804b1-496b56f1308mr96598005e9.23.1785154264182;
        Mon, 27 Jul 2026 05:11:04 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm211778055e9.12.2026.07.27.05.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:11:03 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 27 Jul 2026 13:10:44 +0100
Subject: [PATCH 6/9] ACPI: dptf: drop unused assignment of
 acpi_device_id::driver_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-acpi-refactor-v1-6-ff900aa326ee@thegoodpenguin.co.uk>
References: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
In-Reply-To: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
 Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, 
 Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shuai Xue <xueshuai@linux.alibaba.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Ira Weiny <iweiny@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 nvdimm@lists.linux.dev, 
 "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785154252; l=2541;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=iy90S821r7vCDS/x2YS8oV7bzZLylqWa3kEXWERJwVk=;
 b=xtjCUJ6GoOgZ2wQg74HHYnEspaLZYECRG9U7Vj6yWa7RCTMDKR/PPofo9LHHFL+JQcluuW2hy
 eZmvz7mleUPCfxpwOQK6HZOn8zKRUipnuMO2pGX8LYu72eHBr9MdCzM
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051106_278647_5118E77B 
X-CRM114-Status: GOOD (  13.42  )
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

These modules set the acpi_device_id::driver_data to 0 but
the field is not actually used within the module, we can
just drop it from the table.

While we are at it - used a named initializer for the
acpi_device_id::id field to increase readability and
drop explicitly setting the list terminator fields.

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
---
 drivers/acpi/dptf/dptf_pch_fivr.c | 14 +++++++-------
 drivers/acpi/dptf/dptf_power.c    | 38 +++++++++++++++++++-------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/acpi/dptf/dptf_pch_fivr.c b/drivers/acpi/dptf/dptf_pch_fivr.c
index 8d7e555929d3..d23867f70b28 100644
--- a/drivers/acpi/dptf/dptf_pch_fivr.c
+++ b/drivers/acpi/dptf/dptf_pch_fivr.c
@@ -147,13 +147,13 @@ static void pch_fivr_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id pch_fivr_device_ids[] = {
-	{"INTC1045", 0},
-	{"INTC1049", 0},
-	{"INTC1064", 0},
-	{"INTC106B", 0},
-	{"INTC10A3", 0},
-	{"INTC10D7", 0},
-	{"", 0},
+	{ .id = "INTC1045" },
+	{ .id = "INTC1049" },
+	{ .id = "INTC1064" },
+	{ .id = "INTC106B" },
+	{ .id = "INTC10A3" },
+	{ .id = "INTC10D7" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pch_fivr_device_ids);
 
diff --git a/drivers/acpi/dptf/dptf_power.c b/drivers/acpi/dptf/dptf_power.c
index 55ccbb8ddbe3..065831bce8c0 100644
--- a/drivers/acpi/dptf/dptf_power.c
+++ b/drivers/acpi/dptf/dptf_power.c
@@ -224,25 +224,25 @@ static void dptf_power_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3407_device_ids[] = {
-	{"INT3407", 0},
-	{"INT3532", 0},
-	{"INTC1047", 0},
-	{"INTC1050", 0},
-	{"INTC1060", 0},
-	{"INTC1061", 0},
-	{"INTC1065", 0},
-	{"INTC1066", 0},
-	{"INTC106C", 0},
-	{"INTC106D", 0},
-	{"INTC10A4", 0},
-	{"INTC10A5", 0},
-	{"INTC10D8", 0},
-	{"INTC10D9", 0},
-	{"INTC1100", 0},
-	{"INTC1101", 0},
-	{"INTC10F7", 0},
-	{"INTC10F8", 0},
-	{"", 0},
+	{ .id = "INT3407" },
+	{ .id = "INT3532" },
+	{ .id = "INTC1047" },
+	{ .id = "INTC1050" },
+	{ .id = "INTC1060" },
+	{ .id = "INTC1061" },
+	{ .id = "INTC1065" },
+	{ .id = "INTC1066" },
+	{ .id = "INTC106C" },
+	{ .id = "INTC106D" },
+	{ .id = "INTC10A4" },
+	{ .id = "INTC10A5" },
+	{ .id = "INTC10D8" },
+	{ .id = "INTC10D9" },
+	{ .id = "INTC1100" },
+	{ .id = "INTC1101" },
+	{ .id = "INTC10F7" },
+	{ .id = "INTC10F8" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, int3407_device_ids);
 

-- 
2.43.0


