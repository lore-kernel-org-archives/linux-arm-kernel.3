Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C744C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34/3xpWJfuscYnym0h0qM9v01c2NqgtLDv6AlT7mmYc=; b=4Z7YSLBwCUEgiGQy1AeEkQiy9E
	dzf3sn5G8cv0S2YIm/1L6DdHOM9wBelJtUBkaalWRHNNOY6yiN1Qw/z+YG0ylUwIlzV1UI+2iLxDj
	lt48/Dy81wjvzRCLg1lHRhooy/qg8zbsAeH+vZjgs2Qp47BaNmhsW3CTNCdUOUm4K5VUtmg5p4uDg
	eM0L5H7DiVf4jsXL1OpGhVL0VYrZUCWeNCCQ09AldsHsdmyzgP8A0oYSZcF1uOvYy7I+yTJ6bDGsh
	UNIZNjPmTrnPGEnd+Uh0zFtZbMc63yht3nsP18YBzxuP9z8f6dS9YI7SntFMmS74cTtaJASzcAYZI
	/qbQKc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAo-00000002dUW-1FbD;
	Mon, 27 Jul 2026 12:11:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAi-00000002dP6-16oC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:11:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so19887965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785154262; x=1785759062; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34/3xpWJfuscYnym0h0qM9v01c2NqgtLDv6AlT7mmYc=;
        b=is92to6TSwc73cAw2eDr7lldtXcYYuD/Ed9UjZiT2iHZgQWwuUavX6D37Xy31DFDEG
         JTkSaoFbMeumgEJ4W1DI27fyzoeNOAjRi9Psj6aarHT+4yoUG7CuxVHCvqUxotRyK7kB
         voHRRjsoMwL01+/+ZqxQsoMJOdUDLpQIv8OyfFLvyJ3kZcUaRArwnj3aAaMnkvxMvq6f
         0VW2VW7ZMjlIHGydv49uW8oUb10IQh0wcAzY8sG1dRw12O7vXrDGxvWSBkaXcMiZBkoj
         a9sacbHAMb0m8G4OnVKCnwhj/7zVuzFxjQqfLIlGQ1A7PQr/wRLh9MD/fcXamilMcpqL
         ZWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154262; x=1785759062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34/3xpWJfuscYnym0h0qM9v01c2NqgtLDv6AlT7mmYc=;
        b=BvZU8FhbAKgBLbOx+/wXMOYAfJ8kmUBYHl66LqOAJt9nolgR1oqvU2Kc4n6kWeynty
         dhu9smLxqRtEKVAsUzskNMx/JuFauCaA31FsZyMeX/a7xcqs3fszBkwqPVoTLPOcUDaM
         yfGngyF5IGYtFhfnhmDikBCbw+xFeH+pzvDCxOtVLLezQEHR60Jj30ZrzWgGQtmQtvQX
         5xwOKGWzO5vJEAFbm0QKWdJQYZ4yu/GHGWa4GDcMV+bOq9hYyA3cVgjN9jh+kCOJEwVZ
         zLYTYQ2b78mzy+ifhtEIfXDRxUn/wv2Q2DPJLiXfKkPnHCvllmSnMeN6XoRLvq1i989a
         inRg==
X-Forwarded-Encrypted: i=1; AHgh+Rqzn2dBglWuvb1mS7xfgnlgMOtQr2IP9cYkvPpwZjoF6Bjuw0AJmpxd8bjTbTUm62qhEY9iwnu+W4s2zJTwLSGA@lists.infradead.org
X-Gm-Message-State: AOJu0YwNCNMuZCWOPKP8B8K48OPGpTDfG7xq1vXnHpssZFH7VrytbJON
	3uw4uuhHURot9eidBv9tPCjr8JgUGchWXCLulv4cevTnJYWU/kUlhKvhooTcuMBNdHw=
X-Gm-Gg: AR+sD11v7ICqLqbZgpn2r1OqrfYwVRpTjLsSxpdeTQoa6PBWumP3As7d00We/U7/TSG
	UqBS7lJHKeJjjTaBw2xAwRj5x0rqGVER431hcAD0BnRUnxn1Y0J7ab0mUEZja1lnxWkT0TXJZib
	W5qe/BErvY8vr/Z+KYdQJEbxsk4JBX1FGR5s4QQl+hx1RS1wK27pZM5igfk0LaLVVEfXzV+Oqw4
	G55zPpb5A4mgTFP5sh6Ynb2F3BQUje2vkPlY+N7faCoRGe4Feen0TyLX++TTGtP79aC8fLYDRLT
	clUvZeEe9udcSzFqHPz4zjcLVJuQH7dCbqU/Q91q+1NLloLTVT08Jil46hu5uk7H7mVmNjcFDUN
	Xkhm6m8e7LCJfrYygtGIBwtQdMDCsnZJm1Oc80l9fjbIW8zMW2XtF7IFDGJY3NI7GVIsvxx6qJr
	ljQVzKm1DDW65XWM7ZJ8YD/g60Ywf5oiFT9D2IakgUopDreELGc46I2Y4OHQ+VWu9osa9PtlDYo
	L0WZyuYN+nz23zI
X-Received: by 2002:a05:600c:3ba0:b0:496:bba5:33a9 with SMTP id 5b1f17b1804b1-496bba535fdmr82232185e9.34.1785154262149;
        Mon, 27 Jul 2026 05:11:02 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm211778055e9.12.2026.07.27.05.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:11:01 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 27 Jul 2026 13:10:43 +0100
Subject: [PATCH 5/9] ACPI: amba: drop unused assignment of
 acpi_device_id::driver_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-acpi-refactor-v1-5-ff900aa326ee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785154252; l=1054;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Lbvh7ljIparNEO5uJ2mabx3TClqFF5XzLm3/VRCVAl8=;
 b=judU8sVVfRgrI+5ADeNtDthotqk9x8BTWf+Syrfpzb+YAyTvlO80HNFr3Ji8L5bsisVb/rkxu
 cQqASkV+g7XBfSqQvy8iMLH8daT2jimlaAqGe1JXLVIWuI6rYuSAZe+
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051104_332778_E07BDA97 
X-CRM114-Status: GOOD (  13.97  )
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

This module sets the acpi_device_id::driver_data to 0 but
the field is not actually used within the module, we can
just drop it from the table.

While we are at it - used a named initializer for the
acpi_device_id::id field to increase readability and
drop explicitly setting the list terminator fields.

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
---
 drivers/acpi/arm64/amba.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
index 1350083bce5f..e32b37a2126d 100644
--- a/drivers/acpi/arm64/amba.c
+++ b/drivers/acpi/arm64/amba.c
@@ -20,9 +20,9 @@
 #include "init.h"
 
 static const struct acpi_device_id amba_id_list[] = {
-	{"ARMH0061", 0}, /* PL061 GPIO Device */
-	{"ARMH0330", 0}, /* ARM DMA Controller DMA-330 */
-	{"", 0},
+	{ .id = "ARMH0061" }, /* PL061 GPIO Device */
+	{ .id = "ARMH0330" }, /* ARM DMA Controller DMA-330 */
+	{ }
 };
 
 static void amba_register_dummy_clk(void)

-- 
2.43.0


