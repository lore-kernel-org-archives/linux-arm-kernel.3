Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E62CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qXSZJMK/2dH8m/b+M+8pKJBgl6M5At4J1MYXkelW14=; b=qHfi10e1z/Duf0NYrQWFaoDzZK
	GRifoSrO+BF1UVegIK9ji1+StsAT5UvfWiohgteSfyBm8ADzf7BVunJf8BqZnl39DyTpKZle8D8Wx
	VP7LpYD/5AmxtZcsOy8v/TPA68GfKJPXV+EgSkbCfub03VWbEBr2WHauYwIQ1Nj5UJhnCYiDe/k0V
	KOXZRwo/gsYfh/SG5C/HZTTQsqdDpKjx6N0tf234GvaK5Pnf0sambSPTeubwUFogqCU0prsvdliwa
	Aaw7KGCaGiGkE059VppK21+xQFPSjLxHAm8TtE0o/sz3HDwOxhv9y9T28/GlBqVgowS/FhQjurmbU
	69coB75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrJR-00000001z40-3Pb7;
	Tue, 26 May 2026 12:55:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrJP-00000001z3N-1unY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:55:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15BC0169C;
	Tue, 26 May 2026 05:55:05 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1B823F86F;
	Tue, 26 May 2026 05:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779800110; bh=VxSbsncF9vADETy7fhLZoS22+L7DTIEAKMxSb9WtYrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fo5a9G0/UR1rJmXRW8xYXjhAvtLS2+70sZ6z1sOp/HlSEMk0q9pDFKe5TXJFhEe9p
	 Bus1NUBvRv9ywGtrw5jgFylzEHIQv/5HBa9k1qcjGljFnL/ePc8CNz2C2IXRURJUTt
	 6oHeIDtNLGjpysUwLQableFVV5GxivWDR9z3iuXQ=
Date: Tue, 26 May 2026 13:55:04 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 04/30] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
Message-ID: <ahWYKJ5zOrnNnAgI@J2N7QTR9R3>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-4-43f7683a0fb7@kernel.org>
 <agGwWE2hcj9O4EGu@J2N7QTR9R3.cambridge.arm.com>
 <agHOvFiI1e3y_ur4@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agHOvFiI1e3y_ur4@sirena.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_055511_545291_F40FEEE9 
X-CRM114-Status: GOOD (  16.87  )
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

On Mon, May 11, 2026 at 09:42:36PM +0900, Mark Brown wrote:
> On Mon, May 11, 2026 at 11:32:56AM +0100, Mark Rutland wrote:
> > On Fri, Mar 06, 2026 at 05:00:56PM +0000, Mark Brown wrote:
> 
> > > +#define SME_VQ_INVALID	(SME_VQ_MAX + 1)
> 
> > Does using (SME_VQ_MAX + 1) for this make something easier than if we
> > used 0?
> 
> There were checks for VLs less than $THING which were causing annoyance
> IIRC but it should be workable since we shouldn't offer SME to guests if
> the invalid VL comes up.  I'll look again when I'm back from holiday.
> 
> > To solve all of the above, I think what we actually want to do is find
> > the largest uniformly implemented VL which is smaller than the smallest
> > partially implemented VL.
> 
> Yes, that's what we're going for.

To be clear, that was a concrete suggestiong as to the algorithm.

I'm saying we should have code along the lines of:

int find_virtualisable_vl(struct vl_info *info)
{
        DECLARE_BITMAP(partial_only_map, SVE_VQ_MAX);
        unsigned long b_min_partial, m_max_virt;

        bitmap_andnot(partial_only_map, info->va_partial_map, info->vq_map,
                      SVE_VQ_MAX);
        b_min_partial = find_last_bit(partial_only_map, SVE_VQ_MAX);

        /* All implemented VLs are virtualisable */
        if (m_min_partial >= SVE_VQ_MAX)
                return info->max_vl;

        b_max_virt = find_next_bit(info->vq_map, SVE_VQ_MAX, b_min_partial);

        /* No implemented VLs are virtualisable */
        if (b_max_virt >= SVE_VQ_MAX)
                return 0;

	/* At least one virtualisable VL exists */
        return sve_vl_from_vq(__bit_to_vq(b_max_virt));
}

Mark.

