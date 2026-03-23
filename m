Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBDFF532C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 00:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Du7EJ0AMhaUruKt74Y0e1pLTXksMINnu8eg06xHD9o=; b=oE7nNCASGjyDHmFxQfv5ND0AAk
	iLClsQF8Lmlk+mqQex3sOEkO0pqGJFHZ8g1x7oPPbD7gYwcs78AeoGpMlFbXGPospTG30HZ3LlglW
	GQYcGmZjk9uGeSrp+tRlfYUnzLNJXzivn+HS/xssTRuZ+2JOseJ0YBlr3MPqVjETqxubcSbzPrmP9
	w306iB8eNK86P2ZiF04b0QqnMF+YE1iA2NyrIhlz1c1lE2kyaFdoD7HQYdth/+7jt+r+kZmp3YeJo
	uL87JwATg0TTBe6u7WD9SbjOR4MxnJ9CFEjBtUIO5ne2KtrOU08GD7A3+kulyLyX0vSL8tKzay9tw
	MKV4+Caw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pNc-00000000DLo-0GzZ;
	Tue, 24 Mar 2026 00:12:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pNZ-00000000DJm-0LuQ;
	Tue, 24 Mar 2026 00:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57682600CB;
	Tue, 24 Mar 2026 00:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F106C2BCB0;
	Tue, 24 Mar 2026 00:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311136;
	bh=ll7WR/DKdUOJ2QVL8D4sjvjEk80f6/hJ+WprFwRSzjQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OQ54V7zhU5FhwgkZcm1E/qa6zovCBprdKLppVbHoEnyswe4s6IeVK52k1wISMZKVm
	 xA8V/zs7e6ELV9fv6/LrbFO4so2AkWP/bTmeKk62UiSXOAVgLAk2BpbVUqRCrt8AGA
	 Bl5CgctdbHJtDyYxFIrk6s5wlRPKZy3VX9irmzBmJLpJTaquu3mbmdMMCNqPHY8Ksx
	 VZta93Zb67xn/JFHqQeMzNWwU5n0pNwg7rRal8YSicJrFnHsTirbACLys/dOIIVmLS
	 rii4hmkhcC4Si9L4w3V0gPiui1DZpNn4+fJ23xgc1VFI+T/lqegimOmG/dM1sO6OPK
	 nnkeM3mCTNEhg==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Dongliang Mu <mudongliangabcd@gmail.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com>
References: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com>
Subject: Re: [PATCH] spi: meson-spicc: Fix double-put in remove path
Message-Id: <177429077139.537498.16954848852263952907.b4-ty@b4>
Date: Mon, 23 Mar 2026 18:32:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ll7WR/DKdUOJ2QVL8D4sjvjEk80f6/hJ+WprFwRSzjQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwdbdXEUPKj8ItOqc7xBw6cvRRsFZKImArKwXy
 YCArGlh0Z6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHW3QAKCRAk1otyXVSH
 0H74B/9BC2L2wSmOiH0fUFtlo3LVk2qUS01ix3VKKDqDDCr5x/lnEyVAx1OTErUCLrUdiBzQ3an
 RKelvFWc3HGvQBk/AZDjDfdXdNtKBUx0WzuxP2nsfgZyv/e1h6s/pBVyxogIJTsvt8Ve/xxlxe8
 aiHHM/SnkblFl6tgPtDBX+uFZEk5As094CJpfwxv4MQ3alsd997cmxAPuUPINLqnY/n8dajioV8
 bonk/igKebXqsNXLnXI9pGc2Bo/8scXoHr/urS4J0n9QvEQrb+hJ1IFcmBnqhbZqE/6WH9ItDQu
 Q6m4vDgU+RoVauRthdiKab9R0U4IrPAe2E54Xwd2YDrMVyNb
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

On Sun, 22 Mar 2026 21:29:56 +0800, Felix Gu wrote:
> spi: meson-spicc: Fix double-put in remove path

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: meson-spicc: Fix double-put in remove path
      https://git.kernel.org/broonie/spi/c/63542bb402b7

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


