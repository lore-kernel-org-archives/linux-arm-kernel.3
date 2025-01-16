Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54BBC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKn1FYerABDRxU2IGNUMyctJwGzKXnWiMDFTa4RkomA=; b=pp5acMfPMdwN4K0lrVpQlxY8be
	95mIuPhg1AWIsQRFMg9yM442CFjxf/EhboQY1h8cT6LGVy+bKLJawocOQmOtCoXYn+j4cbvWSZCf+
	HMuVNyeYIk3SgBVHtLy3IBgXtlSG79qcHwdYQ72Bb7eb9wcq7Wl0p12dTwcQnJZ9+kC90NXYN81qR
	omc1YylF+N0P8PEZMak6LMkArugh73KtNLCnTSk11BNcqkLKLj3/lkOvbCz4Tyi+uHYW7Jvs4336r
	EOsfhmJUr948gs4XgX7pf2f6/6anw9UaHt7y6chp8+Is7coYQcIYQhOg/JHrVMfd0JEYOImE/kIEs
	oTPPcsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYcf-0000000GEk5-339S;
	Thu, 16 Jan 2025 22:45:57 +0000
Received: from out-184.mta1.migadu.com ([2001:41d0:203:375::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYYs-0000000GEBK-0sfT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:42:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737067319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKn1FYerABDRxU2IGNUMyctJwGzKXnWiMDFTa4RkomA=;
	b=w5EAQ6xc30i08qaqnUgk6SKSMzDHukNhmSqW4ueaba1oyf+9CXNVSUBkFZaArvIsgP824C
	NOelbDcTtpRLXDag+l6swHrdu7Oj6ZWgp+JwJ65Ny64/j/Tro+JcM6QCcrlN9CK2JzN5Ot
	xRBfgpoDTueXskQ5BPHNtjtmWUxfKgA=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/5] spi: zynqmp-gqspi: Add some more debug prints
Date: Thu, 16 Jan 2025 17:41:27 -0500
Message-Id: <20250116224130.2684544-3-sean.anderson@linux.dev>
In-Reply-To: <20250116224130.2684544-1-sean.anderson@linux.dev>
References: <20250116224130.2684544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_144202_388531_FC195723 
X-CRM114-Status: UNSURE (   8.72  )
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

Add a few more debug prints to make it easier to determine how the
device is programmed.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 0c3b3a16bb36..79dd1d56d05c 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -580,6 +580,8 @@ static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi,
 		zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST, config_reg);
 		zynqmp_qspi_set_tapdelay(xqspi, baud_rate_val);
 	}
+
+	dev_dbg(xqspi->dev, "config speed %u\n", req_speed_hz);
 	return 0;
 }
 
@@ -693,6 +695,8 @@ static void zynqmp_qspi_fillgenfifo(struct zynqmp_qspi *xqspi, u8 nbits,
 	}
 	genfifoentry |= zynqmp_qspi_selectspimode(xqspi, nbits);
 	xqspi->genfifoentry = genfifoentry;
+	dev_dbg(xqspi->dev, "genfifo %05x transfer_len %u\n",
+		genfifoentry, transfer_len);
 
 	if ((transfer_len) < GQSPI_GENFIFO_IMM_DATA_MASK) {
 		genfifoentry &= ~GQSPI_GENFIFO_IMM_DATA_MASK;
-- 
2.35.1.1320.gc452695387.dirty


