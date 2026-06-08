Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980B6CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogyh4wObZizXAya8DYDVQH81cbqfbWCBqwPAMYcZIC4=; b=NF0EmSBT9Kv1ynYQsM/NU7DdyH
	+hNxZ20sjdElyLItCidpFW519t2sOW/7tJt7mbrGZIV7p1SZw9qcsPhcvXByfFJvXR3jS02PNPQ2b
	bXLQHxacc+V7OPnTAs3bUpMiqK7RDw85yf8dpbqc/1QKWKMtg1i3F+Vnd/wDEOFJVgr3w7uBarIHs
	02H+fa6rTr5sxn8kfeWTKO+RxuByqE9GmluIaD3G47ef4sJUcOpXYXKLU6ydjNq3/tasDoJQ2R5zR
	p1rTW91waMV2DRyIF5iFUmVmZGPgPNzS+YyLhRHlwigu8ix6MZ7UO2xZtA6e4NOZonKmS4gk+jY/P
	zkyUvokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs0l-000000055VY-10Q3;
	Tue, 09 Jun 2026 08:40:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs0j-000000055Uz-32Ql
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:40:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1922C601E1;
	Tue,  9 Jun 2026 08:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01CD1F00893;
	Tue,  9 Jun 2026 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994436;
	bh=ogyh4wObZizXAya8DYDVQH81cbqfbWCBqwPAMYcZIC4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gLN3Tz0CeLBoINPbLoMDEUIeCS40M/eztQaoXb2xOXXCuWH/8ntgJohyObvQ49N/Q
	 1vu3Qb/12zKwAVIoVIaEfG0NxUHdmW5xIwt6AYmcYQqhb/7ZS8P7VZlvkzuHG+81WE
	 zBsafO+3vZ4CFTAr/PkIfa3TnPo1G736JHlBBX2/FTwVZDKeB9VpMyyUvfwl58YDPy
	 p4derCnh8YJvfxsZaBUuaOqjHlp7BGDxE+Cbo+0O9Bo/cxQe23lKWqRQ9PpBk8KF1p
	 Q/HbK8FCDH/RjSQSV+WqD9F2nxhyv6gZkuPeP/bbJb5Uamr+iW8Qluy335nZegcijS
	 4FljBATGIB1Gg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Chancel Liu <chancel.liu@nxp.com>
Cc: shengjiu.wang@nxp.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 festevam@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Frank.Li@nxp.com, s.hauer@pengutronix.de, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260528020725.2265321-1-chancel.liu@nxp.com>
References: <20260528020725.2265321-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: imx-rpmsg: Add headphone jack detection
 and driver_name support
Message-Id: <178094123266.20828.2548677822968710520.b4-ty@b4>
Date: Mon, 08 Jun 2026 18:53:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XSjoHKs8MCMIjerSDcjBJdrB/+DJHhLIab/p1Ghmjxg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqJ9Fxq985rl6kfTLCWLnzgyx0mjqIxkqYD996p
 GmnbAq+9+WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaifRcQAKCRAk1otyXVSH
 0Pz7B/9FpjAQLHNUdUnnW0vYfUAIj7d1B+K/0BzPsIUnYoaLa/9/3mAYK+III9/dbbmJ5lIeciG
 BCywHAC0/i96S9Ocrz8FYBu6NXNozRr9GVGV2UrbqjjhaNKq/LI2fXnpYhPWj0jsPPWMX8/PPrr
 /c2nrMWRmZMhm2BrgvQI5FOyFqjMhAMl87ZfhHzxvvS5POknlQQw4Cb79LrELy2L4iuMgC+9PiX
 Jk121hJBNFh9wF4ozz83VsyVui5ZSg28uV+snrfVPV9/vm6E2w5RQMEp2zn2r8vAnllRum0htVE
 O2hed+mhbUu87ZlXDJavMdPzvvCturASxUp9R2Jsb2CnhHkr
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

On Thu, 28 May 2026 11:07:22 +0900, Chancel Liu wrote:
> ASoC: imx-rpmsg: Add headphone jack detection and driver_name support
> 
> This series adds two features to the i.MX RPMSG ASoC card:
> 1. Headphone jack detection via GPIO: Introduce the "hp-det-gpios"
>    device tree property and use simple_util_init_jack() to
>    register a headphone jack with GPIO-based insertion detection.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: dt-bindings: fsl,rpmsg: Add hp-det-gpios property
      https://git.kernel.org/broonie/sound/c/1558039bea60
[2/3] ASoC: imx-rpmsg: Support headphone jack detection
      https://git.kernel.org/broonie/sound/c/ec74d4f934a6
[3/3] ASoC: imx-rpmsg: Set driver_name for snd_soc_card
      https://git.kernel.org/broonie/sound/c/af0d8aa7fcd5

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


