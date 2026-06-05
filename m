Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2BBCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mO6WbvT1h9M7fR6svjtgiQ1TZ0TcZuDFdD/Tl0yHwk=; b=Ojl/tCxJgvK002zqRnu5n0or+Z
	zvI+yVnzFtOaLUAbNJtI6u2taLIKM1/Dem7ZGdlWJ2HZltDbOXzwkMKNHBVzqCUpVvSYObt8HjNbV
	g/nVlLT2vVjtICH35LXUCwKottX104VRuSrLwzz/p2t3C5FcOUvMVeMSulQ12Z4wHP05JvJKZfp+J
	S4T0+Q1+nJ17V4O1kemaF6uFh6GfBJh6ErWvfVI0Fb/LV/F1LCF8vNor3jgR9Y7QRxIbeHuqZ7BHd
	bc52sLAc5eOFJg3fgh6awEGPIAp7/Mm1pl+Zn0pX3VJanJEV4qGXhm10EYKXKDhW0rWJhjUhJfI6d
	029xp1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVReC-00000000TQJ-1VgD;
	Fri, 05 Jun 2026 10:19:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRe9-00000000TPn-3ZdR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 10:19:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6559mDJF3016222
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Jun 2026 10:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mO6WbvT1h9M7fR6svjtgiQ1TZ0TcZuDFdD/Tl0yHwk=; b=ehgZvF7AZ5WrNQrJ
	H0w9egfZbOBcsnIpjqYB187lusX001tRhHyQnVDSyqF2734nd4pISwKOrD+v+NAa
	1sJROJep8REdoAInQbMSUb0rPn9f19P0fG3LkTb+NkzkRWvy3NUwFnWvLIxkzKrz
	wCdX2PGrht6JcPhb4OSeMDNxYQLYAs579V3mgCcLEY6ZGMArBJvQnyWWX9dLWy4q
	J8JGpdLHfWji9n3RxEtdvmAM+K2tu8HXoYHbwVfJgC3ugnOeJgkc6mvUkY+9UrmG
	+AiM7u0q1dlJsGJP1RQG88fNDEAYWcG1dvbsw3Gat65jaLxDQSXj68Opg9b55jQ/
	dqc1Hg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekv56g4a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 10:19:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c331eda3so21150905ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654764; x=1781259564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mO6WbvT1h9M7fR6svjtgiQ1TZ0TcZuDFdD/Tl0yHwk=;
        b=M1CkQmiuKuL7iyEhndmDU1YeM1J+ERqCGQ9br/mPlKRvXcReS0HMdLe7x8FhScfu/S
         4SnYd7Lb6u/5hRX4ZZ6XEw6hNIfxaQOu1jcpQJVbkgmLl9i7ZTPe2mQ55V228yEcyyOS
         SbTRFw1dbp3sJ0NC6lbtNlRprkrubWCO9dXnIqKvO6Ta1SuRQ08ZRICdZRED+QlRLAdh
         UjyJ1GpUtYUprHF8YlChU8U8Jq5jiKEe+EbL+DHAz74GG5xGSmBxJTNveWgBqbSF/qZp
         BpJygN4AJrmDl9cKQHTatOtFgIWWliIJmdzIZowNNUHz47vlk/cTOypfwEfENmb3aRLu
         dmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654764; x=1781259564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mO6WbvT1h9M7fR6svjtgiQ1TZ0TcZuDFdD/Tl0yHwk=;
        b=NCTWTrtKH+L1g6tAiT6b7QFZpfXiruU2OXmiYeiZXWlmIArBX5O5e/S8OpT/BqSP6K
         lViZrpbByFwq3rqjWtEitAaZ37d8L3wmOjn4/+B++YylOhI51niXpZIBC4ZHsELUq4Pl
         g1bN0NLKzOlT9cW8aM2mDEHkkACYr1LnoC7OtNfA4kPm98NCXQyyEq6TWZqjS7us+F/Z
         4jqKPFSiYxiFLeHOjsgDJ4vPUWR3SWNLAJ4/GwS/588Nhq1Z9JO5XAkUyuaTxcezatOH
         5W2u6YDp5kvPBeriFluBvaa2Ic/KAoeO3vsuSQrx66T6p/z+GFzTo63TFYBKdfJsQyZW
         052g==
X-Forwarded-Encrypted: i=1; AFNElJ9TgXbX1ow2/+oJyUXhucb4fuQMOt05H/cfVDlWTY5kdSnUwKXdHljZJlZE/Bayr4pSYezvDHX509rPCu6LSHUV@lists.infradead.org
X-Gm-Message-State: AOJu0YwCuhY95Gl/aLsD28+lEtemqJYLm6FpcaMCR3qKykZsvDsUYLNr
	WkaNkExvN28+w6orq4fsVHLrL2R6+Ab/u/HkHhDySLAFe6Fp45Xma07TfUgaIBW9zbo65mIPwyQ
	JVEIndoTfp6wz+pJhthYWx7J2Mo75ZFKnS+TdQP4dZo5QH/6/l3hL+A5Eb45XeQkBnyQq3Rz6+u
	G5mA==
X-Gm-Gg: Acq92OEyJCbaHD77xy66+QyJAJoh64TEZwwz5Ynmek3A4+dwgr0xF9yu8LLyAkpMmv0
	cQuDJR4uXRkKIaSrJjoVp0MY84io1KaX/JEj4ACKgHGqC2a2dozpQ5NDjG0Y67j5bjPvUOa/JPx
	/uHYZZHHvdWSwgQhZ7PSdJVMx8pQ9MbfxINW+MYBm2xBpEgMEL4TGHh7ddeq9FY6BLNsyd9dChv
	vvMXVAY1BcVlTO9+59S3e9DFAi9W3mUOuNIOPJjikAkpx9TmWae/smV2bt3S7lQe/cUzcGhnYaB
	JhSYS1WeuzxXorwMRt8VN628+soKQC2epT0u7dzwCKUNVHynOzdVQJrjXz6DHpB2dB8dOOQ3A/n
	pY/n5N6ETzZFMvqctuYJHrhYGeFK1YlWC2+T/6tWidt3Pt855gC0gJwfrBqc=
X-Received: by 2002:a17:903:4b46:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1e8979bedmr28483715ad.37.1780654763779;
        Fri, 05 Jun 2026 03:19:23 -0700 (PDT)
X-Received: by 2002:a17:903:4b46:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c1e8979bedmr28483275ad.37.1780654763235;
        Fri, 05 Jun 2026 03:19:23 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:22 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 15:48:51 +0530
Subject: [PATCH v3 1/3] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-display-v3-1-9846ba5fe635@oss.qualcomm.com>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=4024;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=6h+vF01fqXjL8C+60pXT/uazqotTaaqSviArNOyHNG8=;
 b=TFxRUXxc1AM66zgTu8vryy4ABMH/7M1dXZw8TcuBEziBAE4HeSrNwG9FLnM7EYBN44BuRN6Dy
 aKPmV311+bkDAsH91RkXrlVUjkWwslHad46kxpe84+RjOtbqpfUeZdZ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX4oLjHt7pudps
 7coWOO6wqXDBH/VQW49iZzS1iC8IpNu6eBS5Fp/Or0BYDu0/rryQ7Bhm7a1RdN5DtuSAVndi1/z
 nADdJ6Kudcv7utykL8PUAbXo6WsxXNeoaEz3a9zRQ/1p0jKL3gnkcjRa3hEyos1FjMpk85YKte9
 Mh39d0UL9Qd6+2Rv3tYyKw5AqAd08HNt+CAMp60HPC8HgyewsnXBz8EC8UfI1pseDVHZLnXT2As
 x7B4hJfIsWhn7Ko0ImuEJXOihLIt6mNDfzby3vKDYQUUQPLISl7LdzsSNY4iSpIPFewOaYUyUKZ
 hYNKAd1UscCIW5BJYHVttK9W0u26zlZI6gdw0DeClInTpoKL7YVehUcgKo2WjK+HEwvFi4mAJbr
 n6bT0Y4Xjl54IXjGsvkQgZqlpNQwB8NuNqVBykw4lC4lWTc+k68z8dA8n6Jefb2SIVvWKSDkIPs
 UCr4kHcdbTGtv9Ofmfw==
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a22a2ac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=OEkpyX7SRU1z48_sfK4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OsszqKljYcdyXCcGOM4mCy6A69NfAoA1
X-Proofpoint-GUID: OsszqKljYcdyXCcGOM4mCy6A69NfAoA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_031926_023287_935D9E54 
X-CRM114-Status: GOOD (  14.61  )
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

Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
the existing qcm2290 bindings to cover Shikra by adding fallback
compatible chains for MDSS, DPU and DSI controller nodes rather
than introducing a separate binding file.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml  |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 +++++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 22 +++++++++++++++-------
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dbc0613e427e..ab2cfd6d6e3e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -57,6 +57,10 @@ properties:
           - const: qcom,eliza-dsi-ctrl
           - const: qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,shikra-dsi-ctrl
+          - const: qcom,qcm2290-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index be6cd8adb3b6..e166a73651df 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,8 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-dpu
-
+    oneOf:
+      - const: qcom,qcm2290-dpu
+      - items:
+          - const: qcom,shikra-dpu
+          - const: qcom,qcm2290-dpu
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index bb09ecd1a5b4..ef21b2c263f2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm QCM220 Display MDSS
+title: Qualcomm QCM2290 and Shikra Display MDSS
 
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
@@ -12,13 +12,18 @@ maintainers:
 description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  are mentioned for QCM2290 target.
+  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
+  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-mdss
+    oneOf:
+      - const: qcom,qcm2290-mdss
+      - items:
+          - const: qcom,shikra-mdss
+          - const: qcom,qcm2290-mdss
 
   clocks:
     items:
@@ -52,7 +57,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,qcm2290-dpu
+        oneOf:
+          - const: qcom,qcm2290-dpu
+          - items:
+              - const: qcom,shikra-dpu
+              - const: qcom,qcm2290-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -60,9 +69,8 @@ patternProperties:
 
     properties:
       compatible:
-        items:
-          - const: qcom,qcm2290-dsi-ctrl
-          - const: qcom,mdss-dsi-ctrl
+        contains:
+          const: qcom,qcm2290-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.34.1


