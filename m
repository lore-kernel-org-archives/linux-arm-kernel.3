Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1226BC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhKC2uH9JNLWHRqJ28vd49ZvOTGeVzPYd+xhSQmP2ZI=; b=z2Nq1ipVQVunGNMQ5U/SuSTAjp
	XsReUau50Nvk1hzWhzKXGnAyli/hlknVvFotfIYRq7Hv8J1DhzwUkhk8eiPa9rKFuXeVmtIIq2/V2
	NS84nN2IZhq7mlrABTaai2nObO8QF6euQeddCrqCPvXt94wEuN02vIbmVjnwxBReu//jVM0xlItjn
	SjYjkxj/f3xsecOA6ztcp8Mph0fOcOzEcnN+0soSb59Dh+Kndogo4r3pRixGpuMRG36YUrekp4Xli
	jkSNMJDPzMpsALviaCR3RMnekVJsTo43pX41D1YFFdu4p+J9Rl1nQ7p2lZC3lm84801WckzJgxWdD
	dV0ggVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqAx-0000000EcxR-0IdD;
	Tue, 11 Aug 2026 17:22:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqAu-0000000Ecwu-3kqs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:22:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-495509b08ebso1395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 10:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786468923; x=1787073723; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhKC2uH9JNLWHRqJ28vd49ZvOTGeVzPYd+xhSQmP2ZI=;
        b=GcZjXUzH+XRXpay1dfdU0brvzhJ97p/Bvv8tFOESI+rIDaZ0XVLNfWRJ2obfEUz//X
         kaL2mloXl2NaCxna4TUKAa/0LtsQW5r9htoRyWiwyqO9SXx7fosmHHuomVebsF34rpdG
         2rUqqG+9cRXCVCpy5BaVOb6q/W8vFEX+q/bf8vtd2ce6+w7N4MH2o68evScOvBndnzUz
         jfG3ubwwLwPAc4oYtjLlfXtXLZ2klCZ6ncfO/9JizfBw6SZlME05TfIO1idoP3rwfhqG
         ZJxkbA+/4xmpcBG9Jxc+fJscUHJTheNPcwiWBzbBzUCEfrleAFOXwnQijWMDZS48+cxJ
         i7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786468923; x=1787073723;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XhKC2uH9JNLWHRqJ28vd49ZvOTGeVzPYd+xhSQmP2ZI=;
        b=pysW/WFhTDujwI+ycHd3QrRllS1AYM7ll9LyOtu37iqWYu2ve5DTSsEdawjzc/NK0Z
         mSIexA2SvrcFo+UZe3ADQzBoSXd4t2qCKTN0jlIKjMXErkWqy3KNPdLzUeGn4uP2XNoH
         IhiPlezEvW94g55OGTga95wxadxNiOm/PHuNEG5dmD5v3RV67WSidJaj5Gpd67Rcz8Vy
         ImDhyJxxGqTZoeAfShIj0Ac1aJFxY6UswcnvVLMj4J6K3kCDpR/FCkp1KlQBPpt41ICZ
         cPEKOFXej3pEsMUG4QRt8yBK/rUwXOx3jbVll04JftTvxvJLxLrakUj9a704wesFW82Y
         14BQ==
X-Forwarded-Encrypted: i=1; AHgh+Rperv8KJMYSaKHRgQ0u7QvJQkdMvGL8rO544PaAXmspfu3os2iG3xBYqfa39j6k5Yw5nCOrqvVGwwPqMNR7+BFX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo/LVOuNjDnRVhSo+i0sBtpZ3awahN/0jaM6pmDTcXCagg0t5i
	TvqH0FKn3a6SD4zyLegr3rda/Zy24RE19Xn8ZWoKLe9urElRQGSGujxVmvTUw5FZWg==
X-Gm-Gg: AR+sD10LkcyfbwPkXpoOQo3Shm+wuCgMLx66wK6502Buw+6eRTfHCUBcaBVyn6fQehK
	dzdiKrkPp7B7F7eFYUPNh0wtMbvbWRasDA+QoJZOsjAdtzs2m4bOLoppe32mpd7U5k2tDH2/tu0
	7ac0sI8Bh+5b9jbCLXBrtQGqpGgZt0lUrnr6PnY9dOUtiCE8JE+2dHo5O6Ekhc3i0OtFOh8n7RM
	Nguc03/OwFlzinm/6hzZQCNnb2Bh0MrudFdhvKUWVGvKBA3oyp1B3VaBL+EV/oZ74yvTAsCBzQJ
	46Oa2uANUJd2H0LxWIdFpAFv+09FW6M9VuaE1g44wwH4nCrSrjz5kfY8nOrQz90+EZxSJT4uRl9
	CMH4GPdkQ2zn4Cfo2ETZltyJqGkV7s2ktzV3IFw+HEAVdOk2/uEHBJ3VmTfLnY8XrsZTdfGCJv5
	uamwJBe8//sWBDPCyLtoIkxuKcukba5OtBK+0vpZ8FVw8qZn5EyPjU27XGDoSLaT6shsKv/kV00
	0wC4NZ8pMb7PqZLA4bNw5zZpAy8Cw==
X-Received: by 2002:a05:600c:4e49:b0:495:5515:3c00 with SMTP id 5b1f17b1804b1-4997aeca4f3mr16485e9.9.1786468922574;
        Tue, 11 Aug 2026 10:22:02 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a7097b8sm5888525f8f.21.2026.08.11.10.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 10:22:01 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:21:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	vdonnefort@google.com, tabba@google.com, sebastianene@google.com,
	keirf@google.com, yaoyuan@linux.alibaba.com
Subject: Re: [PATCH v2 0/3] KVM: arm64: Fixes for timers and pKVM
Message-ID: <antaNocfJp6mX-oV@google.com>
References: <20260808085824.732659-1-smostafa@google.com>
 <178621460524.381735.15023846552532101058.b4-ty@kernel.org>
 <CAFgf54qY8c9wO_RHQZpVSKUCTOgr+WWKCxetjb6BGf-G=5OTSA@mail.gmail.com>
 <86pkzo23u0.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86pkzo23u0.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_102204_948388_43CB81F6 
X-CRM114-Status: GOOD (  29.98  )
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

On Tue, Aug 11, 2026 at 02:18:15PM +0100, Marc Zyngier wrote:
> On Tue, 11 Aug 2026 13:17:25 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > On Sat, Aug 8, 2026 at 7:44 PM Oliver Upton <oupton@kernel.org> wrote:
> > >
> > > On Sat, 08 Aug 2026 08:58:21 +0000, Mostafa Saleh wrote:
> > > > What started as a  small patch ended up as a 3 patch series thanks
> > > > to Sashiko.
> > > >
> > > > First patch from Marc to consolidate the offset calculation,
> > > > follow up patches fix issues with non-protected VM and timer
> > > > offset and protected VM running with broken CNTVOFF_EL2.
> > > >
> > > > [...]
> > >
> > > Dropped the unintended SOB in patch 3 you mentioned.
> > >
> > > Applied to next, thanks!
> > >
> > > [1/3] KVM: arm64: Make timer_get_offset() work in all contexts
> > >       https://git.kernel.org/kvmarm/kvmarm/c/2858600ecd01
> > > [2/3] KVM: arm64: Fix timer offsets for non-protected VMs
> > >       https://git.kernel.org/kvmarm/kvmarm/c/47d3eef780e3
> > > [3/3] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
> > >       https://git.kernel.org/kvmarm/kvmarm/c/2e813a6e8ebe
> > >
> > 
> > Thanks Oliver! I believe there is one more bug. I'm not sure where the
> > bug is or if it relates to the broken timers.
> > Before those patches I could not boot a protected VM because of the
> > panic, now after booting protected VMs, I sometimes get a system
> > reset.
> 
> On this quality HW, this is usually an indication that you are taking
> an exception in a tight loop.
> 

I tried to add a poor man exception storm detection in the kernel
handlers (el1h_64_sync_handler and __gic_handle_irq), but it didn’t trigger
before the reset.

My hunch would be that there are some paths in protected VMs that takes
too long that the watchdog fires. I saw the resets mostly at either
userspace boot or VM teardown, otherwise the VM seems functional.

I will collect timestamps from hypervisor entry/exit and check
how large are those.

> > I confirmed that cntvoff_el2 does not get written to non-zero, I also
> > removed the sysreg write completely (rely on xzr value at init) so my
> > guess is that the HW might be allergic to more than just non-zero
> > values in cntvoff_el2.
> 
> Is that in hVHE mode? Can you trap the access and route it to the
> existing handling code?
> 

Yes, only hVHE. Protected nVHE works fine.

One interesting observation is that when starting a VM with a single
vcpu I don’t see the reset anymore compared to 4 cpus before.

Enabling traps for timer unconditionally for protected VMs still has
the same issue.

> > I do not have issues with non-protected VMs anymore.
> 
> Do these run with an offset or not?

Yes, they have the offset set from kvm_timer_vcpu_init() with
kvm_phys_timer_read().

Thanks,
Mostafa

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

