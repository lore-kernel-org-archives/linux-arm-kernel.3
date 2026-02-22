Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABDAC624D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0mNz9Mubye2MgsrTZAxnzG5GOQUdhjijzm5m9nKg2k=; b=GiIbuXDpytDNg40xKZk6favkVN
	tmyiTwt4UwoYgAWEbfdpyg0OgLLtKD41I/PGWxwkeiRSsEmW2amx4Y0KCfqzmWvozq/iEtSk0/l92
	e+mAnw01OQ7YD30s8k1XCubJyYm3eFxUxXJ0JNT265gCzV5B5prLRqwtPyeebUxAYpnjjRUtHhEPO
	EWOV6RoLWRZJ4lyw5QYrwJp7/jBlWXx1xt+Qv9IfsqeR4hGwQ4UruNbvS+/1a0gdPWGtSwD82Z9S9
	WTlNIkNaHPZ6hG8Go/Wo+aUZmoJku5/mvWofFFLa6TVLNkYVGb0qZsdX9K6YPq89tw50ksGTUUobG
	cguNKnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu4wR-0000000GbBI-2AQK;
	Sun, 22 Feb 2026 08:35:51 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu4wE-0000000GbAl-24F4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 08:35:50 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-506a355aedfso502771cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 00:35:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771749334; cv=none;
        d=google.com; s=arc-20240605;
        b=jPyWWXYCFtjm/1ZgLdoTV8zXfsM0ozlireWS9UsxUX2PDaJLhbtcWifybBL+aYgqBJ
         B8KuYhbfnZJ2KbK0+5ala9Ll9pW3QE2DniWHKTfhPsxETMgf1E3epbme2KdLcP9NDwUp
         VljK13Sd74/+2gIKyOMgjssbeV9MaSvXJcqZHU+fy2oNHiqcm24tk1lv1RnsxqjUlqQY
         TTdlamcv3H3fraXtJFPhfr+N8Tdmt/RSzt1t4yW62IQ4a8p+Kx3wUynNf3dSmSjeT1ot
         Jeu9s2wktJ4QReLS8Mr8hWDBOj8AARrr8JxRi/MFbN9/REgh0i4Jd/yLz/MfSh064P9m
         1plQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0mNz9Mubye2MgsrTZAxnzG5GOQUdhjijzm5m9nKg2k=;
        fh=ql2UwZAP+qwRCFL1tacwk3GvrKGHtXqKXWdlfAEmrkw=;
        b=UUNbZkwYsDO6WDfSYriZ6Wmj/2HF51ViK3D9OaO+VbI18FNximcUCvmUrno70WMl8G
         LAPe/PpQ8hIU9ZdiqIw8tyAL5S6C64cvrW+KbiTG/3LdxHOCyLLbOS7JkkcYOQWAed3b
         LHfeiMvq2FpTcAciAy4Zta7PHNW2e/BtVjeAokqi2g/irN1ruYsG0KqFcJYneMnNz8oS
         Qzs27oCa8f8j+V4JZdKws5i/9ZYSVKa4c827k7EB9j9mYdkhZl7CHD/PVWUtagv3Jx1M
         ePXZ6N3YAASz35Nc0l1knZauw5ky8MuMFSgG+5rYYyWkckrIuZBeX/YYaaAtefzOY2zm
         asAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771749334; x=1772354134; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0mNz9Mubye2MgsrTZAxnzG5GOQUdhjijzm5m9nKg2k=;
        b=nNsLX8n3pcT8PS3uE9zrQDJliu1SOcBHcoqOZEJ4Acn0CgkoCF89MCCv/It0cz/yfj
         ekKpe465CKY31mUL9WCpvTyNz+tKF5c6ZUG9f1sRtjQLGGjS04JacuLL5WVbIhO4lC2B
         Tf649jXMBIaXrC7RZ2avokspniCreupoE66okYevyLfWcEQdeLRWla6iLrfvxP5mZa7v
         AlcO5hnXidx95Y+bWvjrY4acYbUO6N5ECn3Inh6SNdZ2hgvOIdyTAUBiMExliNpMnWRa
         5eJDhJD1wlmTMB4DNZQLBKQXuRV+dV40GgV5mZD7rI+5htO9wtQ4VvtZw0/uytBhQq3Q
         gAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771749334; x=1772354134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0mNz9Mubye2MgsrTZAxnzG5GOQUdhjijzm5m9nKg2k=;
        b=SpyJ/R+sDSYBCNeAPcSC2H7Z60uw4za17sJuqSvvXBLkyuIi0Avkg0GuHMV7UK+wCG
         bVXpHUkuTW834xY/VoDB3SFdPjjeCqFoRqPn/YuGASt1ZOtq8taJTgx+CPWVudgv4SYJ
         AkU/UI+uu229QLU+6HY+vgVgE7JPxlJuqj0qrwqEUf4taaYXlUCcOLBlJizPkvpOGbr4
         QE+Dz7AuBcFEV8/wPH9gdoQMocnfT67RtDDpYH8gUEPvE1w/8Vr0Z1c0f7pqq27ZaieW
         q7AW14bnjTF+Stfs1YQNNWoxPD/wYY3+67xHWyMKWADPpbV6E0VNmSxPnokrQJGcM5iS
         yhPw==
X-Forwarded-Encrypted: i=1; AJvYcCXxq02R1kaGFVp+EpllTOhzLRRGJfsDIRk6AsViOZUg9MX9Ypj6qH39l8Ty2S33oy0n+OgFnAwKHZQPsSBYw1J7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy42DpLEhfPNVc0VF8eY4eEoiVDVXk2i7T4SLH5kV1gbOEpSXsu
	r7YjHIY0gl+Q0hHLEF8mG7UYR3aMFauvDrfh1Z+xcbikEN69tvlie6vPbb92ZbiVELUqD/XuLgp
	WRN9Y3dQ8CWMlDxlpo/Emb6msjrmHT772Ou03mwEu
X-Gm-Gg: AZuq6aKEzeQw8/YmBNT3JUh1wBgh6vg7kzm2V4y6OonrSR/KMCWjKBX+gahH8GKei/L
	1zNOJru9Mc8hvifv8GrWfZTgQ/D9l3T5FJMqN4dYKKQnPupV97L4w96RIT3IBW8jNQmQXffSEB4
	3zZzk4dURbFXTrP0hKTjybnbo07uSSaOV0lZKJENpKfzadhU9KbLblJooQRZmBk+eyWDbPUQB6i
	2WHqY5y2n69uadawsEDVu4H6WmJpU+jbDO4nIQlM1pu/hilQu6zhseT8gcsLdMGdxeDFmRQSWGV
	OMeLwlJz
X-Received: by 2002:ac8:5710:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5070e7e5187mr8428211cf.1.1771749333979; Sun, 22 Feb 2026
 00:35:33 -0800 (PST)
MIME-Version: 1.0
References: <60916cb6-f460-4751-b910-f63c58700ad0@sirena.org.uk> <87bjhie67o.wl-maz@kernel.org>
In-Reply-To: <87bjhie67o.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 22 Feb 2026 08:34:57 +0000
X-Gm-Features: AaiRm50gVnwK_ayhB9NZOZ4Rfg9Gj51P6wQTKXI500EE-NyuWrHGP9k906H1SYk
Message-ID: <CA+EHjTwzjjNuZSQExZUsGAXWdaH=Uf=z4ks2XQAXqaU4DcmD9w@mail.gmail.com>
Subject: Re: pKVM breakage in mainline on n1sdp
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_003540_284645_FC2DB79B 
X-CRM114-Status: GOOD (  21.90  )
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

On Sat, 21 Feb 2026 at 10:33, Marc Zyngier <maz@kernel.org> wrote:
>
> [+ Fuad for the protected mode stuff]

I'm unable to reproduce it, but I think the following might be the fix:
https://lore.kernel.org/all/20260222083352.89503-1-tabba@google.com/

Thanks for catching this, and sorry for the trouble.

Cheers,
/fuad


> On Fri, 20 Feb 2026 19:08:59 +0000,
> Mark Brown <broonie@kernel.org> wrote:
> >
> > Hi,
> >
> > At some point since the 30th of January we have started seeing issues
> > in mainline when running kvm-unit-tests on N1SDP in pKVM mode:
> >
> > TESTNAME=3Dpmu-mem-access TIMEOUT=3D90s MACHINE=3D ACCEL=3D ./arm/run a=
rm/pmu.flat -smp 1 -append 'pmu-mem-access'
> > <4>[  114.487201] ------------[ cut here ]------------
> > <4>[  114.487206] WARNING: arch/arm64/kvm/pkvm.c:393 at pkvm_pgtable_st=
age2_map+0x1ac/0x1c4, CPU#1: qemu-system-aar/1955
> > <4>[  114.502672] Modules linked in: stm_p_basic coresight_tpiu coresig=
ht_stm stm_core arm_spe_pmu coresight_funnel coresight_tmc coresight_replic=
ator coresight arm_cmn sha256 cfg80211 rfkill fuse dm_mod ipv6
> > <4>[  114.520924] CPU: 1 UID: 0 PID: 1955 Comm: qemu-system-aar Not tai=
nted 6.19.0 #1 PREEMPT
> > <4>[  114.529261] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS=
 BTYPE=3D--)
> > <4>[  114.536469] pc : pkvm_pgtable_stage2_map+0x1ac/0x1c4
> > <4>[  114.541681] lr : pkvm_pgtable_stage2_map+0x58/0x1c4
> > <4>[  114.546805] sp : ffff80008673b900
> > <4>[  114.550366] x29: ffff80008673b900 x28: 0000000000200000 x27: 0000=
000000200000
> > <4>[  114.557748] x26: 0000000000000000 x25: 00000000fffffff4 x24: 0000=
00000000000f
> > <4>[  114.565130] x23: ffff008047b65198 x22: 00000000080cbc00 x21: 0000=
000000040000
> > <4>[  114.572512] x20: ffff008046f65680 x19: 0000000000000200 x18: 0000=
000000000001
> > <4>[  114.579893] x17: 0000000000000000 x16: 0000000000000000 x15: 0000=
000000000000
> > <4>[  114.587275] x14: 0000000000000002 x13: 0000000000000002 x12: 0000=
00000031bf68
> > <4>[  114.594656] x11: 0000000000000000 x10: 0000ffff8be01000 x9 : ffff=
8000800728b0
> > <4>[  114.602037] x8 : ffff80008673bab8 x7 : 0000000000000001 x6 : 0000=
000000000008
> > <4>[  114.609419] x5 : 0000000040200000 x4 : 000000000000000f x3 : 0000=
000000000200
> > <4>[  114.616800] x2 : 0000000000040000 x1 : fffffffffffffff4 x0 : 0000=
000000000000
> > <4>[  114.624182] Call trace:
> > <4>[  114.626875]  pkvm_pgtable_stage2_map+0x1ac/0x1c4 (P)
> > <4>[  114.632088]  kvm_handle_guest_abort+0xe7c/0x12ec
> > <4>[  114.636953]  handle_exit+0x60/0x184
> > <4>[  114.640689]  kvm_arch_vcpu_ioctl_run+0x35c/0x968
> > <4>[  114.645554]  kvm_vcpu_ioctl+0x254/0xa50
> > <4>[  114.649638]  __arm64_sys_ioctl+0xac/0x104
> > <4>[  114.653896]  invoke_syscall+0x48/0x110
> > <4>[  114.657894]  el0_svc_common.constprop.0+0x40/0xe0
> > <4>[  114.662846]  do_el0_svc+0x1c/0x28
> > <4>[  114.666409]  el0_svc+0x34/0x10c
> > <4>[  114.669798]  el0t_64_sync_handler+0xa0/0xe4
> > <4>[  114.674228]  el0t_64_sync+0x198/0x19c
> > <4>[  114.678137] ---[ end trace 0000000000000000 ]---
> >
>
> The absence of any versioning information is really unhelpful. What
> kernel version is that? Upstream? Next? A date really doesn't help
> much, specially given how vague it is. Same thing for KUT.
>
> > The same tests running on N1SDP in VHE mode seem happy, and I've not
> > seen any other platforms showing issues.  Unfortunately due to various
> > infrastructure issues I don't have more detail on when this started
> > happening or anything, I'll update if I get more.
>
> I've ran that test on an Altra (Neoverse-N1, same as N1SDP), with both
> v6.19 and linux/master as of d79526b89571 together with KUT as of
> 86e53277 and nothing caught fire in protected mode, including a
> 32-parallel VM test.
>
> Most of KUT's PMU tests fail in protected mode though, probably due
> some issue with the routing of PMU exceptions (see below), but that
> doesn't seem new. Fuad, could you please have a look and see if
> something catches your eye?
>
> Thanks,
>
>         M.
>
> maz@filthy-habits:~/kvm-unit-tests$ ./arm/run arm/pmu.flat -smp 1 -append=
 'pmu-mem-access'
> /usr/bin/qemu-system-aarch64 -nodefaults -machine virt,gic-version=3Dhost=
 -accel kvm -cpu host -device virtio-serial-device -device virtconsole,char=
dev=3Dctd -chardev testdev,id=3Dctd -device pci-testdev -display none -seri=
al stdio -kernel arm/pmu.flat -smp 1 -append pmu-mem-access # -initrd /tmp/=
tmp.S6qLYpNV6X
> INFO: PMU version: 0x4
> INFO: PMU implementer/ID code: 0(" ")/0
> INFO: Implements 6 event counters
> INFO: pmu: pmu-mem-access: 32-bit overflows: counter #0 is 0x0 (MEM_ACCES=
S)
> INFO: pmu: pmu-mem-access: 32-bit overflows: counter #1 is 0x0 (MEM_ACCES=
S)
> FAIL: pmu: pmu-mem-access: 32-bit overflows: Ran 20 mem accesses
> FAIL: pmu: pmu-mem-access: 32-bit overflows: Ran 20 mem accesses with exp=
ected overflows on both counters
> INFO: pmu: pmu-mem-access: 32-bit overflows: cnt#0=3D0xfffffff0 cnt#1=3D0=
xfffffff0 overflow=3D0x0
> SKIP: pmu: pmu-mem-access: 64-bit overflows: Skip test as 64 overflows ne=
ed FEAT_PMUv3p5
> SUMMARY: 3 tests, 2 unexpected failures, 1 skipped
>
> EXIT: STATUS=3D3
>
> --
> Jazz isn't dead. It just smells funny.

