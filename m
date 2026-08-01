Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15813C55178
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=; b=OhmnJl4t/2kkXof5Nk/CiecxxV
	UdHD5wimuLrbp14w7Ixdtp1Jdwbg7xkkSQWFDwy1qvQpimwwTgaMRKDR35Srdau9Bb6MfXWiJaVi2
	GPdoQZyX1J6T5LQPl8bN9AvMIguxWnfqXa5h+xJeYzFHP0uMInxn6hUjAtUYjgfDFYcrGAqrutYlL
	b83v4ZCT1GcqP4YgY9ldej0tKmYdYsIQtga8kqn6zl6ydBtqXf4RpZCyeB18KVudHYuvzI7bcFi3b
	1AeG8d+8Je1BxEWw2yQzNeAd+zKnf+cKHqYafzFlYuyOeq99RnpPE4kgE0sHP830YhovpVxPbaJuR
	/rLNR99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJE-0000000EmHw-1f3w;
	Sat, 01 Aug 2026 15:07:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBJ8-0000000EmCr-2b2Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:07:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaeRk2394387
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 15:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=; b=Csonw4ewY/uJFqWj
	8F2diPNbi83FrFu1TestrQXTznkVKcoJzo5uWbP7NVQK22JvXM1np3eAsL1NT3Il
	63ca5Vobut4E/2/4EM7yK6z3jpR9oZmIHwkuOyvTX2rf6d8ea31Onj0p5qxgVv08
	DPWhSbpffdBX7k02P/XjUhBBCuRlAzDfvoQlwVuqLwXT8n04dEq7+w29HmxvPJbV
	Z2drdPcjX4/K0YW6JGjnkM9FfTH38ttdMOSRv5kCkC2XGDi5Prbwq05rpxCsBnQQ
	8Ftm+fEVxJ96JCeoInklO8qxmG0fe5UNNKaMsvu/PSPe3PzYJ5MXUJfw1UlTgvA/
	w2AVoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yggxpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 15:07:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso34182731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596845; x=1786201645; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=;
        b=kAodZzOJ8iDGaef5zHhCUk9qIRnWxTawkTJMzE5AT5QLTs2QGvhEVUssZN7wFznGgG
         dBH3r+TXvm2nunfE6PkYQdr8efOVx8bk+ek0Nb0GAJ6GRwqmnhsheRiLxt+O/VbnoVgH
         bcwFPJxtDHCPShI6gAJQzWOktYw57xaN3+R9WTdJXXHEudDSxq4qT3VNfU/gRgZA8x1r
         b3eIaCkdaNAwuDUl1k3jGviBAwLLXzqOD4w+jmdu/zHpS56ikThf20kRqzUwc7vc01gy
         h76PgAptUYkjgmg1NDzFLWJy7EHAjCxZoWw7RYOTonBu0Mfmn4fuzclOU0iRW4AuZs7p
         VvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596845; x=1786201645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=;
        b=PbEOcdcWd7pidC25f0O9zdEz+ovvShPK0i40f/bYzPMsA8NvrLMoo1YFI8nuw7LHjO
         X38/pled6k8/K5zFF33VgNAadbYbfa8iXNN7y4HHoQQyYecQh3aUl6TNuq/rtCdYOqdA
         TOp/07LcmNgZPcBnVnRTMpNwdJJmzOnAzjjAJAsscAV3X0vzTDYZR64lzMjgqT3+o547
         2QhVG8CaawxopyffzPYEgo8ZIYGXFsfbAZu+eRXdN/BnJYFd6CWCl2Rug3e7FzyOo9Gd
         Z5HGkoIVOHwe4H6C51j0YqCF0cuByTdt9RHwPfSxFUPudcEeiR7gqAb26BVzG9USci5U
         gokA==
X-Gm-Message-State: AOJu0Yw88C8eCGZC4U8PHIxehChe810YfUGZeMEkKjPpVCrQAAXZptT/
	O+9Ku181Y8mZrTLSkZqTenPM5ku2lUJLlPQXer3QJ8k9Dcagt1er4mZWPnV4DboLj0ItzGhXHnE
	eTjxdvNMKw8Ow5FgPcDx23Lsfew8Hbin5fkeschyvRLsr1CosiEDL8SKreCy98QJv2f4KeP2d79
	Un7Q==
X-Gm-Gg: AR+sD13iFh8dAh1dT1hj6TgiSA4CllYeYbuO8hYYAhKWN40HLwTqgbM/Gc+bE4OfHaT
	Tj14QK97D4JpcUyaNPeoJJBFan261K01PugfnMGsEs2xkapK1F+kcAYKO1eV4bYAzoF6wVPgFWG
	TdcXd9HzLJiN/8PMl1vxeF6sFIbHfGpq623OKaatIVCrDuI4CpXni0gnZ3CzKg+nXTvgHE1ZoFH
	+3UN8K7Rr5wHPd4inBEwB95MUxbxxSPoH0Mrar4q0DSxp4mudKQiCc4iqZM2P7lal+YI19xLyEH
	HhqLtKuhNrsSE0QzRJWr6CqGg81uwQF+ZUiEB5BKo9wdg2IQRWAEFYLeFzJ4EB+hwGUXi1cJvmA
	gVoBjUs/LmEuC7cdc5UqbK97/
X-Received: by 2002:a05:622a:5585:b0:517:58f6:29c3 with SMTP id d75a77b69052e-52b56791b19mr90549261cf.32.1785596845172;
        Sat, 01 Aug 2026 08:07:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5585:b0:517:58f6:29c3 with SMTP id d75a77b69052e-52b56791b19mr90548671cf.32.1785596844783;
        Sat, 01 Aug 2026 08:07:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:07:01 +0200
Subject: [PATCH v2 6/8] arm64: dts: google: Align continued properties and
 add missing blank lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-6-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tvFHESM367aZbumd1u+4624Oo3B8rwZfoF4ToBWH/7k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguaDdezS54sRaZP1iIZJSPoM+6OvHd7DGHhj
 0S3Y+q8P6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LmgAKCRDBN2bmhouD
 11IsD/wPwLlkbos5Ms6qZ+lSZdATPFCZrjyXfx8e72rwLVy0Q8l7tmB979Q8mvzSNLu7YJNzKtI
 29tG5bzpYE8CL+IIDpXkUKWZrV7Rk8czYpkPTxGmQplMqhJxR77kivbWYE+Xsvtl6ETth20hb+9
 60GVI6yVYRjIPBosX5GZGY3oAHAND1mKZNVVVrUo0WT/a9n0zLsDRXXcL/dI7uML6cm6fP2Ek2N
 qNVvEesJZBOV3UgxGryVtmf3+OVio7Ro67H4N6fwu8y9Zqcgan2azQIevUR10NcBVuLCChOTFGs
 goISA080JIsiif9cJtzrNZue572TtAw0fZQA2ufPEEpf5vHyOG1uPGqfZ1njLL/PrACU8+GON0K
 mQXrdzjpJimgnqXCBzfxUQqsDVY/wStPIx1O3TIBoeMUPUvt//iWFaXsF7LKYKhKijHfB9G+3wd
 Of3QeheLlldOKNY5fA6ZlJdBV5wMEprAa2bw9GEJi8E0U/u2NyUA8OxToWLXpwNhdEcrQAXrLWB
 prZvMCEQLCjWOWMTj5WlENRhIjG6lV41UxDWp+8JW3IELFfPOaRJQuB7e5eUaRGvA7YzblBlSjp
 mpE/atyKlYOaggQuJZ7vOeX1JLLcE+PvdfbVwR2K6mRiQ/CyHXeAhVkCRRjHgxAKOoM2zHZE8xz
 eZ9d1O3gh1+JNDQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX27dBfbTSi87r
 qMxh8IXo7dNnOmO03UgizrdbUy2YtkAb/PWIk5Ey/rgb0F8qPSKaIiOFi6zO7maIFLHQwIPdIOG
 PBV8LtuW4yMgXRnQQBc3EoWhfEyvQ9M=
X-Proofpoint-GUID: vmB228oCpOr3nJXY19Rl9IFUnTTQ66Kp
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6e0bae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JN4siRDuy4uOFAZNwAMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vmB228oCpOr3nJXY19Rl9IFUnTTQ66Kp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX5fsZ7VZEFE0U
 uLQJyXVE7SSfSySytuPa5+hB04l71CFihXJukYE8ibXLy1AVPJslpdEag3EIdo1XTwXJy14rds+
 kZKvCVtpJhaF1yOQrT6G0QRJczBk9ZkhkIQ8HDXEDYY/tNhP+Qof0GVdR52cEgfs1KNi4+LzWOQ
 pl7HfWrD0UqoCaNGO1oeaABMKlPHJGVd/Wk8Ve1zP8YrxK4pZdZn6l3lO/QrXrU8xM6ZWYKpg1N
 RuOHydDbF0LVYWAKKoYxqq+nh14TiGb3HESzuxZhENekUIQV65jd/XkDEugq273E9Q+7hZ9Ohzv
 WWnyknX7dtVZAQYftKa312fiKD2hNgEtg+uBps+pbGOhv2IaOTOEOINJDSD2LbYpwmdqd8lMwxb
 inI3RGGw54npQgxdtW1fiG74FnEl5SjOyA2czIZASDdGBksszDabzQBJRJ9U/S8l0gdPDJRcXBL
 BOn41gJZw9cAsldCdIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_080726_681621_E808C8A0 
X-CRM114-Status: GOOD (  12.93  )
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

Reviewed-by: André Draszik <andre.draszik@linaro.org>
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


