Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BF6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bl/vxLGHqxqRCrOUeydMhwI2+voQmuxYqMRKje2cKNQ=; b=Q/QulspdTSrpLsszDvANSdj1J5
	VVJgy+83Ara9dvW+08xdG5KCSQbOjphQoMlhEcLfrv8Roi+flUXKLG8Duz6bBVKSOKEIiY23FCZ2K
	ektR56Rht0oUChzN/Bt/h9q9oxNNcNJWk2APrQQUlhYZyTiJ1Yp1PPGk9cZhOGGbb/vj3m6Q9TeCR
	qhkLOxFOh+EaVhK8lHk25kuErBpd/u52NXVVClx1TlzqtKnnZCClF6GYyPqSf7/j3QVRmoQWn/db8
	lw/HKZCwuyZsiUd1q4MKkv9NF691d/+4GCl2UQwbA79zCSIDIHihH1GJlDtu845HDVVg+iitGHAa+
	m3n5H1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpd6-0000000EXwe-2jmO;
	Tue, 11 Aug 2026 16:47:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpd4-0000000EXvr-2Kf0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:47:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE4BD600AD;
	Tue, 11 Aug 2026 16:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71511F000E9;
	Tue, 11 Aug 2026 16:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786466825;
	bh=Bl/vxLGHqxqRCrOUeydMhwI2+voQmuxYqMRKje2cKNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cAZ192fYCzaDs69kLGOWo4K6W+spDVrvLanZmThbEjR5pwUNa+pv0h7E+QiIcNeL7
	 CAsyo+UF1hXDzlVx0MHvJc3bAc+I0COPqYwwbLcLWXZSuydbVuiIDZO427HWF2k8q7
	 i/2FXtWHty9RkedOXMkAKO/YV//fz9xR9kCkWvVQExWxxQ954kwOXVJO/r7OHchIBB
	 8rzaBL+F3ZU0jYbE3uvdyC6ZBXbCI+PJ18JDLPyUkWRUT7Vf0lICr5LRkaUOfcklO0
	 hZMVzmXnHFZdgCf2SQJhC3kZ9PqkK/q1YkhAgFv1grFjkUuAEkzIKjm0GP4j1nPWR0
	 qhxXaDafpR6lg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260806233231.30631-1-rosenp@gmail.com>
References: <20260806233231.30631-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq
 handlers
Message-Id: <178645931337.119683.6038147153748849900.b4-ty@b4>
Date: Tue, 11 Aug 2026 15:41:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3tV7MfYa7gJ6oSUX19YCgxpALZXllP5jOwzBz3hFmDE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe1IGwpAHLJa3m5QOQyv6nFLxMLlWEEN0RACZF
 8FGR7NKyoGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCantSBgAKCRAk1otyXVSH
 0CBDB/0VARELchOepwc6+vT7mCTWQIxxFbRfD6Fe3UatvZnmoMFL3U2yuN2zhv9tA3ZJtZLeWNz
 cX2QchWKVeqPD3uBsnaeJeGN9BVnOac3y7uAMSYqJXRKlWUJQm2E2Z+wMbCkG7ONyHnEbyEAyRl
 GtqavfWI2EzbDm6KkmYPhhJZoLCBj5yb3ttrJcH4qBltUZSWaEUnXrRI6HNgDe+BQrBMke4xVn2
 AGHt0OA1gea7JjO7SoqexITh9ksR+5MHsMZd36zp4wwSRu47SZR2et4DEHw5BfDH0anyHbM+ddd
 eYlDJ1gVzf405DXlJlCEZ+QVASEsgm6sltlycmj5WSExJ2ys
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

On Thu, 06 Aug 2026 16:32:31 -0700, Rosen Penev wrote:
> ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers
      https://git.kernel.org/broonie/sound/c/f12afefb7b01

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


