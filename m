Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F96CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3wvzxcpQU0Ik+95S3dasptB+RwKMZZavChVLbzx6Es=; b=3n3yQBoD7X/4z8awYAjzgePUin
	VaKVhbGZfxFG/+y2BR151heclOnZBhbtMFsLzqeJ2Rsxe3Y2IhnEE/e2x57mpkrXSExrKIG9sMvmo
	A5ZEKyXS5ZwA0qMBullMw2JIdfbysjJ8PJ3SbqUDfKHzP6ArnoCL5scX6bZmlw+7UTDh8795ztBXE
	Iw23BjQtS6h31YkUxtGlyJAYaOoEpR34pO4XJugRMqnbGHEev2gtnV7io8JR1bxaGMyk1VmPchC/T
	r6VCov7lyJzSui1V6EeMauaXI20LII6A8BGBwO+IZg3Gh8eoQ5WCFDmH0nB/XJwB3ID3vu8C7E1i0
	kaSD+Gvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUps-0000000FvPM-2jTt;
	Tue, 16 Jun 2026 14:32:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUpp-0000000FvOs-3RMe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 14:32:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b23c828aso47615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 07:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781620332; x=1782225132; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3wvzxcpQU0Ik+95S3dasptB+RwKMZZavChVLbzx6Es=;
        b=P+wrLduqgT/RTr3yX70qLy69indeB8DRq4R6getxH77AbG3ZIXk3VoIOaxQw/eL4Fc
         GGuJwNPYTLqYA+IjKB4hW0X8mnsu+uNG9jhdGbILTl8YgJGt2J8WLNO2WJey3sGrUIaR
         PcaTeyhRKHRtQpR21NPsSGx+s5ShOnynltjy4qVkcocsw/h4h/pCNDzSwv02X+aY/EOV
         GBwv+rCLQ5Lv5G1/pRwHHcgRKMKLPGUJYnjpzY4k+J4T0ltbFesEJkT7S5iUsCbk5OjW
         3chSIQLv1fuXUDpMSk9/QWm98KBa9rJQ2flBghEhvRE1L7St+7rwSj9AvAe9uhQqZ1q+
         dCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620332; x=1782225132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3wvzxcpQU0Ik+95S3dasptB+RwKMZZavChVLbzx6Es=;
        b=X/rAxzWOyWodEaFD4hLOSj5+t8Cw8do/KH3ffG34QPOzghinOhMqH4TDd8osmWzC54
         3IXwJVgaQeeuS7Mt8+K/Dx+lLDin7SGZch7tgtLQ/E5fnekrfuG1FgXX233vU8Op8D0r
         UL+o1UO+6Gym47hrvmqIOWmF+vUt1ASTqGWyqZj0LdbmsqgDLp8mVhRvW5XU98MPCrsx
         KAFTg7+ikUKAjeYE3SNTTjRtmy+fkdR6pwM6yPFiVS0B37SewF+aH4qxD5qWMm2eiFS6
         j3/VY2bFY11cifCNy4I6q61T6SQj4nLpZKKjbp81FPdQZ9mnMp7kWAssFnZ6x1U4nhVq
         h9Cg==
X-Forwarded-Encrypted: i=1; AFNElJ/la/OZOz+I90IypTa6iFZdq/YoGSfKwJWobpa3HMEyelfi87MwLn57zCfnVCZs4WjUtpBum4jRbcouaAVfQo8u@lists.infradead.org
X-Gm-Message-State: AOJu0YyxnwSS+lpO9hoTYe5oaEkT95MHQAaKvw8gRutOqTs5i9lIKeF2
	gHR/Gi+DiO3dgxUzq6IWqasgdFo2LPt/5t9SW06NN+4HJRILhEhxmfoT+oR3fi2UEg==
X-Gm-Gg: Acq92OGTnPRvTeKsxco39ADx54ULvGtlwGAk+65USgjbv0ONZCeuquY8ilywCid4itT
	+Lr5ABIC0tzOEyfoIbBvUGnuwI92ZlnWTBNso64cNhmMbJWlMdMe71mpRe2F2702WF6VxJ4sSCK
	P6zyi/sDNu2zvG0tSvL02dWZEon3C93jn9WER6+EoWJxyy0eilCCiqwzE+WK76pxD0v9kzefLk/
	WWr+2WRI3qtWY3cy/il8ofxvcViWaxW3YrWywrYPC7aRRWqPSRffjYtnPGbZLZIUbkyvAMo0SlV
	x4Ynug+HJnm856AoZu2LKLzCYnYWBJO6MRyoMBYOjCl9h44LZLFFBqt7tt5zFEUXoXc9GTLHEZM
	3KxsB56FUpNc7JeUAUHmJODL/axnJONu3FRFA3FzRxVhfpLIGFiAvT71pKQCfWspy4hwFuspEAw
	d28iqd0GaW82TNJsu5kM5mqvqJ8Fkpvms39VSUg6c1prc+TiWXy3zm6Avd6QBJ+onzRydUSg==
X-Received: by 2002:a05:600c:15c3:b0:492:203f:a378 with SMTP id 5b1f17b1804b1-4922ffdc0f7mr882935e9.8.1781620331294;
        Tue, 16 Jun 2026 07:32:11 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47d1csm83331255e9.4.2026.06.16.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:32:10 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:32:07 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 1/7] KVM: arm64: Enforce strict SBZ checks in the FF-A
 proxy
Message-ID: <ajFeZyMZfRaaHuxm@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-2-sebastianene@google.com>
 <ajFI95hZJxZfFg5q@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajFI95hZJxZfFg5q@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_073213_877607_36B51E52 
X-CRM114-Status: GOOD (  18.83  )
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

On Tue, Jun 16, 2026 at 02:00:39PM +0100, Vincent Donnefort wrote:
> On Tue, Jun 16, 2026 at 10:54:08AM +0000, Sebastian Ene wrote:
> > Introduce a helper method ffa_check_unused_args_sbz to enforce strict
> > arguments checking when the hypervisor acts as a relayer between the
> > host and Trustzone.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 47 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 1af722771178..c723a21006aa 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
> >  static bool has_version_negotiated;
> >  static hyp_spinlock_t version_lock;
> >  
> > +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> > +{
> > +	int reg;
> > +
> > +	for (reg = first_reg; reg < 17; reg++) {
> 
> Hum, should it be reg <= 17? 
> 

Right, I think 17 including. Thanks for pointing out.

> 
> > +		if (cpu_reg(ctxt, reg))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> 
> [...]

Sebastian

