Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F9EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SVexGeljhSdSxj9UAkbIi7n+kiPxQUm8cURRQIGIRA=; b=mu5A/sLtKofLIj9IrPToRs7nAa
	NNLg/KrVm2ltlS3Om0mad/YINDZq+XgRDM9ewZsz1aJpsFW23xF8euJ70hg0eMHfoRZ9Qc1LoZbjl
	FvVFvp5pKuC9vcTlvCRqUMRf50rOG0gcqAWbhzJIe/3Cmt8Shtb50o9phPnLNeYVC2IjzX4+O+344
	MVxkKZEhIc5jM0oxyCj4J5dCdKhamgdUjc5uzaJERO43XWFcU2dqj/LFdCYux6dDh3KrJreKLzSAo
	vDVQ/Zcslqp7B0mWltVjQCr0Tol7Q+AjIcSNi8KkDSZJVMOVL5ipPId5UdQinREoVNd/5SGEKKiiQ
	L5xncd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Mdr-00000009FgX-1i9g;
	Thu, 03 Apr 2025 15:38:07 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MXp-00000009Esl-3IG2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:31:54 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so1699516a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743694312; x=1744299112; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2SVexGeljhSdSxj9UAkbIi7n+kiPxQUm8cURRQIGIRA=;
        b=TJ6Pmx74bMCFKlpRjjc/0pT0AGfFzIu3L2v8q1eMwdlzsxrWj+jYJ5P486FFP4PRA8
         5hF3vDf7GqvGj9wizA+hJ3zqPC5lLljP9lTmn0ETqTRl4XV8cg5cf9Rf8e9/PZH/b10e
         MoKd6cW1eEVwzR9WdlHwxs7jZTi1UNDyTe8oOHnQLLDvEp2Fk5FAN6vn4nnsJAI+s+uf
         vhQ18f61qOkB9qXqq6+k+BZ/ZEHL/x16LJ+wsEHgO7nGdIKUJjpLs7JDN7h+odrjPjfr
         5S82tEpXW03OyNCH85SyvLK4Uk/yybr2vbh+7flkbzYVhDZjA1HREPw/jlL/syB3gr1D
         YB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694312; x=1744299112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SVexGeljhSdSxj9UAkbIi7n+kiPxQUm8cURRQIGIRA=;
        b=a7XyGPja2PLkkeDJQzmzgthH+MMRAUHajbpD7JPvCSim9ubbRTvKAZp/txL5qYJri9
         0/GVNN7vBbwon3m1IjreIFhLn6gkfsGEH08EnsU2gH2zdG2haEkxRsK7XCldpPvqPa0V
         YQ65WtI4KlZz6vjA8+VHyN//XrEmxLgup+uoUR7KlEq2kWxQvXC9UPnVhqoiB0a1UuLk
         xIYA50mXhEi7XlfYv4WfTm3+8SLGUgQ+vyWBOgA+2iysAz4MdwYmsI2XFHw1T+JZCuIT
         ATtDd5jVOSpwzCaig/GZA65i4HovCCTRgfa+WOGiUCDev1/RO1ZFUDe4HVRItQAG1Q7l
         v/0w==
X-Forwarded-Encrypted: i=1; AJvYcCWoT4hzUTIQgadGccoX5rxa+wQu8zgnYzJTeDR9Mtl8ZhkEEmSdypF9DW2DzLfFPWzZWDamofr7ub+R7sy0SzAT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2GtR2O/mnyoGre4xDbBGGI6vVfawtnnWB0nvBgj8nsZnf/Mzp
	bpIe6PKIuO8di+3ZIOW7hh5Mg7PJ76CL6DFmpHcVzI+7WToA8hwtT6iM1UiGlg==
X-Gm-Gg: ASbGncudBiIf7hGyVNAFM0P0nCpu1CFUClP3ZNC6irDe8DIgQKpkDhfAMkjZlPZmp3k
	tCJFiyengzN/SI9vn0mx4uHJbqIrLBk+xDTJWxB0XCwwH2yiywF2x5gSiFaSXpW5iVzCyyIJDEA
	2u6MJ63scLCzh1o3U9W3ZJUHSKIRrsUbj8fpXi7sHw9KGx0L1I4gQ5Y29GzyFLNG8ixLIg2hy1I
	+z64MXx2hPOtXR0hVxKTHjo29QH1izJz0QSHvIuyljcYQKzPC2Q/JhiXy3BMXjPryMe1yf0+68j
	7OZHofmkbstYzm1lhNc8FWooj1C2XTSXxOIdzwm7ri2ih/EErP7XQ8jtW7K/wLfjYFqvIVB/Esd
	oPEPS3uDfLX/1k1vC
X-Google-Smtp-Source: AGHT+IEGEPfe6jLP9yTD8EczNIfaOYVt4yM5HvzJTIY1ayuEiVqh4iVP20QX+O0oM2W0n9OiZudOCQ==
X-Received: by 2002:a05:6402:1e8e:b0:5e1:dac1:fa22 with SMTP id 4fb4d7f45d1cf-5edfdafe39dmr16976129a12.21.1743694311816;
        Thu, 03 Apr 2025 08:31:51 -0700 (PDT)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a4027sm1097010a12.73.2025.04.03.08.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 08:31:50 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:31:47 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 3/9] KVM: arm64: Add a range to
 __pkvm_host_unshare_guest()
Message-ID: <Z-6p49EcsZKid7L1@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-4-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306110038.3733649-4-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_083153_825031_51B2F619 
X-CRM114-Status: GOOD (  12.64  )
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

On Thursday 06 Mar 2025 at 11:00:32 (+0000), Vincent Donnefort wrote:
> @@ -1012,51 +1011,52 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
>  		return ret;
>  	if (!kvm_pte_valid(pte))
>  		return -ENOENT;
> -	if (level != KVM_PGTABLE_LAST_LEVEL)
> +	if (kvm_granule_size(level) != size)
>  		return -E2BIG;
>  
> -	state = guest_get_page_state(pte, ipa);
> -	if (state != PKVM_PAGE_SHARED_BORROWED)
> -		return -EPERM;
> +	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_PAGE_SHARED_BORROWED);
> +	if (ret)
> +		return ret;

Given that hard rely on kvm_granule_size(level) == size above, we should
be guaranteed that the PTE covers the entire range we're interested in.
So is there a point in starting a new page-table walk here? Could we
just keep guest_get_page_state() directly?

>  
>  	phys = kvm_pte_to_phys(pte);
> -	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> +	ret = check_range_allowed_memory(phys, phys + size);
>  	if (WARN_ON(ret))
>  		return ret;
>  
> -	page = hyp_phys_to_page(phys);
> -	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> -		return -EPERM;
> -	if (WARN_ON(!page->host_share_guest_count))
> -		return -EINVAL;
> +	for_each_hyp_page(phys, size, page) {
> +		if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> +			return -EPERM;
> +		if (WARN_ON(!page->host_share_guest_count))
> +			return -EINVAL;
> +	}
>  
>  	*__phys = phys;
>  
>  	return 0;
>  }

