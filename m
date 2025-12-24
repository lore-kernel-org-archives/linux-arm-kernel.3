Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C09E7544B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIBKnWae4catNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=; b=xSdpUJrl5KoftWGq6/nJTVOCEe
	WdKa4+m/qlXI5uas+rVxHSyTDIqED4u38CdUJ5Bw3UOcF3uHca3hgWwixVicCPO898mQLRwUcw5+H
	WQRZ0Ean0iMNXWygVRmYtdb/jqWY73zGCAWhLlcc20OIOcxbMzztrRgegq1bkMxup/v5EUCprXd1x
	ga4ouBfzMXYNcTOTNTAIQeIMIyr7JdxY5xDLVYsCjIE1HouYfi4JY+ofV8rX3nYMW0PW8Lks+mG1W
	kbrja2oiDoRA2qRyH1rX6Ik55uWz8c+W1/uNFY6sr32AY9p2RGTGu0DVVKL8FXte7DCal2JY+KIWL
	kKwC9g/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOEY-0000000Go1m-258t;
	Wed, 24 Dec 2025 12:44:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOER-0000000Gnww-3Eff
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 12:44:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7IlM5678224
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pIBKnWae4ca
	tNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=; b=YmVfTXwSg+dzYWqzDS2Fpsnl+k+
	SoCPXSRlgSckh5iv5ayAMfxhfXcHJOkKcOHnKH8GO+G+PiIEOqh5yxvfzsvHvagh
	DsfzldtCWsLRZYfFfMiyj4BBioW9ZIbpAmldVI2UZI+qRHzxOuer4u5TqfyiuuHl
	bACTzaQOJHgjRDbHTNTpnL9981mFYhB5FqCtQQeIjKlpeVDTHcG2+McanmvDXwBi
	LPforIBOwwkdCel6R8oWLCRoBnJkER8aYz3DGpb93+EsTNsEcEqGtmlpfBAjdAbj
	WRgUUrxD5HDQbiZhGy+FNKF/BgDimrPDuNV872iYi/jr1GpII2a2ac7jPpg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq2mb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so160833041cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 04:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580286; x=1767185086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIBKnWae4catNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=;
        b=ZJBWZ23wGbS3bpgsChB3fe8Vf1OVKgu6xezQWOwbnMYRZi/4YcjllymWTP1qQWmdG+
         52MotkDpwfgxWZjnVnpedElkvLcKojl+Vevq64J2TbIFuClHFy3hfotJMMDM3I2TyQ/x
         X1weM9XM6GlbIqOCd/y5DKY9mdbLVFIJdQ1cbVVAXAICtjPbPAFBINJJ3JiTjC0RG147
         DrAcHak1zy2roMPhjjJiXQ16k9hUUIMHmMgxAgbNB/7LGKCJ2yMuYnrKTtdstNdv6IFK
         vSswSQNDtDX1WL78HgL3YFeAoupgF1CbXswD8B3+WVvNZWT+boY1ugxcyW+PGJJd0Y7g
         Ly1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580286; x=1767185086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIBKnWae4catNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=;
        b=kyyEMBFsURfR5/UI+SJyd3DT2eD5zLyXZwQQch8gtPoMx4ohaw5l+tBJEdIupC+NFc
         lYEzHaAR8AbKda0bxaLvFoCnihnuqXsPW8rQCR6tYNWkvDtBgDqTK6GjARGqBA20GtOl
         zhwADRtqI2eGMJNYaL7y8iCFkOANqI26jBNjNTFXDwG+FIsK/kox0rMv3GkYaT0CKsxg
         NWG7hakA1kFLniApg7l2wkE1oVtMlWAHbd1OC/iIeodp4m937LH2WI2VTOdhErXnvL3i
         eyjdWC0JffIuOGFrgzhtRppZvAMjYjvd4Pxcn43GV9qaS8JluQ3zuRM/ua2gXYgfOJrP
         W0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUMNSKAmJTd5ps5HnWbOOV5dgR5aEPnm3f45eMOR0rfMAil7pD7C0XYLyNz4/wVOaQUresrIzf+9T1qT7BmUwDp@lists.infradead.org
X-Gm-Message-State: AOJu0YyNeF7e5OiW2bPoNMrjVA0c/Qt/52xs8KNRsp9Rd/X0eWtGRBMy
	+YF0Ubae1M8z+7C87KoF4v+toIBpd4XwkrACJwJ68tk0n4+BJ751OaqWTZYD3R8sAHVS0CZndVs
	9cXvD6EjS0QhEARfoDxE9BYhZPCkZEGLaFd47AcUy3LwEFt7iewCpEuhbGSpF8Oey0tLjeVkEPJ
	dUxA==
X-Gm-Gg: AY/fxX4I6jdFlbNlYkgTGmKqFzWWyNW8Ckbi21PK1OVI5Uj020Ik0UpcypW3j8YU5eL
	UmNlnGk5YMwhNn5UVXK62pBVOoGkt3JkD3Y9OaPsFNwCd5cUK9SNNDIMeOdnE7orWa8Fz40hSeI
	FaWaHV/W105vbBYNQoFLbCE1EnZJrO9xtyjz/7NQderloHZgjEktXlsVUuEe+cIGRCRd9VgbgNd
	263G6DdQPfYZ9C6djXzlrVCdPeFhwVIAtqpaWiJHKdCewgYJk24rRahKJulyC47NjTnKJvrAYDH
	mX3mayO9OiLLpv6Aa73hDMLpt17OnbN7vxlFzxLRqBEvr7tZXsoG4uiQlLs3br4WNx08Buk71Ho
	ibEPkeCIzZPvjoUHyMGTeS6cwpOIrzyLMvZkyju1BqD4F5Gjwtwc3+veHMkuh1COpHU+uxA==
X-Received: by 2002:ac8:5a4c:0:b0:4f1:ab28:d9f6 with SMTP id d75a77b69052e-4f4abd03195mr248360161cf.26.1766580286429;
        Wed, 24 Dec 2025 04:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTZXliHT1pgcb3I+/DNRDGU4Mh4keA+YHzBcuOF/mpCrQZKYCA78vOX3Oe8oOjwDHK4oJOAA==
X-Received: by 2002:ac8:5a4c:0:b0:4f1:ab28:d9f6 with SMTP id d75a77b69052e-4f4abd03195mr248359981cf.26.1766580286049;
        Wed, 24 Dec 2025 04:44:46 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 4/4] mmc: sdhci: aspeed: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:35 +0100
Message-ID: <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k3fIiJQnt3//kLj8p1O4BhrfyE8J8CFmxoc44wKmiXk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AxsqyFxFGGpeZZHIhCyKOnvdjTJf+CTZuIW
 G78x7Z+JzWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgMQAKCRDBN2bmhouD
 17GWD/9Ixj1ULpYkMSdzu/q3hf0Kyx/91sewvClr8ICZPurrL/DEHrytAOup7j0UsUf2tqG+OyT
 q6YcG4NKAewr+dd4p6QyFCs6nsZ4iElL7Poc82/r2gIRHtRdWcCDaRZWlFvKMiR4pbqXC95Z0Zz
 s9fK2CprxcJVIOTMdjDqP0zIsBY7bn23YlXQmVkcnwj6tyDPDVeppRSNuLAC380N2f7msIhKcJQ
 hJkCfAP/LP92Cb8Yui3UoJ0pk0mYh2q1irGN9ANWu1j7Yv1py9TbXofb32r0aNUPL4eCkt6i9AX
 zFwqoAPZYFBnvUNpXZYwSzVTgpo+JA5kT7t1vKdt6z102UMhDrrYhFl/n/s7UnUZZnk+DiC45Xc
 GZeD1kOX3T1q3SuYwV8kE+G8vr+p1QLOS5wuBWwEidmkJfHGc/KRDVwreOXDAgeSMK93UbZqiDx
 +TXPEPeJ4QH2Y67axdeOdhhhsHD8xZ7XWxKOcjNoXkyIe26f4zdZ0F0NUBD47rgPILROWsCmicy
 waGD9LyfGuE8rVmiOhslBqiSQ3/fyNbBSlOfegAl1K/1fQHLCdl5E+ckDPH5j+NnzSiJGl/Ebvf
 jiLZwczT4DSEMogX90P/8nlA/WHEX+S/g9SdtVK2prE1TUsOpmany/Fame9afDjdsGeXptNT+8J g0yiZTEko+NQNlA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9rEvActWIGcoq-l0pOpznYppzVhuoj4w
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694be03f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=v5e_MpXYYeFlSKZv_FQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9rEvActWIGcoq-l0pOpznYppzVhuoj4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXyD8Yn+8nM2JQ
 MpU7wQmhREJrxUETT5sB9vwJE+uFafx6hzFXdIBqNf70nGqJ44qhbzL9npnwc7AJwxj5zxlwBSJ
 qT3z35UsdtWBwefPTtp/liQOLEv9L+4mJ+G6ExzAzPvE2cHvGLPHeIaemrPK1cle0D4zMdwAAuO
 6jpARla55JAaUXd1FhRQqZ+PCHYx71zEpY2hUZY0TkHXD0Y3OCXKL+CKnajhe1Xm8BO/wKbF8Zu
 qok4fwgcIrS8Cng4t8aON22/j+S9t2v5poUHvZpCBeMHrPyMyEZ2B+SpyL4EWybUv6dd6mCOSjo
 6GB/9YoujGywoWtWB4EhdN2Js9lbXaBejsVwNA9/0SuTvVjvdwMzdFruxBGyg8TkmJiHb8GC4ob
 RUbPXAITH3O/dpp3E178tq23c2JMCUJ2kjIIW9D4HAfVQxdIH1HzUCyyjzSHEDRpVJoDzcczMXk
 zTCjoHaxN6vkMg086oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044447_816757_D28FD5C6 
X-CRM114-Status: GOOD (  17.02  )
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
 drivers/mmc/host/sdhci-of-aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index ca97b01996b1..4296def69436 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -519,7 +519,7 @@ static struct platform_driver aspeed_sdhci_driver = {
 static int aspeed_sdc_probe(struct platform_device *pdev)
 
 {
-	struct device_node *parent, *child;
+	struct device_node *parent;
 	struct aspeed_sdc *sdc;
 	int ret;
 
@@ -548,12 +548,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, sdc);
 
 	parent = pdev->dev.of_node;
-	for_each_available_child_of_node(parent, child) {
+	for_each_available_child_of_node_scoped(parent, child) {
 		struct platform_device *cpdev;
 
 		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
 		if (!cpdev) {
-			of_node_put(child);
 			ret = -ENODEV;
 			goto err_clk;
 		}
-- 
2.51.0


