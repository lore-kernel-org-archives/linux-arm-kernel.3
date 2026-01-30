Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CB5E6BF1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zONlo3vJkBl5ujY/5KUHB9vDfxClAt4ztGCRSwPclIk=; b=qUST3aLlqvxk3dJo9UNeRXzDEl
	rNrSOw7mpy8hnGcoTEdKZErCeqOQhlSDgsEvJ4m5nhjgNnvKMvSgGNFNugpEUF+dsIXVkAqw8uHZ3
	CdEOR3YqKsUCLbQc2fdhUPyZ8IAzKG+fs/wOqIrAeNgFxfgB465RILf98TEEnZeoM+D0DWWU3haaK
	R3lxGROFWhKNPuRwNfBTF39wJ1/O+xhOkeRHaSR21EZI3jUp3xNAncb8CJKgTcUQnSuLJMCtvuxVx
	PhVHuqynfNQBdvP9QoRh0bJreneR+yzvdkvRmdwMSFQQhd81Zb7YfEkWELB84e5u8sf9PXkad+xNe
	sZ23l3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlq5Q-00000001cTM-1o1w;
	Fri, 30 Jan 2026 15:07:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlq5O-00000001cT1-1Xuu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 15:07:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so29451245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 07:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769785620; x=1770390420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zONlo3vJkBl5ujY/5KUHB9vDfxClAt4ztGCRSwPclIk=;
        b=S3Ba049kM1guhRGcmkfxzGiRBCXGO+4xiDZ1GqQJ0cmJb/eK2F/2onGWltQEsqc7iS
         kMVUAaUrTXN1xN+nuPvsDaQybOtqO1jg04/xDCCrK5pejjCLdMiyQDknwLvY1RGmCJPS
         KNL3+GD9Qa3CDTSxca6xfJsG6Fv7RHGBn3c32sSiClWAE3hMC+3dfz/4xVJqM+b+WPrG
         xxz6dgLLGpFMIzija46Ubktth9nD3aT9q2R8h8Gly396GkUfFwtoWNHFQLpg2huB4+BY
         0aYfJorud5aR2tffoWg/5kxImcJENSZSHKqb2o0PH8qKUKqz4JNHgtM/c5hYFbAF3CLB
         fafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785620; x=1770390420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zONlo3vJkBl5ujY/5KUHB9vDfxClAt4ztGCRSwPclIk=;
        b=jPaqPOmTIedQ4R0f581YdQHD0ll1amC1dWF2sT43W25AWgyHdgI3u4l7pJs0hS9dwQ
         LZNB7nFJ1c6LvFq5MPYQi+Jaufybf2cLWYXtHKT2WpX7bb2R6qVC+89fifZA3ODC/wGV
         vWTAY7pDJ81r6QCFooO+i0FNsF92DXzsGj5jVZwWWgjAU33isay85tITAQe/AA0FYw6V
         nCqAtZpGTW2j/1zQjd7P4qn4Nwwwj5ynT9mMsY4qSKXlPqZ7MRI4Y99yTrybiHF/1au8
         hx780cxKs5YL98gXbbZKMWMc7g+HQhLYWB42Du9UVk7I9i3P+d2ImdeOvE5CDChF4cTo
         RUTg==
X-Forwarded-Encrypted: i=1; AJvYcCU5NDttZy+Wh/v4jQGm/U0rThlYvpgr0VUqX+hxAtbzjg/jQ0RF/jme1JuEhUMG0JN/9/hY7ufuLQRKNNc7IfqG@lists.infradead.org
X-Gm-Message-State: AOJu0YzOt3DYMOkmRKPQE+ICs2tn8M5WaVWRp27pvi3aGjlqYHBKs38x
	RMrnPaorSOkP4CzkTCjjX2qmz0DlMGjT79gzuOjN5fat5bbBRNcSrZD3
X-Gm-Gg: AZuq6aITtPDWd3cqnzOPdyYK9Z9AyksQE8u1eAo0/zKIsWwnUwVO/z6STyAGTYf4wbp
	OFkwVTXex7qydrm/z4vzm6WWVgXHku4Zoy8Ed/gHtJN5j7Mee//YVnN3/0HPGmKT6GVLdH5OZwe
	foZTE/SCTYpEuSz48Z2IQDop6xjxmkG4+d7PqSPnnxVw0SXqv3QYUCXrksgSH4FbrdqsrZ0Y6YK
	BwCf3HydAMforsXAz1TerbXKHDZRuofPk+jF7vWrOObwdir1qDXYkev/KKp7WQ1mN7HSEDUE5xl
	7/L5G37fe1eGejZ3zIrhXlvAsdf6g0Vz/EhJeViZiXxKkp+NpJZTH9+/KKdAdOJNH47mtljl5zd
	vSvhEdulWr/khtubF7wzf/Br7ZCn9MyrxPvyEcr8sxkDJiAe30Z347XyULGLeQ4eUiNzFCqJmEW
	4p6+zRUuXa9UEbCrjQBErR6jdhbUxsKkS1byjmzsShHC85MSPe70O2
X-Received: by 2002:a05:600c:4443:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-482db4a0fb8mr41870345e9.30.1769785619829;
        Fri, 30 Jan 2026 07:06:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4762sm22183847f8f.6.2026.01.30.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:06:59 -0800 (PST)
Date: Fri, 30 Jan 2026 15:06:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v3 1/3] arm64: Fix non-atomic __READ_ONCE() with
 CONFIG_LTO=y
Message-ID: <20260130150658.617b65ad@pumpkin>
In-Reply-To: <20260130132951.2714396-2-elver@google.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-2-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_070702_452899_E723EF10 
X-CRM114-Status: GOOD (  22.32  )
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

On Fri, 30 Jan 2026 14:28:24 +0100
Marco Elver <elver@google.com> wrote:

> The implementation of __READ_ONCE() under CONFIG_LTO=y incorrectly
> qualified the fallback "once" access for types larger than 8 bytes,
> which are not atomic but should still happen "once" and suppress common
> compiler optimizations.
> 
> The cast `volatile typeof(__x)` applied the volatile qualifier to the
> pointer type itself rather than the pointee. This created a volatile
> pointer to a non-volatile type, which violated __READ_ONCE() semantics.
> 
> Fix this by casting to `volatile typeof(*__x) *`.
> 
> With a defconfig + LTO + debug options build, we see the following
> functions to be affected:
> 
> 	xen_manage_runstate_time (884 -> 944 bytes)
> 	xen_steal_clock (248 -> 340 bytes)
> 	  ^-- use __READ_ONCE() to load vcpu_runstate_info structs
> 
> Fixes: e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when CONFIG_LTO=y")
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>

I found this in some testing (on godbolt), so:

Tested-by: David Laight <david.laight.linux@gmail.com>

> ---
>  arch/arm64/include/asm/rwonce.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 78beceec10cd..fc0fb42b0b64 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -58,7 +58,7 @@
>  	default:							\
>  		atomic = 0;						\
>  	}								\
> -	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
> +	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
>  })
>  
>  #endif	/* !BUILD_VDSO */


