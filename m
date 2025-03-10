Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C69C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ly81vQvGXLIQAxg5uok81uLig8KVjTlFKKgmBlnmwM=; b=Mox2vpBjI5aucxSwtTVU0BDsb3
	6JijBJ/L/iSOj59L2ot2WWC4YAstS6i2rNzNKuV0FXIsviUiKAMRrkYGklLzYIRiMlbRaRuJsqXzO
	AWPgp9SIl2dhdnr0OFjK+wq6x3zXJXxV6CszTOdyffUYMWIvxXljLrCDrqEk6raaAVRJQuWhchoBX
	ToFiiE7CCVTAprTi7tR+sguQ/WjzOPgrQPszDgIvVORnVlxqNb9fU8zE24WN6d5XFZKWe5yrORZXF
	Si/FYM82PWCluK48g94p2IW6FZdzdlADuSEr4XkAUxgPulBWtnX+9EueDNwY3ees1vjqubF/yZt7r
	ICikAHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhRi-00000003YSt-0ehc;
	Mon, 10 Mar 2025 18:01:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trhOx-00000003YCU-1m6M;
	Mon, 10 Mar 2025 17:58:56 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741629534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ly81vQvGXLIQAxg5uok81uLig8KVjTlFKKgmBlnmwM=;
	b=j//qbsSwkuy/0qqOlBzR/DCCFBWPkp8dpqdoEsmmHRzZS3qU6u2n2wupSWSz6nM1dpuUri
	aiLxBe/uYDvzyTjKz0ZvnjLnA1uv9j3zNWECtlFN2n6PjkVPVNkGSaBLsY7jNRCa0oHt+Z
	TR4Et6ZYlJTN7ceEdWzvdd+J49x8+htWKzrawqyGXmwAEbf9cOxCjQmiuZeoUQK7lu/o09
	8w+CMSlbnB87sxTKWO5zeS0E+NAL/NZf0OenWsDqsF7VPTwh+A9VeKwvzjemMYwQ83IXaS
	LkW1H8ID12Cw/KuajwYfbJJaPkUKhk+vx63TXUbvqVyJ0nozoB4BKQ0FKBZ3zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741629534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ly81vQvGXLIQAxg5uok81uLig8KVjTlFKKgmBlnmwM=;
	b=tay6z8piYzjYTDcVT49X42zfRg7CquVlxe7fBfutBqZbIPgXozgKkKf1wQKrMY9lhcs+Eg
	x0hweM8q8QaQwsAA==
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH v4 2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
In-Reply-To: <20250307-irqchip-gpio-a4-a5-v4-2-d03a9424151b@amlogic.com>
References: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
 <20250307-irqchip-gpio-a4-a5-v4-2-d03a9424151b@amlogic.com>
Date: Mon, 10 Mar 2025 18:58:53 +0100
Message-ID: <87ecz422ea.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_105855_604678_E24592DA 
X-CRM114-Status: UNSURE (   7.68  )
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

On Fri, Mar 07 2025 at 16:49, Xianwei Zhao via wrote:
>  
>  	if (type == IRQ_TYPE_EDGE_BOTH) {
>  		val |= BIT(ctl->params->edge_both_offset + idx);

Not new, but this really should be 'val = ...'

> -		meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_S4,
> +		meson_gpio_irq_update_bits(ctl, params->edge_pol_reg,
>  					   BIT(ctl->params->edge_both_offset + idx), val);

and this BIT() calculation is obviously redundant as it is the same as @val.

Would be nice to have that cleaned up.

With that fixed:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

