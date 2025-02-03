Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79560C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 14:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J85aJuJVnCtJF5A7o6Xk9eZppKHaaO4RuNSzWv4mXis=; b=KMo2I73iFV6FE90nqiIjqJ0Bob
	ws/ijQqfTh6ftVsXIbMM8pFp2NhHqg05uX6stmtF5geWtD8dnBuOf1GZmMpbkZz5qQoPBCDGLZJtR
	iAsSF6yV2xSCCdXKF8Eogrg/5/f53xY/jrV2EdBK5oNbk9S+6MLzCMm+fW5fA14Y7P5JL6E/hEquy
	fOk0bKq/G1f8B6TNM16mmtjTS7ob+euXAXudS13jyWr7f4CwyCBth70NV9E/dhn024AI+ohMIfRnT
	UnKL9rvl8uP47yGE7KqiVwmN0jf1qVyERgMBu/t7VzdvhGzXdX7a+6ZT8j3O4LCZgELjehagyT5H/
	2gXQ3xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texJj-0000000FeCq-0jYd;
	Mon, 03 Feb 2025 14:20:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texGn-0000000FdcM-3AmH;
	Mon, 03 Feb 2025 14:17:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738592268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J85aJuJVnCtJF5A7o6Xk9eZppKHaaO4RuNSzWv4mXis=;
	b=Mf8dvdSfuCus0IcvuuE5SN1Zl0DFclaAOSmSDUPvlBIzIb3XYgoP7bFYtytu0JuQhQ8vMc
	tAWVKC2ttVgKRJOdjfT09T/8NjB5PmdtLbZHNIObKtUDoL/fdIC+5CUgvvNJVQqq6fLmYL
	qjMq6iP4uu+mtYcHjXp64k9s95PiJ04xGIJwJi7gwr28jDZgoUmi5vxvF5FvYVbFAwFFbA
	kbknquNU4xeTXnGWhamxjUEOmLZGU1yvE36fZa4ukglnKUnZ8CjV+kKwKvhe4S5lLTJjI0
	sDW02M+ZDNzYq0gZ2XdGa8tbYZoSjqZ5cuBjJJlIn7XJoEO8Y7gZ4zS789rvMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738592268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J85aJuJVnCtJF5A7o6Xk9eZppKHaaO4RuNSzWv4mXis=;
	b=Mafj2AVKQixDU9txGK8CdHh1AG0JOnfTDQPBdQG03PJFTImSaoxh+QBrJGMJCIZqlQhtLI
	spX3B9cl0wUjMNAA==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 00/11] RISC-V IMSIC driver improvements
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
Date: Mon, 03 Feb 2025 15:17:48 +0100
Message-ID: <87tt9bnmcz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_061749_931761_1CC527E3 
X-CRM114-Status: UNSURE (   7.26  )
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

Anup!

On Sat, Dec 14 2024 at 22:55, Anup Patel wrote:
> This series is based on recent discussion on LKML:
> https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/
>
> It primarily focuses on moving to RISC-V IMSIC driver use common MSI
> lib and GENERIC_PENDING_IRQ.

Can you please respin this series on top of rc1?

Thanks,

        tglx

