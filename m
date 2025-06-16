Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B440CC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ps2qTfu6k2Hjx/RdcIzRyojziV8Mulfb7wsa6y52pkQ=; b=NWlHHFfL58t9xOg4GFjTrPOrgm
	evRNuTEO+S0AqPHyW7WsRvGQV+v+E97DQw0+0Gd3THjUMjoMNcQ5QD4/1wbvSFHWsfwOTexs2fxve
	7HpuoUg8QGz4R0crwhhSHmOjUG5MtUPdK8x/JWRtKzVDB8ocBY86DhKBE40CnCfpht4eLHTQNhAKK
	SEHV/7YY5h2BVQfCEky1h0ga/dIhXG1sLFveuz4jd25VpGyZjvCnRJ8hNbBZOe5ErvgwhyIKQ8YM9
	AQltSqDXiacXVwrb2cBmJgy0/98I6/AzFGkW0hSsyRjMGaPsadSi3NuSZndiPDAG5Yay5BwLzHQcG
	ZQiFgvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREa0-00000005Ddi-1paK;
	Mon, 16 Jun 2025 18:29:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRC6k-00000004vxK-17q8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DE145C57A6;
	Mon, 16 Jun 2025 15:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06D7C4CEED;
	Mon, 16 Jun 2025 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750089048;
	bh=ZvyxT+BLHx5DS2IcO1NmOuiRk2nhSfoLDrUKrw0sJe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jVqfnmM4ALR/uTwNxSGtcmpMOVWFdjt5LUfVJpp7JZYIr0QuNZfLz73BQqbEy1t3S
	 IrlhJI7Xhl3chkELWQyR/m8TizEKWCE2ytTm1Ji9FLDupIZz9hv3ONjur2qAi2yXrh
	 ZgIzoHZAuLCWRoitic7YQaXFz50W/AFd/r3tnR61OLPj69/cv7kAtoutAMdn+Vx18U
	 rqFlMi2Rm9yBPEWzfIlKY9ozQ5V3YrBErnoiM1KXQZ2HyBw7VfiPT28uh8DwLMyj4t
	 +BU7G3N39Z83aF3WLRRgED1QHlNbvZrIhtW5+6wKuOBRgKdARHFfbIaKfS18GnUHLB
	 71ceJxjs5NWsg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
References: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: add core shutdown operation for
 imx8/imx8x
Message-Id: <175008904672.262284.1831269930819653048.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 16:50:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_085050_370290_AFA85F09 
X-CRM114-Status: GOOD (  15.25  )
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

On Fri, 13 Jun 2025 15:43:10 -0400, Laurentiu Mihalcea wrote:
> Currently, the DSP core from i.MX8QM/i.MX8QXP is able to operate while the
> firmware image is being loaded. Because of this, the DSP may change the
> content of the firmware data just after it was loaded, thus leading to the
> data having unexpected values when the DSP is reset (via run()).
> 
> Fix this by implementing the core_shutdown() operation that will put the
> DSP in stall during suspend(). The stall will be removed during the run()
> opertion, thus guaranteeing that the DSP core will not be able to run
> while the firmware image is being loaded.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x
      commit: b081d8564e4a396843a78788476fdcbf70efed06

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


