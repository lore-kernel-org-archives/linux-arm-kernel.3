Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A333CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnRd3UIwh+9qZhSCRQpcmxah3gyiZrVdc2k35mDPlXQ=; b=MFhOH53ImU8YmbxOC1cu7uVyTE
	UMexuJmUyYhaxoUfZGMFtsLVFPOtTtIBmXOMsqqaf2RJBluLVy1ARTq238xNR7yu0gV4BWOo0aosg
	ucdKL1F4A7FNPuXUo6NEcx2U9jvMiU0igR4KogHas65DCmsEb8HzsvZrgewGn75UD6rGIirjFJvnC
	YIWTgKYts9qEx1GkaJyVP5ksvTIWyEArlszUfdTbX9oNWTRz9aN/LxkZ6gRcIvvj/4CVd8n+D2X5D
	P4bdrzQVyJhEiYwR37t/GLI9NK49ODBy+pD8vmBa1IBH6xFeIjpCrapYNww8dAe8gFb/283543eTj
	wdY+tk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIm2A-000000071jX-3W2q;
	Tue, 11 Nov 2025 10:55:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIm28-000000071jR-3SNd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Nov 2025 10:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xnRd3UIwh+9qZhSCRQpcmxah3gyiZrVdc2k35mDPlXQ=; b=C5eRZQTaySI5US1pSO5wDw2NYR
	32s1bpXC8pyo8HHTfDBR/mteI4rLGoP6FrtIJK+Dw8jnhwFgyVC9oyVrEFE1yMIVClqRGeN+3nizJ
	WLKEsvrvkrg6C+M63UXfcMO8zQXCcwap4v2IJN3v5WGTrNZE1Qpwbqv5Yv+lJEjszB2z3VdctDVP0
	hxRTPDmSyWwfXATdKCZf8dz1qVOGdWa0Sck3qJAU2QvcUMMU9Zl/KjKCNK3Ew3aZos7B9IgHSdibz
	5wULk7flcbk98o+9ZkgyvojJOLvB3K1q7tv4NxVPXm1NHcxvv+zQux2aRr0Nk/PMVQbidIRHiduKy
	7qOTS3nA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlAN-0000000CyGv-3VTa;
	Tue, 11 Nov 2025 10:00:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6527A300328; Tue, 11 Nov 2025 11:55:26 +0100 (CET)
Date: Tue, 11 Nov 2025 11:55:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v9 2/5] perf: arm_spe: Add support for filtering on data
 source
Message-ID: <20251111105526.GI278048@noisy.programming.kicks-ass.net>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
 <20251029-james-perf-feat_spe_eft-v9-2-d22536b9cf94@linaro.org>
 <20251110154827.GA278048@noisy.programming.kicks-ass.net>
 <8078e440-e97c-425c-b046-987b642640f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8078e440-e97c-425c-b046-987b642640f7@linaro.org>
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

On Tue, Nov 11, 2025 at 10:51:56AM +0000, James Clark wrote:
> 
> 
> On 10/11/2025 3:48 pm, Peter Zijlstra wrote:
> > On Wed, Oct 29, 2025 at 03:46:02PM +0000, James Clark wrote:
> > > SPE_FEAT_FDS adds the ability to filter on the data source of packets.
> > > Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
> > > when any of the filter bits are set.
> > > 
> > > Each bit maps to data sources 0-63 described by bits[0:5] in the data
> > > source packet (although the full range of data source is 16 bits so
> > > higher value data sources can't be filtered on). The filter is an OR of
> > > all the bits, so for example clearing bits 0 and 3 only includes packets
> > > from data sources 0 OR 3.
> > > 
> > > Invert the filter given by userspace so that the default value of 0 is
> > > equivalent to including all values (no filtering). This allows us to
> > > skip adding a new format bit to enable filtering and still support
> > > excluding all data sources which would have been a filter value of 0 if
> > > not for the inversion.
> > 
> > So from that I'm reading the config4 field will only have like 16 bits,
> 
> The _data source_ is 16 bits, but the _data source filter_ is 64 bits.

Ah!

> It might be clearer if I add a few more words to differentiate "data source"
> and "filter":
> 
>   Each bit of the 64 bit filter maps to data sources 0-63 described by
>   bits[0:5] in the data source packet (although the full range of data
>   source is 16 bits so higher value data sources can't be filtered on).
>   The filter is an OR of all the filter bits, so for example clearing
>   filter bits 0 and 3 only includes packets from data sources 0 OR 3.

Yeah, that might've helped :-)

