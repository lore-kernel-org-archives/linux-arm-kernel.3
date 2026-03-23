Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7346EC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=klaalmvabN60nweniF06YfBR8R
	Zs8vPsSamU0XPUcBEpOP56oVX80FMW6WGEVv/WICsYHAOCPhYbv70caTBdjG/bbqIs+rGnn05AU2T
	zatrMeWZgzcWKT0lWXkn7c7Wow6SXz8HDJ69SAlpbbWTjK9Ig7yoitSVAkS5e/MPSMlrnzxUbu1Eb
	D9Uk3h2SMpH9vmW5034+Thw1ZzfOhDqujCxpF475UEbXXhzGvX1ObFLtKt7OW11HogX6TucODsyF+
	TQ+Snl7vHSATwt+112ODSxk91rfSzgg02scFEvqbe9XQNDqC3YDDsuDvEybdmWwIqjEzv9ytIbQ4f
	wIuDj+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bvR-0000000GPPR-3Efm;
	Mon, 23 Mar 2026 09:50:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bvL-0000000GPLc-2pDS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:50:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tMFZ2291969
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=RGk1ATWijn46n4dV
	/PPjXcUanGIl+j9qtviAsZLIdftayoF+99Mdx43vPdb87MJrSUYcEX2CfRPJi+wn
	lQXZYd/0EXGyy/NuKJPL1Lj/c3q1nVy6HLApo6D88QGmw0OBH3dyTEjAGH/yD9Fx
	QlT3bkC+IRgfFC92aQul4OUBaJGMr7C0pQT9tWI652l4R2AUh0Z+P83Mck3HJ6US
	+M8p3UNkUbiW9UnsvePoDNwAcaV33RoAwnvXLtfUM9xSNvzJedCqlbyoknSbLKRL
	8RTynxj/9swi+fOKEyHj5LcG0bdY0fqr53TcphtaUO9QKETT2MlCBcivqJJqRfWO
	FWE8Xw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70d25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35ba237d2e0so3039087a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259414; x=1774864214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=f7fNzBt2JuBd4N6YjDPllQC71i0WqZtcYnw3aq5dGO/u7ZlHiq+ErP8T1iNDGnfPdD
         tNcN3BslAelWh9+xv61zgBUWZMyyZYvLJqnTsgNL/eNAJeInz2yuPelNPn7WDSfpE0jv
         +wcuUw3aPUMFBBrAK27hhb8DkiU0ve7yUSxvQ5uWLSXcNhVir2Ljym0uQkWX3tfNejXL
         byeFLSJ1wU6ByRnIq9nTRR7Hv23v3j1nh71t5mUgkASXq64JZkVaAo5khj33ppn9RyUr
         dF1evuvuw9+y4QyyiRkWkyrIhiKJdlrGRavXbpvIVQBOHgoZztFyyiTL+QJXYL9r77lE
         JO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259414; x=1774864214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=o78hFI+1m77yrx19uMgE6jeLauGfLyDeFLEM2ElDQGPIcIv77RnXXcof5Omkm402El
         El6izuFIYZMzV3G4Bc3z/fMR5PpNflwv87o5qoQghPtl23CFhg8ZXjkNExmdl2b7/hlX
         mRnHWa+cvTXBTeEDdGbfSyw3jfSZqAZwY13gZw7Z0NlnUtYf/DbL5xLROImuF6ql//Li
         VQF5JqdX8SioCh06TvYl/NPw7Pv4+KuU35HKGguugHH2xXMBLJQkMEtO/0L81eldhHnk
         OoBhnwAI1pEr9i+7yqpBSGyIQw4E1vPgceTSzCYK6NH8mVgAFb8/YDGBqKSXcOUfVSp6
         Gz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+qpEjfJx805tuNm2C6NHpbvUWJAr7lGQmlnboSyzzfhNw1SVBsPaCRTu58vHrThcpXdboGSe/mLh5gGhZUcdo@lists.infradead.org
X-Gm-Message-State: AOJu0YxAwZdgcTRL7bFsztJNklwKaG6eagKWQZ9rSdZakJlNh4o1qJfY
	S8kelfdLD1CV4zzDRleD73O1RBMjyoijOIBZYVYpXLhXonlvC0hASbLTPJARwLfGFh3fVKCIfY5
	zR5OCGEN/PJ2EqJJksn7qocVC81MduTAoUd1DOazaxCCf8w3X70Ur1IjgQWFWxdi+ad5eIBcdpj
	CdeQ==
X-Gm-Gg: ATEYQzxkxzDPfAsotxTd/UsF6e0IUHt8D+AJzPDR+Y9SR1hU659LbEwpOhpbzAJt3Ro
	7BP0z0I1fl/rNIAGXxvVaHJ5r3xWnC+acU1qJtX5GuEogfoEVbFRl38KmWcCJeU0BJb6ysndkl6
	7L9201lzdmz8u77SDJcch5xJ6CAxTkV+W70QOEuKGrzU0RHiguwzmzQqcURsSy2A8nbw7/CMvW+
	d8f5XSq2me6Bgpnv3XhNy/+3HVlxyKmxlvo8cq0R25/XoGGILRiGf7ZZTj6/NVcd0A4lpuYHRo1
	0wMcTbwsVDPOZfRUsBpul1DaACcCa49Pq6iRhb6bVgPMqEeOUIYAY/3Aebi6nMtQyeF7zOj5TjF
	37I21cbszT4Z5MDQPqamItyxm5Nj+ZUixTcyYqkk2m/5UDpsEckR4Jx8QOeyBlEHrpgLRof8tka
	P0eHq2BBJr
X-Received: by 2002:a17:90b:35c3:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35bd2be82e6mr9172200a91.12.1774259414370;
        Mon, 23 Mar 2026 02:50:14 -0700 (PDT)
X-Received: by 2002:a17:90b:35c3:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35bd2be82e6mr9172173a91.12.1774259413891;
        Mon, 23 Mar 2026 02:50:13 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:13 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:30 +0800
Subject: [PATCH v16 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-5-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=QEOSRZFfoBp0jud88kuJhTiDDDkzmK/bBgbOz82nCMck9HgEPLrVRoJ18aRIKgPGe2aUeK3vm
 mjSYkANIMw7DhV+ZtEsVnee9wwsAtCeKdfPHe8nFQfIwEfwpDdh67OI
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c10cd7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vXjh_T1I1XPQ3Cfw8_RwAznKVlHafPvH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX0d8ySuRUCDtm
 HVHMu+pGVPMpLacnaQKZNHBK2jGLAfYuOet9/fS9FRXuRGy3woyZa4jq/emAJnCkRljVIGhVMFb
 1EGfdaqE4y+FVtFeMG2iresAD5K4i83Yc6hbya2r2cGbkFj6KIhZA5w8TlqcJEj8uCBGaljyiUZ
 DxdCx0ej5ukGTxwDdVSt91nVztyvgHPEVqEPI2Omsioakwy5x9m8WanjB+84DuXKazdePGZhEp7
 ED5VAEQtbE2Keg44UGZ+RnPgMAilU3h8/IG5UveA6dkK1fzcTzqryVQB8I87/gU6HG6M9VNOO6Y
 NF5u5wLJvW3trbXHwoCnTNIfbsCBNta93UosIWoNgYA0R37Hd9SYcnqT6C4G4ngemi73rS8FZSL
 suV1j2aMxJgh4NSxWesPLZcJgSqaPgxqyO12UVdfSXuLHGees5FXJI57DFtCStFwhWiOvbY8qtF
 HTgXODB3lMY7YQ9bu+Q==
X-Proofpoint-GUID: vXjh_T1I1XPQ3Cfw8_RwAznKVlHafPvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025015_729263_6E735B31 
X-CRM114-Status: GOOD (  14.33  )
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


