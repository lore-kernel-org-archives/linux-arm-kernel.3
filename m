Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDC4CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OodQksCOxye7cnNDHNgseeF5GX59PH6eZ+rBf8kRipA=; b=vHfJaoMMcMK1X1GULhZ3MQUh8M
	xmWV3lca6/bpF3w52+r474MY7/v2c3kcHFXEQXB7yOr3mb5dfqOllfa0S5D64UQSurpAUFAtTp6FD
	AgD/EXijflKXtPg02ACf2+y4vXdU5jykh7YWfOFAqOpcyNkW0/aDXU5C4HB2h+EyuQxhwU0zbQUiH
	SXNTBtIZu3ZV9EIX2QPnIAKpp8jO47SIkBQ+Z2X53Ix1y8VZ0wL1XY3wR4erkdmJh1xHOj5WhUvZy
	7Y6bSNUd/ao7UiIiMdpFe6dC6Mgl5CqV4e3o48RTyYFtRb/zU0D6wlf8+gqdiwArLddoFTjVSU73r
	/csOt4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9T2B-00000005j8Z-0v0M;
	Thu, 16 Oct 2025 18:49:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9T29-00000005j85-0n7g;
	Thu, 16 Oct 2025 18:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BFA34A15F;
	Thu, 16 Oct 2025 18:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E14C4CEF1;
	Thu, 16 Oct 2025 18:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760640544;
	bh=1TvsNySS/ii619yRBomO8Shvk95ED2emXEbjTPkgA+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K0/nYnl6qvn+UNnZq1lrw10RG/Gdx6hWYCLPnyOt7ZIyaBKZLw6e3+qg+B7WVo5Y3
	 YTibjb6/jRBuqzbjtdFbWKL37Fl39IaXtn1MkPmPsr6E4UZipnV0LEwb5CdrBO6wIT
	 Jxfbm8UTeEdFJnGI0+uYokyxMgZomw1AQhNFZ/EVgSQcrsJPMFaMeet6msUQMrTPeb
	 zHS7dXku+iXLSYBjrR8JFlVA3EmOFWLhTPA049mSPY2YAOHFLewNjpw5qIrL6NCeK5
	 GyI+D/5frdSk81snrtmXgCGjYOHIVxS6DL42bLh8jwlSZSRLUg7yg29lddVCTJAemr
	 eByPYIRjnOwpw==
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
In-Reply-To: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: (subset) [PATCH v10 00/16] spi: airoha: driver fixes &
 improvements
Message-Id: <176064054115.223781.11856902416382505599.b4-ty@kernel.org>
Date: Thu, 16 Oct 2025 19:49:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_114905_272672_E3EC95AD 
X-CRM114-Status: GOOD (  12.41  )
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

On Sun, 12 Oct 2025 15:16:51 +0300, Mikhail Kshevetskiy wrote:
> This patch series greatly improve airoha snfi driver and fix a
> number of serious bugs.
> 
> Fixed bugs:
>  * Fix reading/writing of flashes with more than one plane per lun
>  * Fill the buffer with 0xff before writing
>  * Fix reading of flashes supporting continuous reading mode
>  * Fix error paths
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/16] spi: airoha: return an error for continuous mode dirmap creation cases
        commit: 4314ffce4eb81a6c18700af1b6e29b6e0c6b9e37
[03/16] spi: airoha: add support of dual/quad wires spi modes to exec_op() handler
        commit: edd2e261b1babb92213089b5feadca12e3459322
[05/16] spi: airoha: switch back to non-dma mode in the case of error
        commit: 20d7b236b78c7ec685a22db5689b9c829975e0c3
[06/16] spi: airoha: fix reading/writing of flashes with more than one plane per lun
        commit: 0b7d9b25e4bc2e478c9d06281a65f930769fca09

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


