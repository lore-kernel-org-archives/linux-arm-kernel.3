Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ED0C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmIM9bL+9pYqApP4iiFLa2aJhHWBMRN4cnMPPzQ7Uuo=; b=U+mD2LjF4L/opuVjWK/hMwkEgl
	0vlKEHp0J2KFJKz1YuvbKxF2Yb37qHpdAkZ5wXyki1uVsD20556lRtzIxPrfMS8GyVBR235aUKAHw
	JHI81TuOJ9KRd+Rvbib7c2187wBxEyquAoTO0VRSS9BZ9AQtIJI4p7LMm2cpvx01Rwlg0EuAUnUjT
	eQGrbKID4i9WjxfhlELLMollZjCnRkjYvSm+0lMoEowDG/BqahzCuzRL3Qkb8qPsvjGtKGXf+1yIA
	NMlQ6RN7LDmwhXDbGNR21bYMNA4zj7Qlh6Bg2H9Gmw98H/dkwCzb2WT1Z9Az2Z+Zw7dl8CjNhZCBA
	8O8uolnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgnQ-0000000FzYw-3bth;
	Wed, 07 May 2025 15:34:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgCt-0000000Fs5I-2x0K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:57:12 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746629828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmIM9bL+9pYqApP4iiFLa2aJhHWBMRN4cnMPPzQ7Uuo=;
	b=c3w6h9UCZfwIuuS3NCJZL6VICMiK/xZO9n6BXRGzZTeB8JGqEKsYIIJQEd+sCKVnjzB0mx
	Ut1PYkFchzhx9Hx8bDfwGnfRQrKm+oWIvMKhDIg9J0GkO5XbC06KybHbF9EmCRGmjm69D0
	7dHULGK9bVsIrb1YwTPdTvaS0TGFHrIA+q/v7BLB6QENoRF/k52oMT9bGEDnYQWKxBLOZD
	UEMESZJFZ8aEPFPnqnAx1yzpx7hQHLpEMgQDuxfabwD0Z6qYGzguk9UKrbJpvkVZWi+QjD
	j5dWMGyUKfbo8NntAtEVhu8ZsfSDLGC+j/sgbi/V55iFV01xcbV+yyqxYkUOaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746629828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmIM9bL+9pYqApP4iiFLa2aJhHWBMRN4cnMPPzQ7Uuo=;
	b=uhSJSd9k2sw9XI3tMkhm2D2DL5P+4G6hR5bf0vhvXUMS5HskOI3vlbVGHn1v576LCoIznP
	Fn6GgNvNKNPOdoAQ==
To: Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
In-Reply-To: <867c2sh6jx.wl-maz@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org> <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org> <87ecx0mt9p.ffs@tglx>
 <867c2sh6jx.wl-maz@kernel.org>
Date: Wed, 07 May 2025 16:57:07 +0200
Message-ID: <874ixwmpto.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_075711_878489_049079F9 
X-CRM114-Status: GOOD (  14.68  )
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

On Wed, May 07 2025 at 14:52, Marc Zyngier wrote:
> On Wed, 07 May 2025 14:42:42 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> 
>> On Wed, May 07 2025 at 10:14, Marc Zyngier wrote:
>> > On Tue, 06 May 2025 16:00:31 +0100,
>> > Thomas Gleixner <tglx@linutronix.de> wrote:
>> >> 
>> >> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
>> >> tests for level, no? So the test is interesting at best ...
>> >
>> > There is no distinction between HIGH and LOW, RISING and FALLING, in
>> > any revision of the GIC architecture.
>> 
>> Then pretending that there is a set_type() functionality is pretty daft
>
> You still need to distinguish between level and edge when this is
> programmable (which is the case for a subset of the PPIs).

Fair enough, but can we please add a comment to this function which
explains this oddity.

Thanks,

        tglx

