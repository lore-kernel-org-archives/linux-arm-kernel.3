Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB246C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 19:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgM7t7aU9HoxT1zgrcobYLNr/3Hfp6O28W3X/HOLvq4=; b=jI+ZCHHm7i2nxxus4+XuP1C7va
	WcmmPGHd6Zc+jvVP485pvlA2uMHHwtIa/IXr9Jl8z3DtaiwCwJwS/ITiPwHPByRW+wBnaes/i0oeB
	kjkL1tHAVhSN5m+pl3HfajihCxOiKCP7Y7E1RxqEGJM10muJrqNyzx3CM1Caw6UNF2B1TjcxeiGWk
	JwdiEGo7/i5BAXuOYlCS6ZBRGJ2m+H0YQvy68tQfg3PYC8pOPrImoxX8e4OqrSsS+cfKuGZJ+tI+O
	qS46DFfTOjs5cuyy2+PrGVbjnQHwSaPsSz7g4sH9nJC9LM42eW0OSvp7AWA7RnHKkPsZM7PaDqV7z
	qffwtzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2vob-00000004MCZ-1g4j;
	Sat, 05 Sep 2026 19:12:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2voa-00000004MCP-07FQ;
	Sat, 05 Sep 2026 19:12:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF203601DB;
	Sat,  5 Sep 2026 19:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630E71F00A3A;
	Sat,  5 Sep 2026 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788635553;
	bh=DgM7t7aU9HoxT1zgrcobYLNr/3Hfp6O28W3X/HOLvq4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lrRPbcChpZDisearlYxLLpLQy7Vj2LXH32xksA/4PmuDjb6lj0SheNhsIJssq0RAD
	 vvGn2G+IF915hHxTrFceJv3gISpcIf5xC7+yiJ8oNAPQ5nhuWarNiOvrbe7nE1e0Em
	 MZm6zPlREPidoH3bV4ObZWVQ1i6uHl4OatAJjq8xebA1TryNpmil+dD6IY9Kz6GaV1
	 bK+a24dzjwZZs3aQZDNOB067M/AGYnPhFcG3qV5aG0LzpkY/A0jlob2I2rl8VRMlJj
	 VtcXuUxzBvvN248QlXFjSWeDumLh0NW5pBq24FtOMR9VU+kB4VJmmtrTOHJH5tzgk+
	 oB7+0QPzJ4+dw==
From: Thomas Gleixner <tglx@kernel.org>
To: Nam Cao <namcao@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>
Subject: Re: Interrupt chip driver maintainence
In-Reply-To: <87ld9g9zrt.fsf@yellow.woof>
References: <871pb9841j.ffs@fw13> <87ld9g9zrt.fsf@yellow.woof>
Date: Sat, 05 Sep 2026 21:12:30 +0200
Message-ID: <87fqzn5x7l.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

Nam!

On Sat, Sep 05 2026 at 04:51, Nam Cao wrote:
> Thomas Gleixner <tglx@kernel.org> writes:
>> I'm wading through my inbox full of patches for interrupt chip drivers
>> and I'm thoroughly annoyed. The way how this works today is not
>> sustainable.
>>
>> Patches end up in my and Radu's inbox and all we can do is go through
>> them mostly on a formal basis, but it's out of our scope to look at the
>> correctness vs. a particular hardware. In the past I just picked up
>> patches when I had the gut feeling they are remotely correct, but I'm
>> tired of this.
>
> I have hardware to test the SiFive PLIC. I also spent quite some time
> staring at the specification attempting to cleanse the mess we have for
> plic_irq_eoi() (which sadly yielded nothing).
>
> I can help looking at patches. Would that help moving things forward?

Help is always welcome.

But the point is that the companies who build and sell that stuff have
the responsibility to take care of it and not just dump their crap into
the kernel and then expect that someone else will take care of it for
free.

If SiFive pays you or your employer to provide that service that's fine,
but you doing it on your on [dt]ime to proliferate the carelessness of
those who profit from it is just wrong.

Thanks,

        tglx

