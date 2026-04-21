Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9678F5A8D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 01:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bsPTwr1gAw0STIXQVY5UeTADBqDM+iND31hoYyVkv0=; b=38DHyPIVx7787Zrmq3kD9Mx6Gr
	cBVL+47tmGjQbZCqoc1PeIPZDn/0VGIWK5pbEkwMJ2XpGCuXFa0bwDkZmctB3puy82+ph6MOTP+6/
	Yo7xN3AUco84pMJljZWCzPdeCVTpnJfYLwtWObpnA79ilHzHXHv5BL38jwEOqR8kGfelbDam9U7iV
	X+4SbQ/OytdZbKgizuY8PWHgKxTcRKosuY8mNRQ4CSwjcwJBHyolLk92VkDKAymL+vxTJVclfwQZe
	Xce9XgznqbcuMT/Rq8W46xPSZFnnhRnf2QtfRemx7qdl/zweG2u2IVdnJHWbRlXYf39xd4T9+6h3s
	D4ZGBXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF0Dp-00000007uRi-04gl;
	Tue, 21 Apr 2026 01:48:17 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF0Dn-00000007uRN-0A1Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 01:48:16 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-651bf4a4140so3798069d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 18:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776736093; cv=none;
        d=google.com; s=arc-20240605;
        b=OmINBFwYZ2WOkJaZ72nw0ksOD2SF3ExkzlrwEsqMq1i1k6TvQTXClGL25E+3RKW06p
         mnt6ybN5mjKs7fpeU+G9catRBe6aCXAA8/yl5zcr/m7ur5vrHB4yTeuO4KOGkeaOmQPf
         kktKOT/UwzvSgRhFb/GF8zfzbKNoNy6ng1mpFdWq+ED7XJauyay4m/wyV83eL6tbYbfN
         oxBh/52+2mgzqMKEMG3oZ4wyAjzwqA/LBpGmtoGAEx8MxudZGfY0VYLciLXxSvLHGrl+
         J9IBBkDRYAQYhW7QVQfDNb3uZ9cnpiUSCzFnGmJUvezOZPtNZSgV1Nfn3TUKx2obzqlY
         BkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bsPTwr1gAw0STIXQVY5UeTADBqDM+iND31hoYyVkv0=;
        fh=wP5dZ34TSEN4eDUfcd3xaKVdNM9/RR5/6KKymy8WnMw=;
        b=DJjW2NyizyknV8vd5xOxccVMgPVYJM0DuxdTWZePcbCOpdLZEohWnhpB+bA/MWN+Z6
         8A/8qF3kbAaRaHpEqIbODO2RYmDoU+C3oeA+UPvIkmsaWzZXldxw4U6cf3SFcd/L2k9+
         LkDV+I8g/NsG5N8Po7dYoi/45KRj8kW62/4LM5YtKXf49ebpplhpkxJJaNGwFuXg+in1
         pvYMzl7suzgeieSTmNhiAm1IzQQ9YVINpbLGSrenlnFjtco84H+yLeLK/ZetPKPR/tSY
         zbKqI6PQn09LH977jBKNL0Li+SgAgGRLpxvrIel2CJa3P3ZcL/nJh2+3ooAKGzGVApRR
         Xbiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776736093; x=1777340893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bsPTwr1gAw0STIXQVY5UeTADBqDM+iND31hoYyVkv0=;
        b=mMolRQ1iuAQw9OP9uv/nwUAYgnXpw+IWCOXDxaFzdCi305UY77EyuvMMfUJ2ZIXxH0
         2ou6ET+gU8I/TAxcHQeZlD+Srn/oz51eF2w8GFMgmJZvm36l96Yb0Ta58tFeQ8VpLsgG
         UxHyLN68n9q7poTmOoCFR1BDqrCNEDuhiWBHVclrfK0SIQAZrRy23AzjmKn8czYk0RHL
         E4FQmzESSkv3C7T4bvGgN/mN/iADhHaI7pGyClA+DU2oxXKtYBpk1MDfMk+H62tcHZs1
         acR/XCZBYp1sr0whwis2yEkg3/+1BRtX+zzVaW41LXXkcOQhF2F2UbQviVBG6LVJ6aIC
         W+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776736093; x=1777340893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1bsPTwr1gAw0STIXQVY5UeTADBqDM+iND31hoYyVkv0=;
        b=TO+go4PlvMlZhqVMDdo9mTs8VnL14pP1W+shDAwpeAoLj4aOaJVl/Qbi/o5ImMBpiz
         TrKIj0YwyU2MZ2zKYTeA2MpGbpBLFYl0xgczRj1a9p0XLmIkl4Bd7A5pdTqYwLoFbzHK
         7k/ogbjnmMW4crGptqFrrT/Rdc34twgcWfaPYrSUtJcWBHCLQnx4HOpFfMVb94p+F4TF
         mqwvRZTKnoVUnXK7g0gSQ5Hh4Fou8AjBoLao6D5SOxjbjt0e5jeQICF2iyvSieJhQfZP
         83QwN5CI6hfUB2t7XUa+RYP/5HCWkUr0t8T2nKgM1TwVvAUpny6NaPtsXen4k+kbSWCB
         ajsA==
X-Forwarded-Encrypted: i=1; AFNElJ9yGjphjgUxbuWKIoYowYGZ0oM05Ih2znJOTSMaSbgRuJP93E19GwNSN/UktYcFq9pUQ2M1zx0Ip5gSAsRdM26o@lists.infradead.org
X-Gm-Message-State: AOJu0YwdmITyc74WNkMNY7zfybZocSl0/bL1By4shOcicrY21kg1e+eh
	sv+aonp03dFd/KqRyoyVl0SJXf/adbmohxlCG9hP1cGHKSmYDf9wAQVjzDlfs0isFLzvFrO4Uhc
	vDKPUhmLELpOmr/soQoSzB+knYntEsWc=
X-Gm-Gg: AeBDietbF7Hq/MTI/NUzY68sAvl66FYwctSNJQTwd4BceAoggRavj+MTjwaUt6hBSuP
	YHRl7plsgiSFltHOGjIWkS93nrE1w1LqP+zDkHC14FIaMHTNgp8/IxKb15wOC8YIg0/DGlpNH3L
	F3U2unGq4bg+bbvXNGrRcllzHKQ8AW5jePY1E6uFIXEeIoWOZKMhUXEo4wZrHN2XheH91YtoySc
	izD31/mqEa/MihUm846eqlK2cuj4hLKDzdjFFARK1aDLlIkdvNbk89f1c5lGDTPeYR9jgWxzOQb
	gNtJ594pImH+B7KVexJY/zdZygTZa2qXYBVkXt8s7c/aZkbf8aGezI7QO+hdRMubCVenh3msRm3
	AeDZ2
X-Received: by 2002:a05:690c:c511:b0:7ba:f056:9dfa with SMTP id
 00721157ae682-7baf056a27amr61371247b3.27.1776736093552; Mon, 20 Apr 2026
 18:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260412080437.38782-1-kartikey406@gmail.com> <865x5r2dik.wl-maz@kernel.org>
In-Reply-To: <865x5r2dik.wl-maz@kernel.org>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Tue, 21 Apr 2026 07:18:02 +0530
X-Gm-Features: AQROBzDLrHnv7airCGGjaBWUTwxc6pwlsiqRT1yXWgBrUbR7TxbGb5jMVqZbUDc
Message-ID: <CADhLXY4pL2BrPukVxr_kySzx48gMt7zFxOq8=eFSXqOB4at7aQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: KVM: Initialize vGIC before preempt-disabled
 section in kvm_reset_vcpu()
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	drjones@redhat.com, christoffer.dall@arm.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	syzbot+12b178b7c756664d2518@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_184815_090947_3CF3D11A 
X-CRM114-Status: GOOD (  27.27  )
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

On Thu, Apr 16, 2026 at 7:50=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Sun, 12 Apr 2026 09:04:37 +0100,
> Deepanshu Kartikey <kartikey406@gmail.com> wrote:
> >
> > kvm_reset_vcpu() calls kvm_timer_vcpu_reset() inside a preempt-disabled
> > section to avoid races with preempt notifiers that also call vcpu put/l=
oad.
> >
> > However, kvm_timer_vcpu_reset() eventually calls kvm_vgic_inject_irq()
> > which triggers vgic_lazy_init() if the vGIC has not been initialized ye=
t.
> > vgic_lazy_init() acquires a mutex and calls vgic_init() which invokes
> > synchronize_srcu_expedited() -- both of which may sleep. Sleeping insid=
e
> > a preempt-disabled section is illegal and causes:
> >
> >   BUG: scheduling while atomic: syz.1.49/3699/0x00000002
> >
> > Fix this by calling vgic_lazy_init() before preempt_disable(). On the
> > second call inside kvm_vgic_inject_irq(), vgic_initialized() will retur=
n
> > true and vgic_lazy_init() will return immediately without sleeping.
> >
>
> I think this really goes in the wrong direction. Forcing the vgic (a
> global resource) to initialise when the vcpu's timer (a local
> resource) is reset feels at best bizarre. Now you are promoting it to
> be forced at vcpu reset. This makes things worse.
>
> You probably want to take a step back and look at *why* we end-up
> here. The core reason seems to be that the timer emulation caches the
> level in a per-timer structure, and tries hard not call into the vgic
> unless the level changes. Which means that unless the vgic is
> initialised and is able to latch that state, the initial pending state
> will not be propagated to the guest.
>
> But do we need this optimisation? I don't think so. Other emulated
> devices don't require it. We can let the vgic know the state of the
> timer at every vcpu entry, just like we do for other virtual
> interrupts that the kernel injects (PMU, vgic MI).
>
> Once you remove the this cache and the need for the vgic to buffer
> things outside of normal execution, you can also drop the magic init
> from the interrupt injection path, because the injection will happen
> on the run path, just like any other PPI.
>
> That'd be a much better approach IMO.
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


Hi Marc,

Thank you for the detailed feedback! I apologize for the delayed
response =E2=80=94 I was away on holiday.

I understand your point. My fix addresses the symptom rather than the
root cause. Forcing vGIC (a global resource) to initialize during
timer (a local resource) reset is not the right approach.

I will take your suggestion and work on:

I will send a v2 once I have something ready.

Thanks again for the guidance!

Best regards,
Deeanshu Kartikey

