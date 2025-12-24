Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88703E75452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q42Wt6YQQMyV5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=; b=zZXgzYCciJDjOhxALqRyCZdr1W
	k+lSjZ9H648nlpXtt1pYzqPQ0DfOF2s0SzYOjSDmj4YxIbFA/TB2ZJBgb9GPDM2jtsDwEvLtte961
	Ww1HKj+kIVhpMsSkaSKJgftOiXj/p+Rdp6nHZKH/X026mLQE98BhzmxgS+t6AnKiFEXAjq6c00uBg
	mD1NNp3VN3whS1V83+sNZuyf6fM8cFFs6HXmpCRJlVyCYY79Y+BulrIrkfc3MdEwtOOYDx4/T9HN6
	RCIJRBMV2E4zU2TnwvRO0Pk6csd1mYivz631oq2bYuUU/h+Fpp5Ai0SlOF+YkDn41s6fPSvWvgpI8
	dvXx1ZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOEY-0000000Go1C-0QBf;
	Wed, 24 Dec 2025 12:44:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOEQ-0000000GnvB-1f6s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 12:44:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6PKuj678255
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q42Wt6YQQMy
	V5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=; b=EyG039qluJLQrwOHYmf1TPfuYqJ
	EUv7Si2+J+Yn4uUZQAHmtkD2Rg90l0SeNMEz7XgDKh4ZAvhfjTvU6b40xhh9vqya
	QYhhgscCfAFpUCr9EdDFV1TbT9Oy9DALM839ltVE0aOmedJGJxfCfuESXwvCIf/v
	IX2Q2vjQlSkiFafQ+8THJPo6azKMMB1TBtzM22/I1bP1r9J4btfzErn2cuRYDcqo
	tejMeOlQkNLjqgOTx1J6AGwl8GpWyoiKnhdoYtSj/NpOWP/DCffI+IcrS6e0pYfu
	CZkTeai7dCau3/EpMmdrrzO9YvxPQ8mQ+ThyMmbeK5CJqbGYLttAosUY+Yw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq2mau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb6a94873so114771961cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 04:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580284; x=1767185084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q42Wt6YQQMyV5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=;
        b=E6ep1KbWJshdgvjUmctYTv7TCF3JnNeUXmQkOmaEYaVWir9WqSyHa5klmSmuLKU16R
         5xWdezOG+h5xcSE35GnzjxHey4Jp7OSEiNHy2JOx5xP4oWyVCw5hkwVuFybjwlTRfnVM
         gBdSJPLTXLw57BxW794oWalCLxSuYQOs9MTmf9qfJm+9z7TCrjxg0ZnFJCVrQj436Tmc
         yOXuxoiuahm8EBNZUSjAJAO8xnmqAFyqFvb+b/1tQIUdUW3hn2I/fQniBk/euyGbzjFd
         JyauZlhBeeYJW0Z7heQhFhBhFNU1MVlSms6OL3frsPD2+6MVDfPNAB4ojoTy6QvTrzgN
         WldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580284; x=1767185084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q42Wt6YQQMyV5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=;
        b=g9D9QOvDubEXXboeTPqewkxTUjU9AKy0vUyWESBTDlTHG9cbQWem+0ur76FX2M8D2q
         lBHWdn+z9qI7uATl9SxoBiVoFgi2/RM6lw38baDsy7/UxTDpUgD2dQID/wgp0PBLDhOV
         AWTbnnHMMDK4OklywuYYIrxore0QPCR0/Pb9kv+hCB7MJicxCOT+GKXGpajywwk3rc78
         1oCDfvCRJ6NVJej/eKrFQ/vc0XUEAp+FNm8qfmomjXGMdb8RJlAXGPi1ytqyGEIJRtA7
         m0JODdAJOi5hbBM5C1mv4nAcQ9zMqLkiBxiLkxOpsjAueZC7WUPeLsCJFBVaOF7ckudN
         am2A==
X-Forwarded-Encrypted: i=1; AJvYcCVAYqIYa4nrSDCxqipryenhuFvC8QqKDZGCHNqbgxp0eW+dg7XwVV6IUWkK3934SORwbW4wjGJ4dZtC5uC1Cv8S@lists.infradead.org
X-Gm-Message-State: AOJu0YwruTq3TqjcjdJNPUM15B/bJEhr5Y9xka4RSX0l+cHuTphW+bVA
	QK3iw+JrDaXqrmhY4BoZvhbxESJKzAuKUiI3xC4wnztaKU8pq8VAMi1yuhmA2YIM3uogenwHakn
	uofoWvz67WmfL+m3WSKHcE/+52nTiVF6BHaKX1AsQp0X2RWSvd9X/2m6TQB2TtG2Ptldc/blpYD
	79pg==
X-Gm-Gg: AY/fxX4QdEtamEWInrLc69iVKlSuLQRdlejGUkX7kNfwD0EPNaCfuzscRFWsb8DUvf4
	R15Vh7yTKPbHsOJkUnvWHIr20bQXa/cojucET8P0dRPce36gl2/39HLv/KDsL0KEHqvO54JG2cv
	Oan7gueg0aQkBatCXCOSnFO8lqlXySuQK2AohrATwE5TFezQEfvH4QAv9kkWoAmnAVNyHe5yL7j
	cwR95lj1gwtB9nlwb03IfhnE14oSFwugl8lAz+ElH+y6sIiJ4ernI3cKXHwbE6BzZUWIb4yE7ho
	zgBxhY+9w6kPsgxmku2krDi6rtQjt8uEBXHyPMEbwPA0nUc7zgZhENUO7IJct53448ZtjGUErn+
	zLRKFETgJe2oGgPNQ63DGMF9pEIWwmxd7ASGMELa4M9QTiQH7+XVVOeMbp5lgCqMIROnyCQ==
X-Received: by 2002:a05:622a:5c91:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4f4abd8cb47mr285724511cf.40.1766580284069;
        Wed, 24 Dec 2025 04:44:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6SEHMYDYA8cOoMdGU+wI1nJZyyHIVwBwMN0zDb8qXgGwcSCAA2ns9/RvpbF4+vcO82fQYuQ==
X-Received: by 2002:a05:622a:5c91:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4f4abd8cb47mr285724031cf.40.1766580283705;
        Wed, 24 Dec 2025 04:44:43 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:43 -0800 (PST)
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
Subject: [PATCH 3/4] mmc: jz4740: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 24 Dec 2025 13:44:34 +0100
Message-ID: <20251224124431.208434-7-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=2mcyqiagsyS6KbHVm6G4XsCoUJ2/y8VeNfievVmr+/E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AwLY++OPJe0PmtQ519o76/sm2PjQUF16HOk
 5iqYI9gB/eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgMAAKCRDBN2bmhouD
 18i4D/4yKnoNGj9XpY+uqY/3QBwS5rDae2aCSD3dEpBSWOOULCNZiFsS1J55iA/S2FXDgqAr9F3
 ckKd+btf1+IFsLDViCAYXw7uLQeSeOmvLWK+ra9wtVw2Zp43jK6FRIZwfGtO581/yi4ugP9snz8
 pahyOm9mxmpCnrc6Io+WxpDN4w2Fiy45MrdkXDXaex95uwShbSPrGHyO6y3yOHPi/wyk5kD5B/m
 uW9j/KUatAOWoi6nXS1k0d9uKc7URL89nuGuuh84WLnfzBcgFdGp58RIffvya28RIdhu37sObjJ
 Ec2BSI8YxhhuaceTY9AbfQxMvMQx0lrZNdSSVcwSsiAa+UO0oC28mimD0wMs3FcQkyzWDA7X9Pe
 5ErZ4zczTBfA6iU6r68IIbYDBpEcB2bUZvcRBOgUh41ZYEGcoRDzCO1WPLXE7FHuvxocAqQoW4u
 f4hywtji9qeLHRe6+KCIshDCJjRsD8OinSUPQrb1wJgWlllBXd5HZE1oFknBrzKTq3nlE/ycH9q
 UWat9qr2fi5qeXsRKA3ofMyxButI9zWvOlY8Qa2U3WRnHewg84VcGpJVDjQf8i5kVHnruSHANVY
 wtpCrR+aH0q64B5p1JLWwY+ErdIISyVeUe76i7y2aNq7e2xGc1amo3YgbMBT7QCe8aO4SoHKjoo taDYynggtM6k2dw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0PMAYA0my3cmQQ39zEzX_G--gF-J_mM_
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694be03d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hUqV6_F3YIy6dExb4dYA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0PMAYA0my3cmQQ39zEzX_G--gF-J_mM_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXz7XMpTZQ+Z9S
 1sdp+SAgnz12XIevesK89X+la/9IGUhPhA8yC6yDS4v9jyxe6V2G0wMbu48tZNgJZxnWm/KPAgg
 UCaFc12lIyhQZ4rZH35b11HG44I7So9o8+LsoCZi0XcLy+xbaJMfhzMn6W46dVelcfH9OOaiVg9
 kzla5SDM7bujMsnxl9VAQT6OtkAucwb8/pyeGZ/AiBTBiYlLDC1gaUKywLbE/yLVu6fUW7JAVUd
 d1A1gYoPBe0muXGihAkklhoWcUEYjLZYCbylg7VNhjdxs5jeobOVpCfn0/7wXlIVXCNRU+oAnz/
 GhUKioKN6lSZANwDXh59DueLQ02WswjTlyOuoEQjU2MFbZufEk8x2vG7eGFhtRYP4vCApIEllLp
 CQDo3zLRJsu6aDYv9J/6zZX0jSaGTl4+UFQWjr4qGIoaElxyXTb4XO+i6PnH+Pdc97UNzBVVHd0
 E6AY0vYdHDmxiyQU/KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044446_436826_F795CB95 
X-CRM114-Status: GOOD (  15.48  )
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

"jz4740" is an enum, thus cast of pointer on 64-bit compile test with
clang W=1 causes:

  jz4740_mmc.c:1055:18: error: cast to smaller integer type 'enum jz4740_mmc_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/jz4740_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 6a0d0250d47b..6a3c26b7c82d 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -1052,7 +1052,7 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
 	host = mmc_priv(mmc);
 
 	/* Default if no match is JZ4740 */
-	host->version = (enum jz4740_mmc_version)device_get_match_data(&pdev->dev);
+	host->version = (unsigned long)device_get_match_data(&pdev->dev);
 
 	ret = mmc_of_parse(mmc);
 	if (ret)
-- 
2.51.0


