Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D57C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yRPizkJaJOHnqRS2xLNWabqqRhw0N3aV5ZSmcyMU/ug=; b=4FBwMTCd/3aJ0M4IkwHWVmmIV1
	EgHguGoAaEbW9Y45zBCQDo86dTPdbwNjburjJbDxTS6NvvVqljxsyAXSEfWMNe2ioON2fIY+2GAn/
	TuogX/SsoEaeYeYwxM/LUBfzIIpyvuuePgirbdyWjARmEJpM7CXwaf4ALvTqmzHAMZztrKNej4BLj
	l5i42lN+rDAWYhAKKDkoUTcGG9ekhCR+IzfoIBXgywTVpNeb9gPQcufJDfCT6ytuuzeTlnuMCH3g2
	0ir+ByAExzbhelq5kiDAt7rYQ1EfmM6KiS62f9fRF6zXgD0Aq7iOzWByOG/4Rubga50E+jqZqAkAx
	0x+M8oyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vck8g-0000000BMS6-39gO;
	Mon, 05 Jan 2026 12:56:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vck8e-0000000BMPg-1cdK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:56:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7530743577;
	Mon,  5 Jan 2026 12:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A0C1C19424;
	Mon,  5 Jan 2026 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767617807;
	bh=0/FNTDcgirnA9vyGn4Nykw0//mGf5LocBXFpq2GMF5Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eloDyBS1gwcGjMZvlCWgZ546QCJR1rcU1ZQ3lMUxIqmYlpITBNncl9n7nKv7jMTaV
	 ntWJStZ7ttNrc6x9XKpC/0vWXWN75sA/mRt8cS1deBUt+oy1E48gbieiS2LTS1Pvam
	 /CUiJ3b+DeB76/P/7xs0f+OfunCfp95n1iRd9sKNasaHWiWzJTJkvn9ec+VeQBC2dm
	 Z0nnfmOTNNnk+3FRZKskGmd+4bDRraOvLb5t3NIv0qGC1uC6J1Lj+9iL4XxBCl4BHb
	 QgRwYWtuGBYqIrNTox+uIXwXWBZmBZuPD72xgh08qF6IrS+169tUDQDXpBbQzPM8b7
	 yAXvjBsJbk/cA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397C2C79F8C;
	Mon,  5 Jan 2026 12:56:47 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH 0/2] Add Apple Silicon SMC power driver
Date: Mon, 05 Jan 2026 23:56:35 +1100
Message-Id: <20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAO1W2kC/x3MTQqAIBBA4avErBtQ+4OuEi1snGoWlShUIN49a
 fkt3ksQOQhHGKsEgW+Jcp0Fuq6AdntujOKKwSjTK606XFo8LMWD0F8PB3RKD0TD2jWWoFQ+8Cr
 vf5zmnD+qQi/uYQAAAA==
X-Change-ID: 20260105-b4-macsmc-power-d017cc7f53ac
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767617806; l=1301;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=0/FNTDcgirnA9vyGn4Nykw0//mGf5LocBXFpq2GMF5Q=;
 b=pXgNPMu6iKqaJdxxdZ+XZiUEBGctL1+0EGQ1Mf6C7pdzK0+VGMoho8NKfA9cbjoe6FHCZEAZp
 0HXLd6hn9DQAC/1GvyrUcNGyoHIxOwWglVsTCos2RKyS34VGyIPRBWm
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_045648_460299_9E76760F 
X-CRM114-Status: GOOD (  10.51  )
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds a power supply driver for the Apple SMC found on
Apple Silicon devices. This allows the kernel to report AC status,
battery charging status, and power metrics, and modify the charging
behaviour.

The first patch adds the driver itself, and the second patch wires it
up to the MFD core.

The driver is based on an original out-of-tree implementation by
Hector Martin. It has been refactored for upstream inclusion, 
including support for newer SMC firmwares, devices without batteries,
dynamic property detection and improved state management.

Tested on: Apple M3 (MacBook Air, J613)

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
Michael Reeves (2):
      power: supply: Add macsmc-power driver for Apple Silicon
      mfd: macsmc: Wire up Apple SMC power driver

 MAINTAINERS                         |   1 +
 drivers/mfd/macsmc.c                |   1 +
 drivers/power/supply/Kconfig        |  11 +
 drivers/power/supply/Makefile       |   1 +
 drivers/power/supply/macsmc-power.c | 872 ++++++++++++++++++++++++++++++++++++
 5 files changed, 886 insertions(+)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260105-b4-macsmc-power-d017cc7f53ac

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



