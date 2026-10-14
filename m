Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F8FCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6z1isC/eee5gYCmJDxquHWAba+jHPDsxCgrS5G8o0g=; b=E47ZiuqvuWwRH/6d4RLmzM4SH7
	ritfsmiUH87/vEGnrKWS+e/tZOE3mXzurXQSN6NB0Xl8X0hzGe+f5/apcbvUuRY7eoJNXgMrSbNGe
	Yr3qn0cSr9s00hiMa2OxdxbVE9LOd6Hy9KOQ/wkxXdCyrtQW/WBzGe+Yk2kl/A5D4mDZaIJK8iNzQ
	63JOST5obHc+2rZWhKBXnU5OZe6oYqJKG1ioixzmRMQmocBJ+yWH2os7Hq2Ws7V156GlKpuYI6SjN
	xQdy1i3qvDoRzzd3p0R9g6n7dEz/Q4rGWbGBuIWehP8cKjVEtHEYNZQJ2jo2jGmZ2dd3OihPLntxV
	2YDyjicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt5s-0000000Egfo-43HP;
	Wed, 14 Oct 2026 07:08:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt5r-0000000EgfO-0MaC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:08:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a16c399641so36943285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791961685; x=1792566485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6z1isC/eee5gYCmJDxquHWAba+jHPDsxCgrS5G8o0g=;
        b=jhD4rKF/DfqmEi706znfQH8c9bWkLmn3HN2jpzgBj5M5RqxcJ7cwtGk1flYwU5fIJe
         yIPNr4oDRlV8jgzwbvToZYiLfV5X9jN/pbmb3wnc48HbhS9vU153M1lWq78hrrErFtrY
         BdN+BM1DNpgG//zdfhP4bTm4RMR+4PUDwX46ZH5nubI0pjE+1ioEuwBlkzqfcKRikbPa
         l+BlfGelu6qNmD8XrYrEwO4afBtO7WCVSJ+e+x7KBovGdoqtHmtPTDZbGhj2sbAmYKql
         xIOPE+WWw9bILDu1mHa8tfYYM50oN27bpNVApiNHI+lMNPT/oRd2mr2EalkWR+qjF+Lp
         ldoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961685; x=1792566485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6z1isC/eee5gYCmJDxquHWAba+jHPDsxCgrS5G8o0g=;
        b=jLkU/oFxqEdXnuB2vtD5lTER6p7NyUR3yyLzSYYMVb2oVZvhdIN0zcRzEt5clNnTV9
         DwYUmt6IQPbZQ8izNOcYd5/LsuuqMNNGitMXfrj2BIhSHjsBtEcJR2z07WnB+xgIkQDu
         /7ARccpiXNLcAh2efvSrErgSN8uVQjG1TZyXbWEYFD4zR8LSWbY/t9ux6um7Ntb2I+m3
         AvmGzEzxIO68LSooUqk2BeLEt8THgqRfcocf7xsNablWDdDLCpVxravuTHLAhFxxIP4Z
         TGfOG4rlaY/UGIo8AZlZGQ/Jj6c70zFKZjDCi0cZGbo5Uhz6jqD4gJ7xnyVTarWq5Nk/
         +z2w==
X-Forwarded-Encrypted: i=1; AKwUvBwMuQPVDXbhvT+dVGSrxVCGqsrDlstt1avvxfMdspPlC3VdPz8Z/P+OyYAaQRlPM0Yg3lVt3Wz7q+41KVbLUfBO@lists.infradead.org
X-Gm-Message-State: AFq9FYIEer6fWRH813Z2t2BvSKEqR/cNQgjE0p4YfV4WeixtMQ5sy0DA
	ASYUH0dslea5ADsHqRXSrf6LP/JtaXMM6O26Ql3iSW996LJHO8AzF25B
X-Gm-Gg: AYBFou2FS8kBN17TEAWRJ5Qj/Bw7rpFXRzHMfzN+Pt81C+zBjzeZYM5n3ZJvtK4zu5H
	V9ELuf+ufnAakG7qD0rmNBAzUOTzjqY6mbxDMDnsCybC8s9QNPauMX/DtVh7lo5edLZL6AM4JGp
	yM7xyWCL54O7L1Dlh7slubuwqasDoAY+wOsOlwUtW68VyTbilnk5Dw1agJtxUJ8Z5b4nW6WwD4U
	kV72hp2j/1y0LY0yJ1PoxDNgKNAbYAsOp570W6YRXfsgRks80dIokZk8mqdd1GuGTWblrWVCejD
	dPFLWAn40rhMv9VL9fROk4mHJwGzARYvhGe445Wmzhud/vVEa2DxLCjZVI8DUf6dO2vgWgCCmEL
	WOyoZISVWJUwEQjXZrOvH1FkWtsoGU2oAjgF33FHyn8UwJRNylLqBIEWdbKBC6qkIg8xD3u5WTb
	zsg6hIY1vX3PUjAdgrMxo0QgvCt60U2x2f1R61I6SVv9aXec87OHHQIRWE4xywTEyw04jLp5fij
	ZCvQ8RdLPmjJPfGnA8arrUAnuiVQMvRBAmqw5ce4Uz4Dc0EEWVPuXvP6p2D8L/ZAsuqOpmi+LQ6
	KOK9VVggTtNyEGFMQn4JZiReTqIG6eWRcHfgPenK8AwdoDCmr5StFU0X0dUQdg==
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a18e4aa206mr312597135e9.27.1791961684668;
        Wed, 14 Oct 2026 00:08:04 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b3615f2esm32217945e9.1.2026.10.14.00.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:08:03 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 20/24] spi: Add ZTE ZX279128S SPI flash controller
Date: Wed, 14 Oct 2026 08:07:58 +0100
Message-ID: <20261014070758.1717896-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <QRsVQG8CQny06omTkaluXQ@gmail.com>
References: <20261010130024.177503-21-ghahramani.navid@gmail.com> <QRsVQG8CQny06omTkaluXQ@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_000807_167101_7C1009FB 
X-CRM114-Status: GOOD (  10.81  )
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

Hi Stefan,

Thank you for pointing me to your spi-zx.c driver and for the detailed
explanation of the PIO vs IRQ vs DMA trade-offs!

I tested your driver directly on the ZTE ZXHN H3600 (ZX279128S) hardware
running Linux 6.18.55, and it works flawlessly in PIO mode:

  zx-qspi 94406000.spi: ZX QSPI Controller driver initializing
  zx-qspi 94406000.spi: Cannot get RX DMA, using PIO
  zx-qspi 94406000.spi: Cannot get TX DMA, using PIO
  spi-nand spi0.0: HeYangTek SPI NAND was found.
  spi-nand spi0.0: 128 MiB, block size: 128 KiB, page size: 2048, OOB size: 64
  10 fixed-partitions partitions found on MTD device spi0.0
  UBIFS (ubi0:1): UBIFS: mounted UBI device 0, volume 1, name "rootfs_data"

MTD partitioning, UBI attachment, and UBIFS read/write operations all
completed cleanly with zero transfer errors or ECC faults.

To ensure the driver works seamlessly across both the ZX29 (100 MHz bus)
and ZX279128S (125 MHz bus), I updated the clock divider calculation to
dynamically query the controller clock rate via clk_get_rate(spifc->clk)
rather than assuming a fixed input frequency.

In v2, I have replaced my separate SPI driver with your unified spi-zx.c
under drivers/spi/spi-zx.c, and updated the DT binding schema to describe
both "zte,zx297520-spifc" and "zte,zx279128s-spifc".

All other items you raised (splitting CRM DT schemas, simple-mfd reboot
child, logical reset enum IDs, synchronizing clock/reset locking, and
isolating the PCIe SerDes into a Generic PHY driver) are also
implemented and verified in v2.

Thank you again for your collaboration and support.

Best regards,
Navid

