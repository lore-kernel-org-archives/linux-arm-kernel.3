Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82140D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTX45AAyIV9M4SQQIldGTQA0KG/dZ7EqLubw7nLMbv0=; b=oLMEtaipQqFo+lhBLl9DYM96Un
	7qD33J8QSvOv5fu1FqT2L/FzSwUKL7e/bFDzWean1tM7GGirpQ2wmUN38OyRW+bqV3uuwQVFKveq+
	oatNDWSwLioo8a1JkbmGd5FFY4VvF2xOl7xCHR8pZ+l3AuKh84JkxeZniPaaWC+joPETJ73fBDNYI
	QkTHFwkYsiL4KbrZxiGKnsSNrpqCpBHqWlUcmXeVYE76tcG4ccdfOdFOkhtCF5OkSo2Dh86cxyNdu
	5h2EHiMvbBLrVyf9ZyoSpDUeULlyoCpQmRn6TxqUmhiQJw3BdVSr8+M12aXXRcSRF+W0l9XbYTj9w
	CLbx3sWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96n-00000003j7P-3pmW;
	Mon, 15 Dec 2025 13:59:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96k-00000003j5c-34HU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD84143E80;
	Mon, 15 Dec 2025 13:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A386C4CEFB;
	Mon, 15 Dec 2025 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807165;
	bh=JITlun+LUxfRZs2r1MFqhuMlKLc42EgEPR3agL6aR7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oFEXrMMpeRORmI9dPoX79JDKsQD7TGn9JkW7QuEgnobHYeWJXj1VLD3iQV9vjkBxj
	 JPo5OCU2EGs7EpSVQlSehcdPF/TnDVLXrCPWbs2iOoKPwDTOZrPi+DajEznhS3bR8p
	 UlUSTfBoH9Uv73Uy6OvDHaJmYCy2r5XTY69qchLIf22xpAkgeYsYPxeFKFMYjAkByR
	 Aa7eKiEd5DhEDTsciXgcEv8j3S2ReF1gW6wbP2seqvj3Hc+TPriS9BvO1SQfDXvS4a
	 /ukIlaeMNUl27NEDg2UyipbQW577TdNIlGr6lu3bo6X89bhRqKoM3+71YEmbLHlxge
	 enr/skcKpjwNQ==
From: Mark Brown <broonie@kernel.org>
To: frank.li@nxp.com, mkl@pengutronix.de, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 kees@kernel.org, gustavoars@kernel.org, Carlos Song <carlos.song@nxp.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20251202075503.2448339-1-carlos.song@nxp.com>
References: <20251202075503.2448339-1-carlos.song@nxp.com>
Subject: Re: [PATCH v2 0/6] Support ECSPI dynamic burst feature for DMA
 mode
Message-Id: <176580716285.161463.10166271924842509723.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:59:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_055926_794202_C1CAF64F 
X-CRM114-Status: GOOD (  12.07  )
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

On Tue, 02 Dec 2025 15:54:57 +0800, Carlos Song wrote:
> ECSPI has a low throughput because of no dynamic burst support, it
> transfers only one word per frame in DMA mode, causing SCLK stalls
> between words due to BURST_LENGTH updates.
> 
> This patch set is to support ECSPI dynamic burst feature to help improve
> the ECSPI DMA mode performance.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/6] spi: imx: group spi_imx_dma_configure() with spi_imx_dma_transfer()
      commit: c64f62b036aed30626cb30fa82d3ec4a13fa83df
[2/6] spi: imx: introduce helper to clear DMA mode logic
      commit: 5395bb7f7c361310d0f329c8169d2190809b05c1
[3/6] spi: imx: avoid dmaengine_terminate_all() on TX prep failure
      commit: a5f298581d454c5ea77c5fb6f4ee1bff61eb2b2c
[4/6] spi: imx: handle DMA submission errors with dma_submit_error()
      commit: a450c8b77f929f5f9f5236861761a8c5cab22023
[5/6] spi: imx: support dynamic burst length for ECSPI DMA mode
      commit: faa8e404ad8e686cb98c51dc507fdcacfb8020ce
[6/6] spi: imx: enable DMA mode for target operation
      commit: ba9b28652c75b07383e267328f1759195d5430f7

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


