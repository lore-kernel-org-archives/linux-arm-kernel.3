Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E251AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6s1Y6p3w5g9RObkM06oK2W80+/bjnjpN96L0wHyxeJs=; b=hq3GjMlHz+75auuXG1kbMZrNHE
	Cz8FSegpHB7bPRO4/wRoci6/PMqbdbESxDuUYyrv9vPdWM7Mc56xb/IqNS3JEMOl3sKP6Rvjv0WIM
	gByLZlOBCZc2991BweENcotx6BYr1tAvKt3u+/HZWRA9qVewo+sr3BddCMnaRRqLcSxON3npQ5k+y
	1I28L+uX3Uhu7Ktsu3hM/zU8iCTsadG9D2s9JvincMEl3bB39fDj70oqvucrRrojia6cb2Ad967xE
	/vOJtap5SnifcZsu82R7je/dALrMzUO250rjRRn3/YC3/yoJZew9j2kWtMdctwakqVOtwDonRmCrZ
	MYg/k0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzu2-0000000BWRO-3Bt2;
	Tue, 10 Dec 2024 13:03:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzrA-0000000BVeI-2Rd2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:00:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BD2F5C5E64;
	Tue, 10 Dec 2024 13:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63526C4CEDF;
	Tue, 10 Dec 2024 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733835651;
	bh=jaThpRIjcCNZ0lQjQ42i7rnft7gfMtJKkGlTrJdutek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kF8HjOEOVQLLfosqKYy2yxSmojOUK9dE5AA0qn5ypsIUCqMuvvubvy0hKGiYQ8Xor
	 6795C5de8kjVFtlMwiiO0yvBtylBAJx9uLg2QTrUhj5LBT5gc8YXjxO05YOmVhg8W+
	 0qJh03WHF00pbCa0+Watf5W+S8lygjvV2SzdapZuYoYrn+0OOjY1V3FxUylPh8QjU0
	 tQ9Jme+ujIAPmykTpGt7yA/94UwUvxyAPnO5Ouf8L27JwQK3ismNTAfGbIb5IlDVlR
	 n239MCpWHdhRAvcEwbC2K+wkt+X/bK8qXG3Qxvsbgm9FBdOXG0wlyWlvBl9AnIxSYy
	 Fj80hDpsJ6ALQ==
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <4052aa2f9a9ea342fa6af83fa991b55ce5d5819e.1732051814.git.christophe.jaillet@wanadoo.fr>
References: <4052aa2f9a9ea342fa6af83fa991b55ce5d5819e.1732051814.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] spi: aspeed: Fix an error handling path in
 aspeed_spi_[read|write]_user()
Message-Id: <173383564913.34030.1229101307217258864.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:00:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050052_664315_EF5D0883 
X-CRM114-Status: GOOD (  10.52  )
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

On Tue, 19 Nov 2024 22:30:29 +0100, Christophe JAILLET wrote:
> A aspeed_spi_start_user() is not balanced by a corresponding
> aspeed_spi_stop_user().
> Add the missing call.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: Fix an error handling path in aspeed_spi_[read|write]_user()
      commit: c84dda3751e945a67d71cbe3af4474aad24a5794

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


