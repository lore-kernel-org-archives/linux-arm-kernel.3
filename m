Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA290FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o8u8w2UWcyZeZiwf05Vd1PKU6i5IHTCnVEoz7yLvk1c=; b=KioJJpbEs2NLvuoigPnyCPkxao
	liUcPRh8JP5TcLWP9UwUfNRC6fRP2ZbIaYaqUhNLc8o5EHYyrQwOS003b/MLm4fSEa5oSOl1jGnNp
	f1y17RiUQF/12Z5IYKODpbJatKwpkuunhNSeu7IDqPowaR/gtCRBmgt2CRXqGcpOToeWxmjrmm6b/
	D/V/1W4F53NyQAPL3wEWI7ZgBYPWEKvSnYE1EkihuePvBllDES8fcNyF/vhbNZgbxVVtJKMY/XmPK
	KDJ9H+MbPBqTXFaiaAIll0H6d6zezG/0B2RU/yagN2Rrpeeru65UUSuvPVrqUa5dK6ZDR02M6gv7z
	ZqylEjjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITkR-00000005gZp-2V48;
	Thu, 30 Apr 2026 15:56:19 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk7-00000005gDN-0Oxy;
	Thu, 30 Apr 2026 15:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=o8
	u8w2UWcyZeZiwf05Vd1PKU6i5IHTCnVEoz7yLvk1c=; b=fnEcgzN2VFnVE3cMIH
	9ZUq5Q4C0+a+IlpYW+iGSTDe56JVGkJLGxSXC3uPO2+P+5p5N6L6UibBwGRUG3v1
	PV843Fz76Y+g8t8cRBuYMH6XK7KNltgmjSRbGADxjZrcUIcAM/DFDizXvFLFpxdP
	YGE/Q2KsUhdvyJLJ3YRE0mxfU=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S2;
	Thu, 30 Apr 2026 23:54:59 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: broonie@kernel.org,
	sunny.luo@amlogic.com,
	xianwei.zhao@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	lhjeff911@gmail.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 00/10] spi: Use FIELD_MODIFY() for bitfield operations
Date: Thu, 30 Apr 2026 23:54:46 +0800
Message-Id: <20260430155456.36998-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw43GF18GryUWryrGryrXrb_yoW8Jw1DpF
	4fGFyxZw4xJ3yYyF43CrWYkFyaga93WFWqg3W7twn3ZanYyFyUXrWDK3WrJrW7JF97GFWx
	KFWjkrZ8CFs2vrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi1SodUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BRL7mnze1RXzAAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085559_458648_F046977D 
X-CRM114-Status: UNSURE (   4.80  )
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

Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
macro across multiple SPI controller drivers. This improves readability and
adds compile-time checking without functional changes.

Each patch modifies a single driver, allowing independent review and
application.

Hans Zhang (10):
  spi: amlogic-spifc-a1: Use FIELD_MODIFY()
  spi: amlogic-spisg: Use FIELD_MODIFY()
  spi: cadence-xspi: Use FIELD_MODIFY()
  spi: meson-spicc: Use FIELD_MODIFY()
  spi: nxp-xspi: Use FIELD_MODIFY()
  spi: sn-f-ospi: Use FIELD_MODIFY()
  spi: stm32-ospi: Use FIELD_MODIFY()
  spi: stm32-qspi: Use FIELD_MODIFY()
  spi: sunplus-sp7021: Use FIELD_MODIFY()
  spi: uniphier: Use FIELD_MODIFY()

 drivers/spi/spi-amlogic-spifc-a1.c |  5 ++---
 drivers/spi/spi-amlogic-spisg.c    | 13 +++++--------
 drivers/spi/spi-cadence-xspi.c     |  3 +--
 drivers/spi/spi-meson-spicc.c      |  5 ++---
 drivers/spi/spi-nxp-xspi.c         | 12 ++++--------
 drivers/spi/spi-sn-f-ospi.c        |  5 ++---
 drivers/spi/spi-stm32-ospi.c       |  7 +++----
 drivers/spi/spi-stm32-qspi.c       |  5 ++---
 drivers/spi/spi-sunplus-sp7021.c   |  3 +--
 drivers/spi/spi-uniphier.c         | 13 +++++--------
 10 files changed, 27 insertions(+), 44 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.34.1


