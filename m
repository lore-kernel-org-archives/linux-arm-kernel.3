Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00551F94CBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Xcz9CYPC363PivJ1ShBkKDFYaBKLjcqla3XMKQIQK8=; b=3+k72hAIe9VeiH4AeQhRZf9o56
	pzjmQ5/2xnUfMhu1giPvJUFqfFDcxWiNfrOBNKxS2mZwC0nlW1trm9G3A5HCxxVYjbMMAAG7PUFqT
	rIA1CSJIGz1MQAokGWgGIZ3bNhesc53c0zMVt3EOD2bwxMPec3frJhJmLwbdu0N9s/V8kMFNDhX0O
	DlxR+Kebx/XM78VBJvRDTnMaBlFsYQYgYMZUCxUorLItH583lbQukg/SOEFVDMFpW0QfPQDvHlTIz
	Bvj4TFg+RAbmTtJUTfU1e/f8u1ynxkTOQCAVeCw3pYNeeIbyM7MGQz+WjuEpQHmG5+LVRLotGEqu4
	vJP5BCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZfQ-0000000ARgb-2Hrh;
	Wed, 22 Apr 2026 15:39:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZfM-0000000ARgF-1VG2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 15:39:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBD571F91;
	Wed, 22 Apr 2026 08:38:55 -0700 (PDT)
Received: from [10.57.32.235] (unknown [10.57.32.235])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF6DE3F8C6;
	Wed, 22 Apr 2026 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776872341; bh=Fz0I0zdiIejPqo2fAKgtSisMhx3AW0yDRfF1JcO1hXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BZINp1L1XdBSrjIHRvb4H2Iv16+MM4n2gTpPZqbFR+wEP5MiLzcvOi51Qfxb0Gkgm
	 IqRuVK5wHQCKCQ2rN8MeGr2NyCbM/PH5fjSTuwwi+UODPfWinLpHFI11tOI8dRLwZF
	 1SBxy806RBkOJB1+oFVWfjVzSvnY4w4lruszIoWw=
Message-ID: <49681ba6-da62-4d1b-8f82-34a6488abe97@arm.com>
Date: Wed, 22 Apr 2026 16:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Jiahao zheng <jahao.zheng@gmail.com>
Cc: alexandru.elisei@arm.com, alpergun@google.com, aneesh.kumar@kernel.org,
 catalin.marinas@arm.com, christoffer.dall@arm.com, fj0570is@fujitsu.com,
 gankulkarni@os.amperecomputing.com, gshan@redhat.com, james.morse@arm.com,
 joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 sdonthineni@nvidia.com, suzuki.poulose@arm.com, tabba@google.com,
 vannapurve@google.com, will@kernel.org, yuzenghui@huawei.com
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260421135145.14789-1-jahao.zheng@gmail.com_quarantine>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260421135145.14789-1-jahao.zheng@gmail.com_quarantine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_083904_616913_7FCCA87D 
X-CRM114-Status: GOOD (  20.27  )
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

On 21/04/2026 14:51, Jiahao zheng wrote:
> Hi Steven,
> 
> I've been testing CCA patch series and noticed Realm VM cannot boot successfully when the host is forced to run in nVHE mode (e.g., via `kvm-arm.mode=nvhe`). The kvmtool debug information will be truncated in set_guest_bank_private_gpa. 
> 
> Currently, in `kvm_ioctl_vcpu_run()`, running a Realm VM (REC) bypasses the standard nVHE EL2 stub. `kvm_rec_enter()` directly executes the SMC instruction to transition to the RMM. Upon returning to the EL1 host, the code falls back to `kvm_vgic_sync_hwstate()`, where the VGIC save operation is explicitly skipped for nVHE. Since the EL2 stub was bypassed, `__vgic_v3_save_state()` is never executed, and `ICH_*_EL2` states are lost.
> 
> To resolve this, I have a couple of thoughts:
> 1. If Host nVHE mode is not intended to be supported for Realms:
> Since RME implies ARMv9 which mandates VHE, running a Realm with an nVHE host might just be an unsupported edge case. If so, we should explicitly reject RME initialization or REC creation when `!is_kernel_in_hyp_mode()`. This would cleanly prevent the undefined behavior.
> 2. If Host nVHE mode is intended to be supported:
> Since RMM should remain agnostic to the Non-Secure VGIC states, the burden of saving these states falls strictly on KVM. However, the EL1 host cannot access `ICH_*_EL2`. Therefore, KVM needs to add specific logic for this scenario. We would likely need to route the REC exit through a dedicated nVHE EL2 stub to invoke `__vgic_v3_save_state()` before dropping back to EL1, rather than jumping straight back to `kvm_ioctl_vcpu_run()`.
> 
> I might have missed some documentation or comments regarding nVHE restrictions for CCA. If this is an oversight, it would be great to see a check added in the next iteration of the series.

Thanks for the testing. Yes indeed this is an oversight. For now option
1 is what I'm going to go for. There's nothing stopping nVHE mode being
supported but as you note any platform with RME will have VHE so it's
not an immediate priority to support.

One interesting case of nVHE is of course pKVM and for that there needs
to be some significant work to ensure that the EL2 hypervisor
understands the RMM communication and prevent any confused-deputy style
attacks. E.g. the host must not be able to map a pVM's private memory
into a realm guest.

I don't have any immediate plans to work on nVHE - my focus is getting
the basic support merged. But I know there was some interest to ensure
that pKVM and CCA would be able to co-exist on a platform so I expect it
will come in some form or another.

Thanks,
Steve

