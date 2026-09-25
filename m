Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D13CC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3rbnL0mTjXgUEK5/Bs8TjZebjmAkHUgwjp+YFQ5wF8=; b=k1y2xjmQf8VvFNMWvAGYY9SaQo
	rlJY3QTTtdiRGh6gAALKvyRL+VoHrpRb2UDsc0Ziz0OT4cQct9lenixAY8hGcY4VrQg7SwWlgOxrf
	/0Bd58Q/QjbAWd5rojnQWKrPM0A9Dhwkgv+DFtyTpUvr9Qms8G/j+EY/uDXW2T5x0Lav2Cp467svY
	UFAiQHbbSga3T1Cirp1W62/VorCAJlbeVVXGbXMYVeUpsAloKsGPEOrHlaJGhp9YAoG5fRLME/pg6
	Dl77rjl1P40SY5fPZ/r5+MN2PiqWJNkvy+HaZTZBfnSgJPMKmCE82EowtOVZaoj7+9uNImxifCSgV
	G5Ofh2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1ew-0000000CwGb-0kKY;
	Fri, 25 Sep 2026 08:51:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1et-0000000CwFx-1C47
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:51:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 525746022F;
	Fri, 25 Sep 2026 08:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507691F000FF;
	Fri, 25 Sep 2026 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790326314;
	bh=S3rbnL0mTjXgUEK5/Bs8TjZebjmAkHUgwjp+YFQ5wF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NwQ5+zErr0eWfZ83cKssBNFBF9lNyuNXbkxYZzw+Ygnpp3iNHc26F7ogQgr/9Qx1b
	 n8xQvXwdkE5hPJL27dROeQ0oDkgrFXCHzQT9ZkWqZCff+n2zTU743gNOI9RR8gOmUa
	 QCsWVtTy/y1lmHedpO7xJpA/T+x0DgSp+e4I7tG7uirhV2Kpr5JPwtuIzPcvfGSTNW
	 R5Rl63O7zHZbGYxIcvYUVcux840pW1V+3w+VdAoYPinPM4QAZsppT6/nbb271bUoRu
	 qr7Eee0KEiLNoFrcisin1XR/oLcZTLvYRDPs/RQ1jpMPJNSdZuzL2kmJ9uOFji15TM
	 kWMcobWgdQwdA==
Date: Fri, 25 Sep 2026 09:51:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 00/14] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Message-ID: <arY1uKfUBXRpauaN@gremlin>
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
 <86ik3u4asq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ik3u4asq.wl-maz@kernel.org>
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

On Thu, Sep 24, 2026 at 10:08:37PM +0100, Marc Zyngier wrote:
> On Wed, 23 Sep 2026 16:15:43 +0100,
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> >
> > This series implements the KVM stage 2 page table pre-faulting feature for
> > arm64.
>
> [...]
>
> > base-commit: 23ddf997ab16b5f4aa9f948f5a68f5b35e4e398f
>
> In the future, please don't do this. I've just nuked this commit from
> kvmarm/next as I rebuilt it, and using such a random commit is
> counter-productive. Just stick to an -rc tag from Linus' tree, and
> that's it. I'm perfectly happy to deal with the outcome (conflicts and
> other funny things).

Ack! No problem, will do.

Do you prefer that people stick to the same -rc base from the start or OK to
roll it over to latest Linus's tree?

Not that I imagine it makes any difference in most cases.

>
> Thanks,
>
> 	M.
>
> --
> Without deviation from the norm, progress is not possible.

--
Cheers, Lorenzo

