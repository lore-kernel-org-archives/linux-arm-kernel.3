Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA5AC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 01:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWlnN6iHkL3RXstnKSj+lwDH5uEBi7pc60tC98b9q5M=; b=2vb9gLL5CqKR6T893N7EYl2EWu
	POdekqfD63RkUCbSc3Wbv2NGxM/844we0P11+QQCypNiOY2Lzk2/OA5RgpzoHtnBx4Fyad4EoGBoD
	EdqOSyw48Xd092qb1TvDnOFYgINTUo+y2DgOpvKRAz//yXSOYDAYAHoQyKBmoxzcrU3+iFV+9i2NJ
	nHWNgol1o67AxY0x9Na+n8N33Esa1LAwpJUVdY42ifxxOwsJ7yuqbk0k/FAMzwNgje+7iUDAfe7rA
	Eni+EQFdC98FCXNQLwAnROANm2G+01aCNVsyb3bdy5tG88Ni18zZS3apOvBi/axHJcWjP6D2KHgsS
	v3ryjJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGpXS-00000007nQC-1ia5;
	Mon, 19 May 2025 01:43:34 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGpVA-00000007nCg-0P4S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 01:41:17 +0000
Date: Sun, 18 May 2025 18:40:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747618868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rWlnN6iHkL3RXstnKSj+lwDH5uEBi7pc60tC98b9q5M=;
	b=ax3Wmx+NMw1xkAkBzBtxFl9a4AKU6VRhBnUQDioRGl9wm2B5KQS0WtxoGTWHgH9XwFj3RY
	HVU7snQyW3kST5tf20n3Fs3zoSdg8K75cJyY7SLm4xvy/9y8X1uoEh7PGLvs1KrsueTMlm
	Lep5/UUMGpBXYRfobuFAAW727pTRADk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: Re: [PATCH v4 00/17] KVM: arm64: Recursive NV support
Message-ID: <aCqL8pZNAUdOeLJo@linux.dev>
References: <20250514103501.2225951-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514103501.2225951-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_184112_284401_3AB8F9D4 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 14, 2025 at 11:34:43AM +0100, Marc Zyngier wrote:
> Marc Zyngier (17):
>   arm64: sysreg: Add layout for VNCR_EL2
>   KVM: arm64: nv: Allocate VNCR page when required
>   KVM: arm64: nv: Extract translation helper from the AT code
>   KVM: arm64: nv: Snapshot S1 ASID tagging information during walk
>   KVM: arm64: nv: Move TLBI range decoding to a helper
>   KVM: arm64: nv: Don't adjust PSTATE.M when L2 is nesting
>   KVM: arm64: nv: Add pseudo-TLB backing VNCR_EL2
>   KVM: arm64: nv: Add userspace and guest handling of VNCR_EL2
>   KVM: arm64: nv: Handle VNCR_EL2-triggered faults
>   KVM: arm64: nv: Handle mapping of VNCR_EL2 at EL2
>   KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers
>   KVM: arm64: nv: Program host's VNCR_EL2 to the fixmap address
>   KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2
>   KVM: arm64: nv: Plumb TLBI S1E2 into system instruction dispatch
>   KVM: arm64: nv: Remove dead code from ERET handling
>   KVM: arm64: Allow userspace to request KVM_ARM_VCPU_EL2*
>   KVM: arm64: Document NV caps and vcpu flags

Let it rip!

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

