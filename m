Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4D4CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUA1o5WQQPVYysu6WcIr2xDXJWQfyRSq8an7IHzsYEE=; b=mbZLv0ppBUIdj+dJNgvEffXhgs
	wyjQgC1O+Ql5Zu/YwoLvYZXgyn7V/XaCKdt2KktWBdx0Wy8g4rOfjMAwccps7jauceZD79RlU3+Rr
	KaGHk3KJ1ehXxz3RZLyvSo+cbSSgBixLN0hJzSxSBtVvxKydJ7iLWJbiIDtxPmDOOWIwmcV1MLvpp
	PK4wJFHIabSbJrr7jINmQEqQ8Lk4BELQeFIdgwP0g53diazEtBpkFyMg10KzOmXeJIjcnw5X+V62j
	kdvyZZXdYTGkgO3Gxg3cbi0lliUpbg8Yj+qRxJTSmbKzz40QXuipo2RnZP8gFKuxCxAmwMgNhRIcA
	P45YL4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBc3W-00000003g1M-0A1K;
	Wed, 22 Oct 2025 16:51:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBc3R-00000003fvy-3487
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 16:51:19 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761151875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lUA1o5WQQPVYysu6WcIr2xDXJWQfyRSq8an7IHzsYEE=;
	b=Nqsays2hvm/reEWnIZrs8JhsUsg2zUkM/2uo8+YG41VXqxyQQ1CT3VgfvcY+b6AdwvQYhs
	HWKh2W/lUm9zJS8k5BRyooIyqgtDW+PU7nWRhla+3IT9N6jmAta78739L09hWPW3njYMtU
	538GG4UGTC7n19+Nii0VUo2omyMs2fHgQZ+DXhhdUIIAtlPrzlQiKSxhub64Zf0illoXrM
	w5TKi3Ju5ZVOhjkterp14xfUnq7j8Wlk8sn33R6zRf/9rqnjr+e6HBUo65qCRL08d8kreg
	ymYIQaHM55yYx3Zg3jY6HmOFUBRiPqbXmF0Y72w/ihlPxgr+hjodhdQF+lg4nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761151875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lUA1o5WQQPVYysu6WcIr2xDXJWQfyRSq8an7IHzsYEE=;
	b=H8V01t+vilrR5cMR7J0tB7Xfvt2kU0XLpQcjAXHtBbLM2cMov/9lAM8oE4vvpZNROE9KpJ
	A1JLrIbDatJvefDQ==
To: Ryan Chen <ryan_chen@aspeedtech.com>, ryan_chen
 <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 jk@codeconstruct.com.au, Kevin Chen <kevin_chen@aspeedtech.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v5 3/3] irqchip: aspeed: add compatible strings for
 ast2700-intc0-ic and ast2700-intc1-ic
In-Reply-To: <20251022065507.1152071-4-ryan_chen@aspeedtech.com>
References: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
 <20251022065507.1152071-4-ryan_chen@aspeedtech.com>
Date: Wed, 22 Oct 2025 18:51:14 +0200
Message-ID: <87ecquyj5p.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_095117_917455_F939EB1B 
X-CRM114-Status: UNSURE (   9.26  )
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

On Wed, Oct 22 2025 at 14:55, Ryan Chen wrote:

The subject prefix is: irqchip/aspeed-intc:

It's documented how to make them:

   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

> The AST2700 SoC defines two parent interrupt controller blocks
> (INTC0 and INTC1), each containing multiple interrupt-controller
> child instances ("*-intc-ic"). The existing irqchip driver
> (irq-aspeed-intc.c) currently only registers a single compatible
> string: "aspeed,ast2700-intc-ic"
>
> To support device trees that describe the INTC0 and INTC1
> hierarchy more precisely, this patch adds two additional

s/this patch adds/add/

git grep 'This patch' Documentation/process/

> compatible strings:
>  - "aspeed,ast2700-intc0-ic"
>  - "aspeed,ast2700-intc1-ic"
>
> Both map to the same initialization function
> `aspeed_intc_ic_of_init()`.

The backticks are pointless. Just write aspeed...init()

Thanks,

        tglx

