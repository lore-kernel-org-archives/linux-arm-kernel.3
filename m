Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FD1C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPkUx24Vo2aYicjoHowpupWEI4Zc1uKXg31kPYaUYQY=; b=1X0hPhXiASry/Z66plMGREXQku
	4iL4ymJzCrdFRqpv4BXhNOqAXTNhza8hh37x7zJlI+70usR8TOTqGdE2Kqr/0rPpvuRnE9K6To0s3
	WE3AicczxyZHXZl16f0RZhxSQ9MpOYqm1kzYJg31oDKX2q47zv1ecE+QgUuSdNjcM0Ch0NqdWgifH
	offuEI4AlJzosAyu+EeICiLDdsvZ+EVvwGvkxtfe5t/yP+OYVowtajDm2ip6mHJNo2JIkhJajl3wZ
	OkEXBbyD0vDnhhNgQEEs4QppqaAC32QN2imm6bP3/dzhIBRs6Psox5C+AnqXyjuqIM1OtARsjUBJa
	ZbL6PHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQa6-0000000AVrT-1IJ2;
	Thu, 17 Jul 2025 15:31:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPcd-0000000ANep-2KGs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 14:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1CA55C077F;
	Thu, 17 Jul 2025 14:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D731BC4CEE3;
	Thu, 17 Jul 2025 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752762606;
	bh=0WzZkjhX8wGliBownxT0mAsfFW9ZWAVlF7kWj0BjBVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWQb4Zewxy9SCl7yC+evEFFUBAjupypasKkfzhneL8szoKWz2KRwNYzyViM9Gwi7G
	 gsK/ejuYavl/DjQlM5v/1g6ixBSaS14caJ3bsr0qFvRfgsCb5cEKEiLmkr6O0rG9wj
	 7QsS9I7ixvB0R+wy6EesUn6EQ/imsCIN4d6lmMUeYz4A2aKWmwZHX3k/0gs7b/LdSi
	 DbH25ErAqiaqbcBEBoV5qGVDcoMsEucJgaVcYCD4utMxqd8zz7JoHzTUtTBU53V9b7
	 gx8OWNCAf5tTG/Hz09S5WFxIc//1QUdjdaa2TGK/iuyA7uV8v4BZWf6OnoBCodtZto
	 YayyHUOrxqkMA==
Date: Thu, 17 Jul 2025 15:29:59 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 07/10] perf: arm_spe: Add support for filtering on
 data source
Message-ID: <aHkI5_IOV35L4YJa@willie-the-truck>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-7-71b0c9f98093@linaro.org>
 <aHUOig-kaRo15ZH5@willie-the-truck>
 <7f51d4f9-7e08-49b5-ab43-8bc765bb2ca8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f51d4f9-7e08-49b5-ab43-8bc765bb2ca8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_073007_676502_4CFDE9D6 
X-CRM114-Status: GOOD (  22.48  )
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

On Tue, Jul 15, 2025 at 02:04:18PM +0100, James Clark wrote:
> On 14/07/2025 3:04 pm, Will Deacon wrote:
> > On Thu, Jun 05, 2025 at 11:49:05AM +0100, James Clark wrote:
> > > @@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
> > >   	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
> > >   		reg |= PMSFCR_EL1_FnE;
> > > +	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
> > > +		reg |= PMSFCR_EL1_FDS;
> > 
> > Is the polarity correct here? The description of PMSDSFR_EL1.S<m> suggests
> > that setting bits to 1 _excludes_ the FDS filtering.
> > 
> 
> Setting filter bits to 1 means that samples matching are included. Setting
> bits to 0 means that they are excluded. And PMSFCR_EL1.FDS enables filtering
> as a whole, so if the user sets any filter bit to 1 we want to enable
> filtering:
> 
>   PMSDSFR_EL1.S<m>
> 
>   0b0  If PMSFCR_EL1.FDS is 1, do not record load operations that have
>        bits [5:0] of the Data Source packet set to <m>.
> 
>   0b1  Load operations with Data Source <m> are unaffected by
>        PMSFCR_EL1.FDS.
> 
> I think it's all the right way around and it ends up being the same as the
> other filters in SPE. Because we're using any bit being set to enable the
> filtering, the only thing you can't do is enable filtering with a 0 filter,
> but I didn't think that was useful. See the previous discussion on this
> here:
> https://lore.kernel.org/all/5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org/
> 
> Reading the "Data source filtering" section in the docs change at the end
> might help too.

Sorry, but I still don't get it :/

afaict, if any of the bits in 'data_src_filter' are _zero_ then we
should set PMSFCR_EL1.FDS. That also means that a mask of zero means all
loads are filtered, which is what the architecture says and is what we
should provide to userspace.

Will

