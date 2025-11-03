Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF91CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 21:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1jgaIFuU1qR4r59NFbF5NuManKscXsOZ/dpS/a+5oA=; b=QXJX/+T8zF3ky5T2t2+mrdHbbL
	EVROPWILF5xiAcm2puQUk+JTYLgSkTdMl78ZXsHv6eL2BhXv+zbaMoyIQ2Np/mPHv8MhfkDQbioib
	QrwzQIprhQJisQDbCfFMYYG0BMDuUCk81tU0LAbjgvermQSNEWXF+JfF5MtFy6F3UQQeMAAZ1k/IK
	ARGfqvp8ZX1QXi+JGVB/ezV0/xdIDdS/FAgTwhTBZPwPHC0muLabcirCMuIzUDxDUQHalAoFKU6Bh
	Wk99hkDU3kLfw0WAGoM0vP23EyUwHurPYvUBjF4yV4VNSWeeVAGE543r0FBmEtsdOwSLzQ1qguPeW
	fbYfUqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG1mg-0000000AdHP-41Ky;
	Mon, 03 Nov 2025 21:08:14 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG1me-0000000AdGw-0cQl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 21:08:13 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-29598910dd2so40316015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 13:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762204091; x=1762808891; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1jgaIFuU1qR4r59NFbF5NuManKscXsOZ/dpS/a+5oA=;
        b=eqALiK0GfzSl7GXoOy1t9ahOsaKIYTbbB4uo8qIAteVYaV7E2UlNh3lON/zOossvTi
         yF1ByKdWahzD6oQzBB8c2cnTTSYmcQfpm4yvPl6VVYNbhTVyhp994Y3fm6pJaGAL0gO7
         7B07iu8w3OobcV4m1tKZiJoUJo5flp+cv3yLsDn9U8QTOhGB2Aseoj7Md2immWGAObRh
         CO0bLEc6VreAIt3VOtY4zUFwqRLGwOGhDa4kATI7JFjstTLIEx3FYg+1CslIBCtFT4gX
         CzbaQ750BJCMndsYJHQuOtDRY74cSXUws90D3LdVfTsqJrhUmwWtKLMDXsZbbfyE0Hxb
         FBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762204091; x=1762808891;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1jgaIFuU1qR4r59NFbF5NuManKscXsOZ/dpS/a+5oA=;
        b=j+sG8WbBZJIu7v/wX/VWTSAYvTPxCUi5Lo1jhKnSzVAVUdrTnr4wmxi3Qmuj78Vf73
         A1l0eGOtP7C2KJjU8BowexOmyxRh0sQ2KR1WoNbZqgXHMETMhPJ2pbNJYPDtgws0KIAc
         2GDFtp+6a7eEuluX1NGrnYcyhzFHU68jxqnwpS78iCg5aN8H6oj9LvHJV/sV8amx5LDM
         I+YQJksJx1RnnOClzTbjE9mLftHzDQ6cgiSIc9Ng7Zjg6ZzUTwIUE7331fskTmwhzRiJ
         OGDrFK7NGO/q0G3X34jSVWa46HucXkf6c1Q7XEUMqql+lw0dfO55BJTb1+XhGBNJPKZn
         2/4w==
X-Forwarded-Encrypted: i=1; AJvYcCWV4xQaIzUTXzJtuNVi1nW+AFMTmKMExXj/cZaSKqvB8thZVPSE5HEGvHCvdY2/JrFtksSmBRA6JhqOIWkwoZnI@lists.infradead.org
X-Gm-Message-State: AOJu0YyOoz7NQVDmX73B7S6p5lb1amlYHgObRwvuK5prDKsHXtk3UZL/
	98/fo/ikVxRJp3YeYOptZE4ZbQyUx4lEcu+Zr865S9FxQj1LfFStcJd1H9XWYZQuO1vZEXRTUjh
	tDiYeTg==
X-Google-Smtp-Source: AGHT+IFmLCYVwXdeteTbsVspNCQQNa07ZbCjVAqI5KUDK7A2fmNFJ3jDRmAVUCA7gp+ckzqh33TY6g3AxJw=
X-Received: from plbmn15.prod.google.com ([2002:a17:903:a4f:b0:261:3bf9:662a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c947:b0:295:1e50:e7cb
 with SMTP id d9443c01a7336-2951e50eb4amr164854455ad.23.1762204090972; Mon, 03
 Nov 2025 13:08:10 -0800 (PST)
Date: Mon, 3 Nov 2025 13:08:06 -0800
In-Reply-To: <c52db7bf-494f-49a8-9829-3805db6dda7c@gmail.com>
Mime-Version: 1.0
References: <20251013151502.6679-1-jackabt.amazon@gmail.com>
 <20251013151502.6679-3-jackabt.amazon@gmail.com> <aPpi1c-8EpWuo87B@google.com>
 <c52db7bf-494f-49a8-9829-3805db6dda7c@gmail.com>
Message-ID: <aQkZtjLt6lIULffA@google.com>
Subject: Re: [PATCH v2 2/4] KVM: selftests: Fix unaligned mmap allocations
From: Sean Christopherson <seanjc@google.com>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	isaku.yamahata@intel.com, roypat@amazon.co.uk, kalyazin@amazon.co.uk, 
	jackabt@amazon.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_130812_213624_C2600736 
X-CRM114-Status: GOOD (  19.26  )
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

On Tue, Oct 28, 2025, Jack Thomson wrote:
> 
> 
> On 23/10/2025 6:16 pm, Sean Christopherson wrote:
> > On Mon, Oct 13, 2025, Jack Thomson wrote:
> > > From: Jack Thomson <jackabt@amazon.com>
> > > 
> > > When creating a VM using mmap with huge pages, and the memory amount does
> > > not align with the underlying page size. The stored mmap_size value does
> > > not account for the fact that mmap will automatically align the length
> > > to a multiple of the underlying page size. During the teardown of the
> > > test, munmap is used. However, munmap requires the length to be a
> > > multiple of the underlying page size.
> > 
> > What happens when selftests use the wrong map_size?  E.g. is munmap() silently
> > failing?  If so, then I should probably take this particular patch through
> > kvm-x86/gmem, otherwise it means we'll start getting asserts due to:
> > 
> >    3223560c93eb ("KVM: selftests: Define wrappers for common syscalls to assert success")
> > 
> > If munmap() isn't failing, then that begs the question of what this patch is
> > actually doing :-)
> > 
> 
> Hi Sean, sorry I completely missed your reply.
> 
> Yeah currently with a misaligned map_size it causes munmap() to fail, I
> noticed when tested with different backings.

Exactly which tests fail?  I ask because I'm not sure we want to fix this by
having vm_mem_add() paper over test issues (I vaguely recall looking at this in
the past, but I can't find or recall the details).

