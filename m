Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40A606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f5vZgKCg;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EMEydMSd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RWYyUno+6cx4LmdgSlbrF7AOPgBC6T6bh4Sekg6kVow=; b=f5vZgKCgTRCbZt
	aiPGF11aAvOywz0pgdvfyF7sTOVqzGWWlSt44dxvzwRH6mPvIxjS2u2S7m++mqKA6QbhjNaFjr+DK
	Va9EwU22Pxtwss3O643euPv3mfFddNzbT/4UI9/Q9q5dUi8++TVGgqcEme/afE1dgYpvqOgBK8vov
	zLfFb1i9Q7ktUM+MIPou/8OxqmjxNbJcbCu/4A6pHuSbC00Z37HZTcbWWcH9nmUYXoZO7uFcJT0tZ
	b1yBd0fiIgtUi+8qBN1f6UL3kR++l2PKcsbZ+33DKs2aBDkBFRh3K9d8xxLZPaEOC+3IWwO68j6Qe
	6QcKSpJa69e0z8UDd65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwj0-0000000Eauh-23l9;
	Thu, 22 Oct 2026 17:37:10 +0000
Received: from out-75.mta1.migadu.com ([2001:41d0:203:375::4b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwiy-0000000Eatw-2ChM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:37:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ipd1ZzuR29dZ4jyKrxs1oKJ1qWtxaGrUuphpRz/7Je4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792690626; v=1; x=1793295426;
 b=EMEydMSdKqUJgL654qc7t0SCYVaC6YxriMbhf54XCJS+vhT7xBGDPrem40ofTG1s1mj0uymj
 eB3yPLP7fbu/p/FtIrgg2mGU/LS4qwrTqBqS/bC8WGuFYaOcXb2d2EFKc8qxiCR+BT/xa7BeMvu
 KO23u/GodyYLVXd1lRcLAQ6w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f2798876e70ae443;
	Thu, 22 Oct 2026 17:37:06 +0000
X-Mizu-Trace-ID: f2798876e70ae443
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
Subject: Re: [PATCH v2 3/4] KVM: arm64: pkvm: Reset GICv3 LRs in the hypervisor
Date: Thu, 22 Oct 2026 18:37:05 +0100
Message-ID: <20261022173705.3729666-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140048.2522787-4-vdonnefort@google.com>
References: <20261022140048.2522787-1-vdonnefort@google.com> <20261022140048.2522787-4-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_103708_736573_A311A7E4 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

On Thu, 22 Oct 2026 15:00:47 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> After the host is deprivileged, pKVM can't trust the host for resetting
> the vGIC LRs whose value is architecturally UNKNOWN when the CPU boots
> or resumes. Add a blanket cover in the CPU_ON/CPU_SUSPEND path.
>
> Fixes: cdf367192766 ("KVM: arm64: Intercept host's CPU_ON SMCs")

Could you point this at 1025c8c0c6ac ("KVM: arm64: Wrap the host with a
stage 2") instead? The message relies on the host not being trusted, and
that starts there.

[...]
> diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
[...]
> @@ -213,6 +213,10 @@ static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long
>          write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
>          write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
>  
> +        /* We can't trust the host to reset those registers */

nit: "those registers" -> "the LRs".

With the Fixes: tag updated:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

