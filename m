Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83044C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw2Q8IErZl7b2iE4osU+g+AbXrA3g7lMnn18YWn6OGA=; b=DyZsFrdwmA+VnmpMCh7KCmIZSV
	3OYXfw0OaZ+szXrqvkww8vB9rQAst9LAKlAUHgxwKK5sqqz/5HWR3Urvw120LY+QTvH1vUUBNez5M
	TUU8mlsllZguznyLo/XqpvI87xqh4SK+q+2LmFQyHipyzHmNl+p8x5mlBWlv9/nZQayux7amJpgIx
	3FeuB3D5mdwH8rnlw6T59lHuhPzpIrBrj5hnxGBBrNpSglWaDh7IQxR8cP+NkGXx7Zm7JIKax8Olp
	6jsOv+yUaxC8sts4Ki8lCM8gnw1lWt4gqS7lRWgw8ySUVFk7lydaygxQc3hm3vGSzkwpsXhS/3GvR
	Bci/Xy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MlH-00000009Gq5-3A1m;
	Thu, 03 Apr 2025 15:45:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MjT-00000009GbM-1qiH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:43:56 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743695032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zw2Q8IErZl7b2iE4osU+g+AbXrA3g7lMnn18YWn6OGA=;
	b=dFWiJT0FPb501rI4xZxAByeZrueh0d+1tmsohsU10/skaN4SqFYNYnNUBrxpwGfwv6ZgFe
	sRGiTo7ylfSy8Ansnahrr1ZZ/GGkol94OFKkcdGM6NI6cZg0b3rzO+I8Cx/6v/yUkgQza0
	lT9KtmHQ61kb1AX+T8hP4C/RMdBbpv+jJFqYMR9t47lLg+ao9k9Gh9sl5n8MaRm3bmf2Jv
	tqp7J++dTsLFYelx0UX0mA5+w06DJY45qs/FCA6WG1SKALnZZrs7LeN5kJzhbRBFQdHevE
	HpJIUFwbhOtGkX4c3pD1LyWqRZEy7x/rNBcowLk0kP0k5KGjgmtsQpWuLiF6Zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743695032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zw2Q8IErZl7b2iE4osU+g+AbXrA3g7lMnn18YWn6OGA=;
	b=v8VAC7w3EX8v79DHy2WTqiCxnEnOI+yD68u3RIJprG8VcGaUoghq9uoYwhGbQp8UrheL3f
	SKmG2quvzSHdxNBg==
To: Christian Bruel <christian.bruel@foss.st.com>, maz@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH 2/3] irqchip/gic: Use 0x10000 offset to access GICC_DIR
 on STM32MP2
In-Reply-To: <20250403122805.1574086-3-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
 <20250403122805.1574086-3-christian.bruel@foss.st.com>
Date: Thu, 03 Apr 2025 17:43:52 +0200
Message-ID: <87mscxuu6f.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_084355_625589_F3EC8534 
X-CRM114-Status: GOOD (  13.91  )
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

On Thu, Apr 03 2025 at 14:28, Christian Bruel wrote:

> When GIC_4KNOT64K bit in the GIC configuration register is
> 0 (64KB), address block is modified in such a way than only the

s/than/that/

> first 4KB of the GIC cpu interface are accessible with default
> offsets.
> With this bit mapping GICC_DIR register is accessible at

What's 'this bit mapping' ? This sentence does not parse.

> offset 0x10000 instead of 0x1000, thus remap accordingly

...

> +/*
> + * 8kB GICC range is not accessible with the default 4kB translation
> + * granule. 0x1000 offset is accessible at 64kB translation.
> + */

I have a hard time to map this comment to the change log, which suggests
to me that this is the other way round.

> +static bool gic_8kbaccess(void *data)
> +{
> +	struct gic_chip_data *gic = data;
> +	void __iomem *alt;
> +
> +	if (!is_hyp_mode_available())
> +		return false;
> +
> +	alt = ioremap(gic->cpu_phys_base, GIC_STM32MP2_CPU_DEACTIVATE + 4);
> +	if (!alt) {
> +		pr_err("Unable to remap GICC_DIR register\n");
> +		return false;

That's a hack because in case that the remap fails, this leaves the
thing enabled, but disfunctional.

Thanks,

        tglx

