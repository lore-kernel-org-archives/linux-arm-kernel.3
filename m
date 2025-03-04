Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C449C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/pyfoaR/eT3J3WSzi9ciqMZLn3faPQuYj0+Pv+ikCU=; b=z/F6eDhsGjWxg2AhTjvXOnBG64
	NmUoW9m0WtOxNvV40fgsrSVzqZuklFbkpKQu+4cmcCIFdKSMA3tPYEoRzn7GsHTpQxrUEiYoQP2do
	js1WiS3ouxbfi0FiMfLQUPsgLE5iKvnS6hrGWF2w0iTN59YgO0HWtNlHi12HEZHWgYUfeeT6vFEzc
	fCO9QIgjfcAV0qWVTm3m0bFcrJE/snu02b7nFyY3MkBcsrbJR7eQlkUdwzzJELZA/aw2efnaGG2mi
	/kER2dgd6TlgLoqNmL49tIes9MRC0zmlWsVqzUgDzxL38GYl1rhPc1uvj/gJEueR2pFmD+pfTVM0U
	k9eAlWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOD9-00000003m4o-3kQ5;
	Tue, 04 Mar 2025 09:05:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOBZ-00000003lbw-28vQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:03:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso36385105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 01:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741079011; x=1741683811; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c/pyfoaR/eT3J3WSzi9ciqMZLn3faPQuYj0+Pv+ikCU=;
        b=AlGLZygrSCl3UjWJw3sD5hEYvtkE7J5VGXWOoenSm0NokfDtvTV7wt+V1OkK62vGAD
         qD5/eRDPWnrB8Iz3lULLh02Z6LH61UDAeyN3BbkPBqKsDB8GovPPRS/paQXoMMt1Az7l
         KcrgzEtIg6cI1e1fPczRFdW7jmXnW4PwHtJBPNzZcSQ9K1XhKwq5ldAJ6wT+JA1hRqPz
         jtWaq0Gs/U+I4OJZQT1oIfuflIakZAk5ujcd7zoHvLQ6Ua7YNgqmwuXApdN1CgPmteF3
         4P6AMdTmjwrRXmtXsdk3jKaHxkt9iyVyTGbiC/ONV9xUdtf+hOnMi/gLjBJ0I/6M/nHU
         LyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741079011; x=1741683811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/pyfoaR/eT3J3WSzi9ciqMZLn3faPQuYj0+Pv+ikCU=;
        b=gfKYihj0lGMpEgv5zcW4WYgC3wvGd8lmefctVzDInV2XUscBIQAiOoMaOFWTVysHhm
         Mbztot5TcLfFN9PMFlOjZl/nmi4wt/zqcbpRJcFQhc8pkUeCs7b0ZBt3IkD7pOVurdny
         +B+tdCuCewldyN2Yb4IBBYBkrBoRGk8U59qCAP2oUUz+H1bXP2VWDmCZ1BHLJg4+zeuS
         +gvXQ54b7OKPfrbZZF29MGU6yNGwZFpxoTrV9uNeOqCpPaf96caO2bXHsNsj0RXsztcK
         lUpTKKlDZPLLgQA5b2pVbxxEa3ejk3aUSNJphUXZx1o2SWBS5uneTcZxywQ28V13OUHV
         Ra9g==
X-Forwarded-Encrypted: i=1; AJvYcCW05ScK74+2W2nq+sjUQkSLVv/xlGWB76HfM42com+cdih88P87wXXyQJ+l1gT+Met4vYRFFLOPpw+Ozuu46joD@lists.infradead.org
X-Gm-Message-State: AOJu0YwmSfe6k9MRyg02/swyZsj/B5oFIPUK1APT/8KT0tqBA748ZLTz
	EyvaMES2kgamvbcOVAZ+BZ6cQxJzPpFh2kMLguR3rupB1ckv8Fto2Jz5ohVf2w==
X-Gm-Gg: ASbGncuqtB9I8Pup7ow7+CMKhJSmPS+OrNzw/470J8mLR3ARvn0HW3x30/AxLCEU3Dl
	NF6iI3qTB8g8GiYRcT2CwtUTFju1vsspA5FILMH/rm3Z9jTKaRP9JB+j5UrVX52yio9A1daQxlm
	8b5p29vRN4/Sv/tGe5I1VqxeBJCo71ezH6+GcdUCD7D3XDyjfXiQ/+zSAKlQ0P9cmofzLZSm9SX
	F8fOhRLyeE88mMbmPVZEvIToAyZYkvkgN/aKyRldqqKJ+LIC+xh+YealsGhseYIEbhOfh0xIy6f
	j5hfmhBcNzyY0yT0xULITtDIXTuToCaZZUmkk1UcbPAnmE3N16uL7MPUlGj7Yiqze8hg0RHPXyI
	tyOB1sw2WmYrI
X-Google-Smtp-Source: AGHT+IG+qNv3nEuovxtZ4Kh1LW4uAVYUbOr45A5k0T9kpCaFC9wlZiiNL+99xr4j/zMeBCPF6NNn8w==
X-Received: by 2002:a05:600c:3ba0:b0:43b:cbe2:ec0c with SMTP id 5b1f17b1804b1-43bcbe2efa9mr11724355e9.27.1741079010911;
        Tue, 04 Mar 2025 01:03:30 -0800 (PST)
Received: from google.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcb96b0c5sm18735925e9.19.2025.03.04.01.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 01:03:30 -0800 (PST)
Date: Tue, 4 Mar 2025 09:03:26 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Count pKVM stage-2 usage in secondary
 pagetable stats
Message-ID: <Z8bB3sr7X4RRV0CN@google.com>
References: <20250228121355.1377891-1-vdonnefort@google.com>
 <Z8Ycq3d7O8_3fozk@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8Ycq3d7O8_3fozk@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_010333_548131_FA58F0D8 
X-CRM114-Status: GOOD (  16.20  )
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

On Mon, Mar 03, 2025 at 01:18:35PM -0800, Oliver Upton wrote:
> On Fri, Feb 28, 2025 at 12:13:55PM +0000, Vincent Donnefort wrote:
> > Count the pages used by pKVM for the guest stage-2 in memory stats under
> > secondary pagetable stats, similarly to what the VHE mode does.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 1f55b0c7b11d..c2e022c41313 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1088,12 +1088,18 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
> >  
> >  static void hyp_mc_free_fn(void *addr, void *unused)
> >  {
> > +	kvm_account_pgtable_pages(addr, -1);
> >  	free_page((unsigned long)addr);
> >  }
> 
> Don't we drain more than just stage-2 page tables into the teardown_mc
> (e.g. vcpu structs)?

Sigh, yes we do. I've left behind some changes we have in our Android branches.
Let me respin a proper version :-\ 

> 
> Thanks,
> Oliver

