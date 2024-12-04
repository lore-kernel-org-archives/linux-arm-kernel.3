Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4888CE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8v1jGAQYxZPBEEyq1ykQk6TdKqm7vvpybYBasNXhLSc=; b=cxa5lJ35RPtnQpESQaljzXUf6x
	qBuVisGfEfPsZzJ5PGJZ2jrxrypNLerzZ37BRQ9WmpUNzoC1hui8v2JkSlxIVYbmTH8yZ+//ipOyG
	qd57l+EVeWNnRlBHy3CeBv87s9Rg3wtNAPsuIYIQGWOcvG+caK5pOcIp9o0GZTwPjQGZ5kRVKccnu
	FlytY21LsUxkfHfee66gWzTXOHodrJoIEhSP2/vl3gSM4UWnVQP5BO3/aO/Almp/QdlutJBSR8njC
	NLoJRBizvbIfOJ6njBmzIY6bwuetWUWB1d2igRK88bS/c4UOTROTjWvWSOWqo/DdTnl/MO83P2//N
	dNEZ5yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsCm-0000000DBCf-03rA;
	Wed, 04 Dec 2024 16:26:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsBl-0000000DAzA-37Fm;
	Wed, 04 Dec 2024 16:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E522A40C00;
	Wed,  4 Dec 2024 16:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25188C4CECD;
	Wed,  4 Dec 2024 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733329520;
	bh=Nc+FOIpt7TbIStp6l8xTivwnrh0gB0h1NmUqHHiH7nA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QoQHSMtd4xRonXrPYqRL5VXJnmIHOEMFLAjKen/RG11dUzDEesTySsjhWqTTjzqnZ
	 MAKhvpaB9jZCECSo4t7d+Y0PvsofWNp6HV0LXi31HY1e8g7pAJ6V3F9GU/eCOmyEud
	 DbLP/nBZh5Z07dtyGnM0xXKHJg9nwgzYxsPmnjLR+VYyG6TpI3w1WWaXb5FzgV5Cwc
	 5lTFhVNFjQQ7JgihP759ATsJEtYFrBCj4AY4a7/ZGuwuhq+MQx1t01UDlmcqFDBWvs
	 I6VQBGeeEeiGYCM01I+7vKkhjdk/kh+D/o6wU9l8QfxMikyQgcGyjMKY7KVBJIEfJ0
	 ObcI5NywDCjEQ==
From: Mark Brown <broonie@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org
In-Reply-To: <20241203013513.2628810-1-jon.lin@rock-chips.com>
References: <20241203013513.2628810-1-jon.lin@rock-chips.com>
Subject: Re: [PATCH] spi: rockchip-sfc: Optimize the judgment mechanism
 completed by the controller
Message-Id: <173332951887.13421.11537303801053149682.b4-ty@kernel.org>
Date: Wed, 04 Dec 2024 16:25:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_082521_846045_954F7439 
X-CRM114-Status: GOOD (  11.29  )
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

On Tue, 03 Dec 2024 09:35:13 +0800, Jon Lin wrote:
> There is very little data left in fifo, and the controller will
> complete the transmission in a short period of time, so
> use readl_poll_timeout() for busy wait 10us to accelerate response.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: rockchip-sfc: Optimize the judgment mechanism completed by the controller
      commit: 577f1cf76ceedb5fbdc9aca4f712b21864ac15ee

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


