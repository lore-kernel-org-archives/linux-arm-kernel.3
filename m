Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAF9C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1bXM7cxoKeUc47A9jFoEGfA5IU+Fj/3JFjY8VGeyAw=; b=iqfpx/6KgC/NGoQuqz5iJOSq/m
	wrd/UNk0C/a/x+ncAYs6QJYeAhhOXHDuvZ+P+8TnhiLGe2VYmfF6QItRF4xyEvYyxAkLCyyRBIcOv
	iBzek1iLpjZ/qfB6r+tnMIUR/OBezrcqZbkWDs3MxEEHVC5n+1ZaYncaoAXx8ZsUxCk/0qUGu9Xl8
	/XDNJEUNA/qKkim8xWzzTkIYleR4jqQNILFvx/H9w8LdD3BYeGHubAoa3r3Q3Bo5BvVG1cc1V39+p
	519zyo02IplbBAT0PBQ+FQWxyc19ZNxbEcjDoiU7DzzNJEEzrUtY7ZdmSIs63R8QTWlUkgd1fYgdM
	Wt6tkZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGGI-00000008EVX-1zSD;
	Tue, 21 Jan 2025 15:33:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taGEg-00000008EL5-0p8b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 15:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737473532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1bXM7cxoKeUc47A9jFoEGfA5IU+Fj/3JFjY8VGeyAw=;
	b=XBvbtWf8vCOLxLbhJVWoK/9YiX0d9xrOWc1kmQFZI/Ws0qzNltZQmTDLyc6FSx+9DYqlTT
	eYegjWaXVE/tHBJRsifO4fXV5oq46Ia/ZYuoaWMHvrwim1402nhuTkqOQA8d1GOW1Gf7cJ
	iE5E4y1eLgKIEQZA9RgaWfJAKOQfxk0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-LlVyTW-lOumerIfm0kOuvw-1; Tue, 21 Jan 2025 10:32:10 -0500
X-MC-Unique: LlVyTW-lOumerIfm0kOuvw-1
X-Mimecast-MFC-AGG-ID: LlVyTW-lOumerIfm0kOuvw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361fc2b2d6so31912095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 07:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737473529; x=1738078329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1bXM7cxoKeUc47A9jFoEGfA5IU+Fj/3JFjY8VGeyAw=;
        b=lR+UOeVwoRhf97U7x4OAviWcFXDYCg7V/v24YqH89yFBVt3MU9YFBQSxoEF+twhyfr
         mWd3ycaSLZBiI7vwekQLRdLxERo4hynbTcNnda58uU2xrWJMDIn5rLH90AeUcKGAX8x/
         jETNN+E1ZITgfyeJqpAvFgAJuStl4PqWic8CIWlDi1mIW5ZHG8SfmQSIFj88lWsMT6WI
         /S4GCkISkmRRQB4bclUzuh+HyN8d2nTKkWgNtoWEZ5G5vxLqZh0lK7BMz/tDzspsHR4t
         Y7rX9+14EDJ4PQbSOfrfd6a4vhDSXqAHFGccyIZeksFmAeyf/6TYOshkF2ksu9rvpHbC
         mW6A==
X-Forwarded-Encrypted: i=1; AJvYcCU5WR+UA6+m29RNoRXXQ7RlOafpZw9mXS+zU9QZCsF8qnBi3CxFRuujeZkPIxNjoGe5TZyOkGJGs3+ML9zsJedh@lists.infradead.org
X-Gm-Message-State: AOJu0YyI0v4xVnvzv3yXiWSd+b9E7cqBV08fb3+kJLhKRNawh4+8C7Xr
	D+j90fka+nyQi/pp+u8ZlrZgxBErTyf378drpSMrjqSmWmkTkjOmI7E8yM+fbKRv9ziwNhxg65w
	8BWlJUXXWWAUg/q4BqNhRotPkd/VFLHIGZSBfQs0X/jCu1M5aJ+DrLsMstEKduAo7isdYyo3Z
X-Gm-Gg: ASbGncs0rc+XAtpufCh7CvHqG0joj1aopglWiwtLBMJLle9RI9SnnkSxrcGe0Y+IR3R
	xdE88wGC6DyVFhD4wa+W3ydTRKYAileYDw6Ca+8viLZ+EtL5BRzypmWotHLL1z90C/GEpfIM/D6
	bXtImcDrTPsgP992uz/cdtDzUSV/WWha69WJqFAIsUgen/ZGhSGpQ3yzv4GDLWTbBPWano3dNP1
	pYMb/wntbuwB6836zsGRX7t+PRbAtY0JVSbxbnGaqEvEmt7+sdxp9hKHG4NM+/Z9oomlEelHSiL
	yX9EOHY62To0SF8hKt7xFArc69Dt1Y6ZQcSm
X-Received: by 2002:a05:600c:4ec8:b0:434:f219:6b28 with SMTP id 5b1f17b1804b1-43891435c37mr150781365e9.24.1737473529454;
        Tue, 21 Jan 2025 07:32:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpa1v3wcYhRCINZUP07hM1daVRU3AUjb2eugVysXBiuJ+u+dJE82WVNBEO//scuIHzku/G/w==
X-Received: by 2002:a05:600c:4ec8:b0:434:f219:6b28 with SMTP id 5b1f17b1804b1-43891435c37mr150781025e9.24.1737473529024;
        Tue, 21 Jan 2025 07:32:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32754f5sm13865800f8f.79.2025.01.21.07.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:32:08 -0800 (PST)
Message-ID: <c60288f0-a1ee-452e-a36f-f4194d05c975@redhat.com>
Date: Tue, 21 Jan 2025 16:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64/sve: Ensure SVE is trapped after guest exit
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org, catalin.marinas@arm.com, fweimer@redhat.com,
 jeremy.linton@arm.com, maz@kernel.org, oliver.upton@linux.dev,
 pbonzini@redhat.com, stable@vger.kernel.org, wilco.dijkstra@arm.com,
 will@kernel.org
References: <20250121100026.3974971-1-mark.rutland@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20250121100026.3974971-1-mark.rutland@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cKQksCMJEL1umstMbpyig7XfUAmAYCcNvVsCi49qKLw_1737473529
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_073214_312725_FFBCE779 
X-CRM114-Status: GOOD (  40.60  )
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

Hi Mark,

On 1/21/25 11:00 AM, Mark Rutland wrote:
> There is a period of time after returning from a KVM_RUN ioctl where
> userspace may use SVE without trapping, but the kernel can unexpectedly
> discard the live SVE state. Eric Auger has observed this causing QEMU
> crashes where SVE is used by memmove():
> 
>   https://issues.redhat.com/browse/RHEL-68997
> 
> The only state discarded is the user SVE state of the task which issued
> the KVM_RUN ioctl. Other tasks are unaffected, plain FPSIMD state is
> unaffected, and kernel state is unaffected.
> 
> This happens because fpsimd_kvm_prepare() incorrectly manipulates the
> FPSIMD/SVE state. When the vCPU is loaded, fpsimd_kvm_prepare()
> unconditionally clears TIF_SVE but does not reconfigure CPACR_EL1.ZEN to
> trap userspace SVE usage. If the vCPU does not use FPSIMD/SVE and hyp
> does not save the host's FPSIMD/SVE state, the kernel may return to
> userspace with TIF_SVE clear while SVE is still enabled in
> CPACR_EL1.ZEN. Subsequent userspace usage of SVE will not be trapped,
> and the next save of userspace FPSIMD/SVE state will only store the
> FPSIMD portion due to TIF_SVE being clear, discarding any SVE state.
> 
> The broken logic was originally introduced in commit:
> 
>   93ae6b01bafee8fa ("KVM: arm64: Discard any SVE state when entering KVM guests")
> 
> ... though at the time fp_user_discard() would reconfigure CPACR_EL1.ZEN
> to trap subsequent SVE usage, masking the issue until that logic was
> removed in commit:
> 
>   8c845e2731041f0f ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")
> 
> Avoid this issue by reconfiguring CPACR_EL1.ZEN when clearing
> TIF_SVE. At the same time, add a comment to explain why
> current->thread.fp_type must be set even though the FPSIMD state is not
> foreign. A similar issue exists when SME is enabled, and will require
> further rework. As SME currently depends on BROKEN, a BUILD_BUG() and
> comment are added for now, and this issue will need to be fixed properly
> in a follow-up patch.
> 
> Commit 93ae6b01bafee8fa also introduced an unintended ptrace ABI change.
> Unconditionally clearing TIF_SVE regardless of whether the state is
> foreign discards saved SVE state created by ptrace after syscall entry.
> Avoid this by only clearing TIF_SVE when the FPSIMD/SVE state is not
> foreign. When the state is foreign, KVM hyp code does not need to save
> any host state, and so this will not affect KVM.
> 
> There appear to be further issues with unintentional SVE state
> discarding, largely impacting ptrace and signal handling, which will
> need to be addressed in separate patches.
> 
> Reported-by: Eric Auger <eauger@redhat.com>
> Reported-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
> Cc: stable@vger.kernel.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Florian Weimer <fweimer@redhat.com>
> Cc: Jeremy Linton <jeremy.linton@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric

> ---
>  arch/arm64/kernel/fpsimd.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> I believe there are some other issues in this area, but I'm sending this
> out on its own because I beleive the other issues are more complex while
> this is self-contained, and people are actively hitting this case in
> production.
> 
> I intend to follow-up with fixes for the other cases I mention in the
> commit message, and for the SME case with the BUILD_BUG_ON().
> 
> Mark.
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 8c4c1a2186cc5..e4053a90ed240 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1711,8 +1711,24 @@ void fpsimd_kvm_prepare(void)
>  	 */
>  	get_cpu_fpsimd_context();
>  
> -	if (test_and_clear_thread_flag(TIF_SVE)) {
> -		sve_to_fpsimd(current);
> +	if (!test_thread_flag(TIF_FOREIGN_FPSTATE) &&
> +	    test_and_clear_thread_flag(TIF_SVE)) {
> +		sve_user_disable();
> +
> +		/*
> +		 * The KVM hyp code doesn't set fp_type when saving the host's
> +		 * FPSIMD state. Set fp_type here in case the hyp code saves
> +		 * the host state.
> +		 *
> +		 * If hyp code does not save the host state, then the host
> +		 * state remains live on the CPU and saved fp_type is
> +		 * irrelevant until it is overwritten by a later call to
> +		 * fpsimd_save_user_state().
> +		 *
> +		 * This is *NOT* sufficient when CONFIG_ARM64_SME=y, where
> +		 * fp_type can be FP_STATE_SVE regardless of TIF_SVE.
> +		 */
> +		BUILD_BUG_ON(IS_ENABLED(CONFIG_ARM64_SME));
>  		current->thread.fp_type = FP_STATE_FPSIMD;
>  	}
>  


