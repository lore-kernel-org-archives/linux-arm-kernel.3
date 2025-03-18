Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4635C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAtwsxfUy2gTpQLlYYW3ylpjqCJSP0QrrvqtqyhugxA=; b=HtLEy2L18aCdZUwycUGfBNPCnX
	Wd5LHoZF2D3p0ilmlZ7CrCAMu4frdD2Qd+07uLuuNPiPxM2mgGxvPdrt1+zh2XSd/KOuv0MqrsASH
	SIuqF8s0LikSZGBbVYgsDEwC94XJstGxNuqWM+sDGOzoluHJKq1HOUy3vfRT9+3lN3w5fquEjMNiV
	SABPzJTmgf5aayKpdusKIssmMDlxb3mK0A+LNN8ybyDhG+TPA+Vw2TYDP0jZGgLY2y94l5G/xf6uW
	7ekxbfliWJc1i/eccsrYyAqxoyYApPonevOl99kr38+uMKKRk1NE6/1yC4ke0RA5lbArq5eYWqDRK
	aaTvi9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuX04-000000061VR-0WLU;
	Tue, 18 Mar 2025 13:28:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtU-000000060LV-2cTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IBRB8v022098
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAtwsxfUy2gTpQLlYYW3ylpjqCJSP0QrrvqtqyhugxA=; b=E4eceMAWwjE3gn+4
	9k9PXcWyA1AgiR8rG/BDnM4GkpCN915uBzaOab/8/Yzw61Vr7b7LYsidOUj/N+zR
	wP9tiRXVhEaHE5ivJ/3ba5fxnNVt7BH+wTivDU7WNyPiosJwROModnqlIw9sVlWG
	TYA2Dni8QUtsGIQStl/qNsKm3leuTbDYrpGaoFOB92laJSDlU/+ADhyJ3KKehWtg
	Ay8jo1h+RUKoLbRzQxFh9Qiu5nLs5dAFHqKcSXl44Dbbz8VO8G6UJHkunZ/jF7HW
	laBSw6TthaeYhLy7KVDX4XVFhV+N7wVbNFF8MvPZw55sxZYhupIdSeqaTD0ag8F0
	tmnQ3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx1y7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4767e6b4596so107735101cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304126; x=1742908926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAtwsxfUy2gTpQLlYYW3ylpjqCJSP0QrrvqtqyhugxA=;
        b=Zb5JZ3lPg9Xe38NADCiBsTYGSiAoPYbqtz5Iw4tfXMPQ+JP3yJ1AdAh2GF/nD6OS+z
         0/pCg98lFQCzX6eiK8kDzEtgvuBXCIYoSi6aDpcf11AsatiHg4MAXGF20zoDkOblpOC6
         TF6AumlsqqmL+ZHm/1/8EQFX9hHrL72HVmR2VdVYeHkPxRe0pdj3q2n7bsiQhFDJjBNt
         Vklds59XItJ1A/mmSQxgyVSilaTjAHN4TNcTsidKahCBXypcSOiiO1ACQvu9JVMlZNAp
         frmzrrQ660DWWZS49k1gCv0MwRfut3MGbSFjGXx8oZhvPlE6WoeqPYqn/mw6JDsvTHh7
         /Zjw==
X-Forwarded-Encrypted: i=1; AJvYcCXink70wIj6IA2Ge2rS1+LBQ/xAw4GfHYPJxB/a5Cr5SmG+KMKJwCsNZ6f2qv06G8nNhIFYFTg5okIaxJ4do2VW@lists.infradead.org
X-Gm-Message-State: AOJu0YzWEOHtRgo1FbeMOoAspvlVNXn5DxLTsUBMFeqwF3JW5lstK9UB
	BkKUUKTECiyUW3/6fm8gNM7DN8nsSPSTBQ/2xTRkcNtiWTffVVn3DIAstrsSmhmEkoLPyx02ZLE
	R2UOdv4RBAoueu4yg4j6VOvjtMhqjPTiMqJMlAqwCknvx0+Y7m7pyh8BP+SQ5wPFuR7nBwAxB4Q
	oJdFpEYJJneD0=
X-Gm-Gg: ASbGncvPvnRrztMuET81JAof6b8TDIzbGIVjarEhO1P204zwHSaCXvIYhtbg9VbZmWL
	mC5vYypTVtegpaHBP+OlZAaZ6KoBkBZyZ2Pnp2MxqjadE8LDPltC0EL9mZP2DVhWKpqGQuODAeg
	iMwlrD/VQqqY3tXumsHifFXsu2jrTYZqxx8BQAxt46zYGbNQvKNj/LhIXGmYbB1LnmLINdMPSRF
	vnygkGjKCGEzC1U+Jh0z/sHTeB/CVS7QBXbI+mZ0OCyadCx7VReHN3W3x2AEJruYJazNFT+w4Ln
	u5d0LuuNxzS9nStIeBXr7TFvX4pkiP2nImAaUDS75LuA0ApA04mZosEkIERYehlotS3dqPTor2o
	g4a7t47jPcmTR20hZHH1etks/NbgS
X-Received: by 2002:a05:622a:24f:b0:476:671e:debc with SMTP id d75a77b69052e-476c8130f35mr281110641cf.5.1742304126005;
        Tue, 18 Mar 2025 06:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEU9lOj1qTTE5tT64YpKYWwG2VXGSpUsxU9+d1bPT5O25rH0OuaNfzj9yTte96HdsNCPMm3g==
X-Received: by 2002:a05:622a:24f:b0:476:671e:debc with SMTP id d75a77b69052e-476c8130f35mr281110291cf.5.1742304125686;
        Tue, 18 Mar 2025 06:22:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:56 +0200
Subject: [PATCH v2 03/10] dt-bindings: arm:
 arm,coresight-static-replicator: add optional clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-3-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IdMb/Vr8R2JezLV37Ye2IGcmsaxJ+uBDzF5RZDuLf0g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN17aKshhsSq364oUAKz7IWL16ZLciyW8lw6
 3PLr7UMEoGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1WirB/48li3Xo85DmFuuSqUvYyudkl3nFOjZdyrXT8CTQUFjVXr33H0I+LrxKT/h6ahJPTmvclu
 8qLKBN6w7qlO1fD6FslYBto5adSHC98+rCFoJBqY4BDvD9zv0MKAqHV9A9m/jWPJXXI1+8gKw31
 J7XpGbRtEB7d3tZW6T7vEuGtI0vQmE4WVb3vQfzvCk1ppnb+3x0XNdt+5D4Pwf0t1ssQqkm5o90
 WgAxgLQG7IfToEYLCu9gSgNIj8xP0LSgADzSRaJpLnmvsJy0YM0hgsskNEQ2vxKNeE0ty8R1zeP
 4Aj1GNoLW928Kt5COlhNBPqJ2EKkqnW9dhhFjo6xfKi3PXaE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: PpvQ83Vmx5cU45nRQVra2-T1ByY2GKID
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67d97380 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=kFHV7R2MqMk9-nUzAmsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: PpvQ83Vmx5cU45nRQVra2-T1ByY2GKID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062208_675592_CE56B8C1 
X-CRM114-Status: GOOD (  13.60  )
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

As most other CoreSight devices the replicator can use either of the
optional clocks. Document those optional clocks in the schema.
Additionally document the one-off case of Zynq-7000 platforms which uses
apb_pclk and two additional debug clocks.

Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -30,6 +30,19 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - enum: [apb_pclk, atclk]
+      - items: # Zynq-700
+          - const: apb_pclk
+          - const: dbg_trc
+          - const: dbg_apb
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false

-- 
2.39.5


