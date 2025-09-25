Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD55CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4A7uHFyGsqg+/5gcAVyLzJeZKPdXHFpebcPVRaYpAr0=; b=JZiV2cAXSQm1SSIi/kkjE3PWoL
	hnMPchYYEiFwYRmRbSzr1r+s79XXgJFFsRimsq11e4kYN4TlbxMyv9dW/+Jr0caqbO16RAf0fGYyQ
	uxrDiHGgiRltbjFIwJDzJrbHBBKLkJv+3xqnw85zPLEci/VrKXnDqL4ZgzVBMeeZX757ajc670G17
	XOv94oBjVlMxi9HDKvskPCUyzhFLc3EKZ7sTkySZFQ6s7NH7hgm4OHhW+K59C+cpIySWDHlqbGkUH
	2v5CxNHb47mIveIujk/hXlFrV6lMeAd+ewnEKwrELjDwq3cKgPQzI6ymPdUvsce88obvCAcNJEhxl
	eHRAF3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1foF-00000006Red-1dmE;
	Thu, 25 Sep 2025 06:50:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1foD-00000006RdE-0i8d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 06:50:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e1cc6299cso5064275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758783027; x=1759387827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4A7uHFyGsqg+/5gcAVyLzJeZKPdXHFpebcPVRaYpAr0=;
        b=l7TerzqFP75vRG/FBUpcmvNsmzQkFHtTDHC+uY05i0xvgGAPVxx/X84+GAxGq9YG1i
         +6wSt+jrCmKgAWsgLPNmuMx/h7FCF1uC7+N5R5jZz2CgaJdiDeYPxfqGv1loGaSHGqN0
         V2tLO9d34JUz2f5gB7srlvAqljVXKIIfVSIi9WbN42o0sfix9fYl3pwr9LqPRkwecMnC
         MlCACw8Q5Nton5POQ3dcDLSQnq1vkALVcRWCqECJ+SiP5dxmTmY93qs0tnWOVDXW/KRe
         BS2f2dsEUf5wbsxulGQuY4C8VT9tYM3J31WW5Bf9BCIxm+tMmeRUBomiMX0JYPLSB33f
         y3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783027; x=1759387827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4A7uHFyGsqg+/5gcAVyLzJeZKPdXHFpebcPVRaYpAr0=;
        b=DU0EIq1B0AvkNP7oqs9Ay3reNjzf0sEFQ+DcGCLKlMHkrQPhUebhRTZNOnKH6EqC9G
         Evl7KLiL8Se4UaHOZ0b/Zbu9d5ODrUxcXQhYzna9ZksRH9Lh4cxyi7wOPMhh2U0lVNwG
         M3k+jem1bnVOU7HWEesjhzgPDUc9nfSJEV/OfBKmKCRW427eAoDlgYzPAPK5YSPgj44T
         1POa5FpazopXZRdFx5WzQqAxRE+NRlCIFfHDNhWi+vrFdkpxMXDjIt0ucqli/w4DQSUJ
         VNPp4he0QxQjATbq7DTzmK4ph3KO5s7xHAp6/7SIE2u4JejI2b7j8J5ZzCth2/bpbVY3
         7Whw==
X-Forwarded-Encrypted: i=1; AJvYcCWQIBKZ0oFHt/GQDK9piW+gJ/L3dn29knQEsp+tIC+iV3kRk3lgQrXc//5qFVIoIDtaBC8gdRMnhI85QvPxKa1h@lists.infradead.org
X-Gm-Message-State: AOJu0YxpZBzR0Z/2U3M8D7xKhFoiWv82AacUnrQfZfeFREYyturqrJkj
	zARuWYwXzWKg+g+HxbFTpdJy8QpUnN6yzs+//NAUHy3N9JEKf2X0rQ/P
X-Gm-Gg: ASbGncurwZci21ZWdgyWFPQ6bGRTKprTUMx8WoU+bH0IuS1V0ZDBp6G9fhCPh4JJnMy
	CpSkvQlHFATqxU8ZSmwX8Fa/X17Q3ipSOhfk6TlLsnr5B5YIPKw5qnJRJ2z52LhCi1hRcIodM8d
	iZs0V0Awv9ti3M2lrW2VF+wCpaylX89Ng1tZ9z+Aw5eW7rQbDRcprWHfD7gEcxkMOEFjaHHva0d
	y/Ga1uQSJiwHKtDEazfUVE8E8pa9zlR6yKS7MaNu9Ybrk91U/25zPOt5R8PrWMu0Xe1CfeCYm9x
	5BVjJz9MmmxnFIwOK8YKLD/lOF6WOfE/6+WUyZH+A9y3SSjlyJbqfAWVE8ln/HUbDm8oGMiU
X-Google-Smtp-Source: AGHT+IFDrBvdqgW3dfAsa53PUDyLwpuKBZY/PKiwkfqmYxUGGh4GPPrCN0aoqOBwEKILDjVmZ7uA8g==
X-Received: by 2002:a05:600c:35ca:b0:458:a7b5:9f6c with SMTP id 5b1f17b1804b1-46e329ab712mr24367705e9.11.1758783026884;
        Wed, 24 Sep 2025 23:50:26 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::31e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bf6ecbsm20412955e9.22.2025.09.24.23.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:50:26 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 25 Sep 2025 08:50:24 +0200
To: Feng Yang <yangfeng59949@163.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com,
	catalin.marinas@arm.com, will@kernel.org, revest@chromium.org,
	alexei.starovoitov@gmail.com, olsajiri@gmail.com, andrii@kernel.org,
	ast@kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH] tracing: Fix the bug where bpf_get_stackid returns
 -EFAULT on the ARM64
Message-ID: <aNTmMGC3iYoAlfUU@krava>
References: <20250925020822.119302-1-yangfeng59949@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925020822.119302-1-yangfeng59949@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_235029_230460_56E21A67 
X-CRM114-Status: GOOD (  22.43  )
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

On Thu, Sep 25, 2025 at 10:08:22AM +0800, Feng Yang wrote:
> From: Feng Yang <yangfeng@kylinos.cn>
> 
> When using bpf_program__attach_kprobe_multi_opts on ARM64 to hook a BPF program
> that contains the bpf_get_stackid function, the BPF program fails
> to obtain the stack trace and returns -EFAULT.
> 
> This is because ftrace_partial_regs omits the configuration of the pstate register,
> leaving pstate at the default value of 0. When get_perf_callchain executes,
> it uses user_mode(regs) to determine whether it is in kernel mode.
> This leads to a misjudgment that the code is in user mode,
> so perf_callchain_kernel is not executed and the function returns directly.
> As a result, trace->nr becomes 0, and finally -EFAULT is returned.
> 
> Therefore, the assignment of the pstate register is added here.
> 
> Fixes: b9b55c8912ce ("tracing: Add ftrace_partial_regs() for converting ftrace_regs to pt_regs")
> Closes: https://lore.kernel.org/bpf/20250919071902.554223-1-yangfeng59949@163.com/
> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>

Tested-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka

> ---
>  arch/arm64/include/asm/ftrace.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> index bfe3ce9df197..ba7cf7fec5e9 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -153,6 +153,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
>  	regs->pc = afregs->pc;
>  	regs->regs[29] = afregs->fp;
>  	regs->regs[30] = afregs->lr;
> +	regs->pstate = PSR_MODE_EL1h;
>  	return regs;
>  }
>  
> -- 
> 2.25.1
> 

