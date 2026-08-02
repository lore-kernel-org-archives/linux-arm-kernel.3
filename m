Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4D2C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUxOKdVCoV/OvXn2db5tCOTNvZIU8mMbmKrWBDGbzHQ=; b=q+YRQ4g8OzIDpiZ9e4dkhyIjJy
	q73yaOkDNHoKzggTuTQjIt+sHjtwMBZbZWe+pooIqnk/Jk9nb4WgTvDGaZ1Z4lzEJObAGe9idqp2b
	oZpQBTWU5jd4Y6Kh0gLBRYqgIRfqEufXvJySiDAwuKLj5HMsqkzu035PRhMkI7+lgwPP4Zuojerxb
	4Koh/UqdjsJel6oRtQwDkxK7KO6M6MgzG5gsknbYhq5ch7HoxyfBU9sQxfjQyNqt2aktf304bW6R0
	dUWSIqgh8TTfcaq4P1uYHfJuyhPCdch75lmZ+W2AOCOhzwA1GSEgz5sPnL6pkQR/Z9eq0MaW/tI39
	xX4nlNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqVca-0000000Fdt9-39Rl;
	Sun, 02 Aug 2026 12:48:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqVcZ-0000000Fdsy-3AVQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:48:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EE824381A;
	Sun,  2 Aug 2026 12:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20041F000E9;
	Sun,  2 Aug 2026 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785674931;
	bh=OUxOKdVCoV/OvXn2db5tCOTNvZIU8mMbmKrWBDGbzHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lY8O5WI3kuLJY4QqwBLkgkse5x0CcYbWFbGFbYGXxDaXtnNtVmXRBE51zRGr+5k/U
	 tgVcIEEd31hOvgS1KIfZiRBb8lfWmCBcYfgi7ecOOg090r8EFjGLQGGQlYpdGWuEud
	 TEYR5l0yasZFeGTgCmis96h8X4UC2LS4KSrF7AfP0Y0aMUshlX4UjQ4nedyxrMU2OW
	 HPz0vmV+KLCBNnNbgAx2/BhtboPBOQRlYB2XGzZrBrjbwLVyM8sFtihtRcUuUwpnDN
	 EpYWApucNoiG5IiinvFEMG2i434/0dtoRRNOYHJIeLJlCJgIkzJS4PrUWIG7UPkmxD
	 GrpxNWBX2r0Pw==
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Panis <jpanis@baylibre.com>,
	David Lechner <david@lechnology.com>,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Cc: William Breathitt Gray <wbg@kernel.org>
Subject: Re: [PATCH 0/3] counter: Remove redundant error messages on IRQ request failure
Date: Sun,  2 Aug 2026 21:48:44 +0900
Message-ID: <178567489466.1424502.9168659014739104167.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715135030.326290-1-panchuang@vivo.com>
References: <20260715135030.326290-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=wbg@kernel.org; h=from:subject:message-id; bh=Yp/nRD6Q9VnV2O9qfEnnLIcigA0aiAm8lDjh/eYL5MA=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDFn5Nsuq3cRcvSdprNu8Xjz+5fb5UzmyuC0X37QVVGXJk 2RVzS3qKGVhEONikBVTZOk1P3v3wSVVjR8v5m+DmcPKBDKEgYtTACZSEcbI8KeEN2L5C66Tlw8r L5yoMVlEeqLa8/tT5fc073dZpWVW68jIcPvO2zO2iqtMLCU/zmk9rHZEjPVP1dlP7NZ3+LJnmCp 5MAEA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
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


On Wed, 15 Jul 2026 21:50:27 +0800, Pan Chuang wrote:
> Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()") added automatic error logging to
> devm_request_threaded_irq() and devm_request_any_context_irq()
> via the new devm_request_result() helper, which prints device
> name, IRQ number, handler functions, and error code on failure.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this
> automatic logging.
> 
> [...]

Applied, thanks!

[1/3] counter: stm32-timer-cnt: Remove redundant dev_err()
      commit: 505d48c93896948c9a430fa96a303af114566db9
[2/3] counter: ti-ecap-capture: Remove redundant dev_err_probe()
      commit: ccd73fc6fbd775b4981855717f85b769f0cf4f59
[3/3] counter: ti-eqep: Remove redundant dev_err_probe()
      commit: 353b2e09f44a91e64c6b8117df46b6999c52e465

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

