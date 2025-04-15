Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D475FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=; b=Ocf03mc/1ZPuXeeS7MtV87Qf/v
	n/CzDGtpb3gIK+drDiEByU6+ZRW6iAKORHW16nsHmOCbfo+vdS5DScwhwToNnQDT9NNNwW73ADKjK
	NB/HaZQTrcpC2FLQ8DCPSOlofeKbxVKZqnR99aq8V5thS6+AAF8+EEZI0283bE0mAUwSnc6YdCL8G
	YNCT66szmagKWC2HYzcwrDfsXS8M56b/GkQygx9yFfzNa2Wx76u5joFIchQEcFx34LiI8ZLUcaBqN
	CtkvAy+x0f8474zw6KMT/M1bUEhlzRFs04eV2oF56EShzqfICNQtVCIw1MPmODAPtxc4gXYdJUhoK
	Ju2BfaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4csm-00000005Cdb-1qBZ;
	Tue, 15 Apr 2025 09:47:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4clc-00000005ApO-14L5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:39:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGVY005844
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=; b=k/IqUdzRBucNQj92
	R2oMofXUSvg68XqSvUpoLzeKhEkncj37fRhj7sxxT//9KzNeIettuvkUxeJbWAhp
	fdJjNj2HXxpls9vmuDQkZy2t6pBID1MAMU3GPI+sdTNiLGXnK3Bv01zlRd9uy6yR
	4YZWkhKD5Y/7HxcIA5Bs2wddIVY5vA8gCr2nLxUDQyYEv6WcpM19N/W1MAE2OzLE
	kP3LvobnWGmInRCNGAwZVuwvEXT0KDAN7KStXKnT3/irwgp00WQDh7d93J2knVTQ
	KXKNbhFJslrB1yBKTxM7Dd6sGnRj48GgY5phhPhURKtEstJDk3TXGjfIY1iIvTnP
	pygfig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7qfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ecfbdaaee3so88254806d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 02:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709982; x=1745314782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=;
        b=ZcrgIcuB2L12jLNrJs8y9EtpIfJLhl4aSQFLO6S2Q0jMn2YzajUnREKzbbkuJAglHG
         cyIphC+aSU1BozNAfR01JYt1a+f79oF71wbX9f8L0UA8J9DJtoQ6Y7SOP0FXaWZTuGD7
         FlvqxoiroBseKXzNLDeCE4muPx1kVIi5Q+3aLjob+ggo/746WQDZ+M41Nr2/lSh6p0Ry
         I3dhv+aEp4GKK+ZY02NxsxGZlkpkxQdTt7GCKMGrglEr9PkXZYnR1witDS1fxmF1APt5
         4TC7dRodJ9QFomvieuBk3549LRSrxRSrSbFGYKoPSrmFgLX66xPU3f9yspq+T/igaDH/
         9tnw==
X-Forwarded-Encrypted: i=1; AJvYcCW3QO/OQPB1GvYXzvL3sXHxgErLU04KjX6Wo9ak5ynkggay+fk7aDniHwDEikbWPLfgU2Y1fCeVZkKWMt4/+WDk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2MKO+kbcTGQoP3kgUqmqGC5kYQ3jm7TrL5Fy+iz+Bt8RY3YKN
	JjH2/oDrtc1LBfrdJy5m4ajyVICnToc6GBJyL1kCi+OcrpoW3sDHU5SbjUPr2LsQO/nT7yB+YLW
	GjOGASMChyNQQIxvVMB3Jzc8PRLQvtiEbqhm86YNmEV7yusDUkcDh9vPgTZMJmRHz5LZrNtRjV7
	4LWQ8tPw84cVU=
X-Gm-Gg: ASbGnctXNKX5QXVQ+Ece9oanKTMlKWGYw9K+IN93UFuZDW6UhoAV0ASao7hqadkgwUs
	3iSX2c9Oifo+WleEjRW1062FeaQ/edrgqlAcaKSyTnApAo46VILzKaW0xLTDSaRNALrs9GG+tqn
	L4oWU06BEGnsvmhFE+gSN5FbcWeBw3UDXdTRErP6Hom7YoVNyBJKLf8gUssdaLf0sayWOQLsVC+
	8RTuRhn0llSBSyA5UwPoje6Qogov9PTMy8l+lV2wmFGTsDCIZ1VgAUQuzXwck2QSYCgkEFlkM2w
	yUPYcgbIoD4/ta0sd0BJ9C37J0Qvr8j/wPc3yN/pO8RNoSDdP8yjPCcRpuxYFx6GTA0TJaMWyGR
	ETmNHreYjaIi2II1fYcQtZnOM
X-Received: by 2002:ad4:5ca4:0:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6f230d950dfmr209919696d6.26.1744709982016;
        Tue, 15 Apr 2025 02:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD83JrRkLeYEAhElysIxFYiO/qrqAOuHzc5Obfv6TO5nQKTCzkIT8H0zCFaFZ205TMR64XhQ==
X-Received: by 2002:ad4:5ca4:0:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6f230d950dfmr209919446d6.26.1744709981708;
        Tue, 15 Apr 2025 02:39:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:31 +0300
Subject: [PATCH v3 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-3-62314b1c9023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/o/zTCVhoZqo+Bz7P3TL5bcP8LWqHb9WPmSzRN/6Mx8t
 JRtt11JJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmEq3B/t+n82fyAwOWZ0dv
 PQi/YfRnoaUis4BRVXovq1edzsmEqUVHTrdOvs16+XxRjd2kRFfpKnYrr3s/Sg5n8zE+vRt19kr
 emb2N7Hczpm7uPHs5a8Ozdt+nsWZnpopssj7n9ztevHnXqT+KM7bJHD9U4ZDceeCz3UZJxqhcY2
 bfKZJHtx0J+unkeXSPm4/mvxRFo6DpBWrLlG7E39CzPrSUUffJtip2YckvRx9dFTl68ax/rjRj/
 rITUXJcKVqJTgevc69s124x8WP8UtfY35m3NJmb+5v1HSOB9Wulv7/psJ691q+2W5pRoniGdIzb
 oQd2T3rNquoO2tobl3n9+WZ2iC+twMVggef195KsnoXcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe295f cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2rDx8ohOEVz3MT15KgUgIbthul1h5lPR
X-Proofpoint-ORIG-GUID: 2rDx8ohOEVz3MT15KgUgIbthul1h5lPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=976
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_023944_303038_59582119 
X-CRM114-Status: GOOD (  11.89  )
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

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5


