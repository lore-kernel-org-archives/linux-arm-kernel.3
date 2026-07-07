Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88D5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuCSxHa1At+QgzfRgx+BbzkdkmhcQ4EdhujqbrLxvD8=; b=CncDFC0b15XlcLQnvp6Z/R6Ymp
	//FJAStE5p4ujhsfWxVl6Svgzl1NN1c26wE8knkQqnmgxEfJ2tmcPS0mYMsaWqFslar//OQkeSCp3
	AicU2zOZtVoTBYpFvrtpOE8T5/NUoOOylVAFB9mnycMSdxy7+XN+uDECrPO8FiwqA40ecwi4UXtDn
	7uLdoy7tw/se0z4vweTYPcaW2HU9mQn17umAOJwupu4j8onc5A2ZqEJOfxZ4CdShpgAgTOv6owSbF
	3UcrYuxrZBMoHk7POkayVBPvPM/nJLQgkdWmVSQnSKWhzTHjZrfSPQ+lFVll3Xw3gV61ZkvxYDskM
	IIsDmtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRr-0000000GtGY-2TAo;
	Wed, 08 Jul 2026 10:24:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRm-0000000Gt8T-3OfS;
	Wed, 08 Jul 2026 10:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B8D76001A;
	Wed,  8 Jul 2026 10:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712E81F00A3E;
	Wed,  8 Jul 2026 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783506245;
	bh=vuCSxHa1At+QgzfRgx+BbzkdkmhcQ4EdhujqbrLxvD8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=RfGcsYA0KGSWVDJs1jsSabMER5kAoEnOO5xC0zguBP/cy7sS84tT8RYjzBiJANTXU
	 bsc6Hdbge4Vcc0ALVflGb5o+iTscPZB4IwezVKJyjBmC/P6Asurcf2GB8TeU+aax/T
	 6rrBBVy82sT4mDLkc7hnHzJ1a4B7aSasg2H1eJm7TOG4tirN1ajRSwX+EGA630Foml
	 EdWu1rWHb+B0oB0oPq60pBvw/Fy3IOWTes/vLB/vg1it9l4sbwMann5nKAxuXDZKRq
	 yVgTfwmdDOOdsXJkyTcAeV6eReLfe/1ikaWvHgmDlIvU3p3n2usO+srvcDvB/vNZgG
	 JlJBVBdl/Iagw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20260627131205.808800-1-christianshewitt@gmail.com>
References: <20260627131205.808800-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v3] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
Message-Id: <178346181742.59892.268433799792048695.b4-ty@b4>
Date: Tue, 07 Jul 2026 23:03:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MI3jtk9klnI5yCR57kbrCOpbjPiC8juEcsPCprxV7h4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTiVC0pVsqqQp1/ULwRgYdG0h1kBBdAIYyRVyl
 ScDbbBmspyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak4lQgAKCRAk1otyXVSH
 0AELB/9bTW8u6smaJE9CXni5aJB+cT6SOwnwGbvMbRs4FcNpZQjUEzUs2Mij+lbJeTIbpLgUHn4
 5Pjwz18uy0yMpj0BNbl6QxF+mvvtgZLXwsReiw5IvYhtWbBkQX6GOLNKrp2BGFPGTZe/rMjXN05
 REYhLZ24gpTGoUK0RzXyJocrkKSQqQSv+O5vA5jRRhNvdKW8LqfLxCCPPtMxfXR/kV2b6GXxiJ8
 5t3DQGnZcx6OAKfOJGE2NBOsHUlObyFX32DkYZvd8+2pfszMLqZEbrbnxkl1oW9PLvg6XYqOo4d
 wvvrtOcvO6DrybZxMJRmV+v2JsvSwWRb5tnpZ525TCxXy++4
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

On Sat, 27 Jun 2026 13:12:05 +0000, Christian Hewitt wrote:
> ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
      https://git.kernel.org/broonie/sound/c/6b59c53c8adc

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


