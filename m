Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28EEC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7HDHtV9GJMKJoI+hQUJREBqkbUAnxxzKnn5VFH1x3c=; b=Mf8oAkuef5TYk5HSqnKTesQzho
	yzpYyrIk4jdE/EQCQ86EdFmgaNiVeO+r1ctm5TH0A5OGp6tfjmn3xmbqc1Zs7WhwiATvENOA8XxZJ
	/mwjjUgS+3cp6buH1D9WdhZbg7JCRygPtLEtLY67bOx6xFzly5nxvo9+SDW/THg3hIJ/kYffgiV0H
	hx7A6mluEEYLuGVrJYtF1w7ErCpthJ+F6XGOf/ej44eMqxNgIuew1k1BGodxYJxXRhZ2LJVhCnBQ3
	j8kppqg7hAUWdowAxcy/iBJN+yOI92SM1jppCdwmU6OKqNqPK2eQkh/TGgDU+D1I9883nhayOBL4b
	cz61Qiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvcA-0000000AypI-2YCv;
	Tue, 27 May 2025 14:49:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJva0-0000000AyQU-40nk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 14:47:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4c9024117so2687943f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748357219; x=1748962019; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+7HDHtV9GJMKJoI+hQUJREBqkbUAnxxzKnn5VFH1x3c=;
        b=TECS7MM/GpbG+8poEyfbqSPmJFFjFCWYC346PROFxi6cbJ7eJ6HYvB34uD/YqVqlg+
         v33ArzDRMUErow0Mvm0/aMV720hQMSYaHrN+0pf/132KsR+bOSr5lWgdK8Ny+3IaREkX
         fMRBRt4Z7mRRK7bcQAD+d/e03YBMQEWLECGwoI44tb1eAuDxGSUnlPKfyRswoBPf69oc
         QJg2k6QHkZkJG4XFycIkMOCkkBDdHcT1Z+qa1NCEAVsSnv7EA8Vtk6UmBvBwmx5B80yU
         e64um2txiDzdmASyNxbPZottIIk1kSUlk6xYaHzOm/OaeQb7vAF5GD9jP1q9upfmAR8U
         j4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748357219; x=1748962019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7HDHtV9GJMKJoI+hQUJREBqkbUAnxxzKnn5VFH1x3c=;
        b=bhY2y2l6ScJoYpaf7ZU/qrAdZ+15AW1AvtpYjXp6HM7dUrGo7LX8BjJ/gejV0c2Tf/
         Lu8qqWB1A7psPiFycNFt+1Cua8GmB9vA5dftdPTQ8BNED2+xFFv2iiAaeT3TeVFJ3gYa
         aggR9sqKqHfmrAe8eolUI9NuuMHi4mkswZ4amd1eUC63w1bbKu7Vx8vhX1oYQeO5M613
         bngOR5Br5MQhw6OsEiLO7bmsbDJ8UMuugLKiy9jbOsf12JafQbzc8cYjdsQkD/6sJmrW
         voFxEtGiXna3GdG4g0tOgUrAhKxuhehFQGUMhke5tjeUAe3DzYyK7eflC+k9oPR+yL+3
         VNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSFSPkFOenm9oOzMG4uy30NnH7OwBl7IB6Klq5bsmRM09foTMPDC48PfGj3d9fonXaQPw2nUCHaydySMAwH+hr@lists.infradead.org
X-Gm-Message-State: AOJu0YxDqjl81EZKIf4eKsGAxDNbfxVK45+LfvgKT/XxyNbMkt1L4S6p
	G59nn0QPXZ41zKzP6TsEzkLFMFHUCf6Hrfe34tnTnFYmGtqtx47LFC1Z1lA19AGoKjI=
X-Gm-Gg: ASbGncupnu+IMKs+wFC1TH+Yl6Ak2kMCMRpUT903HFXQ0T8JIYKWI+oiM7JeT/bwZy9
	v1lGZ7mlvYoTkDQmH5ZAh0s2i5wkJuIeCuGLg6JCZaKwd2b/495yrw3z/7EqKtpMDiMOPeE3A+H
	II8d8ucHEFXtArh7iBvo5yDwnXLfCOogDlkxACZYDH4I0WMSGAkZTCUPkk46ARtyOEVLOvug0Pr
	XwVvc7B3mTdTcKX3jOORsdGRRcrpCutoji2v93Y4lHcyTPu2a26w4e7jR9TtwM/JpuZsFJLIYTR
	NCZxRNZUHxLO3FHGXcYmokQS6y7CHvjY6zD2orTs4uWfeqq+bJRx8yObVscdMw==
X-Google-Smtp-Source: AGHT+IH9rVBPyPZ2QD6bs1zmU6dNDHxpXwVBL+LkBhYI6uyPT74PmbS5+6ZQOEHAkczC1XbfLMJQEw==
X-Received: by 2002:a05:6000:1a8e:b0:3a3:7ba5:9a68 with SMTP id ffacd0b85a97d-3a4e5ebba5fmr781465f8f.18.1748357218605;
        Tue, 27 May 2025 07:46:58 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d3332c01sm8385493f8f.92.2025.05.27.07.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:46:58 -0700 (PDT)
Date: Tue, 27 May 2025 16:46:56 +0200
From: Petr Mladek <pmladek@suse.com>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: Re: [PATCH v4 1/2] livepatch, x86/module: Generalize late module
 relocation locking.
Message-ID: <aDXQYMcLle2E_b2d@pathway.suse.cz>
References: <20250522205205.3408764-1-dylanbhatch@google.com>
 <20250522205205.3408764-2-dylanbhatch@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522205205.3408764-2-dylanbhatch@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_074700_997275_8321A452 
X-CRM114-Status: GOOD (  23.71  )
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

On Thu 2025-05-22 20:52:04, Dylan Hatch wrote:
> Late module relocations are an issue on any arch that supports
> livepatch, so move the text_mutex locking to the livepatch core code.
> 
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Acked-by: Song Liu <song@kernel.org>
> ---
>  arch/x86/kernel/module.c |  8 ++------
>  kernel/livepatch/core.c  | 18 +++++++++++++-----
>  2 files changed, 15 insertions(+), 11 deletions(-)
> 
> --- a/arch/x86/kernel/module.c
> +++ b/arch/x86/kernel/module.c
> @@ -197,18 +197,14 @@ static int write_relocate_add(Elf64_Shdr *sechdrs,
>  	bool early = me->state == MODULE_STATE_UNFORMED;
>  	void *(*write)(void *, const void *, size_t) = memcpy;
>  
> -	if (!early) {
> +	if (!early)
>  		write = text_poke;
> -		mutex_lock(&text_mutex);
> -	}
>  
>  	ret = __write_relocate_add(sechdrs, strtab, symindex, relsec, me,
>  				   write, apply);
>  
> -	if (!early) {
> +	if (!early)
>  		text_poke_sync();
> -		mutex_unlock(&text_mutex);
> -	}
>  
>  	return ret;
>  }
> diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> index 0e73fac55f8eb..9968441f73510 100644
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -319,12 +320,19 @@ static int klp_write_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
>  					  sec, sec_objname);
>  		if (ret)
>  			return ret;
> -
> -		return apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
>  	}
>  
> -	clear_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
> -	return 0;
> +	if (!early)
> +		mutex_lock(&text_mutex);

I understand why you do this but it opens some questions.

As this patch suggests, the "text_mutex" has been used to
sychronize apply_relocate_add() only on x86_64 so far.

s390x seems to rely on "s390_kernel_write_lock" taken by:

  + apply_relocate_add()
    + s390_kernel_write()
      + __s390_kernel_write()

And powerpc seems to rely on "pte" locking taken by

  + apply_relocate_add()
    + patch_instruction()
      + patch_mem()
	+ __do_patch_mem_mm()
	  + get_locked_pte()

I see two possibilities:

  1. Either this change makes a false feeling that "text_mutex"
     sychronizes apply_relocate_add() on all architextures.

     This does not seems to be the case on, for example, s390
     and powerpc.

     => The code is misleading and could lead to troubles.


   2. Or it actually provides some sychronization on all
      architectures, for example, against kprobe code.

      In this case, it might actually fix an existing race.
      It should be described in the commit message
      and nominated for backporting to stable.


I am sorry if this has already been discussed. But I have been
in Cc only for v3 and v4. And there is no changelog in
the cover letter.

> +
> +	if (apply)
> +		ret = apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
> +	else
> +		clear_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
> +
> +	if (!early)
> +		mutex_unlock(&text_mutex);
> +	return ret;
>  }

Best Regards,
Petr

