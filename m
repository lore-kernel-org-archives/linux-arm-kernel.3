Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A3FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDXtF86VK1gu27NEV85R0MtRyEx8CrnTliqhkEYUPmM=; b=LIdVHhDL03M/I0zciDkUxeVQNu
	+DJf+o0xTCCXd8E1ZN3AAmWEQFkkumkmglCstR3zmDcQ+HJddMzxC1LRAT6V6XWz3bkjcD+kH4SZ1
	dvDlIGljLKJtP/5RKlX4eC1IZR/PZLFJLfGMCYn9kq84iYa1PMxhIxMkxQB76eLob5bC7Q1f39D0I
	qI9ROvPTRpPLNH4ju2HVES+Soqty9mlbTt3Z4HB1zgF+tw5EatsPup8xI+8LSqlqRdRtPLP9wgtXy
	rS34bWtpgLbcbfK/rX3ZtgUTpB22Ewrlv+2gGP7wVHuvSv9iSqooMNVfn1Jkp3F83Bx3zunbif8AY
	5dzM7q2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79D0-0000000B5Lk-1U1m;
	Thu, 17 Sep 2026 10:19:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79Cz-0000000B5Ld-1WLo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:19:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80661600D4;
	Thu, 17 Sep 2026 10:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152A51F000FF;
	Thu, 17 Sep 2026 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789640352;
	bh=uDXtF86VK1gu27NEV85R0MtRyEx8CrnTliqhkEYUPmM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OjTpgD3TK3YALyveSRIcZAuTFmzjC4x4yu0+yJKGV1QTvERP2/ksnYAQhcHB7xhI1
	 bM6pgBptqq+635wj35ZiQY2a+d/d9Jhrab884NXyPYVAQQwJ/BzB+RJgvwFr41fxtR
	 kAg5LNXdtcHodwUVKbFWcxoLOvVoeyi5JHbOynw4pr8kEl+c1jeVmUHSC1XKv2vFjg
	 1j0CbZCcZADxy5HnOnvtprq6gDqguuW5aSAFnojR/wDVtF5GQh/Fpv1UEmNU6j3SWF
	 vXUc+kSkOfBXLOcUMQTGMMw5VJAhtStindIACkMj16wjBioGcb4qtsKyrR22KlVCwO
	 nFeRPG9YXCGKQ==
From: Mark Brown <broonie@kernel.org>
To: Itai Handler <itai.handler@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, michal.simek@amd.com, stable@vger.kernel.org
In-Reply-To: <20260910174832.873352-1-itai.handler@gmail.com>
References: <20260910174832.873352-1-itai.handler@gmail.com>
Subject: Re: [PATCH v2] spi: spi-zynqmp-gqspi: stop the controller on
 shutdown
Message-Id: <178957983642.100121.2784046911009039548.b4-ty@b4>
Date: Wed, 16 Sep 2026 18:30:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sYOBPCQZCZz6ppPtm4bDuvKorzgrYBsny7NWNCPiBkw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq76c3YimaI4GlY4gTxTHdyj0qP0RsZYlS2kuA
 K2/+wEMG6qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqu+nAAKCRAk1otyXVSH
 0MtAB/9xDXzGPp+XGSGH3Re/gsQvAACubZO5NHSS8ey5YdEa1OW4Pj5RU7pN+fbOUW/Zqq+lQa1
 JwDAf27dyCeANWu6+QIkjQgCUHEThXGYHlC/724BN26tgLaY1oXv1dIM54F9A1fuCaDXEmhUNkG
 6gaNT6Xp0MmWWLGzySuav6+pthg6SSsjCAAiMa3gVlWP0+1V9DI6Ru/q9Gy1zmC9YwOPWmTfngf
 w9bZsbdxbGGxqYv5whRTHuIS8TNgb2jJC5sAjuIL/fLFlaPg6SjIzfQffpBw3/DOZxN1iMTAOn8
 tEoZFW+BMe2fwlsG9zj9vhI2hm/Gs93yMfvwDXraNascwWHh
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

On Thu, 10 Sep 2026 20:48:32 +0300, Itai Handler wrote:
> spi: spi-zynqmp-gqspi: stop the controller on shutdown

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/1] spi: spi-zynqmp-gqspi: stop the controller on shutdown
      https://git.kernel.org/broonie/spi/c/e922bad8b2d5

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


