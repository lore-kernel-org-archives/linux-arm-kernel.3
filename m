Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F28FC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd+dZt0TGOfSnvGdfX5pWssQ2kt71o1V7ndjsLYU/Cg=; b=p+mJLPx+XJeIYCFyXTMGslkDZ8
	rJ0L5iNdYIEqpbA8BVN2Up2qQyCn0RHCi3/VxuQev2bEtd+ODMzIIKcvNljH6LFPHwi3J8AxHesB6
	aq1DvdBuE/uiRdsTnRKcbD7I8dAdK0Qr6cYVU48ziN6Xa8SVDTF4z/lmK+2eO9Pq9wrWvfGuQzcOK
	+0X8Jo+oDfUD4xYgYRirExj3Nw3o2+IrgabONCiwh4LTloOxaAJRWLGmZlJPeIHpaZPFjUWq8sK30
	IIclMB8lZhWNOQCEzYojKJUVjUkOy7dnFapQiWTMZLjal5r58J6e7mxTJpXA7isXG68xveyIwd10q
	scTAnTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fY-0000000CqY2-3lMt;
	Fri, 25 Sep 2026 07:48:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fX-0000000CqXD-3hZL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:48:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 563E460230;
	Fri, 25 Sep 2026 07:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E811F0089A;
	Fri, 25 Sep 2026 07:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322511;
	bh=Kd+dZt0TGOfSnvGdfX5pWssQ2kt71o1V7ndjsLYU/Cg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EmM9nHBJh+OcO5MwAG4LEsWCl3ouslsYXNccQTR83Ktcn2tX0V8conmSVpTcdKEU2
	 gSZeYQrCFObBNcon+V11zSMh1XN0zLhpPkh9v47JNk1NAuTRP/ENVgKrVNjpaSzfI0
	 18T4EgGv0vQtoN+i4oxN8YfCzq84CHEWgrNoguJ1obInjJ6p04jxCn+BrSw/UEMSaU
	 Ihs28+r2pz5zD4XUynRtOQHnRi1yKEZCp6y48eX50hFm/C3uz9u3T27LEN/79fg/FS
	 xty9eK0M76tjTycIBb8s/k2matL//IZZy6j20JGZkcVqmQxSOjsFBZjulPEMiWS9Ju
	 +0ejV76Gg1cWQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 25 Sep 2026 09:48:02 +0200
Subject: [PATCH RFC 03/11] driver core: platform: Add static ACPI nodes IRQ
 retrieval/mapping code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-acpi-static-table-irq-probe-defer-v1-3-2c62125d0085@kernel.org>
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

ACPI static fwnodes types are not contemplated in the current

platform_get_irq_affinity()

implementation that is there to retrieve and map IRQs for a device.

Add fwnode_irq_get() to platform_get_irq_affinity() for static ACPI fwnodes
to overcome this shortcoming, enabling IRQ retrieval and mapping for the
ACPI static fwnode type.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/platform.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 66f9ec73d47e..413c73332308 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -228,6 +228,12 @@ int platform_get_irq_affinity(struct platform_device *dev, unsigned int num,
 		goto out;
 	}
 
+	if (is_acpi_static_node(fwnode)) {
+		ret = fwnode_irq_get(fwnode, num);
+		if (ret > 0 || ret == -EPROBE_DEFER)
+			goto out;
+	}
+
 	/*
 	 * For the index 0 interrupt, allow falling back to GpioInt
 	 * resources. While a device could have both Interrupt and GpioInt

-- 
2.54.0


