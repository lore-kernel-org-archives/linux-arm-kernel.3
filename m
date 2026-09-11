Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC6CC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 18:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyPGYtnzf4r7mkvvETaUX3dyuduLi00Fi7uTj0IG3cQ=; b=3cRk4vs+3AiRw6XioIX77IwgE9
	m4/Xl044iY684txPk/au4ek3flvK7FqzZIu+2FkQ61cUM8WW7zBFPQXcjR3WThnc54Q8RyvhNRvuV
	cbcvKQecwd9vrU2NmQ7Pb+IwpRfq7NVZerSw7XS1czKgzdUSkY8naTdADebwQhsF/xeoKPjMf0BJD
	X2zGv0aof9JU6KBCjS7IFCDVAuF9H8LIQZsoxSqSs+K77hYcMTe5wJ7xnrqffIRpDHk7sGa/Qt5Jd
	EPUCsEPmxVVEYVcrwiTReOEjUIBmRiq6132o5+YUhhHCD/cjVhGcfxuaQBXbLUesNxI521DLkuQbQ
	QZpAkkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56RI-0000000HUX7-3VBa;
	Fri, 11 Sep 2026 18:57:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56RG-0000000HUWi-0K3s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 18:57:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A1331477;
	Fri, 11 Sep 2026 11:57:24 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00CC73F7B4;
	Fri, 11 Sep 2026 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789153048; bh=wc9nLSphBOCT1DkhLyV+K0eqkiSCALgzgP5PlYhJbIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVaR9MbJyw2GqzIHwA3ysXfqcfdAaAWFOi+2Ipcd7N4AcQM//flL019SAtbrnoxAt
	 K8fe7QzwxzUkrvQRomXTzyWAeheFEtuCZ1yOS/pydtS0bdnetFtlfXIoI5rXopMN84
	 EKhRjZzsVq8/ZulFFDblC1dwHkjbxb072t+XL0cw=
Date: Fri, 11 Sep 2026 19:57:17 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, ljs@kernel.org, 
	Shen Yongchao <grayhat@foxmail.com>, Karl Mehltretter <kmehltretter@gmail.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] KVM: arm64: nv: Fix life cycle of the nested_mmus
 array
Message-ID: <klqsux4hc7qalbo7pev3yjpv5tywenjdpinm7tjblhhdf3l2jy@n2s5lqc5jtwd>
References: <20260911162203.1919330-1-maz@kernel.org>
 <20260911162203.1919330-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911162203.1919330-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_115730_346665_83533E38 
X-CRM114-Status: GOOD (  17.58  )
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

On Fri, Sep 11, 2026 at 05:22:02PM +0100, Marc Zyngier wrote:
> The nested_mmus array holds the shadow page tables that are used when
> a guest is running a nested context. These structures are allocated on
> VCPU_INIT for whole guest, which implies that they may have to be
> relocated as the array grows.
> 
> Should a VCPU_INIT occur whilst a vcpu is actively running an L2 and
> that the allocation requires relocation, that vcpu will still be
> running with a pointer to the previous structure, which will have been
> freed.
> 
> Fix this by turning the array of structures to an array of pointers,
> which is now allocated at VM creation, sized to the absolute maximum
> that KVM can handle.
> 
> In turn, each VCPU_INIT contributes S2_MMU_PER_VCPU to the pool. No
> reallocation is ever performed, and the life cycle of each object is
> much clearer:
> 
> - the nested_mmus array is allocated in kvm_init_nested(), and freed
>   in kvm_arch_destroy_vm()
> 
> - s2_mmu structures are allocated in kvm_vcpu_init_nested(), and freed
>   on kvm_arch_flush_shadow_all()
> 
> Finally, the freeing of vcpu->arch.vncr_array is made consistent
> rather than being done on some failure paths, but not others.
> 
> Fixes: 4f128f8e1aaa ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
> Reported-by: Shen Yongchao <grayhat@foxmail.com>
> Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
> Suggested-by: Karl Mehltretter <kmehltretter@gmail.com>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Link: https://lore.kernel.org/r/20260803224405.41468-1-kmehltretter@gmail.com
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>

> ---

[...]

