Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E52C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHWMNT3PPvKZVD3OrrYw2bJ/4OkVhqGq7qA3NsaEVms=; b=CDWHR9RBppIQa5aT0PgKtZkq8H
	3OvQ0ogL9vsI/BMjIYaOI0cf31s3U43PXBbyO4R8zluyyQSx/Ht45YmdRnk472joA+p2vJiT4ucaN
	Bg/8jvwatJsqePou4oM/hs6m58z5qnc1bcydu2vlBrBHra70ea75zMLeu/MF9bw7u0CeaWUaCAg95
	M7RTIiYa5KKEF05TNEQ4H7BienjrkBO9jscRkbqX+cJLKgND8akk65SyjFI7AbflGZrXgRGMQid3C
	yoQuiHH3KbaN9UZUjY6UF/nVMB3sAO752JfoB8cINkUjKbaUE2vpekn8GhuUiT5ga511c1jMv/bAx
	UG26+EyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fR-0000000CqVP-2tRF;
	Fri, 25 Sep 2026 07:48:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fN-0000000CqUC-25RK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:48:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8624C60239;
	Fri, 25 Sep 2026 07:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595131F00893;
	Fri, 25 Sep 2026 07:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322500;
	bh=FHWMNT3PPvKZVD3OrrYw2bJ/4OkVhqGq7qA3NsaEVms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=W+Xea86yoT/vqZxhkS2jDSThHP1mQgJVf5EKnlFjUQ3ifH4w3YeCFBP1W8z24XjjX
	 K4GX8MYCHcQmUxfjEuYiDhbt69ojn9HnJQ3JHqugAgCXDEvz4pAv9kViHktUPnZv0q
	 s3s/lLp5y4D5Nz4DbddcepTtJekk8EBoIiqkdUGNwHSIN1W0Y9xbt22e5zMv8HGbLn
	 //KGSvWItTHo0iDtvW+MiXqbEVzFpknqzP+eWEoyJl3haLbvIwoleQws7OFWkj6ZmE
	 ktAg0icGIByE0XJvSIPBP0k8x87FriRZMg9pxHQE/W853xbYIEOL28V8ciCam6YNvu
	 vPCtm9NYoH0cA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 25 Sep 2026 09:48:00 +0200
Subject: [PATCH RFC 01/11] ACPI: irq: Return -EPROBE_DEFER on missing IRQ
 domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-acpi-static-table-irq-probe-defer-v1-1-2c62125d0085@kernel.org>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Robin Murphy <robin.murphy@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 linux-watchdog@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
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

acpi_register_gsi() might fail if the IRQ domain a GSI belongs to has
not been registered yet by the respective interrupt controller driver.

Return -EPROBE_DEFER in this case so that the mapping can be retried
later by deferring the probe for the driver that requested the IRQ
mapping.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/acpi/irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
index e4293458bf61..d1f1938c83bf 100644
--- a/drivers/acpi/irq.c
+++ b/drivers/acpi/irq.c
@@ -52,11 +52,13 @@ EXPORT_SYMBOL_GPL(acpi_gsi_to_irq);
  * @polarity: polarity of the GSI to be mapped
  *
  * Returns: a valid linux IRQ number on success
+ *          -EPROBE_DEFER when the domain was not yet registered
  *          -EINVAL on failure
  */
 int acpi_register_gsi(struct device *dev, u32 gsi, int trigger,
 		      int polarity)
 {
+	struct irq_domain *domain;
 	struct irq_fwspec fwspec;
 	unsigned int irq;
 
@@ -66,6 +68,10 @@ int acpi_register_gsi(struct device *dev, u32 gsi, int trigger,
 		return -EINVAL;
 	}
 
+	domain = irq_find_matching_fwnode(fwspec.fwnode, DOMAIN_BUS_ANY);
+	if (!domain)
+		return -EPROBE_DEFER;
+
 	fwspec.param[0] = gsi;
 	fwspec.param[1] = acpi_dev_get_irq_type(trigger, polarity);
 	fwspec.param_count = 2;

-- 
2.54.0


