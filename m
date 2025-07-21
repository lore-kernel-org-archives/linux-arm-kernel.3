Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5EBC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jPXukQxnHFJweD56Mskt5ux7cwhkq/b+3m6IFhLRZY=; b=wLk8N793TIuLGlk8Os4pT/Db6d
	hh+WzZ1SAqG3YrNxqZYZ/FebHNGMoiVN/giXjhsD/4WuSJQEBZav9P8WMenUxCNTne8Eep8XGklWk
	T5AgblDvAT1/0rMps6ixA18bbqGe/dH3cyHenUPuSO3TRgLoQNbjOkrnuW/k4uD/IWj8BLR1IOKZu
	2vXDaATOuFioOP32D4NTIYshmaWDsh//qIXc9byF1Twz/Xpq98Yl4ejk1TShkUqTTN4B+a6VBPUWW
	vAWJTj8sXow8poAYGMmBFqXCtkcIbJQO10elheNj3WTKI0W+KIDafOqe2eizR59s+4ea/2H9QBnro
	ebActSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvhr-00000000Rkn-3cmi;
	Mon, 21 Jul 2025 18:57:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduaM-00000000M13-04ov
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 17:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62B005C628C;
	Mon, 21 Jul 2025 17:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B0AC4CEED;
	Mon, 21 Jul 2025 17:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753119957;
	bh=O0zfAfduBUbLbWf83/6krXEHER/tdRj0Hvvb37jb62A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HZ7FSTUaMx4xX7JIngOhQxfb2uAGgbPqHq804i0Xq4y5PjJO0yjHhC1oI/ja/QSQD
	 bN0ingyjFKo29Hy8YjRrFW5E5oIGoL7j8JWCu637IvDHr7OORVsHK+R+j4yECPfWJn
	 yoZlSaTLgvsukYPF09f36O2HYHGgO/MfMU6m+s136SVo9dHPrRYAZpGDO5eNoQapbz
	 tPIZ/AvfbvzQLiJ8fqnOlvWVbQXqi/fS62P3unI00c9OrZsXMW95x4Euq62wtEe14o
	 IfJScq1msWA4HF/UegjMgxjlpJIEVADTNm+gDqdTYEGT0w/lNAoOD+J+1yE4zGXRJM
	 eredAQvF3Vv6w==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	wei.liu@kernel.org,
	romank@linux.microsoft.com,
	mhklinux@outlook.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	kvmarm@lists.linux.dev,
	Jack Thomson <jackabt.amazon@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	roypat@amazon.com,
	Jack Thomson <jackabt@amazon.com>
Subject: Re: [PATCH] arm64: kvm, smccc: Fix vendor uuid
Date: Mon, 21 Jul 2025 18:45:48 +0100
Message-Id: <175311813171.3793918.5949198639937646656.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721130558.50823-1-jackabt.amazon@gmail.com>
References: <20250721130558.50823-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_104558_096007_444A9CE8 
X-CRM114-Status: GOOD (  12.09  )
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

On Mon, 21 Jul 2025 14:05:58 +0100, Jack Thomson wrote:
> Commit 13423063c7cb ("arm64: kvm, smccc: Introduce and use API for
> getting hypervisor UUID") replaced the explicit register constants
> with the UUID_INIT macro. However, there is an endian issue, meaning
> the UUID generated and used in the handshake didn't match UUID prior to
> the commit.
> 
> The change in UUID causes the SMCCC vendor handshake to fail with older
> guest kernels, meaning devices such as PTP were not available in the
> guest.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: kvm, smccc: Fix vendor uuid
      https://git.kernel.org/arm64/c/ab1612211532

There was a stray "getting hypervisor UUID")" line in the original
commit message after the Fixes: tag, so I dropped that bit.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

