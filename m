Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A27C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuTBrOfvCm76tZTU5xJSnq9MvRdv20v7nkLipK7J2Nk=; b=FAI8t6z4GWPDw7eg5zFme0kkQf
	avEI6Cci6eglsihzprP0j+VtPyMF5/zQ7RDyzE/JxZ0bH8YbnYOD3Fp0zuY3/KeaAKm755kh4sxaz
	IF0/ksTmxjMf7Zd/yykFBzIeIn+htFhdiwp3+k8B6akYkZdoNeSJIM3PRKXdnz9glR/Z/cWSxSIli
	KbbeBYgdJFrYSQ8yObp9D1pjumkB4qRUf2ZbSC5m2ypi1ZHvg7zvqgKfnXOowAqrQPNVFkPBbFkm+
	Jbwf2jzK+KgJH0QSSL6t8lVxnM3TQt97duDJ/F/4L9z6t3dzJ0dV8PXrWjFCkae0Zp4rJPqnyBqhM
	OjLEAJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K71-0000000BKEK-3AlG;
	Tue, 01 Sep 2026 08:44:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K6z-0000000BKDM-1OO8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:44:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so25605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788252294; x=1788857094; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BuTBrOfvCm76tZTU5xJSnq9MvRdv20v7nkLipK7J2Nk=;
        b=SyIg8HLSbTmLittszQEPU/p2nlR6oxR4Z6vJoSnpNTNz9bBAMehcAjAIBFRoPMJM8F
         saCSzpWHH0dSmTTKQbqVkBft/Q2K1QnfQwdpq71NckSH8hnoGipPh7z81kb9bX/4O5p3
         RbfBRvGOZ4w6mS/wsBsTQ5y++w0655uj1qn9a4FGSKZqGsoytQ70wWlich6kstFo+qJB
         0UWw7c/9EMAUReAvMngofSMGDt2k+wL1NJ5GNMx/P6Nv9CBm8q0dtG0KCba3O2tQL8yi
         +Hdcqis9l3Pq0eOnPkqx3vQninz1DIRLJkZfmTLiEzOOA36ayhaBzZykb3TUxZXjFP82
         Ureg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252294; x=1788857094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BuTBrOfvCm76tZTU5xJSnq9MvRdv20v7nkLipK7J2Nk=;
        b=aeo9KNfisLnFaQZEtpVG6gdUuVexl0hISdKs4ivMLxe5/CKWrruvymMpfimpOMaN1K
         li4Yb/QUiIeG5IcNi9p7S9QV8+qTP3z2X8LAt0TgmgCD5Jx/8ZXCBXDdZ9hfTBqUlEoH
         RFIc/xJS7/Opvag/pmAAIyjjIjTb2yJ0IO+PLAWwS6nRLYGhJBCEHRd1Zhuf4/gQxNZs
         cRuEfb7wOomc3llthS1Zaz0Ay1WHdVcRZg30GksFMeA65CP0Wr+1XFn3zqTRVzyOGQ2t
         z+ZmTu64h+vLG/DIE1quDkwL84aLsZiJZiewG19lOCazFdZvAewbk96sLa6gLz1pXdHr
         JHiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMZWyAMR2a0PVnmVED6PZvYDMxA10J8m448iw6mJVi3BvRAZJ3PPyb5+RMnn6OJBsDRZLg+cIuPZlfhveNJvz1@lists.infradead.org
X-Gm-Message-State: AFuF++lN0WjQnO6nPYAx861EjySiHqaQ3YFktVExlZ9XpmimUogVjbBT
	fE0SI2Gy6JT7Mv4EAjGHbqZTzO0SQdUyr4wgfDCloDBlMQSyUYaiQoAj/BRpll7Wvg==
X-Gm-Gg: AR+sD111RdJi3/1umMi9nunn5jKI7uJ/Qeoc5cstSzkyoT8jyvdMV3Myllhf/eyhxCF
	golsbvdlGCZrCYL2TE7ANESVgLEFUeBOec3v41Pn+Sq9AJqNY039ZrU2QQxAkqqAYYJ0Y7HwaXl
	qU9KdqoUo9E1omD1UQb8ockaor2Xo4B5sd3g0StATPzxPbygAcp0rkizLchq4gi54kOCqTouy29
	tx9H7MZDJZupTj31nS80P59bs2B522aUfqReG325KMUlxRw/01SzXcgwh2WtSQmU8k4QWgyq1+e
	0UDOHFlPYpCLI916wOL/7BXC4T0NrY185C1bJrmRDMtnwche1+s5YSZSkUa4nns4sre1ut0wAAu
	DnpdVNFhpziThgjlPLD0xlgFG5+e7HCl2gRvYbLpr8Rg1NYkJgXz16yk3YUvh4SRI239DSthKb5
	vskxskym9OHOWxV+Di4DYrH4MUcSOUxEadCp7TKqgkh8wAlECq7ycljquOSVViEdDEqtErvMzPJ
	1uQejkSTr0njtyRkYp4c2fwASoBEg==
X-Received: by 2002:a05:600c:e557:10b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-49cde7b12ecmr305735e9.7.1788252293875;
        Tue, 01 Sep 2026 01:44:53 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d78a0bsm3463359f8f.28.2026.09.01.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:44:52 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:44:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	praan@google.com
Subject: Re: [PATCH 2/7] iommu/arm-smmu-v3: Prevent rbtree corruption from
 duplicate streams
Message-ID: <apaQgcURYAuzBpAy@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260828125409.1921538-3-smostafa@google.com>
 <apGudts94pqFL20G@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apGudts94pqFL20G@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_014457_382313_81A806BF 
X-CRM114-Status: GOOD (  21.26  )
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

On Fri, Aug 28, 2026 at 08:51:18AM -0700, Nicolin Chen wrote:
> On Fri, Aug 28, 2026 at 12:53:37PM +0000, Mostafa Saleh wrote:
> > In handling PCI devices with duplicate IDs, arm_smmu_insert_master()
> > will continue the loop skipping the duplicate sids insertion in the
> > rbtree.
> > However, in the error path of arm_smmu_insert_master() and in
> > arm_smmu_remove_master(), the code loops over all fwspec->num_ids and
> > calls rb_erase() unconditionally.
> > 
> > For the duplicate streams, the node is zero allocated including the
> > parent pointer "__rb_parent_color". That means rb_erase() will think
> > that this node is root and it will corrupt the tree which includes
> > other masters not being removed.
> > 
> > Fix this by initializing those nodes with RB_CLEAR_NODE() and check
> > if they are empty before erasing.
> > 
> > Fixes: cdf315f907d4 ("iommu/arm-smmu-v3: Maintain a SID->device structure")
> > Reported-by: Sashiko <>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> 
> I submitted a similar patch a while ago :)
> https://lore.kernel.org/linux-iommu/9136477b9c737a50cecc38f2ee6704a01510169a.1783044582.git.nicolinc@nvidia.com/

Oh, I missed that, I haven't looked at this series. I beleive this
bug exists in the current tree so it is better to send separately.

Anyway, I ok dropping this patch if you want to re-send yours.

Thanks,
Mostafa

> 
> And I think the fix tag, as mine posted, should be:
> Fixes: b00d24997a11 ("iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids")
> 
> Before that commit, a duplicated SID gets -EINVAL and errors out.
> 
> Thanks
> Nicolin

