Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A34E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTusGh58VW6+2NSFZii2lA8KCNl1o8/ZwWDL6LUst5g=; b=CQHGTKT9Z30xGLY+LTjbD1iCw/
	Cghsq410kFDUzS9eJikiIQgRhK15dtjRM40chC/yH7U7UF9ArI20GuYuVtOjezXASCBU12xOkzZ0h
	v1i/Sfz4+peXV9WaOYchInvCpRhZrBuMHfs8uLp4Jl8M1vv4soELUec9aqCUmjM388RH/wvlb6tkk
	ltfQPfN5ZlZVsjRH19AjuxdwB8dIzYR/k1hrl+SH/efCyDu5nrxNkYC/kypdt/MN0nfOYgBJ1ovIS
	lyl7QuAB9s67SBF4oN0dJNiRuQL32MCSbvj+u0qjZ8eNo83GkCP0cm+7CwA+9KSmtrqBfryYp8Oxg
	qu26Mkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXNG-0000000DWRN-1qv7;
	Tue, 17 Dec 2024 13:12:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXKG-0000000DVq5-2lSg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:09:25 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso351306a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734440963; x=1735045763; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTusGh58VW6+2NSFZii2lA8KCNl1o8/ZwWDL6LUst5g=;
        b=22NVnqdi58WlwXvoRdp4E3/oYRKKV+qoZaoAabFYkWpkbmL8NTqq6c/6k9B58TevoL
         pAHr/6oPXrUXkBKRhTrohut+zNY5qXS0felP0cdnlJ/Bczp3/EQY/cV4su24W5njXMcQ
         HZTAAYef1Cph4MZ4U0TXCV0hJOW0saevtg7LeLgDB4p69boEWl3aaBdD2NeBfKrUqlO7
         bREuVw/p45WXrv9mYWdO+uQiVORVR9l29dnSQkL8M5yGJQ4O6mjk6f4Xfa+uzzMnWZnC
         jF/x6aVJG0+5UPaIr3+zYxZMpxcvyZ9kUBm+CYcXUNd+4RCe+3lQkJRlYvPAeCQVsX4V
         ketQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440963; x=1735045763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTusGh58VW6+2NSFZii2lA8KCNl1o8/ZwWDL6LUst5g=;
        b=FW/J00Dl5+c7JL9zwQSm14p0lQDVMCUNCMAX7TJF/3V+zm/S8xg63kOxVdK9Q7mxtS
         y8koq1Se+0kcYPaXNTzr2RW4skm89KaVon0YKlHiO4/8eW3g/tiwIqcDj7HTz7et28qQ
         U8yVAgr9rtGDRGc26zohVcapJyXNWeR54V5SUz9YsUmcRTQtd/VW+9ryou6Tb+ogYsh+
         /B0d05A/HBcf7VQlYKU1OLRaQmMjJ98VSKsb/DExmPk6BMeTMF4JACWN7vRc4lgIC7kn
         1GaI5ljIoMJYIOGk5HxYByd3MVqlLxEdc+WLlRL+h0uCtLTGm0uXM5i/bIP3iwYBZu+H
         LuFA==
X-Forwarded-Encrypted: i=1; AJvYcCVDnhMPCpwc0WkHFKT6FaPYEFErYME6vAp3ZPdRaWp+Ll4h6Wx58JXzWXwT4JDHhm5W296Fr5lSrseVEwbnwscY@lists.infradead.org
X-Gm-Message-State: AOJu0YxCwAJc/tZsWQdJGRs25q8C4OpwuboZvZHGr5T38KN3pw1QlKtT
	risIWsCLWeRVnUGJytu54fqXAsl/56waLjqqwuNv+X9Sn1Vb77DMbc4M1kZyyg==
X-Gm-Gg: ASbGncsPaJypCJ1stNC/EtAhz5yYJ6h+bDiCJ6+R49rPsYTRyI2rBDB/yt4wl8FLRY3
	xhJI0vajXESk2NZaBj/SLTuwv3fo6CeiUq1jdnIXDoEGhVKBmt8NtFufHzZPpohQNbrc0EAewKi
	xtYPUnO+YGa1FyL2Rt2JFuA7lxNcWwOiQNA80Ozy2PO2XvFM6gzbgA/yRkAqUhQsZ3Gf1wyOJwm
	P5Gvifp+zCBqTrDAewjsNmAADr3qPoE9uB7YxPYz5qKAY5fIAig3cmxDAd/Mtetgt/w1hQHdJio
	trfuU0kLidqGsxA=
X-Google-Smtp-Source: AGHT+IEnhJMVLLV7Owj/1nOGB+GoFuLCOhRtzgitfH4oBA0YabMmvVMaad90R/9EuoBl8AAIk2rV7Q==
X-Received: by 2002:a05:6402:3890:b0:5d0:cfad:f6c with SMTP id 4fb4d7f45d1cf-5d63c3ad5c6mr13033930a12.21.1734440962482;
        Tue, 17 Dec 2024 05:09:22 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f271a6sm4443462a12.60.2024.12.17.05.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 05:09:22 -0800 (PST)
Date: Tue, 17 Dec 2024 13:09:19 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/18] KVM: arm64: Move host page ownership tracking
 to the hyp vmemmap
Message-ID: <Z2F3_8rN3NBFZXRX@google.com>
References: <20241216175803.2716565-1-qperret@google.com>
 <20241216175803.2716565-5-qperret@google.com>
 <86y10er2qb.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y10er2qb.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_050924_695125_167B9BA1 
X-CRM114-Status: GOOD (  26.46  )
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

On Tuesday 17 Dec 2024 at 11:03:08 (+0000), Marc Zyngier wrote:
> On Mon, 16 Dec 2024 17:57:49 +0000,
> Quentin Perret <qperret@google.com> wrote:
> > 
> > We currently store part of the page-tracking state in PTE software bits
> > for the host, guests and the hypervisor. This is sub-optimal when e.g.
> > sharing pages as this forces to break block mappings purely to support
> > this software tracking. This causes an unnecessarily fragmented stage-2
> > page-table for the host in particular when it shares pages with Secure,
> > which can lead to measurable regressions. Moreover, having this state
> > stored in the page-table forces us to do multiple costly walks on the
> > page transition path, hence causing overhead.
> > 
> > In order to work around these problems, move the host-side page-tracking
> > logic from SW bits in its stage-2 PTEs to the hypervisor's vmemmap.
> > 
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/memory.h |   6 +-
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c    | 100 ++++++++++++++++-------
> >  arch/arm64/kvm/hyp/nvhe/setup.c          |   7 +-
> >  3 files changed, 77 insertions(+), 36 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index 45b8d1840aa4..8bd9a539f260 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -8,7 +8,7 @@
> >  #include <linux/types.h>
> >  
> >  /*
> > - * SW bits 0-1 are reserved to track the memory ownership state of each page:
> > + * Bits 0-1 are reserved to track the memory ownership state of each page:
> >   *   00: The page is owned exclusively by the page-table owner.
> >   *   01: The page is owned by the page-table owner, but is shared
> >   *       with another entity.
> > @@ -43,7 +43,9 @@ static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
> >  struct hyp_page {
> >  	u16 refcount;
> >  	u8 order;
> > -	u8 reserved;
> > +
> > +	/* Host (non-meta) state. Guarded by the host stage-2 lock. */
> > +	enum pkvm_page_state host_state : 8;
> 
> An enum as a bitfield? Crazy! :)

Hehe, it works so why not :)

> You probably want an assert somewhere that ensures that hyp_page is a
> 32bit quantity, just to make sure (and avoid hard to track bugs).

Sounds like a good idea, I'll stick a BUILD_BUG_ON() somewhere.

