Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088A8F30296
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUZxQdlse7ZnudeuOB1/4Qy/fMwIOGqwT/0WSP3RQmM=; b=wX1NGT9enohfUYN5pDm/ACrOeH
	LkGxFvzQE+0nor+C3QAoY48c6QUg6Jh9Wv1KzckQC68NAeH+2S6TScqJ+PHiL7ugIviQSBNooY4nF
	K82A68Jru6M5w5FIB9jlrq56zlXwZy4+IUAAmZnix6ZJgoFPQ4Q415YmVr98MUd9s9nZ0EVnhq9YG
	tSxzifHDrzAGh/WbRCD/0Z3h5FTaCFecR4n1dUt9Wn86PzwvB9kBCViAO3zA7Uyp8E3xXtzyEfUWM
	XwjT9gvJcG3od4tqCJIW+97XnBlg8R4TSskHO+yr6kDyj/P3UVNBJDbuoLYPtA76XI9Vp0pSu0QRc
	gAnJxdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wvy-000000037Yy-30pU;
	Mon, 16 Mar 2026 01:39:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wuH-000000036QS-070T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7DBE415B7;
	Mon, 16 Mar 2026 01:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A9DC2BCFC;
	Mon, 16 Mar 2026 01:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625088;
	bh=QaMYSj2E3J2MiJ1HFej1CfGH/Zo9YEH4AIY/2x7kc6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DaP/7Yn1Lyyz84iHMAPsxm/qSwP0EfH5+hC/rFbj1O6Ev4WzdOuclEkfIwWiZHhTg
	 tgvrFZa7gd9d/fvfPZMCFIQoNCSBKJldwauUy57+flwzijOaH+QGe54uEh9RVOu85d
	 k8tjMd831JDHXr5Yzlk2lB/j+rCV/aiejgVUHhW0sGHaiAy5pwbfN+StUo/BVinC4E
	 Yt8j5eLKP7LPw0Be1ayiFjFO54ohdwbgYI6EjR/mNiCmQDnYI6+OxSBR6ex/9vGBdZ
	 OdS18Hxgddn9LTBu5Zk0ha+r73sF+OOfiPvM7fJvLBHPq7e5CniOScmN/lYr0qU+yd
	 7bZoEcSghSKkA==
From: Mark Brown <broonie@kernel.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Harshit Shah <hshah@axiado.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260307-axiado-1-v1-1-e90aa1b6dd9b@gmail.com>
References: <20260307-axiado-1-v1-1-e90aa1b6dd9b@gmail.com>
Subject: Re: [PATCH] spi: axiado: Remove redundant
 pm_runtime_mark_last_busy() call
Message-Id: <177352554001.149922.7199933321657961901.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:59:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QaMYSj2E3J2MiJ1HFej1CfGH/Zo9YEH4AIY/2x7kc6k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt179BQywpjfiFhRqfaWhbs29/PtRQgdd1Wt8j
 J9Xu/QMqReJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabde/QAKCRAk1otyXVSH
 0ARIB/4tfl1/Rpme4nsvh6yVGFj6HPUurTbgCCS3NwoEpjAnw+kMZaLmJ7CJa+GORxoQH4RfnrQ
 o5ZcP0nSOgwZpu/RqedRj3rspEm51Tnn7mv7H//pfpPKWRTW6/drWm77RlMR1jXnn+GIparOhzs
 A9qv+HxE8CLXfDgOEXhpOVIuPZLi6icMxNdp2ytbyM1twmtxDIGfP0Hd+prHplOwvBg8lQDKpVK
 bliTcyk02eyy40cLJr23voQBH+zTR/AzxhaTjwi9PYM9baI0TEfW1YF+ZvbaWcWVoajoLpWFiM8
 DCyRagtOi9edpYBArTGuAXtKZSEFqCAwjo7qZT4y6geOr6mP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_183811_663387_CEA48C59 
X-CRM114-Status: UNSURE (   8.41  )
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

On Sat, 07 Mar 2026 15:47:15 +0800, Felix Gu wrote:
> spi: axiado: Remove redundant pm_runtime_mark_last_busy() call

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: axiado: Remove redundant pm_runtime_mark_last_busy() call
      https://git.kernel.org/broonie/misc/c/ec6c2e15a42f

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


