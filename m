Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52D2D74EE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IS3nwot2OqWqAU1uCJl4UcTnVk8TTT3SAt+UhWSW9rg=; b=yoZCj0ravOkZX1E65Hq1oN2dKe
	1JV2Aedz5v6HqwlvAxm/Ueq89QU/jLrg+K7KZFkNri9Wt1HqofaK36U6aK95pqM0wn6Myke08gdx9
	pcaqyGSuSTCCAfKxOE9BerDopUkFU/3RfysqWPA0JyO3plfvFXFNnMObcOKyKPOdUdlAPX+H43+sg
	LncDkl9t0m1J+NQIUaaPc4hAhBLMoRR3zhfJFrQ0uNRwyE8xPYf7XHGSPUW1jAnM7TtihqFcB4iv4
	JnMO0u13F34HAQTDxjnktTh7QpiEHlPU4Aq9ozhPkHMAsN7gDX8swMBJXQfh68zQBT5+b9UPmU7fe
	aAEuQLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJ3t-000000096Kz-1o6N;
	Fri, 23 Jan 2026 15:27:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJ3q-000000096Kg-3Lmb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 15:26:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B56F91476;
	Fri, 23 Jan 2026 07:26:48 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.25.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2C163F632;
	Fri, 23 Jan 2026 07:26:52 -0800 (PST)
Date: Fri, 23 Jan 2026 15:26:49 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/21] ARM: versatile: Remove IRQF_ONESHOT
Message-ID: <aXOTOSAGFf_aqcpa@bogus>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
 <20260123113708.416727-9-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123113708.416727-9-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_072658_878609_5D4E114C 
X-CRM114-Status: UNSURE (   9.07  )
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

On Fri, Jan 23, 2026 at 12:36:54PM +0100, Sebastian Andrzej Siewior wrote:
> Passing IRQF_ONESHOT ensures that the interrupt source is masked until
> the secondary (threaded) handler is done. If only a primary handler is
> used then the flag makes no sense because the interrupt can not fire
> (again) while its handler is running.
> 
> Revert adding IRQF_ONESHOT to irqflags.
> 
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

