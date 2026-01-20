Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5801D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsDLZWihLyJlFXu9AIgF+ATIVvGorDbyby2j6akt7Cw=; b=rAMCkpPaqDJy4sjGssDsf0S8e8
	6NIZs0Al7a9147seO0wQA1qw0EwFkfmmhidzfmk9YQf/ah1crggLgz0z3pZZ7ojX7c+JHyJMkrZ7T
	qVKT080k5zPz5Se+MtUib4fqQH2Drl3trr6hXA7yWk99FcNalur+AMHeuIOF61na9DnoJLnKeDBoK
	TS8R/DC57rCEWxchwXwevMTcmAaUGggLlGcFuB4WKsqBf2rgJda2i+ec6QGnQYzzZ6yJUkIL32PcL
	oDsTL4DoTDd3Uo+DD+xonfLNLA62OM20F5zw/RbDBd7MthhIfdKQEIUgmEvyuKWDjuaY2JX+JxJNN
	x+kJqBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDS2-000000043xA-1RxI;
	Tue, 20 Jan 2026 15:15:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDS1-000000043x1-1KxW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72940600CB;
	Tue, 20 Jan 2026 15:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B042EC16AAE;
	Tue, 20 Jan 2026 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768922124;
	bh=cB6+u0cGFM+BuA6s4Sw76CjAr/+izfs5ypcZfWumP+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTm6pm0UbqrACPX84K25WsKI0mLcsga30LnGZ0xAs1QeHOq8GuYQb0tsVAj/1PyOk
	 AN1JtPlGK2Lo1SN6drBYr1dVy9fdgzrRQCr2v1Zr5WaI0DgPDkYpbpHSPBc0lzPVxT
	 mDodJS2/jqZjTXVaKaFD5qjNt2270SzYmLSpr9NA2qekfz0PdVSlZLmHpnEvNYJ+eY
	 A07k9S1Ry7xxwMicubb01dCJM4tNlasnq386AOzVL87vqKI0T34pSKz9QNypV2LDxE
	 2HWPcTW6E/V+Ce+TphpVMpakDh1WcI3tzKUwZtHRXG5Gb8k9H87NfGW6D+dQQz/FfZ
	 kpuAsAsDnxf/g==
Date: Tue, 20 Jan 2026 15:15:14 +0000
From: Will Deacon <will@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 29/33] sched/arm64: Move fallback task cpumask to
 HK_TYPE_DOMAIN
Message-ID: <aW-cAlJCtI5Qtify@willie-the-truck>
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-30-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101221359.22298-30-frederic@kernel.org>
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

Hi Frederic,

On Thu, Jan 01, 2026 at 11:13:54PM +0100, Frederic Weisbecker wrote:
> When none of the allowed CPUs of a task are online, it gets migrated
> to the fallback cpumask which is all the non nohz_full CPUs.
> 
> However just like nohz_full CPUs, domain isolated CPUs don't want to be
> disturbed by tasks that have lost their CPU affinities.
> 
> And since nohz_full rely on domain isolation to work correctly, the
> housekeeping mask of domain isolated CPUs should always be a superset of
> the housekeeping mask of nohz_full CPUs (there can be CPUs that are
> domain isolated but not nohz_full, OTOH there shouldn't be nohz_full
> CPUs that are not domain isolated):
> 
> 	HK_TYPE_DOMAIN | HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN
> 
> Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
> tasks and since this cpumask can be modified at runtime, make sure
> that 32 bits support CPUs on ARM64 mismatched systems are not isolated
> by cpusets.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Reviewed-by: Waiman Long <longman@redhat.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 18 +++++++++++++++---
>  include/linux/cpu.h            |  4 ++++
>  kernel/cgroup/cpuset.c         | 17 ++++++++++++++---
>  3 files changed, 33 insertions(+), 6 deletions(-)

tbh, I'd also be fine just saying that isolation isn't reliable on these
systems and then you don't need to add the extra arch hook.

Whatever you prefer, but please can you update the text in
Documentation/arch/arm64/asymmetric-32bit.rst to cover the interaction
between the asymmetric stuff and cpu isolation?

Cheers,

Will

