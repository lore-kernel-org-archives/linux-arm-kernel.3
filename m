Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9655C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDGRwzwOvCrWWFQfPfpra9qYK3fJVDbD/wSIIQxXnMM=; b=eWvduYe11tNolTBhM2HDKNuAf6
	cO6Vp35h841X1OHf3TbLAHrFz7WMQsQfI1lXHTg5L+UhU5vyRWjf3w+zZdriVr0FQqG6tnYEPFq3l
	z4/L3AFaGxRJO1SJpOjRPw1zQ0yvznjLGQCrnM5FqQsdgOvzGoDFw6qAsnIp/pcu57+xADBAkMExI
	mUVjpPCp0WIhtg22ScK//PWNNgdlMJq63dQTXbxFChfJvS6zT5ZrvIGcpYyMNFzC3ZvRyM4PW894a
	ZDn0iOJFpk+jAk4L5h2c/Esml/k6cLLZwJt6kWQsIUV54qo1tkfVOuKenauiGoDRZ9X6ZhVjgMche
	OnCtjVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5B4-000000050Gb-1uLE;
	Tue, 08 Jul 2025 10:03:54 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4nx-00000004ujt-2xuj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 09:40:02 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so8181417a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 02:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751967600; x=1752572400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDGRwzwOvCrWWFQfPfpra9qYK3fJVDbD/wSIIQxXnMM=;
        b=TWvCj/tzlpCGC8BZLG6zzGXsi4o3rr+YTTsfJL4JaymmtYS0OT3FJ2UHl0hTqFTRtq
         JOzM1d35XlAGKndGmZb6rfxrp05qKjyJLp2O/VaeO39j8KPTMnbckT5WY3lTU77x6ji6
         Kk8Ujj1O44boMru9jdQ16e0i8UcjamUkCDFK8fftynGmcv+W/QZlXLQibYMo8RTB1odB
         lUtNOEcdI/SShdjuPQyCCFiziXD5U+/TKd7RbLf3EIpSJdsHS7/XvPuu93Qrjpzh4VBz
         O876JsukAg/ly0Kqu6kz7t0t+A9gyeEW93fVBsgPF1djoXCzE/JlDSPcfpN5SG6/5Glh
         ccwA==
X-Forwarded-Encrypted: i=1; AJvYcCVc7pniWFTd9LY9DvJujls/Ii9Ip0OWcEDDjqMLr8sVkNEEl+H/Fw2Fn/g8ytbRXmYLHFUtvSnYG4HXswhH8iHO@lists.infradead.org
X-Gm-Message-State: AOJu0YwTdaQ6P8Qcyn6Lj0rHSECNiV+8Z4wmRmbMT96lTcFfAH5lAOVx
	XdcJQ2Mr7bwCKMLIlVm7wRKWN6U5mMm+hyhXV2S3YrriKfNWYwsKNqbYpsbx3FwG
X-Gm-Gg: ASbGncvkAK6/CZ8S/Fi9UW/I6D+d99sDe/jMxKasSfFsq7UCcaoVy6pODdImLsAl/Fc
	caQg6ru9/OozVwvlf1SQH7I9jLNrzr3mVMhE41AFPW2jeG81I16x2V/yo2ZVaLyr6C8aGegG02c
	5C1IRazm/vtTQE2qlLptiaKisASRVOkMSyYwXyFqEiKx34RD+XqXpSNlAYDj15Ze+Zb12ZRO9J3
	l+8RRFzwVz81V+iX8mQlshMOTNmN/WnvdQE2nbJBSHkq7ovcld1kXWL5Shd9F7WDWiiahvX8ENp
	J0X/O++UFHSyXzFdoGd57G1gIXD2hrpG35b1E4WzIwF0TPAVYt0P
X-Google-Smtp-Source: AGHT+IEKuh5P5XxfGU6tISC7d/SWRHDTdhtCdRwTY574SCwgIN9VltFkhI6/5VSmmx/mAhn8r/NsaQ==
X-Received: by 2002:a17:907:97d0:b0:ae3:7022:b210 with SMTP id a640c23a62f3a-ae6b0b1ec6amr238872866b.12.1751967599680;
        Tue, 08 Jul 2025 02:39:59 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e6f30sm864599066b.33.2025.07.08.02.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 02:39:58 -0700 (PDT)
Date: Tue, 8 Jul 2025 02:39:56 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, leo.yan@arm.com, kernel-team@meta.com
Subject: Re: [PATCH 1/8] arm64: Enable VMAP_STACK support
Message-ID: <aGznbObwbaZlnD17@gmail.com>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
 <20250707-arm64_vmap-v1-1-8de98ca0f91c@debian.org>
 <aGwCfRkYqcYBvxZK@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGwCfRkYqcYBvxZK@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_024001_743347_7D4C626E 
X-CRM114-Status: GOOD (  18.20  )
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

Hello Mark,

On Mon, Jul 07, 2025 at 06:23:09PM +0100, Mark Rutland wrote:
> On Mon, Jul 07, 2025 at 09:01:01AM -0700, Breno Leitao wrote:
> > Enable virtually mapped kernel stacks for ARM64. This provides better
> > stack overflow detection and improved security by mapping kernel stacks
> > in vmalloc space rather than using direct mapping.
> > 
> > VMAP_STACK helps catch stack overflows early by placing guard pages
> > around kernel stacks, and also provides better isolation between
> > kernel stacks and other kernel data structures.
> > 
> > All dependencies are satisfied for arm64: HAVE_ARCH_VMAP_STACK is
> > already selected above, and KASAN_VMALLOC is selected when KASAN is
> > enabled, meeting the KASAN dependency requirements.
> 
> I reckon it might be better to say something like:
> 
> | arm64: Mandate VMAP_STACK
> |
> | On arm64, VMAP_STACK has been enabled by default for a while now, and
> | the only reason to disable it was a historical lack of support for
> | KASAN_VMALLOC. Today there's no good reason to disable VMAP_STACK.
> |
> | Mandate VMAP_STACK, which will allow code to be simplified in
> | subsequent patches.
> 
> ... to make it clear that we're not changing the default, and we are
> removing the ability to deselect VMAP_STACK.
> 
> Either way, the patch itself looks good to me.

Thanks for the suggestion. I will update and respin.

Thanks for the review,
--breno

