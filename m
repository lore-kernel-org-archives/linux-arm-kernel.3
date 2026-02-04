Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15CAE9538E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS8BU9a/3YeXo2x5LjyA74Ox7/XDo7xbvYgs7GvlaYQ=; b=utYsKrIKfVp5WkYmLBcHsUljkl
	8kwlxHn8rtUVaXrjgy10hi3qsT4sTbwbqUgtO7IIu6bcaZuGwgL/jaryVtRxTI1DxFtm1h1lO+yPM
	POEt+F0KL4u9LPfgSN6HtREVOuH+jMgB5NSpD/esEUpfknTPXrd6gWK13Uu8c5Lg4qAf/PlYusjvM
	p3utjjAYW29ZODNIBt1rU9UczqN8yqFX/tHGdXEekvaICgotcAladCtboPPaXqVJtgaxCYTUHzFBd
	qDr5jxi0fwQU1/IqAW8skOeWLGVJIRIGDt458FJOwATlt/Vhg745ri2VBIO2WGT3WJ41EDAZip8oS
	SLm170og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbZK-00000008OyQ-30zT;
	Wed, 04 Feb 2026 12:01:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbZI-00000008OxA-0DtV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D6276012B;
	Wed,  4 Feb 2026 12:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D674CC4CEF7;
	Wed,  4 Feb 2026 12:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770206470;
	bh=lH9HiQe1icK5XV1tUanZj5QknosMljGA5uHaf6rP8m0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bnpkVKXq5h15PAsjSTSPDSsEdh7lZDngaFg/U/5F12w7+fW73XQPtblt2JvCdle3A
	 YPljGeR1CbxodJm7wh/a3geWpw3P2qi6f+bC20hQZ+7oSBJAxBlcHg/jUQgdRtb2wH
	 jDV8CGa/r89NepR+LSHoQPe5fiwtdzFXkANps8X8FqblRG/B2fjWMOxyyaKhDpgPK6
	 vfFmRRhfLBXDS5zKHTV/jxix1akvDDe5/7EpwTHm6JkkBAmm4xdhCRhbjGJkoWuNuJ
	 ta6p57Vvh/6dEPSdS3A+YoA81SlFZi2y/oSjGSa4X2cXchqrZ8YkPp2o0TUbncK1sk
	 P5ve/YyqgGKKA==
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260203-spi-xilinx-v4-1-42f7c326061b@nexthop.ai>
References: <20260203-spi-xilinx-v4-1-42f7c326061b@nexthop.ai>
Subject: Re: [PATCH v4] spi: xilinx: use device property accessors.
Message-Id: <177020646960.61613.6842316976047547845.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 12:01:09 +0000
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

On Tue, 03 Feb 2026 01:55:12 +0000, Abdurrahman Hussain wrote:
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


