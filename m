Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F26ACD8C8F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smA20V17ZF1F2xtWy4wiqSmfxMuxp7FSVoSwrSRVQDk=; b=JpCHVJpKJBeCLq/R6pjnMEoea7
	Hhq9xYGl4GGHn62vaS8Nk7ytgmRfa9+pZaxy+16oCt+53er/digYqMJlYMdJ4DWLt8ieRJ0oco20Z
	tNJs5brTZwAkW39aKp1UiWE48s3Bi+nveqBi4oW5in7RacdtuB2HGn5Mge+2odiDcGnLUu6AVYw14
	Wx+eceLBX00SyLDCLOAGT8TuM6pax4g/aRcw4ULrKpIO5zMqmf/qRXrMS7icbAMXNMHSp1Qqb3mEe
	oEu1ABE+ip/tJCSJuzijqy4wQK+mcPIKSR9c5UcFqPcKxVqj0HWUq5xmxXnqIdPBr8KrJ6CfGg/GX
	qjAapcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZGT-0000000Aj0f-1uPe;
	Thu, 13 Nov 2025 15:29:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZGR-0000000Aj08-0Rz4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 15:29:36 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763047772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=smA20V17ZF1F2xtWy4wiqSmfxMuxp7FSVoSwrSRVQDk=;
	b=tU5vr2gcdFphwGWO7V259GwnrVBX/crtdTVtsc+FjI8oON/IEYNrN6Ln4FAGYRcRD1zVgg
	R8qdalzr9RSC2pQgiikrx2CNb0lC9FO+2/NIuNbQ/7Wjw/nuFnfTSAvlMGmQN7r0/MAp+Y
	cqGEeBcwAZru5Z84TXVp+Tb1oxVEW+fCl5fh7yR9lhbmkM3Nz4n+7pEBpaxOTN425wywkc
	D4Bx9bqyVHVVdM4dZ1vFg1T/S/YTB/RnH6iT6NMidvHfin10NDQcGCKvZ9gFqQHzptaheT
	s7FycTHvXEy8BSjBi1BElvV3mOJNUTR8TZxKqiXUeP5s2kPWwT9epIcb7lWkYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763047772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=smA20V17ZF1F2xtWy4wiqSmfxMuxp7FSVoSwrSRVQDk=;
	b=AgzJqop0o/OwWkx+w2MpwQXjEapM8ajgNebEaWYm11Cl121wviNTVCHimYjbW01CWDsA1m
	shYmfzxisZxCmeAw==
To: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Maulik Shah <quic_mkshah@quicinc.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Ben Horgan
 <ben.horgan@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v4 1/2] smp: Introduce a helper function to check for
 pending IPIs
In-Reply-To: <20251105095415.17269-2-ulf.hansson@linaro.org>
References: <20251105095415.17269-1-ulf.hansson@linaro.org>
 <20251105095415.17269-2-ulf.hansson@linaro.org>
Date: Thu, 13 Nov 2025 16:29:31 +0100
Message-ID: <874iqyc5no.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_072935_284623_ED1D78D5 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, Nov 05 2025 at 10:54, Ulf Hansson wrote:
> When governors used during cpuidle try to find the most optimal idle state
> for a CPU or a group of CPUs, they are known to quite often fail. One
> reason for this is, that they are not taking into account whether there has
> been an IPI scheduled for any of the CPUs that are affected by the selected
> idle state.
>
> To enable pending IPIs to be taken into account for cpuidle decisions,
> introduce a new helper function, cpus_peek_for_pending_ipi().
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

