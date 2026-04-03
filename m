Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C3AE8537A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0c2UQi4/OuEbP0FtG8wRx0+kreT637uyGL1E7YXTJiY=; b=2nI5PtfrzRpzMdTvw3aTRmrGqs
	RNJQLNNJTMEmWSJ2YYnWAFsE9746DNjrRCo1cnMBGExN4zUPUbQN6EqRPn4SzeLqiiSR7rL4dPthA
	I0x2zFDLhV1S9eYk/YJRd8y73Tr1K0XGemWMBV2tZJaiFtrH8uOqXv7fwfSg/3IifL2GVy6+S81SQ
	Ojb8wm4EbWL9o7STiDyuXp+AGgyEt+6Hew9n2dXxDJiTOLfp0nNSfJ9cbtsYhaYNG+csvrHDeO26K
	BFF/nlIQIo/kUb12AO5S7vBnAXfFZRJ3a/VaDZg/ODibBABADoMIaLxL5q4fJpjWpAIE9wraNXxzA
	skPoUjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hlI-00000002M58-2psh;
	Fri, 03 Apr 2026 16:52:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hlG-00000002M4o-0kZn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 16:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 829034384C;
	Fri,  3 Apr 2026 16:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57C8C4CEF7;
	Fri,  3 Apr 2026 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235165;
	bh=YRveJVZCu8GDGV3bBJZ/v1pJiWaRn6WEGXVvRMAeJ9I=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=U29NGLna1TugWKaYx1hSqQYPS4LcIP8K7XlUqdSh3E61Lv4CTXYohzIUMSem2MY2S
	 9IrNsow63DN3BAKQbKKkRCy4l1hEe6UxPBuzRyDBjrZRiJCiSb4Oq8zA1SDccry/S2
	 66ysEQ2FRNyOw+ud/hw8JTmnq1LB9Frc2sEgLOZ47bdemzkMo5IJE/NAtHvQHnMfOv
	 suvgN7PW0y6e9y8es+t8OaRXHhDxibFECuKitFRDpzn63c6VfbP9DVWlnjZwlyby2q
	 fKxu6twCXWSCVKuCihudKP8MJl+fyLFGnAcYLaNfeJMAgFIj/inPlGw3OQEIPBy4op
	 AHXO0hVXumvog==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com, 
 perex@perex.cz, tiwai@suse.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20260326055614.3614104-1-chancel.liu@nxp.com>
References: <20260326055614.3614104-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Add DSD format support with dynamic
 DAI format switching
Message-Id: <177522560849.52946.6682860027345640594.b4-ty@b4>
Date: Fri, 03 Apr 2026 15:13:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YRveJVZCu8GDGV3bBJZ/v1pJiWaRn6WEGXVvRMAeJ9I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpz/BZjF5/dR+mfS9bVnwsI6rH+fG7++qDr6DB9
 tPVDW3SuEqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac/wWQAKCRAk1otyXVSH
 0Dj3CACACwFyTyL3B80o6GL+XDzhZs9Js2nU3MCZD6GOxiGo+q2C18nuoN+b483KQ56BH9uAkVu
 SAYCSNd07/9j0DTvcHSMZFQY+2GxbAk7KO6ZX6IdnqmjRCVl0WNT5vjSUbDXEAHyWdv/qaVd2xi
 gTViu52u5ePDcratJ3DcnWWUQiG370nfnVgFTsCzRppH5JdLcLRM9kIlWjq3FSb0VgcND1tFXsH
 3dg+rtbO0nzM+xe4ybjFj9IuToYATdGkNfUq5AWTNbQYMNP9qVVAlACGT/2unUcFEQjrnHAUDFU
 FIlpjlPw/sszdhTFI9ynKQo37UDd1OoJC2eGSnDD5HMfb8xd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_095246_269268_0E559BEB 
X-CRM114-Status: UNSURE (   8.96  )
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

On Thu, 26 Mar 2026 14:56:14 +0900, Chancel Liu wrote:
> ASoC: imx-rpmsg: Add DSD format support with dynamic DAI format switching

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: imx-rpmsg: Add DSD format support with dynamic DAI format switching
      https://git.kernel.org/broonie/sound/c/ccd7e53b7d6f

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


