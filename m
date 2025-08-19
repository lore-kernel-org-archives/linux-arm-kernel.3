Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8645CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13rpRWSMqfUWPzkvm81CYcYeH9AJvdN3kW85QJvk5rk=; b=R8TfQNEgIoPqVhsFWPASe1KrE6
	FPUgaeUoRlP1AZBS/F2WEKPBK6lA6DqScMFbvlDExJzn8mWgDITC2Gu8i7I81uq1lNpVHIl7UahS+
	fCHHXJPDvkkfdl4othX3H0cl4JfvhyWMLz5Oxk+YeHxLUS/eXyGnvSfEIJXlG36dVv3ENM+dedpDz
	hT4jKJ6optB45n+mQehpFxR+9ZfahUf+Xz2UE32QO46O79waAa3jDQ5JVGEAjXeC1/HoPfkMNFK/B
	J4Jv8+6MpSlXpxfj7n9tUHImKkyXxd7mt5ON3UO+KS4DIzBYXcGi68/IgKM9rKKDNTFbGZJhPBTcX
	X/iIsfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTQ9-0000000Bbey-3PQZ;
	Tue, 19 Aug 2025 20:59:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNLG-0000000Al1m-1Fpu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 14:29:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63384106F;
	Tue, 19 Aug 2025 07:29:27 -0700 (PDT)
Received: from arm.com (unknown [10.1.31.94])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CF413F63F;
	Tue, 19 Aug 2025 07:29:33 -0700 (PDT)
Date: Tue, 19 Aug 2025 15:29:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
	joey.gouly@arm.com, james.morse@arm.com, ardb@kernel.org,
	scott@os.amperecomputing.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aKSKS2__HEZDfyoi@arm.com>
References: <20250811163635.1562145-1-yeoreum.yun@arm.com>
 <20250811163635.1562145-6-yeoreum.yun@arm.com>
 <aJ9oIes7LLF3Nsp1@arm.com>
 <aKB55rPj1Qe8G+zF@e129823.arm.com>
 <aKCcbQWioNfG1MMQ@e129823.arm.com>
 <aKNyj_6dZVp9O4BA@arm.com>
 <aKOE1aqe6EljRkuB@e129823.arm.com>
 <aKQ4HvqZa_7Q7oDu@arm.com>
 <aKQ/pglPWZMprL5e@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKQ/pglPWZMprL5e@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_072938_380231_F2BA429B 
X-CRM114-Status: GOOD (  21.71  )
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

On Tue, Aug 19, 2025 at 10:11:02AM +0100, Yeoreum Yun wrote:
> On Tue, Aug 19, 2025 at 09:38:54AM +0100, Catalin Marinas wrote:
> > On Mon, Aug 18, 2025 at 08:53:57PM +0100, Yeoreum Yun wrote:
> > > > On Sat, Aug 16, 2025 at 03:57:49PM +0100, Yeoreum Yun wrote:
> > > > > why we need to care about the different settings for tag checking when
> > > > > we use uaccess_disable_privileged()?
> > [...]
> > > > > But, although tag check fault happens in kernel side,
> > > > > It seems to be handled by fixup code if user address is wrong.
> > > >
> > > > The user may know it is wrong and not care (e.g. one wants to keep using
> > > > a buggy application).
> > >
> > > Then Does this example -- ignoring wrong and keep using a buggy
> > > application shows us that we need to enable TCO when
> > > we runs the LSUI instruction?
> > >
> > > AFAIK, LSUI instruction also check memory tag -- i.e) ldtadd.
> > > if passed user address which has unmatched tag and if user isn't
> > > interested in tah check, It can meet the unexpected report from KASAN.
> >
> > That's a valid point w.r.t. PSTATE.TCO that applies to copy_to/from_user
> > as well. I don't think we documented it but we don't expect the user
> > PSTATE.TCO state to be taken into account while doing uaccess from the
> > kernel. We do, however, expect SCTLR_EL1.TCF0 to be honoured and that's
> > what the user normally tweaks via a prctl(). The TCO is meant to
> > disable tag checking briefly when TCF enabled the tag check faults.
> 
> So, IMHO, as copy_to/from_user (ldt/sttr) enable tco before it operates,

They don't enable TCO.

-- 
Catalin

