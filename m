Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E10BC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmGAnLS/NEWC0m080CBn1UiyJaS/KFlnJ1TZ/Bc5c1s=; b=CVFKJMtV5Tw49u+7dmuUNLApQ9
	skXtirsKY4YGntGX9Efsg5GH16ujIXfClJCgpprfLiGgvzV+law3kt3+/YMQUTmMHBInLJmv6kuO5
	oQUlMuhTA1yZ5JPWALAkFYjjcdWZLbAFgGm27bbfKJMFX1G7eR1oXeQreTzKjM2Dmu9oNc4+FfQtE
	MpEid1yM4cwEvYObcpt48d0WIb1LJePV0sWvzlxeuzJFEvw1Z377VAri2mkblGGCQnBz+avl67zdy
	LdJUDXtp7uDEiMrRePfA9pRLQXc5zOyNQtLnPbKgVAfS7pDnbx6O/pIpBOQWwzwIDaTSDPSgAHzdd
	CpaXI+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29Z-00000009XiA-3caA;
	Mon, 19 May 2025 15:11:45 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1Z7-00000009SHx-4AsF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:34:07 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ad574992fcaso164106366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747665244; x=1748270044; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmGAnLS/NEWC0m080CBn1UiyJaS/KFlnJ1TZ/Bc5c1s=;
        b=nY6nfV7EQ+L7G95nRYN+6BdFHExT8Mfo1ZPfcaANwO4nXWWOLoP/T2lMmeIiwW8PMA
         9Zr6HPUbkimgw1Pnt6uX/Vv21uvU5NiW/qhM1xsSNYUrO839eEEEk/ViF2fW7fe442Au
         lAWjoHNXCyYegMRIiFC5lpP6jlk9wofcwbjGlHwwHfdl7eG3Ov/flt9yaHTnvf0VQK1d
         pSRuJCpOL55zYxm3O4RArS4YqkgUhZ/IZQawps8Hf8EMspuVkqGODiF/aWBlNr8EfTKg
         +vUYUbRzBWL68CFQP4MalsfYS/T3eQRTFdG8UPFnpVnPWRr0MjG5pyEVAGWgUWhnJpx8
         Ac4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665244; x=1748270044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmGAnLS/NEWC0m080CBn1UiyJaS/KFlnJ1TZ/Bc5c1s=;
        b=R956qXURyMB3KXi3lsOMr3cReGgRvxlmZ0QoaCSFxHBKzmpWhIprTaLAjJz3T8cum7
         7MyVjhYuAc+50wj/seiNU/5ifrui19wPE5uySjAF8df0wqBL6lumOZyggWCHqhzAjZkN
         q1fKV0FIq9Kk5KwONffxYmIZjZbbwd6Au9FRS6Y6E+lHuJuJtbmmLsWBn81a2vqRvVdt
         FHds/N85gkBqW7sU32jYEr53gOAE54DRFd6+nb55l0AO/SKTaFY8WEjEryY0++DXd9Cc
         6cbJ/cRhgMljYMoAYF/BHgVaY/5VoDbuVldVH/PR6ZkL49nCikbpNJcjfvcky+nSveBB
         5JAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXntn4F+AUazYEaczTc76Gjx7JCUoBvJ6Tdn1FYe38c2rWf5NIPLG94wpv+pLDnomg0zDug+M9QeNUG2oiu7xzn@lists.infradead.org
X-Gm-Message-State: AOJu0YyF5A5DQ/QMrc509+JQ0clQ+8hkIgBvcdI/IH7WVjM1HXtvhtoJ
	7arnUik4t/vsFdQowhyhaUT05kp1aM5zyqlr2X1h2ur2ETZ0zA0O2shkFwR+AyExOw==
X-Gm-Gg: ASbGncu2jXW3fsL7t5zTXivb+Wtd8CpNot+8ghQ5f249VB3G4X7EPhqNeC1NDsFN+Bu
	/RYnWE7iiBEYYKt3c6epdAtnZbklYP/zHovJCTqejObjK/L5U5rccHsLWCPq4eKIU/xHJcOAY2W
	+pKtEfI+o3iDcSklDCPG1UX8Nn7mdV4FrKOCivWBo793JK6jy+M4uyjN8wqTkRl4gidNLqf9rag
	OVvRd5Uu6xGxWKEQCQZx5DkJeeaVbOc3pLSmbExm02K0JsrZA14LHF5f1VYgJLYXv92lb0XcaSI
	nRvMkBh8RQMOrZZa/WOXfHYK86L88p0utADGp6MJcHP2oUP7a4eiTMvsp5Lrl93StaJC6LPvPAd
	6PkEY/qRRGw==
X-Google-Smtp-Source: AGHT+IFE+1r+T6jz9dM4N+qGxperYjlRM0Iv/bL9K0RKQrkNyUXEkMkSDlbXHKfSpRXLx2HecBekhg==
X-Received: by 2002:a17:906:dc95:b0:ad5:5447:6ec2 with SMTP id a640c23a62f3a-ad55447bff9mr850796666b.53.1747665244323;
        Mon, 19 May 2025 07:34:04 -0700 (PDT)
Received: from google.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d43840esm594158466b.87.2025.05.19.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:34:03 -0700 (PDT)
Date: Mon, 19 May 2025 14:34:00 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v4 09/10] KVM: arm64: Stage-2 huge mappings for np-guests
Message-ID: <aCtBWPe9Vjy04Srg@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-10-vdonnefort@google.com>
 <865xi0fzwk.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865xi0fzwk.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_073406_049908_6330BE4D 
X-CRM114-Status: GOOD (  22.44  )
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

On Friday 16 May 2025 at 14:28:27 (+0100), Marc Zyngier wrote:
> On Fri, 09 May 2025 14:17:05 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > Now np-guests hypercalls with range are supported, we can let the
> > hypervisor to install block mappings whenever the Stage-1 allows it,
> > that is when backed by either Hugetlbfs or THPs. The size of those block
> > mappings is limited to PMD_SIZE.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 78fb9cea2034..97e0fea9db4e 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -167,7 +167,7 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
> >  static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
> >  				      enum kvm_pgtable_prot prot)
> >  {
> > -	return true;
> > +	return false;
> >  }
> 
> Can we get rid of this callback now? And of the .force_pte_cb field in
> the kvm_pgtable struct?

I think it is still needed for the host side -- see the comment in
host_stage2_force_pte_cb(). In short, it is not safe to put down a
RO block mapping for the host. Re-mapping one page RW in the middle of
the block for example would cause us to 'lose' the RO permission for
the 511 other pages (assuming 4K pages obv) when we zap the block and
we have no way to reconstruct that lazily as we do for guests.

One way to solve this is to teach pgtable.c to inherit the block
permission/attributes/sw bits/ ... for all the PTEs in the newly
installed table when we zap a block. That is actually quite cheap
and easy to do in particular for KVM_PGTABLE_S2_IDMAP page-tables
(a.k.a the host) -- Android does that downstream FWIW.

Thanks,
Quentin

