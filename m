Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D285C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU5MDTrWcIPn0f9bdi37/3G3L8QSWUVNbMpQbtysNeQ=; b=e+jOwjOvLHXV79kUss1JJ+4ZFD
	WljExxDx4ajlOATihSbzABZc0taBvecFSnYYkxX/JW3V7LUUNiJvLwCat/D2OSQhNO+jqYE4uOyeK
	629naO83YtZYWg2aL0VvYEICuOWLjlNfQbYbEv6cHxvEAtOb9nnrrdQgjStd7jc1SlnNtqnN7Tp+t
	7iaNoY2Hk+D0T4XGAdfL8gBLsSCvtdSdvzeNxFDj2XhPOcuV9Y31hwNLnXb/xgPZsO9FIfhc+1Gmz
	nNEkKP/ZWi3WeoFYlnSG9wfqxjT9veO8Wg/kr02tFITJNkDJG+DsjZ/CJcN/ZTLnmoHPtwAHmhmBk
	bfXfaNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94LI-00000006Cbp-2HVf;
	Tue, 22 Sep 2026 17:31:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94LG-00000006CbB-2FFg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:31:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DE8943768;
	Tue, 22 Sep 2026 17:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24721F000FF;
	Tue, 22 Sep 2026 17:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790098302;
	bh=pU5MDTrWcIPn0f9bdi37/3G3L8QSWUVNbMpQbtysNeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e3bN9/IlMT809Q8HNhWzBbshsNy89YNRI7T0pc1ajitGhILxYyiV98IR/ZSzJM8lp
	 CZI38mav8zQha53451wcKYvERML7esM1Yxop/8fbqA6r7r5aZW+qerhlbuDm/BZDfZ
	 /7TgtU8BOaElRXDXXaoO0piTUuQjVhQIEgdtbJRDfcBaQ0+ss2CrbTTT3l2xXmVNVO
	 v0UHqAr+pPOon07E45yUbrlCPQzXGTanAqhi9FcceO6ADqo9AxTCnbJqXX/d6SLyjp
	 2NP6u7BByvQ7WsFllI7WWRHl9pQM8jd4l/neE6SD31Y02FHkvV3ryeiz9e+xmUdHh0
	 nnl2rOwNAtBxw==
Date: Tue, 22 Sep 2026 18:31:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
Message-ID: <arK7auq5X5TzViWO@gremlin>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org>
 <arKxjsxuO1F5ExrY@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKxjsxuO1F5ExrY@kernel.org>
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

On Tue, Sep 22, 2026 at 09:49:18AM -0700, Oliver Upton wrote:
> Hi Lorenzo,
>
> On Tue, Sep 22, 2026 at 03:17:55PM +0100, Lorenzo Stoakes (ARM) wrote:
> > +bool __weak kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
> > +{
> > +	return true;
> > +}
> > +
> >  void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
> >  {
> >  	int nr_vcpus, start, i, idx, yielded;
> > @@ -4365,6 +4370,9 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >  	    range->gpa + range->size <= range->gpa)
> >  		return -EINVAL;
> >
> > +	if (!kvm_arch_vcpu_allow_pre_fault_memory(vcpu))
> > +		return -ENOEXEC;
> > +
>
> nit: it'd be better to let the arch hook return an error of its choosing
> but in reality this is only going to be used by arm64.
>
> Not worth a respin on its own though.

Ack will fix up if there's a respin for something else!

>
> Thanks,
> Oliver

--
Cheers, Lorenzo

