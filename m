Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D005BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxWaN40Gu0y4wmPgUEJqr+nQuSXPrmjIwZFj0rXa2nA=; b=DjtBdCxtXsk+uo+vjf6Re8RU4T
	ROJ8loW4MsKx3l5Pn8hBFzG7dKHTpYUvIfJq456RkOKHaSqsobBYcpddrMtFY9AdR4W8Q8e4Q7CfP
	yhx9VGssK3b3vD+6Pi5dpuSVNz6auqj+P/VqMIPt1Tu3kj9cyTWZFXVlPhh6grwumDy7eQUV0M/G/
	DROJbN1ribhk0Q8F3RTaw8Do+2nmEuJ0+7W6Olnx8qb73eWKuhdwNLewuwqvap11kQ4creEpWu4Zt
	lX3eUer9g2FU1rU/fRDlMYpHReQlUB3Ks+cYRxo2R8iOA1UvnzOXsm+WQVynqOl8qyxVxb3H6vCt1
	cUDBbdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsek4-0000000AiGj-37Wu;
	Thu, 13 Mar 2025 09:20:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseg8-0000000AhU8-3mb8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 09:16:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39129fc51f8so562759f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 02:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741857395; x=1742462195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxWaN40Gu0y4wmPgUEJqr+nQuSXPrmjIwZFj0rXa2nA=;
        b=KpLaywIIUkYc2p08DGN918oiaSNB+9B8ATC3LWKxWyiB7A3u16HlztDwyoUY35viKX
         6XY59htg4MIoxoHO1gk3DSybHSbjJQY5cqWRLpZLbe+oSvy6tId+2gBmFl0o29VCuYJj
         bclsusKdM2mKQTh4xc6AoEEI4acKr0PW/RGrjoJPDGFj7Z/Vb1dg3dTn1yrq/qJeQ8mt
         lSsB9hgAwitq34QLIprSAUfYH+Dnlx+i730rube+rUYyzJAUUobSwv9JLH6yxUZjTkzB
         7N0pVtNeyLqeTg0Z2YPlhnC6hungn6YeDA4bbUxONwSCebrIlgFyCZUd0ZhL/9sHqKrU
         R2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857395; x=1742462195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxWaN40Gu0y4wmPgUEJqr+nQuSXPrmjIwZFj0rXa2nA=;
        b=goSt1Y1bToZqkXHQqSJ0EZKV8Fe3HwzbahOFrs8XU2KAPLqnnaiXtVu75zrPcAcGtQ
         bJEjuvgsJ/ryft4eHTcGG8Wqb6eP7qTbUAYKA9yRDentDbSBHJkmJl8ud7e60eOIcwAk
         82BToj0Xlx/r2i75jwh2nqZTeCZf9JgI+5wjFcWFEyqTgMSPskS8jrHcEcGBobi5rTpm
         dkZNbZIbW+Cs4+XJdwtHv198m2pCk8dd0+6rULBxUnlGrw8/TmkpKb5O+AmWaFTPOPyU
         bmS2vRIFIi2gVA/Uxz1nqCyBDkhdPqdsuVRi/zhcWBgDYugYIh1Ko0b5J7mByjHUIjS4
         bChw==
X-Forwarded-Encrypted: i=1; AJvYcCXC2NCMc6Zq2SSyFVtDnipGCG9QaHRA4/fpeX6YRw29nQ05jVZ2CVwjLF0yEyXL3mDBBiIg3bxapq5cqvZ89TjD@lists.infradead.org
X-Gm-Message-State: AOJu0YxE/n32E4xR4JsukJ13eZ8+3RtddXuEa2VDuOBbAj8f/xTUVj42
	vJrmYoi70oaloHx4lVEG76bDegmZcEvcaJVkR3fnONJW3BIjIWRxBFkw/+rTUw==
X-Gm-Gg: ASbGnct3qdU0MwVpk4auQHNXqm8ERW0r84eAgJCno6InH4Ivf+2snhLBbY1ZKI+fk+H
	JBMo1ZKP/DUdoGaq9/Vv5W5sKnfFwZNWAPPGrVn8FtsQrFx6Fq4MQz7KKSdeAPqCNke6qCRp54h
	jJUFZ9ANpugez1+TrCZqxOCnrx9eux5+46a+3IzV1NcIE0X7SeSTt92JyANjPcIy42tX2ddjIOd
	6ULWQXv5oBZYI0JsP/t4GN/EP2n/vHIC3WNSZ0o72F8m+fbTlia3yv3eNtw6sr7UbIHoKPoCE7F
	TwSIHJlUCqNEJs9ix5qxXQ5jUE/t2GvA1yVYGF5CucZZJiubha2FgKOGbBrVC0xEchh7mpoFAig
	letNOfDKeVyfg
X-Google-Smtp-Source: AGHT+IHyTZmg9ER74S1drTjoF85PA6dZOdC3TWCeZ2nKybqjldE81KW9q1fSH09TLkfQNscM9Dnofg==
X-Received: by 2002:a5d:5f45:0:b0:38d:ca55:76c3 with SMTP id ffacd0b85a97d-39132d2ac3amr18093999f8f.11.1741857394994;
        Thu, 13 Mar 2025 02:16:34 -0700 (PDT)
Received: from google.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb8c2sm1397573f8f.85.2025.03.13.02.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 02:16:34 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:16:30 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v3 1/3] KVM: arm64: Add flags to kvm_hyp_memcache
Message-ID: <Z9KiboTJy9A6qvbK@google.com>
References: <20250307113411.469018-1-vdonnefort@google.com>
 <20250307113411.469018-2-vdonnefort@google.com>
 <87r0327iek.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0327iek.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_021636_939504_9E243B2C 
X-CRM114-Status: GOOD (  10.67  )
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

[...]

> > @@ -1102,7 +1102,7 @@ void free_hyp_memcache(struct kvm_hyp_memcache *mc)
> >  		return;
> >  
> >  	kfree(mc->mapping);
> > -	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, NULL);
> > +	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, (void *)mc);
> 
> Why the cast? It looks superfluous to me.

Ha yes it is now I pass mc and not mc->flags.

> 
> >  }
> >  
> >  int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
> > @@ -1117,7 +1117,7 @@ int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
> >  	}
> >  
> >  	return __topup_hyp_memcache(mc, min_pages, hyp_mc_alloc_fn,
> > -				    kvm_host_pa, NULL);
> > +				    kvm_host_pa, (void *)mc);
> 
> Same here.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

