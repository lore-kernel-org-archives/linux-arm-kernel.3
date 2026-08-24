Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF25C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=; b=vkU9UoLALRgfoQ0IbH+jOOggRi
	YqNkYLFJ1vXgei+JYrl5CxzF04Lw3WGTUm0vcBmQbdxYzzHhxqfS2HInlcUnKSg4X2jmk/N0OcC3S
	PF/zZuMrlDorRjUjUEpi3OQyIkc3Y+1L+hRUTY4bw6nQDR22ZTwLVG70sASBdBR3lBsNUg048QvfM
	wGRydf4hRY3lMDwf/qvORfb1InelAZnHo45L1XrwJA+g7DcIH76cRtLF6x0Fqgrubn6sh1JanoinO
	W4vDKDN63n7rBuv6PBc5ArUTZe+Zxro0IQtmxpEtadQkf7kXae3cSWd3fRZQ07JqiwrYZ6Ft1KqKQ
	pKkxC1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWrO-0000000GxNv-3uT6;
	Mon, 24 Aug 2026 15:45:18 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWrL-0000000GxM8-0rTc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:45:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38e347638adso3358525a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787586312; x=1788191112; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=UMsHA66iW1HnPDCtvUeYqYmuc8fVDVhbQNB033xweSVcKUfo5pbbSktqcGKaSyfH3P
         L0OA5F+T+QZd4h+30DdFkU2OkKh5k6e6k70UkcyZoNRJaiG2nZ35JZfrPAdETmIMnsKC
         yiQYZBkwHBSz2a+apv6naKoi4SMWkgZHzlspPBAxPphFKchjJWOtKhSjNEN/aEbVmkYe
         x1ITH4fHNpIyOA+t17ggDvK9WpTkBPIRdPsGdznJKrUDIGMppc3tzukIvUAdvjt9f0vd
         /jrSTupgHsVKBtGE/5Za6sMHEfokl0NPBgBxW8cOMoWkVlQTVhQ7rlhkZj9oSL/CeVWW
         o5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586312; x=1788191112;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=I/UHboNRWHbYW4OXgGVFni1051SxTb21Jx0JWTzgCPeUkRRdSGQCHarxq5S4+acr6m
         +aqhtZg5v8SZRX5R47qBSQqTe5xfSEpbd1yskGYuZxqDQmxsav9ASQO9oYMMz9GHJPqs
         3oNFh/2GiExK83/ifdjBsRigcvzD3+sc9C79iQrhzIb0sL0Lc0nvxGDEXEno76+ae5ku
         vc+Df/Pwsa5PVi8tzKMZv+jkc1EwXcshNUVdB95/iJ1a6+0OR08M4IV42EeVEjoZtWFB
         qF74ynSWbdhN5LWpoTbSHzSo3ze8TWVlC8Ik01UV+dHijKQg/bUiU15PVFt/Y6XkF/oQ
         i09w==
X-Forwarded-Encrypted: i=1; AHgh+RoCIBSF481oAd0A64KlsyEohBNaiLFhpw2BY/Tk8rkJGOqCSAp1OGGsHDidjDEjOAF6NxGboeTtJoXfhO56jZOE@lists.infradead.org
X-Gm-Message-State: AFuF++lsCCbDPV6FI2Upj2aG24qjsgh2vST85R4nJmaoL6+ilsC+HrTf
	/m3wsKH7rDWDWI/Nhjmdq8VuMrIDJm1soo8chFOMjQ64q32DIx2PmBS5fSqV9QnDX9k=
X-Gm-Gg: AR+sD11xjvh4BKeRMPw0fVfxutlp9se6/tJ7rDYeZuah1V/d2ZEW5kRPqCocRUrKCsK
	pACeRQORdFUpDqYVu+0eRHgVmW6sA1Bt3iMFQVZRG+73fyWe5lbKrWRJDqR0NKRuCRhiveLEM4X
	kkl3jl4VWYvjuHvJop0ssfObK3CrSJojU9leIkSoOB9TJ7ZTC1BnC6d9IA5W+xBiHsGLkaWx142
	agu0aDD+hprh7J+5n7CkXk9M5O8C3IBnlpEy8BSbrs1Vn+UKYYP8K7TRD99x0G2ApsQRDUvUBjS
	6JEMJwEhJixDZd03/Zi2LkGg3dZDpVbYk6Q//5KuvRvI3CZhlzlPvMjc4HzbtkGr8v8sPepYctT
	KA5dTCYm5SIw7cs1Bke2zNEF/Uj3V5GeKl6CsQGqw3GVNC8MzMgCGpoptJAXEkIpiGEFI1woZJ3
	KxQla4tRLAFM4hLyyS21qJlR6QJNYDQ3ZUxPqcKvrFWV2dWsqV6riy3Rljv2a7LK9CZ7Rwn4iaw
	nQ6zXAAZEgakqo=
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr39252435a91.15.1787586312489;
        Mon, 24 Aug 2026 08:45:12 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b7ff6dsm23611a91.10.2026.08.24.08.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:45:11 -0700 (PDT)
Message-ID: <029cfde8-74fc-4437-bc18-b1b53d44cab2@sifive.com>
Date: Mon, 24 Aug 2026 10:45:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V3 1/8] mm: Make ptrval_to_str() generally available
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org
References: <20260818040041.1891769-1-anshuman.khandual@arm.com>
 <20260818040041.1891769-2-anshuman.khandual@arm.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260818040041.1891769-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_084515_287257_D5F1D5A6 
X-CRM114-Status: GOOD (  13.02  )
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

On 2026-08-17 11:00 PM, Anshuman Khandual wrote:
> Move ptrval_to_str() inside a header thus making the helper more generally

Typo here and in subject: ptrval -> ptval

> available for new users which are being added later. While here, also move
> another related string size macro PTVAL_STR_MAX inside the header as well.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/mm_types.h | 15 +++++++++++++++
>  mm/memory.c              | 16 ++--------------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index b18c2b2e7d2c..a5b514e55dd7 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -2001,4 +2001,19 @@ static inline unsigned long mmf_init_legacy_flags(unsigned long flags)
>  	return flags & MMF_INIT_LEGACY_MASK;
>  }
>  
> +void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size);
> +
> +#define ptval_to_str(buf, val)								\
>...

