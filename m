Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394BC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 01:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=da5rS2uI;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=p+FKN8ot
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uyg0B8ei3Mf4zbb08LWnZuHIxG8bAH3PwXAWr4Dyrgs=; b=da5rS2uI/P8kqh/AOR6xrIOorA
	f3MLCGLUrBzWyeTum1NqWUhLcgf0uruZpKF6i0kISaIyiCIMuUJRjIh+5LwpqMRwIzC7snbWQzKu7
	AOw8SzoAU8Vp4SLARajaGSg3ze8B1ijVb2ZHUIlQ0awYBGpLtKq0AX4LxdHQcEIkpctdM2W7swo/f
	uQt4NOSFKHqgflhNhu02QrArVQpnBVtNeEQFS9v6pRxtanAZYA/v6AjKhcZwK1pPECVioHMucSiw7
	0h7+Z8NAYSE57buc9WEPPAu0Mx4pjcYyrM+ZWKxqP+KAn27WCvRgqg3/K4Hrpe/Bi6gQcs00K5u6s
	jkQerMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhCJ-0000000FNF2-2yTJ;
	Mon, 02 Nov 2026 01:50:55 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhCG-0000000FNEa-0tws
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 01:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793584250; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=uyg0B8ei3Mf4zbb08LWnZuHIxG8bAH3PwXAWr4Dyrgs=;
	b=p+FKN8otQ7xNVORWIWqYsvdNoNKc9aHVvDhE8BxQigmE7QaEh3zcrvp/Vjy2mcSOriHJ7dmbUuYLRF0Co+lFvEkDBSa8aa0jdTeQE4gkrJp2QktV39UN/Bs4N29/pDccklShLZDv61Wkzm/gYmhakvjUT1wrj8wQ9ePUkpwiLxY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XDrTvp6_1793584248;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0XDrTvp6_1793584248 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Nov 2026 09:50:48 +0800
Date: Mon, 2 Nov 2026 09:50:48 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Arnd Bergmann <arnd@arndb.de>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] KVM: arm64: Enable ST64BV0 for guests with
 FEAT_LS64_ACCDATA
Message-ID: <qqspcqmrtdx6xj4efvaq6v36pmz7xks27dzev2qqmovq3kw6jp@vn5yptbp7hfs>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-5-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025075138.2919734-5-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_175052_711782_F2E14545 
X-CRM114-Status: GOOD (  17.38  )
X-Spam-Score: -15.6 (---------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 07:51:37AM +0800, Fuad Tabba wrote:
> Since commit 58ce78667a641 ("arm64: Add support for FEAT_{LS64,
> LS64_V}"), a guest sees the host's ID_AA64ISAR1_EL1.LS64, but KVM only
> enables the FEAT_LS64 and FEAT_LS64_V instructions in HCRX_EL2. On a
> host with FEAT_LS64_ACCDATA, a guest's ST64BV0 therefore traps and hits
> the WARN_ON_ONCE() in handle_other().
>
> Set HCRX_EL2.EnAS0 when the guest has FEAT_LS64_ACCDATA, now that
> ACCDATA_EL1 is context-switched.
>
> Fixes: 58ce78667a641 ("arm64: Add support for FEAT_{LS64, LS64_V}")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

lgtm.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

> ---
>  arch/arm64/include/asm/kvm_emulate.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index a3c1928bdf743..d07f72082531c 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -712,6 +712,9 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>  		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
>
> +		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnAS0;
> +
>  		/*
>  		 * NV3 is a host-specific extension, and we always use
>  		 * it when present and that the guest uses NV. It may
> --
> 2.47.3
>

