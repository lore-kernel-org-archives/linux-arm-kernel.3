Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92424D70DE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SE3hqx8PlRH6oR2vsIt6C8nLef92GwCrM14lVm2xh9k=; b=mpeNsU1MWl8J2XvwI889R7Q08d
	EMmsV9pG7ThPaJlFusZmZ0unKHVaBjVx2xAGlsU1Cunh4rxByI3ych2STzesAuZtFYE6WWH0ptfRS
	PNlDttQa9vluyU5lO0jy/++lf94YqYHgd7sThRXvk7y0O+nTi5se52w+zkwhqLmz9M743TDxP9skQ
	C3FJApvcSMzbReqETqhxNIJ4gHopDZeI5Ad8JEj2l7P1d7SPX7Ge6lm34W5XCpj2oMcKqrDZ39sHE
	x8+sVvqCL2MmMvT+6KLpA5JIoHmr3oyiu4NptZ8zjOR9jVjbZli8gcqpMcXIsJcAgqUtFZJyt7U9D
	BR7yAPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGh3I-0000000Fxze-1eov;
	Thu, 28 Nov 2024 16:07:36 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGh2I-0000000Fxv7-2FEa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 16:06:35 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-382423e1f7aso646335f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 08:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732809992; x=1733414792; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SE3hqx8PlRH6oR2vsIt6C8nLef92GwCrM14lVm2xh9k=;
        b=GLhAK45L4x70uUD3wQqp8LPi0keFfGTNWwvh9DaCoRSc8lU+LCwcvMQ0H6EUWqPLMr
         akLvCDVHEVkwngoVaSdSVTUPZG3EQju28c9K1CKAOfD/KYbdXYN2CYBbuV6898WAV5Jl
         FiN8q3uqXan1W5UFnAnJfmW8wxqZ1TzVX/FWJii/35b60tzTUFwfwabQBtV1OxTdHQqx
         nRjwYJnRswKuu2wdp0eDsMW4aIObn0GZdDs9KN6C+SQMACSNDRB6bGzh7iSji5gDZ4PU
         QYWwykuT/rCku+DfD7Y1dqOFiXhJKdnCgdR7+A8Z7avbavt3LwbOqWfgSsKjujhu2NlU
         66zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732809992; x=1733414792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SE3hqx8PlRH6oR2vsIt6C8nLef92GwCrM14lVm2xh9k=;
        b=mXUfpSwEm04JaOiv1gjLMEDu1g2BxQB8vkHOGY78B+JFfyxCZtSh5EqhdLpBB/xZTK
         vxF9nTbUHB4dbZlSSa67X0OtMQZJGsCB5xrc2v31mKMyF5P/JDhwZ7FI3sgBKdT4XmfL
         0qShZWatpE2ASaeSiusdYaRZkAeRlwpx6Jt99EWRRNGu8YaYRqsHMiouzAtaW0QLdtHU
         OWmvyG9N2FQJcU3i3JZRCOphPgs0Z1QGEFmiQ9473tOxcuJbEyFAAMZWKhltmP8wjlcw
         ZQ51cGVMYT8A0fDUeJSDAP/PHwpsqPeSSt1vyi3Ju3CC9eCNr4Dnyr6fz3TtHKwqwuk6
         ItMg==
X-Forwarded-Encrypted: i=1; AJvYcCWaqJUxjwdimvUm76kYXBhi/ndygsBSxOOJofzmev9Nnuv9yC5nT4lCiCYzdR84c9tAGWtUuV1KZho66fIWQHjQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyQFXmXhNRWWRaCdky9jy1GVYpYtI5StPBa4NBJo6vwrU8ohnHt
	QT4RAGyMfc6UNy1tQXELRd/sR3fYZAgbqezsnAckHXrCGd3soojgjmVQyHAPvZIox4yYvBvMEQa
	O9x4=
X-Gm-Gg: ASbGncuGYKAWDj18SWDQDDCoSqlQ10o6s2mMSM7MheoImO9QUPbMANOyeTeLrOVVOXu
	BEPjkyKSvUdb4uINJJD8vSPRwyhP6q0Q6g4nhoFo4czXNA121STmoI7m8hTsdsOn2KS/3/DsFPQ
	nu/+DxaKBl1UtKTkpJn3aflKhn/QzeZWhp6ukB31LIVQWhiCBfz+qmU4l7Yk9LKpJgc+6vv+pYZ
	qCuBTzYQyNqPMkECi0viYm3Wv5+0cmKWM8gd8dO9t7k74eDQ8GVwAfPB0CxoTHkgtyGnDaa9D5x
	rhmycgoYCiqPKnZLOKnoNjGe8QEh4YVa+sM=
X-Google-Smtp-Source: AGHT+IFG7K7Tcmhw/SgqiyfLkjWGDpN72liep7NaizvY+BomgXIHH7qnDKDhB0LbxLbY9up/D3Z4OQ==
X-Received: by 2002:a05:6000:42ca:b0:382:503f:a323 with SMTP id ffacd0b85a97d-385c6ebaa70mr4267236f8f.19.1732809992314;
        Thu, 28 Nov 2024 08:06:32 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2dad8sm1975016f8f.18.2024.11.28.08.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:06:31 -0800 (PST)
Date: Thu, 28 Nov 2024 17:06:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: will@kernel.org, julien.thierry.kdev@gmail.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev, 
	apatel@ventanamicro.com, andre.przywara@arm.com, suzuki.poulose@arm.com, 
	s.abdollahi22@imperial.ac.uk
Subject: Re: [PATCH kvmtool 2/4] arm: Check return value for
 host_to_guest_flat()
Message-ID: <20241128-7f4e0ab75188ff4684785d2b@orel>
References: <20241128151246.10858-1-alexandru.elisei@arm.com>
 <20241128151246.10858-3-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128151246.10858-3-alexandru.elisei@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_080634_578491_0B02E34D 
X-CRM114-Status: GOOD (  32.92  )
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

On Thu, Nov 28, 2024 at 03:12:44PM +0000, Alexandru Elisei wrote:
> kvmtool, on arm and arm64, puts the kernel, DTB and initrd (if present) in
> a 256MB memory region that starts at the bottom of RAM.
> kvm__arch_load_kernel_image() copies the kernel at the start of RAM, the
> DTB is placed at the top of the region, and immediately below it the
> initrd.
> 
> When the initrd is specified by the user, kvmtool checks that it doesn't
> overlap with the kernel by computing the start address in the host's
> address space:
> 
> 	fstat(fd_initrd, &sb);
> 	pos = pos - (sb.st_size + INITRD_ALIGN);
> 	guest_addr = ALIGN(host_to_guest_flat(kvm, pos), INITRD_ALIGN); (a)
> 	pos = guest_flat_to_host(kvm, guest_addr); (b)
> 
> If the initrd is large enough to completely overwrite the kernel and start
> below the guest RAM (pos < kvm->ram_start), then kvmtool will omit the
> following errors:
> 
>   Warning: unable to translate host address 0xfffe849ffffc to guest (1)
>   Warning: unable to translate guest address 0x0 to host (2)
>   Fatal: initrd overlaps with kernel image. (3)
> 
> (1) is because (a) calls host_to_guest_flat(kvm, pos) with a 'pos'
> outside any of the memslots.
> 
> (2) is because guest_flat_to_host() is called at (b) with guest_addr=0,
> which is what host_to_guest_flat() returns if the supplied address is not
> found in any of the memslots. This warning is eliminated by this patch.
> 
> And finally, (3) is the most useful message, because it tells the user what
> the error is.
> 
> The issue is a more general pattern in kvm__arch_load_kernel_image():
> kvmtool doesn't check if host_to_guest_flat() returns 0, which means that
> the host address is not within any of the memslots. Add a check for that,
> which will at the very least remove the second warning.
> 
> This also fixes the following edge cases:
> 
> 1. The same warnings being emitted in a similar scenario with the DTB, when
> the RAM is smaller than FDT_MAX_SIZE + FDT_ALIGN.
> 
> 2. When copying the kernel, if the RAM size is smaller than the kernel
> offset, the start of the kernel (represented by the variable 'pos') will be
> outside the VA space allocated for the guest RAM.  limit - pos will wrap
> around, because gcc 14.1.1 wraps the pointers (void pointer arithmetic is
> undefined in C99). Then read_file()->..->read() will return -EFAULT because
> the destination address is unallocated (as per man 2 read, also reproduced
> during testing).
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/kvm.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arm/kvm.c b/arm/kvm.c
> index da0430c40c36..4beae69e1fb3 100644
> --- a/arm/kvm.c
> +++ b/arm/kvm.c
> @@ -113,6 +113,8 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
>  
>  	pos = kvm->ram_start + kvm__arch_get_kern_offset(kvm, fd_kernel);
>  	kvm->arch.kern_guest_start = host_to_guest_flat(kvm, pos);
> +	if (!kvm->arch.kern_guest_start)
> +			die("guest memory too small to contain the kernel");

Just doing a quick drive-by and noticed this indentation issue.

Thanks,
drew

>  	file_size = read_file(fd_kernel, pos, limit - pos);
>  	if (file_size < 0) {
>  		if (errno == ENOMEM)
> @@ -131,7 +133,10 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
>  	 */
>  	pos = limit;
>  	pos -= (FDT_MAX_SIZE + FDT_ALIGN);
> -	guest_addr = ALIGN(host_to_guest_flat(kvm, pos), FDT_ALIGN);
> +	guest_addr = host_to_guest_flat(kvm, pos);
> +	if (!guest_addr)
> +		die("fdt too big to contain in guest memory");
> +	guest_addr = ALIGN(guest_addr, FDT_ALIGN);
>  	pos = guest_flat_to_host(kvm, guest_addr);
>  	if (pos < kernel_end)
>  		die("fdt overlaps with kernel image.");
> @@ -151,7 +156,10 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
>  			die_perror("fstat");
>  
>  		pos -= (sb.st_size + INITRD_ALIGN);
> -		guest_addr = ALIGN(host_to_guest_flat(kvm, pos), INITRD_ALIGN);
> +		guest_addr = host_to_guest_flat(kvm, pos);
> +		if (!guest_addr)
> +			die("initrd too big to fit in the payload memory region");
> +		guest_addr = ALIGN(guest_addr, INITRD_ALIGN);
>  		pos = guest_flat_to_host(kvm, guest_addr);
>  		if (pos < kernel_end)
>  			die("initrd overlaps with kernel image.");
> -- 
> 2.47.0
> 

