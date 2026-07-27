Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BFEC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDrB+Cex1z4J7gYLaCt9VWCfPXHJCTTUZUhkbLnsi7U=; b=Jc4IgTBPu0vnfl8FqEHthevAyB
	VPalRwOTEw5WLVGeweVEmfGzjOv+EXqW6Qy6j1sH3vSH1BQyGjAtWWmeStadVko8zwf97sskOnA54
	LG7eNWfXGMnygampzBxYV6/GzatgNg/SPksycXhKeJW6YFS0PS7eWWxsiIcfrKIu+aAd6/inzEArt
	MX77dhwUAgELLrZlbE0AgvIP7OYrUDVYyAy49Ti/bReLTVUOR08XRbHfBxkFqqdyEMbCrflvNsM+F
	i9aNWzfhsiRVdcev9mWtE0ZPkPnn+s5dlnUue+KkgnPjMVNPKmOOqMbhicldzoJ4Rt0Ye9/Txrm50
	2I20tllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAl-00000002dSG-408G;
	Mon, 27 Jul 2026 12:11:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAe-00000002dNJ-2eqF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:11:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so11185505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785154259; x=1785759059; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDrB+Cex1z4J7gYLaCt9VWCfPXHJCTTUZUhkbLnsi7U=;
        b=trz3bF78SdsH8fdWoyizlz/wqUiGjWNerHxQDM2cJVz/Oan6D6/S4hS99ocYFengCQ
         yYq44ePyaLN8LAWEoNOSYabt6eVTJkJaRAzDNT1GxqnddLUSzTxxat7F3TGajzKbPeOr
         44Z5Sd7SADaStRAx66/C9i/DozG5t2azuG0fCR7pdu+xxP7R4eSD1jUjMoogiwkWNeXt
         dhDI+qaO7AuYjIm/arvSkcEHbUkcnjnd2O9wWH3rg8CBav4F9pofkOvAhKuOAFl7J72Z
         5TBJZlQzNLmYVrqtNDfCNYQY1Pgu9sUJ38KEaWSwJyAoBA1UoHn1ARqwzL3ogJh9asF+
         v/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154259; x=1785759059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDrB+Cex1z4J7gYLaCt9VWCfPXHJCTTUZUhkbLnsi7U=;
        b=LJa6xZEqcn9dwhYmkiPecpup4k35inIW7vQG5rApowtNw4yo+h5uib8SOlCF1DdKBU
         NUaanEBROgLEr+FdzMClndzG+XnRE9/zD1PZorkBNLFNtt8ZEY3B2Gcl22BGtCDEQC9D
         dlUJTd/2nwVh252jbYz3zcJ4GPmYGrpkYiddd15B5+mdGAqD9SvC08InsC5L550yEqv1
         6qDRwI2ywSwI4Z5SEuUjhatw/TANWTB+wjQdyDX9hDYpn7iLxMNRptTz2NzanC04/Mcq
         sy2NhXkIrAe3imwB1syDQ2+/lZJooThC77F1ikpaVm8lUy97jVZmWFMnugqNbxWsyfrb
         tFig==
X-Forwarded-Encrypted: i=1; AHgh+RpqO4W9B/OQRObjMMoQykMoN3Mzh0OP4Y3+UOl7ydqilZ9ycFQrZDYXB326xqpPOoDP8AjrNs5rqoKmg3bnzhhl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4dO916A8NZ0CbkwXZtc8OnAM2s2vUQzHc67f/RMnrRnTlHakg
	6BfkkV1Z+OSxP+w3GJhRb957O+rKbCGmoLrIAhcj66q+O6xPmD9bjzfLL+63JOptobg=
X-Gm-Gg: AR+sD107JHkl38aZMIf0A8VO9uvfUwredCljVPBUENaaxqo7Te7uk4n4gl3t9cCCcch
	2dsssyjmSq1b1VoM0zm6i8JPK+d4spwWWkBXIWSFnKmF2TUYOQoKEndFO3XH6NoWXIs39HkutJA
	fcIdmNK2bYKJ4NaxPp/OhU5ixMXW+LOBmYMdDTdexPjaXIhStuX200ZWtWJOe/4FQITtnk6jMPV
	l/0gdnLbrKaUeKJNkwY3x5BTpBq+aTTCac/DvS8ZUTK7MZgTpPG4ZTvTQzE3BE/JTucTgKcG733
	hoG8QuNIjneQB1eUdFhiFXrodOas515MR2FUKeLFD/9Fjw7BVRf06V6jdehftEXi30Gf6GT3qJE
	9/kZgFlaScBZfsruYfA5DCFBrDUoKz7CzMKfanWHVJfC/MLwcHv3i1F3DjmJDGqLVWmtwx9HDv/
	olqGE4hcyEM9O4zOW14iA=
X-Received: by 2002:a05:600c:8b4c:b0:495:67b8:d97e with SMTP id 5b1f17b1804b1-496b57081c7mr107464815e9.30.1785154258767;
        Mon, 27 Jul 2026 05:10:58 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm211778055e9.12.2026.07.27.05.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:10:58 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 27 Jul 2026 13:10:41 +0100
Subject: [PATCH 3/9] ACPI: pci: drop unused assignment of
 acpi_device_id::driver_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-acpi-refactor-v1-3-ff900aa326ee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785154252; l=1501;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=P0xjQiLQXAgoqUkWLKYp5IthAsIDgkug16mJm0ZMeDg=;
 b=PNFz3+JEcuHTQLycUVytg5ZW5oWUuiIlRW2Ta2z8sj1QeOuxPAHaLQUtnCCOg9lGVoNYFi7nQ
 NZeOOGrRDxRBKbRpZ1rCkozuEsM743rRRDZUOoTKiqtbhh9ZdcPagk0
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051100_711983_D7314E4C 
X-CRM114-Status: GOOD (  14.54  )
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
 drivers/acpi/pci_link.c | 4 ++--
 drivers/acpi/pci_root.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
index e6ed13aee48d..276dd36aaf23 100644
--- a/drivers/acpi/pci_link.c
+++ b/drivers/acpi/pci_link.c
@@ -36,8 +36,8 @@ static int acpi_pci_link_add(struct acpi_device *device,
 static void acpi_pci_link_remove(struct acpi_device *device);
 
 static const struct acpi_device_id link_device_ids[] = {
-	{"PNP0C0F", 0},
-	{"", 0},
+	{ .id = "PNP0C0F" },
+	{ }
 };
 
 static struct acpi_scan_handler pci_link_handler = {
diff --git a/drivers/acpi/pci_root.c b/drivers/acpi/pci_root.c
index 4c06c3ffd0cb..a129cb0c0a36 100644
--- a/drivers/acpi/pci_root.c
+++ b/drivers/acpi/pci_root.c
@@ -40,8 +40,8 @@ static int acpi_pci_root_scan_dependent(struct acpi_device *adev)
 				| OSC_PCI_MSI_SUPPORT)
 
 static const struct acpi_device_id root_device_ids[] = {
-	{"PNP0A03", 0},
-	{"", 0},
+	{ .id = "PNP0A03" },
+	{ }
 };
 
 static struct acpi_scan_handler pci_root_handler = {

-- 
2.43.0


