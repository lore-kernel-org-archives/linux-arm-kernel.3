Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FE8CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EaqxrR/sV3bOU1Rowx551pwQAzOjjox3enBFC+z/Nc=; b=reUpuHlDlbfteEZNUiR2IzRLXc
	LscoMpTMQQQSf+0Ah7c+XsIQmE7WWlMMZh+79XbC1H5oT6dAqmXgBsgsPZ0eBfwRXZTVBeymWWlw2
	3aW8bkjbdeRWv1OkDNFkG2Vq/Fd9jIY9Xljuml+Dan6kftCnLm/vbRHaCIMhR9U5YSrQZZkjwxpOu
	WsjyBnfdOMYmjyg0A7SL2bUMT/sM8fS0NRw6feYZgzePlcrY1Cf1yefcqm8ZRnRmYCxDw7YsCTM2h
	TeiT5VrdvvbsXERWiNPzPKjjHYusLQZzRwUB1ELw/FSI3z+hjMQNh84qQwVJZEgqU1EvXXKmjlG56
	MGsG84FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYADC-0000000BeeV-07aT;
	Fri, 12 Jun 2026 22:18:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYADA-0000000Bedk-3Spj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:18:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E08243B79;
	Fri, 12 Jun 2026 22:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BC71F000E9;
	Fri, 12 Jun 2026 22:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302728;
	bh=+EaqxrR/sV3bOU1Rowx551pwQAzOjjox3enBFC+z/Nc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MCcjGVU5k6xblfjlm0hOAQ0LxniK+ioRseQAbGr0sTWq5Lvyq/kScY4vYXkb/bfHt
	 whIPFKbPmP/Ai80uaaYsLEKZdkge2EV9bFQJ8FpSqRvTekmxqA2m4ENfJ45lDWb23x
	 JRoKEzD8PwT3Gi7LFaSUE3fz9rV7bdQPQh8T50fB+l9V4vBBBVOZgZTotMERGRI2j+
	 J/RNWyA2lumXc+UcKfnTHysZq0b5GRmfgSBSt73C0Kqcl+lcjT3N2TQ99nImUGUNVm
	 X4iMalO4cRwCX3tnuh50dZRQ0NYuJVlja1KFyzwDKG4daTUmWSEXpYwa0KIMhdlG+8
	 YIrtwz6f2NHEA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org
In-Reply-To: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
References: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: use scoped OF node handling in manual
 cleanup paths
Message-Id: <178127725305.48375.17603847447471691265.b4-ty@b4>
Date: Fri, 12 Jun 2026 16:14:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6NdJ1oXu8X+yrUyYOh3BVEt16gq7UD6K3TfA3IfrptY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXBRNPXenH0pNh+GaHTYt582SCRLiGDStmcX
 CIiqu8x+JmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFwQAKCRAk1otyXVSH
 0KzSB/9EIxR68YF4xkDdQc5qt3LLq490icnYLlz3hS/NZYEltakjL8njExuQ3zcTJBfIUrJCoZe
 V1ON3uZ3j1Ea91FUKsiBqIRNWpfU9cOfYwKdezXVTXFbrtH8oYaas6j/H0fm3C3KFDrcx6OV62E
 veBD3U/6ovNL+EL/marF53J8tw5ujOw6s6ht+U6oO7M/aQqxpT59X0xh0pYOSN8xvvbEC0RIO14
 nE1lO2wTJVHs2UYC1pLy0fuJyexr2jtykNji0JTzLDnobKjHMfIwxzCmM7fiCMq9aeTTzznCM7k
 IlTzJifQ4K3OWu56FdA49audNwYAbb6FUZGz2hV7qyC9/1jV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Mon, 08 Jun 2026 10:39:10 -0300, Cássio Gabriel wrote:
> ASoC: use scoped OF node handling in manual cleanup paths
> 
> Some ASoC drivers still manually release child OF nodes
> when leaving child-node iteration loops early.
> 
> Convert these focused cases to scoped OF node cleanup
> so early returns and normal loop exits keep the same node
> lifetime handling without explicit of_node_put() calls.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: qcom: common: use scoped OF node handling
      https://git.kernel.org/broonie/sound/c/22aed576add0
[2/3] ASoC: fsl: fsl_qmc_audio: use scoped child node loop
      https://git.kernel.org/broonie/sound/c/065df02692f0
[3/3] ASoC: bcm: cygnus: use scoped child node loop
      https://git.kernel.org/broonie/sound/c/9741aad24432

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


