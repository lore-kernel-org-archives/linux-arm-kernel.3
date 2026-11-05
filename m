Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63047606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qizLllPv;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C49j3ekR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ShM/LzYh15H1VmyFk0yd5n30U2OKlMZRrk7dfYFeEYg=; b=qizLllPvqYTzuND7kd0i5q09o4
	5HseUXoQHJZKErHw1eZxk9IplDnx0c6/45MNOSCxZgiSjuzRl0lqtx9gt+uHLlGiCJ3m0+Qik6BlD
	SuC6UPRXYJj7b0bPRGYdDxUsgFshZFGBeTkUUfjLvitBd3q0rRtYDNDSUUeEt8uttWFJdvocxQ3+m
	k7SoD5u9h5uBf1ukq2JUzmlDKF7vFf38yIK7pMV5oynzQJ87jOSZs3JeyKmIwq2pW27sRtSYcqBnp
	vBSstgowwyNirxFkMMtfQdtLuMwaBP1sb4cpWC1aPyolg8Zrq28bLBB958r6HLRjo7aTs9LyhagA8
	eXDCLULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPU-00000008tdS-25mZ;
	Thu, 05 Nov 2026 12:17:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwPR-00000008tZM-2jV3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:17:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FE3B1E8D;
	Thu,  5 Nov 2026 04:17:33 -0800 (PST)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA9E03F673;
	Thu,  5 Nov 2026 04:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793881056; bh=j+lMJnSylQrD0+1OcivdSJ9GghFhWY5EWMq7YDes8RE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C49j3ekRRJi4RIZjd+tLIQL0aAmav4TKv+fDqpVmVSA7o8pP12o3qsbmQl66Eb4FY
	 tQI06CfIEa3l1jEqjC3YJhdwOtLwH3CynzRnTXSLrkf7RMRpk6qz0ijy7jhJ4s4dKt
	 jGgdNxarCNp7z1j7cgVPoLV+lKnkKnPIz2rEzrhI=
Date: Thu, 5 Nov 2026 12:16:09 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] KVM: selftests: Allow arm64 tests to create
 protected VMs
Message-ID: <auxziQ6yLOW5dhKv@e143914.arm.com>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
 <20261104084842.132944-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104084842.132944-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_041737_757626_4DA5729C 
X-CRM114-Status: GOOD (  18.73  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 08:48:28AM +0000, Fuad Tabba wrote:
> On arm64, the VM type passed to KVM_CREATE_VM carries the IPA size,
> which the selftest library fills in. The library rejects any type a test
> provides in vm_shape.type. A protected VM is created by setting
> KVM_VM_TYPE_ARM_PROTECTED in that type, so a test can't create one.
> 
> Accept KVM_VM_TYPE_ARM_PROTECTED from the test, and add the IPA size to
> it as for any other VM.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Similar to what I did for realms locally, and will have to expand to
support KVM_VM_TYPE_ARM_REALM.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index d42e201eba763..96c1e70dba3d3 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -400,9 +400,10 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
>  	}
>  
>  #ifdef __aarch64__
> -	TEST_ASSERT(!vm->type, "ARM doesn't support test-provided types");
> +	TEST_ASSERT(!(vm->type & ~KVM_VM_TYPE_ARM_PROTECTED),
> +		    "ARM supports only KVM_VM_TYPE_ARM_PROTECTED as a test-provided type");
>  	if (vm->pa_bits != 40)
> -		vm->type = KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
> +		vm->type |= KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
>  #endif
>  
>  	vm_open(vm);
> -- 
> 2.47.3
> 

