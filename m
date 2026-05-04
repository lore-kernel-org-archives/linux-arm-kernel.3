Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F66CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 01:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zYBg2lDiaF1G67LDAD6Emj01U5Ig3UCdwg2Lp09JT8=; b=VvsHS2YhSzKvJdF9CcLoN74jRJ
	SyiwcOcWku9+NU5v3km09JkUsvm4xCr8jyv7P1BmsN5fZ32mXO3ZKBarf6YokviMZK3SRxbuedvrh
	yS7HCgDPoUo3MqQD5TcLMrcslfZvNHwFYmuK2N1rGJwQCKdr+AqQ6y53B8+5CMLLRc3SmcFFXXABn
	U/Q48vbceRq/vsgUS6MIMk5DYYKyXtRnAtRG7PwUdHAR74knD1LoDW4JCwbLuHqeObjDjuVv7uMsx
	fVG0KckovV//+aCDGHCLKfEoptAZQGlB+432fprQ2SANnFpDJ+isbgS2/4dfr0HY9Aa4j+6fo0GKW
	HjlsqLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4Hh-0000000EmfI-1jFI;
	Tue, 05 May 2026 01:09:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4He-0000000Eme6-1yUZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 01:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 205EF40678;
	Tue,  5 May 2026 01:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E9EC2BCB8;
	Tue,  5 May 2026 01:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943350;
	bh=ds3Ce7Oe3L8UU+n+eYT7vTri75RQ9yXKIfx+enHu90Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eZ/usPgCIhYMOmJFAeWOm91+ZHm3IekkhGvgP9I3XR81x0tcfyyKLSZYvTd8C6xZ4
	 14XLuOqsnR2RtJopbRKrFEooaFZrtmPw0l2DLNGO65h58/Uz6+ULljg9u3auwVyeZC
	 6poAKWNfrWTwzpRUV1aV2HHdwfvV9efdxJIQ/M7FyMd9m/65VQxv8+6GSV+gs7t/kG
	 k1eSgn9LN0NKLSrX8AbNYfKppkYsC3FucR7qbgwwmk+oJ+4nIZewnyFbRADPHiMgRt
	 DFis5VVx26M6pCRLqO80LXXZD/3i6smKNPCSMyAcdCfhD6odGpvNJveWsP5alXOLGQ
	 rA6NTOSpKPu0A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Joris Verhaegen <verhaegen@google.com>, 
 Miller Liang <millerliang@google.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260429091614.96667-1-phucduc.bui@gmail.com>
References: <20260429091614.96667-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: uniphier: Use guard() for spin locks
Message-Id: <177790010949.458539.14090210071637590758.b4-ty@b4>
Date: Mon, 04 May 2026 22:08:29 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ds3Ce7Oe3L8UU+n+eYT7vTri75RQ9yXKIfx+enHu90Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UMy4/Q6Dst9XziZJJ9bC2fFI+Tdppt0Jy+u8
 UWwoJYfR0iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDMgAKCRAk1otyXVSH
 0P54CACEJci5K5sFZdJRf2eWX+5x9OAmFtt/36l3P/5N62K/ZKUBsvnLeTSWkLec9XFjOXC/jHc
 jafiPNchHsS3kx97cQFkh90p3eCeiiEErw5y8AnOQviT9i+HXYKOA3I7tIzrxYceA8i4B9Cm3gX
 oNJI6fF/hy5yT756VESpbNVYed1nm4SxPRGPgmdnFPRo0toNFlJfUI5Zbqr9oHBhNdyNKPErL9g
 v21uO8943jemNtlhKAWERd4yS3beTgvMF3Udj1zkXHW+i3WfavGJjqiGm8YqWpsdND0nNN8ADYb
 5m8nzPSL5T7ErXkcGSrhVmQ0jZEG8C5WTJbHsCN9rFBvr9ts
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_180910_537541_C0CE138D 
X-CRM114-Status: GOOD (  12.99  )
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

On Wed, 29 Apr 2026 16:16:12 +0700, phucduc.bui@gmail.com wrote:
> ASoC: uniphier: Use guard() for spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts spin lock handling in UniPhier AIO drivers
> to use guard() helpers.
> The changes are purely code cleanups with no functional impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: uniphier: aio-compress: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/55f8c382858d
[2/2] ASoC: uniphier: aio-dma: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/8f7e9d3c0cca

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


