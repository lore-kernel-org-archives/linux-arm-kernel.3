Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB46FEEF33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOhXGxZIJ8v5LzBKTzgeyUeFw8EGCrGa+cTSiBNVIxU=; b=lD3Wi4doILLnUe82wXoBL0850o
	P4y7zrQnen2yVJAILaqfXvjxCFfgb1zAb3B4/XOfL3QiBnKvuXhJ0b3geIfFOmDrjduEBQKkBdLDk
	59YATicL0AlfP7YutPADLCe4RcFg1gXu1EWVP1ARViBzepadguAaclNCOzgI9foZJHooMrozg7R8h
	6EsvbWsfh0I/utZ7uiyjhTMYYNGBOO2pZjVuEHD6n6KLQYg4HXCvFZpDBm6ZDnRsZWhXWbyAGJk4E
	VYdqSk7zb3u/4JIB4F8h+GZ7ktdazQqOYXd+1ChFSivMJ0fSdFDMAsNTEZiRC/3e9vHEOaKZDDZDW
	8w4L2xPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iE-00000001JpI-3YRL;
	Thu, 05 Mar 2026 09:09:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iC-00000001JmC-0ZSu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:09:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258rtuK1193205
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOhXGxZIJ8v5LzBKTzgeyUeFw8EGCrGa+cTSiBNVIxU=; b=S0+dBSzj4cwEJ2zM
	xSrD7HqQ9miYhvpKaUwx646pGsHlZZ8ODjl1P3QMikTbAOgSryaGtiSphxfczwbG
	2hnpM89U2GOdGBpsLfnDqCfGARIBp4xZ6crrJXyCEegM1ei583iVoCo8J5gX3NBh
	e6cIJ6eIHXXVv6KL3kMIGd/HwpG1KCj5qiJ5rUDrlgxrxXe63X8ziTQ+kb0i4OSf
	razlEh5EY3BrzNl03Bq7heYu2IOqgJjEW/HEZh+IkhTVku9f2DPjr00UlLXcxzzr
	OXZF/7Nq3LpyEosKQKZwIbNzl2D9G/tDiFph2BsW8UCMUvRWpIMxKC9BEVSKA+4r
	Bo24xQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwgauuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:09:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4d191ef1so1013467185a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701778; x=1773306578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOhXGxZIJ8v5LzBKTzgeyUeFw8EGCrGa+cTSiBNVIxU=;
        b=eBoBJ4CxltfA4wryuo4uT8A6Wc942HXZAPvxJHP76ouu2YeDPkvWRTYvBo0V+MX0Xh
         fGqjGenHsVyA6btdWxhd9LkGAFYLm5x9DDhAOgKTC0vfObWMSF3jvhvIPOwoT5ApoLSE
         e6uWrNx9TOi1jRjrpKsoyngYE9yVLz/MDH77z+5vpspaPBdbZ2/AfzHoJuQ6BEdZnY4g
         vjgkUVTLnygVWhxzY16fYb8vjTlkQGDiM3hpYfZEWo1OMz0f1GsnkD0oYzHikyzp+ZpX
         kuzt8gPx425Yq+mTmcgb4lrF+EydSfU2oo40V4RMdE1dpktNZj54JTykKZeITIxej9PS
         aMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701778; x=1773306578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOhXGxZIJ8v5LzBKTzgeyUeFw8EGCrGa+cTSiBNVIxU=;
        b=hlOdaL0yoibVTvCfg0RXfsfsXDXkxARrX08fJb479Do/PCdeoxPnUEq1uZ2qU7gduB
         LBujbyQxb7YWbtDYaOdW453eVF/jeXmNrpYZCcTkZk2PCfX8b9K49eb5g0Ke1bDmQVE9
         WCvIERCfVFk4XvV3c3yiqxqHPNhb4+ZsV6yVIdFAMsW5KE/uJA5MoHxf7VXkAKTvR5ZO
         LzXjS8M+DSq1jtxaXSo6a6FEVq5Z4sbqthESHaNgk9pqgsq1AU941mFGeEJABQOfw/hV
         aoXneU6QX7XS0zfT5K2ajTo8jpr7SUk9R5ddVd9/0BX7H2shxGJmpNX7EAzLhrY4LmP+
         jz4w==
X-Forwarded-Encrypted: i=1; AJvYcCVnODE+CmQfxfcjhr4qChgwjs7IQT1XyDtwET1Nte/vnDOM4CrLhzUndFeoLncaW6M3l1GGRndrqQbBI+jNbv1a@lists.infradead.org
X-Gm-Message-State: AOJu0YzDuVi2RkH0fKHA39eMs5mDnyqd7d/HX29jfJQDmnyWAVos6mMy
	4XpLyp0JZ3qe/5m7P4h13FDrcYCuRjGHalBlioYQpOXJvl7H/PGXezrFbqprlfH80ybKVb0bIXh
	DfU5QhIEJgSnzJGJsSDFm3ampdhq9nITlvMubSzzCZ8slD1o7GZio3aEe3tso5fNRUhPZumIssG
	4b/dDyu5wt0g==
X-Gm-Gg: ATEYQzxDE6o3qc7vlEzi93ZWQCs6IAw/b8iPOVw+z3KBx1af/pMq8rdHMMxfzu2CSFT
	xam+yZDUfTDqxhXGzYyKMtZMZuWG+NYoFnoT6W5VhT4QTUiQ0tP59OILg8khKoymZTG2vNxK1Bv
	sQI9Wt97AFMtW79EbTdVN+fVAO3ND1GbA7jZZ/AlGlwJhYRU78lhNAC7zc3VQ4QBoXgf9ceem2I
	ST4WFy/knJYpEaAxImLZT2/w5LIQzqRYuloNk8sbHS7MO8z2rR4PGD8U5HZpCWyA+T/WpoEx3eb
	2MgmfOWlYV8HGsdneG+1OvoQceVN3QmqUmS6sYoe3cx4GrP3PJ4VQKQVlYNZX1ZlQMgo5GDsFvo
	3oX49tpIkPzmaVGa5jGRjjEkEhnvhXUuTbOGnJ2beHj77
X-Received: by 2002:a05:620a:1994:b0:8c6:adfc:48fe with SMTP id af79cd13be357-8cd5aeff3fcmr617491885a.23.1772701778474;
        Thu, 05 Mar 2026 01:09:38 -0800 (PST)
X-Received: by 2002:a05:620a:1994:b0:8c6:adfc:48fe with SMTP id af79cd13be357-8cd5aeff3fcmr617490385a.23.1772701778029;
        Thu, 05 Mar 2026 01:09:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:09:27 +0100
Subject: [PATCH 4/5] ARM: dts: exynos4210-smdkv310: Drop duplicated I2C
 address/size-cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dts-exynos-i2c-v1-4-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=766;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t/sgi7P0rEH01LTRs/rGMHpg3gopQTSzKBVQq6gpe18=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhIqDb++ZjL5w2d02vjNcF0zJCMRjuqZtizh
 hIGsPRIbm6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalISAAKCRDBN2bmhouD
 12RvEACNUl2XDJOmNnV/wDCuPf1eLG+y1YzjFNCMOt0aI2BIacy6jEcIF7f7EQUKFX+jLYxRXmY
 jI7zvl7AtT+mnH6NIN0YYFM11BdjYCg4T3J/3+5xPEfubFSbGIztbdZ1pkKh++pyhhw0+Z8QB6E
 ZBuuF/JXsUARhUK5rQMdDx/R2s9CUUFCbzwCfDSTyc2RuDaRFGsSC001WsaHNE8WTrljsGVz/4S
 2IHtu7tlf8OVUuQqJEsxlgEHZjp68kATCow047qIzg0NtDRVMWNakjx/bgYNDIgtL0n+1dsorDj
 UU0pjrZNZ6W3BhOK5i1bZMKZnTQ7Eoe3a+0OIEO2Bb+ngkcV722DNV+sygVydykIpeenh2p6GCX
 jWxoOG5mfWvl/IoTp6OzJ5QDv9xoDHJoi4Jy5UZw8aoIx1fXh2Nd0fS5992ZPfD2Eydqf9tfZkj
 tSW1XsBZ3gRSB2YXlNjJBWtHYvfpm7S9r37B3tFEJCXUNjb0GHiU2RqMIcZFnHGHzbnn03Yf606
 y4CK8vUfv2IOofyMNwH9nlFf+mIFezBLcyh7gev0S06DkBNjrnZ585FXTmGYxSoy+fS000iC7xY
 VxXRUskzZdBDdzyzspT9CoRfhT1hOYfEnUaHjL8rPTU1gBjT2/mZYwD044G+xiHjlz4AWu7fi6P
 Eaiv1MhsVRA4HlQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a94853 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_8SJKKBjhkPuRUrh8E4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9k3Djrx8p5haPw6ekV7oIiWyVO89gHTR
X-Proofpoint-ORIG-GUID: 9k3Djrx8p5haPw6ekV7oIiWyVO89gHTR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MiBTYWx0ZWRfX8dHGhit7ssPM
 Kag3B90M3jqiIM/L6hWTzqQxMx4FdPfEoyNJrrGY6ZskoElFZ9Ogygwb6yTfVKzNuVyjrN/5a/i
 tZ3/iBSPuGDM8Dtf8N7Vg2ohlTze95OaoLzHvugFHplNPABaIofTT2ADTNOboaKY8Ki6tmwkiaB
 gvN7oQHGPk1Sh6xe4T3pTtP8zgS6slGAfwh+DK8d++1ChUSHx8gHQNUZ4qVFg0b+qL0c0av1v2R
 aBPzNUy33/xPgK9qB1Or/9QmSANVDzWVos+2XptvJnL1P6MwG5qpS3Psj5IWbXdQO0gCbMMjIfd
 D6WMFghRww/NKv4Vqk02gbM2QOQvFNM/RGxRVRgtRm9pYh/v+I2xsPoeh+T1eShvVCghr7ZdtQY
 RwAzKhbQd5HWJPkBATP4rrmVp50gZvNSnQi3F2VmqJvQRmWus+QybU45LCqWxonoznExI9TpjC/
 JH6hVIBQxCNACoR1BYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010940_328572_72111D50 
X-CRM114-Status: GOOD (  13.65  )
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

The DTSI already has address/size-cells for each I2C controller, thus
the board does not have to define them again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
index 18f4f494093b..a6b73a8967c6 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
@@ -68,8 +68,6 @@ map1 {
 };
 
 &i2c_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <100000>;
 	status = "okay";

-- 
2.51.0


