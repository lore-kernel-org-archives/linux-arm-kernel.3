Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B105C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dtqbcPgqz2zJYzOOCZPN2LLL9rO3nXwWq5S6LuNoqs=; b=Hx1qEKA7au8+ghFAFkbTcB1x4Z
	479/HuKgszQOCkP6DNghY/NU6H6uVntThDniGk//CsriKe3U8CsmJl7Hbw+MLEEwarf75PyrVwTah
	Cly9eDdqrfe+Bryi+c8yQG3ODTu6Yi9AYjWqwqdM+FgYSOPHC61mAqNfLSSo0U4qxCf5ET9+cb1yY
	lNOi6Kvg5OAJ6VAIlNQR6Cw2KdDpgd/J+spEMOSapTw/ztj/U5ybMh4UV+cz4EeKhrnsuAh4QbIeA
	/Z4JNCSaStEmhgvlmlgmjQ+d6kPwRvoi6fZeHFbEGui/IBQtBB9WsEWgHNGKuwSzRyHIQZIuriDym
	KliomSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gzC-0000000FbmA-2wlT;
	Fri, 18 Apr 2025 08:22:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gUF-0000000FWGS-3Sw8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:50:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1lLob015328
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dtqbcPgqz2zJYzOOCZPN2LLL9rO3nXwWq5S6LuNoqs=; b=iYKPR/exe+ut/Mpr
	eS4JIZIi01DhpzQ3ga6kufc2EGvbOECQ+fEA3ZPnQ8TvRYIuvTIWHp+fDAaJXUb0
	WtwIMw1IEfbrPqym6qZMxtAlH5Z69H7+6g1Z4+6zDHAVBvJRu6GKjAeJg4+whvdw
	xjz39rBVFghOnlrMLH0mgt8szvKijbFOQ5EJp6ME785yIMwNT2tHU+ZlXpKvmt/I
	tavY78yIOPYjRVx2aDvxq+PChZOPOHDK7foWqrsz0X+Mxyx7H3qVbMNtOlL4SvPa
	hyYFGm2do1734sEWFJyWGCbvbcT2g7Yn5L4AyACq2AuTTFduoOo1cHoFj+it7Ngi
	AHap1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6seya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e916df0d5dso28490096d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962610; x=1745567410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dtqbcPgqz2zJYzOOCZPN2LLL9rO3nXwWq5S6LuNoqs=;
        b=hAz6DFpQDWsrWokyEQjgNEbjf/o6WMOSGPmmn+Rp1NRgfuY6dHXh1KYzGhYAwzZYK/
         MJfNubr9fW6M1w3nTkSpOqc1oyzOg8l8qdE7hY64ANnh3P8u5z/rhUNwzWxZpghqwfv9
         iE/WFEugy1r6Yi8uxhnnshjD57M4UtAUQ+bbJxxoqV68Egdl49Y2qFiJa3zybo016kM8
         axtFXss2Vjz1cCmoqNlt+IcbTK65Q1rC5+XQx2ivwK0+/J5Es0j7fpgAg/fpZFg3MGVU
         8oNtHGfaQGzBgcaAySNuKD1aERLW0kcdX0ZcCz2pzzrM2I7rqLV48q7iOZHVLvgV7oE7
         NOKg==
X-Forwarded-Encrypted: i=1; AJvYcCV0ONX0SNavPkZ6ShkemLgDT1AFHbS1rlddatOsenTOYvJfL33SQxcux6NYL/TENKHR/WvDvXUXz9oGPRd96+tw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf1fPDDG76itq6vXuzB51ZiYdlAivyMMa9m28/9I0q/L73HYGZ
	NxKcaFhXcDdmsWqwdxCe+fnhCcwxGtd1qK/Vt33fStdym54fYmKdQoH5QH8hlq19ol7o6u1IFn1
	USzMu05deA/AtvqzqrVkFtS2UzFfE7PqNvzsdez2OCN7PrM1efa7NX3KicyRdTUIYCHEN0uMKWw
	==
X-Gm-Gg: ASbGnctD4AOhU1GKlm/cuNlZOf9lHtbHo1ecT4BjzjzBwTh+N2iV6UrXa5TRwRMtg2D
	thay2gaGwW/nQ1bnBe++1s/dCa5uNmmCLl7P2LHUx9BNrsID37zNtIZZeyHpsejBEgOeQRbXYJx
	SxYk9cv7MNA6tmDwDWS13AfekYExOhOTaN7cHSWr8jdaRvH4feLkeyzcwEJLV7/xvFHOHEa/Fiw
	eaxYqp0rC0fq5RsrWjmLVazWLU3kK8tlVqaa1QaGa9BvuDoourOHPyyuDbur2opebBYVupzs5EW
	jGjZWebbIaWc4HjDd+dopSdPebPm1t9EyuCcTiUQpAxj6CMx1V8NCjDnaCxnZzTIajyvB4pfCI5
	jx1/FG98b46d0AusRcchFP6gb
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id 6a1803df08f44-6f2c46846dfmr28951786d6.39.1744962610258;
        Fri, 18 Apr 2025 00:50:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOd3cRqGE1P8KpWy78lHx9JINBULPKSL5YprCIzeAWjS2E3hNvF1FIPQQX9/FweoUbxXDxkg==
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id 6a1803df08f44-6f2c46846dfmr28951586d6.39.1744962609895;
        Fri, 18 Apr 2025 00:50:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:59 +0300
Subject: [PATCH v5 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-4-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQpQLS4T7hY3QMRLBYKCNlxp6QGzMPUhM1mE
 2syy+Wzk+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1VrxCACRtXhz+Ws7y/U5mibKKWs1K47mVF3B6oHwu+dbQIpu9R3+cXU8iKVJt9HMUTGg4siyX1D
 eaGaX+pRmZfZCSTCiiZOAXCYxiBEfPXmNgwVdbuDhbfIx0iBbB+4Qcsk24KJc5G/V0Oo2H9Cbt7
 IjHJXi3lpg5HVGAGap1QasV6tALnitBsO9fdF3ko45GlgCzt2Cr6iLyqiHYOqMD0EOP+kRsL2eU
 9G5ILpyOE34prwSBrY5jXHkCWobnAYOtRcHrDUGoji3osXOGRxmh2EQv+nGN/Anrc5XFbGk3keN
 ZLZw5pdrhmvM69zzdCa2x81QxcPDgCtWuEwLUBFy9bg8N4Hc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0JxYk7bUyRIc7U1WChQoYQUMJy89fIG_
X-Proofpoint-GUID: 0JxYk7bUyRIc7U1WChQoYQUMJy89fIG_
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68020433 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=969 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_005011_892669_B3541A82 
X-CRM114-Status: GOOD (  10.99  )
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5


