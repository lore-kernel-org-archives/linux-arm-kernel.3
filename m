Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B08C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FbVsGYaq0NyKNgSaxcwvLjtec9H1rtMkyXCq5d8Dfs=; b=q0hDHEDQMD9ZjYzIRbXBlE67g/
	aH5GEvjhty4f+t9UFuSyjG87lyeLiY6G9SU4R/pv4zfGsxIjFJISQ+Sp68r6dYgjnueddWzXZ2Ox1
	ZNUg0eKbI1EUI+shME55AM4PKXSshjvJcDJXBiXTQD3cnsUI3IfWSCMBlc0BU+2rocyFYmjN1O83t
	YeBvpSxzcE4bDetxyq6Gd2UzW7cqlDThMjFZYwNUq3dLPtdQxuxJE8Zwc1uT9aTxS8W4fgXlKThW2
	1H2rnzdkrvppZ8Suqq/yKEDicZs7Y04+w1S24AnkOO3yeXnqeD0d788UUUIgH+ESM/enLMfPTgQqT
	qMzlk8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPjP-0000000AOfx-0ZtK;
	Thu, 17 Jul 2025 14:37:07 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNtY-0000000A8wY-0ZN8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:39:29 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so1304457a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752755966; x=1753360766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FbVsGYaq0NyKNgSaxcwvLjtec9H1rtMkyXCq5d8Dfs=;
        b=DznINuHPEs1PoY35IXnjOhY/QXa4kwbjMccQbBNbhxosFpsPy/F1CYTSzUtUlIqp70
         +LeVdYMCBbYbSeuGz5rsV69RMcFv0IWkA4fiHT/KpdBRJNW+o9EGeehEJsBN4ypaIMxt
         +b+1HykRXTTl6bu0dp3WxsyKUKD+mE8IxKOFEiVmzC0zHoOus5L2AegDNdKxLfXLuNxQ
         hHukUwZub0BGfPU1jLzQYTw/UHHT8xa3Mf978Edz7TyIRBdW6RyV67SJQWshj/4vOBqJ
         4PkXe58OC3LJWoKNM+fU+a9ji4WGgYuIBldlvLMrGrXOvrClJjWz/eESQl9zXPj5nzb9
         zdNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCsH4Z9olsoTXg9XxWYaCy1wrM7VhpF/WkY4r0CT3H/mGS7SyDpI2MsaOt2MBa5Blmh3L99ySzIMsstdTRaSs7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+xIl+xqUN7LJ22No2fKDTmF6HxHZASWanxboHkodJQI2oWmOc
	2P8HccXB4l81UCRiXx/PN39bEfH61DD40FFzczAKKlgRu1VLoTYvm4SM
X-Gm-Gg: ASbGncuy3t8YRzxc3/VLX1TQC5zj02UWQTcIDPltJ2kFHwLtQROVEWX5+p0AaphxV1e
	Nwt0Zhi6Gp4s4wAAD9cjUSxs/6FnozEZPpdwMdflU1H7mmdnbM87ljDsasYG/NsUU5W5I5c6Bwm
	ayF1HUYxYTBUqfnWHR16UD7NmPr9IWWqpsHtVlmMDqOUDQMRN+SBukZwcWvBF6PXU55PEcKEX+2
	XxZYzxfkr5qXoZGqkqJB7EMF7twT5WvkgHgPbCmhhc4Th+TutVaaViYETeoDKlmEOUlKUBMsMOn
	/1OuyQGX2OpFL6hslSgrzsQifeDZujvm6tCSDqysuMgo8qwN6I03BKAxXMX7xM34lQxazPmblNc
	Cg3NigEJcl9ZOlNjDVUzrWB0=
X-Google-Smtp-Source: AGHT+IFGMudLSa+MO2VRzIbQxkbKfo9sFMUMYLFenyZfvGkLpQS2jb+5lrL6tqgUkH/mp49v4K+DYQ==
X-Received: by 2002:a17:907:80b:b0:aec:55c0:6d5e with SMTP id a640c23a62f3a-aec55c0765dmr171272166b.30.1752755965867;
        Thu, 17 Jul 2025 05:39:25 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee471asm1374427366b.54.2025.07.17.05.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:39:25 -0700 (PDT)
Date: Thu, 17 Jul 2025 05:39:22 -0700
From: Breno Leitao <leitao@debian.org>
To: Lorenz Bauer <lmb@isovalent.com>, linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Alan Maguire <alan.maguire@oracle.com>
Subject: Re: [PATCH bpf-next v5 1/3] btf: allow mmap of vmlinux btf
Message-ID: <g2gqhkunbu43awrofzqb4cs4sxkxg2i4eud6p4qziwrdh67q4g@mtw3d3aqfgmb>
References: <20250520-vmlinux-mmap-v5-0-e8c941acc414@isovalent.com>
 <20250520-vmlinux-mmap-v5-1-e8c941acc414@isovalent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-vmlinux-mmap-v5-1-e8c941acc414@isovalent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_053928_172569_3C3AD75A 
X-CRM114-Status: GOOD (  11.94  )
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

Hello Lorenz,

On Tue, May 20, 2025 at 02:01:17PM +0100, Lorenz Bauer wrote:
> diff --git a/kernel/bpf/sysfs_btf.c b/kernel/bpf/sysfs_btf.c
> index 81d6cf90584a7157929c50f62a5c6862e7a3d081..941d0d2427e3a2d27e8f1cff7b6424d0d41817c1 100644
> --- a/kernel/bpf/sysfs_btf.c
> +++ b/kernel/bpf/sysfs_btf.c

>  extern char __start_BTF[];
>  extern char __stop_BTF[];

> +static int btf_sysfs_vmlinux_mmap(struct file *filp, struct kobject *kobj,
> +				  const struct bin_attribute *attr,
> +				  struct vm_area_struct *vma)
> +{
> +	unsigned long pages = PAGE_ALIGN(attr->size) >> PAGE_SHIFT;
> +	size_t vm_size = vma->vm_end - vma->vm_start;
> +	phys_addr_t addr = virt_to_phys(__start_BTF);

I am getting the following warning on arm64 which seems related to this
code here. lines are based on cd031354087d8ae ("Merge branch
'net-mlx5e-add-support-for-pcie-congestion-events') net-next branch

	[   58.896157] virt_to_phys used for non-linear address: 000000009fea9737 (__start_BTF+0x0/0x685530)
	[   23.988669] WARNING: CPU: 25 PID: 1442 at arch/arm64/mm/physaddr.c:15 __virt_to_phys (arch/arm64/mm/physaddr.c:?)
	[   24.018136] Modules linked in: nvidia_cspmu(E) mlx5_ib(E) ipmi_ssif(E) arm_smmuv3_pmu(E) arm_cspmu_module(E) coresight_trbe(E) ib_uverbs(E) ipmi_devintf(E) ipmi_msghandler(E) coresight_stm(E) coresight_etm4x(E) coresight_tmc(E) coresight_funnel(E) stm_core(E) coresight(E) cppc_cpufreq(E) sch_fq_codel(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) xhci_pci(E) xhci_hcd(E) sm3_ce(E) sha3_ce(E) sha512_ce(E) spi_tegra210_quad(E) acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E)
	[   24.075371] Tainted: [E]=UNSIGNED_MODULE, [N]=TEST
	[   24.080276] Hardware name: Quanta S7GM 20S7GCU0010/S7G MB (CG1), BIOS 3D22 07/03/2024
	[   24.088295] pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
	[   24.098440] pc : __virt_to_phys (arch/arm64/mm/physaddr.c:?)
	[   24.105398] lr : __virt_to_phys (arch/arm64/mm/physaddr.c:?)
	[   24.112227] sp : ffff8000ba00f8e0
	[   24.115620] x29: ffff8000ba00f8e0 x28: ffff8000ba00faf0 x27: ffff8000ba00fa88
	[   24.122919] x26: ffff8000ba00fa40 x25: ffff800082772000 x24: 0000fffd6db70000
	[   24.130226] x23: 0000000000685530 x22: 0000fffd6e200000 x21: ffff800081cc0000
	[   24.140540] x20: ffff800081be02d8 x19: ffff800081cc0000 x18: 5f5f282037333739
	[   24.150708] x17: 6165663930303030 x16: 0000000000000fc4 x15: 0000000000000003
	[   24.160737] x14: ffff800082923398 x13: 0000000000000003 x12: 0000000000000003
	[   24.168042] x11: 00000000fffeffff x10: ffff800082663784 x9 : cc38fcac5cdabe00
	[   24.175348] x8 : 0001000000000000 x7 : ffff8000813dd878 x6 : 0000000000000000
	[   24.182653] x5 : 0000000000000001 x4 : 0000000000000001 x3 : 0000000000000000
	[   24.189959] x2 : 0000000000000000 x1 : ffff800081a3a6d0 x0 : 0000000000000055
	[   24.197257] Call trace:
	[   24.199761] __virt_to_phys (arch/arm64/mm/physaddr.c:?) (P)
	[   24.206883] btf_sysfs_vmlinux_mmap (kernel/bpf/sysfs_btf.c:27)
	[   24.214264] sysfs_kf_bin_mmap (fs/sysfs/file.c:179)
	[   24.218536] kernfs_fop_mmap (fs/kernfs/file.c:462)
	[   24.222461] mmap_region (./include/linux/fs.h:? mm/internal.h:167 mm/vma.c:2405 mm/vma.c:2467 mm/vma.c:2622 mm/vma.c:2692)


Should __pa_symbol() be used instead of virt_to_phys()?

Thanks
--breno

