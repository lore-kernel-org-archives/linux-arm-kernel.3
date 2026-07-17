Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A308BC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=1FPVy6KfsitVI8p0bH+iaOP3Qc
	bFpkt+McKai0EGTEQomYpXzbcu7xs5PMwVLXXs5YopoBZ93OEHWCac0Mu/Q+SvcMDTkrK9sL88klD
	8AzDoWkFfnsyk+pSYLc1jqEicj0Jg9flCTYSPuydX0CcvM1GSMPBogkBdSAtW0cyVWjfrtLBSa6cY
	lgkBVH4C+QuA0jX9EOKZyG7S54EoHMJzzI+4nO+eNw/tR67ohlJHzys0Lp18eumJEEYjauOS8LBxV
	itJjKuIwtfOuq24Z93NhQHstphMjhYJU9HITF06kMEM8UDY8SSNHzwLlebuOTgHs/ziz/fvsbb1Li
	Ac6yKSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3W-00000001SYa-2M1o;
	Fri, 17 Jul 2026 07:32:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3U-00000001SWu-05wO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:32:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cP581018913
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=ahfIn769zSllGEhh
	u/lPblN1sd6MCbITTLZK0gGRHLSBZZ6TVyQZRalrius+Kmh49Y14pFzJz+64o71H
	WFAFtAPTy/wVOxvKSdXRdlslgy26x7NMrCextFSesvCmjCQQzDUuPOWWUosWxNNI
	gicFzdbDhKvADzLSaLsHG6C4zOCnRguDwEBrVD+RbqDmGErasELe5FQDHq2vPpAG
	CSFgvlotpT8AIl70/OMpUi55BpzAPSWnXwBZf2dkYr9WizkUwkevbDTN1ffSADFI
	qt0V4SyQTGga+TCTMdXB+6JaXbMITVl7U5tFRjiLBQuQXcZ04hOBdx9At4uF3u+Q
	KLnqrQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff8107jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso80557375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273538; x=1784878338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=jr4WBZnYQI3O5qgAxb7C35zhkj25RCtB3OrjldAOoD99bZXVlfyOBWLoJ/eavUsFwm
         os0C7/BxKbthsjmszm62pPin09pfE0cdeGkW5CBPX2pnttNHgikcTbuSZX3DxlI6GQGA
         OMEvMVek/Q+YfZqwUDK0g3Kd9xDFYRA6wUuO3P+IcEwr0BRJxUx6ecIwxzCNZzwCDrPY
         tUxB1TzJiMxeDcGpGLYMdjHpmlKbwuJjqgD+DY3S9WJ3oAVf9GJtU+3xyTJPxaP+G7QQ
         sHZaoKFiAQtLUDOcTJPqjwA8dyTu9P/WqGsWuvietoKfO6y9BDSuYxX8vqZlUHrMXWfO
         O5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273538; x=1784878338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=d/zoZambcMXKRDFPR0iSg0qk2IxAgLZ4k/BaFINTdOPQyznXrHkUvTrhRzUkd/KAdZ
         ux3Yh7swn6HT2qJ39W/vohZI1bYEjtgI1NlcaY+RTHPxTBHx2PZhakv+s2FyLE2loAnL
         LU4H1kwKQTYBKqCXUbxq9WyA3rxWxNpAfi0Tz4HAeLsT8cfPFNKYpeIxDTvnE7+MUJsL
         Dt/55AXnj0vVIrSXCPrBayXUoh7Hjx5kl3go57I6nHT8FV9GH7Ut7k9pRYB8+cvjedap
         DFoWj8nn0UOVrFDZHen0Oy2Go3AwAxxPJVR2ywXEOrsj8aMOPjWPdnDr9ex835Hp9uir
         OowQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBzk5DooEIKFXl1/l5/kj93V+AYga+QhKKa9OxcPUyNXrGIgdrYBftr+uOGwtmVU23JSv3Zhb6G9MPtpNXi/M8@lists.infradead.org
X-Gm-Message-State: AOJu0YzqyKu/bYU8E39KeSO/uSJVJA4q/lkjp1CB36P/Oc7LFOzMC5oY
	uF2pUPjg0mbrMrETM/77ax25hAdQfOWX1M9Z0hkDbG70G3B3vcxFH1FPHOFJabXceBdgqJIbR1C
	dQ/7glfM4Ch+Q7a75vVEJoZfF/coOb5rbrWzKlugMxKR8ovhgEE0NGJ6wt6HoMZz0Pzoak7Iw4r
	jPow==
X-Gm-Gg: AfdE7cntSDFRtuG32xMH+WX6AdTdUiPL9D5XL6pYWYzhZE3lKpr3UWEaPeTxX5AT2Aj
	rfsBC++wohnxzrHyGbflNCUYjJnJjxrlMo8RPMku1s+04N4MpI9281PQvMkrgMXuLpA+PTTsutu
	Zcbjum/I7WVlYyS2oRIQSHOr58P+bIS3+MntTWaLP8z029ps4VhQnvQizhZeBVufm6BQAo018e7
	fXSYR5dOYBOZN2/NzLO6h4gzZO9pQLseTpMhXFt7etG/fGuGKWL15YXp1knQ7KJhjRzdxqk1HOe
	ei4YpJGvYDmPiaXLG/6YjJWuwAgn3Ru9Ne45pkl2lSa9eyjzAtrf5+Ugjlr/gILrFXBIJ7qpitQ
	u4zllUFS63ydDMVohJKxNzQe/
X-Received: by 2002:a17:903:2f85:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cf349f4878mr15268325ad.43.1784273537959;
        Fri, 17 Jul 2026 00:32:17 -0700 (PDT)
X-Received: by 2002:a17:903:2f85:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cf349f4878mr15267965ad.43.1784273537506;
        Fri, 17 Jul 2026 00:32:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:47 +0530
Subject: [PATCH v8 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a59da82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ySC7Qw8d9VsJ4c5T9TXQA6aN3MSva57s
X-Proofpoint-ORIG-GUID: ySC7Qw8d9VsJ4c5T9TXQA6aN3MSva57s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX+yIDkvhoJvH4
 WcU3cnXJbSRpBriemKzS8A0gMrryCGYgX+zrLTiX5x/dHs4ZABaFPN/sutKyixcwClC7HoX+N0I
 Xlwq0lL7yx+WKYMCotYXx4k7qJdO4oWq5DSzL5rwt35bQGXGZ9DpfUQdaOKH0fHWeKRSYl6Jg+5
 OMnJrD/FTMk8/ugVPsqsb+KXvzP2gFUoSTdWULGYoY5ey3FY91WEgRzkPUp0SbnVTe0a7kNev3R
 kaM9iLHP/+zOSp/fxK0oLqlSxBrPtqGhHU7l5n4FDRK6m4242aBJrR0Z73KhP2PG6IPpWCPp381
 Qni4r1wb7ucBrCCtBW/ULtnIvOiKudSdjfov8pFswcMsxkcZ77El14Rg0lyiK5VBDmYc4UJzMhq
 xLpw2rcuOHCxuc4CzodkTs8VjWkspe+hCf112+3yCusISJfE7mATxECtRTVdDjcw8sEAKDX9fo8
 9Iay7fAsWuxgfVny5sQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX1E9SZDwJZLYZ
 1l9132BgyzcffgZDkfO7xgb9u/FC22F47rilsyox/66MxZWHxtPNfW7PPj7hs5wW7B0gW1bn61/
 oJT2GAifrVaFQWZdaQCPOWldqj8+mCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_003220_193250_977728F1 
X-CRM114-Status: GOOD (  13.02  )
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

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade64018623e49623462c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


