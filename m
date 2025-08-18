Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1180CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 05:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Peq5jroX6bfA9ULfbqaeNxDwibXDATliD+d8eaom374=; b=zTBPNF8wURLKIJ7cee2lb1WcD2
	734feAeE7l2eV1sGT/2pSCdybZABagAzxeGlg58+PO4xkeCIrInmF0g+4eZnuWZ69OmZYRos4QNTf
	tu9npep9tcy06Cx9f1OigjtOL0FhN5ud03LmZQKA2KTwtR//y02L8KSdlG9Bu3c1E0SN6EM8suE9u
	r6L6z3w2dpy3XTzf4j3QGK1A/oEATcyGflcOoc8y1F/AGcuctt9CgQrBL/+L7tzV6rxbE/OavJhFl
	DEEKx9iJY8cZ6bn9t+DcpWTZq0ooUGDWBtLn56GWnknpil2fNlYuC5f9ILFQCHQip71AZihKwtPJj
	iessWNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsHA-00000006Xf4-3Dhk;
	Mon, 18 Aug 2025 05:19:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrgo-00000006UAq-3K5e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:41:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HL0GZk021903
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Peq5jroX6bfA9ULfbqaeNxDwibXDATliD+d8eaom374=; b=OxBisv9RbLUOBWNt
	YMNAoAEvPQnt9qe5uJvuk9CY1kh2WdS+nAT1Ah9quVeuTyUZtn+BRVeCcyqiUEFQ
	DB743MR/HGOEnQ8nDsKUREOGYVJD/JRjNAmdNEXk5nOx2/HScARBVz/85Vy59Qxv
	baumhmnWe5+poL3u/t1e12Z6IBKUgEi9yUnU6tz2mHAH1iLUJWBKzjnY7ZUHaSRv
	p9GwfyszF7h7KkPf8behsqawawKftHvXSCC6jFZUSwGSOaY2rWaBPglMOdav16o+
	7LBSaePSBdHDz4Z4cJwaSNN6cPlkim0pm6ZtfMqg8X+lwMUN+yCrN5WVuHZlY0Oo
	aX7nDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7u7xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:41:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445812598bso101411105ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 21:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755492105; x=1756096905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Peq5jroX6bfA9ULfbqaeNxDwibXDATliD+d8eaom374=;
        b=CiFVileRWpWIdV7xhbQroOBHu9KzTQXc5rJOePO5cWAtrTIJSsUPULwG7m6KueS90m
         gMFsPrQ8f970OJ0BpsLbNC7mIJMRIc74CDfRWbld1/VWwLm+bIq9DlsmXjLUV3fZr8Cl
         sePinyUh01vIfTN5sd5qaoiIHK/CMp12Yqk/DHmhTbT2fz89cbqP6y6jRmvVlJ85Yv4h
         UAG3U94FemsaGWK69K3lMwMpgttwu7ul7bINbbkXqXVKsvc3MmoFaK1xjIdcL+ReiJEO
         nQAtk0o/8qC9/9yGPTcVFUxEds4jVIkh3MGiphFjASw/NwgGbzQM3udB1IpNXMVpqcMR
         1gLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZewaeZ/NR6gX790te4oI6dValpY0vBmX3ChCLyYy1JyglUGBMexWhHUJf2MsdFKhSUgbs/ROyOMLDVUN2N64z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+A1vK1ohBA7ssPMUnG/iWg1DRksXYlRWWvjr0ZU9wbcsyXX4K
	1DJz0ovsUvqJpRTBFnrbKWt6n8yaE+PwfKcZ6eeIKrXsYXWDtHh4e7Kv7KyquGpQFwuknTIOLIm
	s4clOUfPClwPEjF2Hz87XNS0XdHO3b2RrvI7IWHpjjmTCF5EDVnHpxO0D4DXiGa0tTOOY7nJLHA
	JPAw==
X-Gm-Gg: ASbGncvLYcxHPtN+vbZAfNhM5VmfPfCL4Bz0awZbaxPRGw6p+rcwGnbW+Tl/JvvY/XF
	7hYWy6bYpUTbdbwspqt/KPqBvb5SyvF7FdbUm+f0c7rLMFboEtdj3ABo5m7LOWRJ10l0shHsgTa
	XNp/UdtM3wSiNcxw4vcQGCS39gaMOmRFxIWWgm1butF2WXO3aN9QMJSsMrHZ1Kp6Z/UwFLeCqvO
	TKcSLOxowQxsVAVZVv0/vk1Shn42H9dePmBbOlP7yoY8f2CPwYXFT3DdxX+BjUAlou20QgD2QtO
	4887OXhWyGzKqc3Yq2kgvH9gV8uoHo6hfgIntslsj8U9W6Dnn55m5lYzisYyuaRUgX7iw4fSVR/
	FDp+NH4kKpT7UL0hsuxuwOCNzvxIRvd17hENXPOhLAwjneXNtDD89D4Wp
X-Received: by 2002:a17:903:2d2:b0:244:65c8:c1f2 with SMTP id d9443c01a7336-2446d713833mr125854405ad.20.1755492104738;
        Sun, 17 Aug 2025 21:41:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJSbvnyIWPvgIJzJYpANNMRobaCFSmLvbGiHmUQDK/yFiIYbJT8OVIneejTGAw9DOE2vL8g==
X-Received: by 2002:a17:903:2d2:b0:244:65c8:c1f2 with SMTP id d9443c01a7336-2446d713833mr125854225ad.20.1755492104324;
        Sun, 17 Aug 2025 21:41:44 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53ba5fsm67547155ad.113.2025.08.17.21.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:41:44 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:41:24 +0800
Subject: [PATCH 2/2] arm64: defconfig: Modularize SX150X GPIO expander
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-modularize-sx150x-gpio-expander-v1-2-c2a027200fed@oss.qualcomm.com>
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
In-Reply-To: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755492094; l=758;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=VyAXqrL1J25SHXJIh8uQFCfLNfdmKv32ZEsR9r7oEic=;
 b=41yPYNLtiYTsrZuLq5hgyVMh5pdRS9C7Th5iCJHTQ/sJ5Rg0qNnCJ8QTPHbnAf7pkcMUFEIfP
 q9aTTFOyrmdB3BY07mhSKXGC4Vky5MwPmZ2DY9H+2AcuK2DtgPC0yy/
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX78nUKohWYREH
 nrFJiP2U9dwbcQkYJHeivuufRyYCOi5sybKQbIkovqMPcvcsi3+gLI1WRu6g5UFuXvfh0dYTkIv
 +F6n+iJDZ62dPEpLe8nAY3WeUmJ8cmOwC31IgPEAaureiDuoF4nkD7McUSBH2W74xghzNT9bNy1
 +yOCfUc22KLnOZJLbUjeeYw1PO8Nnz4B6lZRHrgJkHUuMJIeH4XZqZsC3pWirIduwJT0QKoBDoO
 zd5aaDoX5iJuxU4H/WkeLLsoKsy6xt7ZOY5EJgyZk32rfOZMDtTg/O8lQIdwvQk/mU/GBY7StWJ
 p3+/9KNmVH89a9rVXTFwMRoHKwHyaTKXgefPWe8NzJAu3SB+vgsZ3J81GOIIxLoig3FY7ASpSdQ
 2UFWxrBz
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a2af09 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=DrVYGqsxnvAqSPjisG4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: YqNWxi5l1uS2i7tRLmMi1PbbghlaD0DQ
X-Proofpoint-ORIG-GUID: YqNWxi5l1uS2i7tRLmMi1PbbghlaD0DQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_214146_958505_37A6C6D5 
X-CRM114-Status: GOOD (  12.70  )
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

Modularize the SX150X GPIO expander which is equipped on the QCS615 Ride
board to allow the ANX7625 external bridge to function correctly.

Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 667c4859ecc3cda9b0a3dae7abdd8587fc4f8dbe..dce4450fa9fa58fab0556a6e84b899a3306b4db3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -598,6 +598,7 @@ CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
 CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_SX150X=m
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S700=y
 CONFIG_PINCTRL_S900=y

-- 
2.34.1


