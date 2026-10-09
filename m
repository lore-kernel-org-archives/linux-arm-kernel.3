Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B10CCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8E6Bi7bKMcAw5TwqvxCLAr9mz+479h38geJmPUDsO7U=; b=j6HqHPD8y3CHf9+ZxjUE4yF68N
	FGqAdxxxenWTnprkqTPFzoWhbCvAbap+n1/kb6wOVeabYL3kPfRaVxtzWPNm5Kl6BsbnnEZTpa6A6
	xyhYhfJ5b67zMQv+OcBJ9968Q7SjlHdmYo0jCDNptfgLp/HeFlo03Roi8UcIxoN17YmkaDYy/MQq5
	i6JNRyCAyFS3mHdKGFRUM2ufLSXnAEquec42hrqpWKmXOVNDQLPS2QfmWucmzE/BKsWqXE4KsFRBX
	l4ZEEGmyq3bWtbt/aS26r+l4clDITYdfHnuVWDIChZdjDGkikPww4+lajLxT0sFFp5fkLH3EDh4vs
	MXfb5bBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBTU-00000006Raq-24sr;
	Fri, 09 Oct 2026 14:21:28 +0000
Received: from out-49.mta0.migadu.com ([2001:41d0:1004:224b::31] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBTQ-00000006Ra6-4BpI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:21:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XumFm+JZ5sp20UCcl1zhPKdv9LGzZM2iFj9GOxKc9Og=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791555681; v=1; x=1792160481;
 b=rU7sJd0aIZyW1n2XpvCgEvi4uvsqUf1ycvz5fvCBKAPzovW2xOyhs++OdP9ievfP5akKzAvO
 D2NJqpSF4Zp5P+3jPCFxR0XX2AK/LPQNZsaAxaKu0ZFhpfyHv2qsQye7I58s70A9BYqilcMToZF
 vVPVpz49013zzrF6jmvqa33o=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fa5e88ec6f13c988;
	Fri, 09 Oct 2026 14:21:21 +0000
X-Mizu-Trace-ID: fa5e88ec6f13c988
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so7841e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 07:21:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLrqdnCO0ONXC6bF2cFB+2Gja3mCGXZcAwF93qaCyu0vuSUkT+Jcm9EyzEn+cCrwpoRmeRdZFli0GKhdFKb5P/@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4ivOZxUuUsxStp/s7Krf6EgnelJPAUPpdgnuYyAFhNTDxpT0y
	Dzq6yA0zTb0HhOZsWfofRZpZhpGwy6CcV24fMEg4gTvrJlf10rEx/kVEV54O3kwJPaxNS9+h+Jq
	L4t27vF0q/OU7V04xlvU6Qr32FnVQHxu9+9a9NAKv
X-Received: by 2002:a05:6512:1291:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcdf948b64mr90202e87.8.1791555680353; Fri, 09 Oct 2026
 07:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <179155224299.829527.1733164520192309991.b4-ty@b4>
In-Reply-To: <179155224299.829527.1733164520192309991.b4-ty@b4>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 9 Oct 2026 15:20:44 +0100
X-Gmail-Original-Message-ID: <CA+EHjTymHEqCJco+d_yy33ndqPPsoZARhOQZ5A0Zwc5N3SV4Qg@mail.gmail.com>
X-Gm-Features: AclHuK-kdu9KsnePYPGj9T-71wgfKb376h2mI-vnllt523DbHScqL5HOwi_XcNU
Message-ID: <CA+EHjTymHEqCJco+d_yy33ndqPPsoZARhOQZ5A0Zwc5N3SV4Qg@mail.gmail.com>
Subject: Re: [PATCH v23 00/14] KVM: arm64: CCA: Add basic plumbing for Realms
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, will@kernel.org, catalin.marinas@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com, 
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com, 
	jonathan.cameron@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_072125_320912_B7181010 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Marc,

On Fri, 09 Oct 2026 14:28:03 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Of course, mmu.c is where the crap happens, so anyone with any interest
> in this stuff being halfway sane, please review the conflict resolution.

I went through the mmu.c resolution and it looks good to me. Unmap and
aging are still no-ops for protected VMs, their abort handler is
unchanged, and the default op keeps the tracked unmap for nested MMUs.
Two minor things you might want to tidy up.

kvm_vm_stage2_unmap_range() repeats the lockdep_assert_held_write()
and WARN_ON(size & ~PAGE_MASK) that kvm_stage2_unmap_range() already
does before calling the op.

The VM_WARN_ON_ONCE() in kvm_vm_mem_abort() reads the ESR from the
vcpu again, where next had moved these checks to s2fd->esr. It's the
same result today, since the only caller handles a real abort, but
this (and dropping the vcpu local) would keep it in line with the
rest:

        VM_WARN_ON_ONCE(kvm_s2_fault_is_perm(s2fd) &&
                        !esr_abt_is_write_fault(s2fd->esr) &&
                        !kvm_s2_fault_is_exec(s2fd));

Cheers,
/fuad

