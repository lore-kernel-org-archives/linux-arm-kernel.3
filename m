Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96210C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siTnhNBt13L7b2sLb4TE1iCkna5d29kE7DHkUKqybyY=; b=i2x+OS1dOkopM8tUEVndPa22e7
	q3rBj3no/GiWxIx8FoVsWf10waA/NyZF213Q7qPjDtiJrBFORvdwkAe218U+OI6yheCHj2ZbCSlji
	ZcXeY4FxafknJFcnSHqCdrlWWN91vAxxps30FuiAjzn4rMFFYkw/lf05b/d4r+N9LPQI+R7KTgka1
	dANMYyaVpCkfbP7qnlfbXGXx1Uc7VylP0+O7rzPqBGD7SzzaLEfGHQkRTNNryCos2MsXsfF3k2NmJ
	OVfOwCLmdvY1s9hY8/BzHfQMJb0L1q6I4+/+rbOLYbU5R0ERSlwhDWh9CBEE5IOSARBO8sSWtIOcL
	mF9bdBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARym-0000000FHAM-2vah;
	Thu, 01 May 2025 11:21:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARvc-0000000FGnV-0kFh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:18:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97F126846E;
	Thu,  1 May 2025 11:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE149C4CEE3;
	Thu,  1 May 2025 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746098287;
	bh=M+TEHKrX1ITU5RxyRfhfDldVttVCWJHNyt+W5XTDOhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RZwGFe3kcccqu3t0IVRYGKOGspinPsZKk882EEh49/sh5YgQM84oTJU1Bd/ncwP6q
	 pYmoc7CgojNHXaKQRhDEAgz/uycDRnoQ90Ir5xwZip3IaoQBmH5FmE1qSrtwZPfMSE
	 c9q6nOSD/Y8oz3c7vPYSbzWTgaIjSP6oPOYz8qFZuJ36FJNvSOoHXEmdgvfoH9s61e
	 u59tDUF/pr7hPUgd18c0gMpE1TcIUcSp6ikuDHetaE8R24qjFfoaKSkdqqxKx4r6Gk
	 /DFi3RINn8t3fHxvr3UmW5ZfekRW/jWEDnlsWkgXWVQwMiupXTf8k8c0GllyPkeEyA
	 yBGmlY0blnRhw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, krzk@kernel.org, alim.akhtar@samsung.com, 
 s.nawrocki@samsung.com, m.szyprowski@samsung.com, ideal.song@samsung.com, 
 beomho.seo@samsung.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
References: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2 0/3] mfd: exynos-lpass: Fix some error handling
 paths
Message-Id: <174609828442.3756623.12093382132101705631.b4-ty@kernel.org>
Date: Thu, 01 May 2025 12:18:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345
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

On Mon, 21 Apr 2025 17:00:32 +0200, Christophe JAILLET wrote:
> This serie fixes several issues related to error handling paths in
> drivers/mfd/exynos-lpass.c.
> 
> I've split it in 3 patches to ease review, but it could be merge in only
> 1 patch if preferred.
> 
> Patch 1: Fix a leak in the error handling path of the probe. It should
> be straighforward. This patch is already R-b.
> 
> [...]

Applied, thanks!

[1/3] mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
      commit: 8cc4952d1e8618eff474dc7154c6537db88178df
[2/3] mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in exynos_lpass_remove()
      commit: cb931849ec1e71900eb54d0a377ae30e0bcfcffa
[3/3] mfd: exynos-lpass: Fix another error handling path in exynos_lpass_probe()
      commit: f408e20757afa3d8c719a8a804cd2c83262514dd

--
Lee Jones [李琼斯]


