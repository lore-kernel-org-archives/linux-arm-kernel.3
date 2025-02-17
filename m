Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5398DC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mv0xJbhYi/YeQykAiRAVemoksn2UXfZFh8IxjRHB3s=; b=CYfc/Yl/Iyqyne
	v0bpgdCEQZ30jcumprKpFxyEj+s0nZ/acuESiJ0pWuq4s+MbJv2qZA437kpFKbvWDfSHBXv8TKtlq
	RoMXSsW65d7qXOEQzCHlkWxd9e6HNl2UUjzjHHzEHE1ibyeZuH8EwNu5mNS1P4bXrZX5p/mje7RUB
	vTdsUjn02wgMFUV3eP3CRJTmyGticBTACL7vEfds0a9ysnnbCAk7cUaKqrF9pL02QazgLuoO7b5ik
	9MIHKAc5wXrEkfZgBdZZVLHNSDC50Gi7EK2m4jPNpTGs0+bhTFeyMTtxihz2Bn2rfEqn9R1aLgLgH
	LpnIg/ayfMTySpdBh42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0Ga-00000004TR6-0tts;
	Mon, 17 Feb 2025 12:30:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0An-00000004RQ8-0bWh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 12:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EDA41A40A73;
	Mon, 17 Feb 2025 12:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCC7C4CED1;
	Mon, 17 Feb 2025 12:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739795067;
	bh=TJYEevfjJhbZc3qn+igox9ieijgb5voH+UahcAHp2sQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EpQ50d5hscsOE0Mv4QRUAC0NqvA4X69TVieE9LcTkTbnJWv4xMJDBFDpfUA11Ylve
	 EHnNrEBnZIVxoX8eRoZP6Kkd257eVQjAfUPF+pQZlChsSdwu7eBy5M1FaW8mWPRTRe
	 mweuQ5r4oHGuYRJojkE+XrpLyuQPvRwYNJBooHdULvt00PvhNPBdURzl591Ho7M7vo
	 BfYVNqJ2NRDiNMWiQidEr5A7Wx6CQYuAN8bcAgoPcdPNcf5cCgZEuxc9ytkPkEyqCa
	 ovaCZve7OyecQpYl28rdMKjB3rnbf0xGTeFy7kumPZq4mb1Ww2DlS6n715heyZFcEE
	 ocRLBWot9rJxQ==
From: Mark Brown <broonie@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
In-Reply-To: <20250207122145.162183-2-csokas.bence@prolan.hu>
References: <20250207122145.162183-2-csokas.bence@prolan.hu>
Subject: Re: [PATCH resubmit2] spi: atmel-quadspi: remove references to
 runtime PM on error path
Message-Id: <173979506523.23527.7426002054333724142.b4-ty@kernel.org>
Date: Mon, 17 Feb 2025 12:24:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_042429_244678_99FE66D5 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Durai Manickam KR <durai.manickamkr@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 07 Feb 2025 13:21:45 +0100, Bence Csókás wrote:
> There is no need to call runtime PM put APIs on error path of
> `atmel_qspi_sama7g5_transfer()` as the caller (`atmel_qspi_exec_op()`)
> of it will take care of this if needed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: atmel-quadspi: remove references to runtime PM on error path
      commit: 99e6ea912340d6a262a60d5dd0c87c5e7b2d6ff2

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


