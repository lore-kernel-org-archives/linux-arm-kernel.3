Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6242BC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvVxVl1TgVFeSoMoN4hMOU/w/8n6aE/IcJcmNNjt2QI=; b=eJsmKL3bbmoO+HkU+1QtsBoTUw
	nT48Cg8/b0zvHdvlh4ChAQYtF69EkZvXqcY+4LxhRSVZqzynMCXtlDKG1Sm4PQxMdO2OkrtM2eCT0
	r5gt6Xy4DXeiArJpghjXk9uy8Fu9yvNg6zP6UbrXEen+6X6abzbfVZszXMJ/Z25QiwtWLtzALgtsz
	K0hZLntDw/mhr5utld54cwxf+G2zDAh66IJsJ7ZzACSVp9WopYjABn7KcFcK1MlqLRBG6W4DDdtWH
	chY3TLS4EEv1+lLrzEaYKSEVZGQW7gMwKMq97Q6cMxkpc+Zop/UwEFqpbza7jz/vTCly8cmFFIfXc
	db8BgkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50p9-0000000Gh9T-0obM;
	Fri, 11 Sep 2026 12:57:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50p7-0000000Gh90-1x4D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:57:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3B3760A64;
	Fri, 11 Sep 2026 12:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE601F00893;
	Fri, 11 Sep 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131464;
	bh=vvVxVl1TgVFeSoMoN4hMOU/w/8n6aE/IcJcmNNjt2QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fW/q1i3FdF4YrdvQZvqvkYCQfIrLdswqhsxV1TtukHweIRqWg5rKEym84q/249lMA
	 JoD9Fuu+fuNiqjsRxrYaoUOPS7loHhWPGhTmjXtBYB8Wuc+qNT58RfFDpJCSP+qXUz
	 z8niSUC/XU6KCxyZM2lzdzC3XvW9ykcFyPEMvFujX2726c97qR6lHPtm68/SAz+tCo
	 RHHXse8SvOrOlISYMzQ1AhTPnYrPipxWuV/vicHh+VPliOUxSqRrui8tIn4H/Qn/J9
	 LFaBTU//ZT1pkTMAIzfPA4JUkR8VMa1byeDUmFMQuT6VzCnL7zBUxuWK2fXveUXcz9
	 7kV4hA1H0CSAQ==
Date: Fri, 11 Sep 2026 13:57:39 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 03/19] cpu/hotplug: Avoid busy-polling on archs where
 cpu_relax() is a no-op
Message-ID: <aqP6wy6BBZXI80vq@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-4-will@kernel.org>
 <0fa7d64c-9ccb-4a25-b40a-6ffbf5e33406@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fa7d64c-9ccb-4a25-b40a-6ffbf5e33406@huawei.com>
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

On Fri, Sep 11, 2026 at 03:16:23PM +0800, Jinjie Ruan wrote:
> 在 2026/9/8 0:40, Will Deacon 写道:
> > diff --git a/kernel/cpu.c b/kernel/cpu.c
> > index 97a9bfe4edad..d9fe204f02cb 100644
> > --- a/kernel/cpu.c
> > +++ b/kernel/cpu.c
> > @@ -303,7 +303,13 @@ static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
> >  	(void)atomic_xchg(st, state);
> >  }
> >  
> > -void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
> > +void __weak arch_cpuhp_sync_state_poll(atomic_t *st, int old)
> > +{
> > +	if (old < SYNC_STATE_ALIVE)
> > +		cpu_relax();
> > +	else
> > +		atomic_cond_read_relaxed(st, VAL != old);
> > +}
> 
> As sashiko pointed out, it seems that the else branch unreachable for
> the call of cpuhp_wait_for_sync_state(cpu, SYNC_STATE_ALIVE,
> SYNC_STATE_SHOULD_ONLINE), the old state can only be "SYNC_STATE_KICKED"
> or "SYNC_STATE_SHOULD_DIE", which go the if branch.

Ah yes, it's a harmless leftover from my initial (failed) attempt to use
cpuhp_wait_for_sync_state() in cpuhp_ap_sync_alive(). I can drop this
part and reword the commit message.

Will

