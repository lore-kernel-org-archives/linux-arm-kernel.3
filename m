Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84560C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URsAWgibYPK79yqP+L7WxxcSOKa5+XPmtvizT1y+9Fg=; b=zui80gNJ1HBLdjunRTzHmazuPr
	JYx3+WB8/pFn7PZngXVwU8AC4SEt5KQ8E+ofqc8ii6feAh+f2mH/xp8g19o1TnEiXbA2vpYnkh40c
	uW3ozR/VlMhKZrpBGYHJZTuj/GXfW9UMLtZO/w4hCwysKQGlp8zRkXqiW/I1jXLlHoORCEwvQLLbc
	9Rp+thTmAdHsqODN4+FcZIoFSb5TCCDIKPqc3yWWMg7hGwTHvq1WzzsPB4ADHsdRi0zrAMXKCTxVW
	lAFbfyRWS2UI3gI/+V/YUI+1T9HsJdDoSkw8QikkdoN55adSJaBVCDcNlcF56YlaADMVMFlQC6cgk
	HIRoYpoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugh9W-0000000GTS6-0ZpP;
	Tue, 29 Jul 2025 10:01:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugh5H-0000000GSue-10TU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 09:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753783040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=URsAWgibYPK79yqP+L7WxxcSOKa5+XPmtvizT1y+9Fg=;
	b=R6vYi1KH9tlTzbo79Qw0d+jJopiI+YTwbBbn3BZqZB/77ABYGt0hhTYs0fIdDl61Ko9KV5
	qeQF6mBvbdvqiIObUYUta6GwyQYyngvxoBxCDmgAtyOpEPVfT+HL4ZdFsUy7nSw2HzAyup
	2dDJfYVPSJjKDWfKTxZOyrZjqmi81vg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-T1C1mPpVMX2383ClkIFlCw-1; Tue, 29 Jul 2025 05:57:19 -0400
X-MC-Unique: T1C1mPpVMX2383ClkIFlCw-1
X-Mimecast-MFC-AGG-ID: T1C1mPpVMX2383ClkIFlCw_1753783038
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-adb32dbf60bso585226566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 02:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753783038; x=1754387838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URsAWgibYPK79yqP+L7WxxcSOKa5+XPmtvizT1y+9Fg=;
        b=P2Amo3/XLsoAM44mc5wua+E4N2bxR/s8m9F656W4GRFQFJiKBSpNsEpDgt4DHAWBZq
         zu1zl4p4TJqQV3LB08/53GbSv/ju5sLVzGIE34rGjuVwbtQRA5dyX/6hjUYK6K7ZDI8f
         s9ayTZqTyV/yhOlcYAWmpqteHI4QIzCxtIWg5x/WsvmxUEbcVx7bTqL/9md4q8H+oz2v
         VmiJMtpmv/18dd7wFNn6Ras60D48w4SKXPzzFizEVnrf0fcgMGcHdXvnyQJHdFguYRIY
         ts4SZ2Py6kwNo641rxBF2lSorNFtOcJlW5iKdrwgv9Xs08rK5M1qRMuHgO48oI0sZC8G
         TbWA==
X-Forwarded-Encrypted: i=1; AJvYcCWTeRFj/ahdl83Bt9yZdhJV4IFwcGCSjHA7MJlF8BZLr3W7mldPX7pUYsGRJ15yH9jyUKhsczCgCprOmK4LMV2g@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+iom4hm5HxEoCFmAh5vyjrwZX0g+ZWIZFn5FRdu3RXMqwkNz1
	mxCAgk6wQ5hQyciH+YOnvyhlLVmEif0/VRn8ShG0LBNkO2GKHoXjA9gqdUFfxE875UTc0pMtF6b
	DTmktukRIsTuAZWghavfG0KaRDLxOXsSpZuzK7mGBPeiSPArSAL4qS4I6/Z4byk61wYhPnGki8f
	pO
X-Gm-Gg: ASbGnctX5TlFyDeOogjdj917VMRZJMO6ZZUdyOePxzwvpLtPqHmjZkYI6+T8F/7E07R
	Gn3wuNrasAG++MWYD28vvDGUn203yC6IHgjuRzauu4C7aJI5cug9nKxauVOybXkKsLL7vH+WWQs
	WG/fD4cUTTFC43DB/bcOUOtBMrr+W7frqR4x9oUvNsm2biTv8Tkrnrf5ktHeuMSU3jyuS3t5G/V
	zFYAWxLVr/uVkYoaL6SDfnaM1Wy9DWrLLPCN02PdnbZPxL66W/0VlYkyQoklbO9nB0mQ1Mp1lTK
	8WykWw3A8G003tbbbFwFDSZdkierW0K2wT1Uk14yZ3lguCHKbAAw0DaBhKBI4gyXdVOtlqiRw1e
	mhS8hVBWwRJ8lJUg=
X-Received: by 2002:a17:907:7242:b0:ae0:e18b:e92f with SMTP id a640c23a62f3a-af617704758mr1614776166b.23.1753783037736;
        Tue, 29 Jul 2025 02:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoBdBaDKfVmFM+pFynu3dilLkfDniy2LdbtMDgfHwyAndlS+TmotNvQYGIb3Xp7LnP3gPAnA==
X-Received: by 2002:a17:907:7242:b0:ae0:e18b:e92f with SMTP id a640c23a62f3a-af617704758mr1614771566b.23.1753783037001;
        Tue, 29 Jul 2025 02:57:17 -0700 (PDT)
Received: from sgarzare-redhat (host-79-45-205-118.retail.telecomitalia.it. [79.45.205.118])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6156591fe7bsm952884a12.51.2025.07.29.02.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 02:57:16 -0700 (PDT)
Date: Tue, 29 Jul 2025 11:57:14 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, eperezma@redhat.com, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>, netdev@vger.kernel.org
Subject: Re: vhost: linux-next: crash at vhost_dev_cleanup()
Message-ID: <4hr3olmtvvqccfb4xvqfs3zisozqjlvjbpdgk4tgbhhhv7vra3@haamqnpqtivp>
References: <vosten2rykookljp6u6qc4hqhsqb6uhdy2iuhpl54plbq2tkr4@kphfpgst3e7c>
 <20250724034659-mutt-send-email-mst@kernel.org>
 <CAGxU2F76ueKm3H30vXL+jxMVsiQBuRkDN9NRfVU8VeTXzTVAWg@mail.gmail.com>
 <20250724042100-mutt-send-email-mst@kernel.org>
 <aIHydjBEnmkTt-P-@willie-the-truck>
 <fv6uhq6lcgjwrdp7fcxmokczjmavbc37ikrqz7zpd7puvrbsml@zkt2lidjrqm6>
 <CAGxU2F5Qy=vMD0z9_HTN2K9wyt+6EH-Yr0N9VqR4OT4O1asqZg@mail.gmail.com>
 <bvjomrplpsjklglped5pmwttzmljigasdafjiizt2sfmytc5rr@ljpu455kx52j>
 <CACGkMEt0ZBtcAUgc1RBU7Gd3JGvC-eszEOexee-kx7TgoiMGtA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEt0ZBtcAUgc1RBU7Gd3JGvC-eszEOexee-kx7TgoiMGtA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s8Unq2yY4hymT3c_g2Dci9cmhdsc2SRTbUYY2t52H7Q_1753783038
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_025723_428028_E3DE658D 
X-CRM114-Status: GOOD (  29.18  )
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

On Tue, Jul 29, 2025 at 03:44:49PM +0800, Jason Wang wrote:
>On Thu, Jul 24, 2025 at 9:50 PM Breno Leitao <leitao@debian.org> wrote:
>>
>> On Thu, Jul 24, 2025 at 02:52:08PM +0200, Stefano Garzarella wrote:
>> > On Thu, 24 Jul 2025 at 14:48, Breno Leitao <leitao@debian.org> wrote:
>> > >
>> > > On Thu, Jul 24, 2025 at 09:44:38AM +0100, Will Deacon wrote:
>> > > > > > On Thu, 24 Jul 2025 at 09:48, Michael S. Tsirkin <mst@redhat.com> wrote:
>> > > > > > >
>> > > > > > > On Wed, Jul 23, 2025 at 08:04:42AM -0700, Breno Leitao wrote:
>> > > > > > > > Hello,
>> > > > > > > >
>> > > > > > > > I've seen a crash in linux-next for a while on my arm64 server, and
>> > > > > > > > I decided to report.
>> > > > > > > >
>> > > > > > > > While running stress-ng on linux-next, I see the crash below.
>> > > > > > > >
>> > > > > > > > This is happening in a kernel configure with some debug options (KASAN,
>> > > > > > > > LOCKDEP and KMEMLEAK).
>> > > > > > > >
>> > > > > > > > Basically running stress-ng in a loop would crash the host in 15-20
>> > > > > > > > minutes:
>> > > > > > > >       # while (true); do stress-ng -r 10 -t 10; done
>> > > > > > > >
>> > > > > > > > >From the early warning "virt_to_phys used for non-linear address",
>> > > > > >
>> > > > > > mmm, we recently added nonlinear SKBs support in vhost-vsock [1],
>> > > > > > @Will can this issue be related?
>> > > > >
>> > > > > Good point.
>> > > > >
>> > > > > Breno, if bisecting is too much trouble, would you mind testing the commits
>> > > > > c76f3c4364fe523cd2782269eab92529c86217aa
>> > > > > and
>> > > > > c7991b44d7b44f9270dec63acd0b2965d29aab43
>> > > > > and telling us if this reproduces?
>> > > >
>> > > > That's definitely worth doing, but we should be careful not to confuse
>> > > > the "non-linear address" from the warning (which refers to virtual
>> > > > addresses that lie outside of the linear mapping of memory, e.g. in the
>> > > > vmalloc space) and "non-linear SKBs" which refer to SKBs with fragment
>> > > > pages.
>> > >
>> > > I've tested both commits above, and I see the crash on both commits
>> > > above, thus, the problem reproduces in both cases. The only difference
>> > > I noted is the fact that I haven't seen the warning before the crash.
>> > >
>> > >
>> > > Log against c76f3c4364fe ("vhost/vsock: Avoid allocating
>> > > arbitrarily-sized SKBs")
>> > >
>> > >          Unable to handle kernel paging request at virtual address 0000001fc0000048
>> > >          Mem abort info:
>> > >            ESR = 0x0000000096000005
>> > >            EC = 0x25: DABT (current EL), IL = 32 bits
>> > >            SET = 0, FnV = 0
>> > >            EA = 0, S1PTW = 0
>> > >            FSC = 0x05: level 1 translation fault
>> > >          Data abort info:
>> > >            ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
>> > >            CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> > >            GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> > >          user pgtable: 64k pages, 48-bit VAs, pgdp=0000000cdcf2da00
>> > >          [0000001fc0000048] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
>> > >          Internal error: Oops: 0000000096000005 [#1]  SMP
>> > >          Modules linked in: vfio_iommu_type1 vfio md4 crc32_cryptoapi ghash_generic unix_diag vhost_net tun vhost vhost_iotlb tap mpls_gso mpls_iptunnel mpls_router fou sch_fq ghes_edac tls tcp_diag inet_diag act_gact cls_bpf nvidia_c
>> > >          CPU: 34 UID: 0 PID: 1727297 Comm: stress-ng-dev Kdump: loaded Not tainted 6.16.0-rc6-upstream-00027-gc76f3c4364fe #19 NONE
>> > >          pstate: 23401009 (nzCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
>> > >          pc : kfree+0x48/0x2a8
>> > >          lr : vhost_dev_cleanup+0x138/0x2b8 [vhost]
>> > >          sp : ffff80013a0cfcd0
>> > >          x29: ffff80013a0cfcd0 x28: ffff0008fd0b6240 x27: 0000000000000000
>> > >          x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>> > >          x23: 00000000040e001f x22: ffffffffffffffff x21: ffff00014f1d4ac0
>> > >          x20: 0000000000000001 x19: ffff00014f1d0000 x18: 0000000000000000
>> > >          x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>> > >          x14: 000000000000001f x13: 000000000000000f x12: 0000000000000001
>> > >          x11: 0000000000000000 x10: 0000000000000402 x9 : ffffffdfc0000000
>> > >          x8 : 0000001fc0000040 x7 : 0000000000000000 x6 : 0000000000000000
>> > >          x5 : ffff000141931840 x4 : 0000000000000000 x3 : 0000000000000008
>> > >          x2 : ffffffffffffffff x1 : ffffffffffffffff x0 : 0000000000010000
>> > >          Call trace:
>> > >           kfree+0x48/0x2a8 (P)
>> > >           vhost_dev_cleanup+0x138/0x2b8 [vhost]
>> > >           vhost_net_release+0xa0/0x1a8 [vhost_net]
>> >
>> > But here is the vhost_net, so I'm confused now.
>> > Do you see the same (vhost_net) also on 9798752 ("Add linux-next
>> > specific files for 20250721") ?
>>
>> I will need to reproduce, but, looking at my logs, I see the following
>> against: c76f3c4364fe ("vhost/vsock: Avoid allocating arbitrarily-sized SKBs").
>> The logs are a bit intermixed, probably there were multiple CPUs hitting
>> the same code path.
>>
>>            virt_to_phys used for non-linear address: 000000001b662678 (0xffe61984a460)
>>            WARNING: CPU: 15 PID: 112846 at arch/arm64/mm/physaddr.c:15 __virt_to_phys+0x80/0xa8
>>            Modules linked in: vhost_vsock(E) vhost(E) vhost_iotlb(E) ghes_edac(E) tls(E) act_gact(E) cls_bpf(E) tcp_diag(E) inet_diag(E) ipmi_ssif(E) ipmi_devintf(E) ipmi_msghandler(E) sch_fq_codel(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E)
>>            CPU: 15 UID: 0 PID: 112846 Comm: stress-ng-dev Kdump: loaded Tainted: G        W   E    N  6.16.0-rc6-upstream-00027-gc76f3c4364fe #16 PREEMPT(none)
>>            Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [N]=TEST
>>            pstate: 63401009 (nZCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
>>            pc : __virt_to_phys+0x80/0xa8
>>            lr : __virt_to_phys+0x7c/0xa8
>>            sp : ffff8001184d7a30
>>            x29: ffff8001184d7a30 x28: 00000000000045d8 x27: 1fffe000e7e88014
>>            x26: 1fffe000e7e888f7 x25: ffff0007e578bf00 x24: 1fffe000e7e88013
>>            x23: 0000000000000000 x22: 0000ffe61984a460 x21: ffff00073f440098
>>            x20: ffffff1000080000 x19: 0000ffe61984a460 x18: 0000000000000002
>>            x17: 6666783028203837 x16: 3632363662313030 x15: 0000000000000001
>>            x14: 1fffe006d52e90f2 x13: 0000000000000000 x12: 0000000000000000
>>            x11: ffff6006d52e90f3 x10: 0000000000000002 x9 : cfc659a21c727d00
>>            x8 : ffff800083c19000 x7 : 0000000000000001 x6 : 0000000000000001
>>            x5 : ffff8001184d7398 x4 : ffff800084866d60 x3 : ffff8000805fdd94
>>            x2 : 0000000000000001 x1 : 0000000000000004 x0 : 000000000000004b
>>            Call trace:
>>             __virt_to_phys+0x80/0xa8 (P)
>>             kfree+0xac/0x4b0
>>             vhost_dev_cleanup+0x484/0x8b0 [vhost]
>>             vhost_vsock_dev_release+0x2f4/0x358 [vhost_vsock]
>>             __fput+0x2b4/0x608
>>             fput_close_sync+0xe8/0x1e0
>>             __arm64_sys_close+0x84/0xd0
>>             invoke_syscall+0x8c/0x208
>>             do_el0_svc+0x128/0x1a0
>>             el0_svc+0x58/0x160
>>             el0t_64_sync_handler+0x78/0x108
>>             el0t_64_sync+0x198/0x1a0
>>            irq event stamp: 0
>>            hardirqs last  enabled at (0): [<0000000000000000>] 0x0
>>            hardirqs last disabled at (0): [<ffff8000801d876c>] copy_process+0xd5c/0x29f8
>>            softirqs last  enabled at (0): [<ffff8000801d879c>] copy_process+0xd8c/0x29f8
>>            softirqs last disabled at (0): [<0000000000000000>] 0x0
>>            ---[ end trace 0000000000000000 ]---
>>            Unable to handle kernel paging request at virtual address 0000040053791288
>>            ------------[ cut here ]------------
>>            lr : kfree+0xac/0x4b0
>>            virt_to_phys used for non-linear address: 00000000290839fd (0x2500000000)
>>            WARNING: CPU: 41 PID: 112845 at arch/arm64/mm/physaddr.c:15 __virt_to_phys+0x80/0xa8
>>            Modules linked in: vhost_vsock(E) vhost(E) vhost_iotlb(E) ghes_edac(E) tls(E) act_gact(E) cls_bpf(E) tcp_diag(E) inet_diag(E) ipmi_ssif(E) ipmi_devintf(E) ipmi_msghandler(E) sch_fq_codel(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E)
>>            CPU: 41 UID: 0 PID: 112845 Comm: stress-ng-dev Kdump: loaded Tainted: G        W   E    N  6.16.0-rc6-upstream-00027-gc76f3c4364fe #16 PREEMPT(none)
>>            x23: 0000000000000001
>>            Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [N]=TEST
>>            pstate: 63401009 (nZCv daif +PAN -UAO +TCO +DIT +SSBS BTYPE=--)
>>            pc : __virt_to_phys+0x80/0xa8
>>            lr : __virt_to_phys+0x7c/0xa8
>>            sp : ffff8001a8277a30
>>            x29: ffff8001a8277a30 x28: 00000000000045d8 x27: 1fffe000e7e3c014
>>            x26: 1fffe000e7e3c8f7 x25: ffff0007bcff0000 x24: 1fffe000e7e3c013
>>            x23: 0000000000000000 x22: 0000002500000000 x21: ffff00073f1e0098
>>            x20: ffffff1000080000 x19: 0000002500000000 x18: 0000000000000004
>>            x17: 00000000ffffffff x16: 0000000000000001 x15: 0000000000000001
>>            x14: 1fffe006d53920f2 x13: 0000000000000000 x12: 0000000000000000
>>            sp : ffff8001184d7a50
>>            x29: ffff8001184d7a60 x28: 00000000000045d8 x27: 1fffe000e7e88014
>>            x26: 1fffe000e7e888f7 x25: ffff0007e578bf00 x24: 1fffe000e7e88013
>>            x23: 0000000000000000 x22: 0000ffe61984a460 x21: ffff00073f440098
>>            x20: 0000040053791280 x19: ffff80000d0b8bbc x18: 0000000000000002
>>            x17: 6666783028203837 x16: 3632363662313030 x15: 0000000000000001
>>             x22: 0000ffe6199a459d
>>            x14: 1fffe006d52e90f2
>>             x21: ffff00073f7f0098
>>            x20: ffffff1000080000 x19: 0000ffe6199a459d x18: 0000000000000004
>>            x17: 54455320203b2d2c x16: 0000000000000011 x15: 0000000000000001
>>            x14: 1fffe006d52bb8f2 x13: 0000000000000000 x12: 0000000000000000
>>            x11: ffff6006d52bb8f3 x10: dfff800000000000 x9 : 77521a2bd3e0be00
>>            x8 : ffff800083c19000 x7 : 0000000000000000 x6 : ffff80008036bc2c
>>            x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff8000805fdd94
>>            x2 : 0000000000000001 x1 : 0000000000000004 x0 : 000000000000004b
>>            Call trace:
>>             __virt_to_phys+0x80/0xa8 (P)
>>             kfree+0xac/0x4b0
>>             vhost_dev_cleanup+0x484/0x8b0 [vhost]
>>             vhost_vsock_dev_release+0x2f4/0x358 [vhost_vsock]
>>             __fput+0x2b4/0x608
>>            x11: ffff6006d53920f3
>>             fput_close_sync+0xe8/0x1e0
>>             __arm64_sys_close+0x84/0xd0
>>             invoke_syscall+0x8c/0x208
>>             do_el0_svc+0x128/0x1a0
>>             el0_svc+0x58/0x160
>>             el0t_64_sync_handler+0x78/0x108
>>             el0t_64_sync+0x198/0x1a0
>>            irq event stamp: 0
>>             x13: 0000000000000000
>>            hardirqs last  enabled at (0): [<0000000000000000>] 0x0
>>            hardirqs last disabled at (0): [<ffff8000801d876c>] copy_process+0xd5c/0x29f8
>>
>>
>> > The initial report contained only vhost_vsock traces IIUC, so I'm
>> > suspecting something in the vhost core.
>>
>> Right, it seems we are hitting the same code path, on on both
>> vhost_vsock and vhost_net.
>>
>
>I've posted a fix here:
>
>https://lore.kernel.org/virtualization/20250729073916.80647-1-jasowang@redhat.com/T/#u
>
>I think it should address this issue.

Thanks for the fix!

Stefano


