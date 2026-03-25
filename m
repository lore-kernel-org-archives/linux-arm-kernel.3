Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB24FEA83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VowsU1O7wvsqczMyYwJOpf4xbvaSsqz6CRDVGEe5gCQ=; b=A5IcNvv9Xj5Br0DKo0pzaUw+wW
	ZCppXxGHyQnhr/iI0RizUbckGtcU5xZES1pUJzxysdFAPJjYlKRQG7v1C3f8aVGnF2+FSbRhpIg0Z
	qRHCeU5dKKZ6KVbe9akchFq7J83XSiRV9DsDH5+4fq9d/3nbjVUqaR5aqEkvx1QIqZQSEtLRzI8x8
	hFmy1L4wL3qV6Cz2HTKVF+KPkOkhy34EQ3TX94YGA+7InGmssmkr3KiX8ojWbhkkF2FXoBQYY+YJj
	TZvIRGC6AEynpF3ZjBHvzpgNKPTluLqyH0Hgt4hIb1wSHC128VTWDX1QrubwF6vl9x+d2ZwYt6wwD
	FA/dzWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5L3I-0000000363x-33dJ;
	Wed, 25 Mar 2026 10:01:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5L3E-0000000363Z-3mY1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:01:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so51345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774432883; x=1775037683; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VowsU1O7wvsqczMyYwJOpf4xbvaSsqz6CRDVGEe5gCQ=;
        b=jURSqsOy1tNCU0Uk97SWygByKYudzN02OOnacNMwsrH+HIK3QQNodeYZ5D0csOac+V
         5J0u7RsOZvtHoYqhMl3u1VT4zu7sOIRBfBYYekMWRGE/lDPJViwTY12WyR6sCzr2ezYo
         IUVAd25nJIw2yTkEuytCBoqlC3XMNfch+sOS4c0I5JWU9sMVli69nl4n05Lu0PDNe9lx
         u0TldOqgfuU9oT7BHb72ZiBqPbZ5mLd6q5pdSxSNLAu/JXcnLLQA85jb2vauj4cJPvkv
         ZpgHdS27XWTMNXMyxOuRB2IXKmNwh16n/2xUqZ7k6QuzKG/XDrS6mqIez7msJmkoWFn/
         5Efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432883; x=1775037683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VowsU1O7wvsqczMyYwJOpf4xbvaSsqz6CRDVGEe5gCQ=;
        b=SiRsUnLgnZPWjH38dsVDnbsi1VVfqYjejusvzb03Qcd+G0IQbXzkuG94jdBOptLboo
         kqsJvzSlEKM4vZcxatPQbNMJAUk9/2+cR6O4dLqUolkcecftMZ+SZYcgGUMSlAUY8lTt
         zuB9KQim+kZiIl8qdeDF5dPni2A8abdahmKc+hEfu+qi5VEyxOq/UmxVeJJMM9mJ3UMJ
         TM4GGzYZOR1icXh4RjGa312Ew+Bw+IcgKgXhdR1SXf8jcEVLxd6v5NKR2kndOtwBDVsC
         hJPi7FT8/Tlm9WjYNH9Cx+9pwCgXfGBnCqFKJaNtFIIfxzQ2Buq7nTy8RJEFDfNDQNic
         GVxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcLRoipsxqRvDMpnW47EQgv89Y7/MEw3ZwEIX+4+tDzJp9eu5Q22mquPIEZuFP0CUxiqx63tnKqc1I27oppROZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs12RJKDcPUxzmTy+RtiQPebK5MFjfZ0KqT502y1wltZJsY0XM
	DOMX7Wrq+W/wJUB28DZBCcX1TSo2xvSdIX4oACpL7FW5mOW+MIRQLDJ5WbHNIZ2vQQ==
X-Gm-Gg: ATEYQzxhCLzzJSe7m0U23QTnqpfrbBW/lmkwxZds9lXruxnggfJp18IMdKSR0YCB/HR
	plhozxwMJT4LgH3JMFF7o/Gub7OFT5md/1x185uNsqzz70XdsJmBJwsb5XfjnE0LgUivc6Ib2tl
	wsssaKIfaFoycJm9qpof5vb859puxnYC8d8H8ge0hEACJ5VQn4FEaTJTyKnWQDf2EwMlwyvkq00
	VFqLStpLmaZHoNF0zPDfjDyIJE/1cXOMifnH+t7oD/EQY0WU69DjuEepP4U2PWvbMIWhle7cdDj
	OhT1RqumFRKgKjRNdPGAy+R6Qgd0igkyqan22r6YEUIiCecYPIpQGZBubp1EiA0zuvOCJ1huA8x
	tNy9rVv+2qesgobWXwkdBtfseoPLwOpu9PSW0Ojd3644RUd2BkbUpjobPVDswAUCzCHNYD1Npx+
	yIPV8K///HDn/uEmjCOH5zaIYX+W9dI6Z4eRkaiMcI+YYMVyqWuMYlmoRFSQJftlpv0Tk=
X-Received: by 2002:a05:600c:41c3:b0:480:4a7b:228 with SMTP id 5b1f17b1804b1-4871781da4cmr373535e9.1.1774432882386;
        Wed, 25 Mar 2026 03:01:22 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711702191sm115863335e9.5.2026.03.25.03.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:01:21 -0700 (PDT)
Date: Wed, 25 Mar 2026 10:01:15 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	vdonnefort@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Inject UNDEF when host is executing an smc
 with imm16 != 0
Message-ID: <acOya6ZtAAbyOUfj@google.com>
References: <20260324135728.3532400-1-sebastianene@google.com>
 <CA+EHjTycaE363WXD1f9ztYv9cTe9xeo-3FQ2Ep0aVO4592XGtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTycaE363WXD1f9ztYv9cTe9xeo-3FQ2Ep0aVO4592XGtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_030126_253303_12F3576D 
X-CRM114-Status: GOOD (  25.49  )
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

On Tue, Mar 24, 2026 at 03:13:51PM +0000, Fuad Tabba wrote:

Hi Fuad,

> Hi Seb,
> 
> On Tue, 24 Mar 2026 at 13:57, Sebastian Ene <sebastianene@google.com> wrote:
> >
> > The ARM Service Calling Convention (SMCCC) specifies that the function
> > identifier and parameters should be passed in registers, leaving the
> > 16-bit immediate field of the SMC instruction un-handled.
> > Currently, our pKVM handler ignores the immediate value, which could lead
> > to non-compliant software relying on implementation-defined behavior.
> > Enforce the host kernel running under pKVM to use an immediate value
> > of 0 by decoding the ISS from the ESR_EL2 and inject an undefined
> > instruction exception back to the caller.
> >
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index e7790097db93..ff6a90a4a4c7 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -756,13 +756,18 @@ static bool handle_host_mte(u64 esr)
> >  void handle_trap(struct kvm_cpu_context *host_ctxt)
> >  {
> >         u64 esr = read_sysreg_el2(SYS_ESR);
> > +       u16 imm16;
> >
> >         switch (ESR_ELx_EC(esr)) {
> >         case ESR_ELx_EC_HVC64:
> >                 handle_host_hcall(host_ctxt);
> >                 break;
> >         case ESR_ELx_EC_SMC64:
> > -               handle_host_smc(host_ctxt);
> > +               imm16 = esr & U16_MAX;
> > +               if (!imm16)
> 
> Do we need to introduce a new variable for this? This isn't easier to read than:
> +               if (!(esr & U16_MAX))
> 
> Also, we have a mask for this: ESR_ELx_xVC_IMM_MASK , please use that instead


I will drop that variable and use the ESR_ELx_xVC_IMM_MASK as you pointed out.

> 
> Cheers,
> /fuad
> 
> 
> 
> > +                       handle_host_smc(host_ctxt);
> > +               else
> > +                       inject_undef64();
> >                 break;
> >         case ESR_ELx_EC_IABT_LOW:
> >         case ESR_ELx_EC_DABT_LOW:
> > --
> > 2.53.0.983.g0bb29b3bc5-goog
> >

Thanks,
Sebastian

