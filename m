Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA0CE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeceS72pNS9/lhTTXITmJ9WqibUxqQk+B8pi9KsGlEI=; b=NXV2SO4kayRfnc2SWlkXx+wUye
	2jb8ayCphyq8JbJsLxiXSQzHul6ZBLrslJ6IyefqD80f4ulVr66y61c7SSNo6JP9yLWTiNsnp31BW
	JfIlZKdK9q4vbua2b0lNB0PPre22FDS/VdqhU1XMSBjDY+2o+M9QFCu5RS4nJH+m+eRMwNC22jlP5
	IHMs80aNcMIfp4gNuCLkT1h9vSP3QUWtOT+igM+IENP07xjdwjlG5qBXE5h9pqvzUHYe9gu7WNk57
	i+odKHdZhalD0tnLjJdoSC7kgc2MPSG23hftJoXexwvEiR3bTf/zfYr4AWuYKcLcuMoTa/2F2xVBQ
	xPLU+kLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6we-00000004NyC-22qZ;
	Tue, 07 Jan 2025 10:36:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6vR-00000004NXh-3R6U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:35:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so24383625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 02:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736246103; x=1736850903; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QeceS72pNS9/lhTTXITmJ9WqibUxqQk+B8pi9KsGlEI=;
        b=d0ztEVnaSMqq4w0RJplo7qrnYqjSwnwihXkEEzgXiwsTL2KDcnBIYKbXnoazYZ1zvv
         3I7SWhJP3QMthyETnTOiX7xTTB+Matdq+8SprC5YnFINqJaW2JR7o4c5Bt5x2XffXCbg
         5t8VjfA9HHv1dZ06boqhDZLemyXUCLnuDz4tBfvGWxBX4M5VQG+eZejb/5wzMEggf/sX
         USSdr6QZ0Bc4+Y93k5kp4kt7CqFL7/0MC9/dbHdQ+9TFudT5PSMaZsOTacVGlyPdxwm0
         szf8oVYjg+HUXyWJDXbzK9LZSUlW0Nm1x9Qi1UJv6Br0kj0Zftoigh5RxvAWEUJrZGTi
         skZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246103; x=1736850903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeceS72pNS9/lhTTXITmJ9WqibUxqQk+B8pi9KsGlEI=;
        b=bhzCh2jIwN/gXPXozXoY21coAcRPj55e7vciCsNur+v2HXzN7TfiklgOKyvIVIAHW4
         I9SlOP46cydV5cgZes192LjMiQ6Muzlng4ONIiMrDm33543Uzbjlc3JhrRjeZuGFm3Em
         tE0apKbBX8mpJpoT3JqQ2gwEi+7xEYkLUG7enLzMKmPSkJnoDf+7XgSI4s/8ulAX6HLF
         TrvI/STZ02e3TyXVmr5jmyuwZfktIhaQ3wN84CbjjKxCQ8MfJtGc0IUSUfyNZYyHKPcA
         aTEruB1iL7Og/FRVDm5bTY3g4dF05LIp0A1VujMvbjI+T9P66R3ot9rNmQay0+7Db50W
         a/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVLruhuGEiG1y2IPlmNjPqoA2EAv2aZ/HKLcDFHBtYmzJouKWyA3otvLncw8l+Dyk/tOCKyKu3Pjh/MzrNm9DQY@lists.infradead.org
X-Gm-Message-State: AOJu0YyblvkZUMnARf1vmgd9KABn9NcYDPP9o6RweHCfuUcHXHVRMZeL
	5HdIsYnMf6ovJSIcgOHbPGlU4Trh/6SVTVIqOqndMy6J6RDvIWemC60Esh+WIA==
X-Gm-Gg: ASbGncs5rUSSaAYiTikJywNNO/WXqukJ8FS+1UpwBxV+q43ZQgY+mwIKay2PIYbMYqM
	xPSS2hUIG2+oO//NBY4MLiY62y00kz1YpvH1t0pYQRPjnTThU+4s5hPGJ2wDwUuB+rBD3nKSZNl
	2gWSo/dLJhFvH7zRAV2kVtaZsHMrrriljRUr4EGsIueKGfvMPU8gphEhyywyrh37AnEGT8fm5b8
	CtsD5kbOcos32+1QDyLmjkuEVckzKJeQnhVGfrSIP09cjRHOUc+mvmbZga/lmv8quYHreWdLQ+O
	w5IFW1Kc7r8xEnYrRbuxCw==
X-Google-Smtp-Source: AGHT+IGHiQ/5R0oXTPP19YJ7NE1BQsHEpwZF7WlJK5SBOue63vxyjYDaDhToA8Z190S3cgs28JINOg==
X-Received: by 2002:a05:600c:138d:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-43668643173mr547315115e9.12.1736246103409;
        Tue, 07 Jan 2025 02:35:03 -0800 (PST)
Received: from google.com (202.88.205.35.bc.googleusercontent.com. [35.205.88.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219611sm599479635e9.23.2025.01.07.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:35:03 -0800 (PST)
Date: Tue, 7 Jan 2025 10:34:58 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, kvmarm@lists.linux.dev, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <zenghui.yu@linux.dev>
Subject: Re: [PATCH] KVM: arm64: Fix nVHE stacktrace VA bits mask
Message-ID: <Z30DUhWWMZurEu33@google.com>
References: <20250106183213.4094616-1-vdonnefort@google.com>
 <86zfk3nf6j.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zfk3nf6j.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_023505_854707_A724EDE1 
X-CRM114-Status: GOOD (  21.91  )
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

On Tue, Jan 07, 2025 at 09:31:16AM +0000, Marc Zyngier wrote:
> Vincent,
> 
> Please add all the KVM/arm64 reviewers in the future (I added them
> this time).

Ack, apologies for the missing recipients.

> 
> On Mon, 06 Jan 2025 18:32:13 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > The hypervisor VA space size depends on both the ID map's
> > (IDMAP_VA_BITS) and the kernel stage-1 (VA_BITS). When VA_BITS is
> > smaller than IDMAP_VA_BITS (i.e. 39-bit), the stacktrace can contain
> > addresses bigger than the current VA_BITS mask.
> > 
> > As the hyp_va_bits value needs to be used outside of the init code now,
> > use a global variable, shared by all the kvm users in mmu.c, arm.c and
> > now stacktrace.c.
> 
> I tend to dislike this approach for at least three reasons:
> 
> - it makes it hard to follow *when* hyp_va_bits is made valid, while
>   passing the value as a parameter is self explanatory. Specially
>   given how convoluted the nVHE/pKVM init is these days.
> 
> - it prevents the eventual use of *multiple* VA bit values (one for
>   TTBR0, one for TTBR1) once the grand plan for hVHE is completed
>   (right after full NV support is merged! ;-)
> 
> - it makes the change larger than it should be, specially for
>   something that should be backported.

I was myself not completely convinced because of that last point. I'll send a v2
with a shorter version.

Thanks for your swift review! 

> 
> So I'd rather you keep the general shape of the code as it, and simply
> publish this 'hyp_va_bits' for the purpose of the backtrace code.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

