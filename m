Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4895CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 21:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuCcNKlBGvtnqvBvkqXr9K8d2tUZ3DIWY7nKfWt/lcs=; b=e8da/VhxfNBCkYRbET+ng9CB5A
	ps4gVJiyV9GCo7tdcIM6N2bwfGQelxCF4nSWcwo/DXFQGfMjeneN546euFxd/R+9WoLnFT6JKN4ay
	3CsRtkf90kRQ4Vc5qsauCxMDYqawu+bR1kNG4eXIsDQGVMmvsQ+zIhGhwa3kZ0Yu9pVsibZ6QloSH
	FfUewIgvzZ5Ry1PrA4aSrIc4n9BaTWZAzjxHYJCoLFU1TquAfve08l3Op62qJrZKFN+JVs4FeGz+7
	kKZnVrVzhAoJOAzwJk5U0auEvHzYdQEaLd6QMthX+T0GfEhKr8Dwgiq5yRWJxvmV+t+Qc4Kea4MdJ
	pn3dxWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsnr-0000000Fpb3-03vO;
	Wed, 03 Jun 2026 21:07:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsnp-0000000FpaO-3gwJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 21:07:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4147960136;
	Wed,  3 Jun 2026 21:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C75D1F00893;
	Wed,  3 Jun 2026 21:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780520825;
	bh=zuCcNKlBGvtnqvBvkqXr9K8d2tUZ3DIWY7nKfWt/lcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C3NEPwD4GvgSeWN6a3CQ/gyiEh+c0zvPeQQGLhGxCTjJet12GZSBrXbGn9OH0fhcz
	 hpMn48cXO8/bhBG1zh9zB6P3mRCow/IqcbgbwCJRugr3zXJFhZi9t862Ip6Owa+hJg
	 2BOXHRdLsy7Ue1D4XV29EC1bdDP5qtC6rNkxfXGmeekH3i8oGoRbHI1GeJuosp42BH
	 tH/TL+AP/KMPMuJJkP4t1OAjayb0Ffo3bYj3qKN7X1nqueA6+bQLCbYNgNOWk3f8D8
	 Cen2wOVPr+p6qQSHKaNDiCG0ndlgVo3FsPPaQ8vHCA/EKtLnZ+Fr1R8kFwMkTrkqLl
	 /QvGO20Ola7AA==
From: Will Deacon <will@kernel.org>
To: vladimir.murzin@arm.com,
	xuwei5@huawei.com,
	broonie@kernel.org,
	ryan.roberts@arm.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	oupton@kernel.org,
	kevin.brodsky@arm.com,
	maz@kernel.org,
	yeoreum.yun@arm.com,
	skhan@linuxfoundation.org,
	yangyicong@hisilicon.com,
	thuth@redhat.com,
	kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com,
	lpieralisi@kernel.org,
	miko.lenczewski@arm.com,
	mark.rutland@arm.com,
	james.clark@linaro.org,
	Zeng Heng <zengheng@huaweicloud.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	zengheng4@huawei.com
Subject: Re: [PATCH v4 0/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
Date: Wed,  3 Jun 2026 22:06:31 +0100
Message-ID: <178048700943.309679.7634002465643697724.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603062025.1504083-1-zengheng@huaweicloud.com>
References: <20260603062025.1504083-1-zengheng@huaweicloud.com>
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

On Wed, 03 Jun 2026 14:20:23 +0800, Zeng Heng wrote:
> v3: https://lore.kernel.org/all/20260601112000.1145391-1-zengheng@huaweicloud.com/
> v2: https://lore.kernel.org/all/20260529063132.766491-1-zengheng@huaweicloud.com/
> v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/
> 
> Changes in v4:
>   - Keep orthogonality for CONFIG_NVIDIA_CARMEL_CNP_ERRATUM and
>     CONFIG_HISILICON_ERRATUM_162100125 within the cnp_erratum_cpus array.
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
      https://git.kernel.org/arm64/c/25996982ebcf
[2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
      https://git.kernel.org/arm64/c/f64328ecf4bf

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

