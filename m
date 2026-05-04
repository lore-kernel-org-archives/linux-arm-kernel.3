Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C34FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PQ378d9o7H5N1+8GUuYPcKWrb4gn5Q8tcRcYZqt311w=; b=1zm7adejD8IoES
	vHxKM3SSWq5i7nIM3+ppwCSR0zND03EvPuuiA6mhWQoQSU2hfqYQk4FvC3z0NtI4Zrczd4dACpNSr
	W9+akrmhTpttE8h5VXCtX/3GTmdYOJDYQ/0IlWbRKqXX8GFvXn9n5JGjttmcDrC2BsrjrFdS+l+9n
	nfBVJp/8wFT6ytqT2bDIjniAZlcYMTls5b65vCNTz/3w41zv6LVwCWdhO/UGdBOvz7hgosGpsJWC1
	u5Av1+5HYTCOINgmNkKxyzTdtxQAgGiTUbG2xAdxAh/RlG8rVQKRBu9BlroFfzL9ZWLLNE/nCqLNq
	sgWGQ7srlNNglyqbwcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx0w-0000000Dpe2-0S4e;
	Mon, 04 May 2026 17:23:26 +0000
Received: from [2a03:4000:b:d08:14a9:1bff:fedc:75ad] (helo=mail.kernel-space.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx0t-0000000Dpd7-26JH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 17:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1777915001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PQ378d9o7H5N1+8GUuYPcKWrb4gn5Q8tcRcYZqt311w=;
	b=JbGZhkTyI5QdiCnqPvVVTRsIwbEU2Rv4g183GN2CbnSjqkYob2OY+DS9Ra05iYKpCo5VMg
	33X2+1xpCU+hFvr8GEQZA8rVhcZpmqTLdQT1KmKTVEpW5SYbqYCjY12odieJHz1mSJWfj6
	wlMGAtOtVQdlt0HnzsfgSq8b6GF2ZCM=
Received: from [192.168.0.2] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id 1d6530be (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 4 May 2026 17:16:41 +0000 (UTC)
From: Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH 00/10] add mcf54415 DAC driver
Date: Mon, 04 May 2026 19:16:38 +0200
Message-Id: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNyQ6CMBgE4FchPVvzdwHBk+9hPJQuUpUlLVYJ4
 d1t8WCi8TjJzDcz8tpZ7dE+m5HTwXrbdzGQTYZkI7qzxlbFjCjQAjgD/LAD9mMr3JViJSTeQQG
 GV0pV3KC4Gpw29rmKx9M7+3t90XJMTGo01o+9m9bLQFPvvx4oBqyZMGVRSg6CHGox3Wzt9Fb2L
 UoHgX2IHPgvwSIBOeWCGEkk+yaWZXkBsVi6XwYBAAA=
X-Change-ID: 20260430-wip-stmark2-dac-7060f49dd94f
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_102323_832683_D2DBF603 
X-CRM114-Status: UNSURE (   8.90  )
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

This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
builtin DACs.

Currently the driver enables the raw write only. Feature as dma, sync, or
format are not supoprted for this version.

Additional options suppoerted by the DAC module will be added to the driver
later on, as needed.

The same patchset prepares the m68k/coldfire architecture to support
the driver.

---
Angelo Dureghello (10):
      m68k: mcf5441x: fix clocks numbering
      m68k: mcf5441x: add clock for DAC channel 1
      m68k: mcf5441x: setup DAC clock name as per driver name
      m68k: defconfig: update stmark2 defconfig
      m68k: add DAC modules base addresses
      m68k: mcf5441x: add CCM registers
      m68k: mcf5441x: add CCR MISCCR2 bitfields
      m68k: stmark2: add mcf5441x DAC platform devices
      m68k: stmark2: enable DACs outputs
      iio: dac: add mcf54415 DAC

 arch/m68k/coldfire/m5441x.c         |  21 ++--
 arch/m68k/coldfire/stmark2.c        |  42 ++++++++
 arch/m68k/configs/stmark2_defconfig |   2 +
 arch/m68k/include/asm/m5441xsim.h   |  40 ++++++++
 drivers/iio/dac/Kconfig             |  10 ++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 200 ++++++++++++++++++++++++++++++++++++
 7 files changed, 307 insertions(+), 9 deletions(-)
---
base-commit: 8b4b975922f607411217c81942e82f1d206ebc61
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>


