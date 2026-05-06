Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C393CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 02:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36hLJLhfFIoC/mO5S1e92RSBh3h7SwSvlPvf75ZXLq4=; b=SUuzGzOKVnXyv2GQNd/fLF2kYE
	ilCs/wnfBNQAeogwkKJmxhZrStwZT9l+mMDOLp2sTmYBFEqM79vj70YeO6Cayz3dfMmADKWroY9vH
	KGE9aYensipOBR4Icc7VICw6TdKAw3evyyKtHO4qhKlTBOS7YwD2XPBiiLQuGrr+9Vzf1TniJ/isN
	m48XPZTR+ZPQJnCwroPXjoNidYqHntOO9rumw5BO9C5o9wHFhgjZCtTcOMejSmAVH0Br/MJHydbAB
	WjzYamd7Jf0350cqgk6gDeHk3u07wdivVgg6iXR6s1Xnfw5hTigWehmL9R2PTcTzYYQxyuagbQGT0
	gJuNe5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRq8-00000000VGW-3tJ1;
	Wed, 06 May 2026 02:18:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRq6-00000000VG6-39KL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 02:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3B784018A;
	Wed,  6 May 2026 02:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AC2C2BCB4;
	Wed,  6 May 2026 02:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778033897;
	bh=/BUeKby9HrSvnC/DI73fBv/e97Hh8vv7v1odygQmeP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MGVmOFE/T0fF0JU6CFnaem6tgwBF9KnDv0wo2Agoo/U1/CfuFVs5eyN4Ks//hwFlM
	 NmjkdPkaGuo3hN6TYmPlueJHywcS8WB3Y8WgcltqMUIdCpEG3m7rGtewESHA/709uR
	 kFQGzVSIqG6iSe6tAvJ7yL1dLUI8610rZ2Q4eaawJacSrDDaalKfZo6WHC60zzO653
	 IpnsaxH5np7RHHrTYIowgBgSfZ0bKk11KqJjSMrTtq2vHOjuoKmDo+JdH5VfFdyROp
	 2ftolMn4005mneMpXFAgg1QUd7GQuh/nITeezN84ZJ/866LT8GFSV/ri6kuDCP84nJ
	 iXZy1vG1bqfjA==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20260505202426.3605262-1-arnd@kernel.org>
References: <20260505202426.3605262-1-arnd@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: arm: pxa2xx: remove platform_data
 processing
Message-Id: <177803009191.624351.5653730061827031618.b4-ty@b4>
Date: Wed, 06 May 2026 10:14:51 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/BUeKby9HrSvnC/DI73fBv/e97Hh8vv7v1odygQmeP0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+qTmflKyAsubsN/r34pV30CXazF6lWmCjlHfE
 IowXLYjs+OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafqk5gAKCRAk1otyXVSH
 0MFoB/4z65jLhEKYlogMEf8pR57loHH9Qz0yebDm/8IxYKZUUcgOI4pqSoP1doQ9M5STENh68w4
 Ir7Q1QaYHBW64ch/g6jy+S/x/GCeHLLaxEOvpleM2KmhxFTgXcT8GWTSuAildRZnh/Y4vRkjSeu
 Hcan+5vA22Fym2NcqqAlRvABAIE6CyuiVX5XGMI1HegZ+wAMtje3Im+60sfV5M9wsGEtVLFE6+m
 LgtR/L4d9WWzCYe+j7g3yn4ffUMGZUMh3ZjJPj0unsBOOm0ncd+NjuKbFtBBY6sTaTTc/CjRBgo
 rXVIh9TTbYTaBQrR0TCgufHE/+9HG7s0gBh0ktClsWUatlno
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_191818_823476_49B8D998 
X-CRM114-Status: UNSURE (   9.85  )
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

On Tue, 05 May 2026 22:24:24 +0200, Arnd Bergmann wrote:
> ASoC: arm: pxa2xx: remove platform_data processing

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: arm: pxa2xx: remove platform_data processing
      https://git.kernel.org/broonie/sound/c/087623676248
[2/3] ASoC: pxa2xx: push gpio usage into arch code
      https://git.kernel.org/broonie/sound/c/a11fbb793ab4
[3/3] ASoC: pxa: integrate sound/arm/pxa2xx into sound/soc/pxa2xx
      https://git.kernel.org/broonie/sound/c/42f67e1d1cba

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


