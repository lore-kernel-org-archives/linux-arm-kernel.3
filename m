Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF61CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=; b=dq12j8e3UesmFY5bBPCKegyln4
	v0gZVZ3J8pBfPMSUO39+8jaLlHGtsi9heLTgH3jEgsUj/nQFQXQ3Tkufe91pqng4rKnagl3nj81Hl
	8duKOI65e1T3mjgn71OIuGtDV9YtL3EbUXcnr+qHTlJXBgfvM+qGnLt6Pn3rqPeO5O/uJwhP94Qn8
	6VW8p1VWRRyJQQGLLUHT5ofCPh3c9BE5J/IF3gnFZ2Si4C4zy40Jh6utXWAvsrGYIfUKOVRsEWLQw
	AMxRcSfLS6V/DP1j6gYQQnKbdMXSPw1VWL8/BSgTyV+v8HvTNZ7xu3bX98tcObkfvFBubqLTSKZPg
	o9qbVaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2o-0000000EuZy-19WS;
	Mon, 11 May 2026 22:24:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2l-0000000EuYW-45Y3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:24:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6RNd1183963
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=; b=CG8l9Pkvro36Dld4
	N/0dSJ66oyZTv3rClHs/r32KRRKZuk1OnZV5ZHWIsV2e/b3h6q7lxjL6QFcSb2qm
	JLNjdXW9dnssebTUeCvUdRH0M1FRxbFNFoE7FuHhfXMlszdbDO4ezcNvt68vJO5u
	bsml0ZEI7vZYmfsumcc7SPdF1h3RmaLR3AXRCNPi6SR4XfaMT7US/n7uyjMTFGOD
	2UgkFS67Xq2iRPlLmZ7rK+5Mcgf6StSyqBMTS2PMfdAOITQjGencCsLYvgcIcPAk
	/b8WyR+gkEmASOkZQkQH7KOlJScJ3NVm5Lpkyj/B3AvwbKMWqG+gcCln5Sq9peEL
	i8fgog==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuy8fm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso3388185b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 15:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538247; x=1779143047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=;
        b=f2V1SOPwKAFcfECWJLHRfwM7OrZHXkzd9W2cogETH0297DurV0218/R3p//Hz+U7Ud
         FSat4yoTij3G2egeYP/goVBrG/oSvGga5bChO4AVD/5jC10JAJ8tt0hCLBaEZGQFi8XQ
         FBRw3eObORAB35BcIkn2MjI9dQmmbjpI/ZUo6o58Y40vTCz3RHLLH025jirw47JSeUYO
         b/AINkLYu4uGRzccehvZy7XDLyY97eJ4k41YL1AUw5GhIr2ByYW+JrecEoyx+9JNiUat
         4+RaMMxEfhrgWDeNUjfX+Zdewqmjd0MbtlVtlSVEtFihOXfI9THK16xoq5kIZApDLCq1
         E9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538247; x=1779143047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=;
        b=WjqlbRc3liduGTXGWjx/8tDYBo0C0eVIjdg8sYLUWd1CFJBl0cdDF96ZZUilvj85Av
         sd7hMyII6X5BFPbtOrS3ysOeHr4c8sJJB89Ejzp6uqsLaEpl2Sr+IJxMCrWBuF8sq1ap
         vN5XlXSJcUM8mCVhepVzT0EK1bGlSTbV/uUy2Epb+WQdOW8qOu37yXJ++mn0amSMstg+
         bIvXnqO8McrtsaOiFqDnYA6wIPh2A+hYZC/zMdDfgVKaPrkqXLfcgkPyiugRzskaRAzs
         PUufdw3R/fcjpC0SRdBICGG01j/4STYIzySlN4bx4OqohmI/K8PxatUmGVAqNSLEJv9d
         Yucg==
X-Forwarded-Encrypted: i=1; AFNElJ9fsfEVsiHQnQJ+BVoA6lJgyrjTvro+Q7GfQqwWnB6Od2tE3GeFHtSyddFH89vSD3YqW4SrleG2L2Qg7wXz9zWn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1T51QFxTuI4w/U5ReNlpE7HYlWpKRXzgRl4mDDzbONLWBg/8v
	Wp7rckqf4IoETFQmZy4xw/sEe7xtnNjAoqS9qQBYH2srN8hVpffWCP8k4il4Nm1ynm7NVcw4MXp
	papSqjTpZBDXQm6FT/MNa8nKRH15uPOIpAqsieAleuXbwYv4t6AxIlKBIcleD9bawjNRS6xRinl
	cCSQ==
X-Gm-Gg: Acq92OHWDh1JXYMh7es6HeUhAIwhciq4Mte4dekpElHIEYWqKmsUh2INIfnyi1MAH7Y
	xuq1RNWM98pwC4hZNI7XaOhBP0jZqKsxEBN9JTZVqcYOFzg0wbs89lRoWHlc3Rp0zuc51ocl8vU
	Vp7UBoO8WFc1eThevc7K0SREWMFhPi/XKwwnL3/FCFXYKKNqEKwoQD68psotaxgtWP+b/IVobeN
	Ow5s3emuRzdomSJ+l07G+rXndRMNXpG44OBH/t4v+jqjVtHhCIjHLNclRCfCff/gRc1/sEirSmQ
	XOblrptZlmTFyprVPBIc0rIUVY/gpYXn5nXVKGHtUZWIf8q0uoybstKSvfgmBVMge32IAU+nAn0
	LuYVngXTgIWmZWRDu00K+TknArAgfAcfjuL8D8OpK4wq96g==
X-Received: by 2002:a05:6a00:a90f:b0:838:af72:fb44 with SMTP id d2e1a72fcca58-83cf4f760e7mr18257624b3a.2.1778538246798;
        Mon, 11 May 2026 15:24:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:a90f:b0:838:af72:fb44 with SMTP id d2e1a72fcca58-83cf4f760e7mr18257605b3a.2.1778538246344;
        Mon, 11 May 2026 15:24:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:18 +0530
Subject: [PATCH 4/8] arm64: dts: qcom: kaanapali: Add qfprom node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=1012;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qA59djGG78P3MNRfB1Y8EMktq/ELkcaIx0EmOPVu47I=;
 b=9OvPBcF1MZb4Ksy60cJdP9QxS6+kk6zi2B0H2ygRxmneK9+uTtViTgI5ljZCjPD/i/sq+fEEV
 0s0G6D2JEOpDKJB6PzrAU5NDlmvdjlzdEQD3pg3eLjw+GXlyZfoTeaD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: FMKtdt-rqK-4VcgzQZ_Fvzbnau5WKJQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX6PWltLaJrkIJ
 zTikbmgooEwsgFQ5y1Wb35B8tbGEvv7t9NLE5Ct9JmZIQRijjgpgucEX0MfJ3yMpHTbNS1kJ10r
 L6SGYxzn8mvxFjUHdArTcvrj4CUwJ+qFrMaHlK0hz8YaDhImL580w2LXX81nf60X3g6hmSlz+A+
 sTmO7htkxv0qPNxoC4tr60rTfhaMJkJzx9PelcL0eKeczmDN1iQAzatmlGN+tye/i+oMTIiCF3C
 BW5sug2XuhxZzxcEE/yYM46nix490D8yJHZmdT66VU2WEtOwCbLb32qP8U+ynKPGm7TAOs7taPm
 +eO93lp/1FzCLvNEGxWbXBWgEWP83WbYJ/BjLBDrk7XtSXbJShb935sZmOlz1tf6GnUbJ7gaVsb
 SG31USLkkfF57xVulGKUKUwFILRuhpm5uFNvk+Yx/mAMxxjar8NWfpxv9f+ISvaSB20445inPsS
 EvDw4p609AhhDJK+ePg==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a025707 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: FMKtdt-rqK-4VcgzQZ_Fvzbnau5WKJQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_152408_033615_A66C7FC0 
X-CRM114-Status: GOOD (  13.25  )
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

From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Add the qfprom node and gpu related subnodes on Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 26a4de9c8d45..0211fc9f8c88 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5868,6 +5868,18 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		efuse@221c8000 {
+			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
+			reg = <0x0 0x221c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@142 {
+				reg = <0x142 0x2>;
+				bits = <3 9>;
+			};
+		};
+
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.51.0


