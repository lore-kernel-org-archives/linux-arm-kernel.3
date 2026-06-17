Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA94CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 11:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+en6VMPHt/KzGMa143NsFtwcRUN7ww53r4cKrYsgA0c=; b=MSVXwpaQw6KV8442dJaG7nscTE
	kCvIpadEAktWR1GAHPxXLmxFA2ogTSomyd/LdRtlOUTTzksoH6V84LcFBVu912GsaUrqDG1HCrZ5o
	fGT28mlZDk1vlR0zE8VhXCEj1XZhZyJatxBiobgFT+TEn6Xp+sGNxFOcTddQnVF9st31ieJ/NrxUA
	1fiFRIOakuKC3GcJY9gH5r/b/J2t2Y1Dpi0xZ2BDCqXqwiTxSlZgW31K6bnpzklNV/m3NcwpC4oXe
	CSUFddz2EiliJ5AIfemPsIWSyK2jP0yIP+/kGqRi6L25xgFa9n5fpTHqJ6m4MjKkx+odlrbkvWhuL
	EuF7kJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoOR-0000000HE99-3U4c;
	Wed, 17 Jun 2026 11:25:15 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoOO-0000000HE81-1JVZ;
	Wed, 17 Jun 2026 11:25:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1781695504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S3S+HXkc/bIBO6garwC2AsXTuouzterZycrXWitY/ZiAS98YIIViImUbabhHvUE5McQSadwy33d0vezR0IrutUcrBh7CzTrAF21PmbmOkTOMwL8k76xhYrceL9vqwoGlcvLdPWyB0tzgtgoI3z78wb7u8o7C/R8zH4J6w/nrvLY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781695504; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+en6VMPHt/KzGMa143NsFtwcRUN7ww53r4cKrYsgA0c=; 
	b=n/GBeTrGRv0tLF0xqChNVAYnLcMIhFbpJc/EBqnB7aRKBz92WwWRjVs1DLHukRY7vB36OO0X7MW8elupY0D+qqTBV5pxsk6jR6M4Zl+tQ7W6F6Txmxuh/dp9cVVLgBWYEPIPvac+Ld/IUQuOCIp2+ZfIXFajKEAnA+V6B64rAc0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781695504;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=+en6VMPHt/KzGMa143NsFtwcRUN7ww53r4cKrYsgA0c=;
	b=iy8eH+zwYcMHtnrJY3L0B4jCxc1/p2XiNbqvA62ZUtt4smf3evsz0P5W4MdDOLbS
	W9UN0HbsgSstidEU56PfqXoRGWBceMSFT6Qp4wZK3aadEKehOozZxFiQCbrtWQ06Seg
	Hq9+NNJmZfjP/IZmICbgfFmBSPoEoxgE0gl3olzc=
Received: by mx.zohomail.com with SMTPS id 1781695502861977.1206640958941;
	Wed, 17 Jun 2026 04:25:02 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
Date: Wed, 17 Jun 2026 13:24:58 +0200
Message-ID: <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
In-Reply-To: <178120760640.484538.12942087225448845771.b4-ty@b4>
References: <20260604033554.96996-1-phucduc.bui@gmail.com>
 <178120760640.484538.12942087225448845771.b4-ty@b4>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_042512_432391_DBAE1733 
X-CRM114-Status: GOOD (  23.55  )
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

On Thursday, 11 June 2026 21:53:26 Central European Summer Time Mark Brown wrote:
> On Thu, 04 Jun 2026 10:35:50 +0700, phucduc.bui@gmail.com wrote:
> > ASoC: rockchip: Use guard() for spin locks
> > 
> > From: bui duc phuc <phucduc.bui@gmail.com>
> > 
> > Hi all,
> > 
> > This series converts spinlock handling in the Rockchip sound drivers
> > to use guard() helpers.
> > The changes are code cleanup only and should have no functional impact.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2
> 
> Thanks!

FWIW, the SAI patch wasn't sent to the proper maintainer e-mail
for it which is why I didn't notice this series at all until now,
and the whole thing is pointless churn that wasn't even tested.

From a cursory glance, whatever LLM was pointed at this and decided
to make the output my problem also didn't do a good job, the scoped
indentation of rockchip_sai_runtime_suspend seems pointless because
it could've been replaced by a pm guard followed by a spinlock guard,
without an additional level of indentation, and `if (ret == 0) {` is
not kernel style.

It's not worth the revert but it sucks that I have to now set up a
new lei search for all the drivers I am supposed to receive mail for
because vibecoders can't be bothered to run get_maintainers as they
pad their CV with nonsense like this.

> 
> [1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
>       https://git.kernel.org/broonie/sound/c/4bda5af16920
> [2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
>       https://git.kernel.org/broonie/sound/c/ec22437fc41a
> [3/3] ASoC: rockchip: rockchip_sai: Use guard() for spin locks
>       https://git.kernel.org/broonie/sound/c/f7fe9f707360
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
> 
> 





