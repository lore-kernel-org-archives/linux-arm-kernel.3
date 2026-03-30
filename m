Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7951C1061B24
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 22:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNfaTXslt3YxMLJafOuaD1raCxeKRabxDayf8n8cGJI=; b=29Ll/CqFqdKAuoAqVZykoCIHNi
	v9VpeksYBZoXsvZJ+Svi8HJpgOHz6PPA9GNIPRIZRkjF7LL7EmAaHDJVYXjHqvTQvBmyWKrVvBWpQ
	nxQYKMpr57p8UFASruoHaGlQcEkC/w2jNBc08wHMdXYQk1GK8q8LmJwt7npPD1njHwa4yoTCHOu01
	P9CBoSSXOCHwT5JDeRtT6Dz2cTaaVzSx+wdmTEffIPJLdNayAgc/mNnXlhz0IuCgCBIuWZFeZoWza
	UdwmFvF/NXVGQR7haCeJnb2lv4ksroW6a8uPgNvddX8+BMSZyz9Oms01diHketzP0S4AHXl7fPLqo
	s1Sd7cwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LJs-0000000BzAV-0l56;
	Mon, 30 Mar 2026 22:42:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LJq-0000000Bz9k-1cB2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 22:42:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFA1A403A7;
	Mon, 30 Mar 2026 22:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C97C4CEF7;
	Mon, 30 Mar 2026 22:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910569;
	bh=WJUmNyHI33Ksdcve8J6YydVvh7qixIZn6EjlrvkUTHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zb9Dbfg9hUNrWQ1loGToOdl+1qsAhj6+m14i2NRC2dGewKMaB/dOQAUNfCNDitaU5
	 Cm6JFuFhUp8SAl896uBm8pOzBx0kNxAE+L8HJtxJjqNU7lP2e/P3qrvwZuQfDhKKsl
	 5WiW/O8KeP79L7C2tNjOYNv9HfcNALMLXxXefa8IEEF96uyCmocvry+vdD+8mX5JWE
	 58NTy+nu/i5eZ50YlWI+BTM9k3aj1e9O/2qEE101zQau/u6dTxtI4jg7b7BfcxYBzh
	 NYL0xXx68l+jp5Ur/OZT/XIDeOtolO6mb9K1/MS/MHGlWPwoRKcJqf7RtwegRpni3I
	 qMbbT8btEx6Pw==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260329-ospi-v1-1-cc8cf1c82c4a@gmail.com>
References: <20260329-ospi-v1-1-cc8cf1c82c4a@gmail.com>
Subject: Re: [PATCH] spi: stm32-ospi: Fix resource leak in remove()
 callback
Message-Id: <177487334325.97912.13454188633754990000.b4-ty@b4>
Date: Mon, 30 Mar 2026 13:22:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WJUmNyHI33Ksdcve8J6YydVvh7qixIZn6EjlrvkUTHQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxnVDjtLZDM2CXSDaxJ2aMbGfIoYxQaaj+Ss
 wM4QuWJpYSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8ZwAKCRAk1otyXVSH
 0Fr0B/4wZMN1jN3fHRdwE1W1kQK3iCOwoQ4Wdk/P/GQWrK0U2e7fVUWAkUJvdd9hCc6Bk3fIk3T
 MSzzgV5Lbb8ObQvr2CmrR/7SKzDOfInspxZ0ik07JKpQi/jmvYsIPMkAtUK52GuBMkVKWlvHHF0
 2YZSLXTZn2HE2CFINvMJBoUmXZ+AzT34SHCrZvT1IJmzpYoJWBSuSFk2c3oHlTnGk+okrcjPnHc
 6+QEAo/fo9VoiKn5n9nRxMKGIp+2VuRnwP2H3BRb9bKgGuQwIPTXOeO0tvCYZv3aDAszEg8VLDo
 rqsehY1DJNNNhP40HYzH5m9+k7lJpEDpiBmaS2l+JX4R1rmp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_154250_448822_8CB1EF28 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

On Sun, 29 Mar 2026 19:14:05 +0800, Felix Gu wrote:
> spi: stm32-ospi: Fix resource leak in remove() callback

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: stm32-ospi: Fix resource leak in remove() callback
      https://git.kernel.org/broonie/sound/c/73cd1f97946a

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


