Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02049D6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydPEQ0eJW0O5VAbsq4ZLuVjCKugAO/V0QAq/35qZvvc=; b=EIpDfQoJhxsIWsBnXrosMoE53r
	FMyeNFeDx62qREsJpdbFCKCpRNB/ApVp0sfPHDOZc2v4yDuHlajLFubeFa66WGFezDhUL5j5bSapE
	WeqMGTUqGkFLBtrXLbNFI9/2kcjt6uLyGQkdQqTOW4kchrKKImu1RCGv/1DytE0SDATU+HW+tfhbm
	bwcFfk7Xc8g+3poal0Cj/w9NX+Ck2BgMjlDDHdOYcuIlqdVhSInY2yjO+ktSpbQBFmqQCnGY1oLXg
	/2pDN/P3m1TZU5Y2doMK15fj4gTJYcjyBTG2hOis+3CcVdj/ScVwE2G25wQPTkW6cKMbu+0/5mtJS
	xWocKXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdZI-00000000JQn-0E73;
	Thu, 14 Nov 2024 17:23:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdXt-00000000J1r-24Ux
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 17:22:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD68F1474;
	Thu, 14 Nov 2024 09:22:44 -0800 (PST)
Received: from arm.com (RQ4T19M611.cambridge.arm.com [10.1.37.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBA8D3F6A8;
	Thu, 14 Nov 2024 09:22:09 -0800 (PST)
Date: Thu, 14 Nov 2024 17:22:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-pm@vger.kernel.org,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org,
	daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de,
	lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com,
	mtosatti@redhat.com, sudeep.holla@arm.com, maz@kernel.org,
	misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
	zhenglifeng1@huawei.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v9 01/15] asm-generic: add barrier
 smp_cond_load_relaxed_timeout()
Message-ID: <ZzYxv2RfDwegDMEf@arm.com>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com>
 <20241107190818.522639-2-ankur.a.arora@oracle.com>
 <9cecd8a5-82e5-69ef-502b-45219a45006b@gentwo.org>
 <87v7wy2mbi.fsf@oracle.com>
 <88b3b176-97c7-201e-0f89-c77f1802ffd9@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88b3b176-97c7-201e-0f89-c77f1802ffd9@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_092217_574370_738BBD8C 
X-CRM114-Status: GOOD (  15.09  )
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

On Fri, Nov 08, 2024 at 11:41:08AM -0800, Christoph Lameter (Ampere) wrote:
> On Thu, 7 Nov 2024, Ankur Arora wrote:
> > > Calling the clock retrieval function repeatedly should be fine and is
> > > typically done in user space as well as in kernel space for functions that
> > > need to wait short time periods.
> >
> > The problem is that you might have multiple CPUs polling in idle
> > for prolonged periods of time. And, so you want to minimize
> > your power/thermal envelope.
> 
> On ARM that maps to YIELD which does not do anything for the power
> envelope AFAICT. It switches to the other hyperthread.

The issue is not necessarily arm64 but poll_idle() on other
architectures like x86 where, at the end of this series, they still call
cpu_relax() in a loop and check local_clock() every 200 times or so
iterations. So I wouldn't want to revert the improvement in 4dc2375c1a4e
("cpuidle: poll_state: Avoid invoking local_clock() too often").

I agree that the 200 iterations here it's pretty random and it was
something made up for poll_idle() specifically and it could increase the
wait period in other situations (or other architectures).

OTOH, I'm not sure we want to make this API too complex if the only
user for a while would be poll_idle(). We could add a comment that the
timeout granularity can be pretty coarse and architecture dependent (200
cpu_relax() calls in one deployment, 100us on arm64 with WFE).

-- 
Catalin

