Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DD8CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mj3IWy9yn9k6Ns7HZSJ0tydFZS9MpWCoGIbgqwXwy9Y=; b=MT+B6IzVvav9M4Vq2qy1w4/n9v
	LN/4AX/KiJILabJtZYtIpbWmhrWw7r5B/h1Pt7WQHqz8+VW96afiHAr0ehXnYw8Xj55qvZKX17UgN
	T+V9CdoPRLMGHLbgobF5vXB8sdPW66DMpBkOxE5Yadwmc3rS4gFvVGrQo98epyXaETN1y5u72BoS4
	cMrXNB6rImivCAwp9q6LqsXofH82PzQ4tVEEkfX3TD+Ce+X3Q9esF39mxnave6FqEEpQamOX2n/bC
	kc6z3gTnbjnI4+A1hNOlLU7JeSYZKwk+Pr9I2NrE9zhc2rMJBFLT8RiXTyX4Za+YrijwfUgib8AL+
	5+1S5toQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27tm-00000001Ik3-0MMT;
	Fri, 26 Sep 2025 12:50:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27tj-00000001Ihi-0AqS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 12:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB9A943707;
	Fri, 26 Sep 2025 12:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824FAC4CEF4;
	Fri, 26 Sep 2025 12:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758891002;
	bh=+FntD5D+phS0YBxPxU6QJWpFdofG4rmVfhVcOMJIEYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KiakMvoMejz3dsRFw2z5k9c0tYclLKa+ETP8FAog0cK1Rlvt9MtPHWM7CzhcpgQpJ
	 WG5ZthXXSiKP/Y6djv/m3AmCBQt1mjIz/DxbkmRAqv42w9zmPwrwCUgda/dJ5C6DA0
	 R/BphdHlL9qR2L3zy24pEWTeWV7FTVKb6HqGCmk5lqfoKjuW1y4XojGG7BKNgE1LbB
	 tQY0rTpOoQLBXL5+ffSbSTwhYr3Bu+/OsstAEYsn244WUOaQotvuhC8S24ZKyALJ7a
	 AmgIQFfiW33t35ko4+ZU+ar5gfu+WZ4SqGQ5Mq4dIyGTaSEMSK79Tbot/LaoocgbTe
	 TqAVe6OG91/7A==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250916123118.84175-1-olivier.moysan@foss.st.com>
References: <20250916123118.84175-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH] ASoC: stm32: sai: manage context in set_sysclk
 callback
Message-Id: <175889100028.84679.2534810503622402862.b4-ty@kernel.org>
Date: Fri, 26 Sep 2025 13:50:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_055003_113566_796FFA83 
X-CRM114-Status: GOOD (  13.63  )
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

On Tue, 16 Sep 2025 14:31:18 +0200, Olivier Moysan wrote:
> The mclk direction now needs to be specified in endpoint node with
> "system-clock-direction-out" property. However some calls to the
> set_sysclk callback, related to CPU DAI clock, result in unbalanced
> calls to clock API.
> The set_sysclk callback in STM32 SAI driver is intended only for mclk
> management. So it is relevant to ensure that calls to set_sysclk are
> related to mclk only.
> Since the master clock is handled only at runtime, skip the calls to
> set_sysclk in the initialization phase.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: sai: manage context in set_sysclk callback
      commit: 27fa1a8b2803dfd88c39f03b0969c55f667cdc43

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


