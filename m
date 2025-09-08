Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2051FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZ0QPfKd6cfV3/gEri9raDeCAG7QUBZRVXE50fhUyeA=; b=OOM9uPhcNas1nLuPixp/tgsofX
	FdsTAV4D5KOyYZ9Vr1UlaSbGisVi9MZrQb8tyth+6bDRzb19CIldsLSljq001uWZZ94W1kq6r/ycG
	nHFz/ZZ+r+DJisPuFjb19jrY63PVo3k5y6pKqDWmmBLFvywrxNYSaq66jAPHVtvL5jDFbfIpoZRse
	YugoNMcGz9APwOiWoSqSiFsLPsVMo/md+IYYgaKm1up3kqF27t4aZx5FaBl9vgm3pz3ShQOaZ6iWe
	EM0ljTVIbm2T9vJabnLFk0Oxr4TsdA0YVy4I7pDFzvlmt9zip4/xr4LCCrLrDSMoOvqr1hw6toBRk
	eRcUz09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRfF-0000000E1ne-0lru;
	Mon, 08 Sep 2025 02:31:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRDs-0000000DuzE-0n10
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:03:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Je1KD009012
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 02:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZ0QPfKd6cfV3/gEri9raDeCAG7QUBZRVXE50fhUyeA=; b=YKnBgkfYRXGN832H
	az1L/4lkc9FISmLeT9cMttu7QGMCqPuyDwYPXMOYdo3D16SWc1B7AzUdtTe56PfJ
	GX4vNvw9tnqnUOVaGUNZ6Q2RUkSeX6g6y2IkhvdafxbenJOGyPpZPaOs0dn8kE9h
	4xxxrQUBHF4EJY+nAry/mYjwTKmoMTZOIxnVnW0jqKU2nR34bFnPdXuSQ1XAt4BQ
	KQl4P5k6IhDVydYA4ffiXj3cDKc+H4o5JoSP/XcmBRYPEw0ZHJJX/b+5gv2OwRub
	I5uMZ51v5psuaefB5e5MXqNGh6jiqbY/2BDstwCw6cOK4phwQBUjxZbvUQvEZqAf
	RKMCsQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a2ttk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 02:03:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77250c660d3so3615664b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 19:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296991; x=1757901791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ0QPfKd6cfV3/gEri9raDeCAG7QUBZRVXE50fhUyeA=;
        b=M7vRnR7qqx+pFO5gVDj9Py0dvZSNWz0EXPOjcOQevnKwZtg67+Nff4j5h3YAuxj5Rf
         H+OftyPzlkW9uFw2s3i82r4AlXWumW1qZnFdG/r1Wig1cUjjIxRQCe538Ecv/RCiOYDE
         oikLB9KOEZGXw9bdN5Op9bmm8WccVF/3Rp6FkX9BBcB4FH73unft5pdfYr7CytzvHES3
         u8bL4SD5YoJkHahXP5C8F9AiOhNgvsVCb8+4vJ8j4xD3iGVIyX/I1SRtlFZ6VTJnZm/6
         j0BgyFx3Shzl8Biks+sIW3HPznUBfuxzNuBVfvkkjTC2+CQ0F88ns3UkZyydkk9A8TqD
         vxEw==
X-Forwarded-Encrypted: i=1; AJvYcCWQnC/2I0cU3gcrvKDl5QfdimQgxbeEnUDB//PZEcnK7qC+BuNRCyTsnSFNZr3MV0CUz64dcRJUAYVxqQljVnCb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1n6SEYey11z22UYXuPQMsAq83X6w46mpAZLWpoT4snMJIk8sA
	i9YilioAAJnYUkJo8e2gPVVLi8h8lqYGkF1bI3FE8hsn7CHZdHFE4fhzln15lL915uPT03uwyuD
	kmN5E0InI1j8dWpj+ZuAquMXxhvvTfotP5NtmnceuyDJecdsW/5iI23BYZDjlqi3ysUqG28/FXK
	lFtQ==
X-Gm-Gg: ASbGnctUJW4/qxotqwD4wGqCigNxvy58da8jLk+oGtHczsUeJgYxZMBK9HcDgg78Xgm
	io5/zPaEl14tyfb7eeNQoQ/8wpKnYwhI8Tt2GA69/5eef886A903U9vKXUWv8VDDXwadTZ9ZdUA
	u6KGQfvaa6COZxH2CVbeAQQ+gVAuBiF5vlPdfvhNGeGvJLxMFr4Zc731e3gGsk9iBpcMsK6qq3B
	msQLjVH7mzFq9o6r5XCvWXwAZ94/ls3meR15gqfxQHaGSIjSFFuglK3ysZmsuBL4scVTRjzl2zs
	RWpQve7DFXgEMk0p9R4fzvH/w9AaFKi5HdnfN9rX/uNg+KTqw8fIEyt2qn5BipIyLkLN5Q+5/vn
	iszbE39nGs4L/OwezBRnYEocQX7U=
X-Received: by 2002:a05:6a00:9a4:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-7742dede382mr8601122b3a.32.1757296990884;
        Sun, 07 Sep 2025 19:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOs9jKUV6cIHNdp2p0J8iG1tJf8wBzxm8yWSXKthNym9v8Uth94m5iXHGoZZxFhI1pYHN9pQ==
X-Received: by 2002:a05:6a00:9a4:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-7742dede382mr8601060b3a.32.1757296990322;
        Sun, 07 Sep 2025 19:03:10 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:03:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:02:01 +0800
Subject: [PATCH v6 9/9] arm64: dts: qcom: lemans: Add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-9-1db9e621441a@oss.qualcomm.com>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296941; l=820;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=9cRSlY2NurvnURIS4RORNBk1ASEWuw2jDevqbo6Yazw=;
 b=tbAut7V9y1GHLMtaEckyjFizzcfbfFKrXsRyaR051mOcnrkay17afbh0raaPOgNxvrZC7TC5b
 9r6YmIT3PiPC0Q2P2HRKUC5MJekXUJa6Xeq74ntPUsDPgLOyqJilyBz
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68be395f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: uH4EM9kJjMIRw-tlmywod7826T8qqJz9
X-Proofpoint-ORIG-GUID: uH4EM9kJjMIRw-tlmywod7826T8qqJz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXw6RGWwiJisF1
 Wag8CH3GuX+PjZ1GXc5IT41KIKtTAjCX6XlqHcMB2fAhOAaeqtPEUpGyWKVQxu9GNY8zyKmA/p4
 j9dhRjRHDrV5D9ovlKSnnZA1/IkqYyypNyOcOHQb9BiwqYwOLhZNE1W1ZGygBwmYi3GtALdJ51u
 Nv4eHNKp0YhHWiI/1x/T9kd4m4K70KyTDB+3Us1bWs1CdeWztNOGTNLj99MoLWr97Efgky+p3Sh
 lGdOjDZe/hK1FAmVn+Ns5Y9qpnUoMyj13QqmbSbzv1xYzWsBCr4YfdjdkL6kvyrFrJseequ7J2j
 SmDRvGrkNw6cqCeIAeacWtyg7Vp1A7KK90XrtzhywvAU6st9v3u3TfDiqKsxcq6HEcObeIHIWQR
 L7XnVjA/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_190312_236538_BFD677E3 
X-CRM114-Status: GOOD (  12.84  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f5ec60086d60..0a17a26f85a5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2774,6 +2774,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


