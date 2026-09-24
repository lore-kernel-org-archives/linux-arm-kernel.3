Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F8CC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=; b=wCkODwQHyb1bLuz3+OBfeU2w2a
	CFSojq9Oo3FHeUYeqoNmrDgqB6gNulzehDKbEGNBHZMQ7LB5jEv0T1XjZyVjyJUsZiLlDL3+MG6pJ
	NmRi2AzYRM/9SMKm+Kw+72e5VGAx8kjxEqSe6jAfTY8OZaAwuG0K0U0e/c1UbIvxPTn25SVt/b5A8
	MGJ8isdTFypSURW/iKiFD7WocrKl1tUtI6cAuWXDJ3+7J+upwp9gdq5xteKj+WSWSzTJf9XviW5xb
	pbM7q54DUPBLzy8vfd0qjFOKSTAGiltXq/BSILwFJg+/8diub3H1Szn6jhJyx8eS/29aSNTv1nNPq
	Nx4EKscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mSd-0000000BcdW-32CL;
	Thu, 24 Sep 2026 16:38:16 +0000
Received: from mail-qk2-x0f.google.com ([2607:f8b0:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mSa-0000000Bcc6-2xbI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:38:13 +0000
Received: by mail-qk2-x0f.google.com with SMTP id d75a77b69052e-52fb76543e1so245161cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790267891; x=1790872691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=XfMocC2DgEmjyjTRdqpIn3n6OX5bnCO34fAWZoMacwOQJevxK0YkPX0YYJe6qqogX6
         fb6Rdw03TglLfViT5aHzariRazGroyHnIJiWX3HGOCezw4QbI2l+9QLv8aqcVo9rXDzd
         cY1TbiZCqYkqwUp6s7bwUYfMDtPtfnWFnaofg3YB0peUso8u8GYJSwR9UGZoMNUtSEgy
         FFT31SJF349+p7x6psHziEYO+H41ESiEomQGatL3FreGiNdlyb3MD7UTTOJu5PBV6IRp
         STWtP6P2rPi8Rmd91uVc6/AYFTPDWoDudveHT6xedXyB8c83CssFIUFqFUxHMM/NgRjs
         /KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267891; x=1790872691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuPrvXBzY5FQ+f/5fzbveR9yF272P1V2+jsIcGJNdC0=;
        b=ofurMeeiBra4rO8EkZE4UQLF+5dLv/ssZyV52MfKyxHeAxOq5B2X/gNKudoriKJjy4
         Qfu7LSjXT4YwRlj99PAve+TixxJMIgirKw4w7BM65+Vpw4uCIR9sfp2fv6qvNtkMeLgh
         bcAfamVDI7i23LGP07TKoij67h1D0Q4GvaEmT4xZnjrm7Hm0T0pWk4taYK4BHFQEd6dc
         htm1Wa5fxXin2Bx73NE1uh6GANPWzIyvbeQq1QCRytlA7YmelEM2gkhC1iIDjDqT5sPC
         E2t5G7E/IxM1FxOCRe+aXmIDLugVSRA6gUzaqARQXuUvgMummzl2dOerXNiZLt1TvSzn
         XE4w==
X-Forwarded-Encrypted: i=1; AKwUvBzQlYP3MMvzjSgGhyA/toK9CVrPQOjY+ONbQVwUVZCW9ciIWdy/79gdUSRomKc6v0okhOvVnv1B7SURBmyxPOje@lists.infradead.org
X-Gm-Message-State: AFuF++nODQk3QCU1ilq0/kOfwLVMVzbEyHjC4L1s8ZfMqWJQZLAmPcjy
	w7qVR+QDJNbfP7xXZPMdS7GJgw8fPyiBIlRvImPbXpHeRW6+4s5aMi19LFvQZ1XhXkY=
X-Gm-Gg: AYBFou3XmISc37Y9kzCEmuiRd3Z4poeESs5EAlFpgPQ+YH5jNs+++AMPQ2CxT/nJ+W+
	rHOj0d/P4Fo7aD2CoSiniv0ql8yaw3wxS8mRJUo5cLx6+3OJapCfKlpQQi+BarqwW0+s44q2zUv
	sek3/uWMxyY0Zj3IBayc2/HROGOOlh+2KOdGPbf4BJUW9Lw8TkDOXgZWU6qHGyksue6+CeYmA8o
	oWJPBeKYG6kemmdhBIM72UZy/GTyfyMRohXFNI3lq8M2Ud2aw8SjLz3hS7IBPUUfVTHIJo+spLV
	IM7ODE337rAjvIlvsrS9or++It/aiKXO6wkW/nXDQUu8C160j2O9cIQBqrbnEHs4v+uXHHqdHAz
	rt5wUVp/Qdvqax4JzAEaCRYJGi8NmFv8eivtK8/08EUFu5TbbtulTCWipYSnlbgBjYBUJYTvAIh
	l7v5IkKBbkbGYxx1azZkL2CX63T+otnaGW2C4ChWDwUGI3CL4CgJfUK1PyBlj+XkkNsnpYrafjz
	Ybw04yEbH9yy981y8tVi7Hl4lvkLbw7lERqDep7o61fgldY/2SBNDE=
X-Received: by 2002:ac8:5743:0:b0:530:d860:ffba with SMTP id d75a77b69052e-532fe9f05bamr29797891cf.6.1790267890993;
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb32f6aasm45064551cf.16.2026.09.24.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:38:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:38:08 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 03/40] mm/vma: introduce and use
 vma_[flags_]can_merge()
Message-ID: <arVRqJZkql6sGunt@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_093812_747875_6FD85DF9 
X-CRM114-Status: GOOD (  11.98  )
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

On Thu, Sep 17, 2026 at 05:22:12PM +0100, Lorenzo Stoakes (ARM) wrote:
> Replace the open-coded VMA_SPECIAL_FLAGS check in the VMA merge logic with
> two new functions vma_flags_can_merge() and vma_can_merge() and update the
> merge logic to use the former.
> 
> This abstracts the check and expresses it in terms of the desired behaviour
> rather than an arbitrary and confusing VMA flag.
> 
> This also lays the groundwork for making further improvements in VMA flag
> usage.
> 
> Also update the userland VMA tests to reflect the change.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>


