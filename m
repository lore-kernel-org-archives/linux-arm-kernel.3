Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52387C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyXgf/imt42EyjU9r/iWXqABk8Dr5fOp0hkHgXnc/1I=; b=4L9yk0ZwyTQMKjncRbVeaoKLmB
	JFkAMNLwKG0DyhIHoJucQh71PcVUDOVfhEJrVh35aBu+bt2Rhqrq3NQZ3dXwlblkOWQByOwr+e1dq
	1J0y1v9Gpwt61QLxDgVAddBbKUYVIW7+JnQcXgFYoQNESddvCbgkBAwo0i1LURw/7FXuEe6rdU+3X
	TD7oTrJm/9ln6+dBiEXcXVEwk/racXQCbMWQgXF8bt34waUp9fHFJ2CIv/BcEkInYWP4uITrTA95j
	h/xK+rzEQWRHUDGfnvcPI0w//veN4g9XI9S12oXBJjil9+4vXsoYPIkwGTV0fWUgRleTfhLBPZvi7
	WbuZM+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWyj-00000003neN-2Bp4;
	Thu, 27 Aug 2026 10:05:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWyg-00000003ndb-1eW6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 10:05:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-499add6348fso31415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 03:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787825095; x=1788429895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cyXgf/imt42EyjU9r/iWXqABk8Dr5fOp0hkHgXnc/1I=;
        b=Y8fNbQbhIVq4UGtoKorp2+FfwxEggSG2V0nNWS5PQ/Dwa02+y6m9WM4c95SqMtSugk
         ydGAmz4+gP4X8S3ppVVIa+3wYw/EBuqALqCv+QFRq1lps1uXLj6g88cGhla+DbKD4m5+
         2sG67N3bjvTHG5QCVLA/Bga62dM48nrHUhyfFruu0j9B4O9KQP7k0MkL+1Lq8m6PhWmv
         XHrH32swvV0pLy8owLB29vuBwC+4Csoweh8EfrxD0DhhHBp1t8MqldsSFdmwHtP9H3QX
         Qgt8bvpZUKcmbgdsD319Lyxf2E76SZzUvZlELLxiMLuatK5AxXXJTu5m0xy7I6zVsJgS
         Mf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825095; x=1788429895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyXgf/imt42EyjU9r/iWXqABk8Dr5fOp0hkHgXnc/1I=;
        b=sNHsiG1D3HlSucDudUx20yvSx9hoxERQ2ezLfX/1TY12aAqj7JxF/31SYn8K9oVBR6
         HlzUyf1qGuPmplru7hACBl2vugRoVGABzwkHx5PbmBDBdCGIi8sS1WKzo52K46fMl7tb
         7/86IGrYl7lp5US2iKFh9wvIBHt7ni74TMab8HcNcCDVaqtYlHtFUxxBe49IF32yFgQh
         iprRT9sKHjWiEuU37l/cTNjCA6vJZPJZFxS3hJBUPSJY0zVyEaRsCZ3q7/P5kgpUIu1p
         6kUoHUsnm7NQgANhyCOdaTSRRnW9T+zt7o7wQXW6FvJgQKodoq1HAyM7v4OoUz+elSp9
         c4OA==
X-Gm-Message-State: AFuF++lAG9s7Rr2bv4juT0wL77l4e0IxJCXrGFr3YLWVUVGVYox6Bc7g
	Y86fFjaK/9TwF8NPd6ZaDDwt2noV0OUP+HusI6xKn4E6wGPfhYt7+Gae/yg0en6jcQ==
X-Gm-Gg: AR+sD13YGWF3vAumQS04kdEtRCNVwuWbz82JmVaVfmQPrf44ZWIY/PDNONksxvOho7G
	w/6vVqjOJ8AiGUZsJY+x76yy3EngZCqZRBa3FTdc/ErjHRzfm0zKr7d0VVhIF+PhOoXBoU7h2M9
	K2k/VSskhBXvHYZqqsFSXLDxeGgeCHv49e1gE5SuO32lRWKwunxK8/LuBuOajA8aisW6QC2dTAo
	J9TZjeEaVCvzK7CobYE4z8yTzKY0IetgTGTasKaKenkx779CFccs9f/tuOjBMoHv/ldwhmGAGBw
	SCy/jIa5wU33zcP+wtO8Sc2xyg17kII/Chvsn+cpYzsDQeGHURMkxTLCT5Yvf57oYT+wGL/3yyq
	LkbjPQRfe6OdfsppJNYsCvhTxcwXrQ0jwBpSwWX6x8fnQlbVCgwtbo9uoXbgSTEUa97/UiIBGr4
	Ntxaxefm1NO9GGtyb8z3/PE/sAo7Pyz1dZA6IKLHyYGVKNq4r2tXLF/D3CBj7PnbUkr5/21nhaN
	667JHGApPW5WRU0pgPlsMjViwcYQA==
X-Received: by 2002:a05:600c:68d2:b0:499:cb15:4511 with SMTP id 5b1f17b1804b1-49b0e6483acmr671155e9.8.1787825094654;
        Thu, 27 Aug 2026 03:04:54 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4af00fd2sm36028375e9.12.2026.08.27.03.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:04:53 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:04:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 23/24] iommu/arm-smmu-v3-kvm: Enable nesting
Message-ID: <apALwh7sRMsn7WS-@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-24-smostafa@google.com>
 <178769159057.3356902.13161185498161727294.b4-review@b4>
 <ao6puxVSNsLC8aql@google.com>
 <20260826123831.GA3667628@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826123831.GA3667628@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_030458_488790_05F78C0D 
X-CRM114-Status: GOOD (  37.73  )
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

On Wed, Aug 26, 2026 at 09:38:31AM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 26, 2026 at 08:54:19AM +0000, Mostafa Saleh wrote:
> > On Tue, Aug 25, 2026 at 05:59:50PM -0300, Jason Gunthorpe wrote:
> > > > [ ... 129 lines skipped ... ]
> > > > +	ret = smmu_attach_stage_2(&target);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +	hyp_spin_lock(&smmu->hw_lock);
> > > > +	cur_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(hyp_ste_ptr->data[0]));
> > > > +	target_cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(target.data[0]));
> > > > +	target_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(target.data[0]));
> > > > +	if ((cur_valid && !target_valid) ||
> > > > +	    (target_cfg == STRTAB_STE_0_CFG_ABORT)) {
> > > > +		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
> > > > +		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
> > > > +		for (i = 1; i < STRTAB_STE_DWORDS; i++)
> > > > +			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
> > > > +	} else {
> > > > +		for (i = 1; i < STRTAB_STE_DWORDS; i++)
> > > > +			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
> > > > +		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
> > > > +		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
> > > > +	}
> > > 
> > > This doesn't look good enough, a driver can't safe writely to a valid
> > > STE in any order like this, and it can't make it non-valid or risk
> > > breaking guests. We had this bug in linux already, the hitless STE
> > > update in the hypervisor is mandatory for linux guests using PASID.
> > 
> > This piggy-backs on the kernel algorithm, as described in the comment
> > in this patch:
> > +       /*
> > +        * Summary of each host emulated state vs real HW.
> > +        * |    Host    |       HW      |
> > +        * ==============================
> > +        * |    V=0     |       V=0     |
> > +        * |    Abort   |       Abort   |
> > +        * |    Bypass  |       S2      |
> > +        * |    S1      |       S1+S2   |
> > +        *
> > +        * For the host, any V=0 transition is not hitless, all other permutations of
> > +        * (abort, bypass, S1) transitions are hitless.
> > +        * For the HW state, any V=0 transition is not hitless, as all the S2 config is
> > +        * always the same (ttbr, vtcr...), all other transitions should be hitless too.
> > +        * However, the host is not trusted, which means that any V=0 <=> V=1 transitions
> > +        * or any transition to an abort STE we need to enforce writing order of the STE
> > +        * dword 0 and add CFGI.
> > +        * Otherwise, we write the STE in the opposite order to cover cases from abort
> > +        * to S2 or nested.
> > +        */
> > 
> > So this way, the hypervisor doesn't break the STE and keeps the host
> > STE transitions hitless.
> > 
> > Or there is an example that I missed and is broken by this?
> 
> If we are exiting S1DSS mode it looks like this clears S1DSS before
> changing to S2 only mode? That would be a bug.
> 

From S1DSS (nested in HW) to bypass (S2 in HW), the kernel STE writer
will do a hitless update by writing DWORD 0 => CFGI => DOWRD1-3 => CFGI
The hypervisor will transition Nested to S2 only on the first CFGI which
is safe.

However, it would be harder to reason about a buggy or a malicious kernel,
my impression was it can only shoot it's own foot with bad STEs.

I will give this more thought.

> There are also gotchas where writing things out of order can make the
> STE UNPREDICTABLE that must be avoided too.
> 
> We really don't need two versions of this stuf, just use the
> programmer we know it is right at this point.

The problem with that it needs to pull a lot of code out of the
SMMUv3 driver which has things as struct arm_smmu_master.
I will need to check how that can work, but I will try to avoid
that, specially this is not a generic STE writer it has quite
small transitions which shouldn't change in the future.

Thanks,
Mostafa

> 
> Jason

