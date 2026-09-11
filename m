Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6D9C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=; b=fX8rhLm/ASFdmIDmIVQ9ua7mfn
	K8butkfG9ANQtn/sb1na6W7q4TKDEmTjQpX2dLPiLssbs18LMYOhlhk1oUbmRy9qBo3DxIaivkHFM
	VtG+8gZ5arwIH/3Aqw9VoKflheRcdKISI9j4YO+yMqQ3JuJaO/MdPBe3tnw/XcM33KP6WksLVBJn9
	1gSh4svxXdk4HZLDcvLU0FO0GX4Apd6sYNDQJ+SSb2g7DAqZ62wIyc/Qs6OaTvxoe3gPjrQ9vpOET
	deF5lR8OUbdkwU39Gp8Bc5vwC186Jdo2/RtqPGScMvSW8e55ir5jgVhPLg4jJjRn+fV+fW3Xp3oXA
	GEPF1U7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yML-0000000GMBM-1a26;
	Fri, 11 Sep 2026 10:19:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yMD-0000000GM7Q-3TSw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kpTH2311438
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=; b=biwMUC8cA8y+maYg
	7EOnL2pVW+J1P7WYDxvjL+cmoIbOEQM1/k7on3RAnR1fkxXUqbPkDpUFEymm0MaP
	e/igzEvJ3fPjVyrwa/SAOJBFZ5kX92ibqQl0csc6rYEjMgdiuPGJw32s77dYciuL
	gevYXpQ/8w+DBygNQ5XNMBzU0399wwZWURYdVsIT3/omJXQw6XO9d0B5UKoWsbJ5
	yxm/l82xyWn/kGsEZ7R7a1I2fijEGpbW+7kdglnuj/RW65M+Qd3B6JpHYgaqBMLK
	nQwX9+5DB6q3wmypzP1O6DRr7miMs19kF+8J/4kYY9guyKLkTuvDDa7KbWi+YKQu
	SX6yDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchxmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so127962385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121984; x=1789726784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=;
        b=GeDeE85rG5eiTYOJvy2F/xJU2jBMJb8Jrot4Tv3hf0jiQHq2m8smN2ocyO4mPFGrn6
         ivEBW5b2dAOEoLFoZ7sobInDezyYtj/LTcOpBZZq4HrrmlHHMro+/V6L/WbTbm9aTrhP
         7ItIqFE0PjISYD8i48kO4GhDzg8+uUgNeXVNMwro3wj9HCs21ma/r2WnJUdc2/dUGy+b
         QV/k5CB2S8UgWaGazy6rhIurs4WApKi0ioRnPcQVZST5/rSJmoN46mvwhwUkbZhAkWxX
         p2dYnrHw/7+m5RM060jPx0oVwUDr92ysISPmdIHrnzVwTpsyIjxLmD42af7cFhFTRv+i
         w3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121984; x=1789726784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BYqkYdba0fSx3KIqzIcW6XRTfi0bpmsDHS+Vh+05t8=;
        b=lVb2muRnROJi7a4eP1FZBWt5tAltOrKtfQWd6yrxmTxRd4ak2KXZCjNzK+/vl6musi
         9ox1bd36JSffLULJe+w943dsn8WOSs1D2Xtaooo+2IIVn36jQKPOac1sT7iQWlUUpgbS
         kApRwPaVg+QSQsZkQa27HUTxxATBhy1vp+uMI4HAJf2ZHi8q1znmIDZWUBktWHwtyu6I
         6eFFA9D7gR+xioLBOS74CPVkpvnp07SmVz+5MryRo3RKIvlISbo8ehs7PVib1r/Ckn9p
         XGATdaLdkT5Lb+L3yrp2nI3EJTidPgBH+w/w/KXKMc70l2+0oYerMJrjoriNR8ObbYvH
         ocEQ==
X-Gm-Message-State: AFuF++nA+0FmKQXRvtUn7wV3IGU+Y46G3WbpdXbNEiAMmuymhHL9cF4b
	nqxLZ/LiM/zR2GQZBpHhjVbKGTQSNeDThYThIuq8vUzm2OtqJC3GC86zeuAuIt9aVNPFsHJRUKV
	nAN1tVCu8EOLIzri2WHK2jDWX4/fmW/4xNk/aSV7rx7vsdlJjQJZLXmS+geINTH7Hx6+KEuv2PM
	oi0Rog9g0VOg==
X-Gm-Gg: AYBFou0gqeluGExDHHN6wv/A4fnWRw4Ej/lwSgHCsN2JTHTErdi9AJM/XmaZezX47Pz
	pYiqMi2SV7ar7pjTSi2Xu3Ivhx50+z05UqaZGb6Py+1YN9MuhAxPH9GBZ/pqdOSPBtWQkiVxoKe
	Jj7bjjjMjoTfiEWdNS2CdczwefNP5PyrYyjqjAZXilz1TFRk7P5iT1J21OJc1ZvLhY4d99512BX
	372K5OBKLF0aELJBNZv2i5l8JqYrsBHJ154gNZltmbhJFE79DpxiKWAKv9VeGmME6uKkws+q5oF
	MT2uX5Y0RNk+MPmaH/6YfcmnhFebklb5kmvxyfNhzI3CVsAcWxNsmwjt0pVIcKiGrq3cJdadnkO
	prNhC+Wr7SPAyYC7mZk4+uCo=
X-Received: by 2002:a05:620a:258a:b0:92e:76a1:96cd with SMTP id af79cd13be357-939ea116ba1mr437142885a.13.1789121984444;
        Fri, 11 Sep 2026 03:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:258a:b0:92e:76a1:96cd with SMTP id af79cd13be357-939ea116ba1mr437138185a.13.1789121983950;
        Fri, 11 Sep 2026 03:19:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:13 +0200
Subject: [PATCH RFT 05/10] arm64: dts: exynos2200-g0s: Drop chosen
 address/size cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-5-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4/bxEzNRfD38kLZUAytlEAXN2P69ZTTdcIuMy3hnWPg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WrRHGJwXN8rCf4lNv6t7xS13waOOMkDbARd
 KPipdvvIOCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqwAKCRDBN2bmhouD
 1yEZD/460+dzCxjLoRp6UE/QsKNYguHwHVVllIEInUBQ8EOFFnSMwv3wMcwtoOs4dBMxzj1ZFPG
 kPnXv5dZd/GPaSD2Iym401ZzNF15LVL+SIudgO4F5T9UP6J1WOvw6G8MW6ILfRnz7xjAzXLrYNN
 ekCtBV17gywgwUlQTa8+8bktbBvrGPw9zeukiYhSXh5CN1+wHZYxxIZgQ9WqA5xQNKrVA+f8/8F
 cDJIMe/IZvMhXVspuQtMZ4kN9QPAieFUZa9EY7LqaVbP5nDbNi6NpINPk5lh3L2g8J02O2PV5Oo
 /DycinCNcUr1d4i/vPhBAemlS1luqAxPjEKL9BKnB2mMs2H9knhCVMdPMUYus6AFpMYP+lPYvv2
 QS0sHZkLh9y2HKB9la+4xH37QhM//48BcQ7hM7Jjs9K2fNUEV/YCzGgbg4TXliYtKe47t9cygld
 X3+gLhLjhFp2Ra88yj9hD6V3bU/3pgTYwuvn04SEW9p7lYYDC/v9OqkrjKOYxgOpCHFsnQ62BG9
 ROjS99tla4pqG54rk5xtf9HydTQ5aORDi63MGavKUCV699MoqnM+mL1R8/5xznKpmnoyyGtldSP
 DpsQOk/LIDAgRx9HFebFJTGSm9NKEn9jiAz9z/0G0KHjzhw3kgVVG1d9QmGLRvz/8a5TGXXNxiB
 TwuJAwUvBVhA3OQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3d5c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hDLO0aQh0UWOkkj0oRgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXxbviqk1yhXvC
 qbDjBHY3CfSsgW8/DFnxSzAwQB9lUwT/aR0g0y4WwMp3bb3+YofVugojLw1DtbtvIpZeu1CgEra
 nDltw7Rh8IJFYHa2QSyvUM16i5GP6suoxSYa8vp/St95A6z2k1DwnKqmfzFS2W5Py+O4tCdi6NU
 KhW2vBPNDunhHEBZTcfHkERQOB+vtPLoTRQw0vhTFMK45rIRjebNDawnDNgncu3pcCei6kMXCas
 0tPZZtF39mh30jpovD9spiQneNd+rxw+3wJbfeLQrMIivY7ueP+3Np0+w24pdGDp6hU9uGm+BOI
 ubvFn1qWVZnuG8muheVUoF/tzseDaKDl1M5YFg0JjPJmd9TmuEO++JM6O9IHhbF05JdcMLsqH6i
 g/oQbiBQsZ5Rg31u5ZgGBWsUNLsDAdBoaYy+HnOgx7uxlxsgErpp9B+aw9iIW+dlMXI82+t9V39
 Y+lSQrc3zrH7AgV2ACw==
X-Proofpoint-GUID: W8gelzeHGUjbqJu6jfK_G5fvlNT0uWXu
X-Proofpoint-ORIG-GUID: W8gelzeHGUjbqJu6jfK_G5fvlNT0uWXu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX7+Nln51hXJrA
 6LCgHFOhxQxzIc7+nCWGPWx0XcezEtfsCOgkWKbjcROXlNGIndNw4ygfeUsMOcpCwRQykvCXrY4
 z6oD0ynA7COJNGzIL+0fdZgE1p4OK1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031945_880129_6F0C5664 
X-CRM114-Status: GOOD (  11.73  )
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

The only child of chosen node - framebuffer - comes without reg and unit
address, thus address/size-cells and ranges are not necessary.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
index 458f1bc6f5d0..3687bbaadce7 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
@@ -17,10 +17,6 @@ / {
 	chassis-type = "handset";
 
 	chosen {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
 		framebuffer: framebuffer {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;

-- 
2.53.0


