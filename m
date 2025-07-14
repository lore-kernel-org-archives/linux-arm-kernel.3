Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD057C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+EDEHFqKkjGqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=; b=4K+B5Gjo/tOcsTh/dDd1rY8rNO
	XC2a3/LRIvXxnJTZRQYwqafJlFyMCFEXy7pmIjJk6FTn19p3M0YcboC2kB54m5cI//Cm1d4kDeoRb
	hIMsliybXjB1xoyiY8y2g6BoKVi9MJ1KMw1fV3odERdU3VYA6o+GUdt5md8kmoZt4x9yAnT5mYWBC
	M2VR6uD91mJTYpJp+/t9Zwi9e+Yx7Ot4cpGd/rvtbkH5W4dIeRk3UkVvRKGHjChwKaEptLthSz1FY
	6vEPgu8mf0N23YrKKNpPeJe/1VDMfRqkVCvLSp3X7kH99K6Asweb7WcPU4GYUlllFD8K9ddzS811Q
	tGJVeEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDNl-00000001RN5-26NU;
	Mon, 14 Jul 2025 07:13:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCjR-00000001MPq-4Bso
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:32:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DLSiKm018876
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k+EDEHFqKkj
	GqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=; b=BzaPNvSOtqARt6VACorz/zvfbzA
	b0qI6FZV7SLT4wlmUKQ0twErYA6NiylGBckaVy2+2sDPTsiWFHll5YtoQ6wNp5uY
	LxngP/iTZaMCH1U2jQC+eX7eD9WwPc7FT8NI6ZZvVtReQSbaPLhdlspmtR0NLf/K
	ahtgfWcJS+K1FxW6JccDFKGwT2p5YKbyU3lYFCCKS1AjBz19IEiFuVYK6YrPlzAx
	rG4r4WNsMzer2602CUK/uaSNLWRdd4/T9CZ/rp/8/z7PMwmFzMPSKSJnkx4aKg5N
	ei9DcjajcjQczBjw1KUfNbDvgYRm5ssMi0sBiXv9OHiN4T/hRmAaq+6mGHw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftmbh1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:32:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b34fa832869so3959520a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474728; x=1753079528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+EDEHFqKkjGqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=;
        b=dwhQPAWEjKsAXgnJWNEWqoV25IfJb2P+3bGGRqtElZrcDjZkFHm+k2Y4ZOpwM2exAe
         w/zz7GvqbahtEwqeQpQJBCjxh/K/qECjVwh0E9I3paRE7MUmlREO6vkpi+dD3QVDxhRf
         iznuU2KW/drmPldAq3XYY/NKJ+jgB5BOBFfuD8fDWxhboSltsAYhCKSTxKBAOTW6qE42
         KgRxjl1NJTdnjrEIJXjzzP2QTAsaO8p2zkYioKqmtxauBDKd3f+2v2znAEvyBJCgkxyv
         cbDSXNhcVP2haT+MgLz4t4EFvgKElM2WQfcXZVJGeHNDCcR+JvlGDH1oF9gFvWstbXs1
         c/zg==
X-Forwarded-Encrypted: i=1; AJvYcCUu8RU+3zZgNvXMeOsZA6qWL1Nmgb1B2YqPhy4AJogGW4d93eaCnmiNBJqW2eMwndMVISIwmEcLlGtr/o5Xz8wc@lists.infradead.org
X-Gm-Message-State: AOJu0YxfxmBKUt0qJ744uUXBArrVnEqNJYo4fkopY9bP5fKt6SH7fyVj
	Q+7oyL017UWBP2AsDkZHcbe+GlfbmfsYR5TylS8EkkYjse7feEQ57+ct96WDxxD98qlZB5FQsRE
	uWas0wey0NPiVzCgr8T51cv8WIF0dw4sT3H86c0zlJBbeg5fg+7/sLaCOvhvXbKsszgPrf6trlC
	xw8g==
X-Gm-Gg: ASbGncuIMGcBKvNDhA9RjxZf2YIc0LNE2icEp2kRR+/KJfbSXJBRb6547aWpo5fCJsI
	8cmcj3QTMeEHlc4Db/vutVrIghBou7qHanc3+1T572zDR8kV3czmHHrob9qB8nqxzz9Mc2oHSJu
	2NbikMqvW0kBZzOgQVpxQc5jRwYsyUyw/1GuUib2V6rcYiAfywUlOJYKwolot9AfNaE4dG7fQ+w
	w7C0i/gttKSpKwUZkB5klv21MRrM+ztm/VeuMgB4C7BOTXVZobpLGTUx2rc/RyNRK37ZHuMYJQE
	tKZoCsnXgFEEDRy9SlLWGD2kNmIG+7cAyI6y0FnTU8JoVcO/EmUVfldfpEmW3JIxJOMs5UQHlwN
	hmVEMYsSr+fwyYqPYXwia
X-Received: by 2002:a17:902:d512:b0:236:10b1:50cb with SMTP id d9443c01a7336-23dede6f4e3mr166291965ad.26.1752474727913;
        Sun, 13 Jul 2025 23:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZiMGZ2Um8rFarD1TkyOaULeiLVr8nn7BvvzuTr6cAcM5dJp7mM9PTOufZBS7vQqZLdLPSoA==
X-Received: by 2002:a17:902:d512:b0:236:10b1:50cb with SMTP id d9443c01a7336-23dede6f4e3mr166291695ad.26.1752474727509;
        Sun, 13 Jul 2025 23:32:07 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:32:06 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 RESEND 10/10] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Mon, 14 Jul 2025 14:31:09 +0800
Message-Id: <20250714063109.591-11-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=6874a469 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: M5D1LL61XVEiqv_sADAQO5l1IfMOw92r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX1GqPS7fCldqG
 lqdZdNEtBEpx+uP9fd2vNZANcdYBKQo8xVzGe4GSeViWBiBUxEV/u0aU1kEOUUaHAHzzh/XLx2u
 9ai5x+s17NmOFD5XG/Hp607M/uwogmre/+oywabXthK3DcFK1mYTKNSLfkwYJZIUPPgbK/6lVTv
 AnZac3dQOV6MyFi3vIke1INocH8jAuXfQFKbixUDfmRWSGgbrZWmJ/4+hYxo5+i6jzw/8Mx9LTP
 kZgytO4e/igmQokUye/0dIWY3ZiQnjG+WKpGhi1B97izcPdk07P+BaSeBEcFeGnhvo/PR2zCEoP
 oR3nK/Wl+gWLAGNTBUaYv1+PAO5z5XhnXzyEKrP3pr8lRcDrL96PgzyOZFGeAMIJdngNmsRLlsz
 dVFfzmUxd+R5P9ZmEbpkwJsAwKwjbTivMNCDhZ7tJSYzawZECEShuG1yCOJ/rJbbVEmL3Chx
X-Proofpoint-GUID: M5D1LL61XVEiqv_sADAQO5l1IfMOw92r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=878 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233210_150380_4B309671 
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index fed34717460f..44da72cebcf4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2762,6 +2762,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1


