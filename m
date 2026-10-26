Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECE460A263D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=18+PiIKk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCyfKJ8S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pK1qmBovPzYfB3ZzFrf8FUWg+ydK6y3N/RQGf4cuhQo=; b=18+PiIKk3bB+k0
	wSn9Gp+4e/Vv+CHo23HtYlZhcEWdZdzTc/JzWMpyHI2bMTKQSXhg+xlkJQ5Wr2oKeEB4Fjk817hst
	HxBLSVoC5NGWTJva7VfGiF0QWngRQsHX2Fq/0QfXFbVUD+cL/ynGKQDhyiDn/WSAE2ryWzguG++Xc
	cJuX8c+TMhU1CZ4zCXOhSQxigr0hNw9jpbdEoOrGArq2AuGH34Wclbn5zHN3anFeydV0DhJ2lUJGM
	skWrZ/N4+cquGIeIqwoJ/qA4rHv5uzwogmUsKYG0FHiet6yDbJZPNfMP///BK85AxoK4G+UeYNakD
	Vf32ap4dh4+iq6dllwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOd-00000002RYP-3MWG;
	Mon, 26 Oct 2026 12:01:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOB-00000002RIW-1Aam
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FD9B40703;
	Mon, 26 Oct 2026 12:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71451F031E7;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016079;
	bh=pK1qmBovPzYfB3ZzFrf8FUWg+ydK6y3N/RQGf4cuhQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TCyfKJ8Sk1u2p7TWWb66+451JbY7sbDrDHiqhER86e1qaoaF4aaDX08kkB2sEg51Z
	 /8hWcYzkyAHdh2SnyaE/MVY4MRyQcTtw/BsfPD+2rVmAs9HKR56+6VO7tAxQM804wm
	 Dx8QF+nhFqkksBhxlt2oiQrxeVLqKqy1k928owpymqWDgcKieln+/D41nxRqtyluW8
	 TtyLAOtR3B43Lkhxt2mUGAjLq3Pf3ihI6pyQbAYBmoqoqg2HZYv5Ziv6dSTvpyaD5c
	 DA2OEIpyDQiC8sgF94RxGGkMvQ5UxbCh0oCJoi4BAeza6lSriJ1URAQGt8d3TMGqYM
	 26ZVKSbGZkosw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO9-00000007Fr6-0n1y;
	Mon, 26 Oct 2026 12:01:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH 0/2] KVM: arm64: Cleanup the HCR_xyz macros
Date: Mon, 26 Oct 2026 12:01:03 +0000
Message-ID: <179301587178.2527370.10543085363432691237.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015173605.1072963-1-maz@kernel.org>
References: <20261015173605.1072963-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
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

On Thu, 15 Oct 2026 18:36:03 +0100, Marc Zyngier wrote:
> I've been postponing this for some time, but it finally happened: no
> more HCR_xyz macros.
> 
> This series converts the whole thing in one go, using the script
> fragment contained in the first patch. No AI agent involved, all bugs
> are mine! I intend to take this in for 7.4-rc1.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Convert HCR_xyz to HCR_EL2_xyz
      commit: 00869b4a26deb3e52b2ad21f4239f3d533eb16e0
[2/2] KVM: arm64: Get rid of compatibility HCR_EL2 aliases
      commit: d32084d26c217b85e53c61d577178d5aaebc2c5b

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



