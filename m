Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C039BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4AexOQ3ACPOmP3EG8HHzPByHhgFEckUB6lzdNEoOVg=; b=ZlQ3qS2GphAciUgV3r3kzQiJ9A
	PLuZ+LYpqnu04pYevL11KTZV/4KaNBgkDZ/RVa7aowkBx2IJkxMf2X/Lemq+FQyaInRFRR0HNQ0jz
	aCIxhLf8EqUbWnrY9uw1pwEv/214mOFWi5AwlL/7SDq/0h9iyqcVFQ23+txTiFm4U07YrY9vcCOuT
	Bd3T0FlxV2pzVolgL5rdxcRKqRhuOD3fUFc+RsZJ7lG8CSJGG9tdJUX3c+0eBxTNAKa/CSyxS7MDc
	U7lo3Wdl/h7H/drBZz2s1k8mvPxILp282UNtbWnDt9zzoI/gbPGo28jx8xj1LFOStQfnt2gugozng
	WS6jIICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93gJ-000000066OX-1vUB;
	Tue, 22 Sep 2026 16:49:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93gH-000000066OC-2uQ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:49:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4ED96022A;
	Tue, 22 Sep 2026 16:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A231F000FF;
	Tue, 22 Sep 2026 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790095760;
	bh=R4AexOQ3ACPOmP3EG8HHzPByHhgFEckUB6lzdNEoOVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DI4wOHa1jlK/tZ5Aohia2c4vC/sHBoYOV9lXGW5rdftXypESRR6UQTmXvokxO+0ST
	 jOKi/wnZW31ZepETxPHNJABRK2qKpaizlemVBP1OZFMUizMAXM0XK1KsWR5BL8D1g8
	 5m1jdNshgWjb94mV6ixKg2nVbUzZGQTXrYcA8T5hDQvy7RAa/amsAsjuB5F+I5m16Y
	 M2Q3xlmgjCkFSt2RwjYS7Dl3/nfeljdJpacgDE0pEUddYmHhL578RG/Iq2txVLYeAJ
	 nUtZFx/YPSggq+ZMlbJLVN/ujZIZyyrsSRCrxvZqAxTrsg+K1NT3pX5+jGFMUT5hK+
	 HIyhaHcp1jzAQ==
Date: Tue, 22 Sep 2026 09:49:18 -0700
From: Oliver Upton <oupton@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Jack Thomson <jackabt@amazon.com>,
	Jack Thomson <jackabt.amazon@gmail.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Leo Soares Passos <Leo.Bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
Message-ID: <arKxjsxuO1F5ExrY@kernel.org>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org>
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

Hi Lorenzo,

On Tue, Sep 22, 2026 at 03:17:55PM +0100, Lorenzo Stoakes (ARM) wrote:
> +bool __weak kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
> +{
> +	return true;
> +}
> +
>  void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
>  {
>  	int nr_vcpus, start, i, idx, yielded;
> @@ -4365,6 +4370,9 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  	    range->gpa + range->size <= range->gpa)
>  		return -EINVAL;
>  
> +	if (!kvm_arch_vcpu_allow_pre_fault_memory(vcpu))
> +		return -ENOEXEC;
> +

nit: it'd be better to let the arch hook return an error of its choosing
but in reality this is only going to be used by arm64.

Not worth a respin on its own though.

Thanks,
Oliver

