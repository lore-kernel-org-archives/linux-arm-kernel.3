Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436A3E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/Ya93eis3xqRDX4t6fcfXGbB6PyZ7xS9AaL1hTAB60=; b=K25a0Gpi28itbaOCEFmTcS8NP6
	N8l/nLV9JiZ2Kcbc9TTGieK/l7bWT08tgXjgLOvWF20vZVmX+8BhA6IF3CGvj2RuOpvCvXbWGBv/e
	XQBbOpiissFrRd82OaFU2VjlxKc6SIrCZou/CcElcSW7dd+L8+EBJ/UXUNGkriaC4QR7Ga8Ra32Yi
	+goLY4kQd8Wl8Oqo3mDJutW6p/SQP2BwqRsoOFB2ZD0jhYLH32mhbcMEbMsIT9V8OXl1cWCtrNuA7
	x076rxYrnetduuBgV2ilwBO8E90HeUv60t4jzf9jbm5EQ1hlTinzGlDdBuXWpOn2PQbZeLoryVGq4
	2gg3HBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXKOL-0000000CVe3-2Ofa;
	Sun, 21 Dec 2025 14:26:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXKOF-0000000CVZe-2Enk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 14:26:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BL7p4mY2351538
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 14:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N/Ya93eis3x
	qRDX4t6fcfXGbB6PyZ7xS9AaL1hTAB60=; b=FsRh4ae1DDi063NeFL/u8wjoPkP
	sN1VrGwgnaX/DgnI7mD43o25xSS/xFHXShyTridFFdVWZpPGo84Z/I+LjFv9ovDj
	LLyfTZ2ABPhXHSYNckKztW8l8a3UJSlHgeLHe55Y1Of9CDatGM4/RVVbdWGkp0vW
	osM7k2noJ4Oy5Vp1hc2ki10MluXc7IarvuJ1FydPxHvsxH1vGeAU8WrZ9VJ1JMYi
	ZJGz7keslpPULe87+fC4PKckLRziJA+8v5DskpSKLSXE7UX1U9iI8OzlTmIJAR6/
	/BejovyYdwu0O/Q7DM+unaC50m4e3+4qmFq1whpSy7K9Bz+hJ2Elux1atdQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfjdcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 14:26:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0193a239so32427081cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766327190; x=1766931990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/Ya93eis3xqRDX4t6fcfXGbB6PyZ7xS9AaL1hTAB60=;
        b=kbshksdww14YCVfY3NlJFMIBjqOdrDq0UqT8fuVo8domu2pcmACCc9RfQB5CAlhGxQ
         epGgg8kzFGpN8zM0mGv69nL4R5ptqIg34PYTowk4li1uPF0cZkXovnCMkzc1R+w/h70/
         pWhbwKxEkp9zNkN9llu8nFToNS1Bkza6ehOVcr8AZ3cn6RQgCKtxd4obh1YnQ/vE4bPJ
         3CFE9VnEZ6kBoe3+XnOqtZmgHTXCQ/Tqx7fCf3Qaxlb0+SNaia2H2JFKDz0QWhrLrNUK
         mUPjZGL3jPVplJRVHQfrhD/btuOb98+g1/wjA1LQiN2Xh6TMm4m7iLMi4xXECKXjzF9O
         //QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766327190; x=1766931990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/Ya93eis3xqRDX4t6fcfXGbB6PyZ7xS9AaL1hTAB60=;
        b=D/Q6ZeUfg+ckpOWiVKii7cxKANNzVtSntJO42t+QCtUJO3nNQ16VTwZ5DDStJF+VaD
         xlU6hUub0xiP1QeV/tWOctMhxXqtC7iWx+SBtXdc5+GkWlsPffYliTbtLcgrpjjynaMe
         j36NTgL5SG8dmAwM6fHwX8IEhWhSxHc5+jWqF/88m9WiusGFAf32pxBZvxcd19BuxaPK
         spi/OFRmMnMK9no/fIMNTK/4EYR3GUV3194BJB3D0Y8W/xqj4kby8LYNY75UbllgE9x7
         /6wOPDMgJl7A2V1r4orPz+P+OqEDn//8CIy5jmiinGiPqvcV2QdX18PRyx6mbLrrqaQm
         LysQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEouD/l09Fad0B2audZXYawto1oxqjslRTEgmSsjPj17r422DynUKkgDyMyzd0qsXAAKuDB9pl37+SiZARBEWv@lists.infradead.org
X-Gm-Message-State: AOJu0YyyLna3sTltnZ9veoIxoDYe3RS7QKxFxfb/L0mluxfLBIY7nxN8
	TpyNfM0LQvd1e6REK9OttTSCKCOeWevXcBRvwm+Zz0pCqppaH7A2eImDD7wfn6DGYffP3ns+E2r
	brK8//IUwyOQrqmwaF/qp5muxdAO/Q29/2OJQBwO8dCHdjqDccwdERoTTeDRS8U2ZQQdA4q1ttZ
	qvfA==
X-Gm-Gg: AY/fxX4Wcx/20mlO7vCRyBz9DNXOyv7UxNNwR0OMc0hJ8WmPQB/ox8JBToWGxHGUnH4
	TqqvotVsa3Po1ffC06gN5ObnjuRR6W+pPqi/rZVMxkX+tIPzFa8AJ3AzSMuQ31gmVC3CaRV+Rjt
	XnVxS3qWmT8L3B7wqAdiqdLZ2hNi+GQS3z/ywmDHvoZKNaoV+n137jvBR1XVHJ3VRHRMGPl+xa+
	Ko51XI04XnvCyORDkp+Do+gUHcfQS5IW31gm2NR1ZOMJzqDE7oVwzFBWKG676PuI8ArC86b/8PD
	Kv3dF5sPQtw6QY5zZJPu7oq9pIaRf1ZojWF8pFeOJ78b9EytT597PMEttlOLklGLO55tIxiSrda
	9qb7vPzEaqo13FL6+lTSvyNuMhrpvdFEIJu6X2S8bKmVANbDU3R3El9VNpzYm40VMxJ8=
X-Received: by 2002:ac8:4808:0:b0:4f4:c11f:a893 with SMTP id d75a77b69052e-4f4c841ce15mr13310211cf.38.1766327189835;
        Sun, 21 Dec 2025 06:26:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6MSj9kp3XaPt/Hj5dvTyhFXG7Ou9KvnYkLbuj3WrXScz5IKiaHkNRDJMrQqc7zufDKoYpDQ==
X-Received: by 2002:ac8:4808:0:b0:4f4:c11f:a893 with SMTP id d75a77b69052e-4f4c841ce15mr13309851cf.38.1766327189276;
        Sun, 21 Dec 2025 06:26:29 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80620c4520sm211742666b.28.2025.12.21.06.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 06:26:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] iio: adc: rockchip: Simplify probe() with local 'dev'
Date: Sun, 21 Dec 2025 15:26:05 +0100
Message-ID: <20251221142602.47368-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251221142602.47368-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6007; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=HCB26hEUOkbZ72ftaM1RnljHTQz/EsE98Plg38e2Ofw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSAN8/kcgZNFHUfB3Ke+DoF9mdl7RgO5jsfjBt
 eN2YOKEHeqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUgDfAAKCRDBN2bmhouD
 13OzD/93KT9dmliMmsuwd8OOM8ZuIX084rVOcADFrvVtzozY0sU8KlUTvYM/rPMk0reJd+QgIvq
 N1LZVujUSp3iYnYUk1v9/iaXKnbIUR+/kU5gNBZzoTz4FuoPXnQHzHjqJw1nPmrDaas93l0YR8M
 2F9VZuU7nELtirflYtOEOtzAHIfAwxc9GhcslUuHTD44dtc34W8s0xCzXB6m91DKH3T2u13q5/F
 BcS9YWPjAZ2kKw1Aa98hxwXSb7yTyZQn+D+74OeuF86xg8ADZOUV7By7uUJ19pR/uu2Pabl9Vit
 tk03JUTPTlUKzFOqQZ1N+5fTxjFgNRn8TdzVrQoy1t8QexBRo5lTSlpAQ5RTe6ft4lW6dDti54R
 b28cFZyN/z+a/lTu4eMvC1oRNEZuyGoWGTKxE2UnSTWcdzSebTUOXh/IgV+faAzEk4SRmMXsehU
 e03NBnIIcXoeoJbe99uJ65vYEPTD5PD8ktls9/3n4bMNjCscHwvkAyMWw4Q1GHDPbo+RFAvjP6b
 PQBZFt5IFj7vUJm5Y7zD0EK4CzgLbBrDhUtD1D0HIWOAGwpm42ytcF00VTiSJbwKoUPjsXWKMcl
 xmcwRIBdcM3Otrdvl/arbkZjZtD30tpJ8Ugl21DoVCX0mBCn8vziGIgCM8MlzXgoj7ax6ltia2L xCpbZ49NWUj7xbg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69480396 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Dh8f_jLqcEms2xoULN4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: rdBqe3e7p2y9BRg4qC4HnVEbaHNx3Mu-
X-Proofpoint-GUID: rdBqe3e7p2y9BRg4qC4HnVEbaHNx3Mu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDEzNSBTYWx0ZWRfX8C+DBLqC6MEC
 jH2XMCJH7FjXFTa6GIu05KocI/1zcc6dl//vml/eHwd5Dvk5Xg3d1ad6t9GtETPXzGBs6WyCH0i
 92uJqqmvYHNUuDQ0fuGcJS3KVEPTg1OHaWPYHe4aMliA8gwLTW3z5xnPXh/ZZvtE/5sC+Dl6Aa6
 UeBDJ2EsM8L9VPFVh/KcXD0uqI3DwosbnKcsD23qDw+TyfYNvvNea8Uz26LSoPjhXro0w2dyn1R
 FfVO7WHwkZHHX/vlwkyPG+qsIAaT73FHZiqZOwYqnZhtiyCeEGVnVFXUIZk2LE8UCjkR3cmQTwh
 0kRlk8zMfspWzVZiLQRN9QZDQG+hlHBuCsj9arXZHGpOnTRYAz01zwEVAChoOL4QH/UtFt6KEt8
 GouQj5mpQfZEOAkh3O/Fu3C+Jqlf+zr6kG+d7GeP7OBOJOEkIV/svx953/jdGqRQYvsGm6pZYQh
 FXif6f+CayMGLlgXCMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_062631_691234_7065E801 
X-CRM114-Status: GOOD (  19.02  )
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

Simplify the probe function by using a local 'dev' variable instead of
full pointer dereference.  This makes several lines shorter, which
allows to avoid wrapping making code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/rockchip_saradc.c | 50 ++++++++++++++-----------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 263d80c5fc50..0f0bf2906af0 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -456,6 +456,7 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 {
 	const struct rockchip_saradc_data *match_data;
 	struct rockchip_saradc *info = NULL;
+	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct iio_dev *indio_dev = NULL;
 	int ret;
@@ -464,23 +465,21 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	if (!np)
 		return -ENODEV;
 
-	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
 	if (!indio_dev)
 		return -ENOMEM;
 
 	info = iio_priv(indio_dev);
 
-	match_data = of_device_get_match_data(&pdev->dev);
+	match_data = of_device_get_match_data(dev);
 	if (!match_data)
-		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "failed to match device\n");
+		return dev_err_probe(dev, -ENODEV, "failed to match device\n");
 
 	info->data = match_data;
 
 	/* Sanity check for possible later IP variants with more channels */
 	if (info->data->num_channels > SARADC_MAX_CHANNELS)
-		return dev_err_probe(&pdev->dev, -EINVAL,
-				     "max channels exceeded");
+		return dev_err_probe(dev, -EINVAL, "max channels exceeded");
 
 	info->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->regs))
@@ -490,10 +489,9 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	 * The reset should be an optional property, as it should work
 	 * with old devicetrees as well
 	 */
-	info->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
-								"saradc-apb");
+	info->reset = devm_reset_control_get_optional_exclusive(dev, "saradc-apb");
 	if (IS_ERR(info->reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->reset),
+		return dev_err_probe(dev, PTR_ERR(info->reset),
 				     "failed to get saradc-apb\n");
 
 	init_completion(&info->completion);
@@ -502,14 +500,14 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, rockchip_saradc_isr,
+	ret = devm_request_irq(dev, irq, rockchip_saradc_isr,
 			       0, dev_name(&pdev->dev), info);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret, "failed requesting irq %d\n", irq);
+		return dev_err_probe(dev, ret, "failed requesting irq %d\n", irq);
 
-	info->vref = devm_regulator_get(&pdev->dev, "vref");
+	info->vref = devm_regulator_get(dev, "vref");
 	if (IS_ERR(info->vref))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->vref),
+		return dev_err_probe(dev, PTR_ERR(info->vref),
 				     "failed to get regulator\n");
 
 	if (info->reset)
@@ -517,11 +515,9 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 
 	ret = regulator_enable(info->vref);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to enable vref regulator\n");
+		return dev_err_probe(dev, ret, "failed to enable vref regulator\n");
 
-	ret = devm_add_action_or_reset(&pdev->dev,
-				       rockchip_saradc_regulator_disable, info);
+	ret = devm_add_action_or_reset(dev, rockchip_saradc_regulator_disable, info);
 	if (ret)
 		return ret;
 
@@ -531,14 +527,13 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 
 	info->uv_vref = ret;
 
-	info->pclk = devm_clk_get_enabled(&pdev->dev, "apb_pclk");
+	info->pclk = devm_clk_get_enabled(dev, "apb_pclk");
 	if (IS_ERR(info->pclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->pclk),
-				     "failed to get pclk\n");
+		return dev_err_probe(dev, PTR_ERR(info->pclk), "failed to get pclk\n");
 
-	info->clk = devm_clk_get_enabled(&pdev->dev, "saradc");
+	info->clk = devm_clk_get_enabled(dev, "saradc");
 	if (IS_ERR(info->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
+		return dev_err_probe(dev, PTR_ERR(info->clk),
 				     "failed to get adc clock\n");
 	/*
 	 * Use a default value for the converter clock.
@@ -546,18 +541,17 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	 */
 	ret = clk_set_rate(info->clk, info->data->clk_rate);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to set adc clk rate\n");
+		return dev_err_probe(dev, ret, "failed to set adc clk rate\n");
 
 	platform_set_drvdata(pdev, indio_dev);
 
-	indio_dev->name = dev_name(&pdev->dev);
+	indio_dev->name = dev_name(dev);
 	indio_dev->info = &rockchip_saradc_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	indio_dev->channels = info->data->channels;
 	indio_dev->num_channels = info->data->num_channels;
-	ret = devm_iio_triggered_buffer_setup(&indio_dev->dev, indio_dev, NULL,
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      rockchip_saradc_trigger_handler,
 					      NULL);
 	if (ret)
@@ -568,7 +562,7 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(&pdev->dev,
+	ret = devm_add_action_or_reset(dev,
 				       rockchip_saradc_regulator_unreg_notifier,
 				       info);
 	if (ret)
@@ -576,7 +570,7 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 
 	mutex_init(&info->lock);
 
-	return devm_iio_device_register(&pdev->dev, indio_dev);
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static int rockchip_saradc_suspend(struct device *dev)
-- 
2.51.0


