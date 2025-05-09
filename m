Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE06FC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZPFCQ0QBFbu3SURf5bSrXwDR3rjbx85dYcheWJdoUU=; b=y2C+BeehWnW9TlJVpD7A2tJ7jw
	VT3AKwJDGnZMKzmo6fiJsIJ2VuGZJFVUYqijeBwXGRR48sQT9jQXq7prxPnDwTkCf6BEZL9coL9oS
	d6x/UrouySqpvyGBpg+ccx/jFksviPnrp8Asbytg45zGGCWCZJoCuyyY3NGFoF9JMk08Nnmi8hnYu
	JngNURVUQc5beNnmPwekI3b4zegRAq0UFxi3e/IIFcUUtCh4Y33c9CZVdRnMbNM6WvF6jkEh9fWQ3
	YqTiNOzgf4cG7eFobj82ekqPHFEicQKu0gKveZ2YxbaoIEKzzqel9how42ysp/rsLitWhio3G12VB
	5SDu4B/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSCe-00000004XT8-3PLl;
	Fri, 09 May 2025 18:12:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQ8E-00000004BwV-3S1n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEA355C48FF;
	Fri,  9 May 2025 15:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211D3C4CEE4;
	Fri,  9 May 2025 15:59:20 +0000 (UTC)
Date: Fri, 9 May 2025 16:59:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	suzuki.poulose@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	akpm@linux-foundation.org, paulmck@kernel.org, mark.rutland@arm.com,
	joey.gouly@arm.com, maz@kernel.org, james.morse@arm.com,
	broonie@kernel.org, oliver.upton@linux.dev, baohua@kernel.org,
	david@redhat.com, ioworker0@gmail.com, jgg@ziepe.ca,
	nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
	smostafa@google.com, kevin.tian@intel.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [RESEND PATCH v6 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <aB4mVtzLaS-YCzW2@arm.com>
References: <20250428153514.55772-2-miko.lenczewski@arm.com>
 <20250428153514.55772-4-miko.lenczewski@arm.com>
 <20250506142508.GB1197@willie-the-truck>
 <78fec33d-fe66-4352-be11-900f456c9af3@arm.com>
 <20250509134904.GA5707@willie-the-truck>
 <9bb94fe8-d605-49b4-91f0-0ad6d527b320@arm.com>
 <20250509142852.GA5845@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509142852.GA5845@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_085926_900748_2A5D23D1 
X-CRM114-Status: GOOD (  26.54  )
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

On Fri, May 09, 2025 at 03:28:53PM +0100, Will Deacon wrote:
> On Fri, May 09, 2025 at 03:16:01PM +0100, Ryan Roberts wrote:
> > On 09/05/2025 14:49, Will Deacon wrote:
> > > I wonder if we could treat it like an erratum in some way instead? That
> > > is, invert things so that CPUs which _don't_ have BBML2_NOABORT are
> > > considered to have a "BBM_CONFLICT_ABORT" erratum (which we obviously
> > > wouldn't shout about). Then we should be able to say:
> > > 
> > >   - If any of the early CPUs don't have BBML2_NOABORT, then the erratum
> > >     would be enabled and we wouln't elide BBM.
> > > 
> > >   - If a late CPU doesn't have BBML2_NOABORT then it can't come online
> > >     if the erratum isn't already enabled.
> > 
> > That's exactly the policy that this cludge provides. But it's using the midr to
> > check if the CPU has BBML2_NOABORT. I'm not sure I follow your point about a
> > "BBM_CONFLICT_ABORT" erratum?
> 
> I was hoping that it would mean that each CPU can independently determine
> whether or not they have the erratum and then enable it as soon as they
> detect it. That way, there's no need to iterate over all the early cores.

But then we'll still have to disable the feature if one of the early
CPUs doesn't have it. As a local CPU feature as per the errata handling,
the feature (bug) is advertised if at least one CPU supports it. Here we
kind of need a combination of system (available an all early CPUs) and
local MIDR check.

We might be able to work with two features - one SCOPE_SYSTEM for the
sanitised ID reg and a _negative_ (deny-list) SCOPE_LOCAL_CPU for the
MIDR. Or probably a single CPU-local feature, but negative, that checks
both the ID reg and MIDR, let's call it ARM64_HAS_NO_BBML2_NOABORT. If a
single CPU does not have the ID reg or is on the MIDR deny-list, this
"feature" will be enabled. For late CPUs, if NO_BBML2_NOABORT has been
enabled, they are allowed to miss it (OPTIONAL_FOR_LATE_CPU). However,
if NO_BBML2_NOABORT is cleared, a late CPU is not allowed to have it.

Hmm, if I got the logic right, that's what
ARM64_CPUCAP_LOCAL_CPU_ERRATUM means but we need to negate the feature
to disable the optimisation if at least one CPU is on the deny-list or
missing BBML2.

(or maybe I haven't had enough coffee today)

-- 
Catalin

