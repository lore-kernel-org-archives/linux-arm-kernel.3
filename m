Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6D8C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvzdeaUiFwwCjRSFAHftq+6tZ+Knnd1DAaKjP+vRKs0=; b=hKG2NH2NHihE7SutrbOF/fdmm4
	TU8/hT1cABpUZ4gWb2RCidVzxu+sFgaAzJA8LsPMPo609RcWqzctVICZR01HHaDpiZT37piA53c/b
	E2fIyK7ZgVd7w3/j9g8ONY9JVbE5eOYVuTPOVtIVkMSlDVtJFDqAB0TZQNnEaxcSNIFQ/MtExdbKf
	2/+oLRNSTVVKIxa4cCo92GbsJQ3CmxN3D1oOSCWfP4MZLe0BUMEoJPc5H6hbK+IZR1hKO4j5dd+RJ
	rR9P7cBXdkn9vLBn7B52sjfZl/Q+MVYGeHZHUwYHmr7MiLfqvq7ZZUsg0CKnSI7kTMI5PZe6U+Zpf
	7pj3j5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWOa-00000007Mow-2LVC;
	Tue, 17 Jun 2025 13:30:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWG8-00000007KdG-2Vfv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:21:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8BBAA50BF6;
	Tue, 17 Jun 2025 13:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCB5C4CEE3;
	Tue, 17 Jun 2025 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750166511;
	bh=sgl0GKMwAeIqs5yYaPUt4LUfXQa5X03avynVE0AwmiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S7mT+vHbm4YIHwgHaSgK6Lha9QEynDdrKn46XfPesxwRAsNcPgkHHGezKHRC3yzVy
	 2mBvOmNY0i/F55/1y9lPGTEzjZvtbdPekkAV7hup5EBacmuW8Z5/4JK/MM/ti4Jefn
	 715KPZ9wOM8n0RzdF/+ETehL00F9SHLBphmT86qNkvEP2gugxoZZzIPTEBsIwp8III
	 p+FmFNtHyHyZiYAq8AID/dkHPitsWl7PnoKbFwLvARIh2R+OrxfrPlsEnbWLVzkop5
	 JyHYPggyQYArdu9iUVq/f1u6Lp9QIpg6hSFSXPuhUMb40JBDOxs4psqr9I9O2O6YH8
	 GlS4xEBhZyTxA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20250616154018.430004-1-marek.vasut+renesas@mailbox.org>
References: <20250616154018.430004-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Add shutdown hook
Message-Id: <175016651017.38761.10081771279531049568.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 14:21:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_062152_700391_C5F2C0D6 
X-CRM114-Status: UNSURE (   9.61  )
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

On Mon, 16 Jun 2025 17:40:07 +0200, Marek Vasut wrote:
> Add shutdown hook so that the panel gets powered off with the system.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: rpi-panel-v2: Add shutdown hook
      commit: 3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115

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


