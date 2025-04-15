Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B3CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=; b=u8XrPyiNZmJJ2vo46/iGsCLotq
	7YnhmYYz/DqDTVrg9pE1Yp4U0jtxHUorNdREmOKEf+KxFPXQ6xfAPnn1zLI9Tu5Ffb/+tWzI49zL7
	Yqo+lDxLbFq7gg3XQz+9/35i4hwn+aT2XpJ3Bf05OX2HEx8p2lDAnUdUuhqIcTpejhGPHpJ2+ilp4
	UFT4vi/3iLaxqUIlPjN7brtEVnzGBRQt1MhPw3S+rHjcVyKtaN9GpuyR8Jsucm0ROOgBqlKQFN/Rk
	Ah6k0yyVGGJKqVOSZW/5fp/AyYajT4LKyn1e15IEtsM6ALtH8Le3Rom6kw7MhbNxUpqEhDWL99smo
	bfubvDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cqy-00000005CEY-2t7u;
	Tue, 15 Apr 2025 09:45:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4clb-00000005AoX-1MU6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:39:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGVX005844
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=; b=SB6nraEnl5B3L6i3
	XkVG35p0i6+ofgk9E7yggVrXfq0r9Olv7vhSl6sjdYC0ZCA7B1xixp2/xcMDlUEs
	PwUnsLqpRKCNrAiqwhUtbathZVEwNg4xmRrW4XaeI5UeJZikPC+7g8UMutqOEqL+
	EnvQTtx64givPQ4YDie4CscAsv2pgVPRELlB8ZiTiBVR2Go1EKpSwMc97UJTXT+q
	SFiG0Agz+IIA9aEBoHebc3p1qK8k9GPDkWcwCkT6gEwX+5cUO71SnQ/RSoQHw695
	sEtieM/DUJmqBhQUGGpi3aTwxd68nE4l0OYbuk9VixsoQZhWp0q3X5Ym+WmsqlBp
	yLuR0A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7qfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e90b13f5c3so107723536d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 02:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709980; x=1745314780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=;
        b=v4PmVEXGLm+tTz5grGBVnHE58ArZMxozQMtkfDLMTQrJFhOm9SL6WhPDtutZnfEBj+
         xS0n8O/03lFHF7jw/Y2ujHCCPbv4IZ2Oc8enF2Wvr0j0AQa+9SKfD05LJB2G8e3jTBwU
         98kj3l6EF7bL7n0jRcsFdHVkTw3kI4QIpAWMon4Qqnrq+NbX8EvCNfLRXKUWKxW9IiDE
         OU5Lrnl99l5KYyRDr+51TSRU/GbO+9hzj/SWg3kkZnoXORH8t5nbZffx7J9OIQvOYnL1
         IPwYNjydI9XVlIGRqucps9CVM6CYX0e2Q2oxUZmBjkrLDB2koumi9YfZZpvX44pDEYfs
         snYw==
X-Forwarded-Encrypted: i=1; AJvYcCX496IS04JZfughdF/Gmn4ulcSEDBMs6TyUXF2GlxowwiN/+INYHIbk1OlgiN+EkuNejxenT95SMZLCuoMtfHGu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz32PodSgYbAH5kyXrNzbd4G449lIfRFhQGIxN6pT1ORf/c+Ump
	RjaQWFDGDmXyVlU106U/kqN+n1vHVDjHnRDQCUFz7g9E4HrIAzeuAfZSTXZbtOQs2gPx6mk2olo
	3GXQK8TB9jqn4Q96PBRln4tHgDdk8vIJ3Qt4mW1F15iYTcagqu9A2gFwltRtLU4pY2+J72V/0pZ
	UsKt5lfu8Aoxw=
X-Gm-Gg: ASbGncsIRFnddNKILs+X7DH31bJGZpfKEaP+i376vwLWsq1j3JxG2HRj1jhbbfErH/x
	FhxlNXvaxReKeahyawdfuxDxZn07RlnjkXnTOPdtwKN2dAkrJuKea7OXESiEwRAgen4IHuw/4OC
	/ThW6Kuh5uHJwO0re+q8BykDOHyJb3N6uuQap88fc6qPrKJOxei8NgXuOmoqf7OqXUqdLoAeVvg
	yhxQDYjD0ALKKMVrotpPuPKWlgObsloDct8RuXE1FkpiYIk0E62+nOwKaksoodHjp9GZhvjihRM
	npUtCa+HrlRsqSi9S7gK6moOWMt3KLnrzNU4N48CjLsGPuG0Xfa+A702DCNhFnNZ0ch9Bwv20+2
	4n+7WRRhACKKhZpu0NJrQLofO
X-Received: by 2002:a05:6214:19c5:b0:6ee:b77c:7dbe with SMTP id 6a1803df08f44-6f230d27c21mr193434136d6.12.1744709980639;
        Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQp2HjVEeO0ktbov4KZJe4bJnmpotAkHqTPZqWnlxP97B4y0MeVgdf+Bpf8V/w9ZAnpH3sOw==
X-Received: by 2002:a05:6214:19c5:b0:6ee:b77c:7dbe with SMTP id 6a1803df08f44-6f230d27c21mr193433886d6.12.1744709980357;
        Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:30 +0300
Subject: [PATCH v3 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-2-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilVrA3uEJ69v1dp520K7RYb5A0BSH4RNdJGh
 6YpzIXJKguJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVQAKCRCLPIo+Aiko
 1QQNB/46R21cEA9UsOBhj4cdENgoT+GeVGYBZ6fBavXGRXxth9LvnU1MtN5c7S5xOWGd35PypCf
 Ley8En0qAy9vAmGlD67vkSlMr+Om2vHCk5Kxt70R7aWAf6Y+cgc0jId/kpzTz6NP6h+8YQgQnej
 rff3dPK369Ff76/b7EpPBxWhAamZUdKBsrp0KHxaryppLO6veyz0/plFD7zT8NVlPGrdIBkxImv
 557qYxNphcbJOfHkJnUmFlpa84lu40XmCGNAeq3zRzA/5OZf9JvwC0EGyr2TwpiuLYPPHeVBEk1
 G9/qmCs2DRVsxt7TRcvid3UlGoRcF/WHOzqCcyARtgc8WmE8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe295e cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZPlvMy5FTrZis5IQOa-RNHfYkhPG0sU7
X-Proofpoint-ORIG-GUID: ZPlvMy5FTrZis5IQOa-RNHfYkhPG0sU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=914
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_023943_385282_DF5FE9A7 
X-CRM114-Status: GOOD (  12.33  )
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

From: Dmitry Baryshkov <lumag@kernel.org>

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5


