Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A57BCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vA1rZLkXAAX0deJgLbaiD7Ggpc9NMMGcRExXvihSAhY=; b=AcBZLzO5hrR/wf8MHU4iluOLZ0
	qXB29vxVjxS4yKdrng04auvn6KrBt/DZQFOhI4sgI8tO5Q9n+gQrcRX2oLBMPYNR0NvXF+gRWVq9I
	lsP0B+cx1nMfpVd5UXOP9PyMpAs7LnaIL4sGiUWS6U4nUKMG7qrvJyC70qHpSf6gTdReQ9rwOuBXD
	l3Bu+bO4MGzQfr4TiTyWG3yjdVQYW69QnlOKdodP61kdgPg3MptGU/ybCb3yVvcR64Gxx3VcELqdA
	fIPthJAbjGjjMiu61AN5Db0FdmGrEHVHcJ9BseOgZaDPV28F8BTgV7rscfKhG8sryAgTqG0YDWNMk
	LRN6+rsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDAN-000000043z8-0v07;
	Wed, 27 May 2026 12:15:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDAI-000000043xm-1rfD;
	Wed, 27 May 2026 12:15:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05488442B6;
	Wed, 27 May 2026 12:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2471F000E9;
	Wed, 27 May 2026 12:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884113;
	bh=vA1rZLkXAAX0deJgLbaiD7Ggpc9NMMGcRExXvihSAhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R16+bl7pxvaUtXS6kBTKrtg1x7C4+06iji7wWiXYOQNX2KFsl5EGCz4rTSjCswlGI
	 iQZ+1xIVT0du9EO6mmReIUWw+aEBXeMAZfZgRjzmZfz/kG00Qw5XHy4ui4Xsj3c6kc
	 stEjZjzQJQdvYCUWBKFkzlbre4wamN/qFoDkemJFHn25RivVgBVqC2T8eWxgVv2yQW
	 fDxVU4HFWAhfsIZIxv/gvijH2BNZNuG28Zx+QIdcE1+/Si6lRStQDkr5NloCuXurVY
	 KZuAvxyBqi36fha73rLI5RQ5Z+v+UtyBUTSnsu2QRtSzuz5f1SXaJJokYHVH/83fq5
	 tt/DDYcz2dHug==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260519010413.629214-1-rosenp@gmail.com>
References: <20260519010413.629214-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt2701: allocate i2s_path with priv
Message-Id: <177987681143.868420.277392491342387583.b4-ty@b4>
Date: Wed, 27 May 2026 11:13:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GEJQ74VP+zDsUk4K7l8UoIfmlmd7AsGJBB8X3r9TPUM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFuBPQmpnL9F7Di0mzPQARB0JONWViTPk/pM10
 T9kunVwRbuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahbgTwAKCRAk1otyXVSH
 0I3gB/sEVdabjNdhlOJyFPr0tlVBlRrpxxtpUlK8B7sUt0VoRA+3jXqFSJFNT62IwLG1MCUXcCP
 +YALgMzSqE7lwLe5OeWp6OZzxtcuLumzl5d3uoMmfsDy9voNWkyVq/L+1AOivbUFgNQwZSJTD72
 eDo+ZhkIi+UWIfnu4xAJhDKarQwtKRPVTSX5h4Kwwq7ptS66MtJx9iHZqbprTKVa+QvjkcRtinN
 Oygk4gRPqPNvGn+4RibqXpRTQZDIaY2RZ9tporOkIk3+YR2yqitLI46/BtKeAZLrILpcUtAYVaT
 rz3EWsamwXn2+ORk7JHfaAid09NuLVdkOVoWocujBWAJArxN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_051515_375035_1A0D4BBA 
X-CRM114-Status: UNSURE (   9.20  )
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

On Mon, 18 May 2026 18:04:13 -0700, Rosen Penev wrote:
> ASoC: mediatek: mt2701: allocate i2s_path with priv

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mediatek: mt2701: allocate i2s_path with priv
      https://git.kernel.org/broonie/sound/c/344a4c96b292

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


