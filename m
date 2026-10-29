Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEFD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DPUCDeBE;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eff/UEkS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kpm89XioXXnsTWzJsIlmeTzj5KiGn1VrgU9z1qz9vOk=; b=DPUCDeBEbDQvqo
	7THdMiS0p82/tklap64tbnXRD5LkCPtgqWbfYtAXRrWAw+G/kOiAAJv6NFsF7IzlyErlF/AXZvAjc
	MErhDCm001/3cXjG9NVRsDydeIENzJiU0fGRErNXzQ5yW89x7BSnqOrYfzkXj/HAhLJhAZcsBdkee
	PXOczte2v9YzNMcCybnKncRjrrNNv6TC/VGB59CBeSwVV5CCnhVVwaaTaH6pebG6OP32mvldKdX5v
	Be4gJWNaTFb1j9kJEoh+tqWlgGxr5hLZQLws/hM07ThPiRG6l3UYfgyBZucjBphR6dbfxP1IMJ9iZ
	bO5xS9sjOMVvtbqg66ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLtz-00000008ltO-0V6e;
	Thu, 29 Oct 2026 08:54:27 +0000
Received: from out-143.mta1.migadu.com ([95.215.58.143] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLtv-00000008lso-0CRg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:54:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ctrBwXQvS1M9yecPf1fWtqcUruy7KRm5Qjr3D6oimXs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793264060; v=1; x=1793868860;
 b=eff/UEkSgCt3RsVBav8UPUofePVEzgdIjPSZ3BT9y+e48I6KvqNEyKUd1hiRAJT9mpQenVeU
 PPzbLB0BBip6x06BBdkis5xmRzqwIEjQ2w3jX3wMHvYwyDsFC075ceyRjTcehEO0KI9Mayd74e5
 CclxNeni8WI0VW9Kh3vjYKEk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 615dd020fd29c127;
	Thu, 29 Oct 2026 08:54:20 +0000
X-Mizu-Trace-ID: 615dd020fd29c127
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: xuheng@cs.columbia.edu
Cc: maz@kernel.org,
	oupton@kernel.org,
	qperret@google.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Add an ISB after mapping a hyp fixmap slot
Date: Thu, 29 Oct 2026 08:54:14 +0000
Message-ID: <20261029085414.2279900-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028-fixmap-isb-v1-1-6c9f0f9cb810@cs.columbia.edu>
References: <20261028-fixmap-isb-v1-1-6c9f0f9cb810@cs.columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_015423_545158_C8B2D01E 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Xuheng,

On Wed, 28 Oct 2026 23:02:10 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
[...]
> A litmus test of the same shape (map the slot, DSB ISHST, load through
> it) faulted on a Cortex-A72 in 2 out of 100M runs.  Arm's herd7 model
> with -variant vmsa also allows the fault, and forbids it once the ISB
> is added.

nit: it would help to have the litmus test itself in the commit message,
or as a commit note, so the herd7 claim can be checked. Here's the one I
ran (herd7 7.58, -variant vmsa): "Sometimes" as below, "Never" with an
ISB after the DSB, and "Never" without the ISB under -variant vmsa,ETS2.

	AArch64 fixmap-noisb
	{
	 [PTE(x)]=(oa:PA(x), valid:0);
	 0:X1=PTE(x); 0:X2=(oa:PA(x)); 0:X3=x;
	}
	 P0           ;
	 STR X2,[X1]  ;
	 DSB ISHST    ;
	 LDR W4,[X3]  ;
	exists (fault(P0,x))

FWIW, the result matches the ARM ARM (B2.3: without FEAT_ETS2, a DSB ST
doesn't order an earlier store before a later translation table walk),
and emit_pte_barriers() in arch/arm64/include/asm/pgtable.h has the same
dsb(ishst) plus isb() after making a kernel pte valid, for the same
reason.

[...]

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Tested in protected mode on QEMU, booting a protected and a
non-protected guest, and on an Apple M4 (nested virtualization),
booting a protected guest. No regressions.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

