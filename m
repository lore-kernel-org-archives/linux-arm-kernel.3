Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B8FCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DofwycJUztzv8ieqZ6Ro3L+aNfF27V1vkVEXRjl8To=; b=LJn3h2+jUDWmYSA3awDFlXs0BG
	+Fq66qNFVEW8oE+tAuW4+58A36l6KhAdBp4Nf9e7NdSQ+L1VZjcNCI8UA33mVSorYsnCEwrQunksQ
	s+xt3C/b4xju8BWL1UbQKJq9BP9S2xn2QygY3Nc2VDaqzpwob+OxL0aJpcZn1LW3G7zYyQq/OqorW
	tQF2p+mJRp3W4xBZOooLhulL+/gEsn6LK3eM+bcgjqSNvKerpsidiktDkjHSSzVMa82+oLbR4tJzB
	CtnazLxovgr0YnskbarunTWD3pu/BWR2cfM8QpvBD3fg0yAedBfpwhNnVzYsc7YeOKZg1VFQ53lg4
	JTFSr5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGjl-00000004T1e-3IwY;
	Wed, 27 May 2026 16:04:05 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGjj-00000004T1G-1i68
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:04:04 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-841ad134423so214612b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 09:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779897842; x=1780502642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DofwycJUztzv8ieqZ6Ro3L+aNfF27V1vkVEXRjl8To=;
        b=QB64eh762eBcWrIvbhdkItk+8x1gC4AgvHFf3CSF4YNoGSIV/dPzGpVj26XXkI+A00
         1Rn7/t26iIxU3ha0jBLRTt2HTkhuFyEoOWNjF7NxVKLMMVpkp2RK2JfJaZ+N1pGL0+3c
         R0Sl5/HyBvu7HX6QbiamPE0iv0SBVG87z+gvQKHsban7Tu5CNZWxvM9U207Cwyi0ym8H
         60fJ/pU4V4PrAePjTYJcnPNQvsV37SgHPuiF4okRW7JYnodmI/oL2mW3naINpJWN1yVa
         ulTFbx0FoOSKTlR+hrgLRx4f/gdyKzrtjgf318g1p7ijkjjew/c/Ntyfmoh8zO31Anyx
         Nk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897842; x=1780502642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DofwycJUztzv8ieqZ6Ro3L+aNfF27V1vkVEXRjl8To=;
        b=mI+Q9/bsM8ydjGmOAFnwkEEJsyCv8iF6nDn/eCqrwCEvLZVndEQ8rGBJu6gVgfkNGD
         Ec+ajkxxsNvJ24mgSHgT4nn1RjODRXF2Of5RKYEOSSB5YokXHaako+agpGT2mw+iblIA
         kbHpnjvRU9MZNnpNohuH2SHwuqX6wqxzvo08Bews7WO/Ljju8qtu7DX3gvih8sNHeH5E
         GU0KXb5ForTm4HWrGa5rCiDew+UoCezSRhntj23Tx3Diu4CqjnIy5qrugROz8BnPptd3
         7n57GihJUu+GORDQMpxxz8zve7bCEHm+opAHCSICKDhnB9msQRN7mI/Kfqk+FyhD4/CD
         hrxA==
X-Forwarded-Encrypted: i=1; AFNElJ9u2e9DXhZ34ls7USQCk2lxRIranX9/KHNi4mLQwtIW9EmCLMbmzIOETmaKcn2FpP/OeqDuvy4Uc5NAI3j9nrzK@lists.infradead.org
X-Gm-Message-State: AOJu0YxD7J2u1bm+7d1DIhiRkdfugWso4z1ahniXg2jghh+mpww7StB6
	sXmTsMl+vPz/XLFhe/o/4ruCLULZ1du1LPFCqBQ7QfOB3+FXx17YwvfU
X-Gm-Gg: Acq92OH7SqGR9m8uEG0HL3wsAeI0hxwtCPzvyp8iq+rT4xOOhMZvoUM9edOJfast6jL
	zpj7+uFnMld6h5b83FyxZP0aaaVMkrDTVh5YLEQxRnHQdN2oS5SLnlc8pDlENpbgo4Aefryp0jm
	lPaeRtSznOckySeoRc/eNVw2QESlyRSVXtI/CnRDr4fh0xXqeuz3FySugf0fw2EwsUdJUyqkZ+i
	cNFHQhHaQuruYrExHIPrdPvrXyQFnhq1ofxTNl2qhiQ0hpTZ3bJDd3Otol9dSC204Wkl1y6EaJ6
	Rs+coeKFgGpTECRgrHaOSxmdhAcQKJKkWWhCAOKXFQGnpL9FNJWwLQtpfOwEkLSqGkZ6wFuEZRx
	E49BKsPZsc4BKRadhlBStIQNVIaCzdrkGqEjarBqHlxJKMpl84PAoopEGNI9hgcCqPDqyoDrBPg
	bucmbdwuZjk9SkVo+Xbo2ieqBvUzqeML79Ie0KNJQg4WwIJ+c4mU1YUNQRfoQ+PVkF5ppZasNNS
	zPmCvbfJCmHSlvfiogNc1o=
X-Received: by 2002:a05:6a00:3923:b0:82f:21ee:270d with SMTP id d2e1a72fcca58-8415f0d7e75mr12854029b3a.1.1779897841590;
        Wed, 27 May 2026 09:04:01 -0700 (PDT)
Received: from fedora ([38.244.149.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70e07fcsm2510447b3a.40.2026.05.27.09.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 09:04:01 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: dev.jain@arm.com
Cc: xueyuan.chen21@gmail.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com
Subject: Re: [RFC PATCH 1/3] mm: make persistent huge zero folio read-only
Date: Thu, 28 May 2026 07:03:14 +0800
Message-ID: <20260527230314.572571-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <e5a59b25-d8ce-4d78-aec3-ee1b6efccfed@arm.com>
References: <e5a59b25-d8ce-4d78-aec3-ee1b6efccfed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_090403_446790_CC38E923 
X-CRM114-Status: GOOD (  11.17  )
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


On Wed, May 27, 2026 at 07:02:55PM +0530, Dev Jain wrote:

[...]
>>  static atomic_t huge_zero_refcount;
>> +#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
>> +struct folio *huge_zero_folio __ro_after_init;
>
>
>Can we guard this with CONFIG_PERSISTENT_HUGE_ZERO_FOLIO? Since
>in that case too the pointer is never written after init.
>

Yes, that makes sense. The pointer lifetime is tied to
CONFIG_PERSISTENT_HUGE_ZERO_FOLIO. I'll fix this in v2.

>>  
>> +#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
>> +static bool __init make_huge_zero_folio_readonly(void)
>> +{
>> +	return arch_make_huge_zero_folio_readonly(READ_ONCE(huge_zero_folio));
>
>
>I think READ_ONCE is not required since no one is going to change the
>pointer after allocation?
>

Agreed, READ_ONCE is not needed here. I'll drop it in v2.

Thanks,
Xueyuan

