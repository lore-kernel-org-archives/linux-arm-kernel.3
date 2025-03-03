Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B979C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73r+pPBFPmA5vexT3Ec5rGd49/E5Soa5Y1/Qzc7kIO4=; b=R4QV9MAMQ0Va3l98Smbj7Pqsjd
	66MKrlLSiF1zfWlGaVaPrHcv7mCEm47GD16xjxhkjDUCeppKYrrHJHaGvMdY39vOtlMzOEVWVFWoM
	5v65r5RngLr06g0BA3YvCnec9poV03rFuuePwt3wY38RYoTGyrbDtS7p/CbmAxPI5hcMIRgfAY8co
	tAHLUxLcyM9rMDe5UZ991R5xNmOWB9qs0TlOB7SxliKhJAQlMQe6pgy5vSsPE2tFLSfpErErzLH36
	G/eqJu5Lz8daQUEhGepfkrT22ImcyzxQL0fQHTb3pTX8HXWe6HDT3AP3p2lqtP3s2luGSloYEPChj
	ULEb0lTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp29U-000000009At-29dL;
	Mon, 03 Mar 2025 09:31:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1nE-000000004Ws-3Kri
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 09:08:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so31492795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 01:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740992935; x=1741597735; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=73r+pPBFPmA5vexT3Ec5rGd49/E5Soa5Y1/Qzc7kIO4=;
        b=Oj6ZYxaB3Huj1vA/XZ7XbEQFTN3krVCUEyKDSCaGLTGZme1DPjZR/+9Apu3BwmNZ8e
         Ku70oSh2goBIi4GszeahjSGZWz/7avq/wm3L6rX2PiIFuI4ytA1fQApWz4dhQU8LvdzN
         g19vDHvrcuZ+hyr+sQF3IEPWSNl9TzIGvIX8/+F/CZUbaig/nLXI1REhZmkI/HwtCXxQ
         I4Fjr9h4ehlEr9o1hjkvRYX19qS++FWKa+8JETSsrj4k5YVD+1qEc5Rownf+UTbFqliY
         uoEtKO1lhFD6UQXxB14MFGcwubv32SNFK1V2U9dBRlsaR0DxLoOVlJmRHTQ3vubQAcDJ
         cxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740992935; x=1741597735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73r+pPBFPmA5vexT3Ec5rGd49/E5Soa5Y1/Qzc7kIO4=;
        b=rmWFmk9GJrVUufqLhhS3GpXQLbqxoZcvjzHByPWmKbTJLKjsCZl2RJj0IfsW7MkhQ0
         7Iw0pFt9TVsWroRgtQA5JNmnH0tZjo45mGC4E2iIpERN2/O+MTG0+6ssfLHDgfOvBKAb
         56DkmefrBSrVMGLigtTSatlJ8HdsL0gILrO1Z7Mo4kip0sIG5R9ZiyGUTg0ZoCkYoRox
         ooYo9BEA1+My1QE0kNLrqSIPUv732L4avpEN1pP8uhYwLSI0ShBjakvwM5YznPQ4RK3X
         HyYZ85kfmV9p6D5YiJphLEAfb7OYcAaN3StHpQ+YqMgDKBuvPNacMxYP7TEpJD48z5i9
         NtbA==
X-Forwarded-Encrypted: i=1; AJvYcCVgi0jWVzXXYq51bQUVKJlsmErYhhQ8OeuNHN5IBTxloeszgPwZe5XdbkPHNAtpAm3kTGlQE/LRfqyaUGzA/7cB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvb2RikpQAOPw5eGwxakmrQHImAdlUDIuXokN3UZdoL6PR6kGU
	N/Z+PqJa5ixueTF6XuL534dGtJUkQSMP06CWFuxoFX5jruDvINI3E2mcwQ1tew==
X-Gm-Gg: ASbGncttE2gmGwIdc1YV0sOqV9J0y9zVd/ea1qZc5L0h2Su3qDV3susqt4UMz8Ooziq
	xzAd7/yzeqGDiJ/6lk3sSs1Fg3bq3X4J6mFF1w1x26bRubd+l/0SrUc+3+mMeYF4FeoRBSQ474a
	/uszVgNvqZXyAtKbdCDgRNA6GjH8DbUS+Ihpmbj5NJnh5FIIlYur2tWu1PAv/BVwxrtR5Ro4PhK
	sfVeiKJPrXZKoUncUECPp0URHHF70+ddt+u9ulnC+MuTrZ1kwe7uhqt2MfPPujUtgF0GibcyeNM
	3i8gKDhOjpASNgSIec54BYgDJz7D1Q5I2QcvH6MRqV9WVcfbAqd4DfhTV1usUwmGwEwEylfeTvw
	xsaF+BopkvZ0G
X-Google-Smtp-Source: AGHT+IFulJGyYMQXTykjX7NCa+Iy43Ll73kEXzRosIE/q2QvgywumoNWk3nbePvrLXe4q9Ef14rB/g==
X-Received: by 2002:a5d:64cf:0:b0:38d:b12f:60d1 with SMTP id ffacd0b85a97d-390ec16ad09mr11136503f8f.26.1740992934969;
        Mon, 03 Mar 2025 01:08:54 -0800 (PST)
Received: from google.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7a73sm14106715f8f.50.2025.03.03.01.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:08:54 -0800 (PST)
Date: Mon, 3 Mar 2025 09:08:50 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 1/9] KVM: arm64: Handle huge mappings for np-guest CMOs
Message-ID: <Z8VxotNAW9CLogum@google.com>
References: <20250228102530.1229089-1-vdonnefort@google.com>
 <20250228102530.1229089-2-vdonnefort@google.com>
 <Z8IGcA6h6hZx7ujh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8IGcA6h6hZx7ujh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_010856_833245_1B554339 
X-CRM114-Status: GOOD (  15.74  )
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

On Fri, Feb 28, 2025 at 06:54:40PM +0000, Quentin Perret wrote:
> On Friday 28 Feb 2025 at 10:25:17 (+0000), Vincent Donnefort wrote:
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 19c3c631708c..a796e257c41f 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -219,14 +219,24 @@ static void guest_s2_put_page(void *addr)
> >  
> >  static void clean_dcache_guest_page(void *va, size_t size)
> >  {
> > -	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> > -	hyp_fixmap_unmap();
> > +	while (size) {
> 
> Nit: not a problem at the moment, but this makes me mildly worried if
> size ever became non-page-aligned, could we make the code robust to
> that?

The fixmap doesn't handle !ALIGNED adresses. (I have a patch in the tracing
series to cover that though). So wonder if that really makes sense to handle
unaligned size while it wouldn't work with unaligned va anyway?

Perhaps just a WARN_ON() then?

> 
> > +		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > +					  PAGE_SIZE);
> > +		hyp_fixmap_unmap();
> > +		va += PAGE_SIZE;
> > +		size -= PAGE_SIZE;
> > +	}
> >  }
> >  
> >  static void invalidate_icache_guest_page(void *va, size_t size)
> >  {
> > -	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> > -	hyp_fixmap_unmap();
> > +	while (size) {
> > +		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > +					       PAGE_SIZE);
> > +		hyp_fixmap_unmap();
> > +		va += PAGE_SIZE;
> > +		size -= PAGE_SIZE;
> > +	}
> >  }
> >  
> >  int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
> > -- 
> > 2.48.1.711.g2feabab25a-goog
> > 

