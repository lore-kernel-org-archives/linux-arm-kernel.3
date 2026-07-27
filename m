Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9F7C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yngGEtXt8XdvhkSci47p7H95S2e1zfXfAmsSjMJsNNY=; b=Dj5x6xFlBW0GiO7jJtnXgf8Npy
	iExiTGUwpqAvKaFQR/HsHPvdOj/QVGFcUmpjuPzoOPv46i2bMl4XXn2bxyQajZF/5SmzWJWIuxPOj
	8fIbTESvjYUBA1zsGKbELAqIr1OYoueiPzeyhPzLKwiR7MTrKsylRN04cWmr6/yxhfCZ8mq+PMAml
	+lgKI60N3+YSI5bow7vW7xYLDlnwzOW4nxiYpk7KJwaGWouljq/gh24I11LF4cRQAikZUZClBjK/r
	h/PczblaUiexQ92xWQ5yk5IeH5+sdneEuLSiwBoWSjHuxmYF506e7qif7zWfymqpkZBbtoFV319yi
	AR4lN8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKBG-00000002dpS-2rtW;
	Mon, 27 Jul 2026 12:11:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAl-00000002dQY-1O3P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:11:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4957eefd361so19899465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785154266; x=1785759066; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yngGEtXt8XdvhkSci47p7H95S2e1zfXfAmsSjMJsNNY=;
        b=BjUc8EbCVPfWi1utC1GU2yzrScBYOM/ZFKcghgEMdharPd7tmvqsxkj+whtfv1RWrc
         IlDx144bjmAb+i1AS9HToomHNkwQA9VfIR0U2onHL3sOu7//OcuJuhcivW1f/wKAWfeu
         8fRlOXx/dwdFT6YhXYQeVAddqTNGFJ+oVXUrWnPyoEqT9gjy2W8wsBNubxDFRrP6e+N0
         //lqlSOzL/EWWgBI+yBEL0ff8lJAKvghJMSHFRE5UOLDjzcFYeWYyDEJqCeiEBhbMKcD
         zQo1+ml04ABeElLGPb44gK/8ZSsTtB7Dm++gILKA0gtn44gGm2gpGj5xHhLmw4C3IfjG
         u4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154266; x=1785759066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yngGEtXt8XdvhkSci47p7H95S2e1zfXfAmsSjMJsNNY=;
        b=IUHl/21Fwvkt8u3qC5ocDceHXDPxFu+tjSl9rfdMqwoieiqtszQiJ7jfDFnzVJClxb
         v33iuj/QwTxW4WyJUx8LsDs38I2vwg0KrxBD9CptrHXqfY3KjKpImyL6llYHZk+tXHAq
         AQMckdKaeHnjaAa8uZOfcvcTZMeeuGyGFGx2YsUqfXnjez/hZa4RXU0ENkWTto/F5v78
         4fOa27pbRoMP2ttG9N9/BUf0vIXdH9VFoJ0FeATOSy+BxVoGC1l1NXNv8cdYu4iCF6HZ
         aiNoDtFj4HtoAcLgeQDRjmhjIBO+SvSAuv2DdkhYgZzMN20IlQ7+fOOTaBxrYdG6J6Bu
         LqBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSqhqmVr0AmVDHlyHIwl5qG7B734JzrtyBFE2JZin4zSPTbVC+r1XDaCsTAP7Baor8TAwnFEW7BhE8EOuJnRSz@lists.infradead.org
X-Gm-Message-State: AOJu0YwsawlF5IhjsKHNwFyLHXg2+JEpZigZOEbvYzWhPCPR/NBFxdIU
	xVANB4UCTuqV58NLgAcksMou6sn/S0fD4XKRlM3fRrqVD2bpoihw832Nm+p95EkvBgo=
X-Gm-Gg: AR+sD10HZzSEU6U6mj4qGWVFNl1qUZ3aYS9BBigrvwu/N4be2ijx/CRsJJLbqsMKGK1
	s0Pd+lZIfL09Gnc6neC15AdBoA+IggE4owjSGEODvURUTyLS91jSk8WECFsuIJM1CxLu/xHWXLF
	uRmQFg/kGRF/ohT66Je63BwFG2+HbkJacISmxwjvwH+UMW703zxHG12+JdGGqpmFmA+HGCjC72s
	ehRFJ7Dy7jkIQMraf//lOckdBuTvVDNCZZuEpHq5aN3pQ0WjyybwwW+tH9RdxvENeYFXf/IVdOX
	cvSjt3s9JA5Izs4zerTjkCpBzEzeGO8yb2Dp560XXdiVdnWGG6vpXw7LCFTl07hFlKWPeECm0oN
	OPsf6mhhHjI0QqR6Uu5zcXEZv2I83nQIqHsUTfPdd9PlJ6OzOktrVL0N4hqX7VRMZil+tYotWHi
	TJqbjOJQGtFDp5cynjI+c=
X-Received: by 2002:a05:600c:5492:b0:495:7eab:3abd with SMTP id 5b1f17b1804b1-496b5736f4fmr117417715e9.33.1785154265733;
        Mon, 27 Jul 2026 05:11:05 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm211778055e9.12.2026.07.27.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:11:05 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 27 Jul 2026 13:10:45 +0100
Subject: [PATCH 7/9] ACPI: nfit: core: drop unused assignment of
 acpi_device_id::driver_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-acpi-refactor-v1-7-ff900aa326ee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785154252; l=993;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=f5yWEycCLmhwNgNs+7yltFCigM8U2L0qmiC75nRPZPg=;
 b=FPBuwEoNc0FwTPiW1OLmoke/+L0vL95t8jlgufvJHvdNH2cU9i9jhCZ2SIOLvvfU3dElEbK4X
 ffdwTvMsuVIB49CLJL8HnAYzDHIg3Q2vmuDwUv6QV0kEAdHSx50UKZC
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051107_397780_EF67010B 
X-CRM114-Status: GOOD (  14.03  )
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
 drivers/acpi/nfit/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
index cb771d9cadb2..5732df5d53f0 100644
--- a/drivers/acpi/nfit/core.c
+++ b/drivers/acpi/nfit/core.c
@@ -3515,8 +3515,8 @@ void __acpi_nfit_notify(struct device *dev, acpi_handle handle, u32 event)
 EXPORT_SYMBOL_GPL(__acpi_nfit_notify);
 
 static const struct acpi_device_id acpi_nfit_ids[] = {
-	{ "ACPI0012", 0 },
-	{ "", 0 },
+	{ .id = "ACPI0012" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_nfit_ids);
 

-- 
2.43.0


