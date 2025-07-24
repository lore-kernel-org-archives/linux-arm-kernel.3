Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7950FC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+yXn2Dd03JRNhm/5JyeMXOZKFuYEN81fHuvdMRTIp8=; b=DJD+kN2/voXoJzKzcOgPvXwM/D
	2wWUiTnx71DskokFS4fUyjIYGcWKrf8cWp+AG31C/i49JbcnR0YV8R7b8AV1FzEYDtNzKKylEnwoy
	WNpcSiqCvqUqU08vXKQeBgpZy7hiAa7zqxFdohlR7DacCnXfl6dQgzcle6ZwrgQMYS893zT1t5Az3
	3jS1j6qk1JiQ42Nub9l7eKWuqvWmxC/b3C1wI8fVa2Vmkf1GP4Uv5tlj1oJsOTsqTmlS14ewvpIUs
	Z2AKxpkdoH4MymFJyHgdEhmzecvp/S6/NExkPTlc1DquvwaCad0oWiIpFQNqHUgIompyjo+zZJ+GL
	yFFrik5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewPG-00000007d2b-2bm8;
	Thu, 24 Jul 2025 13:54:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uevQu-00000007SNB-0ic4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753361542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+yXn2Dd03JRNhm/5JyeMXOZKFuYEN81fHuvdMRTIp8=;
	b=XdMFeb2mGwcipMQfGwdrzGFbHjpUq6XKO0qFx+/NK8gwaxGp5CBCkn9FjXGmmwoMF4fWNs
	VFa1FZzE80s7Tlb8ret+ADJ2YVZqXsVN5AG7D/zUlBO8k2lB0nEBjCqs/KIP+MqcCYzy8x
	eIBqWMv3YWeSb2WQc1OH4FJGLuSvSAY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-r6j0w5mpPfWutXSezAhz1w-1; Thu, 24 Jul 2025 08:52:21 -0400
X-MC-Unique: r6j0w5mpPfWutXSezAhz1w-1
X-Mimecast-MFC-AGG-ID: r6j0w5mpPfWutXSezAhz1w_1753361541
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e72b0980138so1327336276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 05:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753361541; x=1753966341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+yXn2Dd03JRNhm/5JyeMXOZKFuYEN81fHuvdMRTIp8=;
        b=ht3p2EA8KTDXai5GU7Hl3u48/tPOLz3JsH+rZZ8sPsVk3A9plOpHmBCz+T93DW9/ss
         HJh6ReL1iufOna74q9cHraXDERkwJtC0ROsF01EHXUraoLmuDoxJdEAn0SKSX07xd6yz
         cTZGL59734QklUY9Zz85PlEUKUYXBDiKhLSgU9ecPuEMD5qotUezaJeIM/+LlX9n/W68
         /qon/7J4EiJulmUW5tW3TbEyUwvg+xX7RjS1DP2xTD1j/hbPn1v0EJiTiNQqGqCaR8Gc
         cnvDKk93s/exvHVFC9EtBjhJfCmsK9y8GfTnZdpxIWAzlXa8E7naahi3TDpOMWeKQvr0
         4h4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2gXbblJ9EWUj77s8m9l+WVD4WQrLku9b+Kw0yax9wRkCFu/lwNDlRxqWkqoUBlxBC7UkVNdxcpD0qp1FZjOgo@lists.infradead.org
X-Gm-Message-State: AOJu0YxmtRNCtUBf73fcUVpVjQOboLGOFzXXR/bgTzbHzLGk+MFjzK+H
	1WTmSAT4W9SHU4sDL7y5bjeFFO0C2+udr32BJtR2VQTDbVDvg1ybOTusSQGSVQcbm24RT4dJptW
	Z6JAaf9KFCX/DcOE3bxauR0Ks4ywmj8DHSVQyTb7+qmaCyEBlJ/zaHeTpCrEBLAhB4VeNrhr/Zb
	2qv48TBvMsUhiKuXzrT88flBtgzdPT5yDOSjNYjevhiXvIW/hjNdNs5miRLbU7t8E/
X-Gm-Gg: ASbGncttnG6k+xvBmLzTmTy+uThTWZKox0lq9dKUNklFqYA0gzbNBKEXOwO/63SFnJ7
	sj53FcfJwp8TnOy7zf+9bkqPZZnqcdrZB/KVROQEYFCBfZfspSx2tItzpPOiGCD706TzkoKyv2A
	mojmMwV7dLK2ou6q2Ouu0A
X-Received: by 2002:a05:6902:4a7:b0:e87:9bab:25d with SMTP id 3f1490d57ef6-e8dc5b5c9a3mr6055894276.39.1753361540482;
        Thu, 24 Jul 2025 05:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+sxi2SF54aHzw0dd7QBG7rNJyq5RlA5zJNp/TA3A+qcVSys8/eRIZSECOlpj/89ZnMMKBfoWNEee5wXBQRqA=
X-Received: by 2002:a05:6902:4a7:b0:e87:9bab:25d with SMTP id
 3f1490d57ef6-e8dc5b5c9a3mr6055873276.39.1753361539934; Thu, 24 Jul 2025
 05:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c>
 <20250724034659-mutt-send-email-mst@kernel.org> <CAGxU2F76ueKm3H30vXL+jxMVsiQBuRkDN9NRfVU8VeTXzTVAWg@mail.gmail.com>
 <20250724042100-mutt-send-email-mst@kernel.org> <aIHydjBEnmkTt-P-@willie-the-truck>
 <fv6uhq6lcgjwrdp7fcxmokczjmavbc37ikrqz7zpd7puvrbsml@zkt2lidjrqm6>
In-Reply-To: <fv6uhq6lcgjwrdp7fcxmokczjmavbc37ikrqz7zpd7puvrbsml@zkt2lidjrqm6>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 24 Jul 2025 14:52:08 +0200
X-Gm-Features: Ac12FXwbtWtqNIZqXPX4jKNjmg84cpnD3-Y4W9qdqMU4Zw6KtEs0EheiQJT1DQo
Message-ID: <CAGxU2F5Qy=vMD0z9_HTN2K9wyt+6EH-Yr0N9VqR4OT4O1asqZg@mail.gmail.com>
Subject: Re: vhost: linux-next: crash at vhost_dev_cleanup()
To: Breno Leitao <leitao@debian.org>
Cc: Will Deacon <will@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, jasowang@redhat.com, 
	eperezma@redhat.com, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>, netdev@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Bghl135WjPcX-gSD15vXKCgXSnl4_ti1AtzslYSI7s_1753361541
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_055224_285481_B8BFA735 
X-CRM114-Status: GOOD (  28.41  )
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

On Thu, 24 Jul 2025 at 14:48, Breno Leitao <leitao@debian.org> wrote:
>
> On Thu, Jul 24, 2025 at 09:44:38AM +0100, Will Deacon wrote:
> > > > On Thu, 24 Jul 2025 at 09:48, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Wed, Jul 23, 2025 at 08:04:42AM -0700, Breno Leitao wrote:
> > > > > > Hello,
> > > > > >
> > > > > > I've seen a crash in linux-next for a while on my arm64 server, and
> > > > > > I decided to report.
> > > > > >
> > > > > > While running stress-ng on linux-next, I see the crash below.
> > > > > >
> > > > > > This is happening in a kernel configure with some debug options (KASAN,
> > > > > > LOCKDEP and KMEMLEAK).
> > > > > >
> > > > > > Basically running stress-ng in a loop would crash the host in 15-20
> > > > > > minutes:
> > > > > >       # while (true); do stress-ng -r 10 -t 10; done
> > > > > >
> > > > > > >From the early warning "virt_to_phys used for non-linear address",
> > > >
> > > > mmm, we recently added nonlinear SKBs support in vhost-vsock [1],
> > > > @Will can this issue be related?
> > >
> > > Good point.
> > >
> > > Breno, if bisecting is too much trouble, would you mind testing the commits
> > > c76f3c4364fe523cd2782269eab92529c86217aa
> > > and
> > > c7991b44d7b44f9270dec63acd0b2965d29aab43
> > > and telling us if this reproduces?
> >
> > That's definitely worth doing, but we should be careful not to confuse
> > the "non-linear address" from the warning (which refers to virtual
> > addresses that lie outside of the linear mapping of memory, e.g. in the
> > vmalloc space) and "non-linear SKBs" which refer to SKBs with fragment
> > pages.
>
> I've tested both commits above, and I see the crash on both commits
> above, thus, the problem reproduces in both cases. The only difference
> I noted is the fact that I haven't seen the warning before the crash.
>
>
> Log against c76f3c4364fe ("vhost/vsock: Avoid allocating
> arbitrarily-sized SKBs")
>
>          Unable to handle kernel paging request at virtual address 0000001fc0000048
>          Mem abort info:
>            ESR = 0x0000000096000005
>            EC = 0x25: DABT (current EL), IL = 32 bits
>            SET = 0, FnV = 0
>            EA = 0, S1PTW = 0
>            FSC = 0x05: level 1 translation fault
>          Data abort info:
>            ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
>            CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>            GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>          user pgtable: 64k pages, 48-bit VAs, pgdp=0000000cdcf2da00
>          [0000001fc0000048] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
>          Internal error: Oops: 0000000096000005 [#1]  SMP
>          Modules linked in: vfio_iommu_type1 vfio md4 crc32_cryptoapi ghash_generic unix_diag vhost_net tun vhost vhost_iotlb tap mpls_gso mpls_iptunnel mpls_router fou sch_fq ghes_edac tls tcp_diag inet_diag act_gact cls_bpf nvidia_c
>          CPU: 34 UID: 0 PID: 1727297 Comm: stress-ng-dev Kdump: loaded Not tainted 6.16.0-rc6-upstream-00027-gc76f3c4364fe #19 NONE
>          pstate: 23401009 (nzCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
>          pc : kfree+0x48/0x2a8
>          lr : vhost_dev_cleanup+0x138/0x2b8 [vhost]
>          sp : ffff80013a0cfcd0
>          x29: ffff80013a0cfcd0 x28: ffff0008fd0b6240 x27: 0000000000000000
>          x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>          x23: 00000000040e001f x22: ffffffffffffffff x21: ffff00014f1d4ac0
>          x20: 0000000000000001 x19: ffff00014f1d0000 x18: 0000000000000000
>          x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>          x14: 000000000000001f x13: 000000000000000f x12: 0000000000000001
>          x11: 0000000000000000 x10: 0000000000000402 x9 : ffffffdfc0000000
>          x8 : 0000001fc0000040 x7 : 0000000000000000 x6 : 0000000000000000
>          x5 : ffff000141931840 x4 : 0000000000000000 x3 : 0000000000000008
>          x2 : ffffffffffffffff x1 : ffffffffffffffff x0 : 0000000000010000
>          Call trace:
>           kfree+0x48/0x2a8 (P)
>           vhost_dev_cleanup+0x138/0x2b8 [vhost]
>           vhost_net_release+0xa0/0x1a8 [vhost_net]

But here is the vhost_net, so I'm confused now.
Do you see the same (vhost_net) also on 9798752 ("Add linux-next
specific files for 20250721") ?

The initial report contained only vhost_vsock traces IIUC, so I'm
suspecting something in the vhost core.

Thanks,
Stefano

>           __fput+0xfc/0x2f0
>           fput_close_sync+0x38/0xc8
>           __arm64_sys_close+0xb4/0x108
>           invoke_syscall+0x4c/0xd0
>           do_el0_svc+0x80/0xb0
>           el0_svc+0x3c/0xd0
>           el0t_64_sync_handler+0x70/0x100
>           el0t_64_sync+0x170/0x178
>          Code: 8b080008 f2dffbe9 d350fd08 8b081928 (f9400509)
>
> Log against c7991b44d7b4 ("vsock/virtio: Allocate nonlinear SKBs for
> handling large transmit buffers")
>
>         Unable to handle kernel paging request at virtual address 0010502f8f8f4f08
>         Mem abort info:
>           ESR = 0x0000000096000004
>           EC = 0x25: DABT (current EL), IL = 32 bits
>           SET = 0, FnV = 0
>           EA = 0, S1PTW = 0
>           FSC = 0x04: level 0 translation fault
>         Data abort info:
>           ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>           CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>           GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>         [0010502f8f8f4f08] address between user and kernel address ranges
>         Internal error: Oops: 0000000096000004 [#1]  SMP
>         Modules linked in: vhost_vsock vfio_iommu_type1 vfio md4 crc32_cryptoapi ghash_generic vhost_net tun vhost vhost_iotlb tap mpls_gso mpls_iptunnel mpls_router fou sch_fq ghes_edac tls tcp_diag inet_diag act_gact cls_bpf ipmi_s
>         CPU: 47 UID: 0 PID: 1239699 Comm: stress-ng-dev Kdump: loaded Tainted: G        W           6.16.0-rc6-upstream-00035-gc7991b44d7b4 #18 NONE
>         Tainted: [W]=WARN
>         pstate: 23401009 (nzCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
>         pc : kfree+0x48/0x2a8
>         lr : vhost_dev_cleanup+0x138/0x2b8 [vhost]
>         sp : ffff80016c0cfcd0
>         x29: ffff80016c0cfcd0 x28: ffff001ad6210d80 x27: 0000000000000000
>         x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>         x23: 00000000040e001f x22: ffffffffffffffff x21: ffff001bb76f00c0
>         x20: 0000000000000000 x19: ffff001bb76f0000 x18: 0000000000000000
>         x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>         x14: 000000000000001f x13: 000000000000000f x12: 0000000000000001
>         x11: 0000000000000000 x10: 0000000000000402 x9 : ffffffdfc0000000
>         x8 : 0010502f8f8f4f00 x7 : 0000000000000000 x6 : 0000000000000000
>         x5 : ffff00012e7e2128 x4 : 0000000000000000 x3 : 0000000000000008
>         x2 : ffffffffffffffff x1 : ffffffffffffffff x0 : 41403f3e3d3c3b3a
>         Call trace:
>          kfree+0x48/0x2a8 (P)
>          vhost_dev_cleanup+0x138/0x2b8 [vhost]
>          vhost_net_release+0xa0/0x1a8 [vhost_net]
>          __fput+0xfc/0x2f0
>          fput_close_sync+0x38/0xc8
>          __arm64_sys_close+0xb4/0x108
>          invoke_syscall+0x4c/0xd0
>          do_el0_svc+0x80/0xb0
>          el0_svc+0x3c/0xd0
>          el0t_64_sync_handler+0x70/0x100
>          el0t_64_sync+0x170/0x178
>         Code: 8b080008 f2dffbe9 d350fd08 8b081928 (f9400509)
>
>
> > Breno -- when you say you've been seeing this "for a while", what's the
> > earliest kernel you know you saw it on?
>
> Looking at my logs, the older kernel that I saw it was net-next from
> 20250717, which was around the time I decided to test net-next in
> preparation for 6.17, so, not very helpful. Sorry.
>


