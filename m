Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB35C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gADP7rDY+Aim+5KEmwjyMEJOxyUwFF8/OBHyG20/FUA=; b=WemCdEqQK4eUwoaB3OsNlQWr/I
	OAOuxtkXrNc5NwjdV+EbsXbdKUV5kDspYmr2a14IGs39tzIfs1269tRJfI85zy1TWwbFIj3nwIF/3
	pjXZBV4CP64zoKFUzRGAFcihKK4uTe/v55KAvVAlZchmDFZFDZeKCLVZmYdHhmJ09KLtKi7hHwmL6
	Rd5Dx+lvYfHQwvpKd4ZMUSby+jc+SpS8bZVMpVbXWkp91UYZA5WokRIHxIaOIaC9KofC7XlDw3WUh
	VAa5BHXbiT7nMS18tI6EHcjoNqET+ocknj8+ts8gwx+Bv2o7DSGK15VdFxlOTlVXMtbD1bLfLvrnr
	69JLFiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLNU-00000003M1l-1xdb;
	Fri, 09 May 2025 10:54:52 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKhV-00000003DSq-48AZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:11:31 +0000
Date: Fri, 9 May 2025 03:11:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746785486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gADP7rDY+Aim+5KEmwjyMEJOxyUwFF8/OBHyG20/FUA=;
	b=oeJVqoXzqvHiRN3YALK3a5w3UYfGRpQO+N4t0GHjMe0EjZ8C4TJwY+s8DH22NNVQbEqZ8D
	aFg0CxBak1q68+mfPJhXLlnm9PjE5BKbYIdKEt06F6WG2iv2sCE7rXB00plRCQgSBWwnat
	7I8cKYIOA5Tub8dbHiaHpQnAqV0baRA=
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
Subject: Re: [PATCH v3 02/17] KVM: arm64: nv: Allocate VNCR page when required
Message-ID: <aB3UxDxwXhz5iY9J@linux.dev>
References: <20250423151508.2961768-1-maz@kernel.org>
 <20250423151508.2961768-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423151508.2961768-3-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_031130_161328_2E0A2D48 
X-CRM114-Status: GOOD (  13.85  )
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

On Wed, Apr 23, 2025 at 04:14:53PM +0100, Marc Zyngier wrote:
> If running a NV guest on an ARMv8.4-NV capable system, let's
> allocate an additional page that will be used by the hypervisor
> to fulfill system register accesses.
> 
> Reviewed-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/nested.c | 9 +++++++++
>  arch/arm64/kvm/reset.c  | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 4a3fc11f7ecf3..884b3e25795c4 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -55,6 +55,12 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
>  	    !cpus_have_final_cap(ARM64_HAS_HCR_NV1))
>  		return -EINVAL;
>  
> +	if (!vcpu->arch.ctxt.vncr_array)
> +		vcpu->arch.ctxt.vncr_array = (u64 *)__get_free_page(GFP_KERNEL | __GFP_ZERO);

Think you want GFP_KERNEL_ACCOUNT here.

Thanks,
Oliver

