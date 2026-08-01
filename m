Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F77C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ibK6LqHgzG36kXmtKtvWY1wFxjnZQMKpesVapeRPi3A=; b=ML3lbk7vNDtzo8ynNR4T2gL3I6
	Nf1wvKbdwfQWVrREXaUJ6ceQHAUEjZ5jT21OuFi1kFF9AQZMWlweWQntrL6L1n9dDr/4+JCtdScAq
	q8T4eeaqhD6Q1/juFm5JvTzyWfqK2wCDBuCTOc7ciNLMlmDgfjuFQzMlsB9yC5S3V6bzF2uFnUHXJ
	iKQGRPwGoDvZDmOCVk0JTckyCNLkFSNzOQsoymcJR4LbpeTfki+NTD69vlSltolrnN3xQq+8Uy5Gf
	7ezpCWDXJtCqsnjuKrrTkNY9ntcVpmiVfRYJVe5KY8zrGCDgg8DkZyK6qLhIZnSQ1gEK+oMnvKhDO
	T/lRpyUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsH-0000000F4kY-3dlC;
	Sat, 01 Aug 2026 21:04:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGsC-0000000F4j2-2VSO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:04:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0GhT4014711
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ibK6LqHgzG36kXmtKtvWY1wFxjnZQMKpesV
	apeRPi3A=; b=IxbSIwngJQb/kXU30FA31RPgbfVa2rRJqz44aUQNYRF0640TSeV
	JCjRyhn2JHTZpEmgzkjA+af9xAUZKXBfAxlRbbp/gmjGBkpq4Ib3Ref2wswwFANm
	pOLi6k6Flew6rAEJBylO4/6aZFhbYSt59KnKHsacBKLz7+ApByuJLFVF5VkEonLW
	6NqXQFROJT8/N5a466ny87qbHHaXFfSsnPrhdSt8k1VtdRkukrRn/u5uqogAlit2
	QK6z8BrLZpeS7K618X96/91nYKHcRmMtMibaAsj2hjPtxtWT2cfPtS/Pku2/RVQY
	OOxSpr8uWW8Tx/NUSJixg6aydO/Ltv6Gh+A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx1qj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:03:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso23164411cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618239; x=1786223039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibK6LqHgzG36kXmtKtvWY1wFxjnZQMKpesVapeRPi3A=;
        b=M9YzIhfTNI7WZ+mj3Ks8pabg3C5BTscDWBwDK+hBKzVFzn6wecy12ZVV4zE8Pu3fo/
         nKyt9qQpUUByehHYhgMZgZ0EN7/DYiXOnsprd9Uslv2f4KkwxlYOtOJ1N9LkEspOqRQz
         BoVIACNY7tpcmnat99/hpNV9clA/CzEfmVRKBAZG4mTcYeyC8tM8KIGtKvZZDJjGk4qU
         5YrccudMVO3DDJ+CJm22+2+lRTOj3ZD3mk+CFvKpMm02orIQVxTMPV8cttfl9rL+JAPS
         E38dvGKiX9hb74SPhpBLHdMp6rSddXJrf8w6NJieGUnqSv2sTr/mOOOIpo2F00H15dQ7
         ZYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618239; x=1786223039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibK6LqHgzG36kXmtKtvWY1wFxjnZQMKpesVapeRPi3A=;
        b=c6/yJgfqQ/Axt9H44EouziAZl0yT0PIWV9TZivJ+8KxO84SJICpLB2m1AXvVpK5RKX
         JL7WtduzqAd8Nv8ni6SP2y1yFCFf/FZmxJFrO5PuwGmbCpoivhGOtejclfrKEPK+y0xC
         9qUepKIYKMvoL9t85jv6bYnB7fWhAB2YKIaXuN6OZ85O2JADaFdM8cb2kMBzyCZKdpI3
         TDvOD+xi+na5ElDS6rfLKByB2TkXB6+EKV+1kX7iZoZ9okRBujeiKpfEPHZjU7tI/uXb
         cM5I0I6oIY3aeudOd/xYJdTt/M7rsqBlY0vAxdQJxbXh3jr43GUTXqjo86Ab22WSvOjG
         vxZw==
X-Forwarded-Encrypted: i=1; AHgh+RqXwxKQkA4nbeRnlJ2/10RmPBeeMezwOkQJo4GTw8iDzIMZJr8VmR4eP+MgrIfn/bhfLsa1M9Rz7jndzcJt8PbH@lists.infradead.org
X-Gm-Message-State: AOJu0YwiHKPbQOBFb8G/9+fa83yIyD32f+M1n/qYOygslt0hm1TluiIy
	zve4Exz45fLYmNLV2X2fAQaOj6aIdG40i1W1CtioOO5D9fLL/3mf0SQcvOtZqj89gEad31v7BD7
	5B3KeACZ5LbgSW21X8JxN3nrD14S03XSiIQkD3YdPnlJ1mOa/6+/Fu1klbbUnuwVJTFpUmwZPww
	Pk4g==
X-Gm-Gg: AR+sD13oRvzjroq3QLhG+PkayWrQ1TzTjyJIrarslbVFSfr0G/GE+QIBb8GgS3vEx13
	2VAGDjdWQ7CWj/F2qE1rT8iGt3UghPNP++XmZpALv9aIk0gJspE+jnMlP6H+XDzdv/bDDTmG879
	ymHGTq4qru05Vcf1Cr6g20bP/Vg8S7G/Di0dTvNPM4iXpyFdUlXx1kTAFgJ4tqNgAy8u01+eH1s
	AKAal75IiOo3NCD/mb2myU0WTDwstfIeum2r7Ou1TtiCAxLe9LyAxQL8F03wa08IZqUX7LoYmNv
	J+qUkFGymJivHYd6vdScHAkO5deNBzAGnoDSSxL3z+UKBiQotDcYSCV0zFDz0QpC+ouu3Mn4XII
	ULX1wSos36QshLK9W
X-Received: by 2002:ac8:690e:0:b0:51b:fc67:c73c with SMTP id d75a77b69052e-52b566dbe08mr113236141cf.16.1785618238831;
        Sat, 01 Aug 2026 14:03:58 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:51b:fc67:c73c with SMTP id d75a77b69052e-52b566dbe08mr113235651cf.16.1785618238347;
        Sat, 01 Aug 2026 14:03:58 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm17747602f8f.4.2026.08.01.14.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:03:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: exynos: Correct white-space style
Date: Sat,  1 Aug 2026 23:03:54 +0200
Message-ID: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Bp4EO+bL5yc1jZYaDdyI0c+3Uqw4Url/keGMxlMQDoE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl85QcY3F61GKXMXrQBwgS29n3nDyolMOVqQi
 9VfkOIBeg6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fOQAKCRDBN2bmhouD
 15O0EACONzDjqhT6o/NU5cl4R3+2VynfG1DDQAJkntazCotds81eIuZEUtYAbBHq9DwawiBJaAd
 yOwGnyyQ9iKam29ds0WkZcMYjCQJ7vefjfUdYb7BE5qaF45PHhavR+DQ3JZzZIFXqZM6aZRQYio
 a2DLv7C9RRI83+cFN809GC9a6sUpqfqqQhWxuCZrxQL71/dhAmCuR3YRm8fjBZGlG83pw+vIblg
 dNfAbf3uBgGhduhVjgMnti6dSKh6/DJI6Fp2uM0ctB77f/qzJFZE4ASxHpl+S+a0JBvnxc5LGUZ
 vzfK1sKG/l2C4WNzvkd0BMJCpuWmpShV+t76FFXdWqAJuPPz6vb3kvO1T2ZrTnF8B0m/T9RegyV
 WzRHIEBu9jeWQqTCVRp4xM3leq6jkLYBHi77YQ0/uM3TrhUM8T3IGrWT3ILdXNlCxOsVlw+gYqj
 KlrkjK5YAfx+Z72AxRXIvYyR0BZZHCOks49P7j4lqooCkdG4TV/vJ9ozFwjgRtrv//IP2tYIbHQ
 +8+gnDQBPBV5jFizxIjE6XrOCTVrxrTr1hGYs7VBvPISADyJie/70qqLsym05/Frr01IYt97+9w
 TPqVz2xNk1Jq2XLTcbhhtDV3AOfTzrz+xpq2uj08oBqpiX+7E4ofPrZnH8ZmHYQhikNNjioBsH5 0E2m2TAT0i9etyQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX8BM9+1IqnCO/
 ljskB1lpjTTAO7nTdQ6AJAbry2uAYQ92OIrrOe4kb2+iHjwfX9Fh5aG6Ls0GE4LWPuqCPpsyDTI
 fRnUc0xjyxqSw11PPNdP8mN6ig22nJaHM1Gl4F4CLXoVpCwSSs3fcbl/J+0irbiWRbYGB6t7dnr
 2awlCpD/hoq8L26U588IFmhSxzxY8Zf9gn/2Q1x+qCZnWLx756XHDFe4g7b9gUkjEwUThgk6um8
 J5Pa+KjZCwDNeIOsBIsyC1A4F0PjCL9kyRIYWZIaAYubm9zYOFlQwNkKb6Nn6v8Wr9fw+FSSu9o
 lDFWa6txu2PvFb9nsrLd+ITsGagR80Pxoux1tRWEYnr2xwVUo07d95mrPXkL1cf5LK/+kyQWoKV
 XxuodhmnigxSVw6wGXv59QFy0QUkYOMVV9xZI3tGXf7pH8waV8D6u3bJ6ncf51oK1Jqdm+W25H9
 QVRt3L9zOrjigHru1Ww==
X-Proofpoint-GUID: M0uXA0AwqKreNrgIwybJPvH8XECx3Bh7
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6e5f3f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WAwJ1FRNEprDOCzB6JEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX1IOG5g9Tw09P
 iR1vl8xiDQ9VDuuUltrI+9ESOw3LOvUZn9FeUWWMvQDQp0/ABIhR355hhPN6kPCItvrcrsqBhBB
 tj1CKPkVdWNIHrh11hwwXrfKQt8RmxQ=
X-Proofpoint-ORIG-GUID: M0uXA0AwqKreNrgIwybJPvH8XECx3Bh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140400_756821_18565CD6 
X-CRM114-Status: GOOD (  13.90  )
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

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi   | 2 +-
 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
index b65f1698cd74..439d7d7e319b 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
@@ -462,7 +462,7 @@ gpm21: gpm21-gpio-bank {
 };
 
 &pinctrl_hsi_ufs {
-	gpf3: gpf3-gpio-bank{
+	gpf3: gpf3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
index a675f822acec..646722da4e8c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
@@ -77,7 +77,7 @@ gpa4: gpa4-gpio-bank {
 			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>;
 	};
 
-	gpa5: gpa5-gpio-bank  {
+	gpa5: gpa5-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
@@ -91,7 +91,7 @@ gpa5: gpa5-gpio-bank  {
 			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH 0>;
 	};
 
-	gpa9: gpa9-gpio-bank  {
+	gpa9: gpa9-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
@@ -106,7 +106,7 @@ gpa9: gpa9-gpio-bank  {
 			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH 0>;
 	};
 
-	gpa10: gpa10-gpio-bank  {
+	gpa10: gpa10-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
@@ -1030,7 +1030,7 @@ gpp27: gpp27-gpio-bank {
 		#interrupt-cells = <2>;
 	};
 
-	hsi2c13_bus: hsi2c13-bus-pins  {
+	hsi2c13_bus: hsi2c13-bus-pins {
 		samsung,pins = "gpp25-0", "gpp25-1";
 		samsung,pin-function = <GS101_PIN_FUNC_2>;
 		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
-- 
2.53.0


