Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47462C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKZPATLBOD75vX0HIDgrKuKrxajG+GHW7KZeSn5i2h8=; b=c/50dlhiNNpDf2u5w3/tu7rwdC
	ee9GyXGqWPatfp9Eg3aBIAioDaH9zG6CNmdU6uJiKZdE/Q+G1TdIiFuX91v7c7ngMwnzxEMhBOWET
	Db4YxQhyW+NdQPR92hw2P8R/4u6dcNzyaeXzaeUCxUL1VdkFPO5LDMWR9gxzlOvcrMKCHEVq+Ii+6
	gKG1+dCYpQFkfzgEDufZU1edvSnjFDLFnEqwg10LDwe/xdtoZG4w8cVAHWlrnss36NC4XoSPFLvNQ
	uH9L0UFkKtYXyxAY/rR1R+Kh9OD0ovxOXjvQHWKqCj8WOO9pE4BidipseskIq4OWzfaaRXEIH+M7S
	IuOFBuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64h5-00000003Dgz-0rzM;
	Mon, 14 Sep 2026 11:17:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64h3-00000003Dgm-25Ad
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:17:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 965A7601E4;
	Mon, 14 Sep 2026 11:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A06B1F00893;
	Mon, 14 Sep 2026 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789384668;
	bh=HKZPATLBOD75vX0HIDgrKuKrxajG+GHW7KZeSn5i2h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=okQVDAHioY+gpCl/7iWCM7P65IIELg0y29z3PuOQsO2Gy9Z/cTVpKqTF7/jx5ebKq
	 rP7NWUdwq163cf+CE4eIosXADJRUm8QTifKfGOh14xCI6JbGdX1AGoXYaT1n+YMyRv
	 xQ39eLBQ/yJ9SoNHKCIeMHpC7FuqfCEijjdJQo57s2+/Lkh44vG71JRNYCYn+oaVuX
	 v0O8gGIWPvKzf9od0L+4/oi7/uInah4rT1EDn5NwI3A94vubxhKr8CNOQHCxsNxlPF
	 s83DDvN5g858flKSeTgrC2j3yejMHQdGKy++vMkYPn6C0EfNvh7z6rCRQLngB19w9A
	 mYZa73BnQoQhg==
Date: Mon, 14 Sep 2026 12:17:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Subject: Re: [PATCH 6/8] KVM: selftests: Enable pre_fault_memory_test for
 arm64
Message-ID: <aqfXUTCCefQPKJ4a@gremlin>
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
 <20260825-kvm-arm-prefault-v1-6-befe8947702e@kernel.org>
 <CA+EHjTzOKHNrf=0n2c_E+vbt=pGquz6qzBpJ+eLJ5hjK_nyJMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzOKHNrf=0n2c_E+vbt=pGquz6qzBpJ+eLJ5hjK_nyJMA@mail.gmail.com>
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

On Thu, Sep 10, 2026 at 07:52:35PM +0100, Fuad Tabba wrote:
> On Tue, 25 Aug 2026 at 17:01, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > From: Jack Thomson <jackabt@amazon.com>
> >
> > Enable the pre_fault_memory_test to run on arm64 by making it work with
> > different guest page sizes and testing multiple guest configurations.
> >
> > Update the test_assert to compare against the UCALL_EXIT_REASON, for
> > portability, as arm64 exits with KVM_EXIT_MMIO while x86 uses
> > KVM_EXIT_IO.
>
> The message says this updates the test_assert for portability, but the
> parent has no exit-reason assert and no struct kvm_run; this patch
> adds both, so there was no hardcoded KVM_EXIT_IO to make portable.

Ack will fix up for v2 thanks!

>
> ...
>
> >  int main(int argc, char *argv[])
> >  {
> ...
> > +
> >         TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
> >
> >         test_pre_fault_memory(0, false);
>
> Would it be worth adding an arm64 case for gmem_abort()'s pre-fault path?

I think doing this would be quite a bit of work, I think perhaps one for a
follow-up?

>
> Cheers,
> /fuad
>
> >
> > --
> > 2.55.0
> >

--
Cheers, Lorenzo

