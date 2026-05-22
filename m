Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F068BCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySlfzbET71+o57AlLLgDovA0KAs9eNpZmvNfNdCu2To=; b=Us6yO0kwMyACiXSnaiWDuyrU5p
	OjIW7Vc3LXXB7Po8mAXtZbhuP7bTiroOLdynMPAn+Al2gKdkJDlsF1HxyLqAhFHtARMmbUUxkJKXU
	JCnUZNeegk4oDXhlRm/jmTSnZskTDe7hz5DIkh3yb0LdclLDuZ6TaWgHZ63lWCJJQUhaf+KfC2mhB
	pmoCSKf9W4xFaEYqHMqmhcA3d4flc6eu21QkaDaI0fYkt3RwafQbJaBe1sxs8ldclTKPwGrYN8OVO
	mSOyR0lCGm4O4iapma3UMVZjpQKp+yA6O+mfbSA1RBGdFG/2ZlJYERMQTcHNUNtjM3gxQkvkI5XP5
	u1bl9zmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTui-0000000Badq-0OEy;
	Fri, 22 May 2026 17:44:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTuf-0000000BadP-3kVG;
	Fri, 22 May 2026 17:43:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 109E643874;
	Fri, 22 May 2026 17:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49FA1F000E9;
	Fri, 22 May 2026 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779471836;
	bh=ySlfzbET71+o57AlLLgDovA0KAs9eNpZmvNfNdCu2To=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SUQjzqxLodwVv6RsVftw0JWcAkQQx8WM+k4K7y/ZxF/niGQniMBS9LM/OeiYezrLp
	 ztbrAA8tG2Guq+oVRlMCa+HVcj67FqasJSYzRqHTisuKnOXXIUlQaqERQdGQxsZyLo
	 TLKOjYeXMqMfDvx1yqxUauzj4ulmCWn7lu1X0KbSqMhDEhSq92/1Tc1uNohSixYw6U
	 vZuTcGaN7T7LE/yMubgbGY3dhgwD3oi7iosonXBs6cLykUGdnbufKurMJsvacZl/sh
	 AL9KIxVLMqVKHM9hXhjmgr6opK4xoCnLPVffMe3Ih0zAIb6jCREC6zXkbJTS7MXi+F
	 n2rCnJ49la6ug==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260514-asoc-mt8189-probe-cleanup-v1-1-ded733363281@gmail.com>
References: <20260514-asoc-mt8189-probe-cleanup-v1-1-ded733363281@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8189: Fix probe resource cleanup
Message-Id: <177945304031.6494.16316071935569067242.b4-ty@b4>
Date: Fri, 22 May 2026 13:30:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=G977wFYZeJL9dO4L5j8WuYlyScxupqnnDsErYn4S5fo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJXZM99O+JagCIvgfofBdj+0iZOBzv3TpvVtX
 hejW1q7mWiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCV2QAKCRAk1otyXVSH
 0NWaB/4hlQtZDLSmrPFVXvyMx3wwK6bZBuXMBcC5yPQt1BwAAn1YcO/2a/CMfeETmmA6VJ4fvG/
 9FzEuSxYmEg7g1th+zFi52ErCj3a5ozkXpAlqpML8ZeFbSEPN7+KmknAMjNfPYkzm+KqcD8qo4v
 wV9H5YKhEnmwJK+YcOKORUNF5dUjEIvmqxQ8SYo9R2WlQJmr7r2t03eWxENVbGpxxWgy8bKTk9b
 CIe+DUKb0ZCDXUTKEYzMoyBwGvtttCbahvtd/Q8LSbXFgnt4Tapsu9G8zrvN/3+/+F/4+/NcZ5d
 Yi7NipucE2iEKyvpienFGjRsbHbuTJuF5oodbBs39g7x3QU3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_104357_954918_25A76381 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

On Thu, 14 May 2026 10:52:35 -0300, Cássio Gabriel wrote:
> ASoC: mediatek: mt8189: Fix probe resource cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mediatek: mt8189: Fix probe resource cleanup
      https://git.kernel.org/broonie/sound/c/5404599c3292

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


