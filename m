Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDFA60A3801
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=33H/YoJ8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KzpbDf4B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X8Hx9gqAZ7Cne8MmPIj8pLeQAmVLqZqqq82MdU8ljig=; b=33H/YoJ8Tv5Lwx
	QHQQrHIi8t9sfqOvIqUEbBBQIP0Ln+p2DjiQChFKruEeC959c+fvNRa0uONpPMRyh3gWMzVVz9lO1
	1XoShqtesWI3SptjVHldyjGoobYuNEvCxaBN1fPd4Vo4/UzKXBhWgHJItEaglamvRghs21bGCmg8K
	u2+BaxKkvvqvt7moca5W+lMRO3t8JSYpkCdVFQ0dz0yT5+FvES10lx9a73SzUXrBUeB/Ziv2PTH3v
	xmYLErl9mgcETQbYiY1gjBqW01NZBlNcU12HmJm75lG6MaFGy7Cq0v/U96nCLWvMUcYnxg8hJo205
	kfJmK3I6oat6otEl+Qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOe-00000002RZu-1rfM;
	Mon, 26 Oct 2026 12:01:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOB-00000002RIX-32S2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED71260A54;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18E11F031E4;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016078;
	bh=X8Hx9gqAZ7Cne8MmPIj8pLeQAmVLqZqqq82MdU8ljig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KzpbDf4BSVpgOn3JQoqSd60/O1rCDiDrdCvWWFMNc5Xuya0pFBDjaK+DWTN9wGIUi
	 0ei6tFP7BcQrS6mMWmXbXBGh2qvlbqZaOone15E0S1mvvt0ex9JJ5Rs2fIf/cgIPMp
	 4gZvQJhE35flAIxCEDliyRxPf5WV7Qw5M/Lhg3MoGLFOtYCg3qyWz4oV2qFgAG5RdI
	 8K9+JbgSb6eMN70PVBnliKL+RsFhBe7fd7n0788ChBym6KEtbkwkHhUqQBH/8yTgAa
	 g6ZpOkcfqkWvawRzNaIRsNusemJxNw9ShsQzJWZsOCXH/1UMAVun42eEtJhO2qA6qZ
	 alIGmf3Kmk58A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO8-00000007Fr6-46Zp;
	Mon, 26 Oct 2026 12:01:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
Date: Mon, 26 Oct 2026 12:01:02 +0000
Message-ID: <179301587206.2527370.15001063107819712970.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020064306.1542865-1-fuad.tabba@linux.dev>
References: <20261020064306.1542865-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, broonie@kernel.org, ljs@kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 20 Oct 2026 07:43:06 +0100, Fuad Tabba wrote:
> KVM uses the VM's ID registers as the source of truth for what the
> guest has, but userspace can expose S1PIE or S1POE without the features
> they imply. As per the architecture, both imply TCR2 and ATS1A, and
> S1POE also implies HPDS. With TCR2 hidden, the world switch skips
> PIR_EL1, PIRE0_EL1 and POR_EL1 while KVM doesn't trap them, so the guest
> accesses registers that are neither trapped nor switched. Under VHE,
> that leaks values between guests. On nVHE and hVHE, pKVM included, the
> host kernel resumes with the guest's PIR_EL1 and PIRE0_EL1.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
      commit: 68c11eed4f8097ef1b71c30679e96eb654df29e0

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



