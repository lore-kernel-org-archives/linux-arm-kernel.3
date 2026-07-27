Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BAEC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R6lF8RNa+JcYURNQxf37EbYWdyUKC9TqlnjfVT8UzK0=; b=rv4CIPOa+bouQdfgp/tU3aZE+8
	HueHA7FC4PbynstRD/hXG0lnHO6TmfWS0Mzzb2sJL/i4LKBrW/RPUcDdqP4Bp0SBM2IgWzgCtTX/T
	bN3Z/53so6xxeqLGMAFnX6qO00/Qqw179WjBwb+X30PHs+atmhhRRD3Rm9E015kiRA/3ISDoxyjzj
	rL7m7pKnEl7+U3F/GLja/zy6QPuoICzyAbdPEuP0Pi52zduVvLtgcFTNJ2+5XJHs5SDjBoIzOrA6u
	zUAvUVBKsfQfI7nbOm1uy5qYTPaG956B6mDf3rRNXSsTMzQEWCgz1CMjIlRA5zVW2/xY49C73so++
	fAzVe44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHVL-00000002JYM-3rw7;
	Mon, 27 Jul 2026 09:20:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHVJ-00000002JXT-2JCY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:20:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84861fc51f5so1779570b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785144008; x=1785748808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R6lF8RNa+JcYURNQxf37EbYWdyUKC9TqlnjfVT8UzK0=;
        b=NJ/uebEObjoHCJp0Hl3RopMgAe8UvuOdecdK152LwfaaasaYuZ6sW0j8MivdNVMG1/
         0XJhdQN5eGfev47Za/hKa/WqAPMIIdiBIm3cPyUtd1jyDCfRtHGqvRvQ5dgVyrpXwIoe
         rEeQ3r4aCaOnka7Yw+92rSbPlCKx2/fz3PPw519Mdp4Qb9OTVDS9cpKWzXvF3QTQodMs
         whNmhgviPtWYf0IrZOQeggUfGs2L7LjXduDI7/59Hplu3SJGctW0RaY05oiU52Sn6C+S
         Xs5QzIiyXtcFiZw37yHZAbmX4JRfVcRzHmec9PM9aaAFi5hxx6qt+0VocCfBhg61h67A
         59Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144008; x=1785748808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6lF8RNa+JcYURNQxf37EbYWdyUKC9TqlnjfVT8UzK0=;
        b=rmdWbqWg4k/G/aACF+bcnGF6G0Q0nRg1n3eI/53tcDvsRUO2eOKzhGoh301egiJxni
         TeNJXIs80bP+KcufblENQ4gGi80h0+KJ9FdRf7UFigvhRvoURfFGlGOre0Gb4FmpTeZq
         afb9wHfqrPIf+XxCW3KZln5Jbs6KMkQe/NCNHCN/JyMzwObG4KsChrARvrpKIFvw2CJT
         xxK9GwLtSktt0YOu80mh96x/9X8bM09bREWGqz2cKlJHkzPfnS+JB+yeHGrTRRg5Tppp
         a6DJ7VBaaALzvIN/kWJl+6vnhPZdI68MH3cuPG630rPHcBcYFsNU54yVqbyhcu9bmHgJ
         fUoA==
X-Gm-Message-State: AOJu0YyYyTOMo7cayfRDUKNJTQwo2Ne5TDFLtBvDncWBvyaaNeCvQNqd
	wFcna77QvShPUcaNqzfXARUwfvGMoPnyhLpUI+RP69vREbohVsY0Bdh9
X-Gm-Gg: AR+sD12/2XDiuelAWAKkfphwGeNcpaGm4E8YA6qVQ7tfBnray844gFW4m4QsK9PkFo/
	jr383jBpiyK7VCVthD+T9a9ua5nAkIH7/ZaJgy30a1Mux87Xdrn6xBH/J/YKbR1qRKIFUXuwt+l
	kyoMc4LmPx+GnyEEGo6f5zZzdWEwxZWkmeB9wridTaktfv7bRr9+nQnLAcR4bq89s6MQAzF+keF
	TiUgkHerMnbbre5UfLIoc4GRH4inoc8vA0Fr43zNCbzvhy8gK6LS/r58h3hWBfnf6sZzp2sSfBE
	5H8MKYzRkaNhTCQfD5q3QlZtthTMX8b+96KwCCF7onet85ifsLmg4cNi+pZxMFX0LGfOHCDtM9c
	o5VmdSZVua3be2udggQ9JYm1rjxrA97HF1IsgrKxpi5ha7WWz9Bmh4gLkHfhHTjfvVzG9PoGdqy
	N/lu0LlrvIBIOemW3sdK4AYHqT/ItAu+X6PzecOpG85/khfK9phNi8q00WRkVN/cTD
X-Received: by 2002:a05:6a00:1783:b0:845:d286:1fb4 with SMTP id d2e1a72fcca58-84e5955a6d1mr5974845b3a.50.1785144008034;
        Mon, 27 Jul 2026 02:20:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53253b65sm2802645b3a.8.2026.07.27.02.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:20:06 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v4 0/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller
Date: Mon, 27 Jul 2026 17:18:31 +0800
Message-Id: <20260727091833.750051-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_022009_597051_E0ACB693 
X-CRM114-Status: GOOD (  14.35  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add devicetree binding and SPI controller driver support for the Quad SPI
controller found in Nuvoton MA35D1 SoCs.

The controller provides two native chip selects and supports standard SPI
and spi-mem operations using single, dual and quad bus widths.

This initial implementation uses 8-bit PIO transfers and supports
per-operation clock configuration, clock and reset handling, and direct
execution of SPI memory operations. DMA and active-high chip select support
are intentionally left out of the initial driver.

Changes in v4:

* Added minimum 1 and default 2 constraints for num-cs in the devicetree
  binding.
* Made the driver read num-cs and fall back to two chip selects when the
  property is absent.
* Dropped SPI_CS_HIGH support from the initial driver.
* Kept separate chip-select helpers for the SPI core and direct spi-mem
  paths because their boolean arguments have different semantics.
* Protected SSCTL register read-modify-write operations with a spinlock.
* Limited spi-mem operations and individual SPI transfers to 4 KiB.
* Limited complete SPI messages to 8 KiB.
* Restricted the initial driver to 8-bit words.
* Added defensive transfer-size validation to keep the PIO polling path
  bounded.
* Kept bidirectional data pins in input mode during dual and quad dummy
  transfers in the generic spi-mem fallback path.
* Treated zero tx_nbits and rx_nbits values as single-lane transfers in
  the generic SPI path.

Changes in v3:

* Fixed the DCO mismatch by using a consistent author and Signed-off-by
  address.
* Added spi_controller_mem_caps and enabled per-operation frequency
  handling for spi-mem operations.
* Added a short delay after requesting FIFO reset before polling reset
  completion.
* Documented that the controller generates one RX FIFO entry for each TX
  word in single, dual-output and quad-output modes.
* Added the missing linux/delay.h include.
* Removed unused register bit definitions.

Changes in v2:

* Updated patch subject lines to follow SPI subsystem style.
* Added a commit message to the devicetree binding patch.
* Added ARCH_MA35 || COMPILE_TEST dependency to Kconfig.
* Expanded the Kconfig help text.
* Converted the driver file header to C++-style comments.
* Added reset control handling.
* Added the resets property to the binding.
* Added a num-cs constraint to the binding.
* Removed the flash child node from the binding example.
* Used op->max_freq for spi-mem operations.
* Split low-level chip-select register handling from the SPI core callback.
* Limited spi-mem command opcode length to one byte.
* Forced spi-mem operations to use 8-bit words.
* Avoided driving bidirectional data pins during dummy cycles.
* Drained RX FIFO entries during transmit-only transfers.
* Rejected invalid chip-select numbers.
* Rejected unsupported dual and quad full-duplex generic SPI transfers.
* Fixed checkpatch style issues.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
  spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  63 ++
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 | 658 ++++++++++++++++++
 4 files changed, 732 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

-- 
2.25.1


