Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0D7D0C607
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZH2G9/vbzNbLkB1z9LjjvJNrArOTz8w5tykFqSQ4bpo=; b=2d5eb7PTWeG1vCoifK3p0geAen
	VDXvgRH4gOikqtOX4bto+5I7jH4epaaSzSEN5WuntCG+d24G3tbeFYmhycn5NlObEULADy7uN39Yn
	XQ732Ckz+sBwG3uIhoJ8Xt7O+TwrgrKNcBd4+QHkTk+Wr7NwHbiqkdxPFpac0Q1J73AxTtsbSmsZE
	xgfNC1Z8udgdxCNf9U5lz+2Aq4T9bF2uPT5l/rKPJkUFQQJHKZoaiizX5kJsbIHVi0pnVpXnU0kC1
	LDpTanb/FLsCRLWa2+gen3tjPYLqHo1MRKpd3Zw1uOdRm+9ShIaVJ6Oqy7O+jlqm518S3+HYyq6aL
	Aao50wCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JhE-00000003hwi-0ykz;
	Fri, 25 Oct 2024 12:45:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Jda-00000003hAE-03g4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 12:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4664B5C051D;
	Fri, 25 Oct 2024 12:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093DFC4CEC3;
	Fri, 25 Oct 2024 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729860113;
	bh=TVY/SltFwwPQtKC0Lm7uKRwmTou17zLjJV55JX7/80Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gVQNW2B/CWjAoOAYyV99f5GdiBhI1NwH++4Xr+DSAvLsHWNdn+f/U6N2H/lcsTgqa
	 cxUJuQCgOhuN8VDJTz4RrHhEGLFXBbb/MKUxDJRexxqmA43P2/b9NFbfLLbCOs5rYz
	 +KUMan2C42+nru4x35V9PzQ1e90B/y/7ZvDUjNzr6guv9/SZvCDo9W3ay1LNzKIofB
	 ZKiNXDNBBrdKmfemsJXHAcTLZAFStjYaoivl2p661v6RSDAz9h6IoUhE3kttQPqiI0
	 2Vx1C2Q4kFVgjdHaUHX1Dgvv20SIk8IK4+4ObBXV1gWkXq4w+sI1XMpblOnCm8ITSK
	 2MSIPkx+qhrDw==
From: Mark Brown <broonie@kernel.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Philipp Stanner <pstanner@redhat.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241024140426.157444-2-pstanner@redhat.com>
References: <20241024140426.157444-2-pstanner@redhat.com>
Subject: Re: [PATCH] spi: Replace deprecated PCI functions
Message-Id: <172986011063.56829.8216886296945405855.b4-ty@kernel.org>
Date: Fri, 25 Oct 2024 13:41:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_054154_158205_5A14E52F 
X-CRM114-Status: GOOD (  11.10  )
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

On Thu, 24 Oct 2024 16:04:27 +0200, Philipp Stanner wrote:
> pcim_iomap_table() and pcim_request_regions() have been deprecated in
> commit e354bb84a4c1 ("PCI: Deprecate pcim_iomap_table(),
> pcim_iomap_regions_request_all()").
> 
> Replace these functions with pcim_iomap_region().
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: Replace deprecated PCI functions
      commit: a992197bfcbb14e5a027796e06f86226c4444955

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


