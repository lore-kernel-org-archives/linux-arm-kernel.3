Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D3DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tbBvobeMHBrl6FvwhkQCiAxn3VsG3mnBLm9G7/wAJo=; b=LLYaqBOvSFelPXwuHGeSMN3i0K
	LY1sX9Q48tAD2ClSW2njlrjhiD2692AdVcsCoPdEmeFQzVRQm3Pf5e2Ct1aMNej6zBz4W7ZWwr1qh
	e2S/0D27/0DmX3jdjBoW/ovDOcgxVUwdLyMZUhbgDND6zbOiv0UgKmoUSvCI/DoV2o+9x5aL2Y+AB
	3X7iKC/lCsijmDkrwkYMdGAhAhvz77RrnNpwaqy32s7CBVCF0mGy0r9XlVfpiAQKPyrRoz1hfV7n7
	vSvio/HN52m9qhWI37MvaNuFk8P/d784yPZiP5QBO2VQFkSzMC5nA/n0KzJ55RBwBiywsyjVliRcS
	QFKipHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXON-00000008G0J-1bR7;
	Tue, 16 Sep 2025 15:14:51 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXOK-00000008FyW-26Ai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:14:50 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cR51H4rn2z6K6F8;
	Tue, 16 Sep 2025 23:10:11 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E3CB31402F5;
	Tue, 16 Sep 2025 23:14:40 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 16 Sep
 2025 17:14:40 +0200
Date: Tue, 16 Sep 2025 16:14:38 +0100
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
Subject: Re: [PATCH v2 01/25] irqdomain: Add firmware info reporting
 interface
Message-ID: <20250916161438.00007ba0@huawei.com>
In-Reply-To: <20250915085702.519996-2-maz@kernel.org>
References: <20250915085702.519996-1-maz@kernel.org>
	<20250915085702.519996-2-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_081448_683141_1C9D6522 
X-CRM114-Status: GOOD (  18.65  )
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

On Mon, 15 Sep 2025 09:56:38 +0100
Marc Zyngier <maz@kernel.org> wrote:

> Allow an irqdomain callback to report firmware-provided information
> that is otherwise not available in a generic way. This is reported
> using a new data structure (struct irq_fwspec_info).
> 
> This callback is optional and the only information that can be
> reported currently is the affinity of an interrupt. However, the
> containing structure is designed to be extensible, allowing other
> potentially relevant information to be reported in the future.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Hi Marc,

> ---
>  include/linux/irqdomain.h | 28 ++++++++++++++++++++++++++++
>  kernel/irq/irqdomain.c    | 32 +++++++++++++++++++++++++++-----
>  2 files changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 4a86e6b915dd6..34993bf8293c4 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -44,6 +44,24 @@ struct irq_fwspec {
>  	u32			param[IRQ_DOMAIN_IRQ_SPEC_PARAMS];
>  };
>  
> +/**
> + * struct irq_fwspec_info - firmware provided IRQ information structure
> + *
> + * @fwspec:		Firmware-specific interrupt specifier

Not aligning with what is in the structure that I can see.

> + * @cpumask:		Affinity mask for this interrupt
> + * @flags:		Information validity flags
> + *
> + * This structure reports firmware-specific information about an
> + * interrupt. The only significant information is the affinity of a
> + * per-CPU interrupt, but this is designed to be extended as required.
> + */
> +struct irq_fwspec_info {
> +	unsigned long		flags;
> +	const struct cpumask	*affinity;
> +};



