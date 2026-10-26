Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8461560A3822
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0WfTtQbs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jl9ePWmY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i9d2w8902Adn/vvLwClFjjVwTKsY1rEJtVs3bWX/Hiw=; b=0WfTtQbsQLPYN/
	9OFd1L4yyyA6yoQWgWxRhT3gO25t26CgX/7L8MwwGI7xDlM0AWHi3G2AmVmYaUDLo/v2sVs4KLzvp
	RMaqfU/xJEl17yy4tu1csu3KU1Ji/Hn9V9SIBi6MnUHgZsWpF8+ns8Uw5RSlpHaXPqb3BuYWrw4qS
	FKPcyn+oa83ZNtr8lX7/5RsZP0gPwqs/aEYE3w4mHFXFxTfsDewXxGJLwnDGyVIzdo/weXyhW1VxJ
	rlr0JKuy0Kz6GNb7HdMDTOycOHNp7YRQWU82U7g60QKW+7eZx3mIZs2//QTlfYxkL1OY8D+hfAsQl
	3AHCU4EuSK84RYfXBJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOC-00000002RJs-0SJ7;
	Mon, 26 Oct 2026 12:01:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOA-00000002RI9-2fLX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E36B43CD4;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3170A1F031E5;
	Mon, 26 Oct 2026 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016078;
	bh=i9d2w8902Adn/vvLwClFjjVwTKsY1rEJtVs3bWX/Hiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jl9ePWmYB8PdRHvLvKgd4dwm/KtEUzpsFDWj9At/nEduJiOEfS9TCVSVLOMRIZuoQ
	 7wBcZLG9gD/b9Ycs31YSXaVjX7lynT3wqF6omOe0WpHii7Yyh9TUEx1HXxF015kNBf
	 0CUja3UO2itUPKbYcA1QNfrdwT9vNOSoBgrrRGoBxIHhLtx20ShxewhWKO2aEXyRPI
	 kxLwdxU7+Vzd7LSxYv4BD3uvqLf4ZJF9POdIr8FvKmmT2pL6q3W2Q5YIoRaFyaB+9p
	 9dojjsjdctI1Y+2QY1La9FVpcFnfamWltmYs3MqiaKE/7Gqn76/GWpaYTRVsW0lN2s
	 lN8wMcfaaGD1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJO8-00000007Fr6-1r7B;
	Mon, 26 Oct 2026 12:01:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Don't WARN on SMCCC filter reserved range allocation failure
Date: Mon, 26 Oct 2026 12:01:00 +0000
Message-ID: <179301587183.2527370.13372892962068764857.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013164334.1492070-1-fuad.tabba@linux.dev>
References: <20261013164334.1492070-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, fuad.tabba@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org
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

On Tue, 13 Oct 2026 17:43:34 +0100, Fuad Tabba wrote:
> The first time userspace sets an SMCCC filter, kvm_smccc_set_filter()
> inserts the reserved architecture ranges into the maple tree and WARNs
> if that fails. The insertion allocates with GFP_KERNEL_ACCOUNT, so a
> tight memory cgroup limit is enough for userspace to hit the WARN, even
> though the -ENOMEM is also returned to it. The WARN dates back to when
> the ranges were inserted at VM creation.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Don't WARN on SMCCC filter reserved range allocation failure
      commit: 09d5e940500c2e51b697a0522c54132c1ef078ef

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



