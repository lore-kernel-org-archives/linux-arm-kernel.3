Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B166C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IO0g4mIiXj10EzMo2R/KDJ9Eie2fuSqpmAU+xz/5e2k=; b=ScT2YLxmHm+tNraPLEr9z8X+Bd
	M7NReCDw/AkZurdDf/zQ363DkZL+Ul4+do/CYuN4O6UfcOAnWjRruqnAPpHXWXlA7HYFSae4hUWya
	iWsJAFP1WfZ9EEw4DeFxuF28M2zir4FiXOjX+z9OlYvDcQLs9/2NnT2iVBdUB3OAW6ZXWWcWnc8VU
	ZHrNs68Ib7Zk4oZckn1eoVUsNCPJjNr+zXOnVwMvoN5VNIM0vV22qWUK5p1YCT/uOyDKK+XxWlnvR
	ERkpuZyXv3dN/uixKPUlswvNV11uyuTD7K3YVqURBdcWzvDTejBEGOTo3KNnvwrERnFKQZn213NBQ
	TNuN1whQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXSX-0000000H2GV-2Bqs;
	Mon, 24 Aug 2026 16:23:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXSS-0000000H2FH-2y1q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:23:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso2748716f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787588615; x=1788193415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IO0g4mIiXj10EzMo2R/KDJ9Eie2fuSqpmAU+xz/5e2k=;
        b=iCQZ0csbXzabOXH/m1DFD5j3dr4i/9ePSvldFVotdZWso0c7ba+vsEsABj6KNaEdlx
         EIuisLQWqzvLNCal3habvSWYMBOYHwS4dRoJlSDYTh0OdlfuYmxxnxFEYf7P3hMv4sKB
         XxXm+I30wSH9jMo+rGI/6FxQwKmyaOn5cCFSj+R0QlhnafH6J/6cMSitOuSMobSWNnBy
         w9YeuzE1ODgdkv2vKRw20IN2iUGIa8esFquQHeKvZw7/vMAA3eDlb9EWLrP4Zu6Vwguv
         qe/CL4cm5pQRwh16VxbjZIHOzeNYG9fI/TIWh4rGAcBEhHEssqKmAeHHFE187Q6ZzlqS
         om1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787588615; x=1788193415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IO0g4mIiXj10EzMo2R/KDJ9Eie2fuSqpmAU+xz/5e2k=;
        b=pIs2cMxU3+w6N3hKmlBaKUpsukoNxE+k6Bkb7iqkKt3+Gq/Sjbo5PkIn0xWjvmAZXw
         2YT5erfYF+J4dWVeIHf1DTr7nonY/+YKEZ38jqxjqu9NCXjqIRbyF22+jhrHVvNHrUjy
         5KvFz0qPIeyibT2kJFgaxOpHAqA2+A7G24DtGpFMQE52759GCntcXanm3oVPJbqoFJ3P
         yrGXGRuBQjpZqvoCZNkPZoNIiM6iJeoFd0+aJPMWbDuHyy8ccqYlmsocezb+I8kGwXdw
         R70hmOaAgq3g6CUmclYmTmUu2wpB7nTOW21spVimS46xTdUiYZ4/+n/491UyoXDDq8mL
         cdTg==
X-Forwarded-Encrypted: i=1; AHgh+RqEoimpb1v8900UYZxt7lV3x3Uf3Oq00RSwakMniHwl/KXO8Lqc3Ng04DXcSv1XG/uZV9nlENdxxYeGsX1GmKux@lists.infradead.org
X-Gm-Message-State: AFuF++kqmxNvq5HBrxpg/fWQDs2+b8ZKUPqQ3Xe8nfj8eqxpJ4M+lY1T
	U6zyLZl/cDyPjBjrGvFyBiwjrANru4pgV5VsNG+1ufVlvAskrX4aJF53IZyWNjbjmg==
X-Gm-Gg: AR+sD12Q4u8IGz/fkue5RwrjU8iocvfBYNdbzT+omf2C8Tx4RXM4Osxv7Dx1i3Ui3qL
	OxNWpgBPMT5mUffgRVxwvQlBWVizS0Zy2QLp8XBZqliEuCp5/kpIQUISxt/e75VEYzyuHISd0iM
	uZ0nvH/m3y413WlufcQfF+zBNOIuSgQhg9sifVV8s+F9gulm0zysmvryVY6rFezrLQd6bXqYD35
	Z1xEX2AvgWdHZkK7KPW6Ud2vUcMm+dRi5Jb4K+FYLSCqU/QnX9YMVriyk0fstiqCZ0Dfw+PyfXA
	g6DypKX0A2oQUUgOWRVBYKFm9/kQ8K7QKVIZ/xQBPelt2vIkm/wJZC0t8/CjQSzcgebMXvOeplp
	40iKIp2YGNAX64/6EiWOjxMATD717GBUw46XA37mKGBGzNGzZqvx6gmUVP188sJI/QyEcMKrwDY
	CzwEoztny1Xh47iMmA1SbV0PGE2q+bqaDfyucM/izOzh//7u0R7jN86BYdY5nCIN7MdousuNa6h
	QEd53Xb7+dy+cw8xZe68qkHJxVBR3hi
X-Received: by 2002:a05:6000:22c2:b0:47f:d011:f644 with SMTP id ffacd0b85a97d-482c0b54606mr34306523f8f.4.1787588614220;
        Mon, 24 Aug 2026 09:23:34 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69a49sm8579616f8f.7.2026.08.24.09.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:23:33 -0700 (PDT)
Date: Mon, 24 Aug 2026 17:23:30 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v4 09/17] KVM: arm64: Add selftests for the pKVM heap
 allocator
Message-ID: <aoxwAukYucNw1T2p@google.com>
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-10-vdonnefort@google.com>
 <CA+EHjTy7SUFsE3N5ERV_FQw-3GyEo17mqe2=RbV1wz8bVT+JXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTy7SUFsE3N5ERV_FQw-3GyEo17mqe2=RbV1wz8bVT+JXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_092336_787597_290D0B63 
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

[...]

> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 346365e76ef2..d99c9b1b0c82 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -633,6 +633,28 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
> >         cpu_reg(host_ctxt, 1) = __pkvm_finalize_teardown_vm(handle);
> >  }
> >
> > +#ifdef CONFIG_NVHE_EL2_DEBUG
> > +static void handle___pkvm_hyp_alloc_selftest(struct kvm_cpu_context *host_ctxt)
> > +{
> > +       struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
> > +       int ret;
> > +
> > +       ret = hyp_allocator_selftest();
> > +       if (ret == -ENOMEM) {
> > +               req.type = PKVM_HYP_REQ_HYP_ALLOC_SELFTEST;
> > +               req.mem.nr_pages = hyp_alloc_selftest_topup_needed();
> > +       }
> > +
> > +       cpu_reg(host_ctxt, 1) = ret;
> > +       pkvm_hyp_req_to_smccc(host_ctxt, &req);
> > +}
> > +#else
> > +static void handle___pkvm_hyp_alloc_selftest(struct kvm_cpu_context *host_ctxt)
> > +{
> > +       cpu_reg(host_ctxt, 1) = -EPERM;
> > +}
> > +#endif
> 
> My tag stands, but thought about this while going through Sashiko's reviews.
> 
> The other arm writes x2 through pkvm_hyp_req_to_smccc(), this one does
> not, and -EPERM is an error so pkvm_call_hyp_req() goes and decodes
> x2. Nothing initialises it on a call with no arguments.
> 
> It is inert because pkvm_selftests() sits behind the same #ifdef, but
> the handler is registered either way and nothing states the rule.
> errno_to_smccc(-EPERM, host_ctxt) here would write the zero, and it
> may be worth saying on pkvm_call_hyp_req() that any handler reached
> through it has to set x2.
> 
> Cheers,
> /fuad

Clearly not something that would happen but I can put the #ifdef inside
handle___pkvm_hyp_alloc_selftest() so it looks cleaner:

  static void handle___pkvm_hyp_alloc_selftest(struct kvm_cpu_context *host_ctxt)
  {
          struct pkvm_hyp_req req = { .type = PKVM_HYP_NO_REQ };
          int ret = -EPERM;

  #ifdef CONFIG_NVHE_EL2_DEBUG
          ret = hyp_allocator_selftest();
          if (ret == -ENOMEM) {
                  req.type = PKVM_HYP_REQ_HYP_ALLOC_SELFTEST;
                  req.mem.nr_pages = hyp_alloc_selftest_topup_needed();
          }
  #endif
          cpu_reg(host_ctxt, 1) = ret;
          pkvm_hyp_req_to_smccc(host_ctxt, &req);
  }

Regarding pkvm_call_hyp_req(), how about a proper kerneldoc?

 /**
  * pkvm_call_hyp_req() - Issue an HVC that can return hypervisor requests
  * @f: Hypervisor function symbol to call.
  * @...: Arguments to pass to the hypercall.
  *
  * Re-issue an HVC and process any pending hypervisor request until completion
  * or error.
  *
  * Only use this helper for HVCs whose hypervisor handlers format their return
  * registers with pkvm_hyp_req_to_smccc().
  *
  * Return: Result of the hypercall or a negative error if the hyp request
  * handling failed.
  */

-- 
Vincent


