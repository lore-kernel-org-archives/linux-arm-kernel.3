Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5168FC47BC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xT86fGyU8vR02LLDSOIv3YTUgVfPlh7wnV/Q4AOSXA=; b=kVhitP8KkUV1rP63cGIvCxtz9k
	ByA9H5v7gNyQHPbploed49Jo6ZnGXmhi9iwe8hwO0NwgS7uXCqkVmBgtTv8JrcCZid4paz0ABGNeH
	1iduMU66jViuWQaZuEeFzG/oAIwm86CUTNIu60unrosQTIEqUdmzJXA9ejwGeSKNLpF+VPFdGutlr
	S3gRfaKspkJQfsai2+aT90nHFoe2bTuZoHsfKnUWTQK7x/0VbYAUcqf+IUYq3hQDSZChThK9mV4XZ
	xHU2u6gvQqbeEzHMoj2sEDlyd+/gqHrWdwujMttFtO/JY1ZfHRo1sFA6UmS4sXuecyZvPhvYfvJa9
	BCMFUakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1y4-0000000CZy2-17EE;
	Tue, 06 Jan 2026 07:59:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1y1-0000000CZxd-2zBJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 07:59:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so5468685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 23:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767686339; x=1768291139; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xT86fGyU8vR02LLDSOIv3YTUgVfPlh7wnV/Q4AOSXA=;
        b=DK8p6TzzM2SAySDY/ie+w/RCWN83swCFa6tNJk28JLja//uqEIEx2BWZBTIIYovWBA
         Ufmnp15w6Py4rpemz4LvxWWbYjtJhIl4tDVIR9cJa0KDXyFVB3QpmqM4UaNqgNqgQG8l
         7O16xw1Qlb5NjDVGVoc3O8Mr6Z/e5cHPX/lCmfto7kfChEW7ouM6zpsdTcOeT3hmHPrp
         Q/8ROapOwZ9OQGdmUZ767Zs5NVfQN86J/UfTOmC5FOe15fB2oiBZK33KQXQ7sfGDBGUl
         OWjbYGK/dYxD4TF3fl/bi2dYcU4Ejr0U2LiYZLhQLhWXSAFoyM/pFS1asI4dXswj7k9z
         goUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686339; x=1768291139;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/xT86fGyU8vR02LLDSOIv3YTUgVfPlh7wnV/Q4AOSXA=;
        b=VNIehTQxRSzC+/Vu8HQsjx4+ZZ7cd/OtntZBicWoZpPVmMk5BrKknDRJau32eq7QXl
         mcIQaIjnF/OKh0DzELBaHzUPEipBbNmG2hHyaG/FQDYOxrv323VIFSUQvPB2dwKaKWsH
         WccxQXcSY4LYf2MPbuHGz+rP0SlSvIA6lNjJJjn8al/kyHzirsHvwu3d0fX5GKfffhYt
         VuVifuoqqADqKaGPpZm4vi83Xb8f274VvOH4Wldu32DOZFrAeNL7KztmYf0OYnp1+o1M
         qQr7MhaNl8ua19dkjUfq9BmwpdgislBbfQ1JiieCNKFFsjHkGpUUr1x0lm/ktGkINk0W
         r6wA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3UI3H8UMkTcbYqH35iA6y5rrdDYEdhaQwZ8M3shz125gZlSpRUsWXmPmjmef8Hk5CrLDcA2sbbfIQG24xpgT@lists.infradead.org
X-Gm-Message-State: AOJu0YzeeiDEgP6D4D5sxaNe/2VKqQGTU+QzjtXu3UThgf7KalXsmuAM
	4Cu67b1U5UGCYbphasoegzn2hey+5y7RUrovATzztl1UHfHMmo9nsPLjxyNAfK085rM=
X-Gm-Gg: AY/fxX7wZ3uCghVvTaOz6pywwF/qHe3p0KTsZsuR04xIXNUxfTrAx/97HwSZRT24Vvt
	x/PXSfIu+pRJUr/UE2FLiYOe7l8Ajk6x4jPW2g26NEEaCBT2cXXUCBiiWMAveYXBRYEFXItMT7D
	3UWcSCTkKwbABd3Oik18Ly6PUKpaOX6sbhwJeLzY5uNwqd1DrB+u4wF6YDfRTNiFajgRZk/LdVu
	MO2VPnLzTsSUCEl4WVmEiJhRPMLJbI3b1RzJH/IRsW3g1udXhsSWAM1Mq5ih0+qMYzw+23B9X6b
	uqodpiGrNfIr3LkzXzq/ZtVYaG465ZZQn/2F/KW0NzKlgcuCg1hu+Fgpg88OqWpK8R9wTYtRtba
	+iqFcZS3qWB9K8amngjEdRA4z29L7klV/WKi/Gx0o/7lUEpMd2lY9S5ghareGVg8t/ZniCEds+d
	ZSzAOFGvaK/yPSSNJfWmKV76uV7gRjl/CeE5psjBKU4A==
X-Google-Smtp-Source: AGHT+IHBJ6fsCXy9NO/d28W93MTm63DgHduveSL/TEkdamQz+BL02b7OzR0NOgGoMHSHrSsYeON5Iw==
X-Received: by 2002:a05:600c:444d:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-47d7f0671fdmr23249935e9.1.1767686339113;
        Mon, 05 Jan 2026 23:58:59 -0800 (PST)
Received: from r1chard (1-164-79-94.dynamic-ip.hinet.net. [1.164.79.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59da826sm1286179b3a.46.2026.01.05.23.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:58:58 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Tue, 6 Jan 2026 15:58:54 +0800
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>, linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, Mark.Rutland@arm.com
Subject: Re: [PATCH v1] arm64/efi: Don't fail check current_in_efi() if
 preemptible
Message-ID: <aVzAvqv8JnjrjJbF@r1chard>
References: <20260105135847.1585034-1-ben.horgan@arm.com>
 <aVvPIdREAdweYqZf@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVvPIdREAdweYqZf@e129823.arm.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_235901_770326_A6A3994E 
X-CRM114-Status: GOOD (  19.43  )
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

This change is good to me.
Reviewed-by: Richard Lyu <richard.lyu@suse.com>

On 2026/01/05 14:48, Yeoreum Yun wrote:
> LGTM. feel free to add:
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> > As EFI runtime services can now be run without disabling preemption remove
> > the check for non preemptible in current_in_efi(). Without this change,
> > firmware errors that were previously recovered from by
> > __efi_runtime_kernel_fixup_exception() will lead to a kernel oops.
> >
> > Fixes: a5baf582f4c0 ("arm64/efi: Call EFI runtime services without disabling preemption")
> > Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> > ---
> > On the partner platform I was testing on this issue caused the boot to fail.
> > ---
> >  arch/arm64/include/asm/efi.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
> > index aa91165ca140..e8a9783235cb 100644
> > --- a/arch/arm64/include/asm/efi.h
> > +++ b/arch/arm64/include/asm/efi.h
> > @@ -45,7 +45,7 @@ void arch_efi_call_virt_teardown(void);
> >   * switching to the EFI runtime stack.
> >   */
> >  #define current_in_efi()						\
> > -	(!preemptible() && efi_rt_stack_top != NULL &&			\
> > +	(efi_rt_stack_top != NULL &&					\
> >  	 on_task_stack(current, READ_ONCE(efi_rt_stack_top[-1]), 1))
> >
> >  #define ARCH_EFI_IRQ_FLAGS_MASK (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
> > --
> > 2.43.0
> >
> 
> --
> Sincerely,
> Yeoreum Yun
> 

