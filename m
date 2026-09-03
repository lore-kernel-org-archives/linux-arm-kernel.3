Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE87C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QmS2bFUIAw9Owot8+v10VgE/MAeq6BqPd7i1PWMP/Q=; b=RUjRk0QJs/pUvcqpvRRxCA//aX
	e5Ig4asXrOpp6lUvFFSBNkRW85wvRTkh+vKfBfMnWqwE8I5tNs+RVzajf/sZ+gxTEHdGVm2w2a8gT
	1PwXU/RduC7iGMuZh3/CvxFa3Jt4IYMt4fFtbjjBex6D+2hDnj1cBtvQdokDyRcoFr2zZvQcKtKu+
	eAKsJmVKMKNDGj5ANBRC3IC5hBc8zcpEGrAs71lSJJZx7vEfOU/f4Ex+ItK8gIf80/msDhBA+Urg9
	KpGtcL6VnGZdiyJNOGj1zLKrOZ4oOdvKDt6aoSDQlTFb8FFCoN9r1Ax+hYLDSul/TuzeWAu5/VNTH
	syi1qU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28j0-0000000HY52-0biw;
	Thu, 03 Sep 2026 14:47:34 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28iy-0000000HY4H-2JFd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:47:33 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-52fa6005224so21833931cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788446851; x=1789051651; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QmS2bFUIAw9Owot8+v10VgE/MAeq6BqPd7i1PWMP/Q=;
        b=gZvBgtu6b9JDQUZuT+kdU+oe98SSHbjG/M57rAJAxmw7BS+3y6x0TDcXTBlKs5JZ8y
         oDjIbqK0vK+e1Y0tgz07Hegf2YDcQamcolOS+XR5KfZtZTKV2Q8ZQgdMHP8No8QGNuBe
         ndKJ/2nJLUBMUXLDb2BuBgIZ3QUlDo7yygD6Vt1HJAZGTLL9v8+mNgY68uoMNcLMBdWh
         Z0+TRDAMoQ54mSmwPLhv4He6ITTXs5PIgjXLeJZ9E55SWZAJ/rVE+2kzx3ZZClp+Limb
         BOpI4gMvgITxUYOEHHlk3OXm9dqB5m+nZcDt4k6NO4p02Y+WlOzmFV4dVhgd/gDmb/bF
         rsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446851; x=1789051651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QmS2bFUIAw9Owot8+v10VgE/MAeq6BqPd7i1PWMP/Q=;
        b=pSQG7iV0gsnPY8ECEEs3OlXpqy7XhmP/PGwc6fEo+JLjTOdiIbE4vTVxOvKs8oxXXn
         OiRiUFmWlGfaM8cs/z9lnXDR771ATLWi+2VNDSecVyBYnxy1sWG1566RlKWjSsNp/5uX
         97xwGPSqerfPCQO4bohQ9UOhEQisSI45rlhRPwKrFzc9O2XbIpFq4G1Z0imWp5GBtDbZ
         vOMkHynr/6UjvVby/KcRZn9u+AuQ279xNZbxvg1pOH45epPS/qai1pp0Tw5m9RsJ0wn2
         LKxPajnrfI+WW8Pdfx+/6J9H+72LzBV7lgpgvnI78jPWmOVQc1lTU1+Q8zKu3t7svW0y
         +Ffw==
X-Forwarded-Encrypted: i=1; AKwUvBxGI9bRKCkW/FSb0bs3mOQ/jRG1DOXRVPYVdmo2ntXsAS2WEKItr0VP0s+vIo5sdXLLjJlapeBdHT8yubjqadjC@lists.infradead.org
X-Gm-Message-State: AFuF++l77Kvmh90RdOTw2QcX40TlS/Z4++NoRI6jMsN05DcvrMSyjprM
	x0GIVktwE0iXs5zZfrbn8jbVkVlfKuTQe53pjv8irzRdz/sjwO4i/GTLcnt1FIqOxRQ=
X-Gm-Gg: AYBFou2+YQBHboIgQsymoIh0Rm94hIfBNsZx/Tb5t1+e69M6wlaCV6Z+4QMByAuD5t8
	sRbse9Cy6i6cuJdFY0fvlrQviQ2e4CLaImlGJ3yLIOVvEEl+LitLFvXiDaPCrXjS/j8Zi2G6vTS
	86A8jq4rRFrXFcNl31fwXaP5iTtJ9xiIH/P+7GZtmbSCUqzDOMkT002xbpp4EfB+J6wYB7c5WE9
	LDs31wx/Rufz5EudQYMGsEXtFY4KYx9PlEYqpDBfbF5rPvG32fvo+GE8+o+aKjiPzHUBM0GdycY
	Y7JGxatcX9u/RlNlFB7lDm6UwJOMPCdnh8u7lADfIDab7AjutO7RnAFnKe0r8HiGcoI86iQ8b5g
	Z/yNURTlBF8JkS4qZDx1Ycnx8+8XVsEsTSJ/POwGFhhw27SPgAPAhtfPGpHth82CnCctxi9vGHn
	n7H6zDNaGGH2m0HP9GVKy/xqEOGJJ+MqWpF5e1X6abzETmCI2F8EnAfYG/ehX1pOOTC1bF6iBv/
	Lg4goOEVzxfyfpgorN30z32ASZQQOpZmvC5d7GR6B0pn+bp5Ah0VcgO
X-Received: by 2002:a05:622a:1455:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-53036be6a5cmr143516721cf.9.1788446850990;
        Thu, 03 Sep 2026 07:47:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5303301ddcdsm44166831cf.9.2026.09.03.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:47:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x28iv-0000000HFle-2ikl;
	Thu, 03 Sep 2026 11:47:29 -0300
Date: Thu, 3 Sep 2026 11:47:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260903144729.GJ2890729@ziepe.ca>
References: <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <20260902193014.GF2890729@ziepe.ca>
 <yq5abjaezyxl.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5abjaezyxl.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_074732_597369_971D3E04 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, Sep 03, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > Do you mean the SMMUv3 driver triggers RD creation? That feels
> > wrong. Did you mean the VMM just does it earlier?
> 
> Currently, CCA creates the realm lazily as part of another operation.
> Realm creation is triggered by kvm_arm_rmi_populate() or
> kvm_arch_vcpu_run_pid_change()

Okay, that's not what I would have guessed. But critically is there
some way for userspace to specify any realm creation parameters (like
rpv, ats_plane and so one) prior to the lazy creation?

Why lazy? Why not just have userspace provide the creation parameters
and create the RD right then?

Jason

