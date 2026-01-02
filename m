Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95C0FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vk4XdKLONJFLBfBC8QyNJZ5ga/Y4xWAK5bYjCEbSaS0=; b=rWvbpd7LyVAdK/MShd77iSqtXF
	5Uch90+9HNN1xKZHsa5xNmIzefME9qIsx8WpvmjIlwbGFmP9mnB6FPOnU+kSj4tfNdZdMGp4nN7+8
	bHQWptMXYSAzLH8iCSAUsI4AKO+zejlrgFpnbTP4xr+NTOv9DhXoS6xdg9BeJOx1Hb5g1ohjl3l//
	dplSE+x/50mubX/JzpjLyrK3HoUfQG+l+h5zEV174uAeEkKIvemDtpOBhrw+wM4QWWTZQbaqwhzJR
	YphehVtOeUGsYmgQtkxsh6XfklfJZZpFLZkMuKAjq+ubZjG5DfGBOCUFF7HFW+1dtpFl4aUijnINI
	8IKSrqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZJ-00000008D6T-33I9;
	Fri, 02 Jan 2026 12:47:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeZH-00000008D5I-0gPk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:47:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WGrr784980
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vk4XdKLONJF
	LBfBC8QyNJZ5ga/Y4xWAK5bYjCEbSaS0=; b=NT6JfvgQDp+S6QRituvjynq2eBJ
	Y1EySqX/4YysI/JxqTgdjoOk/ScHfiC2LhCu1+L5HJcgY46XpgMEq4qWJP0kKb6I
	XRuE4FVzAxidMfwxBjljcTuUDy+VDMOubomp93l2DLQv4ZFFMGBybM2hx1vtTMBS
	Ds+dvZhx+eLG/q2VJzsOgGTJsCBK39HMtEInB5MEgNvyQfQmBPMpetWXoZQHw7a0
	StHr8VlG/3BcaMfgzcKCx+mtihvl8b1+XDKStGJX7owYFQEYyh/81eidwG2jM2hw
	EzT1scVJrkYUsoAy5EgrcUsmgkjiy/Q7+e2JlGDkTg80beminEYB7LVF2gg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtkdts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:47:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6855557aso274588061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358065; x=1767962865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vk4XdKLONJFLBfBC8QyNJZ5ga/Y4xWAK5bYjCEbSaS0=;
        b=XrVdE4eHYm6PUp810Ie88PPsaWv6qr6Giw+Klf1UeMflloBOTxA537rNTqduOXgw+P
         xB9IS9O0dJ2IKPoRZR5f6DLjDUiQyE5TzVyXCNpumTJfY9rb6ChhAWwe/VkGb93I9+d5
         iTl40S0TwXvwUuCzjvZS7EXQ+bWkeCCEY1ig14E0PG06F902zCziaIahu97WStNn4yrg
         TKXyIxeaZC4XRi/Xf2x0cY/tya44O9YYhymbmN7+0LR6yIkztAXLy2D0TDx93yHdgmVl
         qUjofcGcLOk6jq9+AJgu2KKkYcEM/jN5Ac6KLiHblPi5IeyXAIVAxMhagvVqn+hZ/dTB
         DcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358065; x=1767962865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vk4XdKLONJFLBfBC8QyNJZ5ga/Y4xWAK5bYjCEbSaS0=;
        b=JAlKalBSq+N4J+jXs1lhueoKrB4a3EVE38GOrhMcOJCtcEBEk7+X+2R8xjjkPsYn6R
         HT7pFq6jCWOmgQPOkj6mUy1kU9FJPFQdksu4qgXnThGU1x/l/RjjomVssPkEuLzJgx0I
         MnAURE92Nr/SlFqcqfnRGcghMM++IEchMRGdEnVJzjp6jkiv1KZgvBJJkMhNAW4jyCPM
         hZmzKyFAKrDuLtTwV1qgeF9hcLu30f5xZwzd+zZKkQGgD13dH6n9ty1irRL4Gsr2OadR
         fql4O/YEg0038HHksQp0HdEhHXpu5MWqqJO6lANjnDZ0cIcSqNdJvkqO5RRKttXIFB4r
         OU3A==
X-Forwarded-Encrypted: i=1; AJvYcCUhSakYs20LL4jpks6e/0K3iZClTvlp3WfKhWh3eAXeqo33GZH/2ALnXTiAyLrkk+eg13H6yeTGujGJZr86UhDC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7n/CCg46ul072emwyrBwNNrwp/VKw6LJAWXLXlPCPcQzjO0bg
	XxuueGO1Xp1Xsxuct92qZRp2uC2A3eDCPBHxVj7pFmQKCa6GM9Ayo2PWjcILm0bCiGCAQQ3n1/X
	qT+foyJSTndwIQen0ClGxNqtoFQonfaCty+I1ejNMqHqNMIdsfkeJ6zcPowDIw3oR18ghMnVjU6
	53bA==
X-Gm-Gg: AY/fxX4zAf1RFJ4/UNwWcZMZDkwAaXUqdXyEqS0SsAj2qKyfvsYegho37Qn5rx8nDn/
	8XmG+52P5SLOwKDsNfw446Bit5sAcitvAa+18lSQkVJNSeyLeKS9ppqdGTlraWZwoPs5DUujtgw
	jYHpFL+daaieZvTssKFHTtEWPSjaOooVztOWZPqxposVq4JpQ5u1qLgm32+ziXgQ7zQKM038sJ8
	TW53IXK7oBOIy73bRKgClzy9GJAbaR9StQa6vGARsaGt2ZK62aZNLYOplxGgSS/vrmvdCAnU7lk
	xeYmj2o6SGqIoPxVhVH7wT+ZWooagne3KSE1fU3BZvUKWpiQV7lQbW3e0CcAWphK9Rxti2MqpME
	8Z+FMjBBPLHj3aUBYYDaDBILddQ==
X-Received: by 2002:a05:622a:2d2:b0:4f1:c601:3ca4 with SMTP id d75a77b69052e-4f35f456766mr661201361cf.32.1767358065593;
        Fri, 02 Jan 2026 04:47:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExI98edSf+hjr1LUC5kQ+mK2daxbjMrxkRfi6PAgr98q1JjP6IOhqHq6BQYx5FriU3v8pbMQ==
X-Received: by 2002:a05:622a:2d2:b0:4f1:c601:3ca4 with SMTP id d75a77b69052e-4f35f456766mr661201131cf.32.1767358065200;
        Fri, 02 Jan 2026 04:47:45 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm80255991f8f.2.2026.01.02.04.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:47:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/5] soc: ti: knav_dma: Simplify error messages in probe
Date: Fri,  2 Jan 2026 13:47:32 +0100
Message-ID: <20260102124729.63964-8-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7beO/uGQiuL0YpeOMQWRKUUzbc6c/dGn3leUiyp8Xz0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV75l8+wJmFUfi3O1qWWJ8vr8+qtks6jsBbd3z
 A+X+yPP2UqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+ZQAKCRDBN2bmhouD
 16fXD/0fZ3qgo4GkH56D8jcszN1jUuN9mJ0t0vVp31bBM043MLnvup+8IgbcU2eW9NMGI2ZJxED
 GoOuMgxy6FDq1xEltezBAqcvPQq7tuVDOzdKMa/IxK6xiBh6iwLUi4zW1KW4whm2X5EnCYEV4Xh
 ZnNJaoUxLeNwbS4SBEiYjDWgVs3Q/38fo99ZYElp5RkozVhsapwLvZ6UaPHR5U9Ala9A3yk0Zws
 RFUtxlbIz+Nlx8Zv5TZGxQyVeH4gVjvDp/JnRfDSIlFC4as3JhsGoHJ3HjM8U5kXNLUXtUikXZu
 DUQ+rRDzWcOEZ7NWIUgkBAkhAYYZdxiRFcJneV0NjME5hRaJaF6jRW7UtMw4s1Vqd5WonUCaNmd
 ASGOT6j8UAjLJPfJALGxo6LxEXEEX0p4/2lI6PIbVslJtRRdA00VlZo0mwiktGKVqhmPqEuvSts
 FGI+V83bKj/R0Kc3cZRWsWfbksPhhClEL+D0GnodcPW7IWpbg65x+PSPgYAoPOhukkC2s6TI5bg
 1VtjNgQMq7D77HY7ZyQiR8OzkRy4LKykDFpvXEqJ+PPCayvdFJnQUFns1KL6TSi5DTt88uemO11
 JWgGdlVyTAQW4AOKU5zRwFghGFWhoCb8Xc4lO6fvVuOjEdyK7ZYEQ+bDnQEv+/GoP0pr+6UfHNO NB2t1zmYe8k9E2Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957be72 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Rebwqt4EfotIbqq3o1AA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: STqvKA5w2fpsbGGqeAFsnKpJNa-ZTy1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXyMkTuQXl9Fo0
 JxWYvMVxRiqC6w+Cx593QOVHjf10IGhy3WcAIfbehpP6o7WeLqfc/lmdSftQG9Vc9qrKaJiStR7
 NE7m2Ecy+r8g5+tdAVarNRRakz6bRmpWvlwi0F13h91+CpG6X5kCe5996QdYN9tDT+uVsR1WWcT
 zUPac3CXoVAbpZn503GC6Cu6DecVBG0pVjVgJevIj7AqyLr37H5sxoVS2cUXDZK0htkgPR0Iz45
 KSl6EqdedPwL2sLBb4zGhAgI+HwGMHKvzFfY2XioAEKaVQT73EqrdkkJYVzUF1i7031hZwb+UR0
 QosIPXvWrpsHn4KnVOaaQF5sNNIM+dU56ZGiwg4Ml59dgTBTF1dBUcbKnCZal+jvx1Lx6B/de9W
 AgZG+HfIj/FAEXJfY/6b40+yJ3ybISuU1qkwMGb0MzGqM0HgWObLZEGZJHe3km54lgsR/BPvgC+
 vccB0O+FKY+jbZdrG3Q==
X-Proofpoint-GUID: STqvKA5w2fpsbGGqeAFsnKpJNa-ZTy1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044747_321309_1CBE5E02 
X-CRM114-Status: GOOD (  17.86  )
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

Simplify the code by using dev_err_probe() and local 'dev' variable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/ti/knav_dma.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index 93365bac2631..7adf1664da60 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -709,10 +709,8 @@ static int knav_dma_probe(struct platform_device *pdev)
 	struct device_node *child;
 	int ret = 0;
 
-	if (!node) {
-		dev_err(&pdev->dev, "could not find device info\n");
-		return -EINVAL;
-	}
+	if (!node)
+		return dev_err_probe(dev, -EINVAL, "could not find device info\n");
 
 	kdev = devm_kzalloc(dev,
 			sizeof(struct knav_dma_pool_device), GFP_KERNEL);
@@ -725,7 +723,7 @@ static int knav_dma_probe(struct platform_device *pdev)
 	pm_runtime_enable(kdev->dev);
 	ret = pm_runtime_resume_and_get(kdev->dev);
 	if (ret < 0) {
-		dev_err(kdev->dev, "unable to enable pktdma, err %d\n", ret);
+		dev_err(dev, "unable to enable pktdma, err %d\n", ret);
 		goto err_pm_disable;
 	}
 
@@ -734,14 +732,13 @@ static int knav_dma_probe(struct platform_device *pdev)
 		ret = dma_init(node, child);
 		if (ret) {
 			of_node_put(child);
-			dev_err(&pdev->dev, "init failed with %d\n", ret);
+			dev_err(dev, "init failed with %d\n", ret);
 			break;
 		}
 	}
 
 	if (list_empty(&kdev->list)) {
-		dev_err(dev, "no valid dma instance\n");
-		ret = -ENODEV;
+		ret = dev_err_probe(dev, -ENODEV, "no valid dma instance\n");
 		goto err_put_sync;
 	}
 
-- 
2.51.0


