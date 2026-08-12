Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51836C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxPOTQvUQ8SdAxl9YphvziVdijzrPz5Nrkxzq7eIglY=; b=MrRhF8RYb3OZ1qd7udOKvj0796
	FzChfvr8/Z/QZ5JSaUAxicGKH3D2BZJHkWG7y6lSjCLnfSlvXVO95jxygn2J3S4V9fVa/KjUz6z+g
	AyK3HgUCfrHNNqnjW1GBLjFtAzmskz21EeG7xSArw5KOW6yo3b7oe2ENnm2Fpn+akO8Lqb5Xfn8pB
	Z1mTCJfgwnxhZsltHw5fEYIU1FZnOxUejzD1Pqcits9NH8HrZmRGoMr2wcQDIs1XJ/vbxgyKhab8M
	0pesd9rClvnrB6DTMhcma5X6gpsaKeORTDYtpNi3wKHacLww3d4RKLY/xwN91E+SSENuXOfRnUM9/
	YZeAiabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTtE-00000000a6Q-3YD9;
	Thu, 13 Aug 2026 11:46:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTtD-00000000a6G-0qJO;
	Thu, 13 Aug 2026 11:46:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78C5E600AF;
	Thu, 13 Aug 2026 11:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44061F000E9;
	Thu, 13 Aug 2026 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786621586;
	bh=dxPOTQvUQ8SdAxl9YphvziVdijzrPz5Nrkxzq7eIglY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XIUxrevK5+YUAKnGiI2bntQ9i7PRnnu2/24q6smvputJncnkNeKByi6xP3x3U6DTH
	 Nm7TLwHVAPHX4G2Zb+YOc64G/UEzUkc/dfxueO5EQL1jicRhGN4atUlRZjEZsa0iCo
	 kdtX0SHTr+ubXizSVSViyczg49kRERm8M/KpwE7sgj5nGtqMx7hmmwsub226otwbB/
	 QJq2+G3LKujeBeeqUunXteM+X2vCRqLoLrCFgWbzpwAe72LEgX+bVsm4rSnp/ROvzV
	 FCf34bI8+psR6gVKGSBSVzjMusKvZk1496P6gK+ZgN14AsIKO31uFB7eVSICmKWsdq
	 Vjzg4a45eAn5A==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phucduc.bui@gmail.com
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260807102932.45785-1-phucduc.bui@gmail.com>
References: <20260807102932.45785-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 1/2] spi: mtk-nor: Propagate errors from optional IRQ
 lookup
Message-Id: <178656054325.521321.2150374013382515611.b4-ty@b4>
Date: Wed, 12 Aug 2026 19:49:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cZsUhtZagyN8wmnsD1iN8+x5lKstL6WF48h3CJ0yx2Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfa6OvG3YHg+Flp59A9DgdDoUWkT/Yjg7zVMcy
 RMJbTPj772JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan2ujgAKCRAk1otyXVSH
 0HZRB/0aW3FnCVlhnC3itp1bbBtinarnEwqQqX6sm5Q/F/+uUT/IdcGbHe2k2B3d6LhHrOMq0+E
 JN5TJ0c8DPlBQp68BGgB6vACNnD9FszlcgOA0M9eOjmwLydtMcoHOuZFTkcDaZYRffqhdz5IFCq
 dBsylu+YkVI4k5K4vF+tYl+SXghZZtvt1qjaxBUUhJoMYjxHF0WqkRvrX7qH7MvHbXUdmxOSGFF
 8V9jSuV82QIzzTP2LFkfBpJqZGNiiuzOFGUM61lgmpMrlUtb/cqiUQWrGplNHiz2GMt+IElAPaR
 FKb1nJDiuv5Gh2ZS6nz5jEKzBdppugcV50N6o7PqWCvildAK
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

On Fri, 07 Aug 2026 17:29:30 +0700, phucduc.bui@gmail.com wrote:
> spi: mtk-nor: Propagate errors from optional IRQ lookup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/2] spi: mtk-nor: Propagate errors from optional IRQ lookup
      https://git.kernel.org/broonie/spi/c/356d5869bc33
[2/2] spi: mtk-nor: Propagate errors from IRQ request
      https://git.kernel.org/broonie/spi/c/560fbcf4720b

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


