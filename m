Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B4FCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 03:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNCNr5x3EzSqqtU6NP0iKEehA9J/yexioticfuX5tdw=; b=1IazoejNE0XnyVwzqeaOLkadQM
	8Q/zMQdeWTgYqhOKCQyfWN+j4OXcKLJwDKbsxo3otK04az5xe04L1T0mg1PsguqPn4iJe0A6nFvxU
	lkhOEzT256pEL5fBAXj5yjugKERwBI708ASV1kLX4LLhPhUE6OUxzLHI4Vdg9n/SR+HqgmpiDarMy
	/iJnyD7wMn2AzHfGH7oyikBWhnUUGB5xpWimSvoHn0NTIdXnRl9WrGbhRbJ3kgzzpaWThVaF0NpQ+
	PUKTjGdDcpV8KzEvC670nWQEuSfSO2YPK11LrhDd40LXiC54LY/py9+lsiRimrBbUfF7H0RRAOUZp
	SNNqEBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUydv-0000000G5tg-0PSG;
	Thu, 04 Jun 2026 03:21:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyds-0000000G5t8-2ikG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 03:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LNCNr5x3EzSqqtU6NP0iKEehA9J/yexioticfuX5tdw=; b=iUie9TD0Jl3ttEMwfdLPxUO9u7
	sOK5KuJgqH1RKQk2sTTh0jjP1ieh4To/8a8zEIyXKp9xniy0r/X+xLtO2iPGCyHDAgxwH8drNmlrE
	4NeFsnM/SLXlq6hn11bYiXSeGBcZQ13LKs+wEzht6SM8Y0kbgVm4uF2i8mcxyEFIrDxI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wUydh-005yof-UA; Thu, 04 Jun 2026 05:21:01 +0200
Date: Thu, 4 Jun 2026 05:21:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: mvebu: ap-cpu: fix missing clk_put() in
 ap_cpu_clock_probe()
Message-ID: <bdaf822d-a084-42ea-8fa0-01d9d9ea3385@lunn.ch>
References: <20260604025115.3763823-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604025115.3763823-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_202112_711617_6BCEE7B5 
X-CRM114-Status: GOOD (  14.12  )
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

On Thu, Jun 04, 2026 at 02:51:15AM +0000, Wentao Liang wrote:
> The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
> reference to the parent clock for each CPU cluster, but it never
> releases it with clk_put().  The returned clk is used only to read
> the parent's name via __clk_get_name(), and the reference is leaked
> on every successful cluster initialization as well as on the error
> path when devm_clk_hw_register() fails.

Is there potentially a different interpretation?

If the parent clock was to disappear, the clocks to the CPU would
disappear, resulting in a dead system. By keeping a reference on the
parent, it cannot disappear?

Also, do we care that much about the error case? If we fail to setup
the CPU clock, how much longer is the CPU going to run before it dies
a horrible death?

> Add the missing clk_put() after the name has been extracted and
> before returning on error to fix the leak.
> 
> Fixes: af9617b419f7 ("clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths")
> Cc: stable@vger.kernel.org

Does this actually bother people? It needs to in order to be sent to
stable:

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

     Andrew

