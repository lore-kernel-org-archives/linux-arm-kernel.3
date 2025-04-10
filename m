Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20467C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+3FfrSNBC0rnW/pbZ1shOcvb9E0aupV7QcxaMUAHKc=; b=CSXGepyzFxKUGGQP4DW9p1JTUP
	UKwSkFOhk+lNN76Z2lwLro/tyWwwGo5TcMuoYn845YZs2XrWdOu+SD6tQF5yjs6qHJTV/f1otPbge
	sUgbwjUVujP0LFDlNf2NOY9WoxPeviP/l/fuMdsT93NhUeLBdronXE/BF8VkXP54IrPrF2bv6sfSl
	cutVSaIpzgiBx4drqsuOxJuCFr/d2xyyYd9whRx9TUwcyvAf2LUdn7FRQ2BvAnnH24Lq4lB4R4N4V
	OV2bLh2mdtY4Y4tt700/M+Mma1TyPWPoCzzzgqI9TPskUyokvORi6z6s4HBwMX2LU3F6STAG8N095
	57XOhZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gy5-00000008y6A-0ufi;
	Thu, 10 Apr 2025 01:44:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gny-00000008wiW-1tTx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 01:34:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HMCEi010454
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 01:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y+3FfrSNBC0
	rnW/pbZ1shOcvb9E0aupV7QcxaMUAHKc=; b=paeU4x0rLxrFhPoGJrczRk4OJ2y
	Pkw0tFRnIMmEg5h/98A/+VlOhzFrX52SRBH18x5nchp3RFQ2B6ceiKBxxrkBq3bv
	mBNbC/10Fbx6Y57QLE6fggGW7O3fEZVrunIUVkCI8+H/VIOTaKGrRv0Eq5W8JVqt
	ifqzInGkFFmSsVlArb3+7HNHrH7NlDrN4EzoquEdTTSonuwXqeARbbP7+yC6kQKW
	zuk6e/EsrtRLEx1Kf1ZnntZAF54mag1bU0er2pGZXcXPHDqiWWVlM5AXkinFuts0
	hvRMU8amlUKkS/qs/G6ZByeg5ax9+DBHa21vRRCLcnU02boa0P7HvJtWOOQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftn2e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 01:34:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af9564001cbso218917a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 18:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248849; x=1744853649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+3FfrSNBC0rnW/pbZ1shOcvb9E0aupV7QcxaMUAHKc=;
        b=Hf6HdIU5BBCB5nr01yxNovIigWO4VcJOHQ+BrdITce80/JQeUEBj6xPxgn15Ugo/wV
         +f1Z6JVFS65rDT5kZR1MudYp6ekk/aeXlhg/txN6msSyVwew3K4zqYzioZhQ45Zo2TRE
         KLM0yd4POc+lVBV5uCm7IB/y+6DLy1e8pGn/OHCEo3o36YWGK0JOL48UrQkhFEnBm13m
         NMB7/EaXNVjSGi8Qy22q9OxbjnXeS7aD8bwOduijn+CWnuqYrj/PnZHsTFXx06KpC8ZI
         rToIC/6tSspP4N7v8bpjYRGJKoXkHj4zrAZpPe3xXvEFxadmKrTTnAL+EUANkkv9gtOt
         /m6g==
X-Forwarded-Encrypted: i=1; AJvYcCV7uAToXw8dwub9kSgGSX6jNpW5REomQtHE1D3DCdgv1t/aIGHm9LrAltZmVhyUkWYoI0tzVDxx/Z27NPd4/FpE@lists.infradead.org
X-Gm-Message-State: AOJu0YweT3WB1DLqGwjs1MKXz/gt0fA3DWSo251z3T5k10QHDow9qF73
	W/fajlcKSbzKU597sUHNrVXe49GCv98IKmcniYsVfo1aeLhzttPoMp8wT+fI0nM9qFYx8YL7SG8
	qBi7Xf9JrqBmNAz55ynRT/vbbldPWqrXyC/1L0LT7aG+7trhzPdDYuKjWgXc14XtFy6dr0/s/ZA
	==
X-Gm-Gg: ASbGncsaoZiwOAAHl4PrYtTx6aZtajx1kUSln/bq2pLPqkmaE5iUiOBgfxUVLo7ym2n
	t0UtGsXuond3Hq8DPjkfxrtpvcP05a1uTifEfhfJe1O5t2p8duy0ufpY4VXbYvL8JtePnbOukxR
	vj/743MdSAaE1qab3ZlrVKsyKqSalqv5AwGPF1I+5NeU7UT+tkK6ITcd0BUuiUziviJrzrj40rH
	S2viJjwfWQ7tdpQMAubWqIgzQJmQW914Z3GTlTtiiSLDwzMrrjV7rj2NCyCJyzLSdwAzPgCHGJu
	LAz1KEzhZ64bS8vbFTdSdVP47PhYbUihKH5Fk6dNflQ+wsacG5lmrRchgGHIuuZSDU5daW4=
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-307e5972f0fmr1174652a91.12.1744248849116;
        Wed, 09 Apr 2025 18:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7MCKoesf/io0c1ClAVPtM1es5MKBzBPeISdJZK2T+emvkEbwBgOvPufDeyPNVn4pVjc0MKg==
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-307e5972f0fmr1174618a91.12.1744248848735;
        Wed, 09 Apr 2025 18:34:08 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:34:08 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 5/5] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Thu, 10 Apr 2025 09:33:30 +0800
Message-Id: <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f72012 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wB5yJZRArZ6K3lEFQq8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Qn6NbNffLI3VEzYSZEs8tJXmeM6tXsgP
X-Proofpoint-ORIG-GUID: Qn6NbNffLI3VEzYSZEs8tJXmeM6tXsgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=804
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_183410_494041_0A6E2B7A 
X-CRM114-Status: GOOD (  12.93  )
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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index a904960359d7..b091e941aa21 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2427,6 +2427,11 @@ ctcu@4001000 {
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


