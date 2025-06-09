Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E244C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nPBQTqcMc46lnxhWLXKrmRGVhdEB7PtOTicIzTr16g=; b=KjXdG/0Zf+zT6og73zGsIVp7kQ
	4OdHzofrRHSBzsLzkkFUS6Wy5FlQ/vcDQLoPjvD34yoa7EfBHvaWEipZEhlCYCFqOiDSRqDs0/fAf
	cyS0Lox3bd1N7KeNnZchUb6PSb9QPpujwJIfnYdAuUfcNuqZ4lS8efcfG3x0ALPQQzRsSw8ZEuZCg
	Gb1TIZ+AcGKts+Tsi9j3Gnq3uDwvP57q8J0z9oUVsfmBH0cW4IQ3nZbLL4/fqdvMNlxx4vfdgjmmu
	rGjhV0cMhq1Q3UHPvFQg3K4i/qPm8bsA6liLEXRTur5Xh3XntTGj51TNJeP7PIxMMzRqRbe8apw+k
	xpRae0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiav-000000055eu-0iQ2;
	Mon, 09 Jun 2025 19:55:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiFl-000000052h0-0CjA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 19:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D97F629E5;
	Mon,  9 Jun 2025 19:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C951EC4CEF2;
	Mon,  9 Jun 2025 19:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749497632;
	bh=TP4hyTs8h8YAb40w69Vr1lWI5iqkgDHn/WQE3QL865I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=On4WlChjQCtAwoelwqwcdRxT8v1VCfv9hDzz+aUVbE0NAnnPCdMwnRJZrHJAAsA87
	 9eICV9OPwQfMAKTi4FOITRspcsHnxzgdF/G4ysHnizfG59bTOcRM2to7g9eSP72FpM
	 0HoZwUL1uSkO4UUO2Nj+yqyp5Lz/irfY/Fyed2DioexiTtcS2R2q/4Lyet4ACuM2hv
	 C6Hx3fENqlFhOFbTX13N9nn/n3wbfWavsssxaitxiIZ40NRQY6UQG+dTlKUy7piqil
	 72Mv/sNZS2ylZ2657IXoYVXYrFs+1gduKYkaC7EBnuW1bQK4AnMx62fIg2uBma+8E5
	 PXUpxiUAgpwfg==
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250609-b4-upstream_ospi_reset_update-v6-1-5b602b567e8a@foss.st.com>
References: <20250609-b4-upstream_ospi_reset_update-v6-1-5b602b567e8a@foss.st.com>
Subject: Re: [PATCH v6] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
Message-Id: <174949763058.256775.10348789503749491026.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 20:33:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Mon, 09 Jun 2025 17:05:04 +0200, Patrice Chotard wrote:
> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
> acquire/release mechanism which ensure exclusive reset usage.
> 
> This avoid to call reset_control_get/put() in OMM driver each time
> we need to reset OSPI children and guarantee the reset line stays
> deasserted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Make usage of reset_control_acquire/release() API
      commit: cf2c3eceb757e3f28e6f1034f9bc178e1535f5cc

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


