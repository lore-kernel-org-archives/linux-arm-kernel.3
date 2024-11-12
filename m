Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84720D42BAF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sf7+qAtrJ8NfnoJMCnPnCfwyrzglWa3e10oFGgeSTKo=; b=BMTP400WrT1dTUu8dJFX9E/BIb
	lfqCF+SR1QzI4y2Mbn3ig3RogoHi4RGgl5wWZ8wR95cTCSJPxnaZ+tYMesnyp0YJiABaBGirQKgWT
	GbcOlcgbpQhv7ldFqT6g5nQDimSyo77DYA8ps3LM1rl+jUbiK9H2b2pHiTbFW3bKWAqve2k545lDF
	KGxBs3+wJN5Ntnm+vbwhbu9/RCJo/rX0jaLcOgGKyXcSkADt4uodRaoH6MHb6jWomkrvn8kSnA7Ch
	LAjEQ/oKIcjJLReh879hpkst4iE02/CW2/R8biv4UA+sn/w86eVFi1bPNr75hBlp1CabNLGNfQ48J
	kmPa/t6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuTj-00000004Jut-3vwu;
	Tue, 12 Nov 2024 17:14:59 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuHP-00000004Gwl-1SGO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1731430202;
	bh=Sf7+qAtrJ8NfnoJMCnPnCfwyrzglWa3e10oFGgeSTKo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oVJynVz4ntbWelqP3CUy87U5l5emCf0/gVobk/CGKKxDzZBkQFTVNsdpRHvLae3+i
	 SSuNj9dz/y1JcyqnnAE+fbxBZg+T+nrBDzv4hk3ogk+ukZICIsM9JNwEb32noxje7h
	 EjX97JEa305LSQy4msRlzzpP9ZkESShA+T2CUPBA=
Received: by gentwo.org (Postfix, from userid 1003)
	id 13C4F401C9; Tue, 12 Nov 2024 08:50:02 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 08314401C8;
	Tue, 12 Nov 2024 08:50:02 -0800 (PST)
Date: Tue, 12 Nov 2024 08:50:01 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-arch@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
    tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org, 
    daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de, 
    lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com, 
    mtosatti@redhat.com, sudeep.holla@arm.com, maz@kernel.org, 
    misono.tomohiro@fujitsu.com, maobibo@loongson.cn, zhenglifeng1@huawei.com, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com
Subject: Re: [PATCH v9 01/15] asm-generic: add barrier
 smp_cond_load_relaxed_timeout()
In-Reply-To: <87zfm9z812.fsf@oracle.com>
Message-ID: <93d1d8f6-702e-811b-2bf6-0e4739e24c1c@gentwo.org>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com> <20241107190818.522639-2-ankur.a.arora@oracle.com> <9cecd8a5-82e5-69ef-502b-45219a45006b@gentwo.org> <87v7wy2mbi.fsf@oracle.com> <88b3b176-97c7-201e-0f89-c77f1802ffd9@gentwo.org>
 <87zfm9z812.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_090215_445910_BC965967 
X-CRM114-Status: UNSURE (   8.43  )
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

On Fri, 8 Nov 2024, Ankur Arora wrote:

> > For power saving most arches have special instructions like ARMS
> > WFE/WFET. These are then causing more accurate wait times than the looping
> > thing?
>
> Definitely true for WFET. The WFE can still overshoot because the
> eventstream has a period of 100us.

We can only use the event stream if we need to wait more than 100us.

The rest of the wait period can be coverd by a busy loop. Thus we are
accurate.


