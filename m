Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3247C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HF9WtXRXAlTadjq8s83xC7TKFqWceOgFFMrFL2GF828=; b=IbCx3LZMTjJvwr1ykE8Oie7RqY
	9yhSb4ZSX33BOVyxeBjF/yX3t9RvpFd7uslGhgdGHLz4z2/JowEO851uVZ+shfXmomtvva45wLPf6
	tXxNr/TmMp6Bm3rOdzkPzkdugfExD80N0DmwvIlexcoebwOW2MbLMVJ/z6rX7N+bOiz/EFiVWKl4M
	Z6DrhZca2aiKbDMDn1YYVf7VMYRucZPCkoAiPB7miDZ4H772k9kB6GlGFTPmlmSPfOv0mDI3VqTH7
	N/RteGIlWg6sBSSQmNDRegMN2J/N4rGOK+rU09+fuAwenJqM0VPcOO9fcsxSnB/UdZQfN9E7I5/Im
	ugRFJRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQdC-00000009WGa-1qb9;
	Sun, 05 Jul 2026 17:27:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQdA-00000009WFg-2TmY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:27:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NAr7u4084353
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 17:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HF9WtXRXAlT
	adjq8s83xC7TKFqWceOgFFMrFL2GF828=; b=Vh80yE49Vff3BEWs1rf8TEA9T/L
	jhPsBMITQJ/OjCBf3j4bCIiKE4pTHIKhWeCOtm4+VyGqslGWbUQN4CNf6S5nKRaP
	/uLP9f9fzAAAIuNz8FAUcBrycw90YgjRAstGmUjr3MoA0JluEj6eZCavK8tZFQ5Q
	7imZ1MKsusVZYyXDUaTyz0kwW1qGjCdZYyZtun+iKRZ5Jmtk4lcNj+aSoBNHmeBH
	4Qewv4LrKMqX7EfWEe66++X0iPCcCLbkKPEmq0dHzLxNrnH7f5fms9UsEyaCXvgd
	cvCS0HWPAnOO5/znFPYqGL6JYyKOJ9s8L3L8EJD4BqNITFOZbKoh69/Acfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgjxqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 17:27:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so250473085a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 10:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272467; x=1783877267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HF9WtXRXAlTadjq8s83xC7TKFqWceOgFFMrFL2GF828=;
        b=KTUhZcWOk31BfB7vK0KvK+G+UA2cPR0903LE2hrkj3wskQhz8dXP5QqryBDUfFYrOA
         pfvHAeObymj3a+2qsAX1GcnHOI7N/yaADM3I49g9I8p33sw6IXX/vnup5eAd/uabap6F
         k+7OnnNS4D+EOcCO2xJ+j5QMxVwiE5ypDpjVf5CWC0LIalu42bbi5q2vezJf/Y5b/dsX
         AYClOtEABmhbTD1v+B8PQA2a/AZwnuHaGuPgrjeAweOlueAUmUOSSbO6xreSblG2uigQ
         jtV9PIyTBy4/lYaaXFPLUWGtfx0j5xAdXUNyP69zjyey+OWl67/BtSAlLL6u0xOnL4OD
         5LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272467; x=1783877267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HF9WtXRXAlTadjq8s83xC7TKFqWceOgFFMrFL2GF828=;
        b=Q7s1cXPL/wkxSsMuSQQU9TdySrplpPOZExJ/KdyIk5L5GTBskAfYyFa11EEiUSHy2/
         EbqCO5nLLBIS69knTHpt8/yeR/0RWOoCpmbj5O2e7MRmPlRawT02v6Swt62RKomnvdl8
         dpsK5koqMQ0gH3hQn+mgGDzqOwU8xRAngdaYdFWZT8xZMnvZt2LBbU3a0iW6vuqLTe7L
         aREpaanPfNeeqf1K2pg+KJtfvddRnO1vUt9N/OiGfGtvesCrUlPWXCM25WAFWshB70In
         /1j2DOzBFwt3JDnCOefv2XjCOSV8NAObjWIkaWv4B5F4t7qLSR00OQ3UQSMrCYZxiGNQ
         VkSw==
X-Forwarded-Encrypted: i=1; AHgh+Ror5yi+MFXcK5Oakuhev8v63RyUOSSNqbv6S7weQCpuCHj/sDAOfR+X9hRdFg4YTjxICWADjsIFAD0ZJMBj+igo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9fCLck64Cv/mchm2wu3vhGoM+7aD3yWSLYrVWoG0amjsiodnc
	h/Nerc4WoWpOgtsIZ/uzkIXUrNhOAF/jLzgFAzWlmdjHxBX8C+uc8dv71EUvGOaUPagNHdKVcUd
	Cxt/7VY0X0yjpOHDJ2yUwfG4HeSLRDy+3JpMaj2/gyKhGZm2RMkAmfzSn9fB+xogPrVkTU2VxfN
	xJMPexT8PwRQ==
X-Gm-Gg: AfdE7ckXpwAacBCpVWPzTBaG6obiHitapNAbMZAz1QXOh54rkN29j5lCFQ0s/b2KgwK
	is1mAfYHzI5zIjqyz86/AGYcMgc4WcSr217nWnO6IMrFP4L8GFWXUOsyF8WYMSmAmu9nx589/0v
	vZJ54W55PlqCM1XQvQ2JYm3Zq0RymXCaP9G+rmtR2QHeB20OHfTLzTHKPvBbifRmSP7VGEbBHGx
	wUn60YoO/314i16hlXlMnhTHnHJVJhNWJkFcWvT9AZsHMwGXchv7JDT4l860dkra2bFbKhKMcY2
	QoGhOARaYS774706VzBVHKiSEEVOR9mTSO71S2GzSXqzdI4PGUOIxiJTpqUjZ/JRNnGBMOshFwk
	FPw9T7rJFS04k3Syk6ZZAZhp1Mw4=
X-Received: by 2002:a05:620a:400a:b0:915:cb40:f76a with SMTP id af79cd13be357-92e9a4812a4mr1050010285a.39.1783272467276;
        Sun, 05 Jul 2026 10:27:47 -0700 (PDT)
X-Received: by 2002:a05:620a:400a:b0:915:cb40:f76a with SMTP id af79cd13be357-92e9a4812a4mr1050008385a.39.1783272466859;
        Sun, 05 Jul 2026 10:27:46 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d620sm229444375e9.1.2026.07.05.10.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:27:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] spi: atmel-quadspi: Simplify with dev_err_probe()
Date: Sun,  5 Jul 2026 19:27:39 +0200
Message-ID: <20260705172737.120095-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1ckByE3uUm4+13CyO4IfazSyNongagIAQn3OAZKxYyU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpQK6l3LukC0wyfKsa+dMt6N5yvXjrcYvrX2U
 621CTxv4L2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqUCgAKCRDBN2bmhouD
 13NDD/9+d+CJ4gsPmE6CmOi+fzWNBREdLX8K4wy3t9N2V0+CFKV6990jcxmBbFXnJsSAJxRpZ6/
 yfvJMoi9PZsV9Bzv3H53o/Mg0XQiZMR4e4H7Lhqp1GJFnl/bZfWDYHck7lkVQEZuFhbaS5KVent
 3wQBb8GkSs1KUi8mgWPozh9fq2VSb4hZwIpIX4jD/VfCf0pVmWVVQEmWhFZN/rGYMlf5TqrE5X7
 Oi6a2R6cMBurV8mWt6FhuEh0l4uWigVauxUp0GNGhMXV4GxkU8Y2hQvpVWuMU4ENZ8Qigx8JXQ9
 XbGEdn/rdjBKsAxKwR3CM6O8CRVolW1qVT3Xocmz1CMhg0Yrlq18VCMA7uMaXoin7zbN077s2ZR
 KRKV6AEZnXgHrDmx3IvNlyuWQg4bYLWxXwgWg0r0j39zqpnru9h43gCfomMFdI7IJmvaGGRxPIX
 t+KWrqFeB15hhtA+yzSYomrFqN6lvfNnKb+Fq+jUmx7QPhkGdwxaJytgG0TZn4d5oIXOMgKzdxE
 YfGuVRerEJD244AxP/Z7M3AxWj2k4Q36t1/3VDhcmmzRf7DuY7FMA/4fi4KXR81cVTEhwv1w8LW
 JwL/Psq8IISi6DZJyw2rrgC1KKpzqqCA8k5f3K1lCOtNq0bZBjxb9TjyhlLKFE0JVOUTg4cf8hh QkEXHcAnppIqClA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfXy6KNtRPCdHSk
 WGPSQHY7Uu1T6ktosI472UpLL4gbb4vAdczrvOUjFwqL3SQ+ToeNYieC8gu+bqhBwQ+FqVDnNd/
 dwyzxdo4DLDFZjB/0bzudQBNR8f07M8=
X-Proofpoint-ORIG-GUID: qhulprg5Duc7Ah4V7fiFJCgSiq-xRnJ_
X-Proofpoint-GUID: qhulprg5Duc7Ah4V7fiFJCgSiq-xRnJ_
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4a9414 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pmzHFExtw_ipNMRAmtoA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX4am7gornzmlD
 PU7hBu31kvghRhhZzYpQtz0QTZeihnkaz2A2YJfDn+0TJ5f96IKu9hcGQjuflR1cgzvLfvjzw/M
 5yUKC/DOA2YCY7pLsYt7WUgB3K2BVi42X/z75wBTuxaEWY9g+OSKD9enij4VE9KIXHMryV1mi4V
 saMJkRTwHQSa3QLTv18Spmsp57p31WJ5q6+JF8u+JRFfOjZHYTBch5gQrjN5VdwA7xiSzOZWCIy
 25V57Piyy1+SQGYW17zcxN9M3NlIBNFLQ560zCpK4Ob9ZTmKEtOJ9xEFKQey65/kgTaiuJY0vYH
 IV8OCJxZT86AN2PaFL74r44f/QWeZ/I60mkKfIA5btAohjCYvg7yZj5jwnYP1wm4JCzRc6SDbi9
 gfB7GTnyuS8k/m7k9cKAT8nw4BvWkNcps6ky0joVpfizNX1e5iqjn8R+xyWIOSYjC8yz61LQo1E
 eLWWUOOoLrYWznKMEiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_102748_656466_BF244FE3 
X-CRM114-Status: GOOD (  15.49  )
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

Use dev_err_probe() to make error code handling simpler and handle
deferred probe nicely (avoid spamming logs).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/spi/atmel-quadspi.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 8d9c77f5de43..e3a4697fabce 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1413,20 +1413,15 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	if (aq->caps->has_qspick) {
 		/* Get the QSPI system clock */
 		aq->qspick = devm_clk_get_enabled(dev, "qspick");
-		if (IS_ERR(aq->qspick)) {
-			dev_err(&pdev->dev, "missing system clock\n");
-			err = PTR_ERR(aq->qspick);
-			return err;
-		}
-
+		if (IS_ERR(aq->qspick))
+			return dev_err_probe(dev, PTR_ERR(aq->qspick),
+					     "missing system clock\n");
 	} else if (aq->caps->has_gclk) {
 		/* Get the QSPI generic clock */
 		aq->gclk = devm_clk_get(dev, "gclk");
-		if (IS_ERR(aq->gclk)) {
-			dev_err(&pdev->dev, "missing Generic clock\n");
-			err = PTR_ERR(aq->gclk);
-			return err;
-		}
+		if (IS_ERR(aq->gclk))
+			return dev_err_probe(dev, PTR_ERR(aq->gclk),
+					     "missing Generic clock\n");
 	}
 
 	if (aq->caps->has_dma) {
-- 
2.53.0


