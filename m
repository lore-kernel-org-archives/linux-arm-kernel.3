Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300B8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Feu4TUEkDrcgiJgcCEsLW4qWTUbzwEUwHnHWizBP17Y=; b=KY1VB/L6IeqO7tdAh7vOLA0Nqs
	8hq23Zh4zVgpM9uOUnrF/KxuUFBvRejBV8EPcZjBspUc25/o+4j6EECD+SITprQFG7NfTnf0DQrhc
	zAEZpQt4cUt2hcmlvEajBBS5Uza9WqpVsGVL3vTO0XMx/hu6YHH0P3jsnAaucL/9JxjoZoxxo1tUf
	5C3WiKvMZHe55m/NlGsuLcINaTkHkXxTPJipkH/aJAGHTC+xPKhLlX/PpaelPC3ijEkoDCeDkuKDO
	xbrgamBVroaoU3fgRPDX0z1EeX8nf2hF2cD/S0EVUXbT3+RPrz1PUVtGI0X0wP+16dlbktD87gftg
	lZEgPb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPD-00000007cx8-2L9n;
	Thu, 24 Jul 2025 13:54:43 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uevMx-00000007RhW-1d9W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:48:20 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so139157866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 05:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753361298; x=1753966098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Feu4TUEkDrcgiJgcCEsLW4qWTUbzwEUwHnHWizBP17Y=;
        b=dOaO4jC4dua+pa3QbiKjeGrR4CLtkl9yKPd9hraVJkHRlL7gcwD01JHTrXtJzJB3f5
         BVcfk+n2M/szI9S4f59yPwka/8oSiPXb2kUJQ0ZDbgEAMqcHsqV45XqmLv0jhpFkJ7Ga
         sxpemgBRzotH/eJu8JiTQNavKDPg1vCM3mmtRnIsTc4MHIjOXNsWN1ySr51ulaASH3Dt
         bBN6uHOJclP8NRA7vtbjCoImor5TCCp6Rze5vY4D1DBj75fwVQoqnhS+LR8Amu3QmJxe
         Xepmq46pg1c9hyqYIkr1caIsSNSTHbt5yStRYv+QebOPReyohGZt0FNsaXKgCBP5c3No
         sDaw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Wx9xECqkUIAG+F7PAB3ufYwBfM1P33veX2lnz3fmUiBPFfIFftw6Xac3KAvndUYbjy3dyDM6x8P3SPNjMzL0@lists.infradead.org
X-Gm-Message-State: AOJu0YzXwYFgF/O/vU9B1u5zmleKxkFPpAlqt47Gb88rgmbwMjhZxYzV
	8ElwF777UDBNUDvjMOJf1au5cXV4X5jEPLS1AsUG8bDHrFSZ1fSncMPWDubFMSZoh64=
X-Gm-Gg: ASbGncvT9H3LEMRsYShdmV4kngaxBvevV4EJHkHp8GE3Ip1ZFPJKF9yoi3xmheaZoQQ
	3IsRBnkF/8rWI+6EuW9fg/lTqSbkWmhWbjhcwU5DxhnPosMUsbYeUXGavWIK4cMrWsoJ3GAbtnL
	gFuxzcFTltr8jeAudSPx6lV+m+dQaVE1uroCF3tcoqe/y3hI03e5gMuF0lECl27y82w5J/3GXS4
	YRIF7mvSAwdHmtjcgS2FeM5NUceZ8VnXsIQ+qnKJweQ64UXZsCtBS/9pIpDmbcseW8IuFAsLMTH
	GIk2U/U7suMV74NPUjRktHyqocIfKAJCVCqbwY8/Q2yWtdmtBe60mszJvQF+sdf+CBkGjRAkH07
	/7oE5UN1lSRjb
X-Google-Smtp-Source: AGHT+IEpgmL75h5XRByfhF1cN65WzfkmI6mjL+e3dUN6+a65wBrMlTwG/dW8M2hhwpz+R9FZegUIfw==
X-Received: by 2002:a17:907:948b:b0:ae0:abec:dc13 with SMTP id a640c23a62f3a-af2f8f7c16fmr689339766b.53.1753361297391;
        Thu, 24 Jul 2025 05:48:17 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47c58bb50sm109688166b.27.2025.07.24.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 05:48:16 -0700 (PDT)
Date: Thu, 24 Jul 2025 05:48:14 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, jasowang@redhat.com, eperezma@redhat.com, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>, 
	netdev@vger.kernel.org
Subject: Re: vhost: linux-next: crash at vhost_dev_cleanup()
Message-ID: <fv6uhq6lcgjwrdp7fcxmokczjmavbc37ikrqz7zpd7puvrbsml@zkt2lidjrqm6>
References: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c>
 <20250724034659-mutt-send-email-mst@kernel.org>
 <CAGxU2F76ueKm3H30vXL+jxMVsiQBuRkDN9NRfVU8VeTXzTVAWg@mail.gmail.com>
 <20250724042100-mutt-send-email-mst@kernel.org>
 <aIHydjBEnmkTt-P-@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIHydjBEnmkTt-P-@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_054819_427847_3C153C69 
X-CRM114-Status: GOOD (  25.07  )
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

On Thu, Jul 24, 2025 at 09:44:38AM +0100, Will Deacon wrote:
> > > On Thu, 24 Jul 2025 at 09:48, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Jul 23, 2025 at 08:04:42AM -0700, Breno Leitao wrote:
> > > > > Hello,
> > > > >
> > > > > I've seen a crash in linux-next for a while on my arm64 server, and
> > > > > I decided to report.
> > > > >
> > > > > While running stress-ng on linux-next, I see the crash below.
> > > > >
> > > > > This is happening in a kernel configure with some debug options (KASAN,
> > > > > LOCKDEP and KMEMLEAK).
> > > > >
> > > > > Basically running stress-ng in a loop would crash the host in 15-20
> > > > > minutes:
> > > > >       # while (true); do stress-ng -r 10 -t 10; done
> > > > >
> > > > > >From the early warning "virt_to_phys used for non-linear address",
> > > 
> > > mmm, we recently added nonlinear SKBs support in vhost-vsock [1],
> > > @Will can this issue be related?
> > 
> > Good point.
> > 
> > Breno, if bisecting is too much trouble, would you mind testing the commits
> > c76f3c4364fe523cd2782269eab92529c86217aa
> > and
> > c7991b44d7b44f9270dec63acd0b2965d29aab43
> > and telling us if this reproduces?
> 
> That's definitely worth doing, but we should be careful not to confuse
> the "non-linear address" from the warning (which refers to virtual
> addresses that lie outside of the linear mapping of memory, e.g. in the
> vmalloc space) and "non-linear SKBs" which refer to SKBs with fragment
> pages.

I've tested both commits above, and I see the crash on both commits
above, thus, the problem reproduces in both cases. The only difference
I noted is the fact that I haven't seen the warning before the crash.


Log against c76f3c4364fe ("vhost/vsock: Avoid allocating
arbitrarily-sized SKBs")

	 Unable to handle kernel paging request at virtual address 0000001fc0000048
	 Mem abort info:
	   ESR = 0x0000000096000005
	   EC = 0x25: DABT (current EL), IL = 32 bits
	   SET = 0, FnV = 0
	   EA = 0, S1PTW = 0
	   FSC = 0x05: level 1 translation fault
	 Data abort info:
	   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
	   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
	   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	 user pgtable: 64k pages, 48-bit VAs, pgdp=0000000cdcf2da00
	 [0000001fc0000048] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
	 Internal error: Oops: 0000000096000005 [#1]  SMP
	 Modules linked in: vfio_iommu_type1 vfio md4 crc32_cryptoapi ghash_generic unix_diag vhost_net tun vhost vhost_iotlb tap mpls_gso mpls_iptunnel mpls_router fou sch_fq ghes_edac tls tcp_diag inet_diag act_gact cls_bpf nvidia_c
	 CPU: 34 UID: 0 PID: 1727297 Comm: stress-ng-dev Kdump: loaded Not tainted 6.16.0-rc6-upstream-00027-gc76f3c4364fe #19 NONE
	 pstate: 23401009 (nzCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
	 pc : kfree+0x48/0x2a8
	 lr : vhost_dev_cleanup+0x138/0x2b8 [vhost]
	 sp : ffff80013a0cfcd0
	 x29: ffff80013a0cfcd0 x28: ffff0008fd0b6240 x27: 0000000000000000
	 x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
	 x23: 00000000040e001f x22: ffffffffffffffff x21: ffff00014f1d4ac0
	 x20: 0000000000000001 x19: ffff00014f1d0000 x18: 0000000000000000
	 x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
	 x14: 000000000000001f x13: 000000000000000f x12: 0000000000000001
	 x11: 0000000000000000 x10: 0000000000000402 x9 : ffffffdfc0000000
	 x8 : 0000001fc0000040 x7 : 0000000000000000 x6 : 0000000000000000
	 x5 : ffff000141931840 x4 : 0000000000000000 x3 : 0000000000000008
	 x2 : ffffffffffffffff x1 : ffffffffffffffff x0 : 0000000000010000
	 Call trace:
	  kfree+0x48/0x2a8 (P)
	  vhost_dev_cleanup+0x138/0x2b8 [vhost]
	  vhost_net_release+0xa0/0x1a8 [vhost_net]
	  __fput+0xfc/0x2f0
	  fput_close_sync+0x38/0xc8
	  __arm64_sys_close+0xb4/0x108
	  invoke_syscall+0x4c/0xd0
	  do_el0_svc+0x80/0xb0
	  el0_svc+0x3c/0xd0
	  el0t_64_sync_handler+0x70/0x100
	  el0t_64_sync+0x170/0x178
	 Code: 8b080008 f2dffbe9 d350fd08 8b081928 (f9400509)

Log against c7991b44d7b4 ("vsock/virtio: Allocate nonlinear SKBs for
handling large transmit buffers")

	Unable to handle kernel paging request at virtual address 0010502f8f8f4f08
	Mem abort info:
	  ESR = 0x0000000096000004
	  EC = 0x25: DABT (current EL), IL = 32 bits
	  SET = 0, FnV = 0
	  EA = 0, S1PTW = 0
	  FSC = 0x04: level 0 translation fault
	Data abort info:
	  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
	  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
	  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	[0010502f8f8f4f08] address between user and kernel address ranges
	Internal error: Oops: 0000000096000004 [#1]  SMP
	Modules linked in: vhost_vsock vfio_iommu_type1 vfio md4 crc32_cryptoapi ghash_generic vhost_net tun vhost vhost_iotlb tap mpls_gso mpls_iptunnel mpls_router fou sch_fq ghes_edac tls tcp_diag inet_diag act_gact cls_bpf ipmi_s
	CPU: 47 UID: 0 PID: 1239699 Comm: stress-ng-dev Kdump: loaded Tainted: G        W           6.16.0-rc6-upstream-00035-gc7991b44d7b4 #18 NONE
	Tainted: [W]=WARN
	pstate: 23401009 (nzCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
	pc : kfree+0x48/0x2a8
	lr : vhost_dev_cleanup+0x138/0x2b8 [vhost]
	sp : ffff80016c0cfcd0
	x29: ffff80016c0cfcd0 x28: ffff001ad6210d80 x27: 0000000000000000
	x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
	x23: 00000000040e001f x22: ffffffffffffffff x21: ffff001bb76f00c0
	x20: 0000000000000000 x19: ffff001bb76f0000 x18: 0000000000000000
	x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
	x14: 000000000000001f x13: 000000000000000f x12: 0000000000000001
	x11: 0000000000000000 x10: 0000000000000402 x9 : ffffffdfc0000000
	x8 : 0010502f8f8f4f00 x7 : 0000000000000000 x6 : 0000000000000000
	x5 : ffff00012e7e2128 x4 : 0000000000000000 x3 : 0000000000000008
	x2 : ffffffffffffffff x1 : ffffffffffffffff x0 : 41403f3e3d3c3b3a
	Call trace:
	 kfree+0x48/0x2a8 (P)
	 vhost_dev_cleanup+0x138/0x2b8 [vhost]
	 vhost_net_release+0xa0/0x1a8 [vhost_net]
	 __fput+0xfc/0x2f0
	 fput_close_sync+0x38/0xc8
	 __arm64_sys_close+0xb4/0x108
	 invoke_syscall+0x4c/0xd0
	 do_el0_svc+0x80/0xb0
	 el0_svc+0x3c/0xd0
	 el0t_64_sync_handler+0x70/0x100
	 el0t_64_sync+0x170/0x178
	Code: 8b080008 f2dffbe9 d350fd08 8b081928 (f9400509)


> Breno -- when you say you've been seeing this "for a while", what's the
> earliest kernel you know you saw it on?

Looking at my logs, the older kernel that I saw it was net-next from
20250717, which was around the time I decided to test net-next in
preparation for 6.17, so, not very helpful. Sorry.

