Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460FA606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vLYydjuY;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hl1arTt9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=068RARPUhpeNt5cdqdcKQHksPIpTlxwfCKWl/O6RHkI=; b=vLYydjuYmNdo3KRekp/bYYcmwp
	JcvSo6N/83hrJrZOwey5jQDJwa3h/9sS+LZIbflKydWvvSbq5WZ9xo/cxcirYyNE4ooqZ5s7+MP9j
	D9NCnkIMoaJ2i1n3RZYDPnBbvWw/7G8OMtjlsicTL2zgSokQUwOExdvLrW/T6ioIdF6aaN3UKROAo
	yl0EAyXmq5to2du/wD2UKOuBoHVvQ9bbWJBYFESaUsLegHMmEEmZxEyX1iDDBZdCU5RfUxugAK8LP
	eKxYpyuFCpPuF7i8QHozjndcXE0V+IAouNUxpJKjuP/zJpAOJDOusbueoeNCZCvjPWnBsg/mpoxBP
	O2YX5CYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMLx-00000008pi2-1Lgr;
	Thu, 29 Oct 2026 09:23:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMLv-00000008phd-3PRE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:23:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 369B340419;
	Thu, 29 Oct 2026 09:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD8C1F01828;
	Thu, 29 Oct 2026 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793265799;
	bh=068RARPUhpeNt5cdqdcKQHksPIpTlxwfCKWl/O6RHkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hl1arTt9CLQDGptJengrqjKeO/CbPgOOLiN0GgPZ7OP4SrH7yv69hn2BZ34ibZZwj
	 riXpYoM6I7ebc+BptLTZeaRG7HPvOiI7ypiF7RnGaJYpob/awILhwuT+sImxbOe6UF
	 qYoRY4rkNJZwdYscvantXBkx955C6gZRNdUMyFT4mL8drqL/cIU3tKGSL8bSi79ePp
	 5OY1HcF0rrk+nenDrPIkt8RJtvjagARti6Yb2PcMcCcuPPgzhiMgJ0L+SppbT/MfEd
	 vdI2ObMITkJLxiG+cvBt6R549iZoEjWaqKaoKDmmVF1xhbTJhAZHJTEt7estahfIiB
	 JrzzBODm+DPYA==
Date: Thu, 29 Oct 2026 02:23:17 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: xuheng@cs.columbia.edu, maz@kernel.org, qperret@google.com,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Add an ISB after mapping a hyp fixmap slot
Message-ID: <auMQhSmxIm5JMftF@kernel.org>
References: <20261028-fixmap-isb-v1-1-6c9f0f9cb810@cs.columbia.edu>
 <20261029085414.2279900-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029085414.2279900-1-fuad.tabba@linux.dev>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 08:54:14AM +0000, Fuad Tabba wrote:
> Hi Xuheng,
> 
> On Wed, 28 Oct 2026 23:02:10 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
> [...]
> > A litmus test of the same shape (map the slot, DSB ISHST, load through
> > it) faulted on a Cortex-A72 in 2 out of 100M runs.  Arm's herd7 model
> > with -variant vmsa also allows the fault, and forbids it once the ISB
> > is added.
> 
> nit: it would help to have the litmus test itself in the commit message,
> or as a commit note, so the herd7 claim can be checked. Here's the one I
> ran (herd7 7.58, -variant vmsa): "Sometimes" as below, "Never" with an
> ISB after the DSB, and "Never" without the ISB under -variant vmsa,ETS2.

Maybe I've been conditioned at this point but doing DSB; ISB to consume a
translation after setting it up seems pretty straightforward. Especially
since we don't care about ETS in the kernel at this point.

IOW, I'm not sure what additional detail the litmus test buys us.

Anyway:

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> 	AArch64 fixmap-noisb
> 	{
> 	 [PTE(x)]=(oa:PA(x), valid:0);
> 	 0:X1=PTE(x); 0:X2=(oa:PA(x)); 0:X3=x;
> 	}
> 	 P0           ;
> 	 STR X2,[X1]  ;
> 	 DSB ISHST    ;
> 	 LDR W4,[X3]  ;
> 	exists (fault(P0,x))
> 
> FWIW, the result matches the ARM ARM (B2.3: without FEAT_ETS2, a DSB ST
> doesn't order an earlier store before a later translation table walk),
> and emit_pte_barriers() in arch/arm64/include/asm/pgtable.h has the same
> dsb(ishst) plus isb() after making a kernel pte valid, for the same
> reason.
> 
> [...]
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Tested in protected mode on QEMU, booting a protected and a
> non-protected guest, and on an Apple M4 (nested virtualization),
> booting a protected guest. No regressions.
> 
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

