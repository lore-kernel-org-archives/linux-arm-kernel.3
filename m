Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9645C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uE94rroX8EBiwoQlcx55oym73p6AyO336Qsn9jN228g=; b=PkN83nw/D+TWF6M3a0+kEYAG7/
	xBgUyXoiCIrTc1ZSBLSK0Ede0Lab1NEOOfhZIg+YaLw6nuGaVOMTM3agd1qkgnWfXH4g/ckQb8fX3
	/7F4zaUaa9LjfO+Rw4+22m/0lBlxTwDdgSgbgiVFLPjFenEn3Ln43ZTiVCA+KaYcpV5COAVjJZwTn
	DAYdr1FcnPwmOT7QA63fkCLVU1NETP9IeglB316vHfYHONo+axPc1c0IsrfsqpOh+GIuXzKhyMCZX
	zwey6Z+0eJstCVpu3DHDOKoEyeWnHfVgOhoFi28NVNAPVtoq8FYQUf43m3GFVcs0jLuuVva7/RsNy
	oO3Etrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHbj-00000007coW-2ukU;
	Fri, 07 Aug 2026 10:15:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHbf-00000007cdd-0qYS;
	Fri, 07 Aug 2026 10:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uE94rroX8EBiwoQlcx55oym73p6AyO336Qsn9jN228g=; b=czVued0ntlX6Okt5bPv2elwAmF
	7NiHCLDfbDr6E7vG/VIyxepsHt6LMeuPsMOO06Rb/yIAG2Sp4NyuviKzxOC7/pB1SnHrM0JHbwG2Z
	U/VOW7tNpAKLlG7tUV46TAFCKhgIahx4j1HAtK6eowdP/gj90n6ZEdCXFBomnwAsgp067z2WfddqU
	gWzDpAdN2n6IgZ70iLcZ1HWWxPaqveHXjhDtYhzPEdjifdLJTjkBiBe8x5nUIDKOSF72q2n4NExzl
	JPQOHQ2/NuNcnDJFYe+ymLid38ugEGftaHZ46Ezl/gOGSYQhd9jlGlSATe4YS2gWrbd/EpiFxYgya
	heXOHwOA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsHba-0000000CH4f-1owS;
	Fri, 07 Aug 2026 10:15:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C59BB1A149B;
	Fri,  7 Aug 2026 10:15:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93E5E603F0;
	Fri,  7 Aug 2026 10:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A381511C37523;
	Fri,  7 Aug 2026 12:15:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786097708; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uE94rroX8EBiwoQlcx55oym73p6AyO336Qsn9jN228g=;
	b=ncdi+6M/vHl7CmAZhQitAXVwXqbFGmddhJtzKy87uaF3BjNh3A7KmHiLIQ4IwLBPOfvRRr
	sDY18D7tbIihlf+NYwunwIedt8XEyxn48nxNn256CCVGsaPhxB26IZUnrh7MFnzR+AxiMz
	pDv+IHsjLOuLoQj3Us5veRoZ3lEjZcBp8Ktk6fUU/rW4atunjHywTdW07xjE4sMM/v2DLV
	lPOAtzTOQI1xEu6Zp764103susIv5/BqoY73NyzmwOF3og97t5s+1tH1Zh7Qv+9Q3i7cQj
	q/8WexHPYqbzpxhl8DUPYUz3xhgbWK5KwWJr7iBKxqat5xrsIo5wuT1pRckLvQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 12:14:10 +0200
Subject: [PATCH v2 18/18] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-18-7797642dfc40@bootlin.com>
References: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
In-Reply-To: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111510_597860_12F65140 
X-CRM114-Status: UNSURE (   8.23  )
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

Expose Status Register opcodes based on the flash capabilities
discovered while parsing the SFDP QER field.

Value '0' indicates an absence of opcode (non supported), we do not
print anything in that case.

The QE bit is also displayed.

Example on a W25Q02JV-M:

$ grep opcodes -A10 /sys/kernel/debug/spi-nor/spi0.0/params
opcodes
 read		0xec
  dummy cycles	6
 erase		0xdc
 program	0x34
 SR1 read	0x05
 SR2 read	0x35
 SR1+SR2 write	0x01
 QE		SR2 bit 1
 8D extension	none

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 512825c3fc85..ec5b87861539 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -106,6 +106,21 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	seq_printf(s, "  dummy cycles\t%u\n", nor->read_dummy);
 	seq_printf(s, " erase\t\t0x%02x\n", nor->erase_opcode);
 	seq_printf(s, " program\t0x%02x\n", nor->program_opcode);
+	seq_printf(s, " SR1 read\t0x%02x\n", params->opcodes.read_sr1);
+	if (params->opcodes.read_sr2)
+		seq_printf(s, " SR2 read\t0x%02x\n", params->opcodes.read_sr2);
+	if (params->opcodes.write_sr1)
+		seq_printf(s, " SR1 write\t0x%02x\n", params->opcodes.write_sr1);
+	if (params->opcodes.write_sr2)
+		seq_printf(s, " SR2 write\t0x%02x\n", params->opcodes.write_sr2);
+	if (params->opcodes.write_sr1_and_sr2)
+		seq_printf(s, " SR1+SR2 write\t0x%02x\n",
+			   params->opcodes.write_sr1_and_sr2);
+
+	if (params->qe_mask[0] || params->qe_mask[1])
+		seq_printf(s, " QE\t\tSR%d bit %d\n",
+			   params->qe_mask[0] ? 1 : 2,
+			   ffs(params->qe_mask[0] | params->qe_mask[1]) - 1);
 
 	switch (nor->cmd_ext_type) {
 	case SPI_NOR_EXT_NONE:

-- 
2.54.0


