Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A776C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqeRSe/fBAb2n/0mwZa1SYGnzUiCy+Srfu+vQG7iB2Y=; b=1GaF6f31e61NuSUtJ2MvUjv1H+
	Nn+sgnKUMonlXYLQz+ocgLfFccm2BEBha/G67yPsibWX2N6/7QWV+cEgjKJ4suPedFBPcEW6DtHZT
	Ugl8zCtaTXdrYO2LZtYCNC8VgkDNCNudXRynEZM2kJAJ4MUMnfVB0PufV7xZPeVth91/EfyzhJi4p
	Qwj0gvDvfIdbvdMreUMRLlu17PGNQr14e7wclpfY//JrHcuDQIrPjWHb/49gE1DZ6qVzER3b+EjsI
	dWf5LnsI8MsHydu5Qi0mRf/3gxG2Ud420m83SSyhweqr+7/byitGzOqHBFpZUc7LYgJEeDrRF4S95
	E+J8D4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CvH-0000000BWW1-1SUn;
	Thu, 17 Sep 2026 14:17:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CvF-0000000BWVa-10M8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:17:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 825C11476;
	Thu, 17 Sep 2026 07:17:01 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C1533F86F;
	Thu, 17 Sep 2026 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789654625; bh=pb7xR/fKGsnfdWDmXTH00LDpPa2TSX9O10vKxJaowzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eeRtgkL5bs1S2xyfNJ2gM5/G0dKa7JgqqLs8Mvx1HweJTifaSacbPt06TMTz/FKIZ
	 efYEwPUsLaX0+BrIijEhkPpSWkBCeJbtN4cDGYpCzQSG5Ofv1oskfmsT243axwiu1c
	 Mv1+/flcmG5baHKvw+Q4ApkYTn0Yr98yNZoAfJH8=
Date: Thu, 17 Sep 2026 15:16:57 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 12/23] KVM: arm64: Widen the scope of "protected" VMs
Message-ID: <aqv2WdAxQ70uFbuj@e143914.arm.com>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <20260915160141.3543048-13-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915160141.3543048-13-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_071709_340486_D2D01AF7 
X-CRM114-Status: GOOD (  14.29  )
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

On Tue, Sep 15, 2026 at 05:01:30PM +0100, Suzuki K Poulose wrote:
> On arm64 we have "protected" VMs that run on PKVM as a confidential compute
> guest. Given we already have the construct of "kvm_vm_is_protected" in the core
> KVM code, use that for all confidential compute guests including Realms that
> we are about to add.
> 
> Use the VM flavor to detect the "protected" VMs by introducing a marker.
> Add explicit helper to detect if a given VM is a "protected" VM under PKVM.
> Change the existing users that precisely want to check the VM type. These
> include :
>   - kvm_arch_prepare_memory_region - For preventing memslot changes after pVM
>     creation.
> 
> All the others are retained as a wider check for confidential guest VMs.
> These are:
>  - kvm_vm_ioctl_set_counter_offset - For disallowing timer offset configuration
>  - io_mem_abort for dabt handling without valid syndrome information
> 
> Both of which are true for Realms too.
> 
> Realms support is restricted to VHE host and thus "kvm_vm_is_protected()"
> checks in the pkvm hyp specific code doesn't need to change, as the only
> protected guests it deals with is "protected PKVM" guests.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

nit: need to s/PKVM/pKVM/ on the commit message too!

Thanks,
Joey

