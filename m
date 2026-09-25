Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C8BC98326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF0dixNrgeRrqEBHGwyG3rSBg8PFvcFXKVkqUoBGccE=; b=c7biBZGETXumG5xJ75vqIzzr/D
	cP7YZ7KMSCUgRx43xRW5byRwhMMWH1dTixmthh7+NtsRNanRR2+GeptGc11wunmnyML+K5rHYFpzv
	d/RWSlRjuXD+gQ75IiO0rx4TFPIRo27KPPsl7r/fMWH0N92K4MtPZ46vdAS+CinW1N2kcIH/jIRfn
	24OHg8+q17GUKGFEpO3U6cVy94auGg29zU618RMJhy6LGgtjDMj1NwkoN2G6TbIPMXOXgbU4+31NA
	aFP1ap4svKqMINzZdw8yW8i5co4cH25IllQlw84qY46rP/xChb6X6cGaRNB15/giw6NtjBYHKEbxM
	gO2ERdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0g3-0000000Cqok-2KZA;
	Fri, 25 Sep 2026 07:49:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0fy-0000000Cqkw-3nh4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:48:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AAF160230;
	Fri, 25 Sep 2026 07:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB0E1F000FF;
	Fri, 25 Sep 2026 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790322538;
	bh=sF0dixNrgeRrqEBHGwyG3rSBg8PFvcFXKVkqUoBGccE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oKrj8br+yyMGql6WAL28O44NGK9xg8+/0v/QTJcWDf9KP3WBbObLMOYATX4qBOdX7
	 VVjPsOTLmNNU7ZMHKf3B1AKww1WJ7sYjHbGEn5PQIM7Wx4zEKS6HGL+l6/ZTrAmrii
	 uutf+YHiOGMFiaY53JnxWU1xTi7Fs98aZcEXhD3NbY728tEkMffIGUvsejxkSBGisw
	 T0HXt4uPQrgGMKJGu6ON3dSM7OLieUukGWaeekCJ6eVons3/fguR2xFEAqZZ0vjjQX
	 w8IfLVzdPfoPEWlnf8kA05rOF/hmQL0y/jvld+6202JvbmR7HKs9Lzgxoj/eu6QXTg
	 MUdBDTM/E23aA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Fri, 25 Sep 2026 09:48:07 +0200
Subject: [PATCH RFC 08/11] watchdog: sbsa: Handle IRQ probe deferral
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-acpi-static-table-irq-probe-defer-v1-8-2c62125d0085@kernel.org>
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

The SBSA watchdog might be wired up to an interrupt controller whose
device driver has not probed yet at SBSA watchdog driver probe time.

Handle probe deferral in the IRQ mapping code path.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
---
 drivers/watchdog/sbsa_gwdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index e04d42cc7774..f4491409caf5 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -352,6 +352,8 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 
 	if (action) {
 		irq = platform_get_irq(pdev, 0);
+		if (irq == -EPROBE_DEFER)
+			return dev_err_probe(dev, irq, "failed to get ws0 interrupt\n");
 		if (irq < 0) {
 			action = 0;
 			dev_warn(dev, "unable to get ws0 interrupt.\n");

-- 
2.54.0


