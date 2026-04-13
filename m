Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E5FF9D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccaafYwJCLGA/oRUZdY1GOyw4cwIg8rPJDZ87GrOa2k=; b=PJp6qhLxKYlTOKeidZHdvaTBRW
	ZUlsrG6kxpSaWz4+04wFv5iGWcCJRk+JQ3VZ/5fq8qtQzrVXzPDD7IEiFO8fVE7OOnFPi7kjHk6tR
	lH57XebvdL4zgKTJcAR5iAidl7ywceEJAl+t50uriKfQJGJDWIoKALAJTXM0b80e4ZrKqdnvUYGrc
	/2L18rOjr164X/iTtn8u1d8BL+aA8WyUcVdaHIXOEydxOatiRgmCO3WTUkPdtj7QS2m2+eG3vjiGr
	+sF6Snmdr6sNuSUWb38r+1QgI/NClNxsTpWfeiCSenSq31Iob6c1VqPqVu7A2Tt4eF8o8JyuNYG3q
	w0B4guoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgcs-000000000np-0rT9;
	Tue, 14 Apr 2026 16:28:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgcr-000000000nh-14iY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 460C960126;
	Tue, 14 Apr 2026 16:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD7AC2BCB5;
	Tue, 14 Apr 2026 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776184112;
	bh=V39/1btDjdN7e2y8LscmUX4ZzmoyzNnPY1iu5oCTcZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XxhigXBGR4haixhCigfadFr/eK5rG1Or+BrTf1GrNFDBuNAVW1aIGjd/qQuKu07FZ
	 by4i6+b6OyN0IS3aMkdousOJ9cCvC0Gy8/HY3fk0dK9HxDG7TNeaEtlyJA4Z/I41n6
	 DUek/UjN3bDoZAhZrepCFiHg73XYWtqUuCofK4+g4uJRV2T4DFhZQCYTwE9pBDyWwm
	 RM0tZbUstYza5ZJmSPgM8jpgvRWnw3ue0eDVuVKMGpuvcT19Jpa6VcJe+wiy6WFTw4
	 /IW7w8yVEGhvXnSGZZXkvvZeRc4r65JNUXyYiGCZvi/NQoBOsCz4+bRKYnm1mBAwRL
	 hreMp+w7zGCnQ==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
In-Reply-To: <20260413-ac97-v1-1-b44b9e084307@nxp.com>
References: <20260413-ac97-v1-1-b44b9e084307@nxp.com>
Subject: Re: [PATCH] ASoC: pxa2xx-ac97: fix error handling for reset GPIO
 descriptor
Message-Id: <177609976501.111092.1025386040469103436.b4-ty@b4>
Date: Mon, 13 Apr 2026 18:02:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=V39/1btDjdN7e2y8LscmUX4ZzmoyzNnPY1iu5oCTcZs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp3mssD4Qyc33RSSk48z1ootLeK9Csk9hr8VRC5
 em8GXkZzdeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCad5rLAAKCRAk1otyXVSH
 0PUQB/sFn2qQIPGSkEKBfxGsYCHFs0WV/TDR0tlx77sI1iLR7XOYqdqZkbtrDLlC5OWv/Fgx26l
 Zgdnh6cVzmBBtyfu4ps4K2gzsvzDhkjb7gqUubLGSnQqCQGM+Mswea6ia0fC79JhUoBQRvvUv9b
 /OCzyMOs4XcdcCaG+sGoFOvFkmMaeYRWjlrwyfuthnughI86z+tVYGGvcTgTBE5ltfJ6NbXH/PC
 2iXQPM0Y+dO7F+dkeJmc21OglM2z9rx7/uQhlYCxct6bpAPgHFrIlOlm1WVjBQWbnjEIjh46O+K
 K7AOSTSNcvF2yk3o86NHT2riuDdmF/FjfH5s6WBlZRZTvtFO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Mon, 13 Apr 2026 18:52:43 +0800, Peng Fan (OSS) wrote:
> ASoC: pxa2xx-ac97: fix error handling for reset GPIO descriptor

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: pxa2xx-ac97: fix error handling for reset GPIO descriptor
      https://git.kernel.org/broonie/sound/c/54a032d3e62f

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


