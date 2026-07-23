Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8396C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=hYOo9lWGNXJPHPi/hdHcVQ13vd
	+YuUjGNKEdF5DWxb49c/rTME0es1tkt9yqAYJzabSGySYbqBs9rHI/oLKxIUrzzyDw0ehlV0CdzFq
	5qDfq99iTNlQCErd7/DK9pSvnYMOKc0gBF4dNg5lLLlEvWuLhpYIS+jq/nc2id2UxbTN9zOx0gnEs
	OrrNLASeaYIsn3FXRxrmvhCoWsqLkKBOCJgm8YhGwGj7pG227w7aZdEtJawQs8V8SQ4utXThP7a/o
	DzqEqMz+We4WjkGOFgcChwN6TH72C38h+DfZFNojCweUislidF2YYRgJpOz15l19p1pnv19eAJEwd
	uQw0ggGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlIE-0000000DPz0-09Co;
	Thu, 23 Jul 2026 04:44:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlI9-0000000DPxh-0ODD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:44:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X5Gp2538606
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=KmEayScrLrlkDk2L
	8TEFVvYxrvJmEBp01zyrP3qLf6KDGLpJJtb7jUzpdVqnRdcWyRDVoQpH2/9W8ew0
	jmwCis45gvpZAkqnnG1MBYB7yyEWnQi2tGh/rykWMnblOa1cEPR7ZgJvV4A9N67d
	g63QJBfhdNe2AkJ1pj+ldiYIq9JQYi73Ioy+5HCJMMYUy+ZgbftDkMlUutkB8UBr
	uuSCNKupRYZU2me+UDKVMpfiqNGoYzJZIvS3XBD6mJmzUXqL/2nClbv+S9uqSRCE
	WC9kvPwnud2z5CHOWEBm407rXYmLT23UFS3DvYLkv71JDm5ZTofgRcDrG1nyKnzb
	uZBu2w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc1deh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484f26852dso259964b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 21:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781855; x=1785386655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=GASuDEsFB9oUAGeN0CehKDD7EIsxuRl7Fhyo8GefUvwhPiBPF1bNWYRjSrd7TrS3fH
         bCCIsU8diEO+QthyeDrxcv+Afr8dlvZZ7CxXpoMMxIrMcdLLxnTNQLmxv/MFlH/9yiYX
         DbRolFj5sf+uxKCEV/xCS+Z3D3e67IZ62S8rZX3ZIPW/q9gOnzZdwDCFmE1Wz6036XfW
         DhYMk3Tg3E5hz5hb9ZCQiHiINOCPMgUGPZs3qkoCFoBdXuncgikLGfHUQ1rrMsZc2JiF
         NS17WiEnDfGT5WNSbB2Am0WYPXa/zzhaidSwenY0ggYrgm+iiBQP7uxpFqaEozBNbNWd
         2Sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781855; x=1785386655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=sEfSMjaY8SElcM7U1aCUE8MWzfYLIm3wjVuE3qa1RKas4E8Frx2NXJK9SpIeZ075cy
         M74rjEYUoURVZhPFyCJooCNpYFIpXjv1Z/UCRFT+9QPH0Q23+QSNSIcHRd5ZQJSLZWVa
         cJCyoySCv2ba9z9wm4CcyMTTn9ly1QSswjsne8jK3mzysejH8xeiGwhpp4Cbl+rH7EVQ
         tJ+AkL5BxnbTrOSui6HgZbYjSm/PnwHh+4Ly2f9PwGVx0MCvaPmiYN/Y0MjUCmAA0Rn9
         nl4rDTyfE4T5D3Vme9KgoyeFqoYGw18oeoT0rZeE0DKymCkb9jnbpO7S9MdOEY8d0FYE
         OxWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfpNo57gpeCGwugHv0JEiaoBYTS6wLuqWzin/3bCzO0DdFFRO1CIxtfDwDgb+PC/NHbH7Urw08oXYvKFHp/Vls@lists.infradead.org
X-Gm-Message-State: AOJu0YwM/fgSvUp4DqtTyxByQXstoesdnZTnQNS4T0DQd24Lm4zVu5pt
	aa5jQOw0sKQv5XuxAp37sjyKLTZlJaGm5fBjKStpnEkisC3EH4lOF21sDPy0hEpFRnpzYOvDZ96
	PZhJ1AsoC0riDkb+OQ4fVawt5Xl8Cc8uUhB/h7t6FFPmv62wrpCFPqdyWSBbbTkyKoKVPKKSZEU
	GEkg==
X-Gm-Gg: AR+sD10VZeYXeAHcuUzw/jbNKItrnaRQVZj2tlbsYhB8oSC79KxDQkIq2g6TdpZvyrY
	lUw720PYk30sWfByYtgg6Q6voFFs42MgsRylGF5Mg68yVzcCPPThq5Cr2z8y4UoizhyS7Yi4IiA
	+cYmYyqtBparTzy3nFCFpA5nQ+/8M7l3h4SnyetjEIEntaoFWZoKm5bgyHEVmcZQztjFYi9+GKC
	ydyJsWuQFGkEiByTNTH67CLamMasBTAj+DcKiQGtiOG5cCj6LxweSovf5iyjJuM5GSqQsLAGrtE
	Ec95o3nAK16YaMrvadM3bKPbMAjUy0fgZjYZ3g38kbrsU1Y8rwCFgKLeFchtZGS4pyjZl0qvblk
	5HviyhHRVDBLWkjyJDJ4Xpo0obz97vNc=
X-Received: by 2002:a05:6a00:a20c:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-84e2bc191b4mr1845631b3a.76.1784781855209;
        Wed, 22 Jul 2026 21:44:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:a20c:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-84e2bc191b4mr1845596b3a.76.1784781854753;
        Wed, 22 Jul 2026 21:44:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:55 +0530
Subject: [PATCH v6 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-1-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=2a+i34b6L4suWBSaj65sVWFwqZeY1Qa0wKJ5bBToRjvGqa9hw98ZhfM8ZuXl1Ob00IrzH4lN6
 J3e8fg1VKtMCUmyvsCfYDSwHZToBmpyFnHVGTdq0GdZOqLeO8ZCSReU
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: ulBq8a4AUwhf3HdgTKhmblihQRl29xP1
X-Proofpoint-GUID: ulBq8a4AUwhf3HdgTKhmblihQRl29xP1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX6E8X/RN374kb
 dVAbRjI4oCqdlBAO+zep29Gw2damvLeaJhE1vgFUZItLIJYqen3rsQM9GggLFpYurL0inhHIkpy
 c4mCe+V1V1AsbLXCAlP7bgHXgoq0DU4=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a619c20 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX67sIJ3aDRjYP
 QOW+y2b4cgvxWbTndB6/BUzdu69OF79hwuAgnVrpZt7s/5a+t2Hfx0QqMKLu2D3G6hT37w0TILG
 97f75ynEqL8xBvk/o2ukZwwMgCd7b0xQ0jHtnKLd88aeiBCrnKxEC2JqP6/kmb5BckJcROqc2Pp
 7m4S/AMOC7le9uibOK0R0IX59fs0jNczpyFt8IZUqKekTBAPgEDs1fV7kBXofmYHK1qoX+qv49T
 UkDMMgoFi9jfg65mOpPJysdCM8MDRfaz3s0zwGOLq5CocPFOTjzQzpQKzU4/ItukCx+FTKRcLij
 vLGCHwI6X+sFG5DarHpHef0goz2evT1FzYa+QNqDFnRZOyvqHDw5K6CZUkUlZSoRPeTLZ9JqHJ4
 pr9lGDkHlM89YL61e8nXvTVIjgzmFnPooDCPPEFBAF7J+qJSZVEU44u1I2Pa7zCuv0m0QUaGoio
 51uM9LbKH0sJYeAMgrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214417_267984_A6E3349E 
X-CRM114-Status: GOOD (  12.74  )
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

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1


