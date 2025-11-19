Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B600DCEE35E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTV/2kNVYpSifzm/XevXq6Q14OymW+ikXq35P7JdfKw=; b=SfX7C/ILlJbsejr+Q5YhIRGAaQ
	GcOoH+DgTC/mEEkKKKexifkBDeqsnkwyb7ZXve/15SuPpCzRG9l+FTrZefF+E/DCv+Y3Ry56XMKP3
	/FCG1MObretImk7iwYXrpWXnxAQnkFXmvvoBSD5mWTj+8XSzutii2LJcUks2Zg3D3VrkHJzNZXKry
	vJKrglmv1zdClkufBaCl2HUokoiMv+CwZLRwKGrUhWb+QEymEXkNNS1TyjCc4J1/9ENGOFd7dfOg9
	9JeuJuLXFZ6hTdpAsYrAiDNoljrksRNJyu3nFt4tWOFllBsSG8uImGZ/XFMXukG6IkKMdUF+EuGRc
	8ZM8uhSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXdw-00000001NK8-2yZQ;
	Wed, 19 Nov 2025 02:10:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXdv-00000001NJm-2wr4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 02:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D66A160132;
	Wed, 19 Nov 2025 02:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62DCC4AF0F;
	Wed, 19 Nov 2025 02:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763518198;
	bh=SpJRUPvyLTnvYIlkiszgR69FatzMOSlq2j/XN40yrTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=asPh4N3JW0VsvhHqsQhnyVr0qYwk4SFBTsivpRtYS81Tefwt7mv7dbQhKS/vD0vtj
	 Qsfkq87hCf1vDwTAtSVD3QinuxKtW9MHrR6O7rvxzo8qHAXYdggwsfdhT7ErVhxkDT
	 V6pIVyInCreKSKjAePq0ZyC0tyQ4DQsBRu1YV8Hwv65Nus8yqzNBKfM4i3SD6zfjUA
	 QRGXsULcMk9Oh4tjX//j0WQOgEYOaIgYEBUZ/amGxkcFVi3bXwg6Vgs/cqepGDtYw/
	 2tdpG/0FK6/CauBlp6xGQYQZcGCP6S90VJyj4yUlYrgIkNeQHbCivsGWYvuP1wjl2+
	 hZz0n/6pqeYTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251114143503.2139-1-laurentiumihalcea111@gmail.com>
References: <20251114143503.2139-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx9: use SCMI API for LM management
Message-Id: <176351819549.1795122.4050144756909085738.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 02:09:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
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

On Fri, 14 Nov 2025 06:35:03 -0800, Laurentiu Mihalcea wrote:
> Linux supports NXP's LMM SCMI protocol so switch to using the appropriate
> API. The SIPs were intended to act as placeholders until the support for
> said protocol was upstreamed.
> 
> The underlying CPU protocol command from IMX_SIP_SRC_M_RESET_ADDR_SET is
> replaced by a LMM protocol command with the same effect (i.e. setting the
> boot address) since using the CPU protocol would require additional
> permissions (which TF-A already had). Apart from this, the SIPs are
> replaced by their equivalent Linux LMM commands.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: imx9: use SCMI API for LM management
      commit: 94000534e0883b4f4ba9882e4630cfcdf2af539d

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


