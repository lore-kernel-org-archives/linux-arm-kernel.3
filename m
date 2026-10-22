Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C24606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eCX70SBp;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eJRDyeEZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hBlZ3c+WCK6g74zPRkfoYcj+pK7tXKqrk+Hh3m5wzfY=; b=eCX70SBpQLoAgJ
	VqDqX8sn7EA9U4g5k6COLsB8mqXnYSoKDaN5RnWl/bpxopG5vU8Xz0LCVhAOSye6MejaV1VLeQZLy
	wqZ7S2Y/4WDhP/Pm34zHkMC9F3tvseRTecp3NEbwYG0hNJZ7JThTs2zgAnmIoYVs/Xv9bEoceJwDj
	1I9ZQtnqdjkj911bMoHlMP2xm7ZuC6gh5VsSjFtD2zi4N2EQXzX0xYCWBRA47WODOop1Asit8Vkr7
	+vK3SzeF+cmYRzUNw2wlmQhm0Ao7PRax95QEZMF5zh1rgD07TFgu+EICOJ4KvjFei7lymvTOjZBEK
	D+PqmTmimhMvNxb3MQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwi2-0000000Eaha-2vED;
	Thu, 22 Oct 2026 17:36:10 +0000
Received: from out-103.mta0.migadu.com ([2001:41d0:1004:224b::67] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwhz-0000000Eagt-2WqK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:36:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vtTv8LAxxMmX1s5o/Nzyb3tJPXKEsK73smIwOCpMdG8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792690565; v=1; x=1793295365;
 b=eJRDyeEZRmjwooQ2RKr7rRnYSBSS/FzZTlqVAwTRjaR5lJrlqaWX7p1nl8bc5YJbVNhOjFGC
 /K4LmK0urrqBdIfNPHbntxdb2RHonlcf0vqY8OokjuuNx0DDHm5QRWZNPbONfPTnLO/X67z0Vv0
 F1DLmXRPwlu9U7sNjWiYuoXM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7c15b67925d49db3;
	Thu, 22 Oct 2026 17:36:05 +0000
X-Mizu-Trace-ID: 7c15b67925d49db3
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	tabba@google.com
Subject: Re: [PATCH v2 2/4] KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
Date: Thu, 22 Oct 2026 18:36:04 +0100
Message-ID: <20261022173604.3710390-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140048.2522787-3-vdonnefort@google.com>
References: <20261022140048.2522787-1-vdonnefort@google.com> <20261022140048.2522787-3-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_103607_804271_D6BC41D7 
X-CRM114-Status: GOOD (  18.57  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Thu, 22 Oct 2026 15:00:46 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> The vGIC LRs are architecturally UNKNOWN when the CPU boots or resumes.
> However, in protected mode, only the used ones are reset, because the
> HVC __vgic_v3_init_lrs() is never called:

Could you say here what happens to a guest when an LR isn't reset, as I
asked on v1? Without this series, on QEMU changed to leave a pending
vINTID 100 in the top LR at CPU reset, the guest warns "Unexpected
interrupt (irqnr 100)". With only the EOI bit set there, the npVM
doesn't print anything in 150 seconds, since the maintenance interrupt
is asserted on every entry. With that in the message, could you also
bring back the Cc: stable you had on v1?

[...]
> Then, cpu_hyp_init() is only called from init_subsystems and
> kvm_arch_enable_virtualization_cpu(). Remove the kvm_hyp_initialized
> gate: when pKVM is enabled, the cpu_hyp_reset() will just return an
> error while for other modes, we already know kvm_hyp_initialized is
> false at this point.

In init_subsystems(), only the CPU that ran do_pkvm_init() returns an
error here. The others are still on the hyp stub, which returns 0 for
HVC_RESET_VECTORS, so they go through the full init. Could you reword
this part?

[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
>  static void cpu_hyp_reinit(void)
>  {
> -        cpu_hyp_reset();
> -        cpu_hyp_init_context();
> -        cpu_hyp_init_features();
> +        if (!cpu_hyp_reset()) {
> +                cpu_hyp_init_context();
> +                cpu_hyp_init_features();
> +        } else {
> +                if (WARN_ON(!__this_cpu_read(kvm_hyp_initialized)))
> +                        return;
> +        }

Could you make this "} else if (WARN_ON(...)) {", as elsewhere in
arm.c?

> +
> +        /*
> +         * Even if the hypervisor didn't allow resetting the vectors we can
> +         * reset what we have access to.
> +         */

nit: "what we have access to" is the LRs, so I'd name them.

With the above addressed:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

