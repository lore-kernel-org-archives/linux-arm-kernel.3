Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB14CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOLwxPOsjvtFHK4xXIDbXSyAW1unv3Fhxpu6VBNCbOg=; b=D+htCzfOKrMtbX5QjXQRAEeKMc
	FnasoG6PUt2gW9o7nTT59v35gkK9Fclwdye+OwGAunJp2uh2bG6VWooEzDWwlO0A4n3P24qODOWw2
	OniQNoM7mbJu9VX7TWDkVDuSBLkWSdehi3DjOvfclzB/2M1ZvSa1g1zsmB38KVE0cfAN7+zh18xo/
	g9SqIJeb3OPr1NAgc93AIbD9K/NSDJ6z2EKFmM90kuT/rUHirmvL8AuLed55hyLT/xOf125yr/ORP
	Gav0ezgWcV3ATHa3RGwUxPy/kuB3PvnoHaaXcLFjeAOUbn37WLxTur158JjF6QyXUm719U6ASw7jz
	8Wy7YvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pBW-00000008gfn-43S5;
	Fri, 17 Oct 2025 18:28:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pBV-00000008gfd-36tZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E55460575;
	Fri, 17 Oct 2025 18:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF90C4CEE7;
	Fri, 17 Oct 2025 18:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760725692;
	bh=5cLbT2X/tFBAuRxHE52sCqVi7oz0uWxIVRufr/jQJYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=chBEFcY5D6V/OVnkuwloQIaEU+vfkYkFz5RxJnY+9NXjZQ7BbJosIJbgJXDlr1bf+
	 w9+tNKVkdDG2Hw4mDY8FrQqIWm+MeuG13+meKG7tvCO7jCE47Vtny1281/zWVln8qh
	 JlxjbWX+nBAEe3wlIWdbJb/w+UXmfjVOXsS4anWyA2hr0EXJqPQhLmt8ZW7sx3A/xQ
	 gmQ1sZdw+PTM/m6osVZmGM0EWMeXwmQDGklvG89n+1xPNZdoRUxLq8YjzXCCCdiHX3
	 fKZukgNFYGNI45Qe6nXIq9hndvGxEJ6hM03KpMNwysxVPRMMXxld2w0q1ZrqjdNnbE
	 652G/X/933IHw==
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aPJpEnfK31pHz8_w@stanley.mountain>
References: <aPJpEnfK31pHz8_w@stanley.mountain>
Subject: Re: [PATCH next] spi: aspeed: Fix an IS_ERR() vs NULL bug in
 probe()
Message-Id: <176072569036.192503.11424414988999143165.b4-ty@kernel.org>
Date: Fri, 17 Oct 2025 19:28:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268
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

On Fri, 17 Oct 2025 19:04:34 +0300, Dan Carpenter wrote:
> The platform_get_resource() function doesn't return error pointers, it
> returns NULL on error.  Update the error checking to match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: Fix an IS_ERR() vs NULL bug in probe()
      commit: 0cc08c8130ac8f74419f99fe707dc193b7f79d86

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


