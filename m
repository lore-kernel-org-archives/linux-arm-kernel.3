Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CDDFF5126
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIZAz1zHhWnZ65ua/famU76XlQvF+S+xrQZ5o0nHZak=; b=4pP1eKA5N1ZsowhS8pgtNSA1BX
	Ddprh9B5D9uMvBiFYh03VjkaL1hUC3Qllha4+rB7rY2nFiMNvwqcD/ews1oOVDXGXV6pbNLEfd8v4
	kwWG37Gm84znYyyP+sB9wlEChNb1ViHgEIO3q8b6nZ6aRcdR/5YU2iZ0HjpOI+06OM1+0Fd6yoXuE
	mPBU+LRXRIkeo+Ku+EdXa37gcDnUcA2xjhiGu/IzPYjOA8oNTHqFjelrdHYlUyLlw/Ahk5WorftIO
	eT058wHvF46LxBMqSfAteQ9Gy44I0G/6NGESAcswReG4hUQh5mP9f0gUNez1zFwXpYPDBylv7JQ+r
	X0VqIUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Xb-00000006oKF-0MUe;
	Tue, 07 Apr 2026 16:44:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9XZ-00000006oJk-039a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:44:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20E4860138;
	Tue,  7 Apr 2026 16:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AFAC2BCB0;
	Tue,  7 Apr 2026 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580275;
	bh=rvbmC5Dq0KsEWmx370qkfW8e7Z3N1wyWFn+3g7ufGZk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dzS8BC8/CdESd3Vtch5bsGUBJNVW1IX8BrmHk2YfrlrF7AdQDJlmKDi05hj8F5/CD
	 ivopLuURB7ojhUuPQ5aUS6Ym1t5q2aA9uHigHgUwLRcqbwC74gZpmYuv+RfuunsYOv
	 Z6B9PBLX9Jt8ykQUS2R8OgHXWsmjWPYYKOKlHAQn77NkdHOM2uVe6PyvhD0USi2j4v
	 /SBBjQ9oL+n1Bzr4wQ8FzGN8u+kaBXE44EmZsCNsS2JDhZDz+Gom9LjGJIoCfj6j9b
	 K/4COi82rL+WI548MqipnzAzUOnXG0arHESyDO2rHW7o0rSBXJ1n7xb75ivkodqPNg
	 JKXSo/7LCB3/A==
From: Mark Brown <broonie@kernel.org>
To: michal.simek@amd.com, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <24043625f89376da36feca2408f990a85be7ab36.1775555500.git.xiaopei01@kylinos.cn>
References: <24043625f89376da36feca2408f990a85be7ab36.1775555500.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH V2] spi: zynq-qspi: Simplify clock handling with
 devm_clk_get_enabled()
Message-Id: <177556281347.37897.18439480858338017890.b4-ty@b4>
Date: Tue, 07 Apr 2026 12:53:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7a3e7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rvbmC5Dq0KsEWmx370qkfW8e7Z3N1wyWFn+3g7ufGZk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1TRxgPqarP6cSnt75tqI3UUZpaqEHJWqvD7LE
 bLc6LWvtPKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadU0cQAKCRAk1otyXVSH
 0Fu0B/4uuq/VG6k7xLQE6dCJ4Vsxa2ziOs7jm4QgiKN6qgBPGEtUVmOwvCeKuj4Jh5jdrbgNvvQ
 7ryVjY3swUL5lHH5gQH5dxRMbjXkKHupHN/uYfDO4bCTmEbYiI2gM3DhNiV8uRKmarvijGAnjTp
 uRYlLCwQXf2onEpMjHSDPkWFLEfrf37PvkV+T/dPstX4Misde30Lri67Kpug5QoSFpOQDgkINSw
 pHXQfEOrFD5+IMc/0pPJKSeRSklrrVd4NN0UhQSzhyXsRD4bVej157xiH9PCg5W7oaGma3z1o5+
 1v46Ya4JJ4Y+y55JBjDMSdXTTTg+oR5x6dCPUT8jUkED0+QQ
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

On Tue, 07 Apr 2026 17:55:08 +0800, Pei Xiao wrote:
> spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()
      https://git.kernel.org/broonie/spi/c/1f8fd9490e31

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


