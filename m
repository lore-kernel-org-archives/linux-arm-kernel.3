Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714F1C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdSnzmRSIMRrJG41fqcaaOo2w9Hy032pYE4C53FeAxs=; b=UrXEzopGbF5GqMo+lmoMFNFFXL
	XAuVJdBeI448UsFAKbDhxtnCIdyaL1GZFdl9rq+sFkl8aRcnvqk+yNaNSsglegrtgR10O5Vrt6v09
	iJl4FdGUSvu+6qKu6eZYsgPD4eq0HCZ2CY6JPmYQPt1pHBclvR+YCWe+Us26zgQo/Zc9L2xxkx3g4
	MxMzvyefI7Ib7I2yrjNAwc3Qr6SJLWmpT+OuM8bm66nIHwAhcEvp+JuAVW7FgRurVkcBsIrcrBwSt
	3vJo5mUN+FnCBHbuJrssze2J1pOP1uO51gbwF3qK3mBoMNMpfDJgVPHR2Wrc4/+rVdxJdeq2wWtov
	sLhg8bSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHRM-0000000BvDl-3Dpd;
	Tue, 06 May 2025 12:30:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFSE-0000000BYPg-2Jn3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:23:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746526993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdSnzmRSIMRrJG41fqcaaOo2w9Hy032pYE4C53FeAxs=;
	b=ZLVBTvNfJRqDpSW5AuqMtIdNH3yfH7+OYc9PQXTP0mBoLFMI/oLtwSPe4Naj2I1k1NhXGj
	lopU+UaNOlPSj3q4dYlVLfosgWonIjooDDFvc9yVtmeLcUf2UV0ce9nd+eIDseUJD4pY1m
	yCmgGT+d/e5ng7Rq+Cr3PMmpItaU/9smUrWbwwVWdybhatXI7GVPckm8lwBpy2EITD05w7
	E4yIQJFZBtdFddroz5cnOWaSTWJ0qx4XSMpUehSZsTDnyCjVfPw/y7wqHwQiazqucxsTsw
	3ltWdkjig7bo4mO/YSGtSU4qs1RHn1n6R3KuyTtGSvXHL52Wxn9Jc+t95MeroA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746526993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdSnzmRSIMRrJG41fqcaaOo2w9Hy032pYE4C53FeAxs=;
	b=tbFQU7Css3rbdpDQJ34WGORxdQwD+mC2pxuPT7mg+DNeGj2CckfeiZc4akapI2VkIVjzjR
	dSj8TG2c8I8mZWDg==
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] irqchip: vt8500: Split up ack/mask functions
In-Reply-To: <CABjd4Yx5O-ivpyZ3ewx5dfLPR2q7N9HU5t9-uOoEDZa3y2woFQ@mail.gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
 <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com>
 <87ldranq87.ffs@tglx>
 <CABjd4Yx5O-ivpyZ3ewx5dfLPR2q7N9HU5t9-uOoEDZa3y2woFQ@mail.gmail.com>
Date: Tue, 06 May 2025 12:23:12 +0200
Message-ID: <87bjs6nilr.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_032314_729480_48B822D9 
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

On Tue, May 06 2025 at 12:46, Alexey Charkov wrote:
> On Tue, May 6, 2025 at 11:38=E2=80=AFAM Thomas Gleixner <tglx@linutronix.=
de> wrote:
> Looks like the older commits I was relying on for the preferred prefix
> didn't follow the prescribed format themselves - oh well :)
>
> Ref:
> 0953fb263714 ("irq: remove handle_domain_{irq,nmi}()")
> 1a59d1b8e05e ("treewide: Replace GPLv2 boilerplate/reference with SPDX
> - rule 156")
> d17cab4451df ("irqchip: Kill off set_irq_flags usage")

These three are fine because they are touching multiple files.

> d2aa914d27f1 ("irqchip/vt8500: Use irq_set_handler_locked()")

> 41a83e06e2bb ("irqchip: Prepare for local stub header removal")
> 9600973656c6 ("irqchip: Constify irq_domain_ops")

Ditto

> 0beb65041e86 ("irqchip: vt8500: Convert to handle_domain_irq")

This one preceeds the standard format.

Thanks,

        tglx

