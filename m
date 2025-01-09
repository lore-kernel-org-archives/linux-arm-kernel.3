Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4751E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3WMRFjQRl1WbBaXvLrX4YkefhsrEif2DRWphQJxyDw=; b=ZKrB1XtqUXGLz5eohFYEQgtwoL
	hbv8bDa+h6KrdyZBtW2Fae+QkaQ258i1Ko6qzm7T2fTMD1M4Mu/b9Oig7fuERvyqlMsIAgZQNvev3
	vu2XAvhElxF4EuyCPV4lRjQO66IXqVOG136dRjB33RjmIuZPJzrZRwgdAuWkajZGMn2JzsUkg0zCc
	F+ksYjbvGWOMG+cH2vJ5JN5J8IE1gZjx1KZCN3o/JnXtlmkojNgHHG+5zRv6TbsSspQ9n6hPhYTgD
	VwFS/mEWSMtmYn235RMjmwko8oXwTAFVwX5hdsrp9moksPFjUlFjS8Fpe/+e7h4W7I6GfggL11Eqt
	QWSpVtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrP9-0000000Bodc-15uR;
	Thu, 09 Jan 2025 12:12:51 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrNT-0000000BoNg-3sso;
	Thu, 09 Jan 2025 12:11:10 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id D569472C8F5;
	Thu,  9 Jan 2025 15:11:02 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id C39FF7CCB3A; Thu,  9 Jan 2025 14:11:02 +0200 (IST)
Date: Thu, 9 Jan 2025 14:11:02 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH 2/6] syscall.h: add syscall_set_arguments() on remaining
 HAVE_ARCH_TRACEHOOK arches
Message-ID: <20250109121102.GA16212@strace.io>
References: <20250107230153.GA30560@strace.io>
 <20250107230418.GB30633@strace.io>
 <20250109120453.GC26424@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109120453.GC26424@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_041108_149534_F4356CCC 
X-CRM114-Status: UNSURE (   7.59  )
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

On Thu, Jan 09, 2025 at 01:04:53PM +0100, Oleg Nesterov wrote:
> On 01/08, Dmitry V. Levin wrote:
> >
> >  arch/arc/include/asm/syscall.h       | 14 +++++++++
> >  arch/arm/include/asm/syscall.h       | 13 ++++++++
> >  arch/arm64/include/asm/syscall.h     | 13 ++++++++
> >  arch/csky/include/asm/syscall.h      | 13 ++++++++
> >  arch/hexagon/include/asm/syscall.h   |  7 +++++
> >  arch/loongarch/include/asm/syscall.h |  8 +++++
> >  arch/mips/include/asm/syscall.h      | 46 ++++++++++++++++++++++++++++
> >  arch/parisc/include/asm/syscall.h    | 12 ++++++++
> 
> Confused... arch/x86 needs syscall_set_arguments() too ?

Sure, all HAVE_ARCH_TRACEHOOK architectures need them, but most of these
architectures already provide them since the previous patch in the series:
[PATCH 1/6] Revert "arch: remove unused function syscall_set_arguments()"


-- 
ldv

