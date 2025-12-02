Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B13FD11700
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKM9jRfzB1w101ZpOkwBUlzi/AHr5lCMqzZrxDasBBw=; b=VehF3GLTRJlSfh43V903eRM8LT
	bDM2pFoaDmGHt4AQRw2rt6ELVJMdKzaSmJOLMeE8bEZF8zO71a3U8Pm/QPxI0brKtDjOS91PUXiFi
	ThT8mXzLdKS6RJCAXthaZU0SqPLU+haI3KhQ3xcx9J2QJepaK6LUiwceYBCsu27mo+pWagB0vwomj
	7LZJuCmuLy3QUD8y35mkhaKedA/4rnu1iwdhyqyukn9E6jZFoIURt+lwfyMDRxT1e88DHIuO7tKLM
	EVypAO+VdEGUvAKDFMav3p58IlWaGKyEfuHZmqiQZWjO3CAZB3PkNBq3L63zgf6eQFApGNZsC5D3D
	GJKAX13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTDC-00000005cKx-1qx4;
	Tue, 02 Dec 2025 16:26:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTD9-00000005cKS-2TTd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 16:26:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DD3B1477;
	Tue,  2 Dec 2025 08:26:34 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15F4D3F73B;
	Tue,  2 Dec 2025 08:26:40 -0800 (PST)
Date: Tue, 2 Dec 2025 16:26:39 +0000
From: Leo Yan <leo.yan@arm.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Breno Leitao <leitao@debian.org>, linux@armlinux.org.uk,
	paulmck@kernel.org, usamaarif642@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, rmikey@meta.com
Subject: Re: [PATCH] printk/nbcon: Restore IRQ in atomic flush after each
 emitted record
Message-ID: <20251202162639.GD724103@e132581.arm.com>
References: <20251202135832.156559-1-pmladek@suse.com>
 <87o6oheywd.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6oheywd.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_082643_662415_2D973972 
X-CRM114-Status: UNSURE (   8.64  )
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

On Tue, Dec 02, 2025 at 03:39:54PM +0106, John Ogness wrote:

[...]

> I am not really happy about all the local_irq_restore() usage. Using
> guard syntax would be nice here, but AFAICT there is no guard for
> local_irq_save()/_restore().

Sorry for suddenly jumping in.  Wouldn't guard(irqsave)() be helpful
here?

