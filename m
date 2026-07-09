Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD28C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=; b=T09X53HR4A151PNpR6Ww/8J1Q+
	eACLMHyL2ayoeHzaULnwMyqCvYU2Ui0bnKyd8fZbEpe3syscKKOMrsM8BoTNP7bGjlu3nTt9SmeGr
	BelPEPZjxNkyyK+OMe9c3V8PELGcYdPvs0K4VLIHbCr/XvGagv7+mHa5v6f7JppLl59mVUaekg/i3
	AL9Cfkp55WcB9B9KOCXdCjnxLmpmEBrdE8v8yyExo8keGS5c/KKZPx83f7mCP8jw6S0rlvY9T7+RH
	zi+nef+9xb3fLTohLbUvDo/r+T7NwlGWag/gW2LaK0mErXL10Ag6GHqTrytGybEzQvuyI+8HijWL/
	WxdXYVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtic-00000003IQj-2roQ;
	Thu, 09 Jul 2026 18:43:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtia-00000003IOy-42av
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:43:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWqr32373963
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 18:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=; b=XrFaRUVXvcGaBNhE
	ipDn5AT4mzKJkmmrNwgSczG9YfhH1HLN3LqbVGfzkoZ4d+ZwQCBxGoqoiFq/8qHt
	LQeFAijKeUWmlUvtdQY844OtLzkeR113+HWzn6J/DkvbdkjV4Wzt9AljQ6uoLrvS
	/z7SYXRzAGTLe71+O2jVCHnKtHXma/1qaJij/1uOa3wOtCKGkq883YeFVm0x+Whu
	HnN80yEmEA1TBY5RL1xnMvuHcoNPyKyfIeFpPwUOUH+/xEE1H74Tl6x6a2Wzv6gl
	JXLe2o9ZvPhGwnGxQ9/dwKR3udYAL7jP/LSWLSWx4hD1y565HjsEsXkKCNuql0IK
	Z6rgdg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5gwm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:43:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so302273a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622608; x=1784227408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=HkDYCu3Wc1Io234ybs4HL4O4DrlfO0u1Ziaqd6KUhqqcBTiZOx5w5+wy22oqJMOkWB
         o+xkHtLvKvQe2iJVO3U9Piukzp9X6YUu7ZY/iNCBoP9qC3fHOZ4/7bwuwZW77gWOk6/s
         sZFkf2DyppO90fh/KMTUEqfyGRZO+Mt1wxo7zlE/jmme//1/MNi4t/tqijAVeYtleGlh
         vCk2oMN0rRXsEJkA2FRNuk5QYx5MG2feSiUXFJsSfVvt2pwW1TVKv+3yh3q5I2mLCHkb
         nLMFwBab2ngNQuU0mmms4ZFp69ww0N2u7gJ0/ihQfqdOIlV98cGoUU2ElAgywMMU8IBk
         VgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622608; x=1784227408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=GP6rXEhOB6CUEYCU8AhpRSysuo+C5XtXhtgyVcmuIIBBvDl/xI83/vijmf3QxUGY2s
         LjvNyIUM1G7Vx/EEV1DRxRvnB2jzMni+WtcpRQY0lLLQoZM7l3aBkqEraLCy8YbEkuh7
         VKFI+iLTb6HUNkFu8w0qbTifm8u0eHvDfMOSfanavD6cWnpeeqHpLuTGnBdzaCM3+MKf
         VGuAHyXpppG8Lq4O82tgDCXn0814i/2fUyOW3Io50nsS8jrnPL/V3ufTym4M9MLh6cuk
         3+F7+K6SJ4nXr2wf9fVow0VoCjLRSPICNOTUm082DYUuxDud1yZPWlwPhnw+/Zes33vM
         Pq4w==
X-Forwarded-Encrypted: i=1; AHgh+RrEMLuzpRsyEFVQin6XzeRMTEB+VzmFp8bvutwOFGcUj7+sN2fPgsFMxtrFDF4vbV84OGFvxszMa5Gly2VEQk4N@lists.infradead.org
X-Gm-Message-State: AOJu0Yx23QAohQvLdGRdS7aiOBe51SFvaepzBBJxeY41xjnVe2C0hScP
	QFwGWfLMdMaFyGYfywQBVMgxocBSQo6zwSihUWiRlHIRSY3x+EgWwqFnGeCMzgjoALXPy9dJWRE
	FZHbmbPW3Ure1ZkIqlhNeyTia/B071uafw6fqlyWUWPQRz56gkTp3WTtO4ZPFOrKPvd4ZuZGJwE
	/YhQ==
X-Gm-Gg: AfdE7cmcj4WXGCYuUyrD8WJ34b03EZSthXgmG8ed0J3oaQQO/0ljX9oSh1rSlh41YBE
	Ocni/4NyR2Mzb6iEyfhWRpbvt/gxNX8zsdudKtsARS4mLG3y93YRAyzsPvLfw0ZHmdzgvVd4Mb/
	+KejTru7kLEYH0TxItYkoImP0DZreo97Mk6utLxgDldWkDBIw1vLG101WFkOJ5osVbsMi0Mp3go
	mNDRrsXneqLBRzBrX/3eXxTxfnZQLqkYYFgFl1mZ5yU4JZVa2OYZadEB5ZjB1oxymDgfhqehD5P
	pxajmxe1nt2rKZZ5lXU+/I1SW+Si1swkHDtF1rb5NHTHNOduGLVwKmBUXd/Y+aYukA9pYh2UY/W
	mWls1Y5/Nu/l5jI8WTyqPCLcRLQ1+n1UH2nA=
X-Received: by 2002:a05:6a21:4902:b0:3c0:b766:750e with SMTP id adf61e73a8af0-3c0bcfea632mr10283299637.25.1783622607987;
        Thu, 09 Jul 2026 11:43:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:4902:b0:3c0:b766:750e with SMTP id adf61e73a8af0-3c0bcfea632mr10283252637.25.1783622607576;
        Thu, 09 Jul 2026 11:43:27 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:06 +0530
Subject: [PATCH v6 7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-7-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=849;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TpvtLBwihWHNEKd1VwQvgAfHhzoeB2GGOqDfiPe0Xho=;
 b=ZIve4DWCl87XBF7AfPHf5g2BJeKum6itVChbN+14NX0yb+c2lSO4GLV80PWdApQDHp0lHww6y
 MmdHRS+rBCEDgn1bSRRYLQshjQmUl8u8iyr/Z7ckKek/8UGqepWFhl2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a4febd0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXwR7nzeBJ3+OI
 Hosu/gh5CV5cEa62DWpigK3g1OKCOu0EIt1FUkqB9Jg/Nubc9sSjTjXTUWhtKAqyWL8iGH74un0
 NwceykxO2ybKj6KJgFimG+gFkhu8ipM=
X-Proofpoint-ORIG-GUID: 2olA2N4CHgWRMsy8K7xNox_U5GcKjbtV
X-Proofpoint-GUID: 2olA2N4CHgWRMsy8K7xNox_U5GcKjbtV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX9DkI/SrLfoyU
 JKBKrtmzijlv/GrvFjNtAHd639PLSJIydw6+aTcyBT9lf8VvLn7yxUenETi1GCt0Ml4Rtk91fH7
 PbiIyQcYczmSQqNmeh/nT6bn/gKUqQl0JUqYQkMcfm5ZzNt81PAIf0/Htyn0lb7/VwQyl+lF88N
 72NavAkGhAttJsxwPxoTHBjFVnX7kbCEjQJ18z3zeLwb2jU15f3YE/4MxhTM+xzF6Ultc0XBqDR
 OEtfa01TMKOtp3Rk6Y8NEvzgwwYN2Uhw4FzpjfIL/y8FJr0HP4qfVS+anWzVksrUNTTE9yoTqaC
 haCmhziLH7ryPkdRFAV23nQIbBYKShube0D4lUlbGF4POtDpXjdg8Lg4hbJ5ZbTJtmTXSzPmNKx
 HUQrGU+PlgZy6ake3F5OF/zj84SozhEzN6UFf1qLN1ozpcxHJQhZziExJjNv7cKKW/EGYJERYEV
 uKtoleNk8adG7piMamQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114329_016239_2452FCB7 
X-CRM114-Status: GOOD (  12.35  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra EVK boards.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 4b7be09eb5a5..9febbf200f10 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -36,6 +36,14 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.54.0


