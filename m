Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31A2C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 21:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY164f9Dpcp2/yS8fUOmsR/fCN+c8WLUoh6OQ0HlD68=; b=qW6E2fDdfJ8sLBp5JVqmelaBpm
	GT8eOI7XYLRDdFHbiIP27NIZGyRHmVVQMzDXYd/tT5UmfetlXT1Qq1FXBP+zfNuXgHsaksv49Y1po
	3V2UZh56gdnQ/+oWtjWZa5KhL7fh/EGFWAx1Q2N1CN8U9hEI/Y2ihk9nCeTtfzW9pDz4huZZikqUI
	5hroH6L5fpM2BDrVmEBFh70bnevq1Faer0HodxvKzd10MabT9bnTwwjWm6WJ/jnu20uDS/oCc6htW
	Jr8t97VylS5Fg5e05fZYJh1Dn2J70fZS9RS8xJd3ncZdhT/NJqKc2t6Lhi4Y4wNmMW8abpZhZ7xdP
	9hoPGYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjhC-00000005ElV-35ya;
	Mon, 09 Jun 2025 21:06:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjc1-00000005E9d-1sCz;
	Mon, 09 Jun 2025 21:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZY164f9Dpcp2/yS8fUOmsR/fCN+c8WLUoh6OQ0HlD68=; b=ixl/Y3DSObgazszKpJIdOfF9yh
	yMq00G4fQOoV6DIllST6uMKsfhO7l7AEyqR1lvXt6RLX7v9QcnsdkHOLKa91ipXcsBnT3hZ+Xye62
	bsPKGl+Nu7mc/GsoOnO56im+xe9Lop+NzF3/m7jwdUwwUhDhj2pSoM+OtC1ucSMdyj64t9osCsiAh
	zCIl5XjLnOgdgYh37MHExziyNNZ/W3YEYMUeP2AWoG2jUSSYT1mVQX3GQJNiB78LJ7W/wymnmkSQE
	rJUW8kp0WS/q+MAyp0i3iyz+zPc79WDTTDsSJq2j9I5Cr5YVGbit+Ua8/od7Im0FLLUp2h+xfA1oT
	eb3IXdQw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjby-00000001fqG-3DDN;
	Mon, 09 Jun 2025 21:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C0105C4C02;
	Mon,  9 Jun 2025 20:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4ABC4CEEF;
	Mon,  9 Jun 2025 21:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502851;
	bh=4kqJW1ciMSPYKms3Y+JdGC7f/q+aGKCLpMKAts86L60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pv/uXhpuR9ZUpJOCDfH4EtcgNdI2KVijdLyoVEFoklMIpiFMXuyX2w2RiUjll+Dvc
	 epnH1q4y5U/p9R7+bGNyVh3F+MQdhXLSQZ+x8o5rRx0qDW4PUatpKOyj3U0dFTYMJT
	 zqx5VSP9aGlyp5iR9xCEgkHn/GpMkIoyljRmwtR1iAgR3Smy3VySb50Wb92eHG8abT
	 M6byrRuwZZwueXNpDOnevEJgZrHZGA1ohfpmhNVUsgbIfbl5Sr9ukuT9thIptFp/Fb
	 mcuG/xJHfU6Rn/kmzdUWD+JvTaKi6qqhiQFtv9v6qVCMXsUJFal50MzDGwuhHcyAL3
	 ugxLnp5j/933A==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com, 
 lgirdwood@gmail.com, jbrunet@baylibre.com, neil.armstrong@linaro.org, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, Ai Chao <aichao@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250603055109.3154061-1-aichao@kylinos.cn>
References: <20250603055109.3154061-1-aichao@kylinos.cn>
Subject: Re: (subset) [PATCH v4 0/4] Use helper function
 for_each_child_of_node_scoped()
Message-Id: <174950284791.277844.12094958567890827693.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_220055_065145_EBEC5D6D 
X-CRM114-Status: GOOD (  10.45  )
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

On Tue, 03 Jun 2025 13:51:05 +0800, Ai Chao wrote:
> This patch series introduces wrapper functions for_each_child_of_node_scoped().
> 
> The for_each_child_of_node_scoped() helper provides a scope-based clean-up
> functionality to put the device_node automatically, and as such, there is
> no need to call of_node_put() directly.
> 
> Summary:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: renesas: Use helper function for_each_child_of_node_scoped()
      commit: 077caf1d1763e069239101b4a72351fb38d37f13
[3/4] ASoC: meson: Use helper function for_each_child_of_node_scoped()
      commit: 618abc785e0cbe9993f7217c9f8ecb1cd2478e4f
[4/4] ASoC: imx-card: Use helper function for_each_child_of_node_scoped()
      commit: 111a2c8ab462d77d1519b71b46f13ae1b46920b4

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


