Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF306C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBbDQ2UDz7LiOVQ3j8EJHJKOU9mY/Q0BRiCKuU/AG34=; b=K6Mr6BUlFsVpA3pOvXGdMLTzIQ
	SIqtahL+U3zry2bSDUk7PHYG8Kiqav31greXvmPNsD+2MXX6f/4mfOpKK2Mearh3T/J945wNzy9tu
	C3lcwux3UfU5AJLbCAmjKx5HAEBUlT317keN7pJY/NOFblfG3ETdTUsfIxO9pYToVj9YzUlNjhzP1
	wmBZSCq3R2khOw+9TcFzASF33imndtxN9GqZ+bRC0WS9XK14dNPTC31WTyZpURo8e/V0IS3bMHp8y
	SRtUyW0Gl7zLoaL9Kx/koTOG9hlbFYCkQtFaBIOKPK5uTlMxJC4TAGSJLrQAne9bQkcsG8+nmYRAU
	Y1sYK6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesHe-000000072yJ-2ifu;
	Thu, 24 Jul 2025 09:30:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerDd-00000006qW6-2jA5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753345344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zBbDQ2UDz7LiOVQ3j8EJHJKOU9mY/Q0BRiCKuU/AG34=;
	b=WB61J+q9ktzIquo2JnD5d3Jjo9jg52I7JnOLH2yVIlJcYpO7+jksBpa1Ara0shQ2DC/180
	L0OehbqvZpLCW6Pi7MXGmBgixebnLN1cgWt6VjU7g92TehjBgdhcHlT76nYRSwM4UQAe7P
	Vgq1zBYAvqEv7zMluyOhHIX1bOBLUWc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-61Bs-ZaIMQyojUiGV9UbdA-1; Thu, 24 Jul 2025 04:22:20 -0400
X-MC-Unique: 61Bs-ZaIMQyojUiGV9UbdA-1
X-Mimecast-MFC-AGG-ID: 61Bs-ZaIMQyojUiGV9UbdA_1753345339
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-455e9daab1cso1358065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 01:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753345339; x=1753950139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBbDQ2UDz7LiOVQ3j8EJHJKOU9mY/Q0BRiCKuU/AG34=;
        b=WSYl4SP03WLKb8Kn/mtXEbKw2ruRZlEX3kVTSeYuFv/mETpjDpfjhNAiGxCqa68uve
         Y1gOmdEVoHCc+iUnE3PbZXAY/wcPPiJas5nryXS6I3wRJg4PzRNxN7nLPgl2ZxWuCIrM
         op5EKApGOWX9EHVqoM+Dqf7lYmxYCgv2mAfaGAYT729WIaKCnWC4dx/dtwIWvsIFynmM
         lWZ4NaVDq8ZsoVJNj5lY6DqN8gkwbrcqEq/1SCG63h0TH3Sq2CL19UptDRRXW7F7IfPu
         bV7xD/9IGV7SejIiEheHh78w12K4e1wc0/96+B0tdV/tVVEh0Kfl/5CCwtUtd2UX4OmW
         PG5A==
X-Forwarded-Encrypted: i=1; AJvYcCWfKQmtosK+ZKPtZyknjPoMQRC9Q/Ii1mM4G2AnkWn26w4d2t6qj9FYBz2wxC9XfYE4T1S5+fUJa+Vo7L87kYdz@lists.infradead.org
X-Gm-Message-State: AOJu0YyAWH50FWcE5mN6awxoeLfgVYxQLzMKuZi3tYArbRy/HdUTwwZj
	a0cCeSC8NR+oDjuHCVHxdlVn0bFYrjVqQY0YPExpZdrE7g4sEPe6cLzkTfCIn4/HXUDgUoCika9
	8bjhUmRnM4dj7d6r3YAoMwRKF4UxcpSGsoNXT9SvG7WaLmbcC8tvjwqUM7OZQ85I4jllho4Hisp
	P2
X-Gm-Gg: ASbGncupYLluxTp5IlL7V3qYoTa9ljD439j4SOSWi7ARgCr/Zafd8ymlKzSVP1S59H+
	VpGzHLvywr5c+MpGj5pSulXGrq/hGhl+g2CsZmO6BRVnHZ9E2SoMWc7JzNjZuJe3S9iUpg2nunm
	mhbqQnaQqluLQ+T9WVQUQCRiyrbHnnFQRiN6CKukRnGGrusqhtt4TSuKRZbzDvQECNxqvBDN0xG
	fQCEPcWcQxjpLsPzKb99Ufu/IS5Uet1/DuAVt2nu4uvmItEso7HaO245JNtThsfvThuQeg8lOvi
	qdMHEIBYkF/HbYg7vkrUUI5gSaWAWAfLyvw=
X-Received: by 2002:a05:6000:26c9:b0:3b1:9259:3ead with SMTP id ffacd0b85a97d-3b768ef72b1mr4699391f8f.28.1753345338643;
        Thu, 24 Jul 2025 01:22:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVcgv+hUiCDDPLnBKuFBT8ee9RL7OdSdHSNvR8xyjKSKoJD0Gynwy/s3Q4XzokPrcpiYZmfg==
X-Received: by 2002:a05:6000:26c9:b0:3b1:9259:3ead with SMTP id ffacd0b85a97d-3b768ef72b1mr4699372f8f.28.1753345338133;
        Thu, 24 Jul 2025 01:22:18 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:153d:b500:b346:7481:16b2:6b23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc6d07asm1416496f8f.19.2025.07.24.01.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 01:22:17 -0700 (PDT)
Date: Thu, 24 Jul 2025 04:22:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Will Deacon <will@kernel.org>, Breno Leitao <leitao@debian.org>,
	jasowang@redhat.com, eperezma@redhat.com,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	Stefan Hajnoczi <stefanha@redhat.com>, netdev@vger.kernel.org
Subject: Re: vhost: linux-next: crash at vhost_dev_cleanup()
Message-ID: <20250724042100-mutt-send-email-mst@kernel.org>
References: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c>
 <20250724034659-mutt-send-email-mst@kernel.org>
 <CAGxU2F76ueKm3H30vXL+jxMVsiQBuRkDN9NRfVU8VeTXzTVAWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F76ueKm3H30vXL+jxMVsiQBuRkDN9NRfVU8VeTXzTVAWg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gl8gV-EU61uyJWhdEpdzB3IXDvAxTSeS0Ne1Df5tf0I_1753345339
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_012225_837334_6F3774EA 
X-CRM114-Status: GOOD (  21.46  )
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

On Thu, Jul 24, 2025 at 10:14:36AM +0200, Stefano Garzarella wrote:
> CCing Will
> 
> On Thu, 24 Jul 2025 at 09:48, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Jul 23, 2025 at 08:04:42AM -0700, Breno Leitao wrote:
> > > Hello,
> > >
> > > I've seen a crash in linux-next for a while on my arm64 server, and
> > > I decided to report.
> > >
> > > While running stress-ng on linux-next, I see the crash below.
> > >
> > > This is happening in a kernel configure with some debug options (KASAN,
> > > LOCKDEP and KMEMLEAK).
> > >
> > > Basically running stress-ng in a loop would crash the host in 15-20
> > > minutes:
> > >       # while (true); do stress-ng -r 10 -t 10; done
> > >
> > > >From the early warning "virt_to_phys used for non-linear address",
> 
> mmm, we recently added nonlinear SKBs support in vhost-vsock [1],
> @Will can this issue be related?

Good point.

Breno, if bisecting is too much trouble, would you mind testing the commits
c76f3c4364fe523cd2782269eab92529c86217aa
and
c7991b44d7b44f9270dec63acd0b2965d29aab43
and telling us if this reproduces?


> I checked next-20250721 tag and I confirm that contains those changes.
> 
> [1] https://lore.kernel.org/virtualization/20250717090116.11987-1-will@kernel.org/
> 
> Thanks,
> Stefano
> 
> > > I suppose corrupted data is at vq->nheads.
> > >
> > > Here is the decoded stack against 9798752 ("Add linux-next specific
> > > files for 20250721")
> > >
> > >
> > >       [  620.685144] [ T250731] VFIO - User Level meta-driver version: 0.3
> > >       [  622.394448] [ T250254] ------------[ cut here ]------------
> > >       [  622.413492] [ T250254] virt_to_phys used for non-linear address: 000000006e69fe64 (0xcfcecdcccbcac9c8)
> > >       [  622.447771] [     T250254] WARNING: arch/arm64/mm/physaddr.c:15 at __virt_to_phys+0x64/0x90, CPU#57: stress-ng-dev/250254
> > >       [  622.487227] [ T250254] Modules linked in: vhost_vsock(E) vfio_iommu_type1(E) vfio(E) unix_diag(E) sch_fq(E) ghes_edac(E) tls(E) tcp_diag(E) inet_diag(E) act_gact(E) cls_bpf(E) nvidia_cspmu(E) ipmi_ssif(E) coresight_trbe(E) arm_cspmu_module(E) arm_smmuv3_pmu(E) ipmi_devintf(E) coresight_stm(E) coresight_funnel(E) coresight_etm4x(E) coresight_tmc(E) stm_core(E) ipmi_msghandler(E) coresight(E) cppc_cpufreq(E) sch_fq_codel(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) sm3_ce(E) sha3_ce(E) spi_tegra210_quad(E) vhost_net(E) tap(E) tun(E) vhost(E) vhost_iotlb(E) mpls_gso(E) mpls_iptunnel(E) mpls_router(E) fou(E) acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E) [last unloaded: test_bpf(E)]
> > >       [  622.734524] [ T250254] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [N]=TEST
> > >       [  622.734525] [ T250254] Hardware name: ...
> > >       [  622.734526] [ T250254] pstate: 63401009 (nZCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
> > >       [  622.734529] [     T250254] pc : __virt_to_phys (/home/user/Devel/linux-next/arch/arm64/mm/physaddr.c:?)
> > >       [  622.734531] [     T250254] lr : __virt_to_phys (/home/user/Devel/linux-next/arch/arm64/mm/physaddr.c:?)
> > >       [  622.734533] [ T250254] sp : ffff800158e8fc60
> > >       [  622.734534] [ T250254] x29: ffff800158e8fc60 x28: ffff0034a7cc7900 x27: 0000000000000000
> > >       [  622.734537] [ T250254] x26: 0000000000000000 x25: ffff0034a7cc7900 x24: 00000000040e001f
> > >       [  622.734539] [ T250254] x23: ffff0010858afb00 x22: cfcecdcccbcac9c8 x21: ffff0033526a01e0
> > >       [  622.734541] [ T250254] x20: 0000000000008000 x19: ffcecdcccbcac9c8 x18: ffff80008149c8e4
> > >       [  622.734543] [ T250254] x17: 0000000000000001 x16: 0000000000000000 x15: 0000000000000003
> > >       [  622.734545] [ T250254] x14: ffff800082962e78 x13: 0000000000000003 x12: ffff003bc6231630
> > >       [  622.734546] [ T250254] x11: 0000000000000000 x10: 0000000000000000 x9 : ed44a220ae716b00
> > >       [  622.734548] [ T250254] x8 : 0001000000000000 x7 : 0720072007200720 x6 : ffff80008018710c
> > >       [  622.734550] [ T250254] x5 : 0000000000000001 x4 : 00000090ecc72ac0 x3 : 0000000000000000
> > >       [  622.734552] [ T250254] x2 : 0000000000000000 x1 : ffff800081a72bc6 x0 : 000000000000004f
> > >       [  622.734554] [ T250254] Call trace:
> > >       [  622.734555] [     T250254] __virt_to_phys (/home/user/Devel/linux-next/arch/arm64/mm/physaddr.c:?) (P)
> > >       [  622.734557] [     T250254] kfree (/home/user/Devel/linux-next/./include/linux/mm.h:1180 /home/user/Devel/linux-next/mm/slub.c:4871)
> > >       [  622.734562] [     T250254] vhost_dev_cleanup (/home/user/Devel/linux-next/drivers/vhost/vhost.c:506 /home/user/Devel/linux-next/drivers/vhost/vhost.c:542 /home/user/Devel/linux-next/drivers/vhost/vhost.c:1214) vhost
> > >       [  622.734571] [     T250254] vhost_vsock_dev_release (/home/user/Devel/linux-next/drivers/vhost/vsock.c:756) vhost_vsock
> >
> >
> > Cc more vsock maintainers.
> >
> >
> >
> >
> > >       [  622.734575] [     T250254] __fput (/home/user/Devel/linux-next/fs/file_table.c:469)
> > >       [  622.734578] [     T250254] fput_close_sync (/home/user/Devel/linux-next/fs/file_table.c:?)
> > >       [  622.734579] [     T250254] __arm64_sys_close (/home/user/Devel/linux-next/fs/open.c:1589 /home/user/Devel/linux-next/fs/open.c:1572 /home/user/Devel/linux-next/fs/open.c:1572)
> > >       [  622.734584] [     T250254] invoke_syscall (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:50)
> > >       [  622.734589] [     T250254] el0_svc_common (/home/user/Devel/linux-next/./include/linux/thread_info.h:135 /home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:140)
> > >       [  622.734591] [     T250254] do_el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:152)
> > >       [  622.734594] [     T250254] el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:169 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:182 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:880)
> > >       [  622.734600] [     T250254] el0t_64_sync_handler (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:958)
> > >       [  622.734603] [     T250254] el0t_64_sync (/home/user/Devel/linux-next/arch/arm64/kernel/entry.S:596)
> > >       [  622.734605] [ T250254] irq event stamp: 0
> > >       [  622.734606] [     T250254] hardirqs last enabled at (0): 0x0
> > >       [  622.734610] [     T250254] hardirqs last disabled at (0): copy_process (/home/user/Devel/linux-next/kernel/fork.c:?)
> > >       [  622.734614] [     T250254] softirqs last enabled at (0): copy_process (/home/user/Devel/linux-next/kernel/fork.c:?)
> > >       [  622.734616] [     T250254] softirqs last disabled at (0): 0x0
> > >       [  622.734618] [ T250254] ---[ end trace 0000000000000000 ]---
> > >       [  622.734697] [ T250254] Unable to handle kernel paging request at virtual address 003ff3b33312f288
> > >       [  622.734700] [ T250254] Mem abort info:
> > >       [  622.734701] [ T250254]   ESR = 0x0000000096000004
> > >       [  622.734702] [ T250254]   EC = 0x25: DABT (current EL), IL = 32 bits
> > >       [  622.734704] [ T250254]   SET = 0, FnV = 0
> > >       [  622.734705] [ T250254]   EA = 0, S1PTW = 0
> > >       [  622.734706] [ T250254]   FSC = 0x04: level 0 translation fault
> > >       [  622.734708] [ T250254] Data abort info:
> > >       [  622.734709] [ T250254]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> > >       [  622.734711] [ T250254]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > >       [  622.734712] [ T250254]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > >       [  622.734713] [ T250254] [003ff3b33312f288] address between user and kernel address ranges
> > >       [  622.734715] [ T250254] Internal error: Oops: 0000000096000004 [#1]  SMP
> > >       [  622.734718] [ T250254] Modules linked in: vhost_vsock(E) vfio_iommu_type1(E) vfio(E) unix_diag(E) sch_fq(E) ghes_edac(E) tls(E) tcp_diag(E) inet_diag(E) act_gact(E) cls_bpf(E) nvidia_cspmu(E) ipmi_ssif(E) coresight_trbe(E) arm_cspmu_module(E) arm_smmuv3_pmu(E) ipmi_devintf(E) coresight_stm(E) coresight_funnel(E) coresight_etm4x(E) coresight_tmc(E) stm_core(E) ipmi_msghandler(E) coresight(E) cppc_cpufreq(E) sch_fq_codel(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) sm3_ce(E) sha3_ce(E) spi_tegra210_quad(E) vhost_net(E) tap(E) tun(E) vhost(E) vhost_iotlb(E) mpls_gso(E) mpls_iptunnel(E) mpls_router(E) fou(E) acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E) [last unloaded: test_bpf(E)]
> > >       [  622.734740] [ T250254] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [N]=TEST
> > >       [  622.734740] [ T250254] Hardware name: ...
> > >       [  622.734741] [ T250254] pstate: 63401009 (nZCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
> > >       [  622.734742] [     T250254] pc : kfree (/home/user/Devel/linux-next/./include/linux/page-flags.h:284 /home/user/Devel/linux-next/./include/linux/mm.h:1182 /home/user/Devel/linux-next/mm/slub.c:4871)
> > >       [  622.734745] [     T250254] lr : kfree (/home/user/Devel/linux-next/./include/linux/mm.h:1180 /home/user/Devel/linux-next/mm/slub.c:4871)
> > >       [  622.734747] [ T250254] sp : ffff800158e8fc80
> > >       [  622.734748] [ T250254] x29: ffff800158e8fc90 x28: ffff0034a7cc7900 x27: 0000000000000000
> > >       [  622.734749] [ T250254] x26: 0000000000000000 x25: ffff0034a7cc7900 x24: 00000000040e001f
> > >       [  622.734751] [ T250254] x23: ffff0010858afb00 x22: cfcecdcccbcac9c8 x21: ffff0033526a01e0
> > >       [  622.734752] [ T250254] x20: 003ff3b33312f280 x19: ffff80000acd1a20 x18: ffff80008149c8e4
> > >       [  622.734754] [ T250254] x17: 0000000000000001 x16: 0000000000000000 x15: 0000000000000003
> > >       [  622.734755] [ T250254] x14: ffff800082962e78 x13: 0000000000000003 x12: ffff003bc6231630
> > >       [  622.734757] [ T250254] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffdfc0000000
> > >       [  622.734758] [ T250254] x8 : 003ff3d37312f280 x7 : 0720072007200720 x6 : ffff80008018710c
> > >       [  622.734760] [ T250254] x5 : 0000000000000001 x4 : 00000090ecc72ac0 x3 : 0000000000000000
> > >       [  622.734761] [ T250254] x2 : 0000000000000000 x1 : ffff800081a72bc6 x0 : ffcf4dcccbcac9c8
> > >       [  622.734763] [ T250254] Call trace:
> > >       [  622.734763] [     T250254] kfree (/home/user/Devel/linux-next/./include/linux/page-flags.h:284 /home/user/Devel/linux-next/./include/linux/mm.h:1182 /home/user/Devel/linux-next/mm/slub.c:4871) (P)
> > >       [  622.734766] [     T250254] vhost_dev_cleanup (/home/user/Devel/linux-next/drivers/vhost/vhost.c:506 /home/user/Devel/linux-next/drivers/vhost/vhost.c:542 /home/user/Devel/linux-next/drivers/vhost/vhost.c:1214) vhost
> > >       [  622.734769] [     T250254] vhost_vsock_dev_release (/home/user/Devel/linux-next/drivers/vhost/vsock.c:756) vhost_vsock
> > >       [  622.734771] [     T250254] __fput (/home/user/Devel/linux-next/fs/file_table.c:469)
> > >       [  622.734772] [     T250254] fput_close_sync (/home/user/Devel/linux-next/fs/file_table.c:?)
> > >       [  622.734773] [     T250254] __arm64_sys_close (/home/user/Devel/linux-next/fs/open.c:1589 /home/user/Devel/linux-next/fs/open.c:1572 /home/user/Devel/linux-next/fs/open.c:1572)
> > >       [  622.734776] [     T250254] invoke_syscall (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:50)
> > >       [  622.734778] [     T250254] el0_svc_common (/home/user/Devel/linux-next/./include/linux/thread_info.h:135 /home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:140)
> > >       [  622.734781] [     T250254] do_el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:152)
> > >       [  622.734783] [     T250254] el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:169 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:182 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:880)
> > >       [  622.734787] [     T250254] el0t_64_sync_handler (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:958)
> > >       [  622.734790] [     T250254] el0t_64_sync (/home/user/Devel/linux-next/arch/arm64/kernel/entry.S:596)
> > >       [ 622.734792] [ T250254] Code: f2dffbe9 927abd08 cb141908 8b090114 (f9400688)
> > >       All code
> > >       ========
> > >       0:*     e9 fb df f2 08          jmp    0x8f2e000                <-- trapping instruction
> > >       5:      bd 7a 92 08 19          mov    $0x1908927a,%ebp
> > >       a:      14 cb                   adc    $0xcb,%al
> > >       c:      14 01                   adc    $0x1,%al
> > >       e:      09 8b 88 06 40 f9       or     %ecx,-0x6bff978(%rbx)
> > >
> > >       Code starting with the faulting instruction
> > >       ===========================================
> > >       0:      88 06                   mov    %al,(%rsi)
> > >       2:      40 f9                   rex stc
> > >       [  622.734795] [ T250254] SMP: stopping secondary CPUs
> > >       [  622.735089] [ T250254] Starting crashdump kernel...
> > >       [  622.735091] [ T250254] Bye!
> >


