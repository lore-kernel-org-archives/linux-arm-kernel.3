Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FA9CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX3oKQFid4+2wlIQM4M+cUy+JgcjW23uXS4Jv7bE5d4=; b=VtFgVKVGGZTJtcXNZ9DOOg5VIr
	023VNL+4kPh8v6BAA/PV1KBIX25E3BWTWfOksJvfu5cvjPwCrDI5rQ4sdqcOv415mWTX0SEq95y0t
	pk4L6zXqWttyGUnKgnwYxKtkgtB8WlNhKbZ5FOHs2zZTps9TapvnkcqEo2SUF/TV6kKT+W/bZ+CAI
	qZ6XAQQR34GCmrJ/keTzg7DJVACY5J3Y4cmwFfPTkKGJFZhYi7l7Y1sX7OR6UkWj5Fn/RhNGzCWVG
	YpWGm+wmQ95NwAruMiTBhGsXyo/qEj2+F8GI4TI3M4nRwELj29jIDXNDpU7CwwRRxPUpbi8IVSUMr
	j2Sp3XuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzPn-0000000FeUY-0PvV;
	Wed, 14 Oct 2026 13:53:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzPl-0000000FeU8-1cXN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:53:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C62360416;
	Wed, 14 Oct 2026 13:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96ED41F00A2F;
	Wed, 14 Oct 2026 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791985984;
	bh=YX3oKQFid4+2wlIQM4M+cUy+JgcjW23uXS4Jv7bE5d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m6UV0s6NCYtNAyc6gKXbw6p9xcuxFVBgz5sETFnNcoD0b1VSadNMRLxMSDoEp2R0Z
	 ayMNY2TEmre09azqpKckR2WqLRK6xI1sh0wse7E66Lbl1T1BIVN3UHs+zoSnMvZn+G
	 smIZ7v01RFqJzpD0xouqoSw1WA6HZSMOfXW3qZHSVx+nmeONzvToNNiwdGZBMT1AJ+
	 VPtgfE1NfwAl2DfNA93srycj8qJkEmFXS02M+zWFA5otycQ3r2ZEz3EXXi9PaCLWzm
	 bVlKEGMeias/1TNIwPaTh9Cnu9Hlkolp95ua3rzDNdpFsKtBOqkz/3/XiiiV2Slwv8
	 SehyAc2HzLzSg==
Date: Wed, 14 Oct 2026 14:52:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	David Hildenbrand <david@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 01/14] KVM: Allow architectures to disallow pre-fault
Message-ID: <as-I8TN27Kz6HS1Q@gremlin>
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
 <20260923-kvm-arm-prefault-v4-1-d4b0b4dfa8c3@kernel.org>
 <CA+EHjTzDYSuBVEc+SMdDa41sq-ET=m_oWW0gL9dYf+AumPYPUg@mail.gmail.com>
 <as-H1zaslO-Bwf5q@gremlin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as-H1zaslO-Bwf5q@gremlin>
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

On Wed, Oct 14, 2026 at 02:48:02PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 23, 2026 at 07:52:27PM +0100, Fuad Tabba wrote:
> > nit: the comment above the smp_rmb() in tdx_sept_map_leaf_spte() still
> > says pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory(),
> > but after this patch it's read here.
>
> Ack, will chase that up!

Oops disregard!

My mail client managed to confuse me :P I see that Marc already fixed this up.

--
Cheers, Lorenzo

