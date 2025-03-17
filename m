Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F9EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIfQsL2iT8Vojwl752N46gCkIs1NOpwnmBShRu8QyCE=; b=qDYw/c6FI7yi/+Y/l8zsw3rOEp
	no3FYfflOWwIPLGwBle+d7T1nvlw1rGVC6DGxC+DBanm5yxUZni2OvPpwAgShOngvuS/qBVooJcgP
	HsNdYgkJOHtkchq00YtyycIeddqMLJtCp8TEVZKqActslPkW6BK2VqFurD7Jw7ZdLuHbg3T5IhkIk
	cNyh889f2d9tjgAyi42l0qDDiVzs9wQgwo2MblVtgPyhklu17+4mEjEaReTXoqw4paiDfq5K/ineb
	JtuMhLLLRGGjTY7H0Abg63FmeG966sTuSAKaF6M2RAI2Vgqk1i0PciRslB5u7tc+quvvjKWLrRcL0
	HAOx0QlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEmg-00000003cuW-3A7j;
	Mon, 17 Mar 2025 18:01:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWZ-00000003aTg-2124
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:45:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H98bo7016450
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIfQsL2iT8Vojwl752N46gCkIs1NOpwnmBShRu8QyCE=; b=ZgMYlpOR55GnVOj7
	fBBw1lk7w+B7mvp39telgV+7q2pQ2PgqVjVzXtvUHuFv2X+p/o4RZTEAKRXocECB
	ouNQo9rS21GzhPkEMNKwjVqfOfkap4OXbFtlcbHuuGwXpbff0bL8RoGIqYUWYffl
	VesEkk3UAmA6qS1hkg7D/KP3uLro1YHlVnRcBzjTUlGr36Od4/oyTrqPUTo7ybeu
	5C8BjLXr4FAE6MEDreSJFznvHEvyZXbf2qPt3sNM01kf23hTZUJAuYhGeQyoilbq
	nptJ7e7gd05Gwk1U9dCvMPpc2+4MVfShexwxSygP58byvgNeiVs6oybcssCU50jA
	PnxU3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2qm5ey1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f64eb467so46067946d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233513; x=1742838313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIfQsL2iT8Vojwl752N46gCkIs1NOpwnmBShRu8QyCE=;
        b=BmHq/BS9ONUar1egQuTlmCPHRSIvYMYmPkZq0+y+CsRuhnIJwQJP2gBAMcwQtp66p5
         6Hd9N2P3dwMk8i/UlfJdQJ+XGJTXEQWaSinNWK1HA3OAeVLorAELyCwKVGxckNuzsOJf
         fgSIFr3K7v6IzXLOmuKbBWWCYN2JxgMMuAqrznVKowSorkvm+MkZ/+IxqSgw6ZUfOupe
         2lIMeA88L9gk3V+X31FSUgBpz3r/m5LI775NqLpi/A5cgqG2gcsDjlRoFWquYZsux2JR
         a9NIngL8OFFcmoIsmpFM/Vn5GacFhFTPwtx7qYFdlH9ykMi1FfPxHkhBIaP+vPSbV4YE
         oamQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL83w3DRnwHhdUnKtAuOLP9p3Kyr8eeSxbFnH7EjmbMFYDu/2ibUEBkFt2H/rBFln/ArwSArvG0qc+lIILaRO0@lists.infradead.org
X-Gm-Message-State: AOJu0YxRRYuzecNNIkFTrVqdPhXZWaFrBwus6I8QLl2/ecTK5ylIm3v1
	LoUvbYAh7lQQqEDj8mgEYNaqYuAOrRK9HIft11OQXtwvPtfK0+D5QHTCrkrlImg2yEyKH6Ad/yr
	d59YdPX49i66MQrWPfYlyJpe+N3XGp7ZTNv4yNClAbs3OvRc+rEEqDjiyAxO9dEYkrAdr/4KKSA
	==
X-Gm-Gg: ASbGncuUPpdrIhv62S3Jwwh1zJrVyEao4om8HgM5yPJ9xM2swCIHOUD9im5ZREB7XwR
	aqc++BfHjXYBOIDh2kzdnvMuY44b3VRCZssduoBZLGxV/uyKj0THQ/E+LLZKe071LLaCoUrH7Ky
	8h5IzQx2WaToZ0Q5mRxf2Wyd4qE9LLHwD2TELQ4LX98yEWL/d5oMZiygGerszh16KCQ5LeMth6w
	+PsV3x1dYiwUQMQCL8p/eI5z21E9pDu7nIBwT3sbwjN1JC/NO6iSRVRfzU2Vi2A/0DRHbz6iIki
	2Kn3bindVa+Wj3XzSOSC/4IeJ59w2JKGjqTrgExNnQNlk0O/tPvpzG3AUdJjJH5GgeaCvCBB6TP
	nOLtNGmTkh+Ctf1PTHnzGeW/BgLcd
X-Received: by 2002:a05:6214:20ee:b0:6e8:f5db:d78d with SMTP id 6a1803df08f44-6eaeaa5a6b7mr224159526d6.23.1742233513528;
        Mon, 17 Mar 2025 10:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYgxdPJBjLMewB5Os7FteoqkvzgM2ai7zlUrwns9EoES+m5mpM+FpX3PxuwQRQFq5RiVor7g==
X-Received: by 2002:a05:6214:20ee:b0:6e8:f5db:d78d with SMTP id 6a1803df08f44-6eaeaa5a6b7mr224158606d6.23.1742233513034;
        Mon, 17 Mar 2025 10:45:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:45:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:44 +0200
Subject: [PATCH 9/9] ARM: dts: qcom: apq8064: move replicator out of soc
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-9-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cXGjXqVy8K2SBVw5sm4rAWVu9NhYJGWmhFXtjX3HVog=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+Hk+AmZlISZmVl7Lpy8dz0TRbk8xjIClt1/
 8vj+7Cr/ZSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1QEOB/9oIWXP9+8fWr3P541oQaJjWj4TBJmLvCUTleczJ/+JGOLGxqemoc3v7V0oXDhOpswBqDi
 WEt/pceqTFyCcwIhooUPzKq4CCjbj2bA710wPPkkSzjyZkxMltoHOB+Z1SDWBd9Tk0hjZX4WZC0
 YYPrAUbnKPrcDFPEKpM2Z8Xlxh4xLbwPKvRBzcrWeqCzqgszf/LSY6/OBCWBYJo++JPbPUSDDTj
 wJMCFMNLkg+MWXK0ssjlsEKwEcJ6rlAb6REz/gRwhXTv/XWHUS3F/NwyAykfJ6BPtCR6Lq42bvK
 BndmfW5J9cf4mJoWj1QPk8q9wYriamZbAm+lwV6u1T3zYgbR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IAsRAdzmDNySXPkupeokIUqZh6n6sP6J
X-Proofpoint-GUID: IAsRAdzmDNySXPkupeokIUqZh6n6sP6J
X-Authority-Analysis: v=2.4 cv=DLWP4zNb c=1 sm=1 tr=0 ts=67d85fab cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VZa1NNXYgzzwgHkDN88A:9 a=QEXdDO2ut3YA:10 a=usmIGj8zAoogrc2OpcRK:22
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=902 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_104515_535473_9235BBDD 
X-CRM114-Status: GOOD (  14.47  )
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

The CoreSight replicator device isn't a part of the system MMIO bus, as
such it should not be a part of the soc node. Follow the example of
other platforms and move it out of the soc bus to the top-level.

Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 66 ++++++++++++++++----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index a106f9f984fcb51dea1fff1515e6f290b36ccf99..acd94f3ba0350c5dcdd8f80885ee643d8cbddac7 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -278,6 +278,39 @@ scm {
 		};
 	};
 
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+
+		clocks = <&rpmcc RPM_QDSS_CLK>;
+		clock-names = "apb_pclk";
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out0: endpoint {
+					remote-endpoint = <&etb_in>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				replicator_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&funnel_out>;
+				};
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1529,39 +1562,6 @@ tpiu_in: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint = <&etb_in>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&funnel_out>;
-					};
-				};
-			};
-		};
-
 		funnel@1a04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x1a04000 0x1000>;

-- 
2.39.5


