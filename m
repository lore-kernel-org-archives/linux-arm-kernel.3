Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2BDC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 22:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsVUbpJO2GFnjLVxq6bdSXKF7uiJuKIV5jBAXZe+u2k=; b=ClHkbEfrnJajf+nyx8bSJdQnSj
	Gdy+y+bGuerCf4/l++RKnWa5ZJUR5y/h149UWP/dd9z8GDcU1YECoGp+2q4kAPQF3yj6WXDVggxRa
	Zck/tttB/EwO3pocIFtDyVplHGZJIGWagyZVqYr9gbArcAzqVXuzZNxH6j734aK17TCe/azSy3AZY
	3lvypzzQJIckL+oBg/QHQrD1XzgcgAqKASklokPRuGq0cY+7MLCsZ4LqZ3e07DElbcNO8IMgcdy/4
	tQwUOECS7jZO5R0/rvyAU9dOOyfzTSo3oLzvM60GtXcoi8gOEJBRHChkbsqSP7HrSBF340a+hqyH3
	//DUYDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJb7-00000005wQv-0r3M;
	Fri, 10 Jul 2026 22:21:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJb5-00000005wQb-0GNN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 22:21:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B83C6136B;
	Fri, 10 Jul 2026 22:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC2C1F000E9;
	Fri, 10 Jul 2026 22:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783722085;
	bh=bsVUbpJO2GFnjLVxq6bdSXKF7uiJuKIV5jBAXZe+u2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I4s2fJi7qhvlGsvBAf3XjVxcYGb9AiJxj2G8j/l13qEY4DZICNpD8JgFDOtNsa4P3
	 kNbqOH/YUhN94yE+ybaiNL+1YaIEOWiN6SvETavk4hwmutVU5X2wwhymkgM2cHrR58
	 5agbG6LIJemPfWx/EV+9juutpbtUnM6e32WN6VuUdBr9Nn2Y/Nf+8T7dWiGyJ2HfEw
	 ir6y53gd735640VoBlCrm2+bn2x5fudgKAlmzyKr0dBVVn/wyykoxdKMlQ9Gd4+NF8
	 x/S1gro8xYErqjvPhqn4gPp4QFIlotJ4Lz72m0k5SA686vO/4Ly4hTz9j7i/7lLQBh
	 xzzWvYHbwVIPA==
From: Mark Brown <broonie@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Michal Simek <michal.simek@amd.com>, 
 phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260710102138.29347-1-phucduc.bui@gmail.com>
References: <20260710102138.29347-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and
 drop redundant error handling
Message-Id: <178368691519.82617.18085220364374590223.b4-ty@b4>
Date: Fri, 10 Jul 2026 13:35:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8WPKijw5P5rOmVDuGRGeuRihM/Gq9MhSIkY1jPCQESE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUXBi1pQnJeRqGUG9U2bjBGsCIqN/W2cjapQf0
 Iq/H10XKXWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalFwYgAKCRAk1otyXVSH
 0GaNB/0VbsIgnHzVMpBnU7rbdbpr0rXWANUWa0LQ4gHwWtFRX+nbZ9zOW8oGRQyoj0u/JE8GJFM
 C/0s6Ii14rpLABtspabMJa3c86zLq9T7n+T+3HADTj+LNLNRw64Moa1h9iWT/gJb4jqrcnb2FMb
 aeOH8Zj+1nw8mdpD3fm6FMMtEpLbGNYQv1T9ftfRNBsaCDUWqX3nJYMIku+KwuYBoPb3TDekNDg
 AA53FHDHometPOE6BucnblRuE97biKAoE13VtJraBpf9VfyJnFXr4SXRkWG8249RimPXWA0Xy3S
 51XwYkp7w3/BT1dsSNotqez7r/dYSsQSwXaY5Iw4shZF2JXq
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

On Fri, 10 Jul 2026 17:21:35 +0700, phucduc.bui@gmail.com wrote:
> ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series cleans up error handling in the Xilinx ASoC drivers.
> It replaces dev_err() followed by return with dev_err_probe() where
> appropriate in probe paths, allowing deferred probe to be handled
> correctly while simplifying the code.
> It also removes redundant dev_err() calls after helper functions that
> already report failures, avoiding duplicate error messages.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
      https://git.kernel.org/broonie/sound/c/14b68141bcff
[2/3] ASoC: xilinx: xlnx_spdif: Preserve devm_request_irq() error codes
      https://git.kernel.org/broonie/sound/c/cb32e3acb103
[3/3] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error handling
      https://git.kernel.org/broonie/sound/c/f9620327ba7e

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


