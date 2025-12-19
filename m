Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B57D767FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1SiMSN4YFI47fVa4EmdLS4EUY7t39OCz7eP3piX5/4=; b=HV9eTT7/4vIQt2HzLR8vheUX/y
	akA0ZoXWZslZvZl8TiKvoiZdEyi9wOrzuhavFW02SZDMQvWmwckRNUy56FebWHFwWsqNxyX1zPMTr
	j5tq39kz52D4GhbFVS1yADHJNllyYnKSpza5tyEFzQOaIvb2LNTO9bPo1XLj+hldw5878KoPCG1lU
	n1EocPCqmBqvrbelXFkOb7jh0Pg/xWb2F0cV2N917eNAc/spjR3M+nlk3JdNr1cqcqf+sJBJNLyRJ
	J59fgb91fTZyp9QrS3eiVaETvHFbzxC2CscLbZRPn3mLirgvVfWRo3IvzRtzU6YjfwjlErmdI3/7i
	X45UEGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZMN-0000000AGRt-1GWd;
	Fri, 19 Dec 2025 12:13:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZMK-0000000AGQ9-3Bae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:13:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBkpXj091962
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1SiMSN4YFI47fVa4EmdLS4EUY7t39OCz7eP3piX5/4=; b=oAoU70eQ+UKsqRJm
	9h4Me6M810ZDhXVcAmgP6QH2v72cm2idRcRE3KBX0EdGiZvxFU3AqbIKkovX35mn
	/DCRS0tx4VqC04kxXHy2BggVAK94/CdnppUmvlXI+27BUxRcenP6OFLBzfswqRW2
	0HZmBfCJWab3sazQHINHY+OMXQn8BI5WFhcVgoTIj33XFAWjretSRO/XU/obAo5P
	k4xGS6YjwoP0kq3a8BrP4pp0wackkmHJEvbICILodiJ3BXjKkPezW3jjvSU8Y8rr
	eXyCkuZJU2bReVBq5Zq/5C31J8PPYl5FcNAbAb/A393tULWPvtTeETw3SVdlZfat
	Xyfwwg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eak3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:13:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso50965761cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146403; x=1766751203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1SiMSN4YFI47fVa4EmdLS4EUY7t39OCz7eP3piX5/4=;
        b=bZhxKFdhTP7vb5CJaqIhNqx4AXLBiEqSydp3BXtum5ZBuF8Gfgb11H4jt3dK7H4CrH
         Mf1OwzgHdS6MWFQbd6tGZvPjHVS0oSPuNR65wt7NkPVqIxhHPnSzfZFDcO+S/w8XcnKf
         ZGiS4OcK3Tv0eFLX3R1nACWh9qYWhjbupQ6pFMAHJ8L/xw13/O4U6WM+w9E3G6bau5JV
         PoNVEMahn6t+8tWUhSji7n+P03X1kfR9WaNJ3CMJPs71Pmwx6HEuqXdiTehP8xfTt1Mm
         mhwGswWHkxZKaSaBm26z5E/jgFN16xuHhNr1yzFR37eY2I4qGSD/gojXGJp6rlIOxq48
         o06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146403; x=1766751203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N1SiMSN4YFI47fVa4EmdLS4EUY7t39OCz7eP3piX5/4=;
        b=vdEF7LVDRhMeAXjLQGZ7eCewZqDCu2zWyno3+6qbhPEa0TF5G6ibyx0/tOxtqQaJhf
         S/d2YV4kqumamA69hg+3InNiQxNCTIlNBK8F0DH0RRlT3vQJmErTPAsU0luSw+lcRQSD
         LBgD1bGiH+XPU6Ph1+kKoE6/hREclo8iZaUJQuyzm+gHbnPz2DwFaLMoZ61ngfyMwb/F
         tzott9Gkr18tzbP40CiIwpSO5xR9cK6AHskr4PV7wCQr6OVgspqHKZFY0/mcRV5dkUIc
         7uIDzDjHCzGEXlOMUxwugFTHmFyWzgpYOXM6r5ZVcR71zsqLvmc/ky5pIgd+uWCATYn7
         Mc5A==
X-Forwarded-Encrypted: i=1; AJvYcCVVHqQxvdyxr6RZkpFtjSSA1SS1Rx7f4xZfsECWwvCNaA4dy466lpUYJWWIPVjuuErQwu846QQW08S8Og/e7Sp9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp9RK2IE9o+JugI7lWnxJcKYXdIUp/samRHk//eGgL8O593OGs
	DIyR11cThw1CKkorbVs9RIi3JHb3W46LiywHg/CPr1B0Hu4Va8kefaBnQSUea64mBIZbljrfGW/
	tF1u2QZrIIfg4WLnnQe7JXKtPF8yeuuz9Gxnd0CE3HkyZ+5xxnnMfwkbf+iGcd1Jpl30U9mPxgH
	62eA==
X-Gm-Gg: AY/fxX5dsEO4HFLwTPfb/+IaZ5bab5pqBUC0uEdwVLLigz2zC8A+Kd5/tWnFJ9HI1cX
	JLvptX2Q+z9u2sZnno/6wDizPiRg/NRiP6edyewq9Wq3oyAwBkrETSFgCA8VueP87AV9fwjaXGb
	bTCRe2QOvYyC7esKiV3L9c+nMpo3GdBYpvvEphRU8Ji2PZNuzK5rTkH/xIkQua5/dsq4ADx/zNd
	MW1/lz/C3XrLzVDwdPntksO6jhqmspF+fomszlTj24LWLh1ZnsUS2yw96q23zN0LkM+GO+fLZBJ
	sl72/DGyrtApz231EvTkiewZql8Dih67+U0Ym9p1iECOcuXCIht5B/vuZTKMvatirQXkzrecJM/
	Y0IHgE38JeIJIjT9buOWpy/B7cocnnDd0HZHLhVeooR7zwWQ+TjrAttgj6pLu4G4t/Cmf
X-Received: by 2002:a05:622a:40c4:b0:4ed:aa7b:e1b6 with SMTP id d75a77b69052e-4f4abcb8c61mr39213291cf.12.1766146403254;
        Fri, 19 Dec 2025 04:13:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYPcW3PfPMaYa5ah0lfNmydmhG1OoCxBqy4V58pqAmy3pqVEKIRr0KG4hKAWOlE4QVSR+jVQ==
X-Received: by 2002:a05:622a:40c4:b0:4ed:aa7b:e1b6 with SMTP id d75a77b69052e-4f4abcb8c61mr39212871cf.12.1766146402846;
        Fri, 19 Dec 2025 04:13:22 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f48606sm220309466b.62.2025.12.19.04.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:13:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:13:13 +0100
Subject: [PATCH v3 2/3] gpio: creg-snps: Simplify with
 device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-gpio-of-match-v3-2-6b84194a02a8@oss.qualcomm.com>
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kQh9fxqgF0kkLwllXs7yncT1rqd2kM3SqX3A0JVP670=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRUFcitFmh96JIq34IbMP3prMi1Qv439mdn6P6
 pO/55cXvQ+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVBXAAKCRDBN2bmhouD
 16G3D/9MR2b44uM01ef1M+Bm/4qifQ4xOiNZUWkSJhnzHwxwPTJcZk015ecjjs0wHCt/CVuc6fg
 JMbTbHa3QqUzrOxOFOgNDndX2Cwbm/0TxMsRSejmUrLApdeywMx22tOEjr619KzQvR84+pquTHb
 dA4LnsD3ft3RVOIWUs9ozIeg2/Hyd8EcBFTPkqave/fazJSiiqGaAdRyyiufvd4U/Ook0amT4o8
 NWWUEH4FYl2OrH+3xdxNBCHJowcAP5T4kD1CsqjR1YXdnQH8Nh29uC+RpLbi8eQoLSklzhEw0fS
 vgo4OPfMu0legugoBTtIbMj3xfZ5D5xFb+YHQJdg0flH9gxnDOUdqFNewEJMypm9Eu97ZVBojsC
 tErUii6TnOqWBtpN4jFlMLA5ogxVaU+Kxfl3BLd6TN2O67TDyQp+hsAhPpttaAqjU7X/h//20LE
 jddOb0qoMc1a9X/EBlwF3InjSKaRYORz753RXJpyhwiKvXabTXOAPoYW3eD2XKlFip7kaDKE7ds
 FFoGZk5pJasjNXEE3hTphHI4F/yhooWkgFrliK6XzUpkLa5LgtHd9tPqZGOkywqpfPTX+qR0W4z
 2bRo8r1oCorUGiJLFexpdADlS3Nag8ER+7RWolfxUsgdrO+Xaxh4Uv7uAqc2IZVui4hLNHOeHGI
 uyl0hgYwVIMYcbg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMSBTYWx0ZWRfXydCBCrPW8U5i
 KoKRslyag6uVWMzfF9jwgIAumrucKXwVvz0kbcUbMQnDoMgWnjNcVmmQOr7mG9EGDsh/xLVDXew
 rBVVm8dh8MbEEZoYBxNK7EEoQPapQQL79i5IEjo+WKdrWlxwngqqHqhQJX50tj/j6bYBfE9HUb0
 CwnICTNdhRr+nw4JfKYZHqw4sH8x7QfZ0qel+t99QMpZNQv06ZgsFU8VJ70sc1nlbcYa3eUgVN0
 OtmZkDBCCNgplvL4yVdp349ebV1Bd2MzCgvRpAXhl37UAEvjg4bg0DPi5Fv5dSNC8LMw7/wKBcb
 tTtToLtK9TSxSH1AJxNpYvNfzyjzg3PaU64/Ap58yz23wbnuhe9L2S052/5aGu3jAQbD3wc0GNB
 3r97yE1kawfmwUP2gN//s2frQk+wHV2QQG55jBBOLS6RQCHFC61O04xsTQmZXYACSmYGisYyNRB
 rcYKyqZ10gQxOPsRuRA==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69454163 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lsN0KVCTPuDBfKR-m84A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: --xmPOb74FuBqJTbWQEz1MV4TVUymc9l
X-Proofpoint-GUID: --xmPOb74FuBqJTbWQEz1MV4TVUymc9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041324_923588_7D2FF97B 
X-CRM114-Status: GOOD (  17.00  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpio/gpio-creg-snps.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index f8ea961fa1de..157ab90f5ba8 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -134,7 +134,6 @@ static const struct of_device_id creg_gpio_ids[] = {
 
 static int creg_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct creg_gpio *hcg;
 	u32 ngpios;
@@ -148,8 +147,7 @@ static int creg_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(hcg->regs))
 		return PTR_ERR(hcg->regs);
 
-	match = of_match_node(creg_gpio_ids, pdev->dev.of_node);
-	hcg->layout = match->data;
+	hcg->layout = device_get_match_data(dev);
 	if (!hcg->layout)
 		return -EINVAL;
 

-- 
2.51.0


