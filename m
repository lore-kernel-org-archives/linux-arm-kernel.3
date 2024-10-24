Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56823CE8E99
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCdtKyQctIBSL1se9ZBXozl/8Gw/YsUba47AyHThe0Y=; b=3jjcCzb3QeMp3E1xKBdVApH0Mu
	getQlDwUNemsQZ52fDZqbvnQANhoUcL7gsnjkuJVHnpIwJY9X+Rv7KlWDM2la5eNmVVw8nvUpBYeT
	WU9puS9JLETufL9kyE4ZVEd2CCYak7xx1O8KGnMQ0aZqoSOTKiOHM3X3Kg5qAWWaVvCERRFxYeKNf
	9CrkyhiwBWIELo604O790yFW+s86cDA1vfHU0XVeH+lRIeBQ3DzWaYywKNVpF9FC9JdAX1ssgkLW/
	dUAnNEEXbBdH0NrLc2OaR3MEVb3xhVyyF6pws+HatjYxLcZS6teB10l4YhWSHdSp7YS/wC4QxAadF
	l6S9CquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41AD-00000001C5j-26zj;
	Thu, 24 Oct 2024 16:58:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t417C-00000001BdA-09lE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:55:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso3745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729788912; x=1730393712; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCdtKyQctIBSL1se9ZBXozl/8Gw/YsUba47AyHThe0Y=;
        b=Sy1rT+Sx0FUDo80Xtk+ShM+k5KnOwTTHpmfDPI6pewI76SEmMmTQL3XfJBUAkT1WLX
         wR3gtxuAqlBmNbPUAyi1VHSjj0JNeQMwK7BRre7XIr+VSbXLYxj1swV2Wh9Od8hELHTC
         AuOMMC8AjviGu+8UCihmHZCylaz1eVDlcwzH5wzBM5BE7KQoGAs90814JjSB+oqPhhSJ
         LJq6DsMmCZrN1kiOmR22wVBKRsr/9QdzDxaWX69th3DBtZ499uN3A28MBH5Z0phs97Cc
         3JHeHBVyHhpAD0hKu9FLD8wEOOuGK3dEptC441beJiP1XqysNXi+yngbzB5ZVCMtyPuF
         OJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729788912; x=1730393712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCdtKyQctIBSL1se9ZBXozl/8Gw/YsUba47AyHThe0Y=;
        b=jG+WlJNrPJH5qNnDnbLxm+bAHJStU5bE9keem8c8erlUERqFswnDQ+cPqfzieksE/9
         FZvwvaUXwESCSw49B8Fq9fEQyLYDPBFzUle5MrkBAZkyNy9VlrL88Kzie/jSh/zGvmGo
         SBsWglg9741puegj4Sx8oAylM3qkQV06SiyTcKQGnxdRmMVJiSAUlETnFENCl21UXWso
         aF3Cv4Zfc9EFwgM1GQ7w0aIwaBVKlxlY0R/jSsr4UeLXauei+VonhXYlkZYZxzeQVilh
         bRuMtZRZzDqVuZKy655X2Q/q2mHCsR2drpQcGJTbo2d4Z+yvjD90xcBKn8eL6g1HMur1
         tZjw==
X-Forwarded-Encrypted: i=1; AJvYcCUDB8vZPQ//AgR1BZf0lB9YNxisMfDKkzjuym4vevJb+JkMVIVJ0Po4KcatmkDr6H/6zk32/dHKKkwhyQLB9unZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwZJERruc+OvVTomQN5h02ENVo6nxR+3JpcAqrPj7J7OQB0DX8k
	4eWI9Lm+dnIQ7dXBIGSUu35197vzJ9lwiKJOOOZgRXnu4HN7ldm0bZN2dR+UIA==
X-Google-Smtp-Source: AGHT+IHcN7HDbw2An/mqTEn7MtXy6cHrcCtVnXaHLCdh4ENrobYlDmJPj++dv/iSVSPdnUCb+iLsTg==
X-Received: by 2002:a05:600c:1d82:b0:42b:a8fc:3937 with SMTP id 5b1f17b1804b1-4318a56d62dmr5544205e9.4.1729788912295;
        Thu, 24 Oct 2024 09:55:12 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bd69e0sm52243065e9.3.2024.10.24.09.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 09:55:11 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:55:08 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, corbet@lwn.net,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] Documentation: Update the behaviour of "kvm-arm.mode"
Message-ID: <Zxp77Es8BCnHcAHk@google.com>
References: <20241024160614.1894599-1-smostafa@google.com>
 <86o73930ze.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86o73930ze.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_095514_105701_F2D2468B 
X-CRM114-Status: GOOD (  33.53  )
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

On Thu, Oct 24, 2024 at 05:43:49PM +0100, Marc Zyngier wrote:
> Hi Mostafa,
> 
> On Thu, 24 Oct 2024 17:06:14 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
> > VHE support") modified the behaviour of "kvm-arm.mode=protected" without
> > the updating the kernel parameters doc.
> > 
> > Update it to match the current implementation.
> > 
> > Also, update required architecture version for nested virtualization as
> > suggested by Marc.
> > 
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > 
> > ---
> > v2: Update nested value also
> 
> Thanks for that. However...
> 
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 1518343bbe22..d5b771e5cb5b 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -2740,12 +2740,16 @@
> >  			nvhe: Standard nVHE-based mode, without support for
> >  			      protected guests.
> >  
> > -			protected: nVHE-based mode with support for guests whose
> > +			protected: hVHE-based mode with support for guests whose
> >  				   state is kept private from the host.
> > +				   In case hVHE is not supported in hardware, it will
> > +				   boot with protected nVHE.
> > +				   nVHE protected mode can still be forced on VHE systems
> > +				   using "kvm_arm.mode=protected arm64_sw.hvhe=0 id_aa64mmfr1.vh=0"
> 
> 
> I probably didn't explain myself very well. I would like to avoid
> mentioning hVHE at all, because this is pretty confusing (and really
> an implementation detail). Instead, we can talk about VHE/nVHE, which
> are real architectural features.

Agh, my bad, it makes more sense to talk in terms or architecture.

> 
> Also, I just realised that we can use your command-line magic for
> downgrading from VHE to nVHE in all cases, so I'd be suggesting
> something like this:
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 1518343bbe223..2bb19f1331fed 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2740,8 +2740,9 @@
>  			nvhe: Standard nVHE-based mode, without support for
>  			      protected guests.
>  
> -			protected: nVHE-based mode with support for guests whose
> -				   state is kept private from the host.
> +			protected: Mode with support for guests whose state is
> +				   kept private from the host, using VHE or
> +				   nVHE depending on HW support.
>  
>  			nested: VHE-based mode with support for nested
>  				virtualization. Requires at least ARMv8.3
> @@ -2749,8 +2750,11 @@
>  
>  			Defaults to VHE/nVHE based on hardware support. Setting
>  			mode to "protected" will disable kexec and hibernation
> -			for the host. "nested" is experimental and should be
> -			used with extreme caution.
> +			for the host. To force nVHE on VHE hardware, add
> +			"arm64_sw.hvhe=0 id_aa64mmfr1.vh=0" to the
> +			command-line.
> +			"nested" is experimental and should be used with
> +			extreme caution.
>  
>  	kvm-arm.vgic_v3_group0_trap=
>  			[KVM,ARM,EARLY] Trap guest accesses to GICv3 group-0
> 
> 
> >
> >  			nested: VHE-based mode with support for nested
> > -				virtualization. Requires at least ARMv8.3
> > -				hardware.
> > +				virtualization. Requires at least ARMv8.4
> > +				hardware (with FEAT_NV2).
> 
> That part looks good!
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks,
Mostafa

