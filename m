Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AE5C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 23:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mkw2ozZY1Mo7jsuI6tkydXSVhLTGH/6y9oFCam1vp8=; b=FyxBO8qdo13yh8JDBlRGFk/a4Z
	gQ6T4SP629ey+UL1BW+Hv0526qpLO6/S96y3lM14etn71DdVxfon8Eo0rcWb+L0Cba5r+P9qxt79+
	Bz2Px9F4+HBKuwhgHu7l3zSiLE7A+bRRMr/ROEnbr+CKt6LzKVREjSP8UjI6/Fq1v20jI95/v6S2L
	0RXCRvsbGi+MTQ3JwX0HAWch7cejoRblPbX7WigGhKaxj20CxOg2fPmVCHnwV8yQ8BwC/y8LbVBSG
	6DVdAprhWbeiuQ4EVFI7sjSCTj6MAASSuqy0/S320s6rPWTw1ld8EawTTysLreAVHo41sKaHjFk2B
	fJEWdqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpwWg-0000000Dibp-00yR;
	Fri, 31 Jul 2026 23:20:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpwWe-0000000Dibi-34Dj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 23:20:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CEE33600B0;
	Fri, 31 Jul 2026 23:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29721F00AC4;
	Fri, 31 Jul 2026 23:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785540022;
	bh=8mkw2ozZY1Mo7jsuI6tkydXSVhLTGH/6y9oFCam1vp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DHgVz/tiNc6xVf5ezGNzvzmeT+JpI7/q4uW8guJR2XDc7BSs3BtWb7liSZxMFca9b
	 wWUfKP0nMTXvV1KofHwNnG13K5hTuImnRJKl51J3hQU//ZAyMqfV9IRdLcqIAuM12b
	 1FYwUgT1lGhZPgvAZJmRMg+zNNhf3Xi9zzdu6CeBtLdbtIL7TrD7zVznoQpoFewnG4
	 aK5Fv4YBNYSDdrQRXuYF9Cw/ozgjg5gwJg0zCNMiTU+OcUgHh/JToMhpauEBZaodlQ
	 go4OYqzjKNnzQR9C1ir6yZLqOqKIuqiztiyEnGz6Bd0tHuCGC+qjfkmrLSRA9NZe93
	 J/3ijLG5qI9hw==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 cwweng@nuvoton.com
In-Reply-To: <20260731023818.1626075-1-cwweng.linux@gmail.com>
References: <20260731023818.1626075-1-cwweng.linux@gmail.com>
Subject: Re: [PATCH v5 0/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI
 controller
Message-Id: <178552979126.353541.328189267219361170.b4-ty@b4>
Date: Fri, 31 Jul 2026 21:29:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b1jbsBN8PVKIk1W1VVQJ7Hb77/au6VADIXZdL/L1c3o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbS2zeX6rISPNvKpyKp8c1RxviMtHppXNrokSt
 /Lu6u2F/TKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0tswAKCRAk1otyXVSH
 0P3DB/4ksrqYeNau7j6Rik9hG10h9oSsTDlcGayjNIyj4T0B8peFSt6R3SPT+xPDawU29cJghuQ
 JEBbrI4r9t/UUJ0Hx55xY2RWhal9yqvg/+fZfWn2ZVKmalVrsZTJ4bU2G/VrOZmuUsef7NGBIWQ
 Waqnwvbb0FtBUegUh8+os1CO0/N+m9VsAAZCZf66WBbLjaR6LxuspN4vgHJOAiPC0j+BZo7vSGj
 MJI/9oQs+m7Atu8eeESvA9F6oj3sNJ38BDOnSr7/7KZtwNvYZCi1YlJiMbeaMI32T40PPNwrpvm
 p1W/tywBqEwINGe075qcmt14qMlDydHLpTxMCTG7Qwp9DqZ7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Fri, 31 Jul 2026 10:38:16 +0800, Chi-Wen Weng wrote:
> spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller
> 
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add devicetree binding and SPI controller driver support for the Quad SPI
> controller found in Nuvoton MA35D1 SoCs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
      https://git.kernel.org/broonie/spi/c/d458c752cf6c
[2/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support
      https://git.kernel.org/broonie/spi/c/78b16af159ae

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


