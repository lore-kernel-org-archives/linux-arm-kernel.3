Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BACD7831F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeuTQzIF+K3W7Ev0yMMvs/nu5LTVKXMbhSZVYczElho=; b=1mjvNuNGeSmwUnCunmuf+XDi5k
	7yUNAxTODJaRTgHHqYzjItDUrQmzwqGEq3867PQkBHtRudt1gbHSQ9SFSu12wh59TbzjWXn6qRBXN
	YUmo4YhfCY6LeN+SkZmpl5marwWVMTzXUZs38AMVv+mWfb+eugoR55brlGWPJ4NyWcbI5RCZHCvkD
	Q3YWssA65fzoQA8GGR8zuA0SLBcfgnZzRz3myMEffHlVTXCUDekqNF3S9L/EyQcDchdW+QU59QJnP
	23dHpH0TckY6PNbhyvh/R3OoNiLUuqMfR6/DpbgLUhPt+jZ7J0vN6FtcRPOJe1uy8Kt8pDo6iNzaP
	Rnl4AKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6Wu-00000006Fdq-24U7;
	Mon, 02 Dec 2024 13:32:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6Ve-00000006FJv-1grX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3A7F5C686F;
	Mon,  2 Dec 2024 13:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C260C4CED1;
	Mon,  2 Dec 2024 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733146241;
	bh=0L7xq5I8jnvsqyo1vi4o9DWhUq92QRZxs0rdJPkIi1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F06a8CGEPJXGp7CvHDbG56l65xOMToVFzR2rMDHnlq05tBoMAcIGLtlJpZI1LFvaw
	 21ez31VRp0RXzpXdcHDaibB/Yd3WBCvuxO3Whziwe6VpAF3EABuwgEeehrpFYgdCMR
	 bEdV+FPoRUet8aW9tXrY0IMlFK4ibkFN4oyhMpJKatIAy7UVECxn1p7NexTXVqok6w
	 wmohYG5Qd7EL8DeWb0syIPxhf9v2jn6BLNI03Gh7P6ZbpFFoWyH9bS38xmeh2vh+j/
	 Sq4Ld1q1ca5GLC45O63Cni1NiUsNTnw6DqfBR87dcT4j0BvjXS9npVALuS2YBuS6ab
	 c0QmARCUP8j7g==
From: Mark Brown <broonie@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-spi@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241127-gpio-descs-v1-1-c586b518a7d5@gmail.com>
References: <20241127-gpio-descs-v1-1-c586b518a7d5@gmail.com>
Subject: Re: [PATCH] spi: apple: Set use_gpio_descriptors to true
Message-Id: <173314623984.54221.9478516701597362964.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 13:30:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_053042_484051_CB669B1B 
X-CRM114-Status: GOOD (  11.83  )
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

On Wed, 27 Nov 2024 23:18:29 +0100, Sasha Finkelstein wrote:
> There is at least one peripheral that is attached to this
> controller and can not use native CS. Make it possible to use
> a GPIO instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: apple: Set use_gpio_descriptors to true
      commit: 1b299bd0c22887543b276bcc5b4ed26f5bd83ae4

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


