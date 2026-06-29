Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36C2C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwh8Si0th8ZwAZOQzQjkI23sQnD/NKR2H40oiYsbBcc=; b=o7FvkOuHRFTZWSzQAhk5LeQvkW
	mydyXmlCeOedKu178BAMkXXm0reJG5uxmE+qzW8W8Il5prLWTHY3do64PHTfLmeFlZW3JyUMMdzGq
	tETsdH234OWs7IgMsFAidzDCJvwo1FHdUHNk7eHRcRLjUA/xTklQkUkWmvIRbfkiVUAtCX7SiXEvJ
	6kN5//rkY9bB/k5KXTuBlav9MAJWaMY5+hGS7Wb6kGnmCMyWUg2eupbmPUu3ddJeJ7ayQXVJJn3U2
	tQ/ffS6hWjCArFx6Xn6VG87xn58kkfwal7B7nShcvFkkV7AFE6G26LOKkynRfMUvDCr7FSgP/MDOv
	NcKIzv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWSR-0000000GozE-3bZ6;
	Tue, 30 Jun 2026 11:16:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWSL-0000000Goxb-1Jr3;
	Tue, 30 Jun 2026 11:16:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD82241450;
	Tue, 30 Jun 2026 11:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EBB1F00A3D;
	Tue, 30 Jun 2026 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818204;
	bh=uwh8Si0th8ZwAZOQzQjkI23sQnD/NKR2H40oiYsbBcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZvCLDp0pTJUja1XYhOzi88zaV4EHqESZME0ESIQ32LTRYEeZbSO3B4q7aGfWdOoLY
	 pRbyAMMf40Vryxrc1tv88gwaTKZrnnFfe+Ss0wyI+xoZ2RKVpFBMKFpJ8I/Ci/xl35
	 Gd5wzahFfoGk1A8+Ko9pRhRdYbON8YUe+l5vIqrDqJPS/IYHSP6oGEWI21GYc8Yx9u
	 ytXRuYlaK9I99EIZ4onc8CH+oKR8uLkHyeeBK5SbYz7jZ/i6BFkfgWUMnPrfTpBEtA
	 xuH7P8IbaVBkO9fEuCXgOkr3ef4JMsUArmiRZ3jz6k4Qbq4TWAp2ZYsVt1XVMHinD3
	 iMsFwYAEZNPLA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260612020113.9557-1-phucduc.bui@gmail.com>
References: <20260612020113.9557-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: meson: Use dev_err_probe() for device reset
 failures
Message-Id: <178275373770.47562.15070770755130138575.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:22:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PCbzGkWYAYYksoSIhRQjpcu2gmaaexe+mLNsnTfEwio=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6WZWIfUc4s45wZXBGe4jnhWyGlRcJ4JeGqB6
 TR7yRlefNaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlmQAKCRAk1otyXVSH
 0KBoB/9OS3c4ESlo/bqe1KuMbLzj61E4fIEf/dCQKC+rfqTLbj+FVX4llQ5hBA18hz7cTbuUaag
 728XcB6dqMy7hcndFYcP1LYA9VMNYmj2+AX9xPxPtVINKe7UY5Z0K5N7RXWK3/ZE3h7HSqUZoxA
 OVn0Kg1uJEZtQ4xywEx/qV0JSr/s4cKjPs8ANjmeqFTi/4eSFRMPHwciZwZ0laLjttXYEndWWgM
 2FlUU301soopsIdiUCPNb3C/g/08Z59sVH1FghmQoamnyOH35vN6tuVbIPlBAWoPydXSjbMO2yI
 7ilTep2elxjZcW+4awRuKh8UlrWkKckhuF2mcCy2PU/NLYFS
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

On Fri, 12 Jun 2026 09:01:12 +0700, phucduc.bui@gmail.com wrote:
> ASoC: meson: Use dev_err_probe() for device reset failures

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: meson: Use dev_err_probe() for device reset failures
      https://git.kernel.org/broonie/sound/c/6ed013a581d0

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


