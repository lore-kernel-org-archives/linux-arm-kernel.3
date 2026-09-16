Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E678BC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mP7FQL5HjcwNV8Xehg/d3gNT+XNR2SrjNIEhJ8VBWCs=; b=y2WUUNl6LATviJWiuQlBS1Jrdr
	VjXZTh62/9skHIC8VFTkzUKnyoifynRc5FWx8s2qRl9o55RNLj+WqKYjMt+54d4UPZIVpnN1g2Kln
	ANisuzxwQk8raMBTQTYWwrpzXQVRKRK7RFlwQUVmaT4K1c0xU67c2MyPAuhedDlEOvknZFAvqIT6E
	AZPOzfj0jwlsJae1skHrKSYma/GJ4r5fsi8KtcfNJ7N82tT9PANvGTfNPWw9mYD1AR1BybFt0pXjN
	e/RZEAcClCJvn4vAm6BHZGevAZ5MIV3bP8Yve587f7i7iOK8M5sGwrGYGd5Z/BAx7ghZ+z+mzDjAp
	dat+GIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lzf-00000008qXA-0kzV;
	Wed, 16 Sep 2026 09:31:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lzd-00000008qWN-2MSU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 09:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mP7FQL5HjcwNV8Xehg/d3gNT+XNR2SrjNIEhJ8VBWCs=; b=OY3atGHJkjVaGQKd+M6UqD3dlH
	fkqOvG2QFHCEjyaADqfm6BMZvNa0DiIybr+dwgmb39hhO9CWnwgf0UApXdemveQfm68UfsW2Dav5o
	RrdrMJ4v1aUJnvjxkaXd90dOvwazxswxcl7XbgibWZtv7ewifiLVmMgVSF6y1sttE9Ie//UlIAgQW
	NqGBWk+a+/a59XFXxkCaAdzc20iEyTRi1SaXJicuYn4++ndONqvfmc07SvjNPQG56f6gyeD1uL+nM
	cuEd+nIJkKPTo00NdymUXgQ4IQ0Wye7BStT29GcuH4mJDt+k8EwkEBQwazQdAObsL4kE/YMDIcCHF
	wZ6PV/GQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6lzZ-00000007gwH-46aT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:31:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE2B71516;
	Wed, 16 Sep 2026 02:31:44 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20E763F86F;
	Wed, 16 Sep 2026 02:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789551108; bh=la8IZH7YDw9SpimkZ00WJV6Uu78AQvTllZ8srncgV48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkVrWgyNZIfYoSjTq2nXj1v9dgPhjECHns2uDsk8j/reWdWO6k/k8YYt6AgeoYT1a
	 KHNlXDLeOLKCtLL5y3AvmboVa4iBJd7+Nn/EJaFVi5nkdgZzEdybvRvpaaFpDP+ih1
	 tUtY6+ZH1VaWfJrw5ZqDBzW1UyWC06AJ9qGirzfo=
Date: Wed, 16 Sep 2026 10:31:46 +0100
From: Leo Yan <leo.yan@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, ilkka@os.amperecomputing.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] perf/arm-cmn: Fix multi-filter encoding
Message-ID: <20260916093146.GG200420@e132581.arm.com>
References: <ec590cd4cc61b54d6ad3b306b69777ad7729c9d6.1789475062.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec590cd4cc61b54d6ad3b306b69777ad7729c9d6.1789475062.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_103150_286203_F373990D 
X-CRM114-Status: GOOD (  14.68  )
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

On Tue, Sep 15, 2026 at 01:24:22PM +0100, Robin Murphy wrote:
> The current special-case for EVICT_STATE_SEL filtering effectively
> assigns the "filter" and "filter2" controls in the opposite order from
> how the CMN S3 r2 TRM states "Filtering is programmed in pmu_hbt_lbt_sel
> and pmu_evict_state_sel". On reflection, not only does this seem
> unnecessarily non-obvious to users, but it's also likely to be a problem
> for scaling to a full multi-filter abstraction in future. There is a
> logical order to filters based on their bitfield positions in the
> pmu_event_sel register, which the TRM descriptions allude to, and the
> cmn_filter_select enum already (almost) follows, so let's fix the UABI
> to follow suit while it's still unreleased.
> 
> Fixes: 09178f536bb9 ("perf/arm-cmn: Plumb in new filter types")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

It's hard to say how useful my review is, but I went through the patch
and also asked AI to explain the rationale. It makes sense to me:

Reviewed-by: Leo Yan <leo.yan@arm.com>

Seems we could implement a generic way to navigate filters based on
the hardware bitfield ordering, e.g. filter_next(sel) and
filter_prev(sel). This can be deferred until we have more combined
filters.

Thanks,
Leo

