Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559B1CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoAWLLaS6pd9UzlUzg92jVaWk5xwlBah0mG1uy97Rxo=; b=JOetDX5V5e9bCPFWhDsgb29e7H
	4XUwVEDZ9aLoWmwJ8QTwhoW+y1jAhSBcKiAek1+wWRI/5MfhyKOq685Jh7J82L/vF/eigXlT7K1X7
	dIHnxDnWOVqG2joVIiLlxwziYo8sEbk9BNDemhzCnZ869Uh3C0JiXCCQ50PXB6BfUROMED+iLDA9M
	CBViEALu2e6zfnaXXW4b0KFm47I2DhlHks8cyc6eIaaVZStLnAGp63LpA3jhdz7/G5dVNzugKTms9
	fJiBprniCspC0g2Zy3qOm+6a9nEK1xrNpyOp+Kk6Udp4eTM60k0nPij5qAo61QGICn+fvq6hSEdZ+
	3Kt2c+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGyG0-0000000FOj1-3E4l;
	Thu, 06 Nov 2025 11:34:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGyFx-0000000FOiS-405o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59C3F4345B;
	Thu,  6 Nov 2025 11:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC49C4CEF7;
	Thu,  6 Nov 2025 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762428861;
	bh=BMvBp0vVYTdKvDSUYn73f7UGpreVUIWzVn6Q8Jb768A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=capru84jwTfVANq97uUdwiKStahByghPYOfcSZsfq7pqGdSWPnZQX0ejEBzEqm/1x
	 hCPX8mxyjURRZeQDpwl1uf9BpSNKJ1k/WARaamJNL9BFjx3vl2s9Xh++0+A+nRu8k+
	 y8zVeQcnh5MAnqu0vYoTXoCpt3ZY06s9ibVXKjWU7iMpfAKiREQf55fzfeN6s+1irx
	 0QB7yl6Vg/8dQqU40OVcnTyk/g8PI3OMy88aWZgKD+j+vf0KMzJTxvqWYu1ZTw6TFg
	 PYehweac4njn/0tcc2ITP10V8kpAPZWKoOzDKTL16kRjNknJK1Em5t6ir7u66U5Van
	 uE82QDdn8kNOg==
From: Mark Brown <broonie@kernel.org>
To: joel@jms.id.au, andrew@codeconstruct.com.au, clg@kaod.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
References: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH] spi: aspeed: Use devm_iounmap() to unmap
 devm_ioremap() memory
Message-Id: <176242885811.2357454.3184590153610422112.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 11:34:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_033422_039061_5E5998FF 
X-CRM114-Status: GOOD (  11.65  )
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

On Wed, 05 Nov 2025 16:49:52 +0800, Chin-Ting Kuo wrote:
> The AHB IO memory for each chip select is mapped using
> devm_ioremap(), so it should be unmapped using devm_iounmap()
> to ensure proper device-managed resource cleanup.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: Use devm_iounmap() to unmap devm_ioremap() memory
      commit: 2f538ef9f6f7c3d700c68536f21447dfc598f8c8

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


