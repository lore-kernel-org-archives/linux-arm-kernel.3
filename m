Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AB8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJ02ByKeKesw6MmLXs1z5moyb7EKOu1a28e6JM2JXDQ=; b=oqH+ewrLih8WoaDvq1N+sVnHx0
	x12swWyWr98hzZr6OPkhU9yET9N/7FVKjKicvoz2yQ7RLAYM681QuH+XGvsBp/Ki7C9muBjJx+H9M
	s1lxZTKJ7XTCP5cJHlF6WDYK3DedebYOJrmSjmVgCkRtOpv5sEjBjOcxqveFegp97F8my8nLz3YSx
	a3OrRRAgBEJ6brS4ot5+xa9aktSvzSDUvI3d+yVh6h+vvIfa7R5Qv7JJ+qoAfK4RgicaCXSB/CH19
	VL/VR4CfnfwIhQrDlC42GbKMGHMRWqX22WBNkAkKQAfbjgPI/49O+kEOuLEVMIP9Rz4cirlX7HTyR
	t8OQY5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ues5R-000000070ow-00o3;
	Thu, 24 Jul 2025 09:18:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uer6K-00000006pA0-2UdA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753344890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJ02ByKeKesw6MmLXs1z5moyb7EKOu1a28e6JM2JXDQ=;
	b=SjuvBQkLhhu+2iIGbIABYhvxhZBZxzdpClnCwz6djK4sg4bkXUa/BlqKhFMpbvQRDBCl/u
	h/1fwvQWWLkNsYK2KqhsJLAd01nOeZNEttkbtEcFDXe2LjlsV8DH5Mje/Nl0Cug89mRdpq
	EVSeOLOmCVbHd46dgCPTf0iTKxCd5GI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-Io1A029-PTydj-GrKHchGQ-1; Thu, 24 Jul 2025 04:14:49 -0400
X-MC-Unique: Io1A029-PTydj-GrKHchGQ-1
X-Mimecast-MFC-AGG-ID: Io1A029-PTydj-GrKHchGQ_1753344889
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e73d3c474so11284187b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 01:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753344889; x=1753949689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJ02ByKeKesw6MmLXs1z5moyb7EKOu1a28e6JM2JXDQ=;
        b=Db6qijUILcJtWFX3TXEuAGd1cultCv4CgWvMZCUF7qi7fEersxSQ4XGz+ZbCeH9JFA
         Il+QAB30xmtiSREy5siaDa6qCz3PawcZE+FB2nKkjAx0B7AzIhnLCV+oKjDgnE+qK8Lk
         VgOe3OvVOw532b1DhSCgesY3dPjGRN5yD3QJJLPxLk/4T9bUTlZNnB0Us75ROyxGmh5W
         HXDWthJlcouXA6UgfSE7fTpiU7mHcN1spuaEKuLjXtXNMF4YwyvEHrQJBlNAR8vucL74
         uxEdylcfRFvje/1kQ9UfsLVzeTcUTGjesMEFgPaB9udBUUJsiiThbB3ms0Bz3iewO36T
         I0mw==
X-Forwarded-Encrypted: i=1; AJvYcCVKDAFdUWqrRWaOGXP+eJgF6NNzpVnwgUEA+knAug1DElW0ij5qbtoEC3ItgC8tBQIEYnB+nKgzN+atDN4KWvho@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv+kVo87FCpIj7ylUFgHHn/bDo52P7BgQn4RE4RBzr16rryM4E
	SAaF1ew5mmMEXFWO5HMsb2cQBeU15ZNdBYNrLRUUxNRxTvq72H3R0IyOBVRLZO257M19wZNDv10
	VZQu9yaPP+F5onl2Jv6ayas0wGrQi/aErI/FVqBa9uV+2bZCEFAI2+LiwBC5zIGSa4w/qaD6QP+
	B4zNbdhZHWUHQoebRulJTgRgaRAvXzKVYGS9mvyMgNlouA9Bubvgs=
X-Gm-Gg: ASbGncsJmGJw2OJQv3g7ZcqXcXGX6+5hQdvbqoIboRgJse8c5sGg4sChQ/3NDMNG/A6
	spSo97i3akqY2lq4WYrUF/gTlIM7d1OdDB5FKWGoB7VGuLZ1wGtXvQ2ZgcCvMuKQqn9N1tE21YI
	zTItBOeBAdTdejA+y4dmqR
X-Received: by 2002:a05:690c:314:b0:70d:ed5d:b4b2 with SMTP id 00721157ae682-719b41694d2mr79268507b3.13.1753344888531;
        Thu, 24 Jul 2025 01:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPvKRyNZLxuZc2LCwPGxrFyYTVxsjT7roo0HAnWfJQl2Ut22h5DTHOWlu7sekIJonGE+l2+DrYFw6tPUZf8IY=
X-Received: by 2002:a05:690c:314:b0:70d:ed5d:b4b2 with SMTP id
 00721157ae682-719b41694d2mr79268197b3.13.1753344887977; Thu, 24 Jul 2025
 01:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c> <20250724034659-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250724034659-mutt-send-email-mst@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 24 Jul 2025 10:14:36 +0200
X-Gm-Features: Ac12FXzqfSEj1dVrbaSJdrllq6HfeMDxFTLlI3oLSZh4ILH_YbA_CktsAqGaAiE
Message-ID: <CAGxU2F76ueKm3H30vXL+jxMVsiQBuRkDN9NRfVU8VeTXzTVAWg@mail.gmail.com>
Subject: Re: vhost: linux-next: crash at vhost_dev_cleanup()
To: "Michael S. Tsirkin" <mst@redhat.com>, Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, jasowang@redhat.com, eperezma@redhat.com, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, netdev@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A5zmfSSGUCGOJsihCGJNXLKKk535_eb8XHOPjtN1MpM_1753344889
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_011452_780637_2915798C 
X-CRM114-Status: GOOD (  17.43  )
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

CCing Will

On Thu, 24 Jul 2025 at 09:48, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jul 23, 2025 at 08:04:42AM -0700, Breno Leitao wrote:
> > Hello,
> >
> > I've seen a crash in linux-next for a while on my arm64 server, and
> > I decided to report.
> >
> > While running stress-ng on linux-next, I see the crash below.
> >
> > This is happening in a kernel configure with some debug options (KASAN,
> > LOCKDEP and KMEMLEAK).
> >
> > Basically running stress-ng in a loop would crash the host in 15-20
> > minutes:
> >       # while (true); do stress-ng -r 10 -t 10; done
> >
> > >From the early warning "virt_to_phys used for non-linear address",

mmm, we recently added nonlinear SKBs support in vhost-vsock [1],
@Will can this issue be related?

I checked next-20250721 tag and I confirm that contains those changes.

[1] https://lore.kernel.org/virtualization/20250717090116.11987-1-will@kern=
el.org/

Thanks,
Stefano

> > I suppose corrupted data is at vq->nheads.
> >
> > Here is the decoded stack against 9798752 ("Add linux-next specific
> > files for 20250721")
> >
> >
> >       [  620.685144] [ T250731] VFIO - User Level meta-driver version: =
0.3
> >       [  622.394448] [ T250254] ------------[ cut here ]------------
> >       [  622.413492] [ T250254] virt_to_phys used for non-linear addres=
s: 000000006e69fe64 (0xcfcecdcccbcac9c8)
> >       [  622.447771] [     T250254] WARNING: arch/arm64/mm/physaddr.c:1=
5 at __virt_to_phys+0x64/0x90, CPU#57: stress-ng-dev/250254
> >       [  622.487227] [ T250254] Modules linked in: vhost_vsock(E) vfio_=
iommu_type1(E) vfio(E) unix_diag(E) sch_fq(E) ghes_edac(E) tls(E) tcp_diag(=
E) inet_diag(E) act_gact(E) cls_bpf(E) nvidia_cspmu(E) ipmi_ssif(E) coresig=
ht_trbe(E) arm_cspmu_module(E) arm_smmuv3_pmu(E) ipmi_devintf(E) coresight_=
stm(E) coresight_funnel(E) coresight_etm4x(E) coresight_tmc(E) stm_core(E) =
ipmi_msghandler(E) coresight(E) cppc_cpufreq(E) sch_fq_codel(E) drm(E) back=
light(E) drm_panel_orientation_quirks(E) sm3_ce(E) sha3_ce(E) spi_tegra210_=
quad(E) vhost_net(E) tap(E) tun(E) vhost(E) vhost_iotlb(E) mpls_gso(E) mpls=
_iptunnel(E) mpls_router(E) fou(E) acpi_power_meter(E) loop(E) efivarfs(E) =
autofs4(E) [last unloaded: test_bpf(E)]
> >       [  622.734524] [ T250254] Tainted: [W]=3DWARN, [E]=3DUNSIGNED_MOD=
ULE, [N]=3DTEST
> >       [  622.734525] [ T250254] Hardware name: ...
> >       [  622.734526] [ T250254] pstate: 63401009 (nZCv daif +PAN -UAO +=
TCO +DIT +SSBS BTYPE=3D--)
> >       [  622.734529] [     T250254] pc : __virt_to_phys (/home/user/Dev=
el/linux-next/arch/arm64/mm/physaddr.c:?)
> >       [  622.734531] [     T250254] lr : __virt_to_phys (/home/user/Dev=
el/linux-next/arch/arm64/mm/physaddr.c:?)
> >       [  622.734533] [ T250254] sp : ffff800158e8fc60
> >       [  622.734534] [ T250254] x29: ffff800158e8fc60 x28: ffff0034a7cc=
7900 x27: 0000000000000000
> >       [  622.734537] [ T250254] x26: 0000000000000000 x25: ffff0034a7cc=
7900 x24: 00000000040e001f
> >       [  622.734539] [ T250254] x23: ffff0010858afb00 x22: cfcecdcccbca=
c9c8 x21: ffff0033526a01e0
> >       [  622.734541] [ T250254] x20: 0000000000008000 x19: ffcecdcccbca=
c9c8 x18: ffff80008149c8e4
> >       [  622.734543] [ T250254] x17: 0000000000000001 x16: 000000000000=
0000 x15: 0000000000000003
> >       [  622.734545] [ T250254] x14: ffff800082962e78 x13: 000000000000=
0003 x12: ffff003bc6231630
> >       [  622.734546] [ T250254] x11: 0000000000000000 x10: 000000000000=
0000 x9 : ed44a220ae716b00
> >       [  622.734548] [ T250254] x8 : 0001000000000000 x7 : 072007200720=
0720 x6 : ffff80008018710c
> >       [  622.734550] [ T250254] x5 : 0000000000000001 x4 : 00000090ecc7=
2ac0 x3 : 0000000000000000
> >       [  622.734552] [ T250254] x2 : 0000000000000000 x1 : ffff800081a7=
2bc6 x0 : 000000000000004f
> >       [  622.734554] [ T250254] Call trace:
> >       [  622.734555] [     T250254] __virt_to_phys (/home/user/Devel/li=
nux-next/arch/arm64/mm/physaddr.c:?) (P)
> >       [  622.734557] [     T250254] kfree (/home/user/Devel/linux-next/=
./include/linux/mm.h:1180 /home/user/Devel/linux-next/mm/slub.c:4871)
> >       [  622.734562] [     T250254] vhost_dev_cleanup (/home/user/Devel=
/linux-next/drivers/vhost/vhost.c:506 /home/user/Devel/linux-next/drivers/v=
host/vhost.c:542 /home/user/Devel/linux-next/drivers/vhost/vhost.c:1214) vh=
ost
> >       [  622.734571] [     T250254] vhost_vsock_dev_release (/home/user=
/Devel/linux-next/drivers/vhost/vsock.c:756) vhost_vsock
>
>
> Cc more vsock maintainers.
>
>
>
>
> >       [  622.734575] [     T250254] __fput (/home/user/Devel/linux-next=
/fs/file_table.c:469)
> >       [  622.734578] [     T250254] fput_close_sync (/home/user/Devel/l=
inux-next/fs/file_table.c:?)
> >       [  622.734579] [     T250254] __arm64_sys_close (/home/user/Devel=
/linux-next/fs/open.c:1589 /home/user/Devel/linux-next/fs/open.c:1572 /home=
/user/Devel/linux-next/fs/open.c:1572)
> >       [  622.734584] [     T250254] invoke_syscall (/home/user/Devel/li=
nux-next/arch/arm64/kernel/syscall.c:50)
> >       [  622.734589] [     T250254] el0_svc_common (/home/user/Devel/li=
nux-next/./include/linux/thread_info.h:135 /home/user/Devel/linux-next/arch=
/arm64/kernel/syscall.c:140)
> >       [  622.734591] [     T250254] do_el0_svc (/home/user/Devel/linux-=
next/arch/arm64/kernel/syscall.c:152)
> >       [  622.734594] [     T250254] el0_svc (/home/user/Devel/linux-nex=
t/arch/arm64/kernel/entry-common.c:169 /home/user/Devel/linux-next/arch/arm=
64/kernel/entry-common.c:182 /home/user/Devel/linux-next/arch/arm64/kernel/=
entry-common.c:880)
> >       [  622.734600] [     T250254] el0t_64_sync_handler (/home/user/De=
vel/linux-next/arch/arm64/kernel/entry-common.c:958)
> >       [  622.734603] [     T250254] el0t_64_sync (/home/user/Devel/linu=
x-next/arch/arm64/kernel/entry.S:596)
> >       [  622.734605] [ T250254] irq event stamp: 0
> >       [  622.734606] [     T250254] hardirqs last enabled at (0): 0x0
> >       [  622.734610] [     T250254] hardirqs last disabled at (0): copy=
_process (/home/user/Devel/linux-next/kernel/fork.c:?)
> >       [  622.734614] [     T250254] softirqs last enabled at (0): copy_=
process (/home/user/Devel/linux-next/kernel/fork.c:?)
> >       [  622.734616] [     T250254] softirqs last disabled at (0): 0x0
> >       [  622.734618] [ T250254] ---[ end trace 0000000000000000 ]---
> >       [  622.734697] [ T250254] Unable to handle kernel paging request =
at virtual address 003ff3b33312f288
> >       [  622.734700] [ T250254] Mem abort info:
> >       [  622.734701] [ T250254]   ESR =3D 0x0000000096000004
> >       [  622.734702] [ T250254]   EC =3D 0x25: DABT (current EL), IL =
=3D 32 bits
> >       [  622.734704] [ T250254]   SET =3D 0, FnV =3D 0
> >       [  622.734705] [ T250254]   EA =3D 0, S1PTW =3D 0
> >       [  622.734706] [ T250254]   FSC =3D 0x04: level 0 translation fau=
lt
> >       [  622.734708] [ T250254] Data abort info:
> >       [  622.734709] [ T250254]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =
=3D 0x00000000
> >       [  622.734711] [ T250254]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAc=
cess =3D 0
> >       [  622.734712] [ T250254]   GCS =3D 0, Overlay =3D 0, DirtyBit =
=3D 0, Xs =3D 0
> >       [  622.734713] [ T250254] [003ff3b33312f288] address between user=
 and kernel address ranges
> >       [  622.734715] [ T250254] Internal error: Oops: 0000000096000004 =
[#1]  SMP
> >       [  622.734718] [ T250254] Modules linked in: vhost_vsock(E) vfio_=
iommu_type1(E) vfio(E) unix_diag(E) sch_fq(E) ghes_edac(E) tls(E) tcp_diag(=
E) inet_diag(E) act_gact(E) cls_bpf(E) nvidia_cspmu(E) ipmi_ssif(E) coresig=
ht_trbe(E) arm_cspmu_module(E) arm_smmuv3_pmu(E) ipmi_devintf(E) coresight_=
stm(E) coresight_funnel(E) coresight_etm4x(E) coresight_tmc(E) stm_core(E) =
ipmi_msghandler(E) coresight(E) cppc_cpufreq(E) sch_fq_codel(E) drm(E) back=
light(E) drm_panel_orientation_quirks(E) sm3_ce(E) sha3_ce(E) spi_tegra210_=
quad(E) vhost_net(E) tap(E) tun(E) vhost(E) vhost_iotlb(E) mpls_gso(E) mpls=
_iptunnel(E) mpls_router(E) fou(E) acpi_power_meter(E) loop(E) efivarfs(E) =
autofs4(E) [last unloaded: test_bpf(E)]
> >       [  622.734740] [ T250254] Tainted: [W]=3DWARN, [E]=3DUNSIGNED_MOD=
ULE, [N]=3DTEST
> >       [  622.734740] [ T250254] Hardware name: ...
> >       [  622.734741] [ T250254] pstate: 63401009 (nZCv daif +PAN -UAO +=
TCO +DIT +SSBS BTYPE=3D--)
> >       [  622.734742] [     T250254] pc : kfree (/home/user/Devel/linux-=
next/./include/linux/page-flags.h:284 /home/user/Devel/linux-next/./include=
/linux/mm.h:1182 /home/user/Devel/linux-next/mm/slub.c:4871)
> >       [  622.734745] [     T250254] lr : kfree (/home/user/Devel/linux-=
next/./include/linux/mm.h:1180 /home/user/Devel/linux-next/mm/slub.c:4871)
> >       [  622.734747] [ T250254] sp : ffff800158e8fc80
> >       [  622.734748] [ T250254] x29: ffff800158e8fc90 x28: ffff0034a7cc=
7900 x27: 0000000000000000
> >       [  622.734749] [ T250254] x26: 0000000000000000 x25: ffff0034a7cc=
7900 x24: 00000000040e001f
> >       [  622.734751] [ T250254] x23: ffff0010858afb00 x22: cfcecdcccbca=
c9c8 x21: ffff0033526a01e0
> >       [  622.734752] [ T250254] x20: 003ff3b33312f280 x19: ffff80000acd=
1a20 x18: ffff80008149c8e4
> >       [  622.734754] [ T250254] x17: 0000000000000001 x16: 000000000000=
0000 x15: 0000000000000003
> >       [  622.734755] [ T250254] x14: ffff800082962e78 x13: 000000000000=
0003 x12: ffff003bc6231630
> >       [  622.734757] [ T250254] x11: 0000000000000000 x10: 000000000000=
0000 x9 : ffffffdfc0000000
> >       [  622.734758] [ T250254] x8 : 003ff3d37312f280 x7 : 072007200720=
0720 x6 : ffff80008018710c
> >       [  622.734760] [ T250254] x5 : 0000000000000001 x4 : 00000090ecc7=
2ac0 x3 : 0000000000000000
> >       [  622.734761] [ T250254] x2 : 0000000000000000 x1 : ffff800081a7=
2bc6 x0 : ffcf4dcccbcac9c8
> >       [  622.734763] [ T250254] Call trace:
> >       [  622.734763] [     T250254] kfree (/home/user/Devel/linux-next/=
./include/linux/page-flags.h:284 /home/user/Devel/linux-next/./include/linu=
x/mm.h:1182 /home/user/Devel/linux-next/mm/slub.c:4871) (P)
> >       [  622.734766] [     T250254] vhost_dev_cleanup (/home/user/Devel=
/linux-next/drivers/vhost/vhost.c:506 /home/user/Devel/linux-next/drivers/v=
host/vhost.c:542 /home/user/Devel/linux-next/drivers/vhost/vhost.c:1214) vh=
ost
> >       [  622.734769] [     T250254] vhost_vsock_dev_release (/home/user=
/Devel/linux-next/drivers/vhost/vsock.c:756) vhost_vsock
> >       [  622.734771] [     T250254] __fput (/home/user/Devel/linux-next=
/fs/file_table.c:469)
> >       [  622.734772] [     T250254] fput_close_sync (/home/user/Devel/l=
inux-next/fs/file_table.c:?)
> >       [  622.734773] [     T250254] __arm64_sys_close (/home/user/Devel=
/linux-next/fs/open.c:1589 /home/user/Devel/linux-next/fs/open.c:1572 /home=
/user/Devel/linux-next/fs/open.c:1572)
> >       [  622.734776] [     T250254] invoke_syscall (/home/user/Devel/li=
nux-next/arch/arm64/kernel/syscall.c:50)
> >       [  622.734778] [     T250254] el0_svc_common (/home/user/Devel/li=
nux-next/./include/linux/thread_info.h:135 /home/user/Devel/linux-next/arch=
/arm64/kernel/syscall.c:140)
> >       [  622.734781] [     T250254] do_el0_svc (/home/user/Devel/linux-=
next/arch/arm64/kernel/syscall.c:152)
> >       [  622.734783] [     T250254] el0_svc (/home/user/Devel/linux-nex=
t/arch/arm64/kernel/entry-common.c:169 /home/user/Devel/linux-next/arch/arm=
64/kernel/entry-common.c:182 /home/user/Devel/linux-next/arch/arm64/kernel/=
entry-common.c:880)
> >       [  622.734787] [     T250254] el0t_64_sync_handler (/home/user/De=
vel/linux-next/arch/arm64/kernel/entry-common.c:958)
> >       [  622.734790] [     T250254] el0t_64_sync (/home/user/Devel/linu=
x-next/arch/arm64/kernel/entry.S:596)
> >       [ 622.734792] [ T250254] Code: f2dffbe9 927abd08 cb141908 8b09011=
4 (f9400688)
> >       All code
> >       =3D=3D=3D=3D=3D=3D=3D=3D
> >       0:*     e9 fb df f2 08          jmp    0x8f2e000                <=
-- trapping instruction
> >       5:      bd 7a 92 08 19          mov    $0x1908927a,%ebp
> >       a:      14 cb                   adc    $0xcb,%al
> >       c:      14 01                   adc    $0x1,%al
> >       e:      09 8b 88 06 40 f9       or     %ecx,-0x6bff978(%rbx)
> >
> >       Code starting with the faulting instruction
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >       0:      88 06                   mov    %al,(%rsi)
> >       2:      40 f9                   rex stc
> >       [  622.734795] [ T250254] SMP: stopping secondary CPUs
> >       [  622.735089] [ T250254] Starting crashdump kernel...
> >       [  622.735091] [ T250254] Bye!
>


