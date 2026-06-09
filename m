Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C175ECD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=; b=mK8HUCERLgW779h4B2TCfjrnqV
	wzTlfTYsMvS8MYpyAvB4JtZj5UBKMlSdUWHHnmwccQisZ8w4Vl8HhQkpwATSTljRzUZFJNMi7W3C3
	e/Ix84vIjcByRL8Ephc/W/fS69LCLoVwfCi7eaiAEz2dx3YTKH7GS/6H1NsfM6G9sQtyUj9rCPdgf
	X5XbqbD+QQrjK2iO9N16DoOvUZdylYO02+59NNw+z68smsWl0rKPCsRCKJlxurn7iYoAxkk2Rkgtt
	19kn1YJzlNlF+dSE2sNcG+cmZVUKpTLhpKKaEDuZhPRmmVFLzP7nHUDpKJkQWpRZyIV2VHN+TBovw
	Trurrd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eC-00000006EOP-11xK;
	Tue, 09 Jun 2026 18:58:00 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e6-00000006EJZ-2waL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:57:56 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-46015dc517aso4786622f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031473; x=1781636273; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=L27T1br1d9NEPnIjD5iG1wNaUcukyVwaDHt3NsGzzvAfRxEXo5rgYA3vWpDNBxzN4G
         SnNV0FsLGOLCDqXHGR1kOpobFe59e2hBcEn7jxXcm7qxjnPvHTi9sAjYPsXXlG7fYWh4
         2RD3cGSJzMNz05LJF7aYZhToCpkYz+YHl7y0VGp/2EsGZh45E0kaMHshXMsrQ2F8tblj
         2zM4JbCZrBo0d2LuK8CKGqwt93m9z9hV0VCnEFVH6Vx/xfiyYrNx7DQoTgL4YFA2b0Uf
         vhElrPWI34x9bNaB9tErzwDOLY6L8v/VL2S9D5kwNqt/LuqpIdrR64Jfxjn7EnPjUNSU
         UYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031473; x=1781636273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=JyhUUdwcu12KFsDarcCVYOzBazmt7eLFgMM52wYERheUeUiqJktzIOJrh4mb0WnBO6
         8GJHh9Bm/SOvd+86rq5kAISDdlqmOflzMffqrLP/ZwgmLVBksl5BzxDsrzEveCQ44+Fj
         31ZTLxWU0ohgV1kXXBJUodJERZI+zc/ppsuB04NhjDkP76A6PShbg3HT1bFVezFFR0IJ
         j+YUMNmhbv2fOAgpYmcRVna3+5y8161u2NVevyH+vx86ZAIgIJHwmRM8G+2oW/o/+jJ8
         RFDlL5IIZb61w97nBXOmw3BFpCPeuoG9nCnl43DXULUT7EjCDkHqyVaR2X/HKIoX6jI+
         WGYA==
X-Forwarded-Encrypted: i=1; AFNElJ+aQ4z3VPuxp+jvVPBdTBROcvXlzfIi4SSj2L4ySTpa6TNnA7pBuRFYaWiuftqsesqq3D6V7vtFwKlyMsryy58f@lists.infradead.org
X-Gm-Message-State: AOJu0YxHRmaTGPrqdGpyzeCHpogg9cNJmyQrh8SV3DplBvzE+aGheDwQ
	XXyaXmUAKwfiKV/bCL3beArMS4PFeJBvZdpsXiw152Z9YaGO1nZ1ZrAGgIOMOq5sYh8=
X-Gm-Gg: Acq92OGk7VQEOaDQ5F1vSclsIFxHzZ23wbMXjZKVWoP1aIWHkswSnrzikBSM8vwXqey
	NIs4jRDyR7+92cEbHUk1XaMSGmzXXu04IVFWGNfeyqGwnaB8pw79W2h3FJgJlGboIYwSb2o9dTG
	vGvrF9MBwjUG8+nlJY5Vw6hvcupopJIEKUqU6a6Rt5vq0XapXN2gbmQG9ZYJEBMkBOgrNzRhBrS
	kWQ3ukbLyg4oQPS1PL94sJ4BYg80DQfmEqPUND6pbmp5qySaQdqKYSmlUzRdHrq1bSiYYVoRmHl
	m30YTAQBUtnVF3Gro+3iIPxRvfHDlhQaH6YIzZFL2tc3aAaShdXGr5o+pReV0y9pGXbNe4Oj8sY
	nzhhtbFgb7knn3x2gbB8Qr+7cOOUNLdInH5AJJQHwMIzw2v2n/s6xinp4YTgnewn7U+ESjxJ9lY
	dZ3Ra8IhJdw9TuqZa4qsOud+tqifqdOok=
X-Received: by 2002:a05:600c:8183:b0:490:958c:46dc with SMTP id 5b1f17b1804b1-490c25b0a60mr321296115e9.17.1781031472834;
        Tue, 09 Jun 2026 11:57:52 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm50662830f8f.14.2026.06.09.11.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:52 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:17 +0200
Subject: [PATCH v6 05/11] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-5-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=msp@baylibre.com;
 h=from:subject:message-id; bh=YelZkVVslc9h94alnH0TEUnMH8PtybsYZVjRxXyvnYU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxM/Kr5feqbh06nnx9l4VzWN7FQ4G+aqzzL+oKnn0w
 LbXwgnJHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRD0YM/+MvF5Sxn+A90h3y
 XGP9w618fMqeBwwFvZ/dZfDwrjriUs7I8OalbuOD2phCpV/P91hxSPAmqzNPztgY+qLyrn95jNU
 EbgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115754_810912_278CAE08 
X-CRM114-Status: GOOD (  11.21  )
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

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: b05a6c145001 ("arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d8f5827c49ed871351a6423db8026..16549fd7340a556798cf5a242746c219d3168d83 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -57,7 +57,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.53.0


