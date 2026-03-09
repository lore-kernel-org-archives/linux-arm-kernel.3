Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1DBEFCD73
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=fNN1qRcUBPE98fGiG4mP/iWXEz
	PUOHM1uCx2jYSXGB7XG1itKgAX/WGGe4dD+ikzHC4YWIh0wJEoehr6riZnGEJsg8xEB6nrzi6Q29c
	g4RhUIx+A/WAMvdCicwwyqD1gcPlJNrpYGKUTiQaE4kKeCqcrUIe906ROYpZ8Dz6PrrXH7ySAh0rM
	zPWdzpZBRKYeiiYSPs6yCP/+3b+9f/plCDt+hH0IQnymSaROSziJpVldXKvZQTzg6GkUSvdxZbuX+
	DtWJlMnZxU2TOWCYGSSCJA2OX9roUQYSPlngeeuBhqsudJTNbxxlZdrPWeSjUR2WRP3FZjrPXcowJ
	L0bTipGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXE8-0000000714P-1cHb;
	Mon, 09 Mar 2026 09:48:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXE5-0000000711y-0tvG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:48:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62946l7D895140
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 09:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=bUNbB+gApcvvdBY5
	b8XQnyMYEXkMJsk2FqKHhXCE1/gBey0epeYpuCZRq8jHXOBBanMWKzgWP7VaqLWp
	80Y1bg/KOybcJ1tasooPS6Ce4qOfpP+L83NJAc8czrx8pQLEmgz1DGgnhRuCeFlG
	Tv6vWaoOaE0iLBg9PiPdYb7tAgSF/lw/koXjJLMYAUa89xaAYueiUfGZrjBBSMVz
	7VTouxuojTkz6pOUo0gzA7+8WEOa1kWP2j35379HFhkAVD3DDIr5Px0Kz6boBsx3
	DetbvhxftJC/FXeY5dY6vOWzdIZ+yxbN615IqQQxeoFR4dQzbhETn71IY3AiZDBV
	QQfoDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxvvbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:48:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3598d4b19deso38040376a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049715; x=1773654515; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=gYk6vE0rCFjf+VwUAcz3oF1GqrRsklTmQ2UWx7HFIWAXVLY8nxU8xoyAx+hned0hdp
         7+UFUDjX+uN8WZ0WZdF5JTGOAAiFf6I63K0uk1CTZM/91pOQAn/EqEqU2QIm07r1TWzk
         4LeBEKPHXU0phxg6Uw4xVZO2v6SB7fXvQB7/QAxIINCOw6rA/PLCQD0koG9dFQjH/+4/
         b5FnfJNQL33VpASfazovdJ6G8aT9qo8YfGv7gvKI/0emuHTSRuSvUPbZiJP6fWFSmJj6
         BcWFfwjJiyDWefNuhe1ofRIVtj1ukW1B0O7Q3QVvbGJzKo8/Kn6I874GFwEE0mAjt+Yi
         jwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049715; x=1773654515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=WB/UmYHSxP2q1hKgAlPS6hWA9o0L5t1gMukbpeIVrGE3sDTPgTDSHo0qLMMps3UXD5
         FwueKWu9BEr0+/fct9Unepn6I2/Yt8sXuE42nZIEmCqdquZNILCNf1EYm4FGkZqIU/XK
         qKZH5sVfcSr7f+a+pHx1O70rTaa3a424la4HX75XfHPDKhSdmbbC14m9xWcYDu52kRzx
         GwOXhG56GHRZauX2AYMHfv60vpFH4RFOGn4vz5AdippHSPo1WVtoTJ8SrOG7gi/cGfUR
         cs+QoAue5LDFWro53EF30DJWVOmA47aku7ig1zadUAY7U5U7eUrn9SpWl7T4GXv9MCW1
         qTnA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2/ysdgECpkfrupi5t74w5t6pV5JVJpyKLHkRqhcr3PG2oIzSFLzC23PvCob12hQJf3VE0hM151jyBoISTuAy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5xhE7vYKzhFCqbvbTr/uczkFD2jjqBqWa5RSqj+aT7NC2mTvR
	7JMeqhyVGMvQpSM0wMfjD1xZ3A1UcrSdxOuxXgvTtyRotmyP/cxPOLfRLELL5DQzKcK57VClhMo
	KW5JqN1fVxNiuYqdvQscScrFueWS3nVhp5zdBgMGiL0z1QGT+HfwfYIj8hy6riv0cPIvQWff3+8
	xYImOlkxwdno3k
X-Gm-Gg: ATEYQzy/sHPB45/FCw0r5ueWt+7hZ8wpD5UinMKb5IrgLBMKmW5ELTvJ4SrLP1gxNn9
	5dADfTv2KH/i4b/mxbu5CG7do5yKynYxGNcCwPWE7IkdPWrzkUxeESOue5KBjaqRDodsYsAu3DW
	BlXJjL7fRwYmnkQDsHFKTpitpvjcYrKGzFKc8Ks90YNRgN4hQCsmb7/Gzdg+1Xa3DXao4kd2bt/
	kNEQMuLbi1j2fBTZKYb6JekmKkjl8lY0DeG7JdTKv1zTZw6HxBZqSEF23xu1XGvhlOZdzddFpQd
	aiI+Bn2XKynWzrxk/gemFzCBoaEAWlDV7oUW1wTGqOzQNYodROtBvT3k12ZdsujNTMEvq/hDDSy
	vlbuRGVwQ7irYjZoYOxX61jWIrofY8LqjCb1U/aW1+K6FeMkcEvM/oH9bcToXBP2es78R2a4p9j
	ZlKpZtHV31
X-Received: by 2002:a17:903:1af0:b0:2aa:daf9:6980 with SMTP id d9443c01a7336-2ae8242d919mr118233165ad.27.1773049714815;
        Mon, 09 Mar 2026 02:48:34 -0700 (PDT)
X-Received: by 2002:a17:903:1af0:b0:2aa:daf9:6980 with SMTP id d9443c01a7336-2ae8242d919mr118232925ad.27.1773049714233;
        Mon, 09 Mar 2026 02:48:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:44 +0800
Subject: [PATCH v14 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-5-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=VVEH4Y2bVVMa+sGcTQvGmFBKcR9SwZ1HAcL2UCbh4RwkexIhcoJw8V8NmeZDhnuDq9LuoBMXe
 tKGwtRztBngAwhUxuHA7JlFlvLhoivX6tXijBQz8/UA5NnCSU3B+cvD
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfXyTM8p2+BZGC5
 lHKW2j77dVqbmbjZU+Xoq3V4e/GgmeOw6CKXk5dRs09Wrd8ZTmq6Gk52Y6AHrGuC4jl+PZMy4m7
 KT6cGDNFvlvWHu0iGpkBFiQnqrnJlZzAUdzamDfpsFeMf5uWE4w1fJ7EiIwgxpt3neCTSdFqO8/
 ntWn+xuP5WU4Vx2+HrN0O7P0xifEQaJOVhUENVPLdqRzVS+tcVjNlQBquF2fFRWrl+swCKAfYKs
 wvT5uef5f70wz2VqHWro7qo4SMdTd0vwB5fwOTpT/z8/7OfEp5XTNvmgBOeB8tThei67wJbqclg
 omqCz3084CedWL2qimc+4FNmCHaGnWiW92/clcFym6tCoMQBUnurSZ+QyXjAfYh1gXuuRv3n/Yk
 N6BYzgwgLSeX8PxK4dnqoHRuYEE/HoQNmRcY1ZO7dj6wT6M0QHRP2xHc65+GOiGI0+il3DppCz+
 6BDxAfOAt6odrIJ4O6g==
X-Proofpoint-ORIG-GUID: 2-I-insp5xrL_vFOYkKBn5cQp10Yi-zi
X-Proofpoint-GUID: 2-I-insp5xrL_vFOYkKBn5cQp10Yi-zi
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae9774 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_024837_373151_6CF4AE23 
X-CRM114-Status: GOOD (  14.45  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


