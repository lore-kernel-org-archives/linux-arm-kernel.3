Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E178EFD213
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUZn0OidZs1TgTALnqd5KmUmAdGNY//FztONd+/Cl2Q=; b=LWf6IfK8X39lXav1R62czB0p1I
	eMSrdMlaHPNg+4I2DcgJrhUd6GQYcFyeOJLYMOWZgiT7bw/5nYORV+d+7KAiKGDFC+t7LL/yODQ8v
	8tpzF/xx9DqwuSRLsU2wsfzndRbMeIbRDSaNyFOj3wv9x6TYF70LS8oa3CBrNeotcNjs4PHOn0mZz
	zFl7KzGaDJ8pRmafVzC3TWM68OS+cVvg0dYNLOObB8D44s0WHzzzipazkEVkFMFA88pBifTJieTYA
	ewwV/83t2amrXsg/f7lhEy5nAwNwkH4UH/Tu6oNXjN2F6xm/gVyU1gAqLEUHyPsED5c6bTBUBz2Vs
	9EfjQFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEi-00000004llO-09Jx;
	Wed, 25 Feb 2026 19:07:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEW-00000004ljM-41su
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 19:07:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA78C4455F;
	Wed, 25 Feb 2026 19:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0529C19422;
	Wed, 25 Feb 2026 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046460;
	bh=bI+Op+k/62if1XQZhqOZn4GmEtiaxB5GHYdEO5Xw5Q8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JmxezAw+Y/L9/rljxKrYvciHY3AqhSrQtv9hHB0ln7aW/hTCVMd7cZFV8w9VmYNHV
	 h7lJvNh0xg2bACYHHbI61Izugl93tIBJMT3QBccYl4FW2Nih862mTAOSUePVDowouH
	 +/E0JMvQsBj5OPZL2MCxub0R23DsEojy4MJzOGQln+QoM4weJ3jt/frieE4scr8PPr
	 Rz0XJrydCdS0Awyx2yScST0yee1HcjaC1h9zm4DaR5i1Jdye3B8S5mBGTP62UIMjGS
	 HsoEDzPVtnx6E7Jb3gUYAMJwxzWXYptVkV7Ej+H/Ir/mLq7/SgK2fQ+B2ttc/0ygMQ
	 wtP20oaAeUEtw==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260213-upstream_ospi_remove_exec_op_debug_log-v1-1-164f17515fd0@foss.st.com>
References: <20260213-upstream_ospi_remove_exec_op_debug_log-v1-1-164f17515fd0@foss.st.com>
Subject: Re: [PATCH] spi: stm32-ospi: Remove exec_op() callback debug log
Message-Id: <177204645867.169139.10618667712861229552.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:07:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_110741_023896_0ED113B5 
X-CRM114-Status: GOOD (  11.11  )
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

On Fri, 13 Feb 2026 09:19:11 +0100, Patrice Chotard wrote:
> Since commit ad4488845193 ("spi: spi-mem: Introduce a default ->exec_op()
> debug log") a common debug log is available in spi-mem, so remove the one
> from spi-stm32-ospi driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Remove exec_op() callback debug log
      commit: 52531750d39b94803e089dda95e43925730c03bd

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


