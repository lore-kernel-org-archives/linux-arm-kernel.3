Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F793C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyZcoDYsLDOa3jljtF+USnQN0n2vX9UR7xfVNnqT1/U=; b=17BP2iYM4qxCWBOj8hswPbnsPR
	ADM4VxaVnYhYg4xSzitXuZMsUpnVPdWPdTjqiIwcvu/odIWE5mUrD3BSaRF2UDEVIfsMQDeAFhu9e
	2PgWAKoxjKpmAp8zQVixzC4PLNjPEXy73TCybMbYxwwhULf2uK7U5xcnuhi8LEo7/+NlUYroSK50J
	9VAU7k0gSbpJKArjbZ8GmchbcO0y6KdIdEqeQVLUZxWdarmaB4IEM1VKdPPRcn/FOy4NgDJxfQkJy
	iFoyyG+7lcWKWIuuoQueJu4WzQ/oTu4etJomHbwpRIL1w+oOcXZgukQ1GrAQU3e199NMOEQMsBEMX
	C6b986Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkp1C-00000003Bop-1htP;
	Fri, 17 Jul 2026 20:18:46 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkp1A-00000003BoP-1vHn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:18:45 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-51c0c68aa31so49984861cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784319523; x=1784924323; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OyZcoDYsLDOa3jljtF+USnQN0n2vX9UR7xfVNnqT1/U=;
        b=X+8tIHkCrfpD1FflVAh3HJrBeTcCMVOABZ4SUo4YpSk92vaTb+YtBWAwDvhUAZt4/8
         KCF+LVCb7jiWSZXq+KMrtde+P57hbI7umlNmh9oXu42e1zMg/XoQImJcereMsMXIiJbZ
         /zViCSQUu6kxeX2BKg8ri0JVgI77l3VnPvvLVbH7bYVYwQ02oRu+BYWIQwL8m/3TKmwX
         4fO3/IPmqi4Bzpsm5dZ/0T7IEru7BTgx/y2VIg9JXjJYHRcMeRBrpGCIlOV4fuFo3tUO
         2MFWTWwgVUqCcsW/odCzDuj+pqgKR1g3y8uiCYvT9w5bK+r/KY8MT6s46lT2Nqrb5M/t
         u8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319523; x=1784924323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyZcoDYsLDOa3jljtF+USnQN0n2vX9UR7xfVNnqT1/U=;
        b=cOzDeBBE/SNqSbTq2Uezvuhd5u7PRLISPFx6Ie3+GIQcr3EN4GHs5UGbnaDxnw+LS/
         6Pj1dQowX7RL3lLdGFVCYOL7P/NcV2hXX+BT/K3nJ5QU7GXVcv4wDAe5yS9c4I7+ylAP
         ioNB6U5mutm2iYml0UAlc/HClIj3ekn4aLRamJDzj7sCATuvlBHRYO4dg+b2DR1K14l/
         Yah5wUE5cNy+e0/02gS3opK6Rryq+6ytqskWvad+Y3PQd/a7jeOy+OVidmgZV76BIvVM
         LZGFlQBe0Xd48lIxysCFg3ghfwSYO2c284vnsUzOnunSmFvZmkdVTcyYxFf/QTmhsSxO
         5MMA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5Bf9y9n0hXwVRcX7nIcX0esrmZ1SU60KNDRrR4TZ/baJZTAZEjKlZdnBNX1mhSo+dKLQUcUXKbDZKfRN5CGBC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt5MdDBSHRSVjh7Mi3QjaleqKA0rSePHq/yy5vGFsY2hDCjHNj
	9bmr+uvOw7W7dbb6dJHkW+c1T6AWObLII7w1Tk1MaDQYny65YiU0BbX4H8fGCeyhjRs=
X-Gm-Gg: AfdE7ckZQWcEBG8JIU/osyB5E+Cro2OX9ZEKo7O9+ZcKTV0QQRYCCOapGrXg6LJXF53
	XFV6tdYRwuBKAVWB4SIIqpM+gBhAg5CiAJ4Jr4pUv9zfU8OLfT50Bxk1Lmgt1a/e15ZXohvivhj
	BlbZzqdXTHF1A1ng6wlsTe0Cc30xY3b3MqEuJLzNOljUsvoO/BF8TDgTEPlVtyQwLQAmxHBrnCv
	sDrcWP2eQuUl9aP0A8ytBkcRcjP0EvcAZ3r4IiXkBZOmsRYhs625maVgEzjHNIO/lIw+/LWHfc6
	eo9y6JRvsy+rcnzR1+PlGRC5XYxWvkA3Ljn3u15jSgws0pmqxun6J9qz/REMxXRMxPsJedNj4/7
	tziyDeOKYIdiB8sPirYvgbWXE82HdMo1txSwR52IOhsLLZC0njg==
X-Received: by 2002:a05:622a:249:b0:51a:8a47:b578 with SMTP id d75a77b69052e-5213b72b769mr40771701cf.38.1784319523028;
        Fri, 17 Jul 2026 13:18:43 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-521502b9d5bsm19993871cf.31.2026.07.17.13.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:18:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkp17-000000052o2-3RvD;
	Fri, 17 Jul 2026 17:18:41 -0300
Date: Fri, 17 Jul 2026 17:18:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 2/3] iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat
 workaround infrastructure
Message-ID: <20260717201841.GC701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-3-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104202.1664187-3-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_131844_591670_6E3344CD 
X-CRM114-Status: GOOD (  22.61  )
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

On Tue, Jul 14, 2026 at 10:42:01AM +0000, Ashish Mhetre wrote:
> Tegra264 SMMU instances need every CFGI/TLBI command sequence issued
> twice, with the second issue executing only after the first issue's
> CMD_SYNC has completed:
> 
>     TLBI/CFGI ... CMD_SYNC TLBI/CFGI ... CMD_SYNC
> 
> ATC_INV is not affected and must never be doubled.
> 
> Add arm_smmu_erratum_repeat_tlbi_cfgi_key and an
> arm_smmu_erratum_cmd_needs_repeating() helper that gates on the static
> key first and then range-checks the opcode (CFGI_STE .. ATC_INV), so
> subsequent changes wiring the workaround into the CMDQ submission and
> iommufd batching paths can share a single predicate.
> 
> Rename the existing arm_smmu_cmdq_issue_cmdlist() to
> __arm_smmu_cmdq_issue_cmdlist() and add a thin wrapper that re-issues
> the same cmdlist a second time when the predicate fires. Register the
> new condition with arm_smmu_cmdq_batch_force_sync() and add
> arm_vsmmu_can_batch_cmd() so iommufd batches split at every "needs
> repeating" transition.
> 
> No callers enable the static key yet, so there is no functional change.
> A subsequent change will enable the key on affected instances.
> 
> Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 14 ++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 57 +++++++++++++++++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
>  3 files changed, 67 insertions(+), 5 deletions(-)

Because the VM has access to VCMDQ/etc it can issue commands directly
(maybe not on this chip, but as a general comment), thus invalidation
errata need to be made visible to the VM and we need to expect the VM
will generate invalidations to properly deal with any errata.

Ie I'd expect the VM to see a "nvidia,tegra264-smmu" compatible string
to activate the errata fix.

If so then we will already get duplicated invalidations here and then
we will duplicate them again. That's not great.

On the other hand if you want to emulate a generic and actually
functional SMMU device that has nothing like VCMDQ/etc then you must
do something like this in this patch.

I was imagining a general direction that we would expose the errata
information to the guest and the guest would have to deal with it.

Given this is the opposite I wonder if we want to do it. It does make
sense for a chip that probably doesn't have vCMDQ and I don't think
qemu can even create a DT description to trigger the errata anyhow.

But it starts to become confusing down the road if we decide other
invalidation errata (like the CONT must be RIL thing) must be delt
with by the guest.

So.. Maybe add a comment why this one is different, or maybe just
disable FEAT_NESTING if there isn't a use case?

Otherwise the rest is fine

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

