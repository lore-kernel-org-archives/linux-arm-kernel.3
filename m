Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7354CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJpOTYwvDG3D2TIt6ZDHbyS4c1jReWTrO2eshfPm5Xg=; b=vfHeOIlhYbjPefibfs/UftpTLM
	68T08HrrGz0cJzuS3Db3Nw6VQwz0jwevhpiq3V//0YmPApjuc6B8xSUl2CUhSgOna7rvrjMURXfik
	IaUr7sNKKUiCDOgRSVAZZLX9zPySZyuvg7keKoc+T3zk+Swsbdys3tROMGqw7KX+/ddx3XTDfauNx
	Nn+cv5Guw05waP1uYa3nuJJE3F1SJ/2kKz3Pi7puSYa1/eW3zIjn0/qh4kGkk5potUT4RoW5Gi5qn
	gxsPoisSmgoZdTnjYghthVFpPporNWo2hGO0MboMjZ5AgAZdLwCII9CA+AQR6nweGeVWSluths0yU
	c2hvunbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYIo-00000008PcH-2bjL;
	Tue, 16 Sep 2025 16:13:10 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYIm-00000008Pb7-18Dl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:13:09 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cR6LY5b0Tz6K9Hp;
	Wed, 17 Sep 2025 00:10:13 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C65D1402F1;
	Wed, 17 Sep 2025 00:13:01 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 16 Sep
 2025 18:13:00 +0200
Date: Tue, 16 Sep 2025 17:12:59 +0100
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
Subject: Re: [PATCH v2 13/25] genirq: Factor-in percpu irqaction creation
Message-ID: <20250916171259.000070d2@huawei.com>
In-Reply-To: <20250915085702.519996-14-maz@kernel.org>
References: <20250915085702.519996-1-maz@kernel.org>
	<20250915085702.519996-14-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_091308_452962_4B03F8BB 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

On Mon, 15 Sep 2025 09:56:50 +0100
Marc Zyngier <maz@kernel.org> wrote:

> Move the code creating a per-cpu irqaction into its own helper, so that
> future changes to this code can be kept localised.
> 
> At the same time, fix the documentation which appears to say the wrong
> thing when it comes to interrupts being automatically enabled
> (percpu_devid interrupts never are).
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

