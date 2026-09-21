Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C36AC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=; b=usCQUJxexJgqSnWJZQFq62rMPV
	NavIo1HK90HXhDAEHMxOYObWPTJ+poepRPmKbW76g96Yi9+Wyvt3HzJH9vpgop2tNlIBb4ZwixnDy
	pDSw5T1lgwvM9dEWKMwc8mToAy/Pre++7FX2xkbm54LdiTxzXUaRoyWMJUz27OCcoPR9/cFcenmmN
	8+c9x32LCOWQWCNn7+XdMa3hIDkwzCVMNar0KPxHkcnVPHXOr7S4ZoxfsYOdQOPqVacW2/vRwb2uN
	TqKQZk9Z2tNMyVM6m1s0RgVAPh8SLpscA6HL/1b6WyT7rbjAmMvUXaLg9Fl2sYDo5WCFAXQWyjY5m
	qMVbmOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcN-00000002Aix-466W;
	Mon, 21 Sep 2026 12:59:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dc4-00000002AUx-2g9w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:59:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAduH8287294
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=; b=bV7wF6vDiIYe+4kD
	+pvPl0xQg5uJfQetk5ooKP0jfnO/ne4/B5IwPJXfiUltdTRIiN1Xn/aDvZOy5ORY
	v3LMK33fSckoRHq41Pmqc9j4C5XpuPZIIrIrfvtSX4ejImX8ffWk9alyXijDZYlj
	EZPKu0Bq23bDCB0nM6D5/jYh79+d13iO86WLzBEhgins72kvI4n/+6WDzwFVBQPG
	dTha22GmqaS0hqV/LMnswsN2J461I44CE5OQTqpLTfsNWekkGbOhzrcZPKjOFWpc
	yHgId5i1cHqshYz7bwZsqPt12XNedVRD64jR/e7r/UA27xLwaWf2xh4cGUqjZsFd
	EhXjog==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj154n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:59:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78350646d7eso3203917137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995555; x=1790600355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=;
        b=AM1yuLTCOxcZ22/43NZF5csbqrzL5eSntZ3ejxbKRuELzg0s6Q5iSmL5wo9AnN5+Yf
         xjGynDtDA7pDvhQdFxTkscPl+ymnDXDQ3C2UjEt2rkfIDOzWGeaQvU1Gy58FMVHos3lu
         6TGODrEtocMF1ibosXHemtin3t080BYsLYYib+47srGY+c3mV2Rd2pkdNE8sV/lf02Fs
         82HWq4zWt4nFZhO5Ln+XpudGMrQ7LRFxKNeyrV3e07hJsCpzQpQi/nUpJu+AbZXLr7oA
         a8DnoOnKxLPAKIvdx3av9xEoS9rLrL1D9POc6OA9NS74RKHAqyzSxKi6xP4uXXU5FQuq
         aMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995555; x=1790600355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=;
        b=Q42hqRzkIe1C9r/vzmpCIu1CFek+0bVlpunr6aDzQesq+t/oPBQ0Y4Ax+wqLlrWAqJ
         KNsprLAP7I4U5Bl+nKSX8VzlvNUoFGeDDl4w/c3idW9efaoZ8VAnUV/z1dJkvIOwXHaE
         FcpXiisKmRXlwUgKSD8rCWEccQeKXC0unxOXpeXoSmAKe2qZJSLLWM5JJYJevliQCb4H
         t/xL55gvHE2TWC6Qwjwhskt8Weh8nk9cHwRUpAAu4keAgN3Ob5SNbDuop60bNeZLh4+e
         1j0WhmEXbB4LLzN3fmy6vzj13440ugr3lUBbpsZU/KPi4tYtMMXdvbc9O2YNRWA7x9QK
         Th7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAydNjfxI00QnMKrIEcg4oUo4QrfYjJ2YNGAgE0WkJ44G41N2n/o6LvsKxmfTMMBvut877quVduQ90g0lxfRGI@lists.infradead.org
X-Gm-Message-State: AFuF++n9BCmwOETWyaRf/BInXrIo6GsOlEOM5irzWvW2qhlkMjSS+Hsv
	iZFYmfas5pUQU15RYo3p5Dqpgr3kWIEn8lF0mXKA4DHixR4BW54SvCGJtx9/AIxizs6IslD8u2z
	cdesAoTLtVvR+R1aErYrs8IDS3z/Ov5X2Q77rHPGUU+1wbj/bg2pzX8ujKEBrb5lakAXwdi3jwW
	l3xA==
X-Gm-Gg: AYBFou3LmMDmEuCpC39JAafdD0cSoJCel5O5XqeLvoJRD0exb5TJKIEfvXKNbFwjNBB
	aWppTn+euTRi3pnTJswbnz3WCh/9Bya1Ys+gCv4+iwXHsSFKeMWQiQ0rCumI1xykZk+6G9/XpDH
	tW2asipMkkFOqdtNo58NuBGgs6gcauyM+ZuzWmsnrGncdrbcgUL5yu1UAmXDVqkDOgJ0KnMSPER
	gNMob5Pmq30A2Uh13L6Vu3tr2Baiw1ZQLF39sEB5DSzKjFVoKLHh5ry/+zpAsGisdxEt5eWSJsD
	pU318fYXH2CYJGxdvaTXEPc46X/bASETLAQ3/zytalwt+k8NWX7YvPRp3bny4OI6w2OA+m7dkSp
	PMqqaqokMjmXTu0Vixy8YtdDvIqA=
X-Received: by 2002:a67:e9d6:0:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7a9e68119b3mr420309137.28.1789995555145;
        Mon, 21 Sep 2026 05:59:15 -0700 (PDT)
X-Received: by 2002:a67:e9d6:0:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7a9e68119b3mr420303137.28.1789995554810;
        Mon, 21 Sep 2026 05:59:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:59:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:23 +0200
Subject: [PATCH v8 14/14] arm: multi_v7_defconfig: enable the Qualcomm
 Crypto Engine core driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-14-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QSpKCyM8sZRrkH8iCybVhH+lwRqWiSeaHHG1sXtFQNM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSn1lcJ3rdfljJxEad/UDO/DxiFyNO4ZMK2Jv
 VLsS+uPsKCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp9QAKCRAFnS7L/zaE
 w8Y2EACRLm5tVJGsdU7wHq7uz5JVixX78aLj3rfMQCXd4kW/b0p9kP3eDeDlGTJnQsUCtPXIXMA
 y2/EiDWvq600Fm/uQ/LI5K+1UpwXl/bt5f+fnx9vo4v2oArTemL0dibH5JnYhmThpdzSH19drVP
 qMB+8xybF0IONLKO+pJw9GgKmwsjjLZxCteYfICNGza7czGTRJgSVAG2UKLxNffTci6zBsFwffb
 mD1WQMzj36dQckB+pW18UJw+opwEPwHZcZpdn8sWBC5WjODrMXVqp0EU0QnpLStmDhUUC6EPNn2
 WhCYVxqWMXF2ExPaOhGhY6YOXn6dJ98GP1p1JArCDu5bNeSJkXkIKEKPD3OmVwp4ML1irMLN4K1
 PGT7WV66l/33kw0Ffle1SuQWAcbAx09pVH82isAfn01nLpmFxIgv7At9AZ5W0QLdmMQwOo9cVDk
 3Trf/zhcHuDH4FKTV4K/f+R5OWcj1yps4XFD/x9ChGkwCv0jGZSMZnP84abqWb+AWOg5uT3wy1S
 YPNst0ftsiuA5iQyA0uYerx2gojteeg3NK/aNXhHPkha6yfqgdwOo5kjPIkpXAfjaM3zfCcFk2C
 apa19Seh8cGC5LyXarhhZ6BHRXEFG5LqsSKB36qsRakdGows/AwFyD2FDnv0uwIgUtAv6nC+nOj
 BFnDgptCV6+I+mQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX3buGg3yDtYQU
 QeiUct2g4wPmNMsM/nIwaNi1/L2f9LJdWpAh+jmmqY8Y0IER86SK5IqZxaGfQi2ROdGAIJ5DhOL
 4ILZ4aIjnzcVrnSFI43nEiR4MBcxgog=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab12a23 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: pSpPWN84HYmwuQsEZpWdHKDb6Y-hS5yG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX/Xt+55TzAlg8
 w42vEWd66D23LwhlqfceKD9UFK2bZRBAof4jxGPsfTwXa5UlekmMveNG8Lty2+vxh+X1Zu+XJ1o
 rY+gfMUQjbZb5GthbXKK5bzjbaa6/IB+kIR7wE98t5vsiiBk1JyV+QodckCI0egMhbZd3uSNcmw
 P1uF5cvAT97RMUJRscXj7RTVnzlHjbc5ZEhS1QkpAb8ws5FUeXTRkIIX44/fEeNjIr+FVeYHH/L
 NHttD4HKOftabc/3bWYEc3kmwX2jhmLVDJkwYATXJKWaYxNrVm/irmLIH52CG5p1c8rfIFXbNzo
 dtQk4jMtf88jqfOpo4NR8RLnoj9CSfWAtJ6DVpYNwHbaUo/Q7uFy3EI9JqLNDagkONt+Wy3HGcj
 G5Kd7iQjWRJyHuQ+3ubcDAChdmBcCKyoMy+/oCL9D9E5VJVskkVojxDQCHLG247XbIyUPrBiiOM
 fnAutt98Fj+ICRusggw==
X-Proofpoint-ORIG-GUID: pSpPWN84HYmwuQsEZpWdHKDb6Y-hS5yG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055916_801080_F434C764 
X-CRM114-Status: GOOD (  15.92  )
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

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the multi_v7_defconfig. Disable the
crypto part of the driver by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2d6292f8cab39596b540084fbd8b30f4c25cd4ff..7750b11f80312bf6a6f0fb276315f32f8714b4dd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1150,6 +1150,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
@@ -1323,7 +1324,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3


