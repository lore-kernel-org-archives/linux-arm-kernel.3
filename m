Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9501DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0WlV/ORzBoIjlEcynq13EUQZNwykShO61g0I+cym80=; b=SfrjoCwi0GqZWpjUBA913uVQ0c
	pksTsltk/DfRBwBF0ovivSc+K4oOwRIssva927KXbqgg4+OVsuIiaHGLyVBBNLAQQQHtL6vAhptai
	6ViJ/kIVUjHLRGBsPlY6Ip3iY9J2HTKPcBdXledFZHGGU7ikm9J2PFjjItvVP/tjQQg2Lsbnc4xpz
	GKDoAhGbmVB0uzhLSvSYFpvOT3rf32pE/p3foywySCfc7XAH1Npv/so01fXoeuB594brw0wRPqlG1
	yItSGYhLAB1WfuxY6xyGEtCIZQ5UtF/u2JqnACWbMI3ckCc5YJCbqwAlmetAMA6PPfO5iRQmRjDDc
	ipJB+F0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Nff-00000000WKl-3NkP;
	Fri, 25 Apr 2025 18:21:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N93-00000000ReM-3SCC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJq8W031953
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0WlV/ORzBoIjlEcynq13EUQZNwykShO61g0I+cym80=; b=EPQKad8hO+29ci5N
	HJSfcbOEZie5Zo97e1xlAqtTeSokTebKcepERYbR3CIiNftn468nuauTdYuAC4AM
	yxpHX3LkNSDtIyudDRIhAHTt55kTnQkAWc+mlGZQDUyDWRAAxVvuOg1yXLC78vh4
	6MGaT+ofKWo7DnWLlmrqruCmgCQBVgPHgDTH7ZlLMitNshPapGRu1+MHpgEsmrg9
	caVldj/irbs2dMDQgjOGMIwOINIg5POo0w3jNGKwcDZaTbBfVI9LGF5WPy9ygoXD
	Q59l0wUyvWUpDxQgN/p1FJ9S8Fbmkiv6+XK0aaFc/TKXuP1hZMHl8FQfPlecqcXv
	i1srbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy9uv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c791987cf6so511385585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603244; x=1746208044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0WlV/ORzBoIjlEcynq13EUQZNwykShO61g0I+cym80=;
        b=Yw0pL3XAf4JoULk/VQphUhfhgOByW6qSaadkKZmu2nENRFWWPuuElIMtTTz1egzKCU
         xRAUzYTmbjRUhVX36qieB1v1ghJ3VEXa6A/EH9u7C1yGsLyOXqPT7TS2Qsu2zQCwF38U
         PgoR792G68LEHNbe1FEvqDI/d0/pT+msnwsXlvK/3ucAsEz4OKUIlnRMNsDSPngWNx8x
         3e8xWrOrb8esDCxYPt6Rmq9/0ej/kYXL9K43B0UBAQiPtn7+bgegRVuDKIjH/CX3pTFb
         Ye+tmdCOspdULfl/ciUToDLriGlx71augmqCSaxA3h7VXmZxTr8hBiUTeRqGLOlhSyMb
         At5A==
X-Forwarded-Encrypted: i=1; AJvYcCV7K21C6Qb4S93ctjsLV0kw4uWUDfezLvWRh3ztXUdnebdiu7nH4AoWN7ggQh1bi9WifAy6pgHdl/6W4xuHcs2s@lists.infradead.org
X-Gm-Message-State: AOJu0YwrL2jg+V56SXaYI5s/veAogJBux6kkLe+WWNsBlJs1aRdKR6sn
	Xhem6x/rY8eCJYEvbvwBc0WNltx4ALiZ9+P5bAc/uO0e6S2Tcb4bAknL5VeO3rfbtlZSr8Ij4mc
	B1L3uDQ8UKw2N+5L66vvlvLeZTSzojO82NO5tJ7j2z2rjGIMzIl1v3sOX5QGGf3C4sE1dy+trzg
	==
X-Gm-Gg: ASbGnct0ddqtxrHs55oOcdh/d/s3xVBmDHkO2jf0pidzCCEHTl1t6EITDekLMJNvxIU
	lRfrO/Vf2AZOAsbsA8x3J5VixsN5jbS2A5woFDOsMWl08yk1/OGpNUU/GsfGFdfNeAHdOcY940A
	KWdFgKJ43TecNcm9vN6t45MkAD3+bF8tnfchYz4gLgO3NRfPhBZF0scyJhx9jQRWNZA6y949SFm
	qBNFZlugHZ2HhBFa/ViBiML0OL5yLvEKDXsKZ4LNHUvTgAFF0zgfAwNvGQagYVC2bNMtlwpO/mY
	cTRfsmwTdgDnFoSOcVhbsntBDTv0V9DT660zLNFbiHyRIojmPJ094P1QbpMaSuMgOYv9Gi7dRcP
	DvDxpQCh034b9x7s55sMsl58S
X-Received: by 2002:a05:620a:1a17:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c9607a93c6mr549158485a.40.1745603243992;
        Fri, 25 Apr 2025 10:47:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGNeIVbm5YyYTfo1SKrEUDYFsHhFGijcH4+jq9I2UwLvyQSPV6mMmcDq5lpZnJqcOChctv7w==
X-Received: by 2002:a05:620a:1a17:b0:7c7:9aed:1f36 with SMTP id af79cd13be357-7c9607a93c6mr549154185a.40.1745603243628;
        Fri, 25 Apr 2025 10:47:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:08 +0300
Subject: [PATCH v3 08/11] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-8-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FDMCvMj7/PXLNCw1GpXL+w9RnufE1DoZqoZIjeR8HUU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbVivJ80tpTn9sHqosHf+sN3rHhgA6TY50R
 EOHpfznLIOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1dZpB/9dbNHoyODZwnrfGxWAw5+Tm2ncq2NN1i1DpQvJuLY9y/mELKHs60iMFDnQlZeqZpZ7CO1
 XqPdzr8BukLZ3f/b7hUZRB5nl3nkZLm6iWF49Yeb4wDvlogAZmPMWMBUz08mzEFMekHaxYyPk8Q
 ogA5lM5KszNsYIPF0aGP0tH1urvsEAum0ujEOqvP6vr7IERpq/gYqAvrgx7oIjbaAfJ+BluWgjd
 2CqZ3bsmXZBt1Va+6CfVG+3RWok+6PC0s7JrqbwR36bQdNYPj3z7e16aiglwcJzlv01GPRYDFkL
 UrJGj2qd9oH19OfMU8WBVnFoCxlMAsbn+qOyCbaCs2VMTtdD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfXwg2jLAv6XTOi rw/EwPTYZ6dZd66N9X59ZWS79j0yVwD2KB9PeEMyY9SGnA1oLk66Xoyk5/x+uBadgHqVjyu4hmc bM53QN8oW2GCO45UBxcykeW/TfY/r7yeZgW2XkzXUKV07Y1qOqPwFUBNBIWM0LG8aB2dn4B5WUq
 GrYAGY7rLk2LPq5e1pbFmfhavRDFjl7p8KD52aMJwrSyeuI86MbJ9kIzpoM0JPSa2EXSIg7v3Xl oWGsAnS9PZvjRPKVeypTgyFNDxQcQw6GYwcGwgLOHF1xoewhWTBKaPgDsjzPaIFY1QabI/lsUbm 4nmNP560WlUkxD3/3YQZKHf/8XoxmwyEkXxIekcxME3I5+BteBMome8ck2iJAnNyaLZiPSoJhI9
 ehm9vnVMGJW5oqRZTQRMiMxgMgcOMP/kHlcIchjL8QvBzoMyLFPRvC+2W5ZI4xhaIq0Cb7Wd
X-Proofpoint-GUID: 7FtLAueGJTTYD6AOzmsAKICcQRr0xQc5
X-Proofpoint-ORIG-GUID: 7FtLAueGJTTYD6AOzmsAKICcQRr0xQc5
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bcaac cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=rbKIQ1AqokDPPu1yVMsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=747 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_104725_988334_A9766FFB 
X-CRM114-Status: GOOD (  12.76  )
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

Follow up the expected way of describing the SFPB hwspinlock and merge
hwspinlock node into corresponding syscon node, fixing several dt-schema
warnings.

Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..41f8dcde20819b3134c38dcb3e45b9e5cc24920f 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
 		};
 	};
 
-	sfpb_mutex: hwmutex {
-		compatible = "qcom,sfpb-mutex";
-		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
-		#hwlock-cells = <1>;
-	};
-
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_region>;
@@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
 			pinctrl-0 = <&ps_hold_default_state>;
 		};
 
-		sfpb_wrapper_mutex: syscon@1200000 {
-			compatible = "syscon";
-			reg = <0x01200000 0x8000>;
+		sfpb_mutex: hwmutex@1200600 {
+			compatible = "qcom,sfpb-mutex";
+			reg = <0x01200600 0x100>;
+			#hwlock-cells = <1>;
 		};
 
 		intc: interrupt-controller@2000000 {

-- 
2.39.5


