Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EB5E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8n7r/jfcoHjwqjMR/riQYWgqVQ+4NAX11Y4fwWc1eo4=; b=jO09U8lKLCeF/s
	Qf7enuQeWdm3FyCSbZbs68lK4xv611WGwj/rD52MqKqjjHgeSCwroCD1O8ib/RC85DUkUD4rPMpgu
	B305GlPm2Jl3Rlq8Sl0frmel7TvVlc/5AljGCxdhYD7aNnKbZdc9+YPHmbbEqIhANyxmSplWL9FRI
	6FBiLSe7bkgeI101hG2GgbVZBK+DBy2ZzzroTcQP7t2ilR+34MedGJvHjgSZ+ZTDlhBR7rxoYGU1Y
	GchSo1OsHu/zYOQEalTenSlEU+knvRna5lHN93fomI5rjWq4pitwdJ43InPbSdWVKob9R0dW5o10v
	YPcB6vy0Kj+dBHRTqqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Qf-00000004iUJ-1tDT;
	Tue, 07 Jan 2025 12:11:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8E6-00000004f36-1XuO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5CDC5C5BE6;
	Tue,  7 Jan 2025 11:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D09C4CEDF;
	Tue,  7 Jan 2025 11:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736251105;
	bh=so+HujlspHZPsLZPdW8vF7bkAMuF/wBwtDZCcbrPMnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XAT+FU4kNfv4jRQeJpyYObRGMjF5LfkFMWxPDxsUp+ikH7GoO5r1I032/wGEyv64P
	 nt5X0A+yLpbs752WYSZNz+qf0jUnjRgbJYL//LmwkWk73UDbf84aJEKQSR4OoWHlvp
	 XTexbGAdFkvcmy6iIZtMpf7j/n2uGGOmrZQJpsocawJIaiDfy5hGjqSU3LxiAD/E7F
	 h4ZgIJXFmOs7WTf3Sv02TU8Zrr3nj7nhuuHzou/4XkGle6YVR7iLrvtV13JMZw7Ogx
	 R3GKpdFMhivNA0S7N8H8FKk7x2zvkk6sFEsRZL6/CpaNqcrzNkojZQf3dO5D8Oc7rU
	 IzZrr/4yaXhGA==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
In-Reply-To: <20241219142851.430959-1-csokas.bence@prolan.hu>
References: <20241219142851.430959-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH] spi: atmel-quadspi: Use devm_ clock management
Message-Id: <173625110421.23847.10158575651527678755.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 11:58:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_035826_447524_492B8BA1 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 19 Dec 2024 15:28:51 +0100, Bence Csókás wrote:
> Clean up error handling by using the new devm_
> clock handling functions. This should make it
> easier to add new code, as we can eliminate the
> "goto ladder" in probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: atmel-quadspi: Use devm_ clock management
      commit: a38509fd5cdc125ef54562760a05c68ebd4812bc

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


