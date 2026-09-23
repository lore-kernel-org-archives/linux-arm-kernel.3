Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1259C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOAKMmCBlI6Y5ADecDu+BXYPFKPVLUehlx/wlSNc7CU=; b=1o5z2WS4/plUaWPKdFJWOtKE9y
	7J0IdnVeWcGc9PvWA7hgLfTlD3zO7gEn2oUGxAVj/jiI+f4Ag9nrH5DOiBdSCy5VZMQY76gOSuKm4
	gwtRG6xWklsRRMMfXKAEmUS0MGssi/qq+QN4illRKP+02ohasOVtuQJJuw9wKsss6Wlc6OfCeY1DS
	ltxDD8Z0Ku4QaPGJKaupY6mRW7SYo+Z+UaZPV81eQJy7KY2aOXosCE3kn1FFO40ruinc1LwchaD2E
	9sOFO+94WEqL5DMSgWbg0yK3N5SjrUR5K3z3CX65xSsssJs5vyXB6le6X/flAtz4kflug34hQPvoD
	M/L6kFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kpo-000000080Dn-2UOt;
	Wed, 23 Sep 2026 11:08:20 +0000
Received: from out-81.mta0.migadu.com ([2001:41d0:1004:224b::51] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Kpl-000000080C7-1QYu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:08:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IOAKMmCBlI6Y5ADecDu+BXYPFKPVLUehlx/wlSNc7CU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790161695; v=1; x=1790766494;
 b=o0X/WhuynuwjjKmWkYpK8uULplygFzOrcBoybm2J/+uoyQlqDKvk8Iv7fIknGYQAzG/nShWS
 zuSqvgtEku0EsrBbpkynrKMwifO5B4hZiRM5+SnB5QcyhbdfIxVNb8xoSF94DqUpl7FxbrKPA1p
 UR1R4muF7+8qLwg785AkpkN0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d876486f464857fe;
	Wed, 23 Sep 2026 11:08:14 +0000
X-Mizu-Trace-ID: d876486f464857fe
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8c42da963so5343e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:08:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzk51YpDu/kXAJoqLcVvJRpi3BGvN3LfEMjzqoBIkf7Q6rPZmj7riCtfnpdkSBf56rBR4P7cIIJFK+iDn5utKm1@lists.infradead.org
X-Gm-Message-State: AFuF++kUOFqLvrYjBJSqrpQuHN8amQqyFmbNusghR+pKj3j5h8cUTd5y
	h2df7hR3tLv3haNR2bNIwz6NYsEYBsKaD8dFcI3a+kPXPe4oqrfJ/lHEZ/eFjnvvZZMroxP3g8M
	6Rtx9DbwI7txMgodN381N8FQkfvPRWZ0NuW7AEr3z
X-Received: by 2002:a05:6512:648a:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b8d91673a2mr102638e87.15.1790161689001; Wed, 23 Sep 2026
 04:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org> <20260922-kvm-arm-prefault-v3-9-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-9-787bd3bc7e3f@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 12:07:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzY6KFekqaUX4RLRyFmSkFhOeWDZE4LjBF6owdLM8oHhw@mail.gmail.com>
X-Gm-Features: AcwNN1USJQu0cBxPqG4Fa3XJmPPBE73PzJ6UtD9si6PNBcHUySSR3TM9mD5mIUk
Message-ID: <CA+EHjTzY6KFekqaUX4RLRyFmSkFhOeWDZE4LjBF6owdLM8oHhw@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_040817_922761_C842D389 
X-CRM114-Status: GOOD (  10.24  )
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

On Tue, 22 Sept 2026 at 15:19, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> From: Jack Thomson <jackabt@amazon.com>
>
> Allow callers of kvm_pgtable_get_leaf() to specify the page-table walk
> flags, in preparation for performing walks under the MMU read lock.
>
> Reading a stage-2 leaf while only holding the read lock requires
> KVM_PGTABLE_WALK_SHARED: parallel faults (which also only hold the read
> lock) can unlink table pages and free them via RCU, so the walker must
> be inside an RCU read-side critical section, which the shared walk flag
> provides via kvm_pgtable_walk_begin().
>
> All existing callers either hold the write lock, walk with interrupts
> disabled, or run at hyp where shared walks are rejected; they keep the
> current behaviour by passing no flags.
>
> No functional change intended.
>
> Signed-off-by: Jack Thomson <jackabt@amazon.com>
> [ljs: fixup new kvm_pgtable_get_leaf() invocation]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

