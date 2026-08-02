Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ACAC55177
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2avLvPB80HIFXkBSkpiF/wYujLC5U42IwkZ/F2PszQ=; b=1cnTLVCHouvhoW2c7cpRLqpfJI
	ynRLXJLRcYvI/Iw5cWQldAh7vfSnNFT3NY2+f8koWrEd18ki/GUvSdX3bz1iEais4Gd1RDrAPsztI
	q9MkA0/3nvz0orgrNDg8lTF9be69Rhnut2TB0neTnY72X1q7XNf3RzFR2zD8Fk+0KXI8Fm3Q0QXdG
	pgDIDzDQr6L43MEVs/mRZ/00fvovhYAqmq/MvpqN3EGyRlS0Iv+wCGlRddFm5M6CFGKtyzDkwoQpP
	txfZm5pX8x4RQuLRPvxLrKRznWMUv+IEhOtQzJLeoPd1+1Vf11z2XE9ISv9J2OfIFztCc8Vrv5tvG
	jFnGR+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV49-0000000FbuM-0sPi;
	Sun, 02 Aug 2026 12:13:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV47-0000000Fbrx-0hjn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7EB140A55;
	Sun,  2 Aug 2026 12:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257811F000E9;
	Sun,  2 Aug 2026 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672794;
	bh=V2avLvPB80HIFXkBSkpiF/wYujLC5U42IwkZ/F2PszQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WeiAd8kD7RZ7Cy9BY0UEnsOZp7QiaPyfAGkKzfIbmqxbvTv2Qlc57WFGenCwpyo4a
	 eOF7VdhbNAd06ifc3Qo+Qq1jMpQmexfEsp4rab3zFSriz+mMbbgdgZ60VHI0Dz3Zzc
	 vmDhUjmeJZpM6CgAsbc+wNKCkTPguHCFcs/I4MHklECSbiE8PadjbRJZIcQBzqIgMc
	 fSz79vXwF01bCeD+I7aLoLnrAJxKJ1GfrXJp/Thdj+RMhLPKixB0GQQ5OTVyHOtxM2
	 eKuDr8tMPe1JGb+H2KdndHthHH1lxn7c1grMlQYyILB3aUNdOZ+m6FiErCnEyEcWmZ
	 jmdyGigLPnqSQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/2] kselftest/arm64: Add two arm64 kselftests for orig_x0 issue
Date: Sun,  2 Aug 2026 13:12:31 +0100
Message-ID: <178566425249.4143122.5280798109588478069.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728021122.2640104-1-ruanjinjie@huawei.com>
References: <20260728021122.2640104-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 28 Jul 2026 10:11:20 +0800, Jinjie Ruan wrote:
> Recently, a security issue related to orig_x0 was discovered and fixed
> in arm64, but there are still no test cases covering it. Seccomp,
> tracepoints, and audit can observe a stale value for x0 after a ptracer
> or SECCOMP_RET_TRACE modifies x0.
> 
> As Kees suggested, this series adds two kselftests for arm64 that validate
> the orig_x0 re-synchronisation fix in ptrace, the first one is for ptrace
> update, the second one is for SECCOMP_RET_TRACE update.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/2] kselftest/arm64: Add seccomp ptrace x0 bypass test
      https://git.kernel.org/arm64/c/2fcbc4adf997
[2/2] kselftest/arm64: Add testcase for SECCOMP_RET_TRACE orig_x0 bypass
      https://git.kernel.org/arm64/c/21e37da12071

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

