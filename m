Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9E8F532E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zW8uIB2NtF+y3+kz9J2beyUNt/ZqGaeyC2e1+yP+5Ok=; b=L0aryzftabfpfMLfaLzQCr5As/
	7nPAGeVfsPd5XlVVqXGFoHP+N2a8IvzKqEMln+KVRsxwKLue+mhOb0q52B5M/AOnHRqNBYhp8WLcA
	pLtzsUVWDQTMwjHiY2JFAONyA0ObilmGw4/rlvDUHUFd1n67AA/uhKyqyXQ6dizV17pnj/RTn574o
	c1+qH8r+FYAVYV6xUR1RLR7MA99K44quhBINB+2/MG+ePMq7FDPc+cEWR5WEwScNjq7eEJb0r7Aox
	/bPKf0ArcQSJd1CAH2PvkGN/QjHP/E93P80FKDh3Oi4LEBQZ3VVHwbRbaRM4Ek9yY0L4I+0w6Gf02
	JESxrEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wUo-00000000vDs-3dLy;
	Tue, 24 Mar 2026 07:48:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wUm-00000000vD7-1JKB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:48:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 489481476;
	Tue, 24 Mar 2026 00:48:02 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4E173F694;
	Tue, 24 Mar 2026 00:48:06 -0700 (PDT)
Date: Tue, 24 Mar 2026 07:48:04 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 14/20] coresight: Control path with range
Message-ID: <20260324074804.GD43072@e132581.arm.com>
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
 <20260320-arm_coresight_path_power_management_improvement-v7-14-327ddd36b58b@arm.com>
 <45af1506-c08d-4f7a-b07b-90666092680b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45af1506-c08d-4f7a-b07b-90666092680b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_004812_470627_35399CAE 
X-CRM114-Status: GOOD (  27.46  )
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

On Mon, Mar 23, 2026 at 10:01:52AM +0000, Suzuki K Poulose wrote:

[...]

> > +static struct coresight_node *
> > +coresight_path_last_node(struct coresight_path *path)
> > +{
> > +	return list_last_entry(&path->path_list, struct coresight_node, link);
> > +}
> > +
> 
> nit: This could be used for in coresight_get_sink().

Will do.

> > +static bool coresight_path_nodes_in_order(struct coresight_path *path,
> > +					  struct coresight_node *from,
> > +					  struct coresight_node *to)
> 
> I am not very clear what this is supposed to do and what it is doing ?
> Are we verifying that the nodes @from and @to are in order ? As, in the
> the link is from @from to @to ? In that case what you do may not be
> sufficient ?

My purpose is that coresight_path_nodes_in_order() checks if *from and
*to are sequential on the link.  This is a internal function to detect
any buggy code written in callers.

An assumption is all callers must obtain nodes from the path before
passing them in coresight_path_nodes_in_order().  Therefore, the check
is simplified to only verify that *from appears before *to.

> Rather, we should walk the path from @from and return if we find @to on the
> walk. Otherwise return false ? In any case,this need a comment on
> the top.

Sure, I will refine the walk code like this way and add a comment.

> Also I don't think this check is really needed. If we don't find the
> @to, simply disable the entire path.

If we allow @to to be NULL, we may also need to allow @from to be NULL
(e.g. in the enable path case).

Instead, callers can fetch the first and last nodes using helpers and
explicitly pass them to the enable and disable functions.  Although this
introduces some duplicate code in callers, it avoids complexity in the
enable and disable functions.

> > +{
> > +	struct coresight_node *nd;
> > +
> > +	/* Callers must fetch nodes from the path */
> > +	if (WARN_ON_ONCE(!from || !to))
> > +		return false;
> > +
> > +	list_for_each_entry(nd, &path->path_list, link) {
> > +		if (nd == from)
> > +			return true;
> > +		if (nd == to)
> > +			return false;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >   /*
> > - * coresight_disable_path_from : Disable components in the given path beyond
> > - * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
> > - * disabled.
> > + * coresight_disable_path_from_to : Disable components in the given @path
> > + * between @from and @to.
> > + *
> > + * The range excludes @from but includes @to.  @from is exclusive to handle the
> > + * case where it is the source (the first node in the path), as the source has
> > + * its own disable function.
> 
> Why not break that "hack" and always include @from and let the caller now
> use this helper to disable everything after the @source ?

Will do for this and below suggestions.

Thanks,
Leo

