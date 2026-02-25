Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B35EFD23F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 19:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaEhhMwaNvqPGRJQOtrUGyAmx0UXOxL2YUYegXNbyEs=; b=uJJ9y7c8VZRTjsYv61VRuB0uDD
	0QqOV3wT/SMLn1QPJqeAKfOo6YxFIaiVD5eHjuLFsWaHYwv3RRnxE/CgtakMIJ81McfqvWbiQop8g
	p7ncYokjP6A5b3e0vbgion33CQdQOQzyGezah0+Z0Q/826Vs/3g+G/wNGh70LJB7tMWt3+4Pbp68Y
	XmQwvmD+wCDTghOlc5RByQCOyDbSOG/hEpRcXg08vjqr7sjoTUIV4v2lyK8zMwHjIid0F4J7g/z+v
	94Xthjm4Lyi80A3URh3LIjFcuYptIhIogd3nHk7WBh35F972HlQgWxy/ULeXstXUcDKF0t1PP7jnv
	rJjYZNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKF8-00000004lwP-1tEp;
	Wed, 25 Feb 2026 19:08:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEi-00000004lli-23Ar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 19:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3794343489;
	Wed, 25 Feb 2026 19:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060BEC19421;
	Wed, 25 Feb 2026 19:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046472;
	bh=kuPZcC4xYX0NxDfKAgqQFbXlA8WTqevQDuVsHbHTpz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mnEm5fHgBImgJ1VWWPPobRPL8HcgIvUiFME5vIi9ej99vmNd0WF8hNfi8luKp4hse
	 zKL/kzPQZxzW7zF4q9DvME4smMUukq4WNd7LQmq2akuGITsVkj0vWFwnW/iJnZPioU
	 ys3bFXHZnK9TH6q0mCq0NNgb7zeT8sy17ijcxWvKwPro+7xpVZ2KFF6PmVYUjS+oyt
	 mglkHYMBGRAiz6A9qsJnv+tyhRyRvRFCWpDXjR05ewFkF9ay2YXXKOBjS2AvoG2bn9
	 JZK4HWfbzYjx/XrL2uBqJPTDZ5G1L8DUPEd4KA1j0bMWFU6O+p56Va0P/tntScdrNC
	 wgswAIL4Eo4IA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
In-Reply-To: <20260223153117.2838840-1-andriy.shevchenko@linux.intel.com>
References: <20260223153117.2838840-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] spi: pxa2xx: use min() instead of min_t()
Message-Id: <177204646977.169139.5577327712485866551.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:07:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_110752_551264_E70DB290 
X-CRM114-Status: GOOD (  13.25  )
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

On Mon, 23 Feb 2026 16:30:54 +0100, Andy Shevchenko wrote:
> min_t(int, a, b) casts an 'u32' to 'int'. This might lead to
> the cases when big number is wrongly chosen. On the other hand,
> the SPI transfer speed rate is unsigned and driver uses signed type
> for an unknown reason. Change the type of the SPI transfer speed
> to be unsigned and convert to use min() instead of min_t().
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: pxa2xx: use min() instead of min_t()
      commit: 507a071d9868cb60e4e76f8a06fc8eb014f59ae4

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


