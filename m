Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1856C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxCLEz1PghbmSfANEGJ8sv05BrOJB/Cjk6EI/rqDqno=; b=Gk/vM1H8C/t/glwCcXGummfRyt
	g+kodISwiP7wyaj5Urjups7nF5wTfRbLP9LGI3z7jIFSAipO/p1bvk4o7/2LUEm3Hf4za2EV9YJj4
	RfxCeApdLcFoTdwAQ8bWovyfS6fd/6VSQs5QLMvfTTKD2zmtXrkhDgx99s7v6vLuSuo/scZpi4yRT
	D6n1l2/0TvI/pN+J4sr1vtTPVhHrDxqjfMNdKijEc06GYTSb3zUKMX8QWkIp6gkt7V4S0FlrD2bmW
	esIHlrNSPga99c+q+5I3GTaFZY5WLQRjY2G/yc+md0LRuIxl+SqaHde/YFP8XhOqkkens9Hmcut8f
	G0stwC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AEj-0000000BBLa-0P4U;
	Thu, 17 Sep 2026 11:25:05 +0000
Received: from out-155.mta0.migadu.com ([2001:41d0:1004:224b::9b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AEg-0000000BBKu-0BHU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:25:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6cLtGQr3NeN6cuI+wwoUX8J3Vbq5/m8fhyoeTXSQu5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789644299; v=1; x=1790249099;
 b=AtFsGbdnKtv1QCYZ5c7GAg/57poJEc+AZLtD111yKUx4LYe6k35Mru4Wz0H9Z3kLXdkqtN57
 kHsNDdaNAnPqqk3CkwrxrMUp5fgO/JfaEpSOJD1WLhImUg1eGJsTJG+DPUQSCfUDG7EMGmeRD74
 ytEdwJLHz0+oaq+Ja/CILpT0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 08be7c9af8d1d308;
	Thu, 17 Sep 2026 11:24:59 +0000
X-Mizu-Trace-ID: 08be7c9af8d1d308
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso868e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:24:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBylg313BV6bPdvVmV17UFRbRBgGlZOF39YEiX7qH9gG/gzkF7piQ9Ri9h9PKw8q+89Xluhqt/SX1JvQBy/+kN6o@lists.infradead.org
X-Gm-Message-State: AFuF++mJlnbtxjT+9P5ilOj01us4/ov15+XWU/aVCzxqcH5PPa//Yl2I
	23u80Kad3E5OzuRpKDrdCHEAOvwGsW1wNrhhvGZewrreg+r++5W5MJETCoIou4JPWpwT/+0ctQ9
	cL8q/qOrUHjVPMn+4PpFR2KJIkfqUtIPTmZFvAABs
X-Received: by 2002:a05:6512:3054:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b8bff4a5d7mr13058e87.15.1789644298430; Thu, 17 Sep 2026
 04:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-6-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-6-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 17 Sep 2026 12:24:21 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz65G0MM=tOrzmk=jMweBX1us6FqfrmSkQs4KSyAEoxhg@mail.gmail.com>
X-Gm-Features: AcwNN1VFMe-nqpetX5NFULE-T8FsNAG-h344sw-wYzui_i8Ztl6ucWB9ep0N7uI
Message-ID: <CA+EHjTz65G0MM=tOrzmk=jMweBX1us6FqfrmSkQs4KSyAEoxhg@mail.gmail.com>
Subject: Re: [PATCH v18 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_042502_394078_CA4B8E51 
X-CRM114-Status: GOOD (  12.18  )
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

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:23 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> +#define kvm_vm_hyp_is_pkvm(kvm)                (is_protected_kvm_enabled())

I'd keep is_protected_kvm_enabled() at the three call sites: this
takes a VM and ignores it, so it reads as per-VM when it's the mode,
and patch 20's comment about not being able to use the kvm_vm_ helpers
with a NULL kvm goes away too.

> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
[...]
> @@ -432,7 +432,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
>
>          hyp_vm->host_kvm = host_kvm;
>          hyp_vm->kvm.created_vcpus = nr_vcpus;
> -        hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
> +        hyp_vm->kvm.arch.vm_flavor = READ_ONCE(host_kvm->arch.vm_flavor);

Could EL2 reduce this to VM_PKVM or VM_PROTECTED_PKVM here instead of
storing what it reads? The host supplies the value, and it's now an
enum rather than a bool. Patch 12 relies on EL2 only ever seeing those
two, and with VM_REALM above the marker a host-written value passes
kvm_vm_is_protected() but not the == form, if EL2 ever adds one.

Both hunks are new since v17, which is where I gave the Reviewed-by.
Happy to keep it if you can settle these please.

Cheers,
/fuad

