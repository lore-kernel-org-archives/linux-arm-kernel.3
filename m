Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81224C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 02:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UekTEVhnNq8YuPcLfLeZp+/v4L/znNVYlBT0hy1V2FU=; b=mDjdKmNYs4pDBkel1Wuxa0/beh
	KXi6lKE4/aJgQyRS8WNpc+vUKlvZ/Jqs2fdSDbO6a9vstoTLjvfgDHYWXE/PhJPYl2YcCkjEUQXYc
	X33LI5q8nX0sLZpcQLb2penB6JCRHhuy+c3RX+Kz1z+ahTz6oSrpapciwa6v2ymM8MZz6PNEjfLnN
	K6xF3ImMt+c2EfhuK5ieUxT/+VgAafDZo9we4TXJ2QWe6ZHZTHcCQRegmIotx14NkXd/8QDCfBgO9
	L6VjOD6Bwnemi5P4m5rYFcUdFpBjaU+DLm4qWZyLFnaDAR8UiKWpDkcYTtxWhMe/65Hi9p4jRB//F
	0DicAIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucxRg-0000000Dl1j-0sUj;
	Sat, 19 Jul 2025 02:37:04 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucxF5-0000000DkEp-1JNx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 02:24:04 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so2537733a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 19:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752891842; x=1753496642; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UekTEVhnNq8YuPcLfLeZp+/v4L/znNVYlBT0hy1V2FU=;
        b=h2lbeJt7yoEX3WqxYJsVgmmG4ZeuVxM2gAayBoZWl94hY0wai1eYSXaF9RJsVkz9g4
         zv1nX8uZl7xnD2KFmS1YOLyDNUcizXDy+sCoEvwFRc6FgjZo3zHmdNvMb5n+ymseLfzq
         u8moe3zLKiTFNsNo1oox3ZpxJrN9FFERafvfdKOZO39o+zFDjrTzAxsMOV6YF9BNnX4X
         rfgWnW/6HtUufMKQA2zKK2b3qR8MeAkok6jnA0PTB5W0g0wt8ynPehmYL2Vsvln4xi99
         zA/V+r8SDq7CgdwqovSVwd7L/t4R2T/1eYv6JtBDBJR7XYGM3joX0nYV5wndY+ZF78gQ
         5ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752891842; x=1753496642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UekTEVhnNq8YuPcLfLeZp+/v4L/znNVYlBT0hy1V2FU=;
        b=kEldE3KfXRlCuz6odIL0cZq4ooRM6bvX+H6B8BBmbTcJMhGypH93B5P0bNfCCryaE4
         fbckBEslm00RKrkQaZ0ElYVhZCDJC2I1bXP0jKEFK9uSTJv2NJEQT0zKhduYX3pDvJ5b
         tBpunSs5yYW8I6D63VWk93kzKhruqt3j5kZ3erSuq5kMkusi7GbXMq0U5C7HJ0Ooq4WQ
         BOoxLWKY+SjXIH5oTY12mp4DlyF55p2Gbxj4qxMhTnc8q7ro+g+ql/1or8qpESZHZaAj
         yy6uwFuTrbSjAeNNaldOuvM0hrwO8CwDkkUOUr8wz6isAYRGaRIYtH5KDpzPm/IxX3o+
         o6uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVscgTNlUsAJIfLP36CCIFze0ibYq2YFUnyMORw+YEQ0XQoUu3wVA5EdGhnhoOrUTJNpkd4UUtxwZhMFqiPxwDt@lists.infradead.org
X-Gm-Message-State: AOJu0YxUWez8gjJpiTjD5Ts7ZzsS55UT3B1KwC/dFlHWWlRA1JduxZxJ
	fQC9RGpD7AMiG3D6NSgjK64ffwlgslc0lM8xS9XJEFbuxQ3YzEbLlnDz
X-Gm-Gg: ASbGncsfN6+MJfomtsQR/np/OxkEpl2EdUAZ2hgRTJm0HInKeXf0a4pD4fGCsb8BIqZ
	4K+Giz7zngCSDLMIe4cWcAtNnM0LxZiOZ2uuPorIquo+agbqIgEtT1RoCflvPRytU/caMIcKOKZ
	QeEHx8z6PIq/24aHuJ4KEz0bsGYkxfzrUIum5hvXrOrkUsw6l8mcBqp+MCzFghBs1VjjWLqoztm
	yZ3TzUD9C31B2QcmcSyqmFmkMut6bV02/BOXQnI0/6VU8evU+I2XuBXwmvCECb2sCxXMlT3aVnA
	10yrVykl3PKaIqd1ciudG7I8svQdNLL/vUs5XSV9qt3TTotBFIEZJM+uH2m5K34nL2ntqSU9arJ
	4RTSJeAuAuG3vVJObleJsGi9a6qY5dqvJNtzw
X-Google-Smtp-Source: AGHT+IFxnG+CFF/7oWtplwctTOfS13tWpUsKu9J6m0qA87Ejv7R4S25APaUlFN65xbYHenOBz6lh6w==
X-Received: by 2002:a17:90b:5307:b0:313:db0b:75e4 with SMTP id 98e67ed59e1d1-31c9f48a241mr23268365a91.33.1752891842281;
        Fri, 18 Jul 2025 19:24:02 -0700 (PDT)
Received: from localhost ([2409:891f:6a27:93c:d451:d825:eb30:1bcc])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c9f1ba67csm6115660a91.8.2025.07.18.19.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 19:24:01 -0700 (PDT)
Date: Sat, 19 Jul 2025 10:23:53 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Keir Fraser <keirf@google.com>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Explicitly implement
 vgic_dist::ready ordering
Message-ID: <tvn672qzjbpp37awdm7fnpojcm3fpddbrpn7ayjqud7znih4zx@nzhnx5g5izrs>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-3-keirf@google.com>
 <kb7nwrco6s7e6catcareyic72pxvx52jbqbfc5gbqb5zu434kg@w3rrzbut3h34>
 <aHpf9vuRK691J7HD@google.com>
 <aHpnev3hf1bEllsy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHpnev3hf1bEllsy@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_192403_354711_11906614 
X-CRM114-Status: GOOD (  29.49  )
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

On Fri, Jul 18, 2025 at 03:25:46PM +0000, Keir Fraser wrote:
> On Fri, Jul 18, 2025 at 02:53:42PM +0000, Keir Fraser wrote:
> > On Thu, Jul 17, 2025 at 01:44:48PM +0800, Yao Yuan wrote:
> > > On Wed, Jul 16, 2025 at 11:07:35AM +0800, Keir Fraser wrote:
> > > > In preparation to remove synchronize_srcu() from MMIO registration,
> > > > remove the distributor's dependency on this implicit barrier by
> > > > direct acquire-release synchronization on the flag write and its
> > > > lock-free check.
> > > >
> > > > Signed-off-by: Keir Fraser <keirf@google.com>
> > > > ---
> > > >  arch/arm64/kvm/vgic/vgic-init.c | 11 ++---------
> > > >  1 file changed, 2 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> > > > index 502b65049703..bc83672e461b 100644
> > > > --- a/arch/arm64/kvm/vgic/vgic-init.c
> > > > +++ b/arch/arm64/kvm/vgic/vgic-init.c
> > > > @@ -567,7 +567,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > > >  	gpa_t dist_base;
> > > >  	int ret = 0;
> > > >
> > > > -	if (likely(dist->ready))
> > > > +	if (likely(smp_load_acquire(&dist->ready)))
> > > >  		return 0;
> > > >
> > > >  	mutex_lock(&kvm->slots_lock);
> > > > @@ -598,14 +598,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
> > > >  		goto out_slots;
> > > >  	}
> > > >
> > > > -	/*
> > > > -	 * kvm_io_bus_register_dev() guarantees all readers see the new MMIO
> > > > -	 * registration before returning through synchronize_srcu(), which also
> > > > -	 * implies a full memory barrier. As such, marking the distributor as
> > > > -	 * 'ready' here is guaranteed to be ordered after all vCPUs having seen
> > > > -	 * a completely configured distributor.
> > > > -	 */
> > > > -	dist->ready = true;
> > > > +	smp_store_release(&dist->ready, true);
> > >
> > > No need the store-release and load-acquire for replacing
> > > synchronize_srcu_expedited() w/ call_srcu() IIUC:
> > >
> > > Tree SRCU on SMP:
> > > call_srcu()
> > >  __call_srcu()
> > >   srcu_gp_start_if_needed()
> > >     __srcu_read_unlock_nmisafe()
> > > 	 #ifdef	CONFIG_NEED_SRCU_NMI_SAFE
> > > 	   	  smp_mb__before_atomic() // __smp_mb() on ARM64, do nothing on x86.
> > > 	 #else
> > >           __srcu_read_unlock()
> > > 		   smp_mb()
> > > 	 #endif
> >
> > I don't think it's nice to depend on an implementation detail of
> > kvm_io_bus_register_dev() and, transitively, on implementation details
> > of call_srcu().

This is good point, I agree with you.

>
> Also I should note that this is moot because the smp_mb() would *not*
> safely replace the load-acquire.

Hmm.. do you mean it can't order the write to dist->ready
here while read it in aonther thread at the same time ?

>
> > kvm_vgic_map_resources() isn't called that often and can afford its
> > own synchronization.
> >
> >  -- Keir
> >
> > > TINY SRCY on UP:
> > > Should have no memory ordering issue on UP.
> > >
> > > >  	goto out_slots;
> > > >  out:
> > > >  	mutex_unlock(&kvm->arch.config_lock);
> > > > --
> > > > 2.50.0.727.gbf7dc18ff4-goog
> > > >
>

