Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFEFCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0Kmg0M/pihg+3mchefRKJW/8qhO0EXT2ncDeCzUrSc=; b=KxZ9RrPQlCxXozP9OHnQ27SBaB
	Ptt+Q0ChL7MjgHIYufgqQmkUu3uebOP0PLsTZENVCV/5Y8sjkBSMaEtxI8vwvcDO3eKmyY1YOzoUT
	gEuFblthZAJiqMys+dUAvp5mK0wwvuUEOByA2K9Gbc3+zN6IdeT/OSCTMfLJOeDd47WP4SK3/iaU6
	8Rt3pSgfWz8dFzShymLMMQ4aft10ra0x9lENmnZJAbmXclsh0HblkNjFpP7y2oemJoTn5qCpvJi+Z
	2Nn6vPKb2e5q8ZezIVOygXKg4jEIwYOTPONHptxGNKiWYZqVkNDWO7zTEtTsAq6fsuOQfNVcojJc6
	3xsQWSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQoJ-0000000EQFn-3XnT;
	Mon, 27 Oct 2025 17:15:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQoG-0000000EQDH-37oU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:15:10 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761585306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0Kmg0M/pihg+3mchefRKJW/8qhO0EXT2ncDeCzUrSc=;
	b=S+1joJJKL5HOP2QI7bePmaQsErjZHts/8tAjGua3A3++P+uxwhzP6Fx+CgA+saMowyM/Un
	qF1s+8Z1CTSJc278sFPw14sZSSoNPm71h0PyF/0QKybtsp+jpWQPmjC4zruRYx0vkSIFvy
	UWhtf5ww4Zpghxxms4sRdmPlCamm85FHT9I1E+9CpPa2boPNMt2j3JjdgppUSlh1Sn1bNR
	FmzEyEDDyPeq7kQKP/vw2ziBPXIDOqE3QlkAYQCKJeOmJf5nSl66AotEtUGLuhrOdu3wzs
	JDiizpLx+fpfP8M8doVAcRU9Vj/rT8NqbqjYG4J6tCYaCDxF4BmEUlPc/ZDVMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761585306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0Kmg0M/pihg+3mchefRKJW/8qhO0EXT2ncDeCzUrSc=;
	b=RCyckc7oww7LF/Ey96p7Gohn/JMg7811PjAJquXTWtNmny2y8jawDxqgoepfeTcokWQ1pv
	GYPaiP3kZRgFcxBg==
To: Ulf Hansson <ulf.hansson@linaro.org>, Ben Horgan <ben.horgan@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Maulik Shah
 <quic_mkshah@quicinc.com>, Sudeep Holla <sudeep.holla@arm.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] smp: Introduce a helper function to check for
 pending IPIs
In-Reply-To: <CAPDyKFrY5kOsoOH-mcWFiaiggV4q84xOtiKHdNN4bMfFmYOQPQ@mail.gmail.com>
References: <20251020141718.150919-1-ulf.hansson@linaro.org>
 <20251020141718.150919-2-ulf.hansson@linaro.org>
 <a0120876-0f00-4e1a-aa17-5fe7c3512276@arm.com>
 <CAPDyKFrY5kOsoOH-mcWFiaiggV4q84xOtiKHdNN4bMfFmYOQPQ@mail.gmail.com>
Date: Mon, 27 Oct 2025 18:15:04 +0100
Message-ID: <874irkw9k7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_101509_036041_7FF1E064 
X-CRM114-Status: GOOD (  14.59  )
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

On Tue, Oct 21 2025 at 12:08, Ulf Hansson wrote:

> On Mon, 20 Oct 2025 at 21:11, Ben Horgan <ben.horgan@arm.com> wrote:
>>
>> Hi Ulf,
>>
>> Only a comment on the naming rather than a full review.
>>
>> On 10/20/25 15:17, Ulf Hansson wrote:
>> > When governors used during cpuidle, tries to find the most optimal
>> > idlestate for a CPU or a group of CPUs, they are known to quite often fail.
>> > One reason for this, is that we are not taking into account whether there
>> > has been an IPI scheduled for any of the CPUs that are affected by the
>> > selected idlestate.
>> >
>> > To enable pending IPIs to be taken into account for cpuidle decisions,
>> > let's introduce a new helper function, cpus_may_have_pending_ipi().
>>
>> To me, "may" indicates permission, i.e. is allowed, rather than
>> correctness. Would "likely" be better here, cpus_likely_have_pending_ipi()?
>
> Sure, that sounds better to me too.

cpus_peek_for_pending_ipis() perhaps?
  

