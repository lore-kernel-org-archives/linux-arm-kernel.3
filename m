Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B115C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bX0OCi+CMyhwXy9lrE4UMSExGRWJd/dorD/PBzaX5o=; b=IfvxG9US8IaRY8VkqKWS7mLzbi
	9BzLXYEWgDjbiEaYcM4DDYj32teVWLdi5VHfL4A4n28GhgzoZIGO6JLoPuQf4A7L9G1PuUFWwuUR3
	lJWAD/0ZQ3lcs9fXR0SQX4h4pBvvHPAtsWaE0/9WwUzW57dkrfEgx0DVrJdTLJO7hMkRQ9bGn0D/r
	gz3+uZEUnyzEgBHq34ehP5tZXsRvoAVpWwqV1ktTHvIpmpNgbNE+w8vqubE7FD/An744y1/AudwqG
	DH4uzepQPtURLCpE6dUMrfte18qjpj/jBFU3Rp81JGL3LimCcRo40yNWyNxnBws6lXyQnX7lm+o1S
	bphhLk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDpg-0000000BRZu-1AWG;
	Thu, 06 Mar 2025 16:12:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDo2-0000000BR5Y-3GYo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 16:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 314CE5C5807;
	Thu,  6 Mar 2025 16:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E12C4AF09;
	Thu,  6 Mar 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741277441;
	bh=dO5KuEHT5N6JPz0mZT1IGgNKs9grKUWa+Hx4+yx3kc4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JCqBfelle7bd3f+VaMdYkAAJYOLVyqPuRy+iagi9Fuw7JAId6/MsywpvuUBHTwnq1
	 KvNpYZCs3czm870bWeKDTn0jRE0gxCsoMYcIrC5aYwe5zx/2k9GYF0rw9epTuSDhUV
	 S0lLbFRV6Ur7yI9KI0CV5CJguD66+/7N1mtPAc6kcrNYarmwS6dTZSHWzB2SZhLc0f
	 Z+lCGPXOl3bMpSMFPt078zrZtRfxTWL2o3ldBZqMbFYKHtYm4jHknp88vi7GI+GY8V
	 BuL7zfDzeiyVfRUcZqHoX0TT6Yh8JmS0UYqTnAGpkX09C/tWXrJzOM7bg+FSs6SCkt
	 wmh0cJSryQ2bA==
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <bc4c9123-df43-4616-962f-765801d30b4c@stanley.mountain>
References: <bc4c9123-df43-4616-962f-765801d30b4c@stanley.mountain>
Subject: Re: [PATCH next] spi: stm32-ospi: Fix an IS_ERR() vs NULL bug in
 stm32_ospi_get_resources()
Message-Id: <174127743980.139137.18227484559909848489.b4-ty@kernel.org>
Date: Thu, 06 Mar 2025 16:10:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_081042_879423_D1CD173B 
X-CRM114-Status: GOOD (  10.45  )
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

On Thu, 06 Mar 2025 12:48:34 +0300, Dan Carpenter wrote:
> The devm_ioremap() function returns NULL on error, it doesn't return
> error pointers.  Fix the check to match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Fix an IS_ERR() vs NULL bug in stm32_ospi_get_resources()
      commit: 7dfc9bdde9fa20cf1ac5cbea97b0446622ca74c7

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


