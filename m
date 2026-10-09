Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BB3CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miCG4rWC2Nf/bhPuwMA/GXvzDZO2uNAdaQR/20C+UZQ=; b=Tt14FbPrwYYM8WQNbL9dO6yyy1
	Ib/PTteorEud1cDO+pmu0WG5Bpxa5Ray6qfYRquxLP8jITRFkpgUCMbe+rALOcsn9I9GSS8HZBa3b
	AXe3Ln3LTiML0ok8xOmtw7gXqxmCDplDy3o1ktoeDPRyo9uoRes9+SVHIecVwO+tNYa1TUlYbvKXA
	3LEDd5sxHmEJcyznWErFqnsPN2nwI4eq4n6lZds+AI0tTye5O4NfMT6QTQqDlzcr4f25e9Wbi/05j
	r/ZXXBxYmOuPmJAecPaOGkEGCmrTtyuydQVm77VGBCQlciYkFWvohH4mwqsrXJdqEuYNuD1iIMTYj
	+6woVXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4wc-00000005iff-10vQ;
	Fri, 09 Oct 2026 07:23:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4wZ-00000005iem-0HbI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:23:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE6991692;
	Fri,  9 Oct 2026 00:22:57 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29DE03F8C6;
	Fri,  9 Oct 2026 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791530581; bh=WsYk4mwXHGtEeA9/sqqtPLloNXN/PsNfk1fSu7KICtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t8CehVv4+Lz8Ugsv96BmQeZ1twjOPHaeTSryLFZ8XK8XZigz5W+IYmOHxXvNgxCos
	 N7BdEXolPVcgXabranRPAkc3TgIpNDG7vL7on5JnWLSDBD8O+6Xi8OgL/yfdqoaAGW
	 FrYeFAl55KJTNtuwLj3854pSMLI1wyh9ufDn1hq0=
Date: Fri, 9 Oct 2026 08:22:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] arm64: errata: Add NXP iMX8QM workaround for A53
 cache coherency issue
Message-ID: <asiWTxgGxJ5JIFcl@arm.com>
References: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>
 <asTZEhzMDs869r_n@arm.com>
 <aseZUwi0CYTXuE/I@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aseZUwi0CYTXuE/I@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_002304_275392_57CDF963 
X-CRM114-Status: GOOD (  25.54  )
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

On Thu, Oct 08, 2026 at 09:23:31PM +0800, Peng Fan wrote:
> On Tue, Oct 06, 2026 at 12:18:42PM +0100, Catalin Marinas wrote:
> >On Mon, Aug 24, 2026 at 12:02:04PM +0800, Peng Fan (OSS) wrote:
> >>   - Disabling KVM since correct TLB maintenance cannot be guaranteed
> >>     for guests.
> >
> >Do you need virtualisation on such platform? An alternative would be for
> 
> We not have KVM support in our software release for i.MX8QM.
> 
> >the guests to be aware of the erratum as well and use the right TLBI/IC
> >ops. But you'd also need to upgrade the VMID-aware ops in KVM (unless
> >the hardware can't work around stage 2 TLBI at all).
> 
> We not have test cases for this since KVM is not in our release scope. 
> Could we take this as a future enablement to avoid uneccessary churn

Yes, you can leave it out if you don't care about the KVM use-cases.

> >There's a precedent with 4311569 to wire up a SoC erratum into the CPU
> >errata framework. That one is a system wide feature, so only probed once
> >for the CPUs coming up at boot (though still probed for each late CPUs).
> >For iMX, you need this turned on early, hence the boot probing. But
> >calling it a strict boot CPU feature is a bit of a stretch. It also gets
> >probed on every CPU, unnecessarily.
> >
> >I think we could do with something like below (maybe as a preparatory
> >patch). We could also add it to 4311569 even if it changes its scope
> >from system to boot CPU (the early param is available).
> >
> >Only compile-tested and haven't tried wiring up your workaround:
> 
> With type set to ARM64_CPUCAP_SOC_ERRATUM for i.MX8QM and your patch
> applied, I not see issues in my test.
> 
> Would you post it as a formal patch or need me to include your patch
> with i.MX8QM errata patch in a patchset?

Please post it with your patchset. Feel free to add a co-developed-by or
suggested-by me on the new cpucap proposal.

-- 
Catalin

