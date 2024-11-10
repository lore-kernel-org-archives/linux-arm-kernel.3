Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AB7D12D4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7C5Ar38WMq/RbelGlWDfzZSm/6sfWPH6vqSE9R5cSns=; b=zVedVu+mByX2Ce1XRDYgcbdV1y
	qv/yLEM0gquJP4sZGDvih0HZhJhNPOkDBekWDRsm9SjedKbtC/OfwG8pWdROMBFhQaNUOCetQEsSZ
	vAoXmG1zWwTGIXOxjb8/dsdswbyjM6Yj2d64SkRzT6qOiG+ddAAysb8d0EJ26vWjuAFdaY6Z/LhLD
	YtCoMtHsr92HF7TZI5pvCzwzEQACdjoSyNQn4Hcz+/yREbY4Jg0nj+xRpLPj/tkMzn4dMveE0UVD+
	7SiGQwXMMhoZhlI/RYwpNUp468/0ukni3nS6utbgM8nxcmVE6+MDcpysZ9lIqvNbRZCR5LLOgbJwC
	R3fATakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAB7d-0000000FFzO-1rxO;
	Sun, 10 Nov 2024 16:49:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAB5p-0000000FFm5-3cXz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 16:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 738A05C5842;
	Sun, 10 Nov 2024 16:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3878C4CECD;
	Sun, 10 Nov 2024 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731257236;
	bh=VGC2pIhZ+IDQ2o0aJN8sRl69nsKEozNmQTG3IEvbxKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrR+nUkJ3bVOgtiK8F1MkijjiLACCSt+qLcmc6zPGxUQtm1LEJUun/AWRwTNsF8rW
	 A5uzZkGA3DKEANdXaWyq1dDgh3xgTXY5f5KjOsER55oVzsawGw0GgYQIjFsALsrAxP
	 HNTmUchhgJvz64QjzxxgKqW6xHOzE3EwOvzQthgLDWr1mBNsprio1NrrgkzL6hc8ZZ
	 3934oyHXrgar6FUUbFWCzHLuyR+tosfhLaCIBl5cw8AZMQv7hmZbi3EfifiggpsqbR
	 Zr57jui04VqejufQbkRuCRGC3+53hYViEtgQt7lvL7xtCHC7lgYdOWdIX/P9eTI392
	 bJF+yjnRIkY1w==
Date: Sun, 10 Nov 2024 10:47:13 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2] arm64: Allow packing uncompressed images into distro
 packages
Message-ID: <el65ezf4w2rj67afgvspn3ehyatvbc7jllkcpfc23mfeo6fsni@4t5vytmetz2p>
References: <20240910-uncompressed-distro-packages-v2-1-51538434787f@quicinc.com>
 <86wmi83sl5.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wmi83sl5.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_084717_970477_3F460872 
X-CRM114-Status: GOOD (  25.77  )
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

On Wed, Oct 16, 2024 at 05:44:54PM +0100, Marc Zyngier wrote:
> Hi Bjorn,
> 
> On Wed, 11 Sep 2024 03:53:16 +0100,
> Bjorn Andersson <andersson@kernel.org> wrote:
> > 
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > 
> > The distro packages (deb-pkg, pacman-pkg, rpm-pkg) are generated using
> > the compressed kernel image, which means that the kernel once installed
> > can not be booted with systemd-boot.
> 
> Are you sure? I just installed a guest with systemd-boot
> (252.30-1~deb12u, as shipped in Debian), and it is perfectly able to
> boot a compressed kernel.
> 

Sorry for the late response, to verify I did "make defconfig bindeb-pkg"
and crafted a disk image using mkosi. It contains:

# apt info systemd-boot
Package: systemd-boot
Version: 257~rc1-4

It fails to load my the compressed image:
../src/boot/efi/boot.c:2557@image_start: Error loading \debian\6.12.0-rc6-next-20241108-00003-ga216563e3174-dirty\vmlinuz: Unsupported

Which is expected per per this discussion:
https://github.com/systemd/systemd/issues/23788

> > 
> > This differs from the packages generated by the distros themselves,
> > which uses the uncompressed image.
> > 
> > Use the newly introduced CONFIG_COMPRESSED_INSTALL option to allow
> > selection of which version of the kernel image should be packaged into
> > the distro packages.
> 
> I'm normally building kernels as Debian packages, without any of
> CONFIG_EFI_ZBOOT or CONFIG_COMPRESSED_INSTALL.
> 

My goal is to make "make defconfig bindeb-pkg" (and the other -pkg
targets) boot out of the box in a "standard system".

> As a result, the installed kernel image of a Debian package shoots up
> from ~8M to an impressive 25M, since we're not picking the compressed
> image anymore. Storage may be cheap, but still.
> 

No argument about this.

> I really don't think CONFIG_COMPRESSED_INSTALL should change the
> existing behaviours, and a new option would be better suited to enable
> this new setup if deemed necessary.
> 

My main concern is that the "make *-pkg" targets create packages with
the compressed image, while at least Arch Linux Arm, Debian, and Fedora
are packaging uncompressed images in their official packages.

Regards,
Bjorn

> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

