Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC3DCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=; b=wmwF/CJDYa4uNE3ErMeuZGHHc9
	FOwbviX8lln8BQtCkUJAAk8K71nY1ls1Gp3eEOdJQjsteraLr5q2jUQRmX3RzLV/D3Kgj/2ldjcpY
	jR36Go/dFxcSCz37Xyg+ntXVB3xuYs1PttgtcSOIZcED9vPUkvBeGMM4pK28vGiwg6Sxec//7Fgif
	nWV9PLZdRvs0K2R7LPJatFVg6eSXdQwYcOJkQOlFTOLDfH3Kkkloycn3r6Gg0hfEgGgJ674vtIv1z
	Za0SGT3IjgBUmyFk6egA6XiwA00M9CdbUJdE5jrJTYJyNEPNlNX6WU09wVxEmDH3Lw4shReqEDSyU
	sMwXsTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ3E-0000000EusV-0yFI;
	Mon, 11 May 2026 22:24:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ3A-0000000EupH-3cES
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:24:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK70sN2804455
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=; b=ZC/G7PteSvshWYCT
	9Gwui2laiuBm9kj/hxGxf0eIf9fBSDWUxRdNVW8o8iQdm2xptrgwbqmGyjFXV7sz
	2rAKbMI0yuhUcuWWjdHZkj1aCEC+MbP2wg0vBU//sD2XLss0pUYatEvYE6ThAHvb
	oo7R6TLFSPicTu2u4au4A/M+YAfdx6ahgcWIGZJufATwrp1LRJgsnk1YyBfVUR1T
	mw1EYv5f7wsHQVIAFww+tFdPDfkg27E6Zx1og0xYCBQ23ajaHWtVDUDK4vwxQTuC
	UhkJTt1KVYtIyi8fwV1+sUkgj9jXCVd/zqbXQzzWbx5gpyigYPwrAjnVlEBlHSEp
	xCKxsQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv38g8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8354503d9acso5833144b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 15:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538271; x=1779143071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=;
        b=HlosDloXwUTb13mwRhNAy8EMuI7e9zN9C2hg5Txhxv3fYTZbr+T9KoIQLvX97Do49S
         h1TgHEBx4jywEV4/j19SB2FeSQgGgrResHngeKhuzDPzAKo/AKbSFtPD61tWepsFsYL0
         CgxLbHrmDet8tE9pQ/mddlY/cUHqc3O3ZqZ1USSLeWseoigwi8D3y2/+UDVCeh4HyL58
         cRVuFxDwfyhFOmxOMQa/zTUp+LO9sq1+yZfPLTa+qyjFA5/qT6h+r/9K4JMi05KlPJbp
         45CWE1X7JzJ2iM8Q9MPpEDSdutaJBXoI1b1qBGhL8jMCha6g0zNkmyQyrmr+3OUUOQuc
         RLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538271; x=1779143071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=;
        b=dvHk833OZJlW7+wbmmx0SkLSlAABHds3wHkAllCTzVxbx/WFCqNHJATcR0bWcpADLB
         pTNEWpezSMMetlN7aWBEhIoelMNJHAbSwfMF2vSJHGIKyNzm3XlbxuLUbR2oqPqWVsKH
         +kOWnBuXXq9GnU/QMyuZ3StAkGz3eT7wKOP/EKAypOpUNvr0dT2x5qr1q5/ePikCe3pg
         gBiBtktdwuRYPB1dGDXO5274Wn3qgEKBmQZ9R5lNMykrIV5SVtclkeXbJiEi6lFJnZ0Y
         b/WNycI9o8NF/vk0nnTwtel31JB85YE+InvCdl6gEu2+mGp+aWJkHuepO1WLoZKnvanY
         u5fQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KjFvi3l3u7HTA0T++7nt1f6RGK4K7uKimo+bgLKDekfc9kqkpSJWQAP2vkLD7mRyRSfdyo/7KevUW0VVKYxYK@lists.infradead.org
X-Gm-Message-State: AOJu0YyWaDOYy8//7A6235Riw3WX5P+iY9XJ8uMNoBhJr005DheTQfU3
	Du2i4IfYsAvUJQztCe4nbSNbVOJQzg5b8y4bkcFKIMtiMV2TTz8klIGB4iLMAkl972Tsm7Xq8Du
	mDsgON2deAKXKHNrF+PUVaji7G/bnLbDDSFAJPzErFM93xXy6XTfBsD75YF0YaoVsJviwygDv+Q
	5nDA==
X-Gm-Gg: Acq92OEFt/vx4jm1zf+F52aKnEJZUCrURIaRb6cQUT4DQkTtp0ZhHfcB61T+Ohzc0Yq
	c7b+0m0AQauFQzLEn6LFoLg9MirPx3nNL6VyP++X/pvCY/tDYrkEmi7fMTtIFo0/GoI+zs1olPW
	aQUPTljT+Y/nha7ZA0LkSmF6gqSlEHBaCVtyFWfqn/2JzCTfGjmMENT9ABchGPLgocSuqjRfAgW
	EcLS71ntbOzjl9SBTmmi8d0P+YdJ3Lt+a9tnsq5+AFgKOqddt48DBdH07JeEGFlL0MRafH3bVEm
	QYv/S8f7LDhUXwspbxpNy13ZFhTJMm+/b575d3EcArdEK8hJybm4bs2sUlrRuYKJ3CIiKpw2q+X
	eX2lUjqd8Mtn0GG6zrmO8JsTSG3nNihe1QmTHvSfxwsMSWQ==
X-Received: by 2002:a05:6a00:35c3:b0:838:127d:a161 with SMTP id d2e1a72fcca58-83eebb5f055mr337127b3a.18.1778538270725;
        Mon, 11 May 2026 15:24:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:35c3:b0:838:127d:a161 with SMTP id d2e1a72fcca58-83eebb5f055mr337094b3a.18.1778538270230;
        Mon, 11 May 2026 15:24:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:21 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=783;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=iDb2uz96prvOPreAW7V7qXKBMuEzgLkBJlRJSuUvUNE=;
 b=4L1Wf2OEP3HGXs8rkRNKP6ek9eUFrozE8QJtVasyeMz6R2v98M71tEUIV3XtOxqXKwovkzpPV
 E/IxoUX+YlzD2Rsmsy46DBTmOK2mKwzeMLD8gf2BtnmIQ/LQd2gkE6P
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX3FzRQBFDdnqL
 X6p2FP0S+7zV8pj12yiqSMZcXlre7sJny9W2mlyzoW2QsLoLVfdJt6Sm02JLTzF7zaeU4hrkxfb
 hikpcZm13Cdr4aXrI+xKWlb+sRcUO/v3qcOmYts6GYM3GZHGxpuN2uv9FpyjrMTbjb4lMQExlt8
 fz4SQXwBUFBGg8H3Vbscbls73cnAF56tzgx69ASyig8oLC1iUruGFud0piQVMl86G9XwBkzyl5o
 4pt+vzhX5zvX0wLuGSO7NkDepXUvktLwQ8Uqx7CenvfQZurSpq9XcsGpHEZaqm5K1bq9RZWHigd
 2zWvURWUpg16sYI8l4icrYn7ad22gNN3JJ+v2JLxAQ8+Vr7UiNb7Zg17J3GwYKeCc+zRXE/KgmD
 WaDofC4gZazbyLxIYXQOb0EdOr+02lcJ2Ch3YdpY1CEwbEqOdHb42fsGDfBjvToxsbH3PqRfXyo
 xyrFgziKt6TquGHsujQ==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a02571f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VHn1p_zO8-rooJRYzQAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: kz_3BNyupy9Y5IyacucEKqVkHA5FNU5f
X-Proofpoint-GUID: kz_3BNyupy9Y5IyacucEKqVkHA5FNU5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_152433_023512_4F27E597 
X-CRM114-Status: GOOD (  12.51  )
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

Add the secure firmware name property and enable GPU support on
Kaanapali MTP device.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..ba256039dd3c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -865,6 +865,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.51.0


