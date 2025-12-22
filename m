Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB156E674B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUUlXc+6T8c=; b=eq3gfObE+JBsdzDINToLHVJz9O
	stpjKN9r+0F8aU0TCcKIzW72yATFT3sMVXHbSYoeCBExWv7hXg95/t+ANqnCfvex6ZKMgnKPEezL6
	i/VI/d9V0mxaWKQ581s7cQuG+5Z52KUrsRVEHvc2Yyee9OXdCLqqx5q/uyohnPUqiHYHuRMuayGqj
	1rGXNFgP6kZiua53LBcB0ojj8zJL7E83/gnzObzVDH7tQ7OXR95JJyrE7z/9GvQKUWkJIclbwR7BK
	kLGqThPUweFmj/0Xv8VbvLYWGfs7F41nwfJv+Ns7WBNQCD1+7HKyVtZooSGweHhLNHJZHZOzie5fJ
	qLRzpeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhQz-0000000Dt9d-2uxp;
	Mon, 22 Dec 2025 15:02:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhQw-0000000Dt8w-3kTn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:02:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMECL471352255
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 15:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUU
	lXc+6T8c=; b=T2X1amvSu+XjVkhSyzmjwUlV7TBBmPvyMgahrGAIofFfT+kHSIM
	7S+aW5isUSblaXl44mYTvjv002YjITInVdLEvpTfU4irvY7dKkkwWmp2MMAgXXkA
	L+1w42j/nVAilwBBiZgF1C4XWuohsV9YA0bU8UmNMTrZtCQjY560AyqGyTtclRAb
	CA/sfmcGVPnLG6iNsoGwQKkBMcXFztGSIKWRCLUvD+4bVXYCG35I7hFiaGoR7cSc
	QeHgw7sHAi3O6ikPbrwpKjt/dxC+KiQPJEYiUkl7OgB0GbvHDUe1J0Ukh9kB8rPx
	jYWZ3wKH5UQJin5sM7ybqpVUybl+ic4OPtg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahknhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 15:02:49 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-65747d01bb0so6513592eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766415768; x=1767020568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUUlXc+6T8c=;
        b=WDpzGblH2Vdsw2/okP02tHugBVZF8SMpXXPb4u9t/SAXeM2nPhrUcJ9zTDp+LmFzJb
         ZtaHqtCLc69ifFNnKdVVSS0SEu1/2ZlXzovAvifpO7NWPEEvBgV51jqcvw8L8R/xrWIc
         OzFlR3ODMKaErL77KOtoFWPMjpEAnXaQWwWV0j2Zq6c4ppu8PRMr7Tl9Rx8O3qO2lI4G
         jyhnVgbD1B9vAg1Q/qlvOJDRpz6uKhamgawmm5TW3CcQUlMbtA+U/T+Op4Efzuao0EKp
         Ej6O5mrDeH7SX59ZCfXTE0TNu+SjTbcUMjdREQffT3qwpPQXDBaerY0nVYSRtCrnPRNg
         EAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766415768; x=1767020568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbRnW+taGLz61/GYCYEks4oaouDwWT4YbUUlXc+6T8c=;
        b=ISgF/eR+QOhQT1qK5aJWSvlWAUnmgYynH3pP0vhB+1z6Lv9Cx2fgI9sR1yGNjSnZgS
         5th89VhAa46OtAyd0jaJY/8zBzLc3TFQPrKVnibIjBhUnXDDes3dn4uYlq64+7bXB0bW
         IbHwhaFGbSqQZmmkQSUTeUT0g9NbpCinusm4SSsTuMXg2X4aBzuJoBlPqhqiGCTAq46s
         BfBPaG16dkC1IkkmkPCE3LYGrwCfndfmyJKNwuHhmy52/MZYT9YBsD2zWXAO5RQifkYE
         fjOXzXRylHszk+W/bcC2Wfg76M/DvXwe8h+SvKpS4Q+pLtm5XN5HTc61DW3SjtW0VEpj
         bZww==
X-Forwarded-Encrypted: i=1; AJvYcCXqT/n3kD+AdreT3ouqXzUPj/Zgjql5CuwuBSvq0Sq25nYXCiv2Td3V5swKJOuhXpPfRDB8KTLd24NDMK3Uud8y@lists.infradead.org
X-Gm-Message-State: AOJu0YwWYDcTCjQDr3+QvOjLPEmFfz1y/mSFk+zqRE3u23L5bO9Ks1Lr
	GuFB9vv4fAEk5hUbX9rGJG4vHEZXFSTDWwtqn3sPX6Y1dnHqS4wiMyY2JYqm4PBoYtunpjYUJ6O
	rRdukXux97ScpME28eNZf4K/plHW4tuSbNkCpfizRbGOMkWZj+q7Hy9g6rTQMVXA3mYOXmCxRPE
	owWklil/ccKg==
X-Gm-Gg: AY/fxX4tN2QGFV3OGL5FfVgfLn3wDj8RyYTOONKGgY7F6N1gSY3Dh5dxW5csvap8uIZ
	jSIaghYg3Md57CmlveiVrIQtONcg3NkUAsk48eSRb9MpJfNgrPDUQF632vbgI2ReJo5kkHa4l6N
	/cXNzn6uTwis+OzWpnrnMLhdh4QFelBX9wMhfJdNrddi9fi2sslZ7tI+OvCXJmKUchP5OK2vBZM
	oAaTStkTkNFYgb5NQz+vYk9WgqYKasBvrz31akzA3/ipN7Bj3fe2iDtpszBM7mXuPqxA97V8xMH
	GkugAvT5RTshu3fFBO4zHRjAxMi1OBXBmqL5pgDEagtN4iGJKqVT8xzHcBRojDDnxlG0QKIIW8X
	yCgSc8l+vajU9QC33slNB4qpquREK34utHUeMiw==
X-Received: by 2002:a05:6820:6081:b0:659:9a49:8e92 with SMTP id 006d021491bc7-65d0ea65d9fmr3174887eaf.22.1766415768429;
        Mon, 22 Dec 2025 07:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7muTZlKDO/hZmrLDRprGb4Ds+B4A/MOrQVAeKXIBtOKKPHjm3aDXKYtsOVpcZygPExsVlzw==
X-Received: by 2002:a05:6820:6081:b0:659:9a49:8e92 with SMTP id 006d021491bc7-65d0ea65d9fmr3174849eaf.22.1766415767791;
        Mon, 22 Dec 2025 07:02:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:cf80:9c52:813b:afa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm22160900f8f.0.2025.12.22.07.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:02:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
Date: Mon, 22 Dec 2025 16:02:35 +0100
Message-ID: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=69495d99 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=aCVAxBrhNG69dy2j9FMA:9 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: k-EXd7ts5GIKoqsMvYmiL6wvqiLKehyq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEzNyBTYWx0ZWRfX7Ia7iKN8lrpV
 P2UFttGevKt1chwZDDRSvCwqXqQtMX8pFvDf7Fw423Fw9SSX5DkCKMAV+HGcOYqx3G4DSpsSdR/
 QUDtSj0K/+78kbgzxwT/Jo3hLLehgGz0VzL3VpRZkS6QTfMjUvoYNjEZ+uG+u2tGYgNN3LsSeoJ
 GOGGmMKpsYNCYE7H1pim2WZtYnwZs9JV7R9kTKE9e019dzex9fraoAJ1AXpGRIU8yCQHp9Mrq/7
 82hkYKGr4wFqqSFeZZeFLOfHWGwDceFoaCuTR9GMLt0jYOJf3JhSELsquB0xINzuNoCCI7cmJZQ
 RurSwp88h84y8aentBN8QTBBy9WzZ8ssikaE5l+O0Jj+p5+HDvhDttpyMz21rdzjaJL/2biHrKp
 gNto+q1nz/80W087ld4MOa1BJktwmoWY91dMJG3gxhS/Ieojv0qV0MK7uwy1WNyX8wLT+HOqfx1
 Wso3Ec0NzxdIwlrKe8g==
X-Proofpoint-GUID: k-EXd7ts5GIKoqsMvYmiL6wvqiLKehyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_070251_074370_CB7ED1D9 
X-CRM114-Status: GOOD (  14.01  )
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

This option defaults to y for ARCH64 meaning it's built even if we don't
want anything related to mediatek. Make the default condition stricter
and only build it if ARCH_MEDIATEK is selected.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 0e8dd82aa84e..2c09fd729bab 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -820,7 +820,7 @@ config COMMON_CLK_MT8192
 	depends on ARM64 || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	select COMMON_CLK_MEDIATEK_FHCTL
-	default ARM64
+	default ARM64 && ARCH_MEDIATEK
 	help
 	  This driver supports MediaTek MT8192 basic clocks.
 
-- 
2.47.3


