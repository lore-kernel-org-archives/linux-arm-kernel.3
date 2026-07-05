Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A62C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8sXJH4r1hnd8AQ34MDhpqTfUB/LmT2KkQwZyuUOAR4k=; b=bIQGF0c34+HHDdOwjIlN0+9GHP
	cSF2k6DnWuYBdiex/KLJDfS5cEPmYFFj8c07W6eGPcT+LPlIR98NU33tcIt4ZUE+7imSOz8dCMYnl
	EbTdMjv/c+9w9X9Lk/vgRFQs/S8YIwPEAT60z8G5d0s2j8vV3zAAFDkK7hSoRp5zYnYzfZ+dM9Llw
	mcOVh+K77WzDFKYBSvYjhRkjOj9XkOQ+WQVy/11+B/t92T6S2j3bm37j9GCoZST8qqSKN9pj34a6w
	mHj9vtGzPowwfBzi3fQ8txZ5Qbw3upOVepcZLOAJ4jGbSzEH7E+sax6NuPVnBJ3/1yik8Phbo1N14
	oLrJ0NdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQdB-00000009WFw-1Adh;
	Sun, 05 Jul 2026 17:27:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQd8-00000009WFJ-1ekA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:27:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6651j54U392296
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 17:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8sXJH4r1hnd8AQ34MDhpqTfUB/LmT2KkQwZ
	yuUOAR4k=; b=cDODInpbcNaHPfZNNGusM8IgAkBJKdo4rVBBNYKnmmkmm5i9VG2
	1MLNJlXrIEiKttSl5BBEGIUkBIb74v+BEXa8KJbnJZpzUaUf1m/A71GWwQ6FWuOT
	cz9bKlBqcmMaJvR5xMEX+35yZDZgTXQ8S+ZpLxKhccWs3jGqjPWyNZQ16SmlBRqK
	n4UESAuUqP8VhC9TyKIp2ECOeX2eM8knp1/r2quDYcUGQViI/sR9b4fB3ISV1d8r
	aF9xfxPD9Ea356LbA3JAHX2mXqSECg4h7RdmhsoAdhPTKbdYzVSbeVnJSfRztZ1m
	I+uoeD+MVDIbKrhzFTkr5Sab+/c31yN/0ww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgudnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 17:27:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso180049885a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 10:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272465; x=1783877265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8sXJH4r1hnd8AQ34MDhpqTfUB/LmT2KkQwZyuUOAR4k=;
        b=fi97Lhe+F/eELIP2QhdAfMYE+3sBjan8kHv5LDKcoKwt7mD+pqLdvEhYNMO/NhJUzF
         Q+4N0s1NL7CezTSzg8EgS800O9+mqHtNnex7CzNaYvYcrd5ZYQ2IOvR++IoPHW/Ud68+
         mUwb2MMd7LDMm2wOVlVBO63ohCPi7E/6UzbYuuYBsnFmxFXCZzl7foBNplENLjQpS3Ud
         +Jw6uZI3zxqbdgjoRQZDnyOGBnCF/GHE10nuAxa5xRqss1lucRelMKtmxVG35V3cgBHU
         7kybEeU+2GKn+a5mY80ATYWmjNQz1yaKnfE5TkO0gy0H3FfCrsPQnGOk8oM9Fcub8rRL
         LymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272465; x=1783877265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sXJH4r1hnd8AQ34MDhpqTfUB/LmT2KkQwZyuUOAR4k=;
        b=MBtlp8qEEbUIWI6th98PYC9EiEUdsJiwH9w6VUZysM2oGladAdnRF0CB/zS7Kd9A/A
         XsnTFz20Mpe30Sg4KyuTInsyliSzsfLxbuZ6Ek21AcBC2Q/T8gLQeufB3tMVZKa5Hb00
         DWZpaHgtgGy++Y3+y8xNBUp1BU20ao9NAJfgJPJhVa/Btxe8An+vEj5PMCraUHhpM/62
         h7ThAM4YxeqxnTQPIHqO7euKj3fO9OuWgqjWMXU/8QSJNx22vC3ag0iaSb2+2X+/EvQn
         UdR9eoLfwRyWQ7Br3/zznX6xtJieBq7D//Tzx5aiw1/pZSfZKzD3wkEA23qmUrTN2OHx
         zuUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpM+FInk9anBEInUxH9fqfMrGn5QEuC9voM4MYWtKXfFqD1agmtFyYwJBfZ3hISEgU6yvo8Pn9sU6fC51AP15s0@lists.infradead.org
X-Gm-Message-State: AOJu0YwL1Y9sH34cADdmtoy8UXZfy92/94GFfCw4/lIb+WZ8bWM2ZMeZ
	ktuHhj0KW9fVTbvS0+/Fxdy1McfaOorpa8y0H4vzd/+5N3lG1gZfWAGqGZM0AV4Auv4/Wn99y7q
	it+zAFrwapHLIeaaFoqzPw8sFscAe6btZgTatDlndBLhQS/jlJ8cHpkm5/c1ymDX/WvhsfGGUGX
	7klZl599Y7Aw==
X-Gm-Gg: AfdE7clSkIDhTf14CtUL33ZI3Cl+lEATD8C+M8EjDkyRTDKTG+le9WcbJUyuPjxlPJv
	sv76mVbfQIbyBQWIKT/EhnlS/ALZTCCQa3uCkhZfuEge2apdVdRg9rMOrxn7vVo6FM006dQeHxY
	jjMVFwOcW1ahBS/WlV6bfbNdzh95cOcLJG9tLeXVi71Vqt4tGJWeMJGN8juPYRmxY38vsLiAOwr
	G0Ns5G4cm/NvEqmq2mhb/SA7iN43zPosGb8c2D6O+nFPBW/f3SgGORPdbCOjKyULPJJsu75BPUZ
	PTUpJgugA5cstqk0ZHQlhxtwCLLg9DOIZpGKHMKrspOyqg9XsklkAnWD+tXMOOkvrfA+Pnw3m/f
	JsB5XQbKbW3q15FKJU+zX3LNQ6rA=
X-Received: by 2002:a05:620a:17a1:b0:92e:84f0:d3fb with SMTP id af79cd13be357-92e9a35a445mr1072272385a.15.1783272464825;
        Sun, 05 Jul 2026 10:27:44 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:92e:84f0:d3fb with SMTP id af79cd13be357-92e9a35a445mr1072269185a.15.1783272464323;
        Sun, 05 Jul 2026 10:27:44 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d620sm229444375e9.1.2026.07.05.10.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:27:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] spi: atmel-quadspi: Simplify probe() with local 'dev' variable
Date: Sun,  5 Jul 2026 19:27:38 +0200
Message-ID: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4164; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QRRdS2Pd1ePyydxnjdAX6ngHiu33hJ0WfFQS+mciQbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpQJuwzdsMGFY8qxUvKwPtt7754KIgm4RdnVR
 7oZK58quEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqUCQAKCRDBN2bmhouD
 19kcEACP7t1ngzzR35UXFvXYOcjkc+8ZZ8myWF5lg5L0gYV4Y6p1uKCaax1EUYAcZ48bHpVBio3
 2BMB30yrz60Yv3mZDh4WBrFZ9M/5dpSKKzrWuRxmbEoR9yTT83TXqXNisYWmFZ/zLzgxWfQBnnF
 YdyPetTYANm5D00KRK8wbVN2PBnvX9FeIPRWe4IgAz9aFH10yUeFC43oVk3QOUdAS/EgWGsTn9w
 nwsfZivUuN2OIC/P6tW7vEzuRsWjJRLVpJoI/cTxw65Xc3RkQupJ88Frxa5NGntfZh0qlJYRbGR
 wu/j31TL40GtKIY8enSZzjGPcfVkuSOl2xaZeJT/K9xkQRbHoDKXwwFnUoVZ9N223a05WXGtDlv
 iGW1i29eEYaSSaINUwDB/F5GX7FtQBTevjE0WlMxOvM9fJgcoBPgYz+J53np3qjVQNHSaDJttvR
 Y13Q3mprXF6X8MRO+NzQCjYOHoHo33forGo6CMQ79/h1R6Ngff75wD0VXU5aSECOGy/ChOEgX/c
 pUsDTrcjBQ3QcRpPlLozEw29BjliZDBlOOFsmlyfUrq/p/C2dj2OIj++b15cE1wMfBG0i8764Bk
 +xU9tczUM/OrnoAvVT32Rzh7pcJN5En38kjYyitAkyDmmF3KF1GEfS0eq3WTxv/XeGPolT08CDJ BuliZBtO1az8eXg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4a9411 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=py1YOEah02oVGpFNBJcA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NcKsFpiUAO4zNwWDLH3Tq2fmFZlpuTtG
X-Proofpoint-GUID: NcKsFpiUAO4zNwWDLH3Tq2fmFZlpuTtG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4OCBTYWx0ZWRfXy3byYOhH5h0P
 OEXVF8UTz8kYkhuN2cyY4gFkIXzs9Ua13+CSO64+6aKiJ/1MApjPsMywVadIjMayVJU/WAAmsn2
 tOu8AB706vsHuOMViqilBKvA1WQpYCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4OCBTYWx0ZWRfX1nZ99lva4ywK
 ynsqqwn3IndfUHevWHXYYC9BAjtcM8u0i212AnolX30yaUXuPk0fk6zl3emubI5POQGPh9EcPWc
 Fze4E3RoOj7c/9i+dMgkTfDufe620g/cbA4/y2B/4ZnedZ81N2w5JwNqo6gOBgzUPfCGkfFvmGg
 7gX+yZZbHoOMTik1kLVWR8s624WMOfMQsO6vo8b6H/G2uiNovJhDiEUTxX4/qcXNwR6V3wXDcPm
 4CADgHpPDQXRW/BWaw2a/L6+NZSPjm42gHU2doK49GxcJdRKSHVCmkvWPI1WLNlDvbQwmv7co79
 +gFcbN0x62+aEPLFnhe7QZTtHFEHtm66VZZHM4wqnPuQJvcjoYKiPBfQj998GLs2y0+Ysbnq1km
 +LeDYJ+DZQ6MiW9Nq6zr2XTpzVdZfIVeFJDpEA5XQ4TXla1oIeFPVeaEUXYLsyfsAIcTcPHTsmp
 czmrE2AiIWRw/6EOi0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_102746_438203_AA11F190 
X-CRM114-Status: GOOD (  19.78  )
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

Instead of multiple '&pdev->dev' dereferences, just use a local 'dev'
variable which makes multiple function calls shorter thus easier to
follow.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/spi/atmel-quadspi.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index aaf7f4c46b22..8d9c77f5de43 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1347,20 +1347,21 @@ static const struct atmel_qspi_ops atmel_qspi_sama7g5_ops = {
 
 static int atmel_qspi_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct spi_controller *ctrl;
 	struct atmel_qspi *aq;
 	struct resource *res;
 	int irq, err = 0;
 
-	ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(*aq));
+	ctrl = devm_spi_alloc_host(dev, sizeof(*aq));
 	if (!ctrl)
 		return -ENOMEM;
 
 	aq = spi_controller_get_devdata(ctrl);
 
-	aq->caps = of_device_get_match_data(&pdev->dev);
+	aq->caps = of_device_get_match_data(dev);
 	if (!aq->caps) {
-		dev_err(&pdev->dev, "Could not retrieve QSPI caps\n");
+		dev_err(dev, "Could not retrieve QSPI caps\n");
 		return -EINVAL;
 	}
 
@@ -1387,31 +1388,31 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	/* Map the registers */
 	aq->regs = devm_platform_ioremap_resource_byname(pdev, "qspi_base");
 	if (IS_ERR(aq->regs))
-		return dev_err_probe(&pdev->dev, PTR_ERR(aq->regs),
+		return dev_err_probe(dev, PTR_ERR(aq->regs),
 				     "missing registers\n");
 
 	/* Map the AHB memory */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_mmap");
-	aq->mem = devm_ioremap_resource(&pdev->dev, res);
+	aq->mem = devm_ioremap_resource(dev, res);
 	if (IS_ERR(aq->mem))
-		return dev_err_probe(&pdev->dev, PTR_ERR(aq->mem),
+		return dev_err_probe(dev, PTR_ERR(aq->mem),
 				     "missing AHB memory\n");
 
 	aq->mmap_size = resource_size(res);
 	aq->mmap_phys_base = (dma_addr_t)res->start;
 
 	/* Get the peripheral clock */
-	aq->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	aq->pclk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(aq->pclk))
-		aq->pclk = devm_clk_get_enabled(&pdev->dev, NULL);
+		aq->pclk = devm_clk_get_enabled(dev, NULL);
 
 	if (IS_ERR(aq->pclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(aq->pclk),
+		return dev_err_probe(dev, PTR_ERR(aq->pclk),
 				     "missing peripheral clock\n");
 
 	if (aq->caps->has_qspick) {
 		/* Get the QSPI system clock */
-		aq->qspick = devm_clk_get_enabled(&pdev->dev, "qspick");
+		aq->qspick = devm_clk_get_enabled(dev, "qspick");
 		if (IS_ERR(aq->qspick)) {
 			dev_err(&pdev->dev, "missing system clock\n");
 			err = PTR_ERR(aq->qspick);
@@ -1420,7 +1421,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	} else if (aq->caps->has_gclk) {
 		/* Get the QSPI generic clock */
-		aq->gclk = devm_clk_get(&pdev->dev, "gclk");
+		aq->gclk = devm_clk_get(dev, "gclk");
 		if (IS_ERR(aq->gclk)) {
 			dev_err(&pdev->dev, "missing Generic clock\n");
 			err = PTR_ERR(aq->gclk);
@@ -1439,15 +1440,15 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, atmel_qspi_interrupt,
-			       0, dev_name(&pdev->dev), aq);
+	err = devm_request_irq(dev, irq, atmel_qspi_interrupt,
+			       0, dev_name(dev), aq);
 	if (err)
 		return err;
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	devm_pm_runtime_set_active_enabled(&pdev->dev);
-	devm_pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+	pm_runtime_use_autosuspend(dev);
+	devm_pm_runtime_set_active_enabled(dev);
+	devm_pm_runtime_get_noresume(dev);
 
 	err = atmel_qspi_init(aq);
 	if (err)
@@ -1457,7 +1458,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }
-- 
2.53.0


