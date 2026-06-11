Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D42CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=; b=nD0XB3nM7XFJdpunRVoFIruG3l
	irAwvs29K2DJJXJUP+GM7Kuuez4yDWgnHsNLRanppRJBRd5J97Z5yKVYFUTJutWEfSOnV3/TuNtY0
	zp7t9vPZbDCkXg432R3k2kyaGXAshcGST0HTVt8YFLR36gxorAm8ZCFB/ou3ukGbMLaqGX0wUgBRd
	foXqhzICBzPS7nwrFsSUutil424ZpOYLxvtj2YiG12abicf3Vp/VmvSlydpMOF+vq/b60O629G3UP
	TNnsP/WeefOsADo3e7UBUheX2YSYkzKz4Dn6LjgzsL8r1ESA9dX5pjFU/PXG7QOke9i70vZChOZL0
	Ig50c4GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHU-00000009tKo-2EUp;
	Thu, 11 Jun 2026 18:37:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHR-00000009tJZ-3QME
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:37:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIS3GA1449459
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=; b=myaG+0QdAH82aYHA
	T5bzdiBz1N4/ZDU9K56o31TCPDJW2W2jDAyu14JVpgUhN47kE2/SBmuWvcfQ0++c
	Qy2VFuWc44xxX82ZYWraTV/silo5ycrPtjoGXzf+V+MhArRjVA3+dyc/K1uv2ZBn
	80pjbr8Im4NMVrgWQysarliG8Ss462jGwj61LHgm3Am4lFgqZSioS96vd5ZvrYPf
	lgTZYlVkI/0PaUMCJgGhLYFQAhi+VCUSjwofLEtJJAU6fHkq8zGXwBRQsmvSJFgX
	5lJgNrNTcjOZWucIA862/rGuDHVCq/Vr2rCYrRi/4OzioIMx109+gvLiBjI9U+T1
	cKiHug==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29ur1n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8428384f31fso134511b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203047; x=1781807847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=DYwlynNRwWcl2zcWEowi522AXes7Ok8ncZkoU/Ax/1+Hr2iLei8Rx7SlKII7o97/FZ
         vE8duYOAp+F3YaVSUAtedh6vxlw8n7YPI0tROsKOIhapWyGXR0CoI/IT00i7AV8r1qqM
         05zmxl9+WtSk5/zYdvTn+i0f9FDZlZtPTNET9zzdb8jvt9N+4cwmiAQoXEWbFTqpc85h
         Qf6yC/nlarbNoNT3t8fJ8rBEN9tndBE0nS5u9IjM1zAehZwGeADxm0KeU3Ezc4y5S1YG
         oLMQiW9KcAeKRmZq36QyR2cku4fL2DdntZrAJq08a3404w4BoO3Mh7RSgXnee1qBm6mf
         yPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203047; x=1781807847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qRtbCsR0snrc4ZRT7ffxk7qmv5fRPo5gJPF6TrEgdgg=;
        b=P6UNDehdgFgIUdAvl6bTo5Zx03SQcvvAyVQSMhf9ZZ3W6QMOAecmj+z32xmayBCt/N
         gcERaSz3UJ/C4I4res7QAgpBRFfCdvHWIgVB8esGY20itISNac6ux7+s7MFrOb1aRmoe
         /4oXLbnlX6N1BU7wVDmds6+54RUWq8mflPkWs6u+/PCliUOpWtaa9FZ3A2fI1jDL7bXh
         i9mb28HsUQfJ1fTQVPOcYt37+ghP8DXzefnEciiKK6rhDIxnRgks6NVfAngfEfnWhAMZ
         0n1luDhRbOzSM+JrddW+Oj5hQC0kR/4OcBmKAWmSSavoDCHmlDo98rt3osjM5bv8T/DQ
         Y7tw==
X-Forwarded-Encrypted: i=1; AFNElJ+i+7rkBhETpukDPExLDe8yGsOH5lGJ00GnaVUzqcV/7nVo5n7cpgq88BYuoO+t6aD/4avHiRRds/DgQQxBjZhB@lists.infradead.org
X-Gm-Message-State: AOJu0YxXy+eVs4upTO90jYCYj7joY1GgHimTnx7rKF78E/LLCxrBpDPL
	j7qRbyfqtmoK4upEGa5KsuGYDPEbgDkQ8kIErwo1uwGuLPVh+Yo/9AghPuRZDrGoHnoNBLn3WYs
	cLF2ORp6xyLTZdCqrtIys6pM6HSKALRwtJCcrFY/TtFGhwE+WFYgj1pJ44xIfAVMwMU+a1W6Eai
	VDVQ==
X-Gm-Gg: Acq92OGJxhLaWIPMrQ/F2IoRhXjdSAzLvt8U73ZBin5DlefWrtgnrcfpICEQhklPLnH
	2O+7BsJJmiENl8Yzh4bs5FLSLkqPJ4h0UDtIBuHRn5wLTvmUXoSaous7bsv6UDgqQlXQMc8qznm
	MR7QEpDfT9ajMsnoe9DRacLH+QOtZGkEhrkzaRCuPtLDBXusRC2kFLrqKJ+khO0mGSJBgi1emam
	woE69GTFowORRiCWp2sjiAk6nQY/zGKGaCzW5RrtwmZKQR4D1s6G8UmkoZxeWEErQioM9de0wZX
	8YWSL7N1V7SKhDfKxv/ii1cTXkmmDs5VZD18p3iIcXTBKKw/VyNPxO9OglYDdQtjT4YM+3Oo0Ow
	/2wQuYPHtjo1VpWb3/K/5dMASqx6zlVb5MEA+Azla3DcT0DHAsC8=
X-Received: by 2002:a05:6a00:12d2:b0:841:89a4:5f86 with SMTP id d2e1a72fcca58-84337076084mr4736765b3a.21.1781203047502;
        Thu, 11 Jun 2026 11:37:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d2:b0:841:89a4:5f86 with SMTP id d2e1a72fcca58-84337076084mr4736731b3a.21.1781203046852;
        Thu, 11 Jun 2026 11:37:26 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:26 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:06:58 +0530
Subject: [PATCH RFC 2/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-2-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=1852;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=5Xufs5yzw1meBpR74gkzyGtdf0gQ2cokHnunZolJSUI=;
 b=+3Ngf+LV00R14UIA4JhwZPvyrrFmhJx5fnVfVR/0VJFRrLoTMWjRw63LOhmMfCcRp1SypJ3B3
 GPEOoANmNeuDfd0CuXaKLK5vO4xXckMQdUVk/n+kSbWk0jfFTEb6Ddr
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX0ggcqAAler4W
 oVfcktxqeoFri7Awhpx8eqElJemub7UtnbLMxbi++uEbWcPrA6ybdOMlHjCy0LoV/uR9eO1FM3Q
 tk9e4pNzt4wpmu7W0lsZQlAx0wOM8bQ=
X-Proofpoint-GUID: YsSzpKAtERp_WScP4qXO_TZVaxScTcZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX/VS8UYl0xbmf
 9pMFZATavhxKQpHSkmO0BI28gMFghjfL8zTbTGejgZdGNYsUs6uLMvRCD3RQjXy21GAFtD93kft
 VUwnZ7WRKf9C9fQlj1jrXagtu72MpHwyLs8gWJX4ZQXnSYc89sKs9Vin65XETYUuCaekI7ANICl
 DEeVkqX4ZArmgrB8XIZUqntKjf2j4sJ0LfF80ebh5WOsKNfZscsUsucRO94UdegRGUh/S7vuTY/
 sVG6Ar8d6rzz0LwYaIMzcyOnvfilbTTk4fsGVg1aJuKAjeJYy7Rkp+3TQz5bQe3PQQ6NMrgNxoL
 QhzctvSlj6l6y5tFu0mzWU75/SYzfn55PBPCbuRhSdQg0oyqFujdTfLQKzjQxyNCxfXNEqb95q4
 807EqQj59aTl0UfV2Mox2xdoL2REbQ6HFGJJpl0ddYqOO0QpjYe5Sdg2iHMzGXMIwyXnReh2tWw
 dF1tSyptHes7mF4qBIA==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b0068 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K6GgjFCvg-rKmMkbl2QA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: YsSzpKAtERp_WScP4qXO_TZVaxScTcZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113729_992674_18E03477 
X-CRM114-Status: GOOD (  15.30  )
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

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757fec659d36468c315 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1


