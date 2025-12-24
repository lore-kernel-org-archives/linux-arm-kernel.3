Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA63BE74916
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COM+zBrXCPijvu2egEEzEh1RYwiOZWrS6FKcFIHT3/E=; b=swMapbLGD6N71vSLk97zduxDql
	7hWYpj54QcN21/+6M5Rm3ryTM+Eg8/vczzR5Z6YE3oLiMUCVCteDJki0NXvtFqMJCKC3XbgT3hTZM
	RrcleWIMgOyXNiBDKGX0B+8egItEAVNnF6cdxphy27BTlJEoX1AawbMWpbHNUWhaYa+YabVyuDFRM
	ljxRFbTgmcIM/pFXfWa4XBHncTsi4SdQkkBV14z21Bbi7uhwqGAdjtb8m113ftHdEh3y3o2iwJQ7A
	4ZpKJPxiAgEHlRARj5QSNEZmVmJsQ7B5EpUGCH/utpjfM4u60g4tjSTzJvlGCT9X6KkNa9iYvBF2u
	iHeqJEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMxC-0000000Gjt0-0dU9;
	Wed, 24 Dec 2025 11:22:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMx9-0000000Gjrl-0uIQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:22:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO61faL678252
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=COM+zBrXCPi
	jvu2egEEzEh1RYwiOZWrS6FKcFIHT3/E=; b=hhgtsILN1FEAkQCuaXJj7LxNBuz
	gMTjKGZGC6tMLPfF9qNNIcFp665kGIJ5vihNeTVFj9qUtEpZd65Pllqja1PFRXRW
	Ul2EFV3yd3Y98/pSVU7vFxTqbxSdG72DDB4SxbqCICK/WNExrIAdGMmC//0Qx2Kq
	2RNzaFPzLtHAE7JldGEPbMdOCfaBX7pwMLzF/WliArG0eXI6Mk3ssukoLfi6Z8it
	HCJKXdQLBaZ65i/8sD3phXNFnpKk0UczpxrZ3qGFKOHP0lDi611L3nbgXG+hI8Zi
	oygHw0F7n54Ac0TytOED5ErAMcit23GkLyWblk/BwQD12uj4q2QiOimAAug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq2fcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:22:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d26abbd8so158739131cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 03:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575370; x=1767180170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COM+zBrXCPijvu2egEEzEh1RYwiOZWrS6FKcFIHT3/E=;
        b=f3HfpyiMSd9/R1cAuOl9cNr5rFNz3Qi7QOUrI+fDnFK9NyHiZNZYqvnQQDWMkij6oT
         TtRbp1fjNoMpFE0upYi+iR99VslkWTb6sD+CJ4KwkrSWSZIjG4Jkm9u7ZJFRSkpQ5lHf
         IHj1mqaxZF7Wy/en6huEYh7D6eQvkZ8Q9bDN/YrbGBThdeVK7rr1VE4hPu7LNzrNUGPV
         Uqu34ALTcvK6BZV/nADFFuAHXXOFpPktGeFkGDwqrRZijX+bl6FayYKkn1cC7+/GKSQR
         KDczhQ4mvMH6XuX55t2Cw8IsPkVt2s0nJplqS94ft3LJRn41Na8sgCnckYea05zaFnyw
         ZwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575370; x=1767180170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COM+zBrXCPijvu2egEEzEh1RYwiOZWrS6FKcFIHT3/E=;
        b=rGb0L8Dm1NwkqnTFnEpzbPomSTGj8MfZGtk2nUqGTWWvjm67m7rgWYzuDRxFNLOXLk
         +wptGs0IWc7l5MSBTSowFopUwvWKztCO7sgqxR+dr2boFZStcGiXXdkyHcwd4Rx+7CGT
         e/wk3irEAkWw9boOcLLAERSzy2Z8QcqTe9BJW+h/DY6SR8LAmmchhba96OzyiBD6Peiz
         2WBECvU3eDpCI6Q2LAhqfxPebnt5RwI9+HKEsQFx/MUAFoN5QBKkjYkurkApw/4Z3QbI
         97cXCq13x5rnzUL05N7VirK5cbfAT17ECpaJ2h0ds3S1t1ji3rXgMBWw7WI1lpdS7ehI
         8UMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwUx+CXGDFXaUrhu01L4k48ympgSq8uxycSca6x2pmEagTSS7gpDfhgp+Vao7bsN2LXVJpn9XO/md8U2FlgKmB@lists.infradead.org
X-Gm-Message-State: AOJu0YxfNe2Q+Sbvu1l+yAOSyHEXa8IYaMYGJlb7POey8T/nkPx1cBu7
	Q/SjenPtDmr//kjgFPz8lUagO3QEo0WgKbtlGXK09jy9nUgmSMwzH/guWrDOeYi6pB3f5Tmpz9a
	0QKG1QB92SlNhPto6sUbx9L/93Xvm0rND+sfyaZTrLXSSQWoirTJnqi4rxT75AOmBIrdYmT50IL
	AR0Q==
X-Gm-Gg: AY/fxX6tI08ZGd7Tlytip3NZnKoDL+gkthfhJhgM/NM4QKC876Yg3wthf7M2FyFBQha
	hZ/Qjg2n0O1Mpm7jo65GAwo0DoGW7JA2xCpWizO/m1t+NWmnqLTIhMAvYzhpkDcUip5t4JlaeGk
	tl7HO5hGfIOldLuxr6DuIwjIJ4jo8sBwAP/NLfG7N9+It/97kjzFI/8JDSRAETW9Locj7igtPnb
	4wu59d9Cf9ItLjz6n1x2nlkDTQxKax/43zgwYCsb7qvIUz0/tt14w34Qv/CIbzdsED/3HmgEvnC
	3sCL4PZxIw/6yF+52WP9Pb2T0gtn4FjGBbWzxbVrgEX0Z7vn3QGENP5EAPWErLcu/SEDXYrU7gb
	o1qgom9Ta/4j3Hf1oMLE55n3JgfsyX2FMqydxpgCyVoNf6wDDULIYldyHne5+6DXiRY9rLQ==
X-Received: by 2002:a05:622a:4809:b0:4ee:1bc7:9d8d with SMTP id d75a77b69052e-4f4abccf0a8mr210421501cf.17.1766575369902;
        Wed, 24 Dec 2025 03:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR87w4gMis8CMvpQOWNQdWf9H3SRiK1lC82XqWNYC6vKIKwjEYpvWSpujAmg5WZm0kqn3SVA==
X-Received: by 2002:a05:622a:4809:b0:4ee:1bc7:9d8d with SMTP id d75a77b69052e-4f4abccf0a8mr210421221cf.17.1766575369458;
        Wed, 24 Dec 2025 03:22:49 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64de4798077sm2042514a12.7.2025.12.24.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:22:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] clk: versatile: impd1: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:22:42 +0100
Message-ID: <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pSKmaxlE6I3zeFW27kebuzva4yYi3an+fypyqrcpva4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80BJyjiWjILXGQMETRyJ6WUzhIQs7qaIXMM0
 VypiGLMctmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNAQAKCRDBN2bmhouD
 1zG5D/9Tg/0wMnhQu/f8GRgH4yIsyeFSDvZ2TLmwvkl0WfGFwPIoVnBumaBfJSzJFyVf5YfinsI
 IgdaE0VvqtvqL3b5zfXNoECv/nyI2X1MySzuZuCgQqxnvtYVKodsHAxsDWXY2j3PjRd9yg2VESA
 Ha6mWj5FDpWkCnsK62sBCyoHcIwFh1J8E6WdXckzaFiPKdfqw1eY7J2xdY2Dw6BeerZyk5kHGTa
 vUCoQJlboO1poe0sefzn6KKjmNU3cZVjg/y+KOHfAcMJ9fAPNtaUaI1+keOWSrdzI6cqtjRiUh5
 6GQoYoIfBSPazAGPsWqo2QQOXOHkhtnNjeT3cQVZyWmQwXiOx9HFZuJsTuHdtOkjFR7Erc+cA9L
 tB1F/74oUhzivjhLDh6VLY+43ltaW2CME+jXtwjKAjY9wwXyunxzcGaLNawpT0slb1BjVdDFB+L
 XZGafHynLMCQf96OV6LeS5D3ncGZsG+PqrsUOZkYnXEV1u0nSL6sxA2R1WFoxyS+vGr3fDIL+h3
 /JwUFO6o+hbhQ0o4ZGHC5vobgfBdCdFhPgC5Jp7TRJnUofXKFqpTN0Rdk4qdVtN0lUWoT+CM39y
 VfAg4lgH+1JkkfLOtcnwXkf31+719JswBla3FduA1ZNRbYbLQEqLIDg4ru4nD030Z7wxeYjcPbu Rx6M7YW5tG80Plw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iSAXYRR5Z1KdLNVmW20pgKhYZgtOaAtI
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bcd0a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7JSHx21X_fq2Wc9MUqoA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: iSAXYRR5Z1KdLNVmW20pgKhYZgtOaAtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX2mZGKJ/hSZa+
 /jv16/6ulfVdn3IcZs+SeQVRTJm7okX55ITC87Z3xpZJp8A+0bLJ2ZA8LTUArg5U/7iCMfn6Utz
 jzJwvYZ//xadah3htmeXmVwnzbWrqq3LXkYIF4fWlkjBEnPJRpg0zjI1lhtXy61X1+LWJvLDr8j
 aY6KaQWdKiY/aSTrtqlC/ke0+Hxgtqi0Nqj9ZoqtqDUAHkLiJeGkz+QHkRjIMRDRpYnHIBT9oUV
 PGA6M5YS0wwMjFIW86lv++XDOUPFHFkq1eS6ijYdnUBN4yQsrhcca07Px1H9LvDOiSinBqOgmSe
 TlrEcDZoJSHSNV1xgKvWXtnlKdOC5F8jkKSyfRQ3RHsG1B4yX0EigAJiukcPaP4rOPYRMxZYuxi
 3KsQukeY0vTGGztiqtnq4/u7asKIh+KyoS0I5d5Swxv7/vH8eK8wWSGOLr2Yixy5za2y51PCW34
 Homz/kLwntsSYgwTs4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_032251_255966_151CCAAF 
X-CRM114-Status: GOOD (  15.52  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/versatile/clk-impd1.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/clk-impd1.c
index 85c395df9c00..328dd47f1e43 100644
--- a/drivers/clk/versatile/clk-impd1.c
+++ b/drivers/clk/versatile/clk-impd1.c
@@ -104,15 +104,12 @@ static int integrator_impd1_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int ret = 0;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		ret = integrator_impd1_clk_spawn(dev, np, child);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			break;
-		}
 	}
 
 	return ret;
-- 
2.51.0


