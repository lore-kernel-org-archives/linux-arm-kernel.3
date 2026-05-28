Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E463CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpCPwzY9U1A=; b=x7tH9YF8UA3lba+FXGIdNRIoMF
	6iySIfpkEd5zGqDO0fK+dxRVYWOHnMenz1I9jqesMHvFDPjg0QUJf+PERgT6aNHkIkozMiMkuk1Th
	JbqPzMjSsZ129GzLSIsWcxxIDs3qo6bLrzAYawg9b3WbLokAyEpkrRZ2pqZcB4seROMas/GkPdLmD
	1KjR1LHmZrPA6/eTOU3PAKRFE2cMmPSSb/HI+kkTJ5IQPRVz52lFajVNM3Dgnxi8FS5FuwbGP41X5
	yAyWixfLlAfrEvei2nG7Ty9fxaQq58Z+zCwguhbwv1tKCHPG5tX2Xk8bhRwvN2ws8Btl4YDKLKiMN
	5kP9XxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZSb-00000005hNQ-1A96;
	Thu, 28 May 2026 12:03:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZSY-00000005hMq-0aAn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:03:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vSR34184457
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 12:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpC
	PwzY9U1A=; b=XKxdT2ZxyET/kRwmmco/ZMp5hTn96amBXkrujkbW72W0YNHe1EH
	nhOIM4bMhT2NGdVjwGz8l1Zj4duffd6plFgnjM0xkxySoiTFfgA6370wKZmL09ek
	FM3H/vg8mpW2weJGjJkAPHVgB9rL29RyKUgAZCh6JjJne0sR4MyZGpzjVDupZT4q
	d7wRvPmP11H4rE7YJSJJAXP3G1qPrBlsnZwTh6EPjj8xlvrqRqkW7MeQlj/ESQRj
	IJnIUqn213P+7sxrpgB4xUX1Hhy01BqKVsbQA0EBQruY3v5XtNr/DSEK3r5wv6VD
	KNLXROP2k7l93zKFSoHrEs3VAbbV8anImbQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yf2n0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 12:03:32 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-69dac65fd9bso2857265eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779969812; x=1780574612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpCPwzY9U1A=;
        b=g1nH/QH+o7BmoXIygsHAI7Q2YsBpDGC/yzO9jaA8ufKuTk3X7Ana/GYB3po8d2TzIj
         xrFfugb5+xpUzVahxDhstfMGvMAD816mB+KYQQMK/Rkr2iusGN0T2Tg80hJb+eSo9+ko
         XzNMdgey0104k9UXq5p9AYhuxFFBH/t6bqx/DwzPEisv93nTZ1v9/gpj3rhJcKbrz1re
         cat58is1nsBuEc53d9DZ2e8J+dp7OluwHfCyKUkCw+Q1OqRMi99xwDIIARYtNotm/FKh
         ylW5OnBbGtXMvLVtpD9MjfFsNTI4tfKDdEYyH4LduM+sLM4SNrlWJAlAd7D+xSNNHvml
         l/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779969812; x=1780574612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpCPwzY9U1A=;
        b=ZvKNS2a2t6VRkc4KZftJLTCUoWo4itZxL1sckc9vbOcHBJQCTfN7QDaYCqdBVk+uVm
         RR/r6M9QOb7GBbp5Img/C45fatlE7Itqbl+J60Ra4NK1X5Bn/VBcXP+CsNpis7mmwTuo
         h25GzC2oTbfUX+V/nS2a/ht0pz62dV4L7gkcltGM/kCC2R1WZOshyO5t2bD9VZSQi8RO
         zACGu+TDTog0Df2GRdyVwTVN7rTidW7UzW2rBn4+d7/bC97oFFPLn7wJHqR7ItzSbJi6
         U7blNg/GX4W4hBxipxSTwOYf3GP5k/xLksXQa1RU8mOWTPSxQdMS9bQSYplYnDMm6FOY
         haxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qMf8SPmownVTvcNyV6owtx+mRJJZz1+g6G7L9eWYZW0o989NnvH3nM4gOgleLdaKwiBmI2lcIYgGE9bEPg52c@lists.infradead.org
X-Gm-Message-State: AOJu0YxIXmwPsqVAfIFemkjm7UpqK+S5lGPyZ2BVXg1fmt6XU6c4vWHR
	USYgTeVdVqYhGfqBPfeVp3ZrQbJBY4zojMIPzhfEPkim2N03Cm8NWYFBrllIACMXe5jFm+rMiGS
	z9xnNT8lgH5cW6/uANbz99JRJNAXBXtOBAubyvfURCm497vhJ4RJaoPt9xR7xbSukRmgX87Vf6l
	Gw8Q==
X-Gm-Gg: Acq92OEL1hzEMudIv0sYCXxXonD7JzTGye0PxSwy686ThHyQJ/lH3UJlP1tJX5BEsWM
	tRPjShpWouTzTd/KDvOeF86eUXg9QVsjhqdyOUoY2/tDssryc3baUVGeEHodrmYYUA3Em/49s8W
	7Yu1JJWbIBth5fN0idhUjif2W9Jfc2COJhohexblLoDPkmkPthmXdQKUGDVXkVscosqDAHCVmmp
	PEPOdMXSe5TmN+THonB3jsHzcCl2h8or99gfvnG9LbP2CW9kzAFnXiz15J6dfDpohY/ckpEHtSx
	Yb3JN4DlKYguJISUtaYhgHolwJfs/dY9IzgACLUi16qQSkWeJeYIDTgr4nwCRoKKDOo6v1e7+jF
	4Z6AavaKX3ma/PpnW5igmVn8l2j/mQIT84U5uSXo1eUOUMA==
X-Received: by 2002:a05:6820:2222:b0:69d:e8de:7578 with SMTP id 006d021491bc7-69de8de7d2bmr3066729eaf.17.1779969812196;
        Thu, 28 May 2026 05:03:32 -0700 (PDT)
X-Received: by 2002:a05:6820:2222:b0:69d:e8de:7578 with SMTP id 006d021491bc7-69de8de7d2bmr3066668eaf.17.1779969811575;
        Thu, 28 May 2026 05:03:31 -0700 (PDT)
Received: from quoll ([83.144.38.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908dcf850fsm21035695e9.4.2026.05.28.05.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:03:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] arm64: dts: s32g3: Fix SWT8 watchdog address
Date: Thu, 28 May 2026 14:03:24 +0200
Message-ID: <20260528120323.46287-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cEmybGRQQvbIH6RlGMiNk1umA_KoAOyc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyMiBTYWx0ZWRfX3BshWsnWSz/M
 OwArLtCiwKyceLzP8a2F6IaFabp5zyQZQ0EZlaQ/w5x4FFboUOk18TaeGJxUAjtuvBCTmesshK3
 o8pn5X2488MgQ5M/PAa7t+0/RZYmIcy8lk1MDtbmPMwYQsKvLQ8IJ1VCbVjtnBKQsvh+9TW8oFX
 gm5Sw29QFxioYIgrNkbxb+qPwTYw1v3VzMj4ke7kqi6soXydS53wRmstZ8V8nktcciqJYaWqe2c
 b1v6EsZFUuXp5QY0/4x3O1SGaq0iUSQhEGs9wejoeEvlBnsFBJcYWIgvQKbtd+2CXG0NyWFmzNB
 CXLjqMedrbslTW8MaST/olRCCH7QUvYC1IyNmgPpb0GQOXWefJGibgOV2OTZnplxIX8OVD71raI
 vxg+wIAw4awfWxcXeq2Hwv7pbAcJxAmhgkdVscmQ0PoT1xHmc4e27wAfUyU4iWth+smZc8RnJik
 Ag/e2NwCkYSc93nB6NA==
X-Proofpoint-ORIG-GUID: cEmybGRQQvbIH6RlGMiNk1umA_KoAOyc
X-Authority-Analysis: v=2.4 cv=G8gs1dk5 c=1 sm=1 tr=0 ts=6a182f14 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=gYaODGAG9naNOzoQWaDNdQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W4yJvGHheH2QdBhsH34A:9 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_050334_292754_CF09071C 
X-CRM114-Status: GOOD (  14.45  )
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

Add missing hex annotation to fix the SWT8 watchdog address in 'reg'
property, as reported by dtc W=1:

  s32g3.dtsi:863.27-869.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"

Lack of hex '0x' meant address would be interpreted as decimal thus
completely different value used as this device MMIO.  If device was
enabled this could lead to corruption of other device address space and
broken boot.

Cc: <stable@vger.kernel.org>
Fixes: 6db84f042745 ("arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..7e28dff53a86 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -862,7 +862,7 @@ gmac0mdio: mdio {
 
 		swt8: watchdog@40500000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
-			reg = <40500000 0x1000>;
+			reg = <0x40500000 0x1000>;
 			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
 			clock-names = "counter", "module", "register";
 			status = "disabled";
-- 
2.53.0


