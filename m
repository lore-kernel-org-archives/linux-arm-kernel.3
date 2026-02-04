Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6337E9538E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiS4eTLTlfT3RVxU/ABXfJiQo/MuxwnDJLMoJPVresk=; b=zH/gz7nFy2Tl5OkqE1+4tXjDOk
	bb6G9T5D5iBpCp/it/s6gtuRcEB4Nobfc6zx1GQI+yIyWT+ekaNtjoK5EkdlW+lGs1dj4/RzmvSUi
	eBJKYO8+uhMKi1V6icDsMN1e8Z+KoaverzOPCKKuv4dlXLc48wKbJriXrwFbEpCB5j0s/tKSMSkYx
	Wy6DSqAb6vf44QBELB3Bc1hZyN6yAPACS08NLwKFGAwxow9lR0yM1Sz4P4pouN+pmUaRoSYgFzEAk
	7/kuE5yBOag6PwuswWleAS9rCRiwR1sNiUR5Wy9dBshnWi2Apj73UnJs98vUjTvgUWggLyctmtnH1
	ll3VKHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbZH-00000008OxC-3qBn;
	Wed, 04 Feb 2026 12:01:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbZG-00000008Ox3-22V8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B146760010;
	Wed,  4 Feb 2026 12:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6676CC4CEF7;
	Wed,  4 Feb 2026 12:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770206469;
	bh=pFrd/M6Si4XMj9SNVLy6nTDn9r2/yk+RUG1kfMNsMN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gp1GwpWD4YY6CruFRUAnfeE2gfDgcScLUF0+tWJltGw2MrVkoZEaGuFptGf891zNs
	 H7ns6lW2rBLMmsxvKWw4Dcd4DoKkM30Ixk4h919wKaeOrXZCBds3RONNNFyx3ZphyE
	 UzehBk08WsgdtTDrWWaYk3zwc7enlhwMFFSl1I7s3i6qhFmyKEmlBwdT3B6lvE2fLv
	 zOqs+LgUa2jrtFzH6FhCuWuS397vVmJ5AqvYgRet+SCslcmeS1eFAX0XH73GjbH3Jq
	 SzCMlYdxIP+lYf4zkwwxQHkoCkv8IN7LFEiylacDDOngKSSNe3soUEmUHKb4fP71jj
	 BPsqmfSdIdL3Q==
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai>
References: <20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai>
Subject: Re: [PATCH v3] spi: xilinx: use device property accessors.
Message-Id: <177020646814.61613.1868990347848506059.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 12:01:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Thu, 22 Jan 2026 09:00:29 +0000, Abdurrahman Hussain wrote:
> Switch to device property accessors.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: xilinx: use device property accessors.
      commit: 4cc4ace709860c37f7f8019e950380a4694eb101

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


