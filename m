Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31503E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7By0N7WUeTzZ1sIh4FFIqmADFydUIFOgeAVZX4ZkBQ=; b=gcr9XVOjZ/9xlcyE3yFzVI6Tqp
	riIFwFYz8ZAP2ZfyMFW+72EOOKL5yaiiKCKlqARWVvEspVs8EcLshjI3fS7dRCZX5aHg4kfHQPMQx
	yHEUzj87bqgAcG05XFTWFNy5TLP9cD7xEAIs/8TUmv9DRWypZvXFdY6RGFpSYahcesRN4AblRIKgh
	m53/2VGYKNLpak14etr0q7wQ84WtHvdwgIWw/pfngKzxVttm0aG4WWvH7ZdKjE6TKcHqDvt1Bybrm
	QYf3izHVZXXkZP+SWvSxaJwxGL9Kx0lbhFTTDyl4oW9kKj0ru6KJA6VjsaTDk8t3ZSGSvgvnaLH0Y
	MLUQrVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzy7-0000000BXD3-0exB;
	Tue, 10 Dec 2024 13:08:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzrH-0000000BVhS-1NxT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:01:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AA785C5E64;
	Tue, 10 Dec 2024 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EBAEC4CEDF;
	Tue, 10 Dec 2024 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733835658;
	bh=PscAXMBIQetj/AnKbhFQ+vclBqKg8Pff7HND8t1S3b4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O9T4xDGuixTk6epsbO2omxilM0DXSGdDmcLNfTaTgUJOlcarSeotya7Mu7KXDmNOL
	 yGXeB7TZRigpnsng+gtu9ZLhL4oiMYaRe0cwKN0o4ptDWx+MWaUp+3+2vRW3dBEvq7
	 YtGSmxcXYdFueQ9j6FIPk31RrUzX4qfMsAkCyzXto1FwKxyqdTlgu9Tvte3GRYCBGR
	 ur0sFkyl0cs+fam8qpUYR0r7y3n0+cCBgxQgTAKyYvVZA4uhwvmRWzVf/EvPs36u7G
	 a/7kOakzdBzh6QUjAIO5FHyGR9d2IIa2r8MIz67YsiZMR9xyfHiIu4XWaWmzfij1Rx
	 r+HhN+Hu1ExCA==
From: Mark Brown <broonie@kernel.org>
To: michal.simek@amd.com, linus.walleij@linaro.org, 
 Mingwei Zheng <zmw12306@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>
In-Reply-To: <20241207015206.3689364-1-zmw12306@gmail.com>
References: <20241207015206.3689364-1-zmw12306@gmail.com>
Subject: Re: [PATCH v2] spi: zynq-qspi: Add check for clk_enable()
Message-Id: <173383565712.34030.16922746389125728063.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:00:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050059_415785_9290625A 
X-CRM114-Status: GOOD (  10.92  )
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

On Fri, 06 Dec 2024 20:52:06 -0500, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: zynq-qspi: Add check for clk_enable()
      commit: 8332e667099712e05ec87ba2058af394b51ebdc9

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


