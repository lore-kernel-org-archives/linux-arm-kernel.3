Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082A9CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nayxT3P0WxNh7Qef2JOyWRC/xZuHS1m0eTIXFhKLeAI=; b=GBQjs427SEI2DQp/wY/AgJGrwm
	zf2CSm9daMtByq/zki0R5Uy9xEepPd6UZIVw0yeVUd2TvoAq0WP/4+hSeiYWFarsWgq0nBc05YWO6
	59TnIBNsoEqsKt/gwDLBcw2zsoGXhkorJVcYiUAyJGJ0azALJia/sULey3xKjjfmF0ggs7EGqrr1C
	G64Pu4JUx4lPJAlK4PsZedd5zdjQAsw+ktT7Gtl7EOAVeRe+8/jHQ7ncJ8mP6XwvUZqny6wjpYOfH
	veEC0Y7ZDvYS+3xFBeQcmmXCvLbi/7iyXzQ4Gu5FkPQ2HL0aImvVGkD9LM2ue8W+DHMezRvQJ7rbR
	zs1l4lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXlY-00000008Jwu-1FH6;
	Tue, 16 Sep 2025 15:38:48 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXlW-00000008Jwa-0nE6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:38:47 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cR5Zx1tSCz6K9Kp;
	Tue, 16 Sep 2025 23:35:53 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 864E9140517;
	Tue, 16 Sep 2025 23:38:40 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 16 Sep
 2025 17:38:39 +0200
Date: Tue, 16 Sep 2025 16:38:38 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Mark
 Rutland" <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
	<j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
	<james.clark@linaro.org>
Subject: Re: [PATCH v2 11/25] genirq: Kill handle_percpu_devid_fasteoi_nmi()
Message-ID: <20250916163838.00003791@huawei.com>
In-Reply-To: <20250915085702.519996-12-maz@kernel.org>
References: <20250915085702.519996-1-maz@kernel.org>
	<20250915085702.519996-12-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_083846_371553_FF625B78 
X-CRM114-Status: GOOD (  14.18  )
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

On Mon, 15 Sep 2025 09:56:48 +0100
Marc Zyngier <maz@kernel.org> wrote:

> There is no in-tree user of this flow handler anymore, so simply
> remove it.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index 0d0276378c707..869068ec6ac91 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -892,7 +892,8 @@ void handle_percpu_irq(struct irq_desc *desc)
>   *
>   * action->percpu_dev_id is a pointer to percpu variables which
>   * contain the real device id for the cpu on which this handler is
> - * called
> + * called. This is also used for per-CPU NMIs, so special care is
> + * required.

Probably belongs in previous patch as not really related to removing
the unused code, but meh.

>   */


