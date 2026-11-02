Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982CC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZKbceFAr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQEWA0Ld
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QX4vvRkpVr0B80U59OYR0KCNPvp4g1VB7b3k3yNPpZ4=; b=ZKbceFArZyPpE9
	SWKeaZHmixCvaQnOBs2mo7IJf0ZIgJ1EvmdaKf90vrHaewcpQblMrZVozonIxf7cML8070wRtdrDM
	M2L7RtxYSaeDuCDI+EwAAHz6uL0eBIi0Y4UlwuPST3u8j/BEqodGZP2/9cNZ5R81lGK+CUxsbRgdt
	mrpihRGyi7sBsYVZaZOeEid5eUY+5VR/rEF0AUtmnLV5+ODYrlTbOeqIAEaScxIby8J9I427e0wl8
	Ny/7E2N6DWRioJCRQcCh7w4OzB0GyOhBCyevKIR3RqHkyst7t6P7ddxq7S7sPi70DH91zRtOYgM/3
	rHRafWj9EGAcx2EjjLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD4n-00000002Hh6-16UQ;
	Tue, 03 Nov 2026 11:53:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD4l-00000002Hgy-3yK7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:53:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B3D7600CB;
	Tue,  3 Nov 2026 11:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6C11F000C1;
	Tue,  3 Nov 2026 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706794;
	bh=QX4vvRkpVr0B80U59OYR0KCNPvp4g1VB7b3k3yNPpZ4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=EQEWA0LdkL+WaYQuTgDi2I+F52yCDuKksk7JPbpsk/R0L+yg54REe7AoH5MMYM3Ap
	 kMAYH3C5cf50p+SarjWctte1bPZrro2QfJ4kydJi0HrcrmIqZfbsLaluco1QzlQCtK
	 NNbEJ537LLA8sRlESlgKqbxfp/EOenCSI7SU+BQVPNlrK9Pxi8H8G74ylQKjCi638S
	 suEWo+Ix945UhL/yNsaq64qPhBuxKDWOD6NP5Q4XRby6P/8GFipmaEU1e7A7iC7qSq
	 W9JEiq2aub/rdA9B5GqQWPECRA6b6ED4OvdJAsZdqIJBrOTIAg7VYW9RxIVFaxHsWI
	 D9EttiZ0arnIw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 5B780253A5DF;
	Tue, 03 Nov 2026 11:53:13 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Felix Gu <ustc.gu@gmail.com>, 
 Atsushi Nemoto <atsushi.nemoto@sord.co.jp>, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20261019084443.1824122-1-yaojiale02@163.com>
References: <20261019084443.1824122-1-yaojiale02@163.com>
Subject: Re: [PATCH 0/2] spi: handle runtime resume failures
Message-Id: <179365918672.2186205.4416835232546842511.b4-ty@b4>
Date: Mon, 02 Nov 2026 22:39:46 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lIzAZG4+GOPocoiDdMsg4lKiIR+1ubBdn9tppcCIBMA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJentZ8vFpbfsnaPT+/fJ/i+rLa++T8CZyf9Nj6N955O
 OnCogzBBx2lLAxiXAyyYooscVncL+tLXq/hO7iwDWYOKxPIEAYuTgGYSB8nI8Nu9ZRFHBNLQrd3
 JEvO1ere9SHpX4bP2k+vFX6Uubz5ofSbkWH5x4V7Pj/9xHH17q7sGXErCpkjC0u2b13wb8Nj3Wt
 HPsXyAgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 16:44:41 +0800, Jiale Yao wrote:
> spi: handle runtime resume failures
> 
> The STM32 OSPI remove path and the TI QSPI clock setup helper ignore
> pm_runtime_resume_and_get() failures. A failed runtime resume leaves the
> controller unavailable, so following register accesses are unsafe and a
> later runtime PM put can be unmatched.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/2] spi: stm32-ospi: handle runtime resume failure in remove
      https://git.kernel.org/broonie/spi/c/e359991c180a
[2/2] spi: ti-qspi: handle setup clock runtime resume failure
      https://git.kernel.org/broonie/spi/c/b21192833996

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


