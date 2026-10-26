Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F01D60A3837
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z/MNqASK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+4rBuIb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OSKQ5HiKHS7VyDFvKfOVWU7kBHEXK2Qv2Aln+gNIB+Q=; b=z/MNqASKx9bP+b
	Slic77RxcYdihIeF6Jp6aKByl5RH2+bR5CdLjzc3TudBoGLCrIJHkve3r/0Jt1XoZ6DaWqTv5CGMJ
	l5mfNpsH/AhuCIXgEmnCBa08SESeILKOsnxBWISVHh1qSENpdG0DCLboektyD4//+h6OfqWkccjZg
	CHuz7ERQeBHC7IKqyVen+4f+7//GNlgJSa+qVZEofHy5opA+XbBH4HBYmtlssF2q9gb+f0Dotre7a
	xjnB0lbS0QSCbGtaEaYPwpU+8QTsubc5aFrJA4Uz+HmgZDkotFk4Y+KK6lOfwQTv/ZkeOL31OLHlf
	/U4aYGX+4vxmjWznpJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOB-00000002RJQ-46Za;
	Mon, 26 Oct 2026 12:01:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOA-00000002RI8-2fAI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 180BF43E13;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35691F031E0;
	Mon, 26 Oct 2026 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016077;
	bh=OSKQ5HiKHS7VyDFvKfOVWU7kBHEXK2Qv2Aln+gNIB+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f+4rBuIbYdiek7nz9qLpx2TV0UJDpibSMTPc+lKhFwQetxbrU+ekIL7IWrnxAJhi8
	 s3jZVG2JXsE3vg4AIfv7Ia6dF4s6/7XpxN7x6S9Tw/CT17yHc8MV9z0yI8t9MudY1m
	 /V4j/0iIRsmTMmEOuRwlTstybh8UYMJTSvysBn4IXbxE0gGhTL8PIu1VEuLVAn7974
	 thK/XLj4Ci6AWmSIxOhPSvQWVBbdlDB+vqYQNlQrKpdUAoT8KhGscqn2mE2u/ioK+x
	 zqKR7U4dC2LfyS1Hbn1phXatqnD5ZE86II1Mo7UnALfB1y18LrPJmdsl6pX8jKfN0p
	 lNtCiqoAsCcoA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO7-00000007Fr6-30mh;
	Mon, 26 Oct 2026 12:01:15 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH] KVM: arm64: Return on kvm_gmem_get_pfn() failure in gmem_abort()
Date: Mon, 26 Oct 2026 12:00:57 +0000
Message-ID: <179301587191.2527370.3684405184573124806.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022123054.31729-1-fuad.tabba@linux.dev>
References: <20261022123054.31729-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, vdonnefort@google.com, weilin.chang@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 13:30:54 +0100, Fuad Tabba wrote:
> The kvm-arm64/mmu-fixes-7.4 merge dropped the return from the
> kvm_gmem_get_pfn() error path in gmem_abort(). Both parents of the
> merge keep that return. On a failed kvm_gmem_get_pfn(), gmem_abort()
> then carries on with a zero pfn, and on a nested stage-2 it uses the
> mapping it has just freed.
> 
> Restore the return.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Return on kvm_gmem_get_pfn() failure in gmem_abort()
      commit: c4c362949dcaaaabaa5db34acaa6e91b9912094c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



