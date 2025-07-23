Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1042BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 19:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMIsfZOyRyMzOBo1wO2mD6gc19dI0w5u0aQzZ8IdA3w=; b=D5oiLA5SF8SKUE80N6kaMHldSe
	UW7Im5/gCXq4P8zmTZkbJoKCCbkq6w64iJ14z3PglnvNDZwimmquOvJG2+199Yud1+/nPTpHV4Bwr
	7yyOPWSvLj3coHQmVivxx61ZGNqOqQC01X7c3SH7L5GzuZOwzrLGk9/m/ESxa+Gy41hJRgI1IDNq8
	jBK6/+IretaJoEt4Z7DDrNiH5jJdVMWWqaARbEg9fpsbr6YYdqPZQIG4jHOAxO/EfBHi5rJZJqGLN
	/eCPCJacTUuta7Rrayc0N4CUr+gymHihlkIYcjASdPOqHhMIIvITGssrux9X8+BTtSZwWGB5Kmg8P
	/9j//pYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueezl-00000005p9y-1nri;
	Wed, 23 Jul 2025 19:19:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueeqW-00000005oJ8-3Dus
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 19:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753297782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aMIsfZOyRyMzOBo1wO2mD6gc19dI0w5u0aQzZ8IdA3w=;
	b=O3aCAAvOEQLa4G60ffG2y928Z1km8qjGKk7j02VfJYdm6Q4Nsjw6+Q7ZHz8iUsFTy7z/0w
	GhWm3ztXblwo4eBg/rTM7/s3D21oBdUrAj+d7HlKXqyS96jDxQk9R7hKCPKVR0MJKRMCDT
	FcCqUatpChgnpBip/WVR+lYOP0PeKoU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-DAmRWzlUP_eb9_DGxO6zzQ-1; Wed, 23 Jul 2025 15:09:40 -0400
X-MC-Unique: DAmRWzlUP_eb9_DGxO6zzQ-1
X-Mimecast-MFC-AGG-ID: DAmRWzlUP_eb9_DGxO6zzQ_1753297779
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4561611dc2aso1256565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 12:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297779; x=1753902579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMIsfZOyRyMzOBo1wO2mD6gc19dI0w5u0aQzZ8IdA3w=;
        b=A7qWO0MhsxKR/yetalmJMrHJNG522kn8Md5wC6aSfD5kUn8Ben13s7Foj6VpndwvAu
         D4jSGxYQHYtFHE8bTjRQFPDLc64LS1sVaEvD+On2Q1+gleC3o36vraWLOWpvcDRGOEMC
         Q5CkqQRteYJdyF0/J4CQ+bkFnaF4GlF/VvFOImC7qOOD+aUxkh9PvwSk8yG2GDnG21Ly
         YG/t7WHwJUf3kF5NkYWX8m5Z16at+RinrAFQ+u27jviEdGHzv3qHg+6lDoIIzeHWalXC
         RoiolrnIwTHVu47W3/yPA73RPeVJxad/HgDNMnKUCKs9J+3+wuAyqRxe2f0o5SHlE1E8
         sUJA==
X-Forwarded-Encrypted: i=1; AJvYcCVpLWpOQeWos5GM0JxYoLE2D1Uksvh9a0nc8UQ6nKdL+I8qRT5UQ9WbkCRDdL2lgq6lsf/PNoVS3t5VULhd2baL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Wx54L96pA/kBavLB45Ce5muyf3NrUo1Ba0VO2IUOT3R4Eigt
	H9gnTLtXRp6bjoiGjU9Y6uf02JZT2pWikrOaNY/j5tUvi6uKK241eQ8l8PsTDjKIy+po83m+LUA
	5sdC+Qp8lw7nPbP3F6NhFlv2cONCAu3oQyQ3W0Z4Qdp2fHzH72M4iPkmB0VlDbdxpxEVL4QuKFn
	+W
X-Gm-Gg: ASbGncuOVG2HQ4f/1tp5GGCxi/o7TTPyJrYINcmOHpinf1X/NLaK7XuH5yysE/Y3rMy
	l87CBOq5wrVpFULMjQVr4u5PjWJTO6+U1wqdX+hO2qAhEnr8EjaO+tJqwPsgMLtMCpngeROyk8S
	KjWKYryx7/4PPpT5SqFgo6060pPElIzJi2Qm9ymIpO5QzaVZBRxdVBSQ5gl1A7nNeMhOPw2DHNs
	taYAVM6FCHC9Uix6o1Sm2zrC0eTpQZQy2wgz/6A1jJK7OY9GhlIgpDFPtNclOdWhJd/SPAbNqs7
	4AUAh9Ie6tYs4+kv4qfINbClUQxeTV83vns=
X-Received: by 2002:a05:600c:350c:b0:456:1442:854 with SMTP id 5b1f17b1804b1-45868d5385amr34055335e9.24.1753297778759;
        Wed, 23 Jul 2025 12:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2v9eydnHQHzJndZfx4Oj5eR2t7RnQW1BFQccHGZ9wXBkgwbcJyAkBzpoz7WbqYatn0JJs8g==
X-Received: by 2002:a05:600c:350c:b0:456:1442:854 with SMTP id 5b1f17b1804b1-45868d5385amr34055005e9.24.1753297778242;
        Wed, 23 Jul 2025 12:09:38 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:153d:b500:b346:7481:16b2:6b23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586eef77e8sm2785e9.3.2025.07.23.12.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 12:09:37 -0700 (PDT)
Date: Wed, 23 Jul 2025 15:09:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Breno Leitao <leitao@debian.org>
Cc: jasowang@redhat.com, eperezma@redhat.com,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Subject: Re: vhost: linux-next: crash at vhost_dev_cleanup()
Message-ID: <20250723150907-mutt-send-email-mst@kernel.org>
References: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c>
MIME-Version: 1.0
In-Reply-To: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2D_VbF0nMnrq_hqKbpzXjprAegT53ZjsDZwTbcFWgXI_1753297779
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_120945_304632_FA8BCC15 
X-CRM114-Status: GOOD (  17.61  )
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

On Wed, Jul 23, 2025 at 08:04:42AM -0700, Breno Leitao wrote:
> Hello,
> 
> I've seen a crash in linux-next for a while on my arm64 server, and
> I decided to report.
> 
> While running stress-ng on linux-next, I see the crash below.
> 
> This is happening in a kernel configure with some debug options (KASAN,
> LOCKDEP and KMEMLEAK).


Thanks for the report!
Any chance of a bisect?
Much appreciated.

> Basically running stress-ng in a loop would crash the host in 15-20
> minutes:
> 	# while (true); do stress-ng -r 10 -t 10; done
> 	
> >From the early warning "virt_to_phys used for non-linear address",
> I suppose corrupted data is at vq->nheads.
> 
> Here is the decoded stack against 9798752 ("Add linux-next specific
> files for 20250721")
> 
> 
> 	[  620.685144] [ T250731] VFIO - User Level meta-driver version: 0.3
> 	[  622.394448] [ T250254] ------------[ cut here ]------------
> 	[  622.413492] [ T250254] virt_to_phys used for non-linear address: 000000006e69fe64 (0xcfcecdcccbcac9c8)
> 	[  622.447771] [     T250254] WARNING: arch/arm64/mm/physaddr.c:15 at __virt_to_phys+0x64/0x90, CPU#57: stress-ng-dev/250254 
> 	[  622.487227] [ T250254] Modules linked in: vhost_vsock(E) vfio_iommu_type1(E) vfio(E) unix_diag(E) sch_fq(E) ghes_edac(E) tls(E) tcp_diag(E) inet_diag(E) act_gact(E) cls_bpf(E) nvidia_cspmu(E) ipmi_ssif(E) coresight_trbe(E) arm_cspmu_module(E) arm_smmuv3_pmu(E) ipmi_devintf(E) coresight_stm(E) coresight_funnel(E) coresight_etm4x(E) coresight_tmc(E) stm_core(E) ipmi_msghandler(E) coresight(E) cppc_cpufreq(E) sch_fq_codel(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) sm3_ce(E) sha3_ce(E) spi_tegra210_quad(E) vhost_net(E) tap(E) tun(E) vhost(E) vhost_iotlb(E) mpls_gso(E) mpls_iptunnel(E) mpls_router(E) fou(E) acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E) [last unloaded: test_bpf(E)]
> 	[  622.734524] [ T250254] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [N]=TEST
> 	[  622.734525] [ T250254] Hardware name: ...
> 	[  622.734526] [ T250254] pstate: 63401009 (nZCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
> 	[  622.734529] [     T250254] pc : __virt_to_phys (/home/user/Devel/linux-next/arch/arm64/mm/physaddr.c:?) 
> 	[  622.734531] [     T250254] lr : __virt_to_phys (/home/user/Devel/linux-next/arch/arm64/mm/physaddr.c:?) 
> 	[  622.734533] [ T250254] sp : ffff800158e8fc60
> 	[  622.734534] [ T250254] x29: ffff800158e8fc60 x28: ffff0034a7cc7900 x27: 0000000000000000
> 	[  622.734537] [ T250254] x26: 0000000000000000 x25: ffff0034a7cc7900 x24: 00000000040e001f
> 	[  622.734539] [ T250254] x23: ffff0010858afb00 x22: cfcecdcccbcac9c8 x21: ffff0033526a01e0
> 	[  622.734541] [ T250254] x20: 0000000000008000 x19: ffcecdcccbcac9c8 x18: ffff80008149c8e4
> 	[  622.734543] [ T250254] x17: 0000000000000001 x16: 0000000000000000 x15: 0000000000000003
> 	[  622.734545] [ T250254] x14: ffff800082962e78 x13: 0000000000000003 x12: ffff003bc6231630
> 	[  622.734546] [ T250254] x11: 0000000000000000 x10: 0000000000000000 x9 : ed44a220ae716b00
> 	[  622.734548] [ T250254] x8 : 0001000000000000 x7 : 0720072007200720 x6 : ffff80008018710c
> 	[  622.734550] [ T250254] x5 : 0000000000000001 x4 : 00000090ecc72ac0 x3 : 0000000000000000
> 	[  622.734552] [ T250254] x2 : 0000000000000000 x1 : ffff800081a72bc6 x0 : 000000000000004f
> 	[  622.734554] [ T250254] Call trace:
> 	[  622.734555] [     T250254] __virt_to_phys (/home/user/Devel/linux-next/arch/arm64/mm/physaddr.c:?) (P)
> 	[  622.734557] [     T250254] kfree (/home/user/Devel/linux-next/./include/linux/mm.h:1180 /home/user/Devel/linux-next/mm/slub.c:4871) 
> 	[  622.734562] [     T250254] vhost_dev_cleanup (/home/user/Devel/linux-next/drivers/vhost/vhost.c:506 /home/user/Devel/linux-next/drivers/vhost/vhost.c:542 /home/user/Devel/linux-next/drivers/vhost/vhost.c:1214) vhost 
> 	[  622.734571] [     T250254] vhost_vsock_dev_release (/home/user/Devel/linux-next/drivers/vhost/vsock.c:756) vhost_vsock 
> 	[  622.734575] [     T250254] __fput (/home/user/Devel/linux-next/fs/file_table.c:469) 
> 	[  622.734578] [     T250254] fput_close_sync (/home/user/Devel/linux-next/fs/file_table.c:?) 
> 	[  622.734579] [     T250254] __arm64_sys_close (/home/user/Devel/linux-next/fs/open.c:1589 /home/user/Devel/linux-next/fs/open.c:1572 /home/user/Devel/linux-next/fs/open.c:1572) 
> 	[  622.734584] [     T250254] invoke_syscall (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:50) 
> 	[  622.734589] [     T250254] el0_svc_common (/home/user/Devel/linux-next/./include/linux/thread_info.h:135 /home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:140) 
> 	[  622.734591] [     T250254] do_el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:152) 
> 	[  622.734594] [     T250254] el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:169 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:182 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:880) 
> 	[  622.734600] [     T250254] el0t_64_sync_handler (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:958) 
> 	[  622.734603] [     T250254] el0t_64_sync (/home/user/Devel/linux-next/arch/arm64/kernel/entry.S:596) 
> 	[  622.734605] [ T250254] irq event stamp: 0
> 	[  622.734606] [     T250254] hardirqs last enabled at (0): 0x0 
> 	[  622.734610] [     T250254] hardirqs last disabled at (0): copy_process (/home/user/Devel/linux-next/kernel/fork.c:?) 
> 	[  622.734614] [     T250254] softirqs last enabled at (0): copy_process (/home/user/Devel/linux-next/kernel/fork.c:?) 
> 	[  622.734616] [     T250254] softirqs last disabled at (0): 0x0 
> 	[  622.734618] [ T250254] ---[ end trace 0000000000000000 ]---
> 	[  622.734697] [ T250254] Unable to handle kernel paging request at virtual address 003ff3b33312f288
> 	[  622.734700] [ T250254] Mem abort info:
> 	[  622.734701] [ T250254]   ESR = 0x0000000096000004
> 	[  622.734702] [ T250254]   EC = 0x25: DABT (current EL), IL = 32 bits
> 	[  622.734704] [ T250254]   SET = 0, FnV = 0
> 	[  622.734705] [ T250254]   EA = 0, S1PTW = 0
> 	[  622.734706] [ T250254]   FSC = 0x04: level 0 translation fault
> 	[  622.734708] [ T250254] Data abort info:
> 	[  622.734709] [ T250254]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> 	[  622.734711] [ T250254]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> 	[  622.734712] [ T250254]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> 	[  622.734713] [ T250254] [003ff3b33312f288] address between user and kernel address ranges
> 	[  622.734715] [ T250254] Internal error: Oops: 0000000096000004 [#1]  SMP
> 	[  622.734718] [ T250254] Modules linked in: vhost_vsock(E) vfio_iommu_type1(E) vfio(E) unix_diag(E) sch_fq(E) ghes_edac(E) tls(E) tcp_diag(E) inet_diag(E) act_gact(E) cls_bpf(E) nvidia_cspmu(E) ipmi_ssif(E) coresight_trbe(E) arm_cspmu_module(E) arm_smmuv3_pmu(E) ipmi_devintf(E) coresight_stm(E) coresight_funnel(E) coresight_etm4x(E) coresight_tmc(E) stm_core(E) ipmi_msghandler(E) coresight(E) cppc_cpufreq(E) sch_fq_codel(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) sm3_ce(E) sha3_ce(E) spi_tegra210_quad(E) vhost_net(E) tap(E) tun(E) vhost(E) vhost_iotlb(E) mpls_gso(E) mpls_iptunnel(E) mpls_router(E) fou(E) acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E) [last unloaded: test_bpf(E)]
> 	[  622.734740] [ T250254] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [N]=TEST
> 	[  622.734740] [ T250254] Hardware name: ...
> 	[  622.734741] [ T250254] pstate: 63401009 (nZCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
> 	[  622.734742] [     T250254] pc : kfree (/home/user/Devel/linux-next/./include/linux/page-flags.h:284 /home/user/Devel/linux-next/./include/linux/mm.h:1182 /home/user/Devel/linux-next/mm/slub.c:4871) 
> 	[  622.734745] [     T250254] lr : kfree (/home/user/Devel/linux-next/./include/linux/mm.h:1180 /home/user/Devel/linux-next/mm/slub.c:4871) 
> 	[  622.734747] [ T250254] sp : ffff800158e8fc80
> 	[  622.734748] [ T250254] x29: ffff800158e8fc90 x28: ffff0034a7cc7900 x27: 0000000000000000
> 	[  622.734749] [ T250254] x26: 0000000000000000 x25: ffff0034a7cc7900 x24: 00000000040e001f
> 	[  622.734751] [ T250254] x23: ffff0010858afb00 x22: cfcecdcccbcac9c8 x21: ffff0033526a01e0
> 	[  622.734752] [ T250254] x20: 003ff3b33312f280 x19: ffff80000acd1a20 x18: ffff80008149c8e4
> 	[  622.734754] [ T250254] x17: 0000000000000001 x16: 0000000000000000 x15: 0000000000000003
> 	[  622.734755] [ T250254] x14: ffff800082962e78 x13: 0000000000000003 x12: ffff003bc6231630
> 	[  622.734757] [ T250254] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffdfc0000000
> 	[  622.734758] [ T250254] x8 : 003ff3d37312f280 x7 : 0720072007200720 x6 : ffff80008018710c
> 	[  622.734760] [ T250254] x5 : 0000000000000001 x4 : 00000090ecc72ac0 x3 : 0000000000000000
> 	[  622.734761] [ T250254] x2 : 0000000000000000 x1 : ffff800081a72bc6 x0 : ffcf4dcccbcac9c8
> 	[  622.734763] [ T250254] Call trace:
> 	[  622.734763] [     T250254] kfree (/home/user/Devel/linux-next/./include/linux/page-flags.h:284 /home/user/Devel/linux-next/./include/linux/mm.h:1182 /home/user/Devel/linux-next/mm/slub.c:4871) (P)
> 	[  622.734766] [     T250254] vhost_dev_cleanup (/home/user/Devel/linux-next/drivers/vhost/vhost.c:506 /home/user/Devel/linux-next/drivers/vhost/vhost.c:542 /home/user/Devel/linux-next/drivers/vhost/vhost.c:1214) vhost 
> 	[  622.734769] [     T250254] vhost_vsock_dev_release (/home/user/Devel/linux-next/drivers/vhost/vsock.c:756) vhost_vsock 
> 	[  622.734771] [     T250254] __fput (/home/user/Devel/linux-next/fs/file_table.c:469) 
> 	[  622.734772] [     T250254] fput_close_sync (/home/user/Devel/linux-next/fs/file_table.c:?) 
> 	[  622.734773] [     T250254] __arm64_sys_close (/home/user/Devel/linux-next/fs/open.c:1589 /home/user/Devel/linux-next/fs/open.c:1572 /home/user/Devel/linux-next/fs/open.c:1572) 
> 	[  622.734776] [     T250254] invoke_syscall (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:50) 
> 	[  622.734778] [     T250254] el0_svc_common (/home/user/Devel/linux-next/./include/linux/thread_info.h:135 /home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:140) 
> 	[  622.734781] [     T250254] do_el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/syscall.c:152) 
> 	[  622.734783] [     T250254] el0_svc (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:169 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:182 /home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:880) 
> 	[  622.734787] [     T250254] el0t_64_sync_handler (/home/user/Devel/linux-next/arch/arm64/kernel/entry-common.c:958) 
> 	[  622.734790] [     T250254] el0t_64_sync (/home/user/Devel/linux-next/arch/arm64/kernel/entry.S:596) 
> 	[ 622.734792] [ T250254] Code: f2dffbe9 927abd08 cb141908 8b090114 (f9400688)
> 	All code
> 	========
> 	0:*	e9 fb df f2 08       	jmp    0x8f2e000		<-- trapping instruction
> 	5:	bd 7a 92 08 19       	mov    $0x1908927a,%ebp
> 	a:	14 cb                	adc    $0xcb,%al
> 	c:	14 01                	adc    $0x1,%al
> 	e:	09 8b 88 06 40 f9    	or     %ecx,-0x6bff978(%rbx)
> 
> 	Code starting with the faulting instruction
> 	===========================================
> 	0:	88 06                	mov    %al,(%rsi)
> 	2:	40 f9                	rex stc 
> 	[  622.734795] [ T250254] SMP: stopping secondary CPUs
> 	[  622.735089] [ T250254] Starting crashdump kernel...
> 	[  622.735091] [ T250254] Bye!


