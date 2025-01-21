Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8864FC02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgccJ2YgVNcHrIlbnovTZ5rRG5JMHkpYhhXdN+uTsJ8=; b=aiPSOvWXzrFt+y7XsSr4dehuBh
	D+orGHhcvjSZPV4/kWdM7drYHicveu+S2cSaCHzvPE35oa3wC0B6W75djWq24ibrTemA1Xt0340Ye
	855HfzcsBNhddrb43o7epppLrV1eiMntFSAr3F0Qo+NzSsuJdIHAnZjk/vu7SvI0zxQZHb+UAzLKF
	spYxeGVw0/OCPS3ZzleCMhkpEn6Wk86O34DhG3T06TICRREhqRAc2SnrwiWgY2R4tsYykVc+nQVIb
	1bViMSJ1Yj7d7ZBVWqN+FHNWMsaUXbzSEJ5yQg9sjk47ooeWkzpl1DIECsNvvBAurHKIZKhyzaIkp
	OyJ5YxJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taB0j-00000007UQo-0ydE;
	Tue, 21 Jan 2025 09:57:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAzQ-00000007U7F-3SzW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8696DA41430;
	Tue, 21 Jan 2025 09:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EB2C4CEE3;
	Tue, 21 Jan 2025 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737453367;
	bh=Pq6+SwYN8tMjuzLRzEFPjm2o64W9oXSHb9lfpnhWEXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RjjtbFSJ3q4X5KDw2bbNwJpHHR6tVsaEigmhBx7CUvGlwyG8YWW3UIFvplnr4pA3W
	 y3orh5kmcaegA+g3PTNh5A134cHBfONE7CeRwul2GKYdVLFSo2UthbU0S5Bf5yY3d6
	 rLV7ovzvhr6yXdrQMeacPxWEcnIuRFrOQRKNa/acD7/TcAacpIFa3FA1MRXNCVd8mZ
	 EkFnc5NU9KvNo0LK0NrRdrgsv1rcoJ4xEkWdw1PCwEw9DOwAsmzdM9qdcrtCi6Ltup
	 rAUK2Ji3HlQzqQ+pbMKL8R94rqwekU/I4n9ZAVn2Jj5OecZHqFjagGFl+qBdDiGVRG
	 MYaeqen2dAFfw==
Date: Tue, 21 Jan 2025 09:55:58 +0000
From: Will Deacon <will@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, catalin.marinas@arm.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org,
	daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de,
	lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com,
	mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org,
	maz@kernel.org, misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
	zhenglifeng1@huawei.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v9 00/15] arm64: support poll_idle()
Message-ID: <20250121095558.GA20954@willie-the-truck>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com>
 <8734hd89ze.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734hd89ze.fsf@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_015608_924448_0F2B1254 
X-CRM114-Status: GOOD (  13.78  )
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

On Mon, Jan 20, 2025 at 01:13:25PM -0800, Ankur Arora wrote:
> 
> Ankur Arora <ankur.a.arora@oracle.com> writes:
> 
> > This patchset adds support for polling in idle via poll_idle() on
> > arm64.
> >
> > There are two main changes in this version:
> >
> > 1. rework the series to take Catalin Marinas' comments on the semantics
> >    of smp_cond_load_relaxed() (and how earlier versions of this
> >    series were abusing them) into account.
> 
> There was a recent series adding resilient spinlocks which might also have
> use for an smp_cond_load_{acquire,release}_timeout() interface.
> (https://lore.kernel.org/lkml/20250107192202.GA36003@noisy.programming.kicks-ass.net/)

Urgh, that reminds me that I need to go look at that...

Will

