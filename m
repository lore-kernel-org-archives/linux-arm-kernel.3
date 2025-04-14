Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD00EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2YzrtzksWoByah64h8ARraUHZCef7Jene9biKZAWp4=; b=D2U54aDZV5tB/0UN8OG6csnZwd
	HNQUV8W/p3VUu1RDFGsdWhKmvIYh0oGFuIlTd3tolGqk878JUafCcZIKLQQ4G5/kEDkBFXpRGkV0A
	FUuH2Q2r0xKDN1EEr843qL38u9Xi0y59y2gXR3CgaGCSI2hbvD4sXqa11690k8REKCSlpQto1kVO4
	jpf+nCr8CknzMIt2WW3UlGWL3CKMjScyRnf8TG7uSrWngvQEofP4R5IvqjCNja5RnFKM/+PSGrw4Q
	VcpsRw3e2HddntLXvXak02gG/hbDviVor9wQXrLwh2thv4kPFsrK7HtlG+Ng0uQSsQ0pmQJw14IwE
	W24vh9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KM3-00000002Gft-11Mx;
	Mon, 14 Apr 2025 14:00:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KIf-00000002Fop-3dSp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35D1EA49EB0;
	Mon, 14 Apr 2025 13:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C9CC4CEE9;
	Mon, 14 Apr 2025 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638996;
	bh=29CBNrmVgcleWs/1i5/OqniYiRJUuyIR6MeG209LKl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dB9UyK6SQsNlLJcabiwyJemljW95vqKAZb2O+9EN0pHJJD4rbL9lQ4Ohw/AfdmmgN
	 CMnJDLQwZpaoY8YuzyQKS2rY6NCLm3dkEyxdKkL87/xntcZLoFiUZ42XgjxPDc/pya
	 q4GaI+GpiTLItc6p744cWrh3e8g939GMhB9+0wPAd4vDR0/qsNfiBbMJczwiwO0E5X
	 9pu5CPEBYpATSg+mXYSodFS8TppSG98JDRpO9gGuKwERLnaRm3L/Mn0l7hkCTlaxDP
	 gIz21jKkd5wmWERLAuw/Q6muYYbq8k7vM/otixiVJRe7nJObgG5h/oiC7oEMdhvqdl
	 /8ofSeiRwUdMA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250406210854.149316-1-chenyuan0y@gmail.com>
References: <20250406210854.149316-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] ASoC: imx-card: Adjust over allocation of memory in
 imx_card_parse_of()
Message-Id: <174463899312.86688.17897930299767743328.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_065637_978891_6B55C2BA 
X-CRM114-Status: GOOD (  11.12  )
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

On Sun, 06 Apr 2025 16:08:54 -0500, Chenyuan Yang wrote:
> Incorrect types are used as sizeof() arguments in devm_kcalloc().
> It should be sizeof(dai_link_data) for link_data instead of
> sizeof(snd_soc_dai_link).
> 
> This is found by our static analysis tool.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
      commit: a9a69c3b38c89d7992fb53db4abb19104b531d32

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


