Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E084FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8D6kVHaQNnTyo5CXqpqHFG5LAhJZ68bONVDPWniBt0=; b=skpnNy0O3S8cR4cOQPJyFGhPE9
	2WZzV7GWFOph8EveVf0rwEykvxKwvCvLIZFvtP8zIb+i3Cdl0fviTHgKDUIF2JqfkPiEVI1lq6Z9i
	V+7eIVVZV8iKBLrwBDDSiqlFHaPdBdWhYvskLFpm3CJoBtyhoAqBh3YXSGmbgPzuWaI/SgMxvJ8HH
	zaqBqdYGxwjLpPWc0XPhXuF7cUcsP642otTO+LL+sArphXEwyl9nw5WRiCmj6fdSv7I1ZIh5lJWH6
	y3hdehxeQSVLszUrf/XuBdzdFhVXb9ylOeXog/nUxNtnPekfl/Kmux+hHcHknZ7RhsfO569pwclGq
	02JFsskg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXi3-00000006ZXo-1ajj;
	Sat, 11 Jul 2026 13:25:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiXi0-00000006ZWt-1PuD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 13:25:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAnH9w3433908
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8D6kVHaQNnTyo5CXqpqHFG5LAhJZ68bONVDPWniBt0=; b=h77dVIVYK5i8kVCu
	NFPnEnY1lStwk9iKe69ow/P74DeK+fUnoAc59Moqcg7vrSzTmcs62ZB1Wu4VnbTu
	JIAlQwjjpRw8+AdRaRwv+7y+cgyGlC16UFaQ+1C/wEcCw3F7MPxKgXx601+gCLmE
	pUo9vBhviFPnoAOCsQSur0wZPkqXjHOfmLnfLRhkj7T6khINuvYhd6JTZifzwoJ/
	42ta/XR1Mh1zJIYXK3OTfwr5mtgEqx13m95XDv/ESj3tRzL+mp30q8+aVIp2ltM9
	04D/VdcLXuRzVzKgKq2xSGq4GNSsQ6AEefzFQHENBJ6cGRvuTxgkFx2GGcZXuOF9
	A+zT8w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0ggs31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 13:25:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90410c668adso6668406d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783776331; x=1784381131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8D6kVHaQNnTyo5CXqpqHFG5LAhJZ68bONVDPWniBt0=;
        b=PLhnzq2LTRoslTDlMNgFuUB8CD3tpMF98qLFjZXlYV4wHyT0MKp89i6JsA+5EO8nH+
         7y94R2W0CkrVxhHEI5MFl8EBaRf+JH0Zw4DqEWysh3CPZ1MRQrH/aoF3ac8AIYE+GCkp
         oouSt/VP51AP31e7wpjMuSRK+DDIjfVMTVXu8KPiqHTIgIk4UfLC7PXtgST3KJX/UbdP
         PiSpwoYxkhK/kaZh0kr06nKvzPutvmCtJaCAjHJmYF84Gjg3w8DLPpS2xaO/KZGswk0w
         dMt0bRzzH0xYAX5H5jQLJ1pUjntMOsA6l65dsqPv4qGAdJXfjzif38EL0jSFpee/4N95
         3FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776331; x=1784381131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8D6kVHaQNnTyo5CXqpqHFG5LAhJZ68bONVDPWniBt0=;
        b=bEGnyU5S7achggHKXwataFCp8UV/L9HIDP9uvDrSteXsKWE01ry94P4s/5kcaegvCE
         N2WP0fCQoRkFv0x5Q3FyUMRKIlQyxeSReAXWlj0D+Tnyhud52FWDonwSa3jrGdB43JeK
         t3CwC9gnFABi2GzkkjdUqJv2VVs05d3lFPiMHDNmAYIirsYbL/h47TWPrMd5HjE6ktLC
         CJioo3HS+wya8jndf6VIkU9jIIOU7VbPPh3mYKlOMaoHvcZyM3fwMORxWgjWX/zdYpFX
         Q3P7/YH+1pMmxdwhnmuk9nv0/wsMMUrlq0R/ZYqZn3pqQvFVN3WmZAuLE/ItpqK+46Yd
         6j+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpA71+m10HFAxef/f88QjU9h24OXHHSJMCpagZMLN55EjU61IvGWN7J75k7Blza+10pOW6zQ51V6HkLsMZX/TRQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzoFdCzznm1zrXCE2B9DBWPBhXEpDWstkqtsKdaeIdagbbKrUF9
	X5lnTCd+YA6F6rbYxNMC1vU9ASWkZ42QVR/mOaATb0pL+Bht4gd7Jts5WQwBt6KWuoiyLc+jBSG
	Kt1zCwHD01KIvApcu5QbcrEYZTUJCXRAMzLJgw1vRFlf9T+9KUMc3OIBauXcK5odqwk06KiEohu
	qN6Q==
X-Gm-Gg: AfdE7ckD4Su/Li2M7giyG2gri9zMK+aAhIW2guBlxjQ/KNpC2L8UtPybEUWPe4DxBIZ
	HfwVnUlZjUG3/m33A4sbpGcMJ9DKGryfY0aqAg8Z8SEoOvUVhSg0XaV2kql+OhYp5/URkyDuzea
	sPDxRqFeW89LXH+AjYbPrccyN9Xp10J321WBoDe0bo5r8ex2nBTWb9XPGkBsTjv2S0RNgRi+0v8
	eUFXIuity1nc2b6kRhQZ57HYF56Nk51y4inflnNRrcsKs/1Cfm4NqlrIgc5aH0H7RHkdW8DAJ5S
	IUOTiGUhLP2cDt9KfleewXhEhqEqy0u54iIK9mPxV2i6m+fDUN4YjbM/Ld8uxtFrDABYzy3+fxT
	MCreOgrC4Mbir4FV9AKpSkviPlG6Rnc30qLA=
X-Received: by 2002:a05:622a:994:b0:51c:7b13:6300 with SMTP id d75a77b69052e-51cbf3800aemr27714091cf.86.1783776330819;
        Sat, 11 Jul 2026 06:25:30 -0700 (PDT)
X-Received: by 2002:a05:622a:994:b0:51c:7b13:6300 with SMTP id d75a77b69052e-51cbf3800aemr27713861cf.86.1783776330396;
        Sat, 11 Jul 2026 06:25:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm67915265f8f.14.2026.07.11.06.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:25:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 15:25:02 +0200
Subject: [PATCH v2 2/5] soc: qcom: Restrict drivers per ARM/ARM64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-soc-kconfig-v2-2-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EkLipRueXJUHKJXq0g3EN4lVQPNdcpx4M11gIrvYJDo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqUkQzPZzW2S9+7bCciPPKrpO20kz0faDdIIWbX
 nGnmpQA21mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalJEMwAKCRDBN2bmhouD
 13WXEACOQxO5M5Jg10KOjiNPgbJKw9bq31KJNzteK53hRWH7+ZWXSthj/cIjGtJ4XLnGPPLga12
 QSMju5Zi3sraB1cbzNHmaWtEpi438DPG9aqRgxYi0RvHDu5rn11R621ijeO7XNf3YCvF8BttCda
 K30I7C2JSOWM+i4azyz7BwLa2BmebwLIpNHE6T492z6soaUheNbJ6XY8bYmikXtq+KBkAyWKyww
 d+WPk9nmu6Efr3Lmnjnoaajp97zZH+Wm/qNS5ZseH4bv3BVHeYgvcUrNOfiR7Zirnvh1StEz6Zb
 N/8z7iX1NqtsOizBrlbJ5QCCX6yLN4OZ7ly8FMKEXvshtMJijaFkRY/ZdxNlLFS2au0yw55giCl
 s+eOxdgdRVRTpYw49IkiNOn8S1An9wDP0t3542peahmUDeGQHMrOWFjueMw0jMV5pYlWCTTClxk
 pU/4yOu1OeqTTdrXTrA6CBR4bbTAyBGL6beT4BYBeemF3aeJOUxhs8qxScaKMT+XDzv4NEf8cXW
 inyrFEw1ES3r3zil0O3PHlGFQ6xUh/Axuwli1vAOEMenQwvYg/o0RjeJgFEKvUthCEexDylC8rc
 T6dozFFN7d3vWiDHg7L9/P6e6dzMHqIObNhO5w6VPNkfFMPa3Muh3xIMh3jjNYKShFk92Gc9ku6
 gcM9mA+NuIiZAxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a52444b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_aRwxzdhAbM48nF2t_MA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: gnDK-_ERdOoalSIAnhW_kjJADJJ6KkP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfX3Io5hEqu/dGY
 aEiKpB/1Ani+5WYrENjjrh3rhmhNEIdH0oxnBqCNBqih3MhKB6VlWbpOkidKEf14cFlx5sktKQB
 0mdoGxQjexPsKOeHQSxCARBMwUzuJHke7CTcHLDII5A0zlKV0PZF0iJPAOXNpHcNkNW6CNxhCzE
 Wjby/XvR7Ose91fqc+e7gE9P/40HaoMTD0jPOg6uT4Ev1Cn4NdGfJNmwAkGtdy0cy/ppDDiS+sR
 /qSjJE8ffFWURAnRIKuL76BdmKvQHV4vD/BWDEerwKoqhH1RlUl/a/XkXZpa1xIx+EpJoze6/yl
 FEedUe04NkfEut/tjgaVhJIHT8cWGH29Pv0jCYtu6Xayl1Q0xpzBR1kpSiXsR+9BAvSK4cpFqoo
 wQdE40PheBK4IPeJf/Y98TpStM5yXC70BHbbw5n758qs5jv+7s3nsVjN+09BuCucu/+I1K+4PnT
 5bLbHC9F4ZTjbnNSoIQ==
X-Proofpoint-GUID: gnDK-_ERdOoalSIAnhW_kjJADJJ6KkP6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMiBTYWx0ZWRfXxBkgTLqnE5E+
 XjREpqC7+RWt1REoYTrRbPIYlbEfR2RjUHztosiVITc1mAv+FpUOxerqyjxmzEc8zBrOdxOg/dg
 5v16gYQwK2jAE0WBIh8D+EspMSC44Ac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_062532_413162_70CE717C 
X-CRM114-Status: GOOD (  15.03  )
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

There is no point to allow selecting core SoC drivers for Qualcomm ARMv7
SoCs when building ARM64 kernel, and vice versa.

This makes kernel configuration more difficult as many do not remember
the Qualcomm SoCs model names/numbers and their properties like
architecture.  No features should be lost because:
1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Do not restrict per arm64: QCOM_PBS, QCOM_APR, QCOM_LLCC and QCOM_AOSS_QMP
---
 drivers/soc/qcom/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index f3d9c9d776e5..7207814cac85 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -37,6 +37,7 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
+	depends on ARM64 || COMPILE_TEST
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
 	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
@@ -45,6 +46,7 @@ config QCOM_GENI_SE
 
 config QCOM_GSBI
 	tristate "Qualcomm General Serial Bus Interface"
+	depends on ARM || COMPILE_TEST
 	select MFD_SYSCON
 	help
 	  Say y here to enable GSBI support.  The GSBI provides control
@@ -104,6 +106,7 @@ config QCOM_PMIC_GLINK
 	depends on DRM
 	depends on NET
 	depends on OF
+	depends on ARM64 || COMPILE_TEST
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
 	select DRM_AUX_HPD_BRIDGE
@@ -247,6 +250,7 @@ config QCOM_APR
 
 config QCOM_ICC_BWMON
 	tristate "Qualcomm Interconnect Bandwidth Monitor driver"
+	depends on ARM64 || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
 	help

-- 
2.53.0


