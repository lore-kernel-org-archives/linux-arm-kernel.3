Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1DF606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cgI4bo5Y;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdKdZOPz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fbdx/tyG6sr3ZXv0KgiU+rkzEDWOUQychr08SSf5ASs=; b=cgI4bo5Y1l68Ey
	KuDk5LTLTb2PeEyNKIr01IDfh0s+WuI/P/CdTVSZKqHpmNZNMn5s9tYx18u6F/uEQLE9s8PeFYALW
	PX8zeHYV38T6brlHPWqveNnzyLdKzzboDo53A0wLgDmAuAfC2I9+Ifmg5VVWOrCUVCGQmZ0MtnpSs
	t5yX7v6rfufD+VOJAvCOphnHsQFO/X5o9ECDi0jv2I242AO3cl5+TRHUIW/qPGJ/um39aoWx4XLaw
	S8vcwnFZD4eus5zT0ysfc8JpDjJjv2EoFx2U3wh79Hdfg+L5SaCddtUue2QAyFs1XPVgWcst3R3me
	4Hw6UEtsy7BierYVRb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOd-00000002RXj-29Nx;
	Mon, 26 Oct 2026 12:01:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOA-00000002RIF-3HDx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89B7643E52;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5491F031E1;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016078;
	bh=fbdx/tyG6sr3ZXv0KgiU+rkzEDWOUQychr08SSf5ASs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HdKdZOPzrt2zSI4yLCro8FKLIh02ocfjtWDAX7xk+uWhfaO0pnXfmX1OEjgrVeTbe
	 FGXRHIfPqg/W9of+xNBrH+IUxQ9LSLAF0SbLMmAyAtQqdhJYNh3sxT9OM2s0DJcwta
	 xWD9kYim5Oqt1fHyhwxEBAzpjgTwM3si2FQ/v9BKuQEFJR0pAIGJOpLFmqtf+BI/me
	 Mtmyopcp3T2Ik/QX35qoA4qHoFkBLg2HJeGZq4bG3SJo73ZNxsFxsYal4p7kUoI/IM
	 hwZVLWy4Uc2pGRWiLNzzk7VuqwoxwjFecRXriELZc6tlw7ZlmRJ9AGNl9XtH6IuwAB
	 JjtGZwx1+f5CA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO8-00000007Fr6-2zYq;
	Mon, 26 Oct 2026 12:01:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	Sascha.Bischoff@arm.com,
	steven.price@arm.com
Subject: Re: [PATCH v3 0/5] KVM: arm64: pKVM host hypercall and GICv5 CPU interface fixes
Date: Mon, 26 Oct 2026 12:01:01 +0000
Message-ID: <179301587186.2527370.13227763498570302748.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012161524.4016464-1-fuad.tabba@linux.dev>
References: <20261012161524.4016464-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, vdonnefort@google.com, qperret@google.com, Sascha.Bischoff@arm.com, steven.price@arm.com
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

On Mon, 12 Oct 2026 17:15:19 +0100, Fuad Tabba wrote:
> Changes since v2 [1]:
>   - Patch 4 now allows only GICv2 from EL1 and requires VHE for every
>     other CPU interface, instead of adding GICv5 to the VHE list. Same
>     behaviour; I kept Sascha's Reviewed-by. (Marc)
>   - Added Suzuki's Reviewed-by on patches 1-3.
> 
> Thanks Suzuki for the reviews.
> 
> [...]

Applied to fixes, thanks!

[1/5] KVM: arm64: Reject the GICv5 CPU interface hypercalls under pKVM
      commit: ecb6b43cd22245296d910cb392594c9e33691b87
[2/5] KVM: arm64: Reject the stage-2 flush hypercalls under pKVM
      commit: 121d74bee8cd81ce9212837db98ceaef2e530637
[3/5] KVM: arm64: Validate the host-provided vgic model in pKVM
      commit: fb77bb2a0ff253e6c370ec7dc1afa45b2ecd8d2e
[4/5] KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
      commit: cd38c10e191eb2c37b9904a6ffc3b6bf4d9c0c48
[5/5] KVM: arm64: Fix stale VGICv3 comments in the nVHE world switch
      commit: 7ad25ad110608320348669488297e06ea8c72f85

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



