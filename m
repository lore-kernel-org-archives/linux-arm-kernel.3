Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C437CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk4RNRYvMS62z18vaIhemHM+ANvjBDvRMWUpiDe93CA=; b=WvqrnMQ9yeaBJMxxGZkaS+yHeK
	9nwfckTFwEbuMLnJc8c82jGTH0Zzv2/CfaUYxAA/+wsulrY2eGXIrgB0IJo10JQdxl0vStH1Q3IYJ
	uZ52VObhxPoKcNghjzv6PkqKpiWkwdyZfGxbua4/Wz5mYLcmdsxFo1PZmXdsUeis8w8c5Hgop+EM4
	2rIdIA3eCQOpmsYhf2LtGbHvz6GmgHQNfLg4f3blbFtQLIzVHyHxYahN5qzRoW/mcs5zmiBopRpZy
	yJOu5hahcHbkAv9LYUTFaYdJ5fC+8sDavNdlaixpGqBHORANSOC1tZx5Pdf6dDeUiMycgJd1gjv9G
	NvFy5d1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqTt-0000000HQu9-3Ebq;
	Wed, 17 Jun 2026 13:39:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqTs-0000000HQtz-1XaO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 13:39:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 261A2419BE;
	Wed, 17 Jun 2026 13:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987341F00A3A;
	Wed, 17 Jun 2026 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781703540;
	bh=Nk4RNRYvMS62z18vaIhemHM+ANvjBDvRMWUpiDe93CA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E0Z/kSG2ahd6A5FqLdBrC6cM1RnXVr0nVVGDZ7I6L3o2KTge6AC+D47k28k4S4PwY
	 FPPC94iM/Wv0O/J8m6Es3zsAP8zaqbjKonsODKrWDtPVFQzZdO9MJsFaM17RmwYJq4
	 OXkz291eiUOwDdIXpaEuMxtiSgctrbExwC2G7irgrJrfUca2FXttsHKVROWKUJSTf/
	 7CboentF3K/Yb2GOfq/OqRN/17pI75k0ESVjjkviDqdCtOAFI98jTZT1fGMB1IYqZ5
	 OGUAjLkJW7iTtR9ffPmmnXW7HP3KpTF4AvhiM0VfuxC2tdLLa6Tn5rxAje/Thne2dZ
	 evesjQ/jfBmZw==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sangyun Kim <sangyun.kim@snu.ac.kr>, Kyungwook Boo <bookyungwook@gmail.com>, 
 stable@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
In-Reply-To: <20260616011223.201357-1-hayashi.kunihiko@socionext.com>
References: <20260616011223.201357-1-hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH v2] spi: uniphier: Fix completion initialization order
 before devm_request_irq()
Message-Id: <178161143522.88054.909306501637269076.b4-ty@b4>
Date: Tue, 16 Jun 2026 13:03:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=broonie@kernel.org;
 h=from:subject:message-id; bh=woovam5mfW0X9xfFFsk7wNnmOqY3nQStfTmc/cqTOk0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqMqNx3FKmG8ivz+20LsQCbEeNkiXCrTdcSVTs3
 SNARE9v0yCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajKjcQAKCRAk1otyXVSH
 0IYzB/4sAOjuUCnSMouM98b4EBTJJQNB6ZmCvytjKAmB7W5hX6GLykMp5y34utmePIdXFkM43T7
 0E4OxizHiuijrCHXq1c+f9ZjQ8F5M4Fvlko7O5J761ti3s1yYR8T0SOymk3JRR3vFcem7rGyksF
 dh3iMM/w+jre9p4tJRQxKP1LEn7v18cZydpyS+HSErQJqbFH2R12gJQtVwY9JLHFRb7QZSnQpxR
 lWW7Mvo8zU/w/r4B20bOPrbAKi+hFlWWwy7AUbyUcTQIUPTLQjc2S0nyYyeGLiy4t+nLu8Bj00/
 KhFRPEouC7VuwyNkluGs6mYq1fZc1YSGNCEsaeLXURw1wS6/
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

On Tue, 16 Jun 2026 10:12:23 +0900, Kunihiko Hayashi wrote:
> spi: uniphier: Fix completion initialization order before devm_request_irq()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: uniphier: Fix completion initialization order before devm_request_irq()
      https://git.kernel.org/broonie/spi/c/37f18700d941

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


