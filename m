Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE30CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnoRkmxCOsnpNNweD2fYCgajGFbsDIeSlUkdZHGlISs=; b=wJtJ9vBYN4IjxfOkiS++xT4yoI
	6zotrPJVgbkHbkIy5hmGA2NIrVCZ4o8QEIiVNt/Mx11A9AlaBcjpFHLoFCJuz+qhoBxCqo8yXx8iI
	/wO3mosEkV6QJG50HOhDwtMWD6kCaSe0zKCt9utpuTys2XG2m1EFkUolv9ZUV+y0Xe5NJ5H2ie329
	N3D3oQoCREkzGdMwT+v+Yv7/CAHrBaZMDm5CUAMe6smfZvnkI/7kdhB5ogWJOygbIeYYE837KmsXy
	p8W7nTJKnpvlltY608ja1rRMkRscQ28geh6VPdm+90+QtZhbW5PAtgLdBeNXq2xuSVNFlwsLpvgAs
	vM/DE9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbne-00000000DD7-0toY;
	Thu, 14 Aug 2025 17:31:40 +0000
Received: from mailgw-out1.grenoble.cnrs.fr ([2001:660:530d:201::44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZtj-0000000HRS0-1NqX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
	s=202106-grenoble.cnrs.fr; t=1755185381;
	bh=PnoRkmxCOsnpNNweD2fYCgajGFbsDIeSlUkdZHGlISs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gwu70pnVBHOmmdvpFPm3fohpywuDUu8SUQdH+LFyCc10KgnUyMf0C88TaUu34Qb67
	 gx2oalm2Zh2oL85qhXe12Or+DdldZ8k8xdgUWRCu5Qqj3vMWtOT4bhIzY9K5v2Dj9J
	 +dQFEO6JvMbycrmrzP0n2LbzU+tGO4cPMHHx4T6ll7QlbQtKdNY06CTqiWYZ+cCov9
	 ifkuYByvMNyPvBNNZneu36Dq1OYSLYPSsti6XNfu8zbbuuWbMPfsqfpnbjCqa8lbtZ
	 LnAuIsNbYkq57wI3V6Gx+N07SXaPZzlaVjvzH2fxXweAPyntF9ApwAYwthcWDHcTdz
	 1YSa7/s42dVZQ==
Received: from [147.173.65.159] (unknown [147.173.65.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id A128ABFBA8;
	Thu, 14 Aug 2025 17:29:40 +0200 (CEST)
Message-ID: <62be0896-6c90-4a27-81cb-7bd897d0e6f2@grenoble.cnrs.fr>
Date: Thu, 14 Aug 2025 17:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ISSUE + PATCH] Interrupts were enabled early by spinlock guard
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <280dd506-e1fc-4d2e-bdc4-98dd9dca6138@grenoble.cnrs.fr>
 <CAMuHMdWJ3im+k9uQgRhUh52Z_tJ+KQjAGY_Y8FjbEu6gB=0UKw@mail.gmail.com>
Content-Language: en-US, fr
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAMuHMdWJ3im+k9uQgRhUh52Z_tJ+KQjAGY_Y8FjbEu6gB=0UKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_082948_070971_56C24C1F 
X-CRM114-Status: UNSURE (   8.31  )
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

Hello Geert, and thanks for you prompt review!

> I think the conversions in
> drivers/irqchip/irq-atmel-aic.c:aic_irq_domain_xlate() and
> drivers/irqchip/irq-loongson-liointc.c:liointc_set_type()
> are also wrong, and need a similar change.

The one in irq-atmel-aic.c looks indeed strikingly similar. The one in
irq-loongson-liointc.c is slightly different though. Instead of:

    irq_gc_lock_irqsave() -> guard(raw_spinlock_irq)

it does:

    irq_gc_lock_irqsave() -> guard(raw_spinlock)

I don't know what the implications are though.

> Unfortunately I have no hardware to verify.

Neither do I.

Regards,

Edgar.

