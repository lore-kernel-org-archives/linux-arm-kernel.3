Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAD5CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=; b=IfYJA+UUoIk7TafrTiF1msuwJV
	/TIAwgrgFVdtMKSoyej0Bu7H/Am/SdLTnkrHe7PBwSUjeecfga+KN0druB+7XoX8ZMpFYucYVrC4J
	GWMB0JJuSZbouYPYaRDnHos9AQQUC5NiDHIKcrrbFZwqIT7FW+v3A+hLomswV9RkFXBkyAwclDoxT
	BjFxo5hsqtEfMbQAnwx7goKgYiqmHrm9JFRRPIFzZE+mT1Lk0JRGVLnwXS+TNXGChw3wKEcv5srAT
	2bNGK7aDPzqnvZvnB51Fq83Gqhwl9o3+ea/MNgQUPeCFC0AOp31BNEApdEUeytc7AmGmWRnWH6AFG
	BMnrUX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMv-0000000GZ3r-1prw;
	Thu, 15 Oct 2026 01:34:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMh-0000000GYUS-1uo3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 01:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=; b=VbtIuhN7QxKEEkBVF4Heq1KF5n
	sZ4Q9RtklQYFBoIfH4Q/fNQlTUQ6JSwv8GAasSDjth8LK8SIlZK9dAh7bPJZv9EwWQoHUP2Eb+u6g
	o9XuRp46yf8L0hUSMSR0QYel+lUaqjG6N2BLBU6bsigkl+6/1anhbFDwkZ+XD6v28ZqZpqt+hlgJ9
	sjcIDxX1Rb2RWblquUQWMlCC2/KS0B2PdjwbkOw50YNvHaqYj4Qat4ixWUhb3staP3PalUyUMr0Jh
	rptmTbetuESZ+G7JeSqP+rO/g+YoRkgZRCDqyvvlzrVR2PXfZIh8XG5yHCDkIaFsnYBsoLWNpMAB1
	VXxZofoQ==;
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHAMd-0000000HLZa-46VF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:38 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6dcf573c429so3038602eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028074; x=1792632874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=;
        b=cvCOjdc2UlADouEsj8F+wV1ftYl0HY6dqiVmqeXTwQzzzkJRNfMssIDpDK+4SzOImv
         1cT618E/uMgqUIGZgiB3k8txBXyVB90Drk2iaOW1LDvgB1r9Jb6JxaFCqlZIeEQSZqId
         ewq3R8nE48hhd0hIy6LyGiDBRR0Ja2Hs631uvAzJB8UY0WjZfIprfxuog0ezMyZQfVRR
         oczdJYxvv1+Da1+hMJSsD6EnQSHzQjPvviS1N5WbSLQvRPDf94aAZQrondqVqhgBXFuj
         tkISLhCDCHcXX6qH5zi7bQBP/cXo/mbuNDt0x+JgdVoqxuGVv+6NfmIawu2YWYEemAa+
         bHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028074; x=1792632874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=;
        b=lc94R5DB6Wge8oZ6d1bL5o+U9shsp17RXQtqB9dYQ2DjAUtODTEE/au8I5QePDsErK
         fzsyR8SsokbE3M72H951OGrNnZ9c5UCVKquCp8HDjSggQSw0L+AgmKc/UsBPRZ5EnxuC
         c9FA1N0nv9Y5i0XzW1HhMtE9f2Nn6Bk7Eok2cmnfB1dWZ5HSoEJtIeSMf+jn4AP594ix
         gKJ0k6QJgHr+4eLVPt+xgX6ih8ANm6CO5lR2MAPlmiBPzDX9aYx4MyZ3w2GwU2DjzU5i
         l15lMfszJjgikcT0SRbZTNw2U5avR7UYK+WPkW1m/siQjQ+rHZT0q4McGoUXP4lJgtNa
         Elng==
X-Forwarded-Encrypted: i=1; AKwUvBz63KhejpiivN0CJsMxhiJoh004e4ifnd5sRdJ51pLld6mBLJIkp1bTrRbt7ZYYBzPVXy2wsnAIQgXQjARogg2d@lists.infradead.org
X-Gm-Message-State: AFq9FYJxdofok2jhosx0c19Sw8Q70n2fsl6mQToSc3lUA5JxC8LZGR3p
	JHbX27EcBgaVjZOt2vHZDmf0CGlXgqU+Thf92HRJ3OkhItvqYV9ZAVZr
X-Gm-Gg: AYBFou0IwJNzD2A1RhvKDUZj3YAtsV6tFRdKFW94A1ML9xKws7JdhLp3qOqHdZz/NA5
	YQDYOaLRyPdaVRneJ5rp6jJxlHet5phIoQj2Qdnxw0xlez8ZwM4ht/C6bugFt/YmvUwCmE0caF0
	dgxlISK61Lee86EAEaPmnYncDn+3z+YGb+EU7lHBl05BxbZoGl+1FdjmwUlKewQPEcY7zpwVI7T
	oN2t4Pbj12vv77A15ZrMX5/elCyT1YMLmjnTtqilcSQgNh9aO2bleYNub4DT2vCq1hR6RmWDdBl
	YUzWmYu6qmSlON9XNEDIbmZHWeKIsvF5IThL3G/iYmFD0WX9cNOwIX5+usFNGRFcc+cgfRGCqIu
	cNwlb63QGrt5Er6jx7qVxtGgDw0WYKCVCs8Y5ScgiO1FBVBxSL3cbH49JiWK587ewrWeTeY8wsU
	PtxLDFTml/uRjoqvC9VN5zI8qLoJ5KSPuXRHwirvFmRdCC5+O4Kdg5V+IFQq3/U/HMv4tkPZTqT
	4euqslHNU1v53HzWs6Eo7CZxOTe5V5+ndfwgfJtIwcLplFGwjPfSsrp9K+or9nV0KlyjzJgXS/6
	JhafWR1tBKV7C/shHgjx88yumwmAdQLbXaX1Ajy0ziC4QWui6es4WyB8q9edx3jeoWqO/CPA0kj
	vHtxEdJrRf7fGMbzeJqOR
X-Received: by 2002:a05:6820:81c6:b0:6de:1071:8b18 with SMTP id 006d021491bc7-6ef107958eamr11840974eaf.75.1792028073754;
        Wed, 14 Oct 2026 18:34:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:59 -0600
Subject: [PATCH v7 12/16] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-12-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_023436_463067_E1752FDC 
X-CRM114-Status: GOOD (  16.77  )
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

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8d83882592de..74fdca27ba10 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1612,7 +1612,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


