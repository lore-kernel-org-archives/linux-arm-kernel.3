Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECF6CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cROCURoBv5SbYuqxgcPCgTOoLgTNRLJjDemztndXY7E=; b=kUoSm+Si1QKID/acBG5nIMne7F
	qWOMyDycRU7YIFO3cRIeRS567zAbskQO84t9GNhdOjvWR7AouNisGGRk7vGX4S/YhKdBWBv7IJZ8c
	hSfSCFw7hMiztDyOG4OtrzELViHh6Fgm+FrBEsqXr68ZhNn3DyyAejNoZNFvTEZcRtSWCnDTj65wL
	IEKuiFPvm6nLXm5QWRimjKWjj9hOk+vlBav417hIkUf+X8EHKK7gbulwevp7Fj2fbt8tenhGfC2uH
	QLPjDBsWYG+5hOT+JWtbuY+GP7DRc0/lKzH3SaZpQdIB5dJsN3FdT+Y6iW/bEP0gk61CqEbINF4ia
	NZ1r6UPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjUY-0000000GcMt-3g3P;
	Mon, 05 Oct 2026 14:16:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjUX-0000000GcMf-2WeD;
	Mon, 05 Oct 2026 14:16:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46BEF41774;
	Mon,  5 Oct 2026 14:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38C81F00893;
	Mon,  5 Oct 2026 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209793;
	bh=cROCURoBv5SbYuqxgcPCgTOoLgTNRLJjDemztndXY7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fJyTg2Q+T0HF0Csq2hLcAtfkuPOTOJHMlqxIiucN/IjaIfDoAi4I7yNQXvkQqajyd
	 QVuPYo6VadmCxN8e7K4WQx831t1CLwALCz8PLpxtgRJT7/ROUr7g5MB6tp/8Y/DhGe
	 y/kI6b/WCVuspAoVcTfnb8SmG7yCZtlk0oHAxexDH3Gou1UuAdl6roJmIe9izjYEVl
	 CkWd5E77QQDIn4WkW9IQsr9ms5eyZMFIcy8AymTGjXRnfplZfGLbfFzZ9ZTjLTyybS
	 sDuHHefJmFHBnUQT+lBy00aqcPt+VR6ofNSFSpysVK5pqPB9IU9ysl23qq4x8/A2yE
	 B1YD7Pd2ZEWDg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Hongyan Xu <getshell@seu.edu.cn>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, phucduc.bui@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 jianhao.xu@seu.edu.cn
In-Reply-To: <20260928134054.312-1-getshell@seu.edu.cn>
References: <20260928134054.312-1-getshell@seu.edu.cn>
Subject: Re: [PATCH] ASoC: mt6359-accdet: manage private workqueues with
 devres
Message-Id: <179114814010.150114.17408458260708250810.b4-ty@b4>
Date: Sun, 04 Oct 2026 23:09:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mmZJBIOiV3CvuAeLKUlhlhNsdM7X2nfokKCh4GBrX+4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw7E5cahys8/sTVDYxMlkjrMiNIUTKX/Cihcjj
 DRxtvKkO+6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasOxOQAKCRAk1otyXVSH
 0HM/B/9O3H4UAH0s5YXz3pah5oztj5gHhvHzdKl8MlEoUhsyRcGoayB9y8EYkAokXBHlf71dmxf
 3KbQpPwXAraoO5TfKXdZ7gkFOb63xYEu0AqjjFOF46XL9ekQYuP7ssrXwbD5JW+H110ZNyvEp3F
 QZRPOnlbX0K8U0q20gGNqqR3DXDnFJRV15suGEsWs2YIh1c2KZsmc4V4dSa/6c2JHR+WNLoZCJ2
 fuMYhB7Meo7fJsLn/zD8kDdijVx25s7bn087KJQ4Pix0gNqVj397dZfmKqFPplaYsk469haTAEC
 bQbt6Gskhhe/AuoiHtdn4OJ85eDji1z+G7VZQeuedBZxJK92
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

On Mon, 28 Sep 2026 21:40:54 +0800, Hongyan Xu wrote:
> ASoC: mt6359-accdet: manage private workqueues with devres

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: mt6359-accdet: manage private workqueues with devres
      https://git.kernel.org/broonie/sound/c/9a773d9d21fa

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


