Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9545CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LublA5m8L0ECAu5v1inIdq7Wb51vJ+0WnvUklAmVIwY=; b=mb5pFAjrbVDzJXsOEnUrlAeb5X
	PCW8q0brlkh2SwFQKPlBk86dEKUx7cKCGaXGa8XUpv6MxmvpnXvVymIrW3MYRgS2t24c9B7kEzhna
	DEfpcrN62efoKEFaZHFSutcfs29qyFTcc0wS2q4B5Y1NDSQNIhhpWdHV/H2s/GRp2JG/e0vMbYEh4
	r/S6lLgMAQvotP9QfCUs04d9eDC0mQUAlILcr4ZfBslQ/nOu0QoCbPxSE+m2tjgVhBYVe5LJBZRqS
	F7EptEXyeUlRZK1ZuPyapFQgewHdSmwg9s7K5wsdX3CgsLmgYnWf8IN+Yg1JB7eD5AWwc06Ak6l4F
	QqARLwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYACf-0000000BeTR-3VX0;
	Fri, 12 Jun 2026 22:18:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYACe-0000000BeSp-2w6m;
	Fri, 12 Jun 2026 22:18:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0CD660008;
	Fri, 12 Jun 2026 22:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8DF91F000E9;
	Fri, 12 Jun 2026 22:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302695;
	bh=LublA5m8L0ECAu5v1inIdq7Wb51vJ+0WnvUklAmVIwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SEW8gy5kzptJ6FfwoG/uEHkyhm8byEbGv2knBXdU6s7AtU+mphGH8Jlw4afKDc9lV
	 oQoZrn3oyyebcuiBhkDKl6wip1HwsqtyQZkkwyl4ALcDJlrsVggQLwNTwNoXqaO946
	 3mU89rEiaO1EZzfkLHWEWK3H3xZNNmH4KLrH01dUfkcnE/m7URxyZtYk433HxBILMu
	 YYTnn991QMJ5cnL0aiFJbrSBfeKFgolKUg+jLFa0RieLo+OWNtFyZrHV00M+477EV+
	 IUy8fh5FJsBaEHKliUxYmYsQyWeWsp4xQSEPML51R0JYibtd3kWY4JgAig+rpTXbPv
	 w31NGef9eZ4wA==
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260604033554.96996-1-phucduc.bui@gmail.com>
References: <20260604033554.96996-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
Message-Id: <178120760640.484538.12942087225448845771.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:53:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eLLqyyzlR9O2dl1hsMPFaCwDe7/QI75ntAWWosN3Z2E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIWiA66+2oeUDkW0OhWNEvZsPCVwlkfI7K4zH
 Z4CWgFIV6OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFogAKCRAk1otyXVSH
 0GSrB/993BOW96HEqX3W1yJPPotpSEttq1S7fRjmO8SUultTqu3jhFKmIolw4ycIecMUkZGzmgE
 J8RLRBjQi/fvg7gn/CKn0tesHn+38opI+LuQs6KaNNEElYW6Qkgfnx60TeAQQVkods3e9goirG3
 x7eqQ53atvcjGhdVV7E4G3TX4sFMZiMR80/yWzkVps5MLMlKrJo3GEszSmHvGDqcGohowkYGJxF
 7MI+6vjKhxMStjKll8fWJQ3/E2oza6sMNDW/6iycy1HvNM0aI4lDtqMXG+5zMmx49XLz8RrE3Uu
 rq9tYcwXlWc4trp7IehhVB940uuSH7cVGrCV/7SjDLfi+s8I
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

On Thu, 04 Jun 2026 10:35:50 +0700, phucduc.bui@gmail.com wrote:
> ASoC: rockchip: Use guard() for spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts spinlock handling in the Rockchip sound drivers
> to use guard() helpers.
> The changes are code cleanup only and should have no functional impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/4bda5af16920
[2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/ec22437fc41a
[3/3] ASoC: rockchip: rockchip_sai: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/f7fe9f707360

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


