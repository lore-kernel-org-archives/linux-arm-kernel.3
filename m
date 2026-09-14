Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2AAC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xM1TDdqfEl6GU2ywllZBD4mpsnLKKgTMKLuTMtixxJ8=; b=k2p6JdFUT6yCIIuSwn79MGoyqC
	cK07CrJ69zmBGVV41Wt0+1iRagg6LV/fyJ8vKMeyFc4a7ilUgqkMfn56g4pNEWKeQVUMZ3qFAb+TS
	a8ybGFSbmIf8ITP1CrzJqnHSmE3xFCFT4pLGB4iX5RU0wY54xSEcwJAFKBuuFqklKhHWeMFqnHr07
	73vrV4s60TcKvSHAc315a5bhPX/jkI2LoamN6t+HSm1Nt0OFh4a2op8yL1a7h7kUzp4B+AxhIuU+V
	wJFWGzTfIDD7o+/2yYroMbwg05KCm+WdfKWF2Z374zid1q0syKcffxBTycBxSP38ymJ14Dwc6OTd1
	xhDWJ+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65QK-00000003T9E-0pqf;
	Mon, 14 Sep 2026 12:04:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Ps-00000003Sv1-2AKD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:04:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F034C60142;
	Mon, 14 Sep 2026 12:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D0B1F00898;
	Mon, 14 Sep 2026 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387447;
	bh=xM1TDdqfEl6GU2ywllZBD4mpsnLKKgTMKLuTMtixxJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T+lPgklzo7cE4au5q0x9M+DrqjT+A/VqRZQodgjulWV/PFbot37UXBgW5utO4T03E
	 3U+f8S8Zydx9o+esMJVLStQfXKqSJLNYpIgiZH6pUF8YlcsJK0rXHFfadgU64MX6Hs
	 9chjolL25a1uwAAzVnPzmAGmirsaWtQ8YhqBNba+tNbMf+KIQ2bq3JqUdxdGE5nObu
	 rF7JzL+FuEuI75Urw4nAHYHKw67NKu53VTbgdmtwSQuLjS3xzD6tNAqnmRzsvHvvM+
	 82KhFNf/BzskXOdKmK1KRRxlpUKP//3XfuhBfuinJ1oHrrb2EKexotaDDV2J50n1vT
	 qStzdEXtKSzUg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x65Pp-00000008bDF-3RvC;
	Mon, 14 Sep 2026 12:04:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/11] KVM: arm64: Restore type-checking across the host/hyp hypercall boundary
Date: Mon, 14 Sep 2026 13:04:00 +0100
Message-ID: <178938739493.3215146.204121223910333681.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901140326.3812068-1-fuad.tabba@linux.dev>
References: <20260901140326.3812068-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, rostedt@goodmis.org, mhiramat@kernel.org, alexandru.elisei@arm.com, vdonnefort@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Tue, 01 Sep 2026 15:03:15 +0100, Fuad Tabba wrote:
> Changes since v3 [1]:
>   - Rebased onto 7.3-rc1. The pkvm-7.3 handler rework that made patches
>     9-11 deviate on kvmarm/next is upstream now, so there is a single
>     version of the series again. It applies to kvmarm/next unchanged.
>   - Dropped the Fixes: tag from patch 1. No config fails to build
>     without the include, so it is a self-containment fix rather than a
>     fix for an active break. (Steven)
>   - Collected Marc's series-wide Reviewed-by, and Vincent's on patch 1.
> 
> [...]

Applied to next, thanks!

[01/11] tracing: Include linux/types.h in trace_remote_event.h
        commit: 968c346143b71678a4970d1d0ab3f6505be7dfd9
[02/11] KVM: arm64: nVHE: Share the stacktrace per-CPU declarations with EL2
        commit: 424f7785bcf316645e7f5f4620e3f9d8efdffb0f
[03/11] KVM: arm64: nVHE: Declare the hyp event IDs before defining them
        commit: be44596c05ae1b34d7b9029acc1c9d41ee3b8783
[04/11] KVM: arm64: nVHE: Use NULL to reset the trace buffer backing pointer
        commit: 3d7a7a01243408df1b0232288e4f9cf7362980b9
[05/11] KVM: arm64: nVHE: Run the source checker under C=2
        commit: c3ac2ba27ed74b58525bd6614c503b30b221bb51
[06/11] arm64: pi: Run the source checker on the libfdt objects under C=2
        commit: 44b14ff4aebeae98663d0fd424b4ef88237ee981
[07/11] KVM: arm64: nVHE: Pass host VA arguments as pointers
        commit: 79a2e4681fd5936f4d7ab26251fe96ee76d60940
[08/11] KVM: arm64: Move the host hypercall interface to its own header
        commit: 3a189b358018d76020c65b5a52c90ea9353ef642
[09/11] KVM: arm64: Type-check hypercall arguments at the caller
        commit: db89e04ddbb7838b40f7d7b59b69220212678702
[10/11] KVM: arm64: nVHE: Check hypercall handlers against the declared ABI
        commit: ab31289483f54892dc6204a6ce2015420d0d5213
[11/11] KVM: arm64: Tag host-VA hypercall parameters __kern
        commit: 8bd0e6812a1be71d50620f00445940ded0df897c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



