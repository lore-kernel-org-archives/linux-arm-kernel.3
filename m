Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A097CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lzQUEU9rDYLoqdLxAMqC2PJcUHq11yy5ENE3mGK6Uo=; b=zldhv4ZuqkZueCYBZ5CEbQJTg1
	NvUm3ePpqpC2olgcnXRSyvfaV2Nu2mrDHiHAmBMOrL2X+G3IoZDZ1ZeWVSmMx76o02nC8sr5xXrM3
	6CfUnBax9YtYbPICLOE6sFfTEH25b+H7Vkn0jx+0A29G0t9k+7+Mq4UgykjbvpCynsIiX3K2ERjML
	EoBWBNSSWb60kSoiBSPEdpmJ3zJNigS8WitriGU2FbG3JDtnU/bMX6ln3a0TZDXouPwbg0hVHzEOo
	9i0ruYrE8UrcOvnXr/v5Kr3ZQdoC/9vO4mjaOQDJjZxf0tbXIECI4Ar3odVsJZhE37/sWhSXgQYdq
	knahojLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1r-0000000Bker-0ot4;
	Tue, 19 Aug 2025 22:42:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSIK-0000000BSh8-2DAO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 19:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0497243245;
	Tue, 19 Aug 2025 19:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C9EC4CEF1;
	Tue, 19 Aug 2025 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755632815;
	bh=buCW/ZOs+zjtU8+u7JC48cij7cEtXIqatCc1jur/KTA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kLwueoPdpn/IT5tnlDGf/QqhxLe47X03Kl8uZwmPtYyybGRL+aGdGPMhdOkWiWrcc
	 lWE5mxd8oVQ7j1UCTyFmYAbnUZAZU/MY2pQuu7jDt0GxTBK+8uvON6iPNU1IG31AVF
	 cSpjEIcrzoMp6PhMDuvfcqgu5zQpWwFq0eM88u4BGhV3tDDSLs7hSPa/0h6qzjgKzJ
	 lcjtvTQjs4xCwhfev/9FavNMlW104WNKnwnRunhgevTA1l5eu+oUYboQtoXOu6Cg4d
	 uf5/zmEYmSIVgQo2/JabDET910rfq6mTAwYLyxmC7GpjtUBsiFz5nifnTbGhYLx/C4
	 M+j114rj8jUFQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Shimrra Shai <shimrrashai@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250815042023.115485-1-shimrrashai@gmail.com>
References: <20250815042023.115485-1-shimrrashai@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: es8323: power and mixer controls cleanup and
 revision
Message-Id: <175563281428.270039.6714574776717315231.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 20:46:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_124656_589695_8BA78A0C 
X-CRM114-Status: GOOD (  13.66  )
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

On Thu, 14 Aug 2025 23:20:20 -0500, Shimrra Shai wrote:
> This is a revision of a previous patch submission of mine wherein one
> part was accepted and one part was not. It was originally phrased for
> a particular device using the ES8323 CODEC, and I was advised to make
> the mixer controls user-selectable so it was not tied to the needs of
> any specific device. This submission brings the DAC and mixer controls
> for basic audio playback on this CODEC into line with the DAPM
> infrastructure and enables their operation through the standard mixer
> interface.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: es8323: remove DAC enablement write from es8323_probe
      commit: 33bc29123d26f7caa7d11f139e153e39104afc6c
[2/3] ASoC: es8323: add proper left/right mixer controls via DAPM
      commit: 7e39ca4056d11fef6b90aedd9eeeb3e070d3ce9f
[3/3] ASoC: es8323: enable DAPM power widgets for playback DAC
      (no commit info)

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


