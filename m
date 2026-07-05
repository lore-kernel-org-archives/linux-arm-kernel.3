Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15062C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LekL4u7UoLoaBqxCsrILgyphs2DOspCL4oBgT1QVx+I=; b=yy0e3EcdhiKvtoGdaCeit5oCyW
	uSVtX2TvrGyXc+fD84XbxuopuM1zlTqC/8FXktJSXDMz4Tkqs3IDxAQdWDTlJsnA+BmivICVoO+Md
	3TXGo1zfqqPGcPiU2dxVP+wgXg+CMIKUqFB3H3/ITI3vLl89HuAE6h4atinUnvkq3b7+Vujl+nmeB
	o7dzaVzZU+i/TNlmtC9bkO2uPN6CpZYZ+Ufq+LNC7wrZoaPaQ4CAikxSbPRpxMDPIKdWbeHCsPmzd
	iPcBOdi2MGElNhYfcYdQ3TMh0QfcD/Q/gW8AiZigFaYWaRR84s77GnWQbg5u/yswY4YcVnxiJ2UaK
	rcHTa0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQdG-00000009WIR-2I7e;
	Sun, 05 Jul 2026 17:27:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQdE-00000009WHg-26wv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:27:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6650er8C264637
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 17:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LekL4u7UoLo
	aBqxCsrILgyphs2DOspCL4oBgT1QVx+I=; b=ngjoLA+VIsMByzoAOfko7Hf1Spx
	j5p91xhhDcXfVqrwdNmLgGZB1qznQaHCewddvPZ3ONAn9VpWBbfgk9oZgKE1rcNY
	m23aKQvB9a3Ja+yPJhsRcK8XOF6+zCzKQHmTzbfoJrFLRQS1J4/apv+WVK2Lozc4
	l8Idj7JKseLxLZgzsWQjPbHqs+IwwcRV+Ol6GXfBteCFZ8w0ySBv1DJulpA88csY
	MEeeSrFBlFLySyQBemrRe+g5JsQ4727R6p3U0DkdECowBobHvzvb59JNWmtFIBzY
	3LUQ7pOABF/XaoMq3eVcLZerClichvKCP9/zPfDYXm3O+Tkzj9xEE5UmYTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgudnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 17:27:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so250475185a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 10:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272471; x=1783877271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LekL4u7UoLoaBqxCsrILgyphs2DOspCL4oBgT1QVx+I=;
        b=KI4ZkgfOA79rl4+p80wm2qU6c0oQ+eWDFeQFcbpgxPhcJlnrc4HSZ8qu32EHzB6KBk
         HqtRFohU4PWlCkrtix8htNztSGuqXwxa2sunq4+QGR/Y32Z6jomdi0EU+I1KAKw21rZf
         mjvTVlyXu64+8BqPJhtWrYJ7pjYlL21jlEKfyNe17C4FM7NnKCI3u78kxa44XpSBf4CB
         AZAAvMo17q/QyuQP0VX65BHfpOGA8DIOjfRJa1eitvH/qi5k33QFjSDPtDoUG7O5P6bZ
         yj8s34jsLghbZzLMlnbXg3lsr4bWD2CiD5gwEjWMGX+fGhN81wufcCmGQe+OvUHXg+QP
         dltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272471; x=1783877271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LekL4u7UoLoaBqxCsrILgyphs2DOspCL4oBgT1QVx+I=;
        b=LbMpCVMDDZh/7c6TitNa2wtEr/4n/HxNjQjA2IJZKvjXF3efNSFgoT8vDgSrWs8Tax
         DiwrtEhqjLYQhVTsTozquPXer7c0PqWEIlxEYFH0rZXFPNvplchW7eRx5GkIUxdPapih
         C7X+wy+PG6uSUfrCG+1uVoUFAjtmNWNJ93laJW8hCN+f2wqaZCCslw+CShIW9gA5qT6I
         EMzusjCWGe/cewDdEZXkYWzKp5UxLeAMzhjFBs4cSo/vg9XHqHHFtzmWWeC3ZLbtJWeI
         EtLkrg14oCcgHpIoQTJwOj0B13/RnbMg5qf4rLj29a8TefdG9Cp0qxbCjQePncTimQvS
         IB0A==
X-Forwarded-Encrypted: i=1; AHgh+RqsrDQNvkv9WfbTPg8TMC9h/4TW0ftUZ0U5NO4aXV4H2ky4Kt0vrxN+B5xGXkcxpUKjQ8Sk/6LzCE9YUb0l5ppZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxCbbxt+hmm70wRPEv06d7VoS1+7Dv3VrBhQ9IZzJYWTYL5BQWR
	xKnvpcAsfpecfoyno0yxXupQjoGyrsI/4X7CzuGV8jD4xUCJ4zE0V5W6lXlBs935uumxFaDsbY1
	t6TQwNX+ldtdpNOexrceUywpkWIQGpK9RnWzbmV6MpT1gqGPAjeWa3nnmkkGUJSC23lewPFOx2a
	BYbA==
X-Gm-Gg: AfdE7cltAR/1zqFZMU+1JB43G7fU1Ag9tMeharyoXDb8IzsQIfA0KSHpuj4RSFvcUTf
	zdGW31x6Ksyv5C+bPWh44x8B4IRURk4y4J4FjWZ3/sIR9ibo00KFDpDp2P4xtlK7pk67PhfFd7/
	2pormC5WTJDhu26Po6srsJwIiaC6y8+e1u2+svR1w4m/Bd53e+vMmBTkm950sxJqzGQXxxNeyQJ
	Babh2A3sg4XGQPbGrZ7mSKP5EGhLhD63oKrvE8Y9Y7WWHmCV1NiJlw9SoG7aCT9+AKoZIWKUPtf
	Zk/ib+SLQOn8IYa23YbLlEfgwaL8fktuCxRcm/ucOXP0ARFVDISk3ooqKqUfvZgqa49Av2R43lX
	/oTQGTS8X14aTZFjoTEP3XyMNS7s=
X-Received: by 2002:a05:620a:2988:b0:92e:520f:1631 with SMTP id af79cd13be357-92e9a35b4a5mr972019885a.1.1783272470936;
        Sun, 05 Jul 2026 10:27:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2988:b0:92e:520f:1631 with SMTP id af79cd13be357-92e9a35b4a5mr972017785a.1.1783272470462;
        Sun, 05 Jul 2026 10:27:50 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d620sm229444375e9.1.2026.07.05.10.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:27:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] spi: altera: Simplify with dev_err_probe()
Date: Sun,  5 Jul 2026 19:27:40 +0200
Message-ID: <20260705172737.120095-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=P9J10BvKEZJOZAosLxhYRgf4Uk95X2HaNsxkX+MKIEk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpQLfSnlXo4JfJU9hwN3doCMaejxtvCW34sVZ
 4AkbLoOGT2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqUCwAKCRDBN2bmhouD
 19TUD/0QvRhs6Dt01vGhm+TMph99zRD5BkkvBp1e5C2vC2Actyfln9bHa0TMebitH1c42u8ESuD
 vTmty3sMG3A3dtGQ9BdCQLz/PuSL2D9PQEEdpxX8Kws2xQcIG9g3KVOajfQI8Rm81Bn0lKrrZbm
 xaORM3xDeoJprFUAA7yvSBQVH4Wxcci/nL0byuXxy5KEOlbD1xKMBBIVdJEXWSZeLh2fyAk5Yk6
 lKzchcaPe6DPSHtqT43xwi846ICobGNU9kyrSky6YoRBoZKe/eFFZYh9iwTkZBO0jKdc6pEGyuE
 jw/63Hya4y8ZsWV4I5boChUPxUMR4HCwdN3P8JgvPgbg7RpT61K+rwfV/aDLVoIFJiX8UN/N6JV
 yPHRjy5ypwScVeap0gF3Oi2KQVer2IRupy8JChppkChQtNIRDLUMz32UbUo28MC2wqHSTkiNyYa
 iw//F20wrLrduVZ+gNI0SFuWh1pGOSBVF1yah1af9x4cObWyKeE+tnIJtD2GxBwCOlRtnoKw8I3
 EJ1hCA/2FvxJywZcsfma7sxap49P0zNizLsE1u0h/VyYFnrCi1hubv3KNPxlSvErv/f+dc1Ad0i
 1Hbpwd2sixN0ohmu7Ro/YBc+bvpgXkH3QNfyEL0FjbJcu0wCkvBxHVXE797bFw5oGAmmAp61gjW 2MsKfg83+qmWkYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4a9417 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=IYC4nHEeTJBYaFFm7d0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: tmSwdhh21U-mJ_xpP75YD9XSuZ-mN6DA
X-Proofpoint-GUID: tmSwdhh21U-mJ_xpP75YD9XSuZ-mN6DA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4OCBTYWx0ZWRfX89dYraQOkNFD
 71O1dpeD2Y3tONJ2MAXgkNCz8jyjOEIbyKeq+MkBHa5SrdJH49dszAj1nAax81UL5kTlVYp+p4l
 yUBLfZsgyjlLymQcNUoxzR3AN+CLsHs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4OCBTYWx0ZWRfXwc05GuYarqb7
 yM48sRFqPlDLg4HsM7A1j/vFo1xccxqFSbMadKi/GuYZINI/Pd+tVvVIiGIcL+1qNa7rHm7QgWF
 suACwqq79HjIbDWU5rm2MoZkJnDG4BmC+Bn8r7QP3w3PrGLNTSWk4QKDCYiE9hOEIByz6FSj+pU
 4UP/FjlMn1SJbpJ37vVRdDRN/dzVrzhvQmaPGn4vRPvRq2lNua0huUS269HYnM4UQ6dLLlp6+xV
 qrMcO2/RAQpsiUgqy8sNR1pHbKI3cel/EPUwW13ush78FJJ4YM+7c5KBkOpFtAUVBnNnBvenSyw
 tId0X0Racg9mlznJDEpruDIWnP1kYzFlh4wkkQGpY/FnLUYh3CLH9pkXUX+HVjPS5xPTkEvyI/2
 rHpDhjvhuCgX6YKkJYRDc771t9zYzECCvigWPMz/nkprDoFpDLh3SBlnmZ8inkpw+BjaTlHOpan
 rmRWHtRorFMDTxY+DBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_102752_554341_73872716 
X-CRM114-Status: GOOD (  15.01  )
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
 drivers/spi/spi-altera-platform.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-altera-platform.c b/drivers/spi/spi-altera-platform.c
index 3de7df73f216..4fe69ce9da16 100644
--- a/drivers/spi/spi-altera-platform.c
+++ b/drivers/spi/spi-altera-platform.c
@@ -77,10 +77,8 @@ static int altera_spi_probe(struct platform_device *pdev)
 		struct resource *regoff;
 
 		hw->regmap = dev_get_regmap(pdev->dev.parent, NULL);
-		if (!hw->regmap) {
-			dev_err(&pdev->dev, "get regmap failed\n");
-			return -ENODEV;
-		}
+		if (!hw->regmap)
+			return dev_err_probe(&pdev->dev, -ENODEV, "get regmap failed\n");
 
 		regoff = platform_get_resource(pdev, IORESOURCE_REG, 0);
 		if (regoff)
@@ -94,10 +92,9 @@ static int altera_spi_probe(struct platform_device *pdev)
 
 		hw->regmap = devm_regmap_init_mmio(&pdev->dev, res,
 						   &spi_altera_config);
-		if (IS_ERR(hw->regmap)) {
-			dev_err(&pdev->dev, "regmap mmio init failed\n");
-			return PTR_ERR(hw->regmap);
-		}
+		if (IS_ERR(hw->regmap))
+			return dev_err_probe(&pdev->dev, PTR_ERR(hw->regmap),
+					     "regmap mmio init failed\n");
 	}
 
 	altera_spi_init_host(host);
-- 
2.53.0


