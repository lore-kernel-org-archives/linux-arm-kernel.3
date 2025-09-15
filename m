Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D327CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGVw+dkj5nfYxmjH5LY4ZgVFCM7KXPpME6hBvdzBkGc=; b=0hL3rmlCz4zaQIStwuDkxghBy9
	JyowdeTufII6Bu4eutQRyynoVC1esJpE07CyvdRJT4aHpwfINnbMQPB7ptg8E3aKp867KxKEwDIPI
	z3QXeWoo4C7l3H5jEDZGlACdA4INM/gSd4VIj8mujqD/CCrVES332P9LUe5etgl86s+KPS+99x7zq
	UjNUIMzm5snTa1MtifwZ9ASslbU1XGPtnZhQAw5z9jLisNIhmiyWnyPniM591QkFcKJv4vLtmVjSG
	Yfb7g6xBfxPjbUA+D2qYftN19kMbm8SYY5mh6UwQEo3A97RtfBRbnqvnk80wSJC03F+qk88yeyY2O
	Mm1NVyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy76k-00000003qju-0lGq;
	Mon, 15 Sep 2025 11:10:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy76h-00000003qjZ-41QC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:10:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24cca557085so344775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757934651; x=1758539451; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGVw+dkj5nfYxmjH5LY4ZgVFCM7KXPpME6hBvdzBkGc=;
        b=uP/p69FYeGErvZlxSqEyCRiXX5kFdx3l/WYF3FPlvmBYP1/MVVxSAtEIQ7yMRTwn3L
         gH1cwnKkFdYrDmIt3VkWbOIt4CCqY0YJnGJFf+v7rsI//59zJq3vcmL6VDn3DC9Qk55a
         9hg/cM1yJMmt8bY7MkgNyKukHXFm+id1Qs25fo1rRwEyy7O2su0N69CIPieD2SocrYKE
         3uCRzXrjMFNSE5/dHKLpnEnCtL+yeDD0HXntoE1cNeQe0kRg6uP3WsWqCzqIeZpSr9QP
         yXz1CrJUSxiqtZAKPU/fmZ8k9TOUhmSnNei8MRtBMvj4VdTJpZF+5OOP2rHw7z/JQisi
         P3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934651; x=1758539451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGVw+dkj5nfYxmjH5LY4ZgVFCM7KXPpME6hBvdzBkGc=;
        b=v0uf1ojUkWSCOEOU1iFuEtvXzEZqIxtWusmD+u4tgDmWvag80shNVNwOAtYEN8CGIR
         2sX/d2qOron26Ufw/137/LxyAYqQZhuBXOYAOByOCbwEH95OH3o38l7sS7iLnPLvDaHU
         DJZy1B7WIRGzQ9WSXjlmuiGi+Z2CQbPSBeWl2UC9sZDuw9AiJyxiNne0H6v0cGTTCGFf
         Iz6dc4BuOYZedFH97ajjKUTHOx9AbjBCGUckRMmFQhiP48/YpfHaXVmXDAvGiLN0sOrb
         hrSRqIAf2xTEHvBQlprQHpamWvVpqwvcJp8oFR8fHG8qHgVvQ9ra/MvPo1MtiBWBkSlY
         8Nyw==
X-Forwarded-Encrypted: i=1; AJvYcCX82H3DZxXXctg0qoWAjBO5c9w4nWwT/uX5eramsd1zcrTIaDcNfZWfOwz/5pGp4L12oCOXsXF7cViDlSyJgiPR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3fKjjc216UEROfHXd6C3EKfapS2qBAxFSUSxpuSykvgXfkWpV
	JgUu+lsQ93M78/KnRXNXwtHxJMG2AYpSNn1qbp36N0QBfssEjx8ZDpL6E0vZokZSHcxBjZshGFm
	lAZneCw==
X-Gm-Gg: ASbGncud7I5pRZRXVdm5nUCIYAJ+boFZi207wa0sHoK0syZYHx7WtqSAmr9nQ6g7Gmo
	kwAUp1ar68k1QJqgcr7oUkGV+QNr3JQUm3jj47PYQPmrQptbrwUxVmIvKvPpB5oQfGEcFtEQHcv
	GTSt8YIebaeqHtI3kW5JbOXJL2RjkcGDj+JUsY33GlIcJpSHfutuPR5fN4yHzpXG/GSU1l108HZ
	AXjvswS9Xx+MDFALwXgF24In07JTmkY8r5vp4/rdnsv+ccHbhVYODGyJALZzPglGANLyzKYJgMd
	N4TJX6GTGuT8RrXSWdG9DFZrVPSMrA8W4ZwDW0tVn1ubY6MfZJSJakxOsQ+QzUocilHAOsLsyOk
	SiQk4rsaHv7Wq7mjtibpMKuAA31u+TJOjFvk6amz+2HBkuKBWFTSCPffzYkHUhA5bRzoxAsQblg
	==
X-Google-Smtp-Source: AGHT+IGldm5kVklLwWI+W0luGJJTP/Fy8rtLyArOHHmGPz2Td1ttKApb5Hb7I95Cb8Bwiryv5S6sUQ==
X-Received: by 2002:a17:903:1b08:b0:24b:1b9d:58f1 with SMTP id d9443c01a7336-260a27af356mr6498255ad.17.1757934650882;
        Mon, 15 Sep 2025 04:10:50 -0700 (PDT)
Received: from google.com (23.178.142.34.bc.googleusercontent.com. [34.142.178.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26175efc667sm64942635ad.112.2025.09.15.04.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:10:50 -0700 (PDT)
Date: Mon, 15 Sep 2025 11:10:43 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mostafa Saleh <smostafa@google.com>,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com
Subject: Re: [PATCH v4 03/28] KVM: arm64: pkvm: Add pkvm_time_get()
Message-ID: <aMf0M72p8AEEoTny@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-4-smostafa@google.com>
 <aMA2ugNakqrA1Pg0@willie-the-truck>
 <86frcvd3hb.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86frcvd3hb.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_041052_018022_6D52F3FF 
X-CRM114-Status: GOOD (  31.43  )
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

On Tue, Sep 09, 2025 at 04:56:16PM +0100, Marc Zyngier wrote:
> On Tue, 09 Sep 2025 15:16:26 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > On Tue, Aug 19, 2025 at 09:51:31PM +0000, Mostafa Saleh wrote:
> > > Add a function to return time in us.
> > > 
> > > This can be used from IOMMU drivers while waiting for conditions as
> > > for SMMUv3 TLB invalidation waiting for sync.
> > > 
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > ---
> > >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 ++
> > >  arch/arm64/kvm/hyp/nvhe/setup.c        |  4 ++++
> > >  arch/arm64/kvm/hyp/nvhe/timer-sr.c     | 33 ++++++++++++++++++++++++++
> > >  3 files changed, 39 insertions(+)
> 
> [...]
> 
> > > +#define SEC_TO_US 1000000
> > > +
> > > +int pkvm_timer_init(void)
> > > +{
> > > +	timer_freq = read_sysreg(cntfrq_el0);
> > > +	/*
> > > +	 * TODO: The highest privileged level is supposed to initialize this
> > > +	 * register. But on some systems (which?), this information is only
> > > +	 * contained in the device-tree, so we'll need to find it out some other
> > > +	 * way.
> > > +	 */
> > > +	if (!timer_freq || timer_freq < SEC_TO_US)
> > > +		return -ENODEV;
> > > +	return 0;
> > > +}
> > 
> > Right, I think the frequency should be provided by the host once the arch
> > timer driver has probed successfully. Relying on CNTFRQ isn't viable imo.
> 

Are platforms are using DT to change this value?
Because I think TF-A mandates [1] this value to be set, from the docs:

BL31 programs the CNTFRQ_EL0 register with the clock frequency of the
system counter, which is provided by the platform. 

Even the TF-A porting guide [2] mandates it to be set.

> We can always patch the value in, à la kimage_voffset. But it really
> begs the question: who is their right mind doesn't set CNTFRQ_EL0 to
> something sensible? Why should we care about supporting such
> contraption?
> 
> I'd be happy to simply disable KVM when CNTFRQ_EL0 is misprogrammed,
> or that the device tree provides a clock frequency. Because there is
> no good way to support a guest in that case.
> 

And even if someone choses not to use TF-A, IIUC, doesn't the aarch64
linux boot protocol[3] mandate CNTFRQ must be programmed with the timer
frequency? As per the doc:

Before jumping into the kernel, the following conditions must be met:

[...]

- Architected timers
  CNTFRQ must be programmed with the timer frequency and CNTVOFF must
  be programmed with a consistent value on all CPUs.

Thanks,
Praan

[1] https://trustedfirmware-a.readthedocs.io/en/latest/design/firmware-design.html
[2] https://trustedfirmware-a.readthedocs.io/en/latest/porting-guide.html#function-plat-get-syscnt-freq2-mandatory
[3] https://www.kernel.org/doc/Documentation/arm64/booting.txt

