Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE69C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HzZSHSS3HI/mCzuK+4yTezfsReb9f4u2CLSOp9ExL0=; b=bCp5FtPHzALm6vKd7tMc6wSO5Y
	FlHACCk9iqvRHCNZEhALN716VrWjpr6EjXosfkY758BPZveYigHJaYK/cPWv4Z5bQ2MuJ2ncKwWIn
	d/6aUuuSdDorNO2BJRiI2eQJMNE6jej2CvIv+J1a3flkDS7TYUR4/d0ZrHo7nHNGr90e6R3dq4YJh
	YC6SXRAnoGzS/jGe8X1kvAh/vhmkrdFcImia/qvhdP3IQwkO0sYeH22I2jV8fJp9O2whBdO3Jk9GK
	+Ec3Kz+OLYEAZH4k0m+pFhFD/HmdgDz5ZY2OjBzoAei6lZSsxfMszM8AzlRW9j3AFClzG7/vReh54
	2JiiGJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2B6a-00000000GSt-0jBq;
	Thu, 03 Sep 2026 17:20:04 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2B6X-00000000GRq-2vzq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:20:03 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-936c02e58dfso1750585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788456000; x=1789060800; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HzZSHSS3HI/mCzuK+4yTezfsReb9f4u2CLSOp9ExL0=;
        b=cIigPrTqVSLG1MMkLhCZUmo4hFLhp1U6qXbCzm1Z7Nk3PVtqZczkym2oqad1hmys+b
         5ke2zJDRvipHB4ynQ57QqIwrUsN/Gx4DVcB0l2tadjlK3tz5mFQmzxkfJyu3umJuv+Yy
         SWzANXtVKPa10bQcUlQkFH4v0D/+uTKedcF1M2DM2Vd+g+u3IfOHKBUcIbyNZcU3HV2D
         4FN43O0rEPp4QB45NE2dt1Vu5VGjn1kc9kPs2JflhFWFLkg9iEpmGZmY9us+vDAqACRt
         Ho0O/FruFr382PlF0lKJLuU7S5yfwA3jZmBj5sKvJOgoZOwP7CwM6q7tvZDuBMa1clqL
         PDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456000; x=1789060800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HzZSHSS3HI/mCzuK+4yTezfsReb9f4u2CLSOp9ExL0=;
        b=fWvWD850zxmlUb8T40HUbKskW/TtijR9m/qfLZjkH506xOiaBcKElPMeYfjw8FlUKr
         baU4rvojRa7e2vcEhz4ooDDTH3mUTlK6uRS1o7NfiDFBL1rZoJxCIMf4q5eUykZXhLZ0
         nKwbYGpwC7X/pN2ktGBYU22AWK9L3czAc6j3XqATzgrBoBc8otB3WOb/paI16MFYukbU
         B0IbBRzhp2nwiGxIqN06fRCsRlmTSnqR79o+nUTUM86Ytk/9vUdmDjQc5DRMrCqyEygI
         iNucSFEDgyO5clCSVrrzEErDV9MXWqQbo7zXidrzmiYfSOdQTwa7/PWjxf05Yrn+41+V
         vPcg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ1ddPY7tjN8WkPpfzrg1CdjUzw+/NE12W1sRnI2TsejfSMajge2sm5g0DAhMnX1KeZjUHlVfL3Dd6JPqPSFg6@lists.infradead.org
X-Gm-Message-State: AFuF++mwbjhL3XMKMMIWZl2q1KmyvW4uv11+k4E+Xx4nkwbrxFK/xV6W
	6JYED4nJ1TOxg6u/dPwWo5rtivjOKOk+jEX5bbzXf78iOmrE5mQnou5EVqNW2/c4s6E=
X-Gm-Gg: AYBFou3ex3DWX+Kj58+3iikem5OqAfhxJujK0jFxWBAtpElYUCr2XVRWO7Z915uG98u
	VAkFst9GzFsdZJ15i5ZYyA4I/HvVDaWtZCooGtLIsgF9bQM/0otl2SQEpLSb8aZNkga4GutrY63
	2hh86O/o+exf4vCB/L4v+afP8R2CXDzF8d/nRnnyZpbWQondqiEOpN/Zs4LcwChVYDqTha5KQQ0
	4KhL7tI570Jsbl7uC/ieT7G2d2bTT8/xJyU/9dZvwnUjQ8MUaDNpua/aluWulYSvKNXpa6FGxJx
	+qUBFLvkZfrzK67DAOuNcsV0f6szfKo4WJD8Cm73o+rv0nWuV8f7L98+vur3/7Mk8fBQ3Fh0hhy
	ZRM0eVzFk4I9vq0q4A5FQVcCzi63TPrL0wVp72OZSMyDXPmzezXKptseRkzb3VZ26nLY4zk6fZ7
	lrQgeTXZ2pkoSjrRyTU2/EBZmQhD0Gvc4N//4NaHvymHHu1ieSE5TmbtPh+feSXE7XD93/V3cmm
	XZot/+o/PpfcN7G3UmtG51trFukPPfsPYqo57gfE0Qk8Q==
X-Received: by 2002:a05:620a:8010:b0:936:576e:227b with SMTP id af79cd13be357-9397ecc749emr148166785a.24.1788456000170;
        Thu, 03 Sep 2026 10:20:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f4b3csm14121485a.5.2026.09.03.10.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:19:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x2B6U-0000000HYPU-3heJ;
	Thu, 03 Sep 2026 14:19:58 -0300
Date: Thu, 3 Sep 2026 14:19:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260903171958.GL2890729@ziepe.ca>
References: <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <20260902193014.GF2890729@ziepe.ca>
 <yq5abjaezyxl.fsf@kernel.org>
 <20260903144729.GJ2890729@ziepe.ca>
 <39c8cec6-002f-456e-9e5e-7af2158047fa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39c8cec6-002f-456e-9e5e-7af2158047fa@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_102001_749126_17C044FC 
X-CRM114-Status: GOOD (  21.27  )
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

On Thu, Sep 03, 2026 at 04:13:20PM +0100, Suzuki K Poulose wrote:
> On 03/09/2026 15:47, Jason Gunthorpe wrote:
> > On Thu, Sep 03, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > > > Do you mean the SMMUv3 driver triggers RD creation? That feels
> > > > wrong. Did you mean the VMM just does it earlier?
> > > 
> > > Currently, CCA creates the realm lazily as part of another operation.
> > > Realm creation is triggered by kvm_arm_rmi_populate() or
> > > kvm_arch_vcpu_run_pid_change()
> > 
> > Okay, that's not what I would have guessed. But critically is there
> > some way for userspace to specify any realm creation parameters (like
> > rpv, ats_plane and so one) prior to the lazy creation?
> 
> There would be, eventually. Based on the feedback from KVM arm64
> maintainers, we are trying to keep the ABI as generic as possible as the
> normal VMs. Thus, for now we have not included the Realm specific
> parameter configuration (which was present in the earlier versions)
> in the latest version of the KVM support.
> 
> We have some ideas on how to do the configuration step. e.g. for MEC,
> see the following thread :
> 
> https://lore.kernel.org/all/46d78aa2-cacb-4efd-ae62-3026f5fe9b3f@arm.com/

I see, well please convay to the KVM folks that the iommu side needs
the RD to be setup prior to creating viommu objects and needs to be able
to supply realm parameters like ats_plane to work..

Don't see a reason to twist the API to accomodate KVM being out of
order for now. It is up to you if you want to try to do the lazy
create or try to get a defined creation momement with parameters (I
prefer this from an aesthetic perspective at least)

Jason

