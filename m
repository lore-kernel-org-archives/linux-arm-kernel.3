Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F5EC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qLymUSn2dGzgnqPjS06ZVlX0k4/enNo8NH8C+zF/ro=; b=p3p9fV50xZx0DmnTY/TizGIG6h
	8OxVKWD1ZqUe3Lc8xyNU7s8fVVQCRVE/vxxQjlNESeq++jHD+Zna7Rz3iJgYwjAfnDAac0ECo2LBE
	MzvsOBaNs/IyTxv+CAUKo4jjBanb8wfzO13a7geLeHr/c5Uzl7KVr5jbsvwI0jPuhTMFYAjlBcqJD
	GTrKvrgs0I5wrCGl9isVPcuVa5PthmbYFVMNgm04KPOh3GW3T4ct9lpvxp8xtXtHnQy/R8Hu/92Uj
	TRswdpK5I/MG6QGdfO5/hxdO2TCFIt8876iDqN57zIpsOvCf5LuPW8sTPUdREzP3g1Jmp655ExTB8
	UVlwcR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZO-00000000Zxz-3XZX;
	Tue, 25 Feb 2025 17:18:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyLX-00000000Wb4-1pK9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED6455C731A;
	Tue, 25 Feb 2025 17:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2A9C4CEE7;
	Tue, 25 Feb 2025 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503030;
	bh=m/Rhl9xk8wb/gA4pl1Wi+ZgfjJHp6A4PuropwF5UbcM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=EMndOmQmf/64HxjrnZOJV3XEL66bANshmMnGQu6jQUgnrLdh14x8E6YqA4WNj+JCX
	 UiK16lOpKnn5WZ1CN8qshhMRjYcopfxJl1KZY3okjGR5Z2bS1PT4/+VPqKXaFwB6wx
	 GaKxUVbP0z+pxmCX3KE/Xeg6qUKLu5RXvTO4Gqvb1EUYR3XHEeCfTY+0q4tUEq8XT5
	 ojKPuTCLsVIqfZw9Inz4N+s8AM99yQzm16VWWLXGXQPLymOla2qx0tsVlWnwHIaL0F
	 +fbHN30DytgN3R531Bgva9TbEBaTNp8Y8RIdtziam8mDF0KRgvnCkNXMH44H/9nlvK
	 Eg0XB4AwC7CBw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250217021715.284951-1-shengjiu.wang@nxp.com>
References: <20250217021715.284951-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 0/2] ASoC: imx-card: support playback or capture
 only
Message-Id: <174050302640.104078.14845338578152445669.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 17:03:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_090351_535847_5471190D 
X-CRM114-Status: GOOD (  12.07  )
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

On Mon, 17 Feb 2025 10:17:13 +0800, Shengjiu Wang wrote:
> Be similar to audio graph card, support playback or capture only for
> imx-audio-card.
> 
> imx-card can't directly refer to audio-graph-port.yaml, because it is
> not based on 'ports'. Add playback-only and capture-only property
> directly
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: imx-card: Add playback-only and capture-only property
      commit: 8c6ede5cc4226fd841f252d02ab0372cb92ee75c
[2/2] ASoC: imx-card: Add playback_only or capture_only support
      commit: 1877c3e7937fb2b9373ba263a4900448d50917b7

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


