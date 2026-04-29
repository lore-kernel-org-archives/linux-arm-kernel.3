Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F12CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 18:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXz/IqMsYjdHjJW2RWFqUY7tQFXb7IOjqpr3NxxNnAs=; b=4KT5szfbtT5mlVTxsJZdIxabjM
	l2BBDXwTNMW4Yb1NMxlSuZ4t74nXsBvOupuU1lJNQcnjzX7bFqlOKny0g76L63uRmwqu3tcau8hSB
	LtRsK3quxqJm+DGDVFKz3nklN5xPGpdFi+JNCHE1G8fo7ABvHpOAM8h1R7v182mAxrgQnVFWyAZgI
	wNI/ozh+IsMzGXyW1u3FN+2UqDvH89ia8xhVlMB1qmFvhKWNayopVWtKZ10tnRyESSHl4TLe9y/N8
	oKQqKqYZrVxwVGrn2mCwCbj0aABTwPGtNbgQckKFT2NuBpKP4nxVS5uJkKDYs5bOIx0FJuz3ZHMX8
	SG2/V9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9zo-000000045mn-1nyq;
	Wed, 29 Apr 2026 18:50:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9ze-000000045it-3MFY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 18:50:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCecrJ317267
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXz/IqMsYjdHjJW2RWFqUY7tQFXb7IOjqpr3NxxNnAs=; b=WG+ubWDCLBV9atH4
	jJZUUQkX4eZD4jZsa6peviRolB6SXgUS61qq8nlbvIAS9+Zj2TwnsXX6h8ZL9vU+
	MSw/bvsQyo1cewiHfGjfvFEqJaEnRR/E2wVKBejayNrdPJvyR+Tb2SRtmUf+0cAd
	rm9SQLnJQNKWS5+x/ndLMN0N2n2N9hR1RnzQlIeFg1BXNb/0EeA7OfZVlGdioYrb
	XdbdU7OUkjsZIRIHy1FIociqVuNgmzaLSrJXyDQw+8JRXuHMLjqYz0Vx74X/81Bz
	Q6pLU9/Nk4adeuPoU8Bfrnj6MsVyWgzSx5ZQhh6FqOY+1bWgL63lnagL7+Gnw6+U
	mr+Lbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t9g4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ff0bef198so1052131cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488641; x=1778093441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXz/IqMsYjdHjJW2RWFqUY7tQFXb7IOjqpr3NxxNnAs=;
        b=cRTeejIGpM4g2Wu+Sk7pLOQwch3yMxmREJXbPDhuvl7ieFi6BYYMArhcit7o8/m7DD
         mw9ulCsJfKe0eNpu/SsrmwM7JUtKsfWGqfbasLeIVGJ0VzvdDsj//6O9rBSuVaXuT0F+
         2BDfNWVDhiZC/ZcEEkhZ1rntUIT5FZVuR7u5DfKABAEvvddoIoJ0GcWQ7C8TZg9+0TM0
         dlDdlxtJ9PblNeOn6if0+cpaCDy17GowFroUIRQLZOFQsDvhgsUR4/5wjP4I4ucNUMtg
         WFSN3A/w5Ni536wDpbGceADdd/f2EAHOUCgxYkgi/firnqM08l92vecShoaqPy7M/BK6
         DmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488641; x=1778093441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kXz/IqMsYjdHjJW2RWFqUY7tQFXb7IOjqpr3NxxNnAs=;
        b=CDAkgnQju7Pj3IB4ZCTruQIwpv/a9bokbNxxpkC5Ta/QqdsZiN6Rzwtgvw2SO68TTK
         uDwOqji997tSstoN/dm7BPGUgwHrZep4Lxn22TOlHPW1KvDMTckOMEdbEsjrOlbjtXxh
         lkrh/dWRhtsH8S5MY7rtjM9rtecTx0Ghg8f/Ek4eiNPWCsEViT8yuQ0hy0M0r49qI5YC
         ZuPsQnG4OeEQ+4T60vbtJRn6FS0tOgSedVVtfoY+3lyTg9hGmvELGuxeZ8iLQTKIDqq1
         kWTthw0qBsjKowCTU2WJIHlyCsWxgUsZrp/xipZx8tawsx1tvrFYigGoOPkN3xXsc6Ju
         z5mA==
X-Forwarded-Encrypted: i=1; AFNElJ9KWOmFEOIrWhMYG8XEUJffaDcWknU+xgwWUSVVuDqU5E3qWfiY61Pxj3jDm6nHcMFZdD3s9U3UiXw/K29LT1si@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Hr/h6Nj3q2f7lAzpQE+UtXe9gyjed6Co8jvV9LiktRPtO7ib
	bKkSDQ1YPjXc7KnSo2CI37JVRB+a9eZLTSfpktpsRTswiWp1+SiLxiNr2rg1K1vYfq3UkOcMYa4
	ul05OgjZgUt6x9IxnOFYFEH28hX8GlsPX+oXJWzMxpBwphHQFbbcpEcVT0tCHKa9TemlYJs/xb/
	JQsA==
X-Gm-Gg: AeBDieugrJHBj1DZiOIEcEJiPEO1i9ZrIYCYC7/MZqxRqnRFVMhiAgrzVKclBwysU9i
	X+v/cgkIuZT7qigVt6c9lHfMvC2wrwKpmaJqGPEsxdNABEN52GwA9gBqnlpGnkS61dVs2GaO1Ze
	JpHvChGG6gMO32lXUUKLlDoBIE4LogaAsa/BJ5tymV57zutt2XojugxKpyaugxld4OZcRjN2eqw
	l6wRxNGN7xESzlClQgS9M5gAEmmIHw5oGEM0HsJ5oVAg+ms68DRNrxdDULNg+rtnBQyonZmiIQw
	WwU4EcNL8IlkBNHaMPnUDB9slTzFp4N+3eZdD11aEMST61WyhJyL+mRdKKKo4v59GDuaBRC9a2o
	O4AkCMz6gc6uuxIWQ36nK8jgkM4UWWMk4TyiJNdbYLFFlKoNY8JUFT0Y=
X-Received: by 2002:a05:622a:1803:b0:50f:b3d0:c5ed with SMTP id d75a77b69052e-5100e19ac89mr120477531cf.31.1777488641175;
        Wed, 29 Apr 2026 11:50:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1803:b0:50f:b3d0:c5ed with SMTP id d75a77b69052e-5100e19ac89mr120477171cf.31.1777488640690;
        Wed, 29 Apr 2026 11:50:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:50:25 +0200
Subject: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4037;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IxeH2edhasWmVeNbNp/ezQYnOKLSvsnMrG5M06jPP4U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lL1xAeiTE41G07HB4Y0Vj98kN7s2Xr+KVQ2G
 9ZpNj1RtM+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS9QAKCRDBN2bmhouD
 13IrD/493xeu3QXek6mMJuCI1j2zfIkusN4OWqWkdcDI6OUN/qa6VEUYBu590F7XCl+8TUnsSGH
 jIpvB89NfyyC9XjzP1VTfZq7blgA4e+FF5nLFaMj8b5iTGVMNac9IHhhGxOSH5jDiJCSURDTXT2
 sPy91+O9+hlFZoHCHVO5P+WJZKcNyhSKaK+JU2MayojaAo6pVi5O+DTVjqOLq7ooP7fcbxNQGiO
 aeo3mEzai7UBk2mS47tGfPl/KrT3LXUhs6qtXDogB0DKAfOgXoahlmy7+PL8EsMegUtqcwpshEO
 LdbP3bG2YR84hxvu9sLQnGTVGmR9vY4WNNKP5yQsdvKFZd1bvT8XrGr+xaPqaorfMTBthc8pYqC
 jRxSUGEbSAF7DOZrTOmHthqLGNfIox94pOGWD6RITHtMpIlekxEH1fzhxgIps92jGbK34fX1qrM
 0KLr/EhqQpq2XLxEOAX7dKB7z9gt/fYECOgJgkMww0G2RTsk7xAc/mwoZTMh5k0s2JCExkDNrqj
 yVxQKfTLVoQ2oBUCOLRZRL0vzueUbovf2VosttSeSoUtee4+dBfoqp2OEUudr3lnnGu83IrqJ4V
 zkviniMWXx2ojzKV+ALnN7VM6JRPIh5OzdPiBQVoO5+y2Cpq5ylG1MCQww4NIrKE8l3JM3azJ16
 7bIBoVnBMYy781w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: FDKK3lZsI7jUiP21vDzhUmurYNRgEHnU
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f25302 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s0ajyRo-FUR_dJIxqt8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: FDKK3lZsI7jUiP21vDzhUmurYNRgEHnU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4OCBTYWx0ZWRfX+gh9BwHJ0vIS
 dll1oZsJ4nRIfhBPo4uKD8tirDRUEYXy7dNXG4Dfk1d3k55MbDD0kO8eRl3wiDVWSD/nWd1w5Mf
 B12Q/egRDYx4lWRwjInRYtSomplLP7Vetq0dvdQkRoVnsmp1IJ0QTJsfLWPXVuM/dlVbF5dqpu3
 lxnsneuZDFG0j9anofZf3Brp1P5tcr8IJuTYGasRokTyIMgH2rmUc+/vmP8KU+0JcMx7xeBM8Tu
 20OFqhWamDLXLpJa2W2X1BS8G2K+5q9keUeqetjOfcrl4axG/eDZxt5AwnvC6RO+fc42IAFipVx
 1DltpOo9X97m+ANIdG6HzaHySgdG3rOkYCldrYIcxoVTcwI32Vcs5Cl9xRvDetRU5rrsFvX0OMU
 c5ViCk+GYpcyygoiD1jElYcMXNfqhmumFFUkqD/zsCP/IVrtRHmugQYNjL1TwxWzqmF2k8JoiOB
 +D3q0WL8bgj+JuySfHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_115042_853743_5255FC43 
X-CRM114-Status: GOOD (  12.92  )
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

Make going through `make menuconfig` easier by disabling the unused
Ethernet vendor menu options, where no actual driver for given vendor is
selected.

Impact checked with comparing old and new autoconf.h:
  diff ... | grep '^-' | grep -v CONFIG_NET_VENDOR

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9f6d5d6ef69..79f6294fffdf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -349,15 +349,33 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MHI_NET=m
 CONFIG_NET_DSA_BCM_SF2=m
 CONFIG_NET_DSA_MSCC_FELIX=m
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ACTIONS is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_AGERE is not set
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_ALLWINNER is not set
 CONFIG_ENA_ETHERNET=m
 CONFIG_AMD_XGBE=y
 CONFIG_NET_XGENE=y
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ASIX is not set
 CONFIG_ATL1C=m
 CONFIG_BCMGENET=m
 CONFIG_BNX2X=m
 CONFIG_SYSTEMPORT=m
 CONFIG_MACB=y
 CONFIG_THUNDER_NIC_PF=y
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_DAVICOM is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_ENGLEDER is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
 CONFIG_FEC=y
 CONFIG_FSL_FMAN=y
 CONFIG_FSL_DPAA_ETH=y
@@ -367,16 +385,21 @@ CONFIG_NXP_ENETC4=m
 CONFIG_FSL_ENETC_VF=y
 CONFIG_FSL_ENETC_QOS=y
 CONFIG_NXP_NETC_BLK_CTRL=m
+# CONFIG_NET_VENDOR_FUNGIBLE is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
 CONFIG_HIX5HD2_GMAC=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
 CONFIG_HNS3=y
 CONFIG_HNS3_HCLGE=y
 CONFIG_HNS3_ENET=y
+# CONFIG_NET_VENDOR_HUAWEI is not set
 CONFIG_E1000=y
 CONFIG_E1000E=y
 CONFIG_IGB=y
 CONFIG_IGBVF=y
+# CONFIG_NET_VENDOR_ADI is not set
+# CONFIG_NET_VENDOR_LITEX is not set
 CONFIG_MVNETA=y
 CONFIG_MVPP2=y
 CONFIG_SKY2=y
@@ -385,13 +408,34 @@ CONFIG_NET_MEDIATEK_STAR_EMAC=m
 CONFIG_MLX4_EN=m
 CONFIG_MLX5_CORE=m
 CONFIG_MLX5_CORE_EN=y
+# CONFIG_NET_VENDOR_META is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSOFT is not set
+# CONFIG_NET_VENDOR_MUCSE is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
 CONFIG_QCOM_EMAC=m
 CONFIG_RMNET=m
+# CONFIG_NET_VENDOR_RDC is not set
 CONFIG_R8169=m
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_RENESAS_ETHER_SWITCH=y
 CONFIG_RTSN=y
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
@@ -399,8 +443,15 @@ CONFIG_SNI_NETSEC=y
 CONFIG_STMMAC_ETH=m
 CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
 CONFIG_TI_K3_AM65_CPSW_NUSS=y
 CONFIG_TI_ICSSG_PRUETH=m
+# CONFIG_NET_VENDOR_VERTEXCOM is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WANGXUN is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
 CONFIG_XILINX_AXI_EMAC=m
 CONFIG_QCOM_IPA=m
 CONFIG_MESON_GXL_PHY=m

-- 
2.51.0


