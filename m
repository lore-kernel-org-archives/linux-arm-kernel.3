Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACA3CD585E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sI0JYpFoX76WdVsOoDWW7iCOZqGyiUyZSPFi2NbCF/k=; b=gn45VTsFOv1LROXiox19jI8hln
	wHJNfgPepplXveO3G3EpfCfmFTQzq59qLleXdbCYfS+ALEvxbEqYX8TKqeSY09dN9Q4qD1Wk1na7T
	yEG5+0D2G6IXwjNSojUPavKUC8yzMWjXVRpOuuN+5IF0OA6TX2wb46NimGGNkNSzHbHYFCLb5FY2d
	ppHd5H/bpi2wcyA704U0DXIFJWhf4eb3TRnJu8uWykcEsVaZGiums7zt8PCWn1J9ZxJANiKOlEJJZ
	pZcfHHfp86qtDm/2teHBeUFfPGbQ38mA7hVoRoWqRKKa+FQfoskGu/dXJGSAOqj9/ztCoxzj1Hq5d
	tCRI2XNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSCu-0000000Erej-25yX;
	Wed, 07 Jan 2026 12:00:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSCs-0000000EreO-3h0e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E111960052;
	Wed,  7 Jan 2026 12:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945D8C19421;
	Wed,  7 Jan 2026 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767787205;
	bh=DFzcXBzUKkY3oB1avFcHqpTKyx2NIBr33jUnOa1uluc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=buAczF4h9LdQUJ6l4BOZWhEC6r+tsX+AzMnJ3stxO/TW8aLEH5Tk8QQYxk0DIClsX
	 dqh2RjVqOtxXYH7jPauiYAolTUYAFQl2itwgc2rZTJGJiL+g3tbnDX3wCZsjklz89W
	 N/m5/ZuAryf6lURGeGEG7X20AsuHxWILr+jA0jwLKHHL5eKO051I52n3iKnMfmUXaY
	 SAw1u7gjVv49B9iDu6ZRL/F/g+Y19Od6mn1DHG7QGzbP9oqtCFd6AEqUf526Ui+Fqg
	 6nA+wSTSHI5Vzen5yajdZmH+kSF7OxrlXgZ5irajHGhRYhIjSDk5LC3PXxwrrn9e16
	 wMlZdN1CE85Ag==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdSCp-000000003aK-1F7E;
	Wed, 07 Jan 2026 12:00:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	tabba@google.com,
	will@kernel.org,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH 0/3] KVM: arm64: Trivial FPSIMD cleanups
Date: Wed,  7 Jan 2026 11:59:53 +0000
Message-ID: <176778718617.2735797.4211814414552789582.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106173707.3292074-1-mark.rutland@arm.com>
References: <20260106173707.3292074-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, mark.rutland@arm.com, broonie@kernel.org, catalin.marinas@arm.com, tabba@google.com, will@kernel.org, oupton@kernel.org
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

On Tue, 06 Jan 2026 17:37:04 +0000, Mark Rutland wrote:
> This series contains a few trivial cleanup patches left over from all
> the FPSIMD/SVE/SME rework last year, all rebased atop v6.19-rc1:
> 
> * Patch 1 corrects a comment which I typo'd.
> * Patch 2 repacks some flag indices to be adjacent.
> * Patch 3 removes an unnecssary ISB.
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Fix comment in fpsimd_lazy_switch_to_host()
      commit: 334a1a1e1a5f8b4b172683e7507cfec566313a7c
[2/3] KVM: arm64: Shuffle KVM_HOST_DATA_FLAG_* indices
      commit: acd8bfaa9384300a509c8aff5ee4a59a06eb2b2b
[3/3] KVM: arm64: Remove ISB after writing FPEXC32_EL2
      commit: b1a9a9b96169bf1f9cb94b8aa33601996fad1e9c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



