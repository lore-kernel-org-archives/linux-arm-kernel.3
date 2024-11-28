Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EAFD70DE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 17:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5X9q4hvLNT/dkkVeO6pX0XdR1CsMXfn5cOkxo1RV68Q=; b=qQzr4P3/y3Xvqa
	BZFC8xQEaVdmgfnqP1PebMdmDlf6GgaurqEIcwAGZ5+v9gdaSZ0Y4jaTJ2wJlsOQ/M4BTUgwrSc1V
	8Ypw7GVuazxXoCBTkJUCLAd5a876LsDksZ1TnFYd2c/EfOj/hLI1g5V67IFHOqIOVlTK0AIUtbBXm
	JEUO+ElEQjLx8jJGvlE7I8nL8DMmxppk6ZOAgyuH2cg/HWdshvWm8cQmeU5QztqmwVC/9vf9DNJiC
	uoRyp/NtZfaQA5XwQROX7qE2kixeaPe45pZ6JqsyQ/VlM4+T+sa8e9QUJYoLyscl00Zf2DEBTpfhk
	VLyUHXHVBeI2d3BL2tAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGia6-0000000G6eQ-2XeA;
	Thu, 28 Nov 2024 17:45:34 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiY9-0000000G6Fn-1WjL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 17:43:35 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E7286A0776;
	Thu, 28 Nov 2024 18:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=5X9q4hvLNT/dkkVeO6pX0XdR1CsMXfn5cOkxo1RV68Q=; b=
	RVenKOYJm0spgrKAgT3B6D1OAcck+/hRYSPx1G9Atd8YSV+G/L5KuVYX5kzqUs+o
	7z0hhmzhOSvJ8Vum6HC1CWmwiSd8xex4Ki3baU1O6AuKRCw7fv7d9oYXR5jSPmJQ
	S5AZWFO1hQUcua5enkJdmcB0OQnisn5pHbxTW3yBy0DRd0Rpl4eupojVftULiImD
	HXXPLDmYu9o/R0fxkzsOayDNdq3c2q+Pr35XNzPw5aDwVvOQHshV+AupsTV8C9Xk
	IGsHACapxW8HCkpgrrgFTAOzd7kpK8lXEKfGxNl1DE3dT98Wtbp0aLEk1mVxnYI9
	vWAkos9FUFbNXQCJIZfcr1ZZTcnsyJUTn3kIuYa6aw8XbyoWWejxmcxULe2iB7Rz
	ldPr7TBGvvrZ5e7xgZmc3IfMyrwJxQUW3nlX7XBW7KwEOrvbzgMgF/M4Dl80p39M
	ORRjUQKJUV0pxfWertNR2VGcXNZ/AME5W6QJJV8y6RnhdYZAPKun3jSbG9YbsGGz
	lqBZ8//bCAKnnqaX3PyAHfFJTN7rehz7OlD8LjCO+/1HCg3ZU3DBngoQ+OuAqC7R
	98l2CJ2+tX8jZGw2jNB+ZjAHve4gbO/wk7882rvQHpASNFtEAXlXKg0Hc1Yx73eZ
	avEJRoQd8z5kqjtYnhNg8FaQbJiBprg9Z2M2aAYEQ64=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] spi: atmel-quadspi: Refactor to allow supporting SAMA7G5 O/QSPI
Date: Thu, 28 Nov 2024 18:43:13 +0100
Message-ID: <20241128174316.3209354-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732815801;VERSION=7982;MC=2811862659;ID=123204;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855637665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_094333_855092_48A96D37 
X-CRM114-Status: UNSURE (   7.19  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This is based on Tudor Ambarus' submission from 2021, and my refactor
of said sumbission from roughly a month ago.
Link: https://lore.kernel.org/linux-spi/20211214133404.121739-1-tudor.ambarus@microchip.com/
Link: https://lore.kernel.org/linux-spi/20241030084445.2438750-1-csokas.bence@prolan.hu/

This time, I submit both my refactor and the diff between it and the
original submission, rebased on top of Linus' master, namely:
commit 7d4050728c83 ("Merge tag 'vfs-6.13-rc1.fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs")

Tested on a SAMA5G27C, we'll soon test on a SAMA7G54 we got from
Microchip for this purpose.

Csókás, Bence (1):
  spi: atmel-quadspi: Create `atmel_qspi_ops` to support newer SoC
    families

Tudor Ambarus (1):
  spi: atmel-quadspi: Add support for sama7g5 QSPI

 drivers/spi/atmel-quadspi.c | 925 ++++++++++++++++++++++++++++++++++--
 1 file changed, 874 insertions(+), 51 deletions(-)

-- 
2.34.1



