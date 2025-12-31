Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFAEEE6440
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vi5I+SfKE4aINlKxAmgMaZAdY1SDU/JEFetaMG2dxZE=; b=kZI83kYfOBWDfX7s3GiSH0zuYG
	88glS/uDjmKAFaXMETgHVp5sAg5Fi1ZzNY1s7Vzyf6fnPrqW/RsaoZ0rKLqCAkjlrSEFOx6/Y3DF9
	Z++EXlUGRRatTjYbnheOXtjgbxhSQWf4tZIZCkbAtvajau+x7mmmPy38132rXywUXgNVxwTpRYHgL
	qDroWcYGnvNfPoQrRdPIhUmHLgnh1YG0RFk/gZeR2pdYBkD7dzVHC4ukzQJ49Xl7nNR9C8QeqNQIF
	gY7VDLgWugM2hY/DZN+usjWUJ3Tm56IZq8rB9nHa0b+CpGgdT02MNvmUb04mn/EZCNzksZCBpLvAM
	o4vIb6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vawW7-0000000610O-3052;
	Wed, 31 Dec 2025 13:45:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vawW6-000000060zz-1UKs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 13:45:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 175B860008;
	Wed, 31 Dec 2025 13:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438F4C113D0;
	Wed, 31 Dec 2025 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767188732;
	bh=Y5lTmiVqic6uOses6/RBPW3lvTquV7zqhHPq8aQw34M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vx1P2FfSkiM9kppodGYA35GpPxHALVz4tqlXMJw7IRuRoyhQc3Qx9tILc+uax6TC7
	 E9oNlkBRd2Rs1GjCPqIEDj2UtwboDm+nyiXhVS4cpKvGjduLnDZUAkhmBouab0kgAE
	 9iFHz545GjGqBURbPFBcct+xIbjqRKoEQGe2nWxgG+6p4IO8R8Au9Jm7Y9Krmwprxc
	 HS8s1ug8q6nJc7bHQCVkjEoCysFcYtunXpn0pt+/iwuaDQ6zXF+kyUJavHNXJgl7UT
	 Y4URPh1rDmzsjeYecL3DpbBHbSEjLZfzNZGbTbp/0Hdxg9F9Won6RzlhHNOiKEJBL1
	 sy0xjelFd82aw==
Date: Wed, 31 Dec 2025 14:45:29 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
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
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 05/33] sched/isolation: Save boot defined domain flags
Message-ID: <aVUo-csI1gqZL89O@localhost.localdomain>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-6-frederic@kernel.org>
 <04708b57-7ffe-4a97-925f-926d577061a6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04708b57-7ffe-4a97-925f-926d577061a6@redhat.com>
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

Le Thu, Dec 25, 2025 at 05:27:54PM -0500, Waiman Long a écrit :
> On 12/24/25 8:44 AM, Frederic Weisbecker wrote:
> > HK_TYPE_DOMAIN will soon integrate not only boot defined isolcpus= CPUs
> > but also cpuset isolated partitions.
> > 
> > Housekeeping still needs a way to record what was initially passed
> > to isolcpus= in order to keep these CPUs isolated after a cpuset
> > isolated partition is modified or destroyed while containing some of
> > them.
> > 
> > Create a new HK_TYPE_DOMAIN_BOOT to keep track of those.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > Reviewed-by: Phil Auld <pauld@redhat.com>
> > ---
> >   include/linux/sched/isolation.h | 4 ++++
> >   kernel/sched/isolation.c        | 5 +++--
> >   2 files changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> > index d8501f4709b5..109a2149e21a 100644
> > --- a/include/linux/sched/isolation.h
> > +++ b/include/linux/sched/isolation.h
> > @@ -7,8 +7,12 @@
> >   #include <linux/tick.h>
> >   enum hk_type {
> > +	/* Revert of boot-time isolcpus= argument */
> > +	HK_TYPE_DOMAIN_BOOT,
> >   	HK_TYPE_DOMAIN,
> > +	/* Revert of boot-time isolcpus=managed_irq argument */
> >   	HK_TYPE_MANAGED_IRQ,
> > +	/* Revert of boot-time nohz_full= or isolcpus=nohz arguments */
> >   	HK_TYPE_KERNEL_NOISE,
> >   	HK_TYPE_MAX,
> 
> "Revert" is a verb. The term "Revert of" sound strange to me. I think using
> "Inverse of" will sound better.

Somehow I thought it could be a noun as well. At least I wouldn't mind if
it ever turns that way.

Fixing that, thanks.

> 
> Cheers,
> Longman
> 

-- 
Frederic Weisbecker
SUSE Labs

