Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECE5CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuziP2JOer6sMsU78bDMtbiQ3kFSHJ3cTtSaeLZndoQ=; b=awWLpmKD8rPz49zwxVZaK4L0yW
	7dhi2Rom9bH6Ln/BGGk3UI1CJIgr39MhNel+z76kXs7+wS3dJYALHr9G6MBJr/5jnuHBKvZ81mX7e
	sdhl/Uox05v0AIdU/RdSG3/NsSJXirE5Y+G1s9HW6laQrW7akzeKMkHfw1SNmDBVilGn6Vl7l/i4p
	5y4ne61SOhL3TmyHHNTuiqDq2jVHtDtpuH09/H+yzc0HoG4pcW9NrMNYuW84sO/ajiPZocNSowRh2
	oU2U0XG9qcKqf7OyxIQtYJdIPlU0NPgbnBRb9a9HchPsIC7AwbhvZG+liUxW4ewILfY32NeBiP5O3
	BduyKYTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPLP-0000000DRtN-2pga;
	Mon, 11 May 2026 12:02:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPLP-0000000DRt6-0Eto;
	Mon, 11 May 2026 12:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xuziP2JOer6sMsU78bDMtbiQ3kFSHJ3cTtSaeLZndoQ=; b=VxDhwgdzwCN8LPfHCNko7RLkWk
	kPIAwgcWKUFz8UHOjqicW4b0N9dmST+Ohyj4WCv583vihO/bxpKiM4PWm6EFRZKrvgA7QGfDwOmol
	6wiy060xyOEXOuAD2z4lJURC6Zcf4W0W98i6N4eKvjmdZs4H8QjnCc+O6YVyd9XHrsSq4pdLJ4ozj
	xPA8jHw+aPibEJctwYSu4CBNRnIn846YiUUsgyTzkHTefeFsCC/9JDIq60fSNcbHZwnYMT29R9GkC
	mB8jpUWtrEQ2FUQDjKC4sJiiXkxdMkfUa9CSfmKBjsmhU7wmPQdwaZPf4+I1LXsH3pq7Se0b4uAf9
	a20N/kCA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPLK-0000000BYjq-3dMH;
	Mon, 11 May 2026 12:02:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0ACA43231;
	Mon, 11 May 2026 12:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5470C2BCC9;
	Mon, 11 May 2026 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500954;
	bh=pZJkZbNMWuYB15AGPaBjM3k6a1sz9Bd5UejwtZhb6ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JEwReGmhxpqf6HDQRgFFNB5nq9yOJCVYhGlkmSDcEYS+OMs+T/6815hNcFTruppbm
	 Vg7zhaBqwNBIhIj+WmRy1AY/cucWaLpvSd5M/1G6y3gT3bKtLGZxpE14+PMvzH4Ex7
	 sIruH+bHOmbhSAfHoPw2YOthRUTc7+tYLfii7FdHfR/3tH0t5Fn0/oeTbNq9uWouhi
	 XhwrqPbu1nB5cGg2EhFY0V+KcBfyXVhQFhAh+IUkEFb3R6OmTGijw6o/51qJ6OsRE7
	 1oh4eh+CUPdnYxFk+FErqpwMWHw2tNo8y11FSf15DYvdwRjEB4cvcrbLJIlTn8xvh3
	 5yHVAv9vKuqDA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Koro Chen <koro.chen@mediatek.com>, 
 Khushal Chitturi <khushalchitturi@gmail.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260508182438.1757394-1-robh@kernel.org>
References: <20260508182438.1757394-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix
 mediatek,audio-codec constraints
Message-Id: <177845931313.986162.9763116539859860272.b4-ty@b4>
Date: Mon, 11 May 2026 09:28:33 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pZJkZbNMWuYB15AGPaBjM3k6a1sz9Bd5UejwtZhb6ew=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAcVWJI8vRFzFPLcZrIWWYdMOiEminb0Csii3j
 XUrPgL/QpSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHFVgAKCRAk1otyXVSH
 0Id2B/9kPH6WFHX0ONVLwiRtWJrub0jsomL+jc1hu1AhMnPLLzpNzW7b3sujof0AACRgmYYnJxU
 Qpt+6KfOODojZgJzPZ3LAdYA9oVSmnyOFbrkgV55zhDDOzH/39//f8HJkGovJLA2WEP1AcCLQ72
 hN6puascRiRwbXkaps3Szpr1T/Rj0UBH6YI0gmPqBZCGjcnOz4P83Egm4g+vt2e0vdjMKWvzStv
 huP0JdoA30zP7GNqujWmDw0ubKCgRwPdQNzfx+obEKC7u0v5uCI99T/0m0s7cm6VmTxE/apCERp
 nBVspPnZxzvJdx8qIZqELYKTfG/+/Rqh++hADPECM7S4H1bQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_130239_597818_40FF0EC3 
X-CRM114-Status: UNSURE (   8.49  )
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

On Fri, 08 May 2026 13:24:37 -0500, Rob Herring (Arm) wrote:
> ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix mediatek,audio-codec constraints

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix mediatek,audio-codec constraints
      https://git.kernel.org/broonie/sound/c/cb196d50a78d

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


