Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8FBC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnE1WKL8B2Bxfl1xiklk44H12/SEhBZrUiboyYR/TqM=; b=NkM6VcW60gUe+Mw6w1LPItSD2p
	ruUFU0GVS0oR0QuZShXoxTwwcgxtDMYiq7qkz8n/P1O2jByJs8khpTxNZUSI9k6muHNuv/NaRJw8I
	mAiko15xADYDBBp4ibtZzdb+mI8/NiXBvdE4I8ira9Az3Nm+g8Ph775/sx8+Rew60YjCpDl6FECMa
	InAR5TlME1m8K4MxTVW/zbkL+Ot/NykdBYFjM1fKAWFR+PQgiTYJabgzNok3kcSoSPRhmOgHMS/LM
	yYJQOu9MsnnNenbMxJU39fkbquMLl0JURSoIrBILQ2gQkQPz6fgQyjQObhuW8uVQ0L2w9uw+gFxBH
	696TiQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1jK-000000003ej-2jCZ;
	Mon, 03 Mar 2025 09:04:54 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1hk-000000003IY-3h2f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 09:03:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4394a823036so39635145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740992594; x=1741597394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnE1WKL8B2Bxfl1xiklk44H12/SEhBZrUiboyYR/TqM=;
        b=bYvdOe9QOlEemIkf+zQCQSJXyhNt4nJT8BWrDcjOLOEStQJoG9bg/k4qd3sJwHwJIs
         XyYuTqis1lfre65rx6rq/959pXFM81zNY797pSPt3d6K/v611CDlXWK3Wsm9T+ioFX0O
         xnHpOBHHI3+HMdPI4Fh00Lrq9PREWFDayioB4G1Q3eTuCDo3xK2Wkw7PcwyyYIh29LYO
         NvMr9c9YlAmKH++E+nUKE8csI/cQ1ab1equpeerChDnEMxAfE2ycCZ1hJmEZgRuYUDNz
         MnSsZ3UDxAbjf1Ct/bZfpQuH4S5kINFmq1ArJpg3lcIIcAfqnPf4K4U9TamP7rAg8doG
         Gaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740992594; x=1741597394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnE1WKL8B2Bxfl1xiklk44H12/SEhBZrUiboyYR/TqM=;
        b=qa74KYrI7tp6wMUETGy3ON4h7pJ86MZ3BlreU0hlzegqGS58/PChmFfSGEoQbciv0H
         ZDYFTF+EIc9W0k4qWh9pp2IbE8AVCHm0R9l0xYGPOTI3pADxg/H6V/iFe782OOIE4Y/K
         xCbJIi9Ma37Q20w4d/OfdM03ZlgX3+b7+iDRL0MnYqe1PFdpcayWbUfHYEAC8Z6nqaLK
         Tg5MAGBThCDGJCMOwKbuzScAcVaADCqyxcmSf3X6vT1L1ygIHtphJlZS/s35lPkFtl7C
         5iYFhuJa9iRjKMR+VMqMHuONSxlsq5Iyt9slUaWtageuheKl7YBTOHIoHWOSF6Q2S1PS
         1NoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU24ZQocAyhN/F4sSbViV8LKLY0EcpyvSmIONudP9YByVFv9R3Ne5ed0VWl5ipvsTjt+JwnSiksg/FOixLFdmXA@lists.infradead.org
X-Gm-Message-State: AOJu0YwRclnn6X4E11hAewRuIntzwL7bR05xsJtEas+Iwy+Mayz81shM
	YaUJMmny0W03qEmz/rcWXHjrSUbLjH29gGkYIe1RsGTbvMRVKmsynH41RG7+DA==
X-Gm-Gg: ASbGncuS8U/1/XGEZTfrIGXwXobxYIuYib6Opr9j1vetuQvj6zg/9LS83zc+JNvnsYu
	lD3qzDzwWEnrJsAvGAFVKxVRd+z0p1B8G5qd4Le6/T18L48MCUjYsOXHwLTeMkjUY164mEsxS/E
	Iqx96prdg54+ypYmY/pqRirq+qlD1zWa5yHewLCnerc0IcPXkOmdiNSArdQL6BBeamSo4pGvp4u
	nj9uqT1Lrnkp9ns4paT1EjQ08Yfc3Hm/9FZXw9IyaXm/gd+kSIYR7HH0LqAdTLRpUhcZfGvjCyk
	hKijvj1DrdJZMhomYJQZJSmAoIKxRvC6U7QLGbPQW7SfO8B4RqrFX0S4L7zam2jTT4odb59/6Z0
	VSFGniUpqGtBi
X-Google-Smtp-Source: AGHT+IGmAnvr5WwwGoSHGFphkhVZV6m70wz82I4YVRSVF548RcAtlCMZxGhqjzzDdhfLipt7qPEkPw==
X-Received: by 2002:a05:600c:a45:b0:439:9537:e96b with SMTP id 5b1f17b1804b1-43bb60464acmr37468755e9.14.1740992593951;
        Mon, 03 Mar 2025 01:03:13 -0800 (PST)
Received: from google.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba58713bsm186635635e9.34.2025.03.03.01.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:03:13 -0800 (PST)
Date: Mon, 3 Mar 2025 09:03:09 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 2/9] KVM: arm64: Add a range to __pkvm_host_share_guest()
Message-ID: <Z8VwTf8nMvRNjgU_@google.com>
References: <20250228102530.1229089-1-vdonnefort@google.com>
 <20250228102530.1229089-3-vdonnefort@google.com>
 <Z8IJRpoQUoGazLku@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8IJRpoQUoGazLku@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_010316_938928_7980A3A0 
X-CRM114-Status: GOOD (  15.71  )
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

On Fri, Feb 28, 2025 at 07:06:46PM +0000, Quentin Perret wrote:
> On Friday 28 Feb 2025 at 10:25:18 (+0000), Vincent Donnefort wrote:
> > +int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
> >  			    enum kvm_pgtable_prot prot)
> >  {
> >  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> >  	u64 phys = hyp_pfn_to_phys(pfn);
> >  	u64 ipa = hyp_pfn_to_phys(gfn);
> >  	struct hyp_page *page;
> > +	u64 size;
> >  	int ret;
> >  
> >  	if (prot & ~KVM_PGTABLE_PROT_RWX)
> >  		return -EINVAL;
> >  
> > -	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> 
> I'm not sure it is safe to drop this check here, see below.
> 
> > +	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
> >  	if (ret)
> >  		return ret;
> >  
> >  	host_lock_component();
> >  	guest_lock_component(vm);
> >  
> > -	ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
> > +	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
> >  	if (ret)
> >  		goto unlock;
> >  
> >  	page = hyp_phys_to_page(phys);
> 
> Phys really needs to be a valid memory address here for 'page' to be
> present in the vmemma -- dereference right below. So we can't rely on
> the check in __host_check_page_state_range() sadly ...

Haaa you're right. Sad to have this double check. Perhaps I won't use
__host_check_page_state_range() then.

> 
> > +	ret = __host_check_page_state_range(phys, size, page->host_state);
> > +	if (ret)
> > +		goto unlock;
> > +

[...]

