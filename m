Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829C9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 05:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgqSKaqnxb0//AWMV2w3zW1wwWWAW82DHz+WDbuqYDQ=; b=b6brbdxIdvuYxp1lPvQeOP3fx2
	D/5t1OOwflbgG41ieo2yRdNMhTuDWv3T60/Nn7H5CH2Zij/Cm4uAP4KWRjkCiSB8bwEmFNV8G4D+u
	gEot1FRLaL/Hl3z6adgFwRNc/71ZhuRdoKcy8NVKB+sdFQH2z3gmhHWJboFhF9nkLIHPwJ3g6Hu+k
	hsTc7vxa6sCJg9vdcPXny9kir/jYg5XSIYwZ1mPWmsHqy6LCgLzp0yD0rjxEPA/OerCXPElmBNX+L
	OIp15luKVC8Olqg464x5ZOKgpDBqIqa5wafs/aZHOpUn+bo/fzNdJlJI4YyASItU3DwnVlMTRRsxo
	/gVYHaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoMX-00000006Ufc-1uXw;
	Thu, 24 Jul 2025 05:19:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoI5-00000006UJW-33F0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 05:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7BCA45821;
	Thu, 24 Jul 2025 05:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22535C4CEF1;
	Thu, 24 Jul 2025 05:14:44 +0000 (UTC)
Date: Thu, 24 Jul 2025 06:14:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/8] arm64: uaccess: Add additional userspace GCS
 accessors
Message-ID: <aIHBQl9V0rMM1pjY@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-5-jeremy.linton@arm.com>
 <aICwaQZxK5Spjj8G@arm.com>
 <2a6e1c4b-e8b0-49e2-896c-65c55103b017@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a6e1c4b-e8b0-49e2-896c-65c55103b017@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_221449_790900_289CB96A 
X-CRM114-Status: GOOD (  22.27  )
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

On Wed, Jul 23, 2025 at 12:14:17PM -0500, Jeremy Linton wrote:
> On 7/23/25 4:50 AM, Catalin Marinas wrote:
> > On Fri, Jul 18, 2025 at 11:37:36PM -0500, Jeremy Linton wrote:
> > > +/*
> > > + * Unlike put_user_gcs() above, the use of copy_from_user() may provide
> > > + * an opening for non GCS pages to be used to source data. Therefore this
> > > + * should only be used in contexts where that is acceptable.
> > > + */
> > 
> > Even in user space, the GCS pages can be read with normal loads, so
> > already usable as a data source if one wants to (not that it's of much
> > use). So not sure the comment here is needed.
> 
> Right, but userspace isn't using it in a privileged context to emulate
> operations that have a permission check performed as part of the read when
> performed by the HW.
> 
> This comment was added in V2 following a number of conversations about
> whether this was an actual risk or something that is only a problem if a
> long set of pre-conditions hold true. Conditions which can be summarized as
> "it is too late anyway".
> 
> Hence the comment to remind people that this routine isn't assuring the page
> is correctly marked.

I think the comment on the load function doesn't make much difference
since LDR is permitted on an GCS page anyway. It's the pop function that
we actually emulate without proper GCS instructions that's more
problematic and won't be checked against actual GCS permissions.

> I will reword it a bit if that is ok.

Yes, please do.

Thanks.

-- 
Catalin

