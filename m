Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA071C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZO+CuLetaTJpUNxxsNmcxZ2zY0gVwrRgHqGQbQ+ftg=; b=ZCkxn9noGCzkxkBEI0LpWO+wZd
	XuqKs9/v6iX4u94BEErUgNtWSIxAnGGQsXFq/kPvkDP2cA5J5A6hP1DikHKq4XqkfxZNDwTIvxB4I
	XlMaOp9aQmBWQRZOkA32BDSJrQC5KNqB2GNocSNehtXx2xw0djBE+8upiNLkR1UIdj2GxSCgndKFJ
	e8gVwzUt1+3JPo5bUoExdDueDZqtn46VXmPJ8MgQDBCWrZt3+TKn4qtSF5lF6P2Yn4Kce4lwShvzE
	xvKVmBesdLsdAQn/96oKqEwp46NGoSvmq9w0W9yW2uCLyC8Q4RASPUbmTIInFC5U7f0aTl3Wnn03O
	eHAqTDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QgI-000000091SG-0w8R;
	Wed, 23 Sep 2026 17:22:55 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Qfa-000000091C6-18yU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 17:22:16 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6b1ae6f1635so158147eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790184129; x=1790788929; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZO+CuLetaTJpUNxxsNmcxZ2zY0gVwrRgHqGQbQ+ftg=;
        b=WME4IZMEOeXZhXglCfxgxF5/jB6iDzC8JS/lG+C/Wo6tL1NADfxX547hCzw8McdKGn
         ul7+8t4dISo5BDJUNEZufLLcVYKq4AeblP5aZu6677fIXwDkTodXe2RJqVn6wcldAp+Q
         IOGYk1GuLqBHAmTQG8ufStLBfSlsK40r0FOrFtTmthWYAFviCTfWoMlRrLhWWE77A6hl
         g0uhbJ1dg6j0f8SictVzSEdYRnChpkORaBfCuUbRbVxPWTIG1VMLaHS//ynczin05YCy
         kHaWphiWvldlaaHDDq/Z52D8hSUVaYqiWH51/L7asf087KgjIOwjXO4kz1pe8TDM9l+3
         8kHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184129; x=1790788929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZO+CuLetaTJpUNxxsNmcxZ2zY0gVwrRgHqGQbQ+ftg=;
        b=F87en+ykbeszNeBV5tf2bhODOaqs4JA6JQHP+XRxwTrDt2NUCU/TOZksVsyCEEdo6m
         XOKGE+Qi0jDX0JzrWp5wXMUBSZmgCsxyVi3ARdj7nELrpTDL0n7RQBNbXr+u9OYG4Q3A
         bTkOV4Oe2lWy6Kqqhz0UaMs2E0iPcHiWYkDlXoN/mLAYihMl327s1N1cCbFqnZ8+oc9l
         rPGGG1tm6dYhdhWPySEbjqQXAmZNKyaeJexrbcmN9QovWg47oVJizFD/1cI/42L1TW3S
         vqIOYBnI4ISrYSlleV9pIG5/BIP/0CDu22rOZv/SBDyu7HHrQEqOlUq7lBqncYhiAgFB
         SRpw==
X-Forwarded-Encrypted: i=1; AKwUvBxS8U2tbZrlqtg5VPGXZohGFWkfgGT+727n40QROLrX0V1VacLW5UGdEk3d62Oee3xgbKgu9dPjkISXcUQUd7vM@lists.infradead.org
X-Gm-Message-State: AFuF++mVsthnjvHLZre/Sw2UbTp3YFu5vqPZV0AJB6MxFCy1IIhwFwNU
	p4qyvS0F+82QOzWWEH+ZgiMD0R/4n2mpbL04G2nfi2N5/J6sRd12kDEW9A9M+3g+6TkjF6ydpW9
	87P5k
X-Gm-Gg: AYBFou2Hr84S/yZZ3Qgj5YZHtiIk5be7pZ+BFsRWFq1uxCXMEWc8vbRSYlH/8WAuZS5
	siIrLNVCFyRQoDda6cGNdTN0ScokjvNzFw+vBQBpdHGI3Dgi/a74B9y2yILzrzRhLsPOIHk+l7e
	qaNsM/11PgNZbkBh5Yxig6N2scfJYP2PMxmi4pMR8CfCdIVsnH9vUQWLFEKRMDJp7kUoEOQrT92
	Ig43TJf812r5yXvYjP/55Dse6tFIiqT4GcyeHI0oUMLZ3g264zs7hUF8fIbTwBjAOEAvoGd00Li
	qmOGZ11Urq4JDSVhuiD0jLcCGmFrqHmCMD5Dfx10nsWJw+vRsFfXSC1aDqTINLS0pOp5Jo+UgdV
	4ER6epwfkRQoDy42m23P33hanzhQBiweHG6q6p0/Gq3upPp4eXi/qDkqm60yOEC5NRYjf+Uumxv
	Z+3pVE3KtB4iBY0M42EyX13D1VMU/441Bh6vcj4/hBQd4N6hxK8QJkCTg=
X-Received: by 2002:a4a:ee12:0:b0:6bd:c175:521d with SMTP id 006d021491bc7-6d2d023f352mr2916611eaf.11.1790184129300;
        Wed, 23 Sep 2026 10:22:09 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce25c058sm2985571eaf.5.2026.09.23.10.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:22:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9QfX-0000000E9a2-3usD;
	Wed, 23 Sep 2026 14:22:07 -0300
Date: Wed, 23 Sep 2026 14:22:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <20260923172207.GL1540250@ziepe.ca>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-12-smostafa@google.com>
 <arMbxX+sqTS3gByB@nvidia.com>
 <arO9hGmEx7c9mZAj@google.com>
 <20260923155507.GJ1540250@ziepe.ca>
 <arQHamIHuaUqlJyy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arQHamIHuaUqlJyy@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_102212_046283_6E266E08 
X-CRM114-Status: GOOD (  19.54  )
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

On Wed, Sep 23, 2026 at 05:07:54PM +0000, Mostafa Saleh wrote:
> On Wed, Sep 23, 2026 at 12:55:07PM -0300, Jason Gunthorpe wrote:
> > On Wed, Sep 23, 2026 at 11:52:36AM +0000, Mostafa Saleh wrote:
> > > I can add more info in the cover letter about the code split. Mainly:
> > > - arm-smmu-v3-kvm.c: Is the kernel driver for KVM SMMUv3 (this runs in
> > >   EL1 and can use all the kernel functions).
> > >   The main job of this driver is for discovery, it doesn't do anything
> > >   else in the runtime.
> > 
> > Maybe call this el1 stub or something like that?
> > 
> > guest_pkvm_stub.c
> > pkvm/hyp.c
> > 
> 
> It is not really a stub and I was following the convention of
> arm-smmu-v3-(iommufd/test/sva) I think for the pkvm/ one it can be:
> - pkvm/arm-smmu-v3-pkvm.c
> - pkvm/arm-smmu-v3-nested.c
> - pkvm/arm-smmu-v3-el2.c
> - pkvm/arm-smmu-v3-hyp.c

pkvm/arm-smmu-v3-hyp.c reads well to me

> All of those are fine and for the other one:
> - arm-smmu-v3-{pkvm, nested, el2, hyp}-init.c
> - arm-smmu-v3-pkvm-el1.c
> 
> Anything along this lines, otherwise it's too vague IMHO.

arm-smmu-v3-pkvm-init.c seems clear?

Linus has complained about the stuttering before, so think about it..

Jason

