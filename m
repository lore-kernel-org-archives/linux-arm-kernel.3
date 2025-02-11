Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52660C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAfehH0pRSNM74jOU1hpoGaCaoR26ZlkzhoEyncNpPk=; b=CuwcYccMDin0UuI7Ws6zwZ1zXM
	ePYX01QkvQSPFBmjETcLxVklCP+k/3Hn7gosPH5i9bLzWKIf/nMLdGgFjkJuZ2eZ0quM/tWWO40DT
	qhuS0hwxPHnW3zQgv8ae7+PNhjBImBkWqagrp54TLHNoffQSbYWbr1LW4qy/UgY/QmM4VH3ZJZH88
	hG6zu9GT/kcgim4FTlD8FenPLDPNzUOORwlfKSMAY1Vxobsyu1wd2rnHSKOMOCYGZFChLcIxDy83a
	KJzA7K4azEr4cRYTuYN/W3ZZ75GV1YsGVMYOJb6oCa1IafGGeE4bmdiwd7k2I7QWjxKT0GHGlvlwp
	ifhHu8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ths5y-00000004Gqr-3JYx;
	Tue, 11 Feb 2025 15:22:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ths4Y-00000004GVO-2Pd6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 15:21:15 +0000
Date: Tue, 11 Feb 2025 16:21:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739287273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RAfehH0pRSNM74jOU1hpoGaCaoR26ZlkzhoEyncNpPk=;
	b=Zv4U2MhxITSl9kUmmsVJW4c7qLimnsYlmhKut/KZgg8KnpnY2nxZSpOCX5SzEn4xIVeyi5
	BbKOZMuUnKJg2l7HBSfZfHFrsKavpg6Vm6qjop/0AiVHTwpFa/qyhgBBsnk6OdXoXd8+UI
	FcIMyUkv8d9RVvo/fEUUklKAn+FUi0oDYjAEGNUvXeLBvxdSW0/K7gUaV5N9bvlCqoq2HL
	D68LXsa2ITeGyFN+RupkGKCuKWTJ1ClPdEivuq4hxcQGKRvnfPUpsUt+1udKOBvZ9Rlq7K
	ECtda2ldgr6Uves9g1Q80JVp4Vf/XDzsY6Pzf0o0BgiJyVmhvFpVkq3jtx0PhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739287273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RAfehH0pRSNM74jOU1hpoGaCaoR26ZlkzhoEyncNpPk=;
	b=yacAYOQ2pG5/O3bhi/OUOrdcRl3g0N9/LAIUyWwUai9zxXqq3tjoYPi7e9+nqF8HAo220z
	yNmtetUKNh7IQfDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/9] arm: Rely on generic printing of preemption model.
Message-ID: <20250211152111.A6HxeZLd@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-4-bigeasy@linutronix.de>
 <20250210120429.iFfBClW1@linutronix.de>
 <Z6oYO5uKlEJ8C8Ne@shell.armlinux.org.uk>
 <20250210153902.06VTSS6d@linutronix.de>
 <Z6oo0MExaEy5J55_@shell.armlinux.org.uk>
 <20250211145249.StI6tEZv@linutronix.de>
 <Z6tnQvIBlGnoGRN_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6tnQvIBlGnoGRN_@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_072114_747323_B92F4C56 
X-CRM114-Status: UNSURE (   5.20  )
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

On 2025-02-11 15:05:38 [+0000], Russell King (Oracle) wrote:
> 
> Got it. Printed from __die() -> __show_regs() -> show_regs_print_info()
> -> dump_stack_print_info().
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thank you.

> Thanks!

Sebastian

