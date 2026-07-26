Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F2BC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 17:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=; b=HKYIXRlGefq6cNoEP+WviqN/Yt
	e/DKmffwmScDBkMLpJsXtK4YsuqGY5jJH7gGSv0LXPJz8D28SCqfUlTon+es9rI6f4mK/RDfk6eLO
	+gDTeJf2j1Vm1osK8tl6EO5M4P7+MhJ5czMRnl4YirtokXexAug2VnYa7AhdA0cM4Tv9IiQho9p5O
	2iuBS0OgQrHk3oqKg8WAdQEaanWSWghJf8+vqhbWJjM23rGri/qI3kuGh9/bxO44dcBetA5QZeHcB
	1eFcypU1ZHLP9Uog5eMrcjfhcaDwGTbyMpU36+vLLCd1XjTAbigUXdoEb/UjeosB5UqFxOAlpst9s
	GfnNOpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2tX-00000001Qyv-2i0k;
	Sun, 26 Jul 2026 17:44:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo2tS-00000001Qvl-0VhJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 17:44:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6xni1090687
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=; b=kLqXBKXnn2+ou4ss
	MpFEW4ut119gpthBedri4Wil63UmJ8FLNYkj/v6HgfVjhb8veTqbFHsqvRjbVsNo
	anv5TDcEd4Tb3S1A+qn51LS5lOAuRVlZkMnWltAH3YkTJ730orNWbpFyyIaWyQJs
	4ZxFyxL6LRMiuvG8RFIIutJTr2O9BU1HiDRG9AVE5lzUxf9zbLSgOFai5eW4rFK1
	uOoTWLeTu0z+U5E5l8YjLMx0OUyrm8B/hYw7hW0lYXep6q5fC05XtudDJs+owh8v
	RMtNmrqoED0HAINFKoB5DGj+jFbAGtSehdcedRjPXxUNkDcJO1pGl/tys9y/U27C
	1EceBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7ud99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 17:44:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so25689671cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 10:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087844; x=1785692644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=;
        b=GDVzSVVN8b3PmQJ2xeMgjOSedGu2cA21CV4dZb3Z0gtkgPjBBDhJNR9KyOS+TeIFfA
         0QaDDb+CPL3IqjJOUFMJuR0fuuGim9THN5FF4PiFXtyuZKngVR1Vo3Srx/EN3v3aGmOt
         aIfGyRGgiJj0+jQlMFASkGWSIqQqEZlX9QxlSur/2/cjJIWN2EVbctK1MsgAlqjgzLly
         qEKWRtqs7Jq6phZt3Jqy83NsbWkNWEMuuJejZFn26D0ljpXO+7FfS/bc8hdYcH+xtm8/
         w//jfDKF+mXfr5a0QUBhN1k7BLZxXs4Zv1UCWQquvLqovRSVhZpyS4BiXuydK+HswcG6
         zEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087844; x=1785692644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1sxayQIzF8Lwn+Pv055071yJYq6M5XmnU37zTzeh50=;
        b=DvuUcpvybFZdebBz0st6rPhmFy468gmBc4pmxtRK+4x9iE3n3U8eFBeiEderOQCD0d
         Z4PuIJOM5d1JLUJRzE7yg7MXgowz8DcbMLdrq6TtRCpYHw1oTPWxEYF8peH6KXiGgQTl
         yHGOU9c4rrvzVn1aOpGc40sJpNlrRe1/lK9yPoT9TLM1CcgxKK1dXZxvn8jm6c3cUS3E
         NCB+362nG6/yeMporl9T4P5WRlgT1spd/OlBvTp1A43eYFdqkq2GavJihBy4PRxDFeZP
         m8tkphTGRmYGzWBPwVhkoSIMjo4+fshHY4gnw7r77ElgkHf8/EPvuLAd6dOmNDx7k6HJ
         7lEw==
X-Gm-Message-State: AOJu0YxdPmDcAMUalIDXJiE1jSWnx5TB1Yf7idRoT/YT6q8xsjtH2tYF
	1BaJZWl64mVLRNe7Y6NRBtT7fA7/CMeIut6aYkKItTujiFqRcdp098R7N+k5B6qiEDZIdVFAXNv
	gKSXdn+oWKGU/C+dFkVqSg1Bo85xryrtCvE11xoSlNqT14rXvQa0OBQJPrt44xMRWg8LtH9cjZN
	IIEA==
X-Gm-Gg: AR+sD101dfhlsoT+oYADujAiTv6gUelDPEBH2lQHS67OyuKJ+ljE6OpDqBzkEO0um04
	HNw/9RhC4aveBnnt0aPqa5dnJsa757l/KsHcbw3Dj4/hPkVfZQeDsC4oO9yB7yu5LbdpjXJ+Irp
	niL4raNxbfa4ocTrWhmoclGoUxjN5YkYtGYHk3a4ZzdkfLgjUjP5NPCCPjI9PCTUxIICm2mErzU
	Vn1suqJ/R+Sy7/zLkgPX4qrEjqxlR5Ma7lx0h6+qBpcHva2GbONtpDhZw+YNYLNAfAncYt+k3RV
	RQTeduFHd9e82419fBm2Jxgb2eGBxu5cdoTY1G/VRP0oUFdm/Yzw0/VWB4kRQgSqrGTehHaHKN0
	TKSWfy2UgmghZb4nBqKUDDGF8
X-Received: by 2002:ac8:5e52:0:b0:51a:8c9b:649d with SMTP id d75a77b69052e-529a86be9d0mr62633941cf.65.1785087844509;
        Sun, 26 Jul 2026 10:44:04 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:51a:8c9b:649d with SMTP id d75a77b69052e-529a86be9d0mr62633601cf.65.1785087844051;
        Sun, 26 Jul 2026 10:44:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:44:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:39 +0200
Subject: [PATCH 6/8] arm64: dts: google: Align continued properties and add
 missing blank lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-6-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=81h/NpUY+BAhMT5VzRUpG+usgEMwA+SqQU5HHEqWTV0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdNe3cbFFnuh9igHgMRwU8Ngk7wB+urqIPjd
 mIyohZOq66JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHTQAKCRDBN2bmhouD
 1+aiD/9Tg/88WLCYO9A7ibUJm0PLjbDYxkvxurEbuAFIbh3DpgIGFHKG3G8ZXtdU+338g6lkkaI
 NQWxiRtqwjpY8t2VnBNIob85dDh5+zAasCnkcfm97U2uwNSMRs1lKissKQzQVuM3/bOa4nlAO0Z
 2d7nU/KXqre0MvJQv8gLcyNpI5KFKONXEzd5S6D0vWSHQ4WZx6jaDLqlfvI/661HPTnoZ0QELuA
 Brh+TDkftis177bQeU8UyeV+F/vTcPV1rhtCz1L82/WNheyCOaDllhNOmuxC39Qr0p6AOVxatEu
 /5yZbAjC7FRAhLbNOhJVEu2IAmfzg6DMLaoYHFgMNefdFMnviw/CCLq1Kc8uNRWGN7/2k9F7P0v
 SL67GIN293GCbOIK2jAQXYljh0pRlE9v2skv4MdSkyaHUTGp1eZVITMsKP+lGwgJlWjHbPFSCGB
 /Ge2b9IvFxL+bjMtf2bKxpDkbPV5vQSUY9uWLAarChbhHpyuOJcxo5BmyuxwnMDm7UIF13FAtcS
 uPeVjnI6hWXy3nPFAvRHsoeZQlz/NM6x+Ve42QDXjIMqns5Rk+q49QjaCw9Brdgv0jYX3nlrk44
 vAw+OgXpWNd7dgVf+kmRNUaJ4VXjrHP72O7KREcLuAiqx/AXmukRI4QRzLwQP80pfw/zUxh+Boj
 ahqjD0hwRxBIJUA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: KWD-4HoplNcri0Zd6W9_xRVdFibKT2Xs
X-Proofpoint-GUID: KWD-4HoplNcri0Zd6W9_xRVdFibKT2Xs
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a664765 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JN4siRDuy4uOFAZNwAMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX8jtwgbVYLVi7
 YMUNU1g5roauvS0O6mIJ4EjyQvB0fn2mRfXUmigkcUbTrviUBcFBTRlsstfM+WwbdwduSEHWnNT
 AJUlBcEkLK1B5M+GtY1yPM9u2svwC+vCXAYdV5KLkaGDabYxOrlFFwLRjURtQmCw2paoAe1PjxK
 38uS4yvpi3tTfQx4N9X45rSOPcCG2BnW+KpEBiqePwRCDjQ+W6AkMA+eelhq6mHwxfPxUJ8c+/0
 8u2hNR06y1x5E7wn6oNG3kxt2phkJy+1V+yIyr/obOVtcbPenp+0+qmxOGgJ4H6EJQDIBUh8uhh
 hE573gSi5wprjZ7PeUfjRl/UqXM8fufScUYfg/4wO0KBIJhKp86MY1PYqpXbwxi7MLeUsgZX2QE
 Crab7nIFsiEJdYYjyO+21zNWnV2W2U5dTvJGuvMbaCUi4q7oxR4Ug60kMMrQ2jeU4Yu6dflHKMK
 9FX65MRrbjxQ0zqpj5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX43yUdy1augbc
 mcEPTzkMkc9/aWkPXTquQYQARD7vgP+IvjZWk7cSxGAKeDNU5Maj7DfjxIqoDmNjyXqR/kWJWra
 EqVQ5FrJpjN0qgdWnnLHEMkao8kDcEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_104406_285658_91C9380D 
X-CRM114-Status: GOOD (  12.94  )
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

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index edc38f2d1183..bfceea5486f4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -39,12 +39,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpu0>;
 				};
+
 				core1 {
 					cpu = <&cpu1>;
 				};
+
 				core2 {
 					cpu = <&cpu2>;
 				};
+
 				core3 {
 					cpu = <&cpu3>;
 				};
@@ -54,6 +57,7 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
@@ -63,6 +67,7 @@ cluster2 {
 				core0 {
 					cpu = <&cpu6>;
 				};
+
 				core1 {
 					cpu = <&cpu7>;
 				};
@@ -1681,9 +1686,9 @@ usbdrd31: usb@11110000 {
 			compatible = "google,gs101-dwusb3";
 			ranges = <0x0 0x11110000 0x10000>;
 			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_CLK_EARLY>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_ACLK>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_PCLK>;
+				 <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_ACLK>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_PCLK>;
 			clock-names = "bus_early", "susp_clk", "link_aclk", "link_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.53.0


