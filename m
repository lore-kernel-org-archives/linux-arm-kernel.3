Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09714C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0j3HfohIwJISbsXU0pbsmUuYrw+P0a5WGZgVgQVxGg=; b=OFEARo1bvEiOLroxXvYPLIYTye
	tjiPhXjdvvtvBDv54P3e7z6dXovlMv6Zmycl0UPU3MlqrMNud9QzIeyp10dIHFhlXxbkpJnRlYvKI
	mE1Nc/cnFHlWeE6V9CF0HTkqiixL0MBSyu4m4EPf5Py1cNzGTHL6fQV10FJcFfM3ieZOwjK8uNBhm
	JccVMhnpqcuMhvpKNS/1uWw1YQzau1Dbm9+XSYYqb03JU/esp6mddYCCTVZrJ9TBth8sXE3hdWCEu
	whoSplhD5eUhNHBalFWzSHHGrPV58Qhwqh8bRWN1HkRI7b/trajeHGqXH6rtySJuUdYlXNt/UqLwa
	v0rQnj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBdQ-00000007JVZ-28tE;
	Wed, 12 Feb 2025 12:14:32 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiB7f-00000007DiJ-2QWj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:41:44 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7d583d2afso137543366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739360502; x=1739965302; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w0j3HfohIwJISbsXU0pbsmUuYrw+P0a5WGZgVgQVxGg=;
        b=b+GmcnUfD0lFmSG5rKwEi4xxboWcbvbL8sclPrbVqg4hmtNJzvqeAoPU166lzLQiKn
         nvRl/ZEhPI8sG1+nie/PM6+pzQgYwGEwaBEJdDs1okoNtvaI7SwdoQe4kDaz29nxhEFn
         yOJuh7Kb7C/8N1o/f1BlWxA8GiQCR5n3biDhshONDsGS3GvSgYOnuQfi0RT5ch1esXkN
         X5LOBzcqUt4lyLx8M9Do81/L6sgnnFJRaSd9aBgAKnw20MxaUcMyxSULc6x2uHp7j6rF
         IsJVtxt5BGlPO/kITYPHcXpzXSdh8yS6mqAs93jnXD9d4KhbgGY6s8JPolpno9wVlu31
         xS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739360502; x=1739965302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0j3HfohIwJISbsXU0pbsmUuYrw+P0a5WGZgVgQVxGg=;
        b=gOlwMTJHxF4iXKqueITyNrjzbxACoXgxKciCJA72XrVqBa8hG9eqyjl8aqvWohfbzU
         YlrXfK4+uGmZIJ811FU4/TmfoTOkGbp7yc8LEKfTg+bAwZtabSPEcReIV7dhmPutrPtZ
         sZpPpJx51bTaxvPDvGhACjoddJoC+0j4L+NeaaTDwW+ft3qMg1kVCGO/4zok5j0i2wCB
         yE66Q4rd0X9dpIIkjv0U+ZrDoEmffXxY2xkBWk867q0yYUoPR6q8ZijI5kZt+h3pnNzK
         7qXW5rBeHDHdZKrrbvLqQxhoTM1RV57gznnR1D/4BXXsSfhxxPp0ueF+adGsYned7u14
         4zFw==
X-Forwarded-Encrypted: i=1; AJvYcCWjpovTQE4LbSEjw/MH6CQsu8jD6cjF3DMbHRL3+WTR/glWwD2owiXblvSHM8viG7qUTTvCfHpkcjuQOOe/CjCs@lists.infradead.org
X-Gm-Message-State: AOJu0YzdLANKpIqmRrOuUv//N/rD83eEIW19N+yuIxfYNdUI3y0DSqr/
	mIJAgLnMb31MQMVwIb6GqFULX/MeCYOgqNOWsExuPzpgkkSc8w4eJyKK8gMc83E=
X-Gm-Gg: ASbGncv4j26jWQ8b8vwLXfp+mG/ywXY5qWnKF5RoKjM+NJtY+FXqtWFDyoR5nhUBZRg
	C3Ovpfx1Z49wq1i45lOz52BLUJnyi6E8v36rDSXkgKQWue9n30Qx97del3WqxdKBL+xfLey3Ukw
	+I70k59soiDQsxxi37dbmrL606wL9qu9F9C8GZxA3KwAE/E+eFFc4wW8+LbXGF4cMarIKT2y6ll
	4pz2Uk5fL6ZXNoiE6gHKbgMFFaCUop3onMbXyZf50RnBVAyqaMR5kZ/uATEDtREN7bZOzi2TlrC
	3SXpe+uqxSEaS1qrTHGq
X-Google-Smtp-Source: AGHT+IGjOAjmf6XjmHjeaqxJH3+fWyGiM1rw3hi7aac7PC39lxHRaWXOjo/vo6+0foG0vbJvgDt8bQ==
X-Received: by 2002:a17:907:724c:b0:ab3:992d:d98d with SMTP id a640c23a62f3a-ab7dab331c9mr726269366b.0.1739360501945;
        Wed, 12 Feb 2025 03:41:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab772f893e9sm1267296966b.65.2025.02.12.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:41:41 -0800 (PST)
Date: Wed, 12 Feb 2025 14:41:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, kvmarm@lists.linux.dev,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	virtualization@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: kvm: nVHE hyp panic at: __kvm_nvhe_kvm_hyp_handle_sysre
Message-ID: <3902208d-8814-46fe-ba98-3db833b9a886@stanley.mountain>
References: <CA+G9fYt6Cuu6=OO9w80yhJbZB77Q0qf7nzYdvjbgDbgAw6t1jw@mail.gmail.com>
 <8634gku30g.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8634gku30g.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_034143_615079_9799253B 
X-CRM114-Status: GOOD (  14.53  )
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

On Tue, Feb 11, 2025 at 11:36:31AM +0000, Marc Zyngier wrote:
> For the crash at hand, which clearly shows nVHE, can you report
> whether the following hack fixes it for you?
> 
> 	M.

No luck, I'm afraid.  It still crashes the same way.

https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/anders/tests/2steTT4f2J8ZJjc3jNJFMuow9Cb

Click on "Logs: html" for the dmesg.

regards,
dan carpenter

> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index f838a45665f26..cb57420a07de2 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -556,7 +556,7 @@ static bool kvm_handle_cntxct(struct kvm_vcpu *vcpu)
>  		return false;
>  	}
>  
> -	val = compute_counter_value(ctxt);
> +	val = compute_counter_value(kern_hyp_va(ctxt));
>  
>  	vcpu_set_reg(vcpu, kvm_vcpu_sys_get_rt(vcpu), val);
>  	__kvm_skip_instr(vcpu);
> 
> -- 
> Without deviation from the norm, progress is not possible.

