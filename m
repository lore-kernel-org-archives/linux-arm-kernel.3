Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B95C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkPmfDr8qV4AFwb/7zNDmYiDn/SPJXtSs6w3iYw5HaE=; b=BkufHiOPh2TYMC87rcCZFUkHmN
	RhIgy+UN10fl45Gao63tkh9UJF2z01BBXtE2rwLeZG+JoJaDX2A3lwQeA0okp+fvz4QKCTRaD3vyq
	Sm6rHb88l9CbbWLhPgB3+qUnuE38ZmBtOm3eOIQcDwPxsWWaHvjsc0NArfImaXaOCL7G3xoBcr9ej
	GhKFlJa/YfTCbcLxPVnW9MQ+4VvEctRAQ6Ijd6R2TxFFRIbcEFKP6vjANHyXeP4Caagq8BH2mh3ix
	pOiorI/4XH8ef96/O+uHYcaf/8PkDUBLBT+aLLslYUdS/FXewPDBTMTbxx47//MNl9IHSknvjCWo2
	1B6zA9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaTi-0000000FVKF-25M4;
	Thu, 29 May 2025 10:27:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaRY-0000000FV10-3gYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:25:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4ebfaa623so104999f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748514298; x=1749119098; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkPmfDr8qV4AFwb/7zNDmYiDn/SPJXtSs6w3iYw5HaE=;
        b=dHFxwxv0LIcsBi26VOHrlt0YgXYJlTGbSgAPdGpQjPlRIgNHh/dStaFSWbErtyWBFP
         i+qrKDE8LwfEANrS/BVqB3blZeCYXvRk+SzLBTTAewrs0OhfHA+yMzB51kzFLAnIN5/l
         0SMtivcpGtCWEgn40imKhhvu+KXAQpIYOA3AAMrCYukV/dfIxpSo2OutLUzuwKDFq78W
         XNtxgvGti6qqZ86zHw0ECdNmci4QZFQjAaWgpKVlYBfmxWvqlaRe/SAL5NG5p6zlYGdX
         T5Wz6ZRCeVSvEfSwkOGsiKUd/mLXhGRhFlJ/NZT+HpO0njVEIw7XdWIBfs+TopfhEvJ9
         ByFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748514298; x=1749119098;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bkPmfDr8qV4AFwb/7zNDmYiDn/SPJXtSs6w3iYw5HaE=;
        b=i0L+GVr2sA14nuFLZuU0oNvR61iUpL5tGi525wdKOB6iDlk9qCO1KHFs1T37ZKzGKr
         kCZ2NN7H4/Jlfcc2ZcVLEbbdvi63OjTuDWmgo49NHh4G7xVmeUAl/hVEkvJTGJfAuDwR
         yS2ejT6tL7bmInRs7YVpEGr2u2cb13cxurD8n+sUhwaDbtn1UbhQ+Jt6e3cpXXYc139v
         ZZruDKkxYmS1p4x2kJzxiSMgv6TUI4T/NWgGc/suM9hknDzlqykYiVXe+5eYufkNFklz
         vt+TAelFAUooBNijLCTkarKHRqkPqZpeDlu175oWthwxNsd/Iuw5XtpV/Z2zl91hHpWj
         34OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR96fmdrsy4Bh5AKjE7xIOV/tkrt8oL1ipVaOPBZjynpi5JOpZGbVQvKEWOboBOMK43aKZj/AMM9LeHYFrvwt0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7J4IDkhTz464tKySYrh/vsEhp62UaygEEC7fbQZ2KDuuiYTBB
	dscGNKu4RGuMOHAZFSYDdxM1yH79qYsE1gSo2Y/UNNzU2GfRwlJZLqOlNpuJ+yce+jY=
X-Gm-Gg: ASbGnctlzb/3JrvXODXgK2lfFJZOckXXEFnB2YX1+GkcZUImDff5RNdIpRUWZSRyVat
	kwh4rohWzPBnJ8ZEhqJVS/+Sq9wkaPR2XpziR6s3g2NDJgco0PchMr5HoW2pFdwQIRzx74k0Xio
	TFIlFusCHsb/JLrYlIZThL534vjLkspKSLIyLwNE71Azm0Klm4tvQ5MF5unbbbq71CwY4y45aSy
	+rm3D8O6Lx9nN6IsTJi03G6l442IvWn3ng+Tif+DHfHwAoqyRxx6F37qgwwdPdfTtAKAxtWeEoy
	hrnBCB5vcAOZJpaiVuJYnep62zfLlNAGLxDj2bRLfk82Zy2ZoOxGJspHlz4=
X-Google-Smtp-Source: AGHT+IHTjhkw8mY9U5Lw6amMsITMkGfFMYsq7IkB3jEfobdCq2XVznCgFv/wQTr+NkDTK2KFhJhB5w==
X-Received: by 2002:a05:6000:1885:b0:3a4:e672:df0c with SMTP id ffacd0b85a97d-3a4e672e083mr2365564f8f.13.1748514298394;
        Thu, 29 May 2025 03:24:58 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f5e7:eb4d:155d:d79e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73fbcsm1558329f8f.48.2025.05.29.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:24:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 12:24:57 +0200
Message-Id: <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
Cc: "Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
In-Reply-To: <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_032500_933944_E001FCC1 
X-CRM114-Status: GOOD (  37.53  )
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

I originally gave up on the idea, but I feel kinda bad for Drew now, so
trying again:

2025-05-28T12:21:59-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/28/25 8:09 AM, Andrew Jones wrote:
>> On Wed, May 28, 2025 at 07:16:11AM -0700, Atish Patra wrote:
>>> On 5/26/25 4:13 AM, Andrew Jones wrote:
>>>> On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Kr=C4=8Dm=C3=A1=C5=99 =
wrote:
>>>>> 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
>>>>>> On 5/23/25 6:31 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>>>>>>> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
>>>>>>>> Upgrade the SBI version to v3.0 so that corresponding features
>>>>>>>> can be enabled in the guest.
>>>>>>>>
>>>>>>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>>>>>>> ---
>>>>>>>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/in=
clude/asm/kvm_vcpu_sbi.h
>>>>>>>> -#define KVM_SBI_VERSION_MAJOR 2
>>>>>>>> +#define KVM_SBI_VERSION_MAJOR 3
>>>>>>> I think it's time to add versioning to KVM SBI implementation.
>>>>>>> Userspace should be able to select the desired SBI version and KVM =
would
>>>>>>> tell the guest that newer features are not supported.
>>>> We need new code for this, but it's a good idea.
>>>>
>>>>>> We can achieve that through onereg interface by disabling individual=
 SBI
>>>>>> extensions.
>>>>>> We can extend the existing onereg interface to disable a specific SB=
I
>>>>>> version directly
>>>>>> instead of individual ones to save those IOCTL as well.
>>>>> Yes, I am all in favor of letting userspace provide all values in the
>>>>> BASE extension.
>>> We already support vendorid/archid/impid through one reg. I think we ju=
st
>>> need to add the SBI version support to that so that user space can set =
it.
>>>
>>>> This is covered by your recent patch that provides userspace_sbi.
>>> Why do we need to invent new IOCTL for this ? Once the user space sets =
the
>>> SBI version, KVM can enforce it.
>> If an SBI spec version provides an extension that can be emulated by
>> userspace, then userspace could choose to advertise that spec version,
>> implement a BASE probe function that advertises the extension, and
>> implement the extension, even if the KVM version running is older
>> and unaware of it. But, in order to do that, we need KVM to exit to
>> userspace for all unknown SBI calls and to allow BASE to be overridden
> You mean only the version field in BASE - Correct ?

No, "BASE probe function" is the sbi_probe_extension() ecall.

>> by userspace. The new KVM CAP ioctl allows opting into that new behavior=
.
>
> But why we need a new IOCTL for that ? We can achieve that with existing
> one reg interface with improvements.

It's an existing IOCTL with a new data payload, but I can easily use
ONE_REG if you want to do everything through that.

KVM doesn't really need any other IOCTL than ONE_REGs, it's just
sometimes more reasonable to use a different IOCTL, like ENABLE_CAP.

>> The old KVM with new VMM configuration isn't totally far-fetched. While
>> host kernels tend to get updated regularly to include security fixes,
>> enterprise kernels tend to stop adding features at some point in order
>> to maximize stability. While enterprise VMMs would also eventually stop
>> adding features, enterprise consumers are always free to use their own
>> VMMs (at their own risk). So, there's a real chance we could have
>
> I think we are years away from that happening (if it happens). My=20
> suggestion was not to
> try to build a world where no body lives ;). When we get to that=20
> scenario, the default KVM
> shipped will have many extension implemented. So there won't be much=20
> advantage to
> reimplement them in the user space. We can also take an informed=20
> decision at that time
> if the current selective forwarding approach is better

Please don't repeat the design of SUSP/SRST/DBCN.
Seeing them is one of the reasons why I proposed the new interface.

"Blindly" forwarding DBCN to userspace is even a minor optimization. :)

>                                                        or we need to=20
> blindly forward any
> unknown SBI calls to the user space.

Yes, KVM has to do what userpace configures it to do.

I don't think that implementing unsupported SBI extensions in KVM is
important -- they should not be a hot path.

>> deployments with older, stable KVM where users want to enable later SBI
>> extensions, and, in some cases, that should be possible by just updating
>> the VMM -- but only if KVM is only acting as an SBI implementation
>> accelerator and not as a userspace SBI implementation gatekeeper.
>
> But some of the SBI extensions are so fundamental that it must be=20
> implemented in KVM
> for various reasons pointed by Anup on other thread.

No, SBI does not have to be implemented in KVM at all.

We do have a deep disagreement on what is virtualization and the role of
KVM in it.  I think that userspace wants a generic ISA accelerator.

Even if userspace wants SBI for the M-mode interface, security minded
userspace aims for as little kernel code as possible.
Userspace might want to accelerate some SBI extension in KVM, but it
should not be KVM who decides what userspace wants.

