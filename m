Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759BFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oI8X4OOQjroDHAkkPzLdr0WBC9OWilOtC8rBPPB07GM=; b=yYDMCZ2CSp3/zr2ZK94eb6tWzm
	QJPm96G4v3zQrGUfHSO8y8QHfy4H9xHXgIEox0GXrGPo7ad3AosPavrcW1/9eszLtP+T+gcE8AD1f
	0N8UBZT5f5OIB/4iDNBRX/QfkVG0xRkIttNLoRwceG9Nrnsc4CAOw7/+GdtQP3/RgEKkR0C/x/3HV
	/KDdiINEiU4j3TXtmgjltRTxCyve8a4Tzzl6YsIiYoMt01uJV/G5bmWrS7R8HMZSwdoQqzIw82+AL
	Ld3IaYsaXyVhbMg+ZIz8Adf5Jj/EkOBVPiUTdyc4gpWnnBBi2yBQ3n9Opi1LM7+40rsrltDn1jK/u
	T9+lNSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEl3-00000003cbI-0Kfm;
	Mon, 17 Mar 2025 18:00:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWY-00000003aTX-2grx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Mar 2025 17:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oI8X4OOQjroDHAkkPzLdr0WBC9OWilOtC8rBPPB07GM=; b=kHNmyoyRpQt796N8dv+HLToGOB
	8+L42YKjwZb1bl0KNilsvqC+IRTwaqCw/7i0gkHRXG3xFjmN/DT2HfewI7fQRWs/Qss5UKfCGNRpQ
	bGZzkKaRmmBZi+pAq2XE1quejPWhWrCesCjQ1m85hkry8+oXYK4xIdhI7sQdZ90U9crsef23UsdFx
	vjM6U2MHdHLAOVthovzeyZBmBD6L7oGyhSbzDtrIMY1ZcVvrBvEXYAAX63GmkrVtYG7yHx6nIY/Os
	6JbhsjYNXxp+XzbggDHR/WT6+GKrAqvcw26hlETJGPjC7/g10vESXI52U7g6LQR+z6R2ZYoLnbFEO
	+PxVyutw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWV-00000003X2k-3Bkv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:45:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAJ8gl005193
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oI8X4OOQjroDHAkkPzLdr0WBC9OWilOtC8rBPPB07GM=; b=SUyJSoRUOxH9Kzpb
	Vvl8fhigo+vUcfa6LVVdpCqsTjSjyAoWgmMxNRx6jSDXAAZctIvwbBpbVrAoWGrr
	r/q/T9uzD7BqenFSjgCusCLpOp1le3Oj/6uJaDrJOzw1ZyC+3v3tsiowaBTLRXc/
	oTDN7qBiBNksunyEKo71xIl2M3wCmYritX7XvF4EpH1XrHOjQtSpKkW7/fFrxjWi
	bX7T9eKtMmEPST43Kt8ywg9cFUk2CYXsYOA22HQuUfSAJJkzV/Ev+bNfTvzmW279
	SZ0JTyCJbINoeGBmLVx+29PJosRBgfgLoFsR3fx78612V6jCvp+uYODMCRVFVanN
	1B8HyQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utwg2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e2378169a4so107266756d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233509; x=1742838309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oI8X4OOQjroDHAkkPzLdr0WBC9OWilOtC8rBPPB07GM=;
        b=OZMwq3e2oOBJZy9W/j6XGnqrB3cJeS8E3ku9zLZlie5eZBxt2kjdca/YIbqi1TfqrC
         DNxUnQFnpmlnVS1r8Vu9YVoZ3a9fwKRZ1CrsxGNkYvBxfHI1Pf6EUBNxywGwdPN2dyKE
         Wi1l52ruGkhJwY5HGaORQYB7cmv/5ff8aSLJmMG/zlcnv9Am2xSBqoP6ebANXPEJr9A0
         0MPeFyKUyPmPsYaBY6Nz2HmvUU5CLZgyMcvELI5dFtHAfARJZfbAW0V8rJoTbJUgHgR5
         UQTIhCqH3QTkRQV8ervhNNM7wp7UlcMlo4L8sfwi0PRpkrh14k0V+h9RuYwgPxR5NqV3
         Mdnw==
X-Forwarded-Encrypted: i=1; AJvYcCW0syCcyzFSRxG/7t/gJDkxmd9QHW6NgIX62ObuvLNVeQdWO5MjuF50ukNJg1oCaMMblhJ0DoWIP86cMXKChzTm@lists.infradead.org
X-Gm-Message-State: AOJu0YxXeBDshiWyGxT/j2svaV61PcN2FX5O+vycKQacxAWRjyi7R/2g
	u6MCkWXoVGEBgRptSftdYAodzgOfZkTCdu8FDsBje6fSIF9TtXGyffTP0lcaBechHseNZEVbTAt
	wz0DalDyvl/sghHOl1h93SlmVbgtAQmCccjA8mH/Iide5eICsuUUBfs96iBFyGLqe1UuZdi3o1A
	==
X-Gm-Gg: ASbGncuSMyAavYoGkx7+x3Kt71kPVHPR8WZll96eh9WZ+wAvb/555PeA6q0ZMwZVCi6
	GKoi0vJoltq6kTPueB8ql0cb8MTMfOuOMmvZ7HYT1hm/SV48lcrs1RidXpQobLHozNFP95JYkRK
	+zzTYFyEg3iEuOxMlPEYAaGFtGHwMzGsVkMiUnXe4aerg4/hvlQlW76gLc2NX9sMH75CtPcRLM9
	iCfsb0YwrlZ6fTnCMM1FbmbGURrh9RYPGHoSgvy7tN3aKvfopTOjglNgonaHIDfA4fvlEsD/Wwo
	Ohm/2Yym+UIDf8PyVhcFkqzGHqfG9RBcJN3W8Kn+KQyhx6BANBUap1Jjy6IvNV4fmky6QExhNKt
	ThwE/qqMgV8jrQ9NcdOdN9VWeVGnC
X-Received: by 2002:a05:6214:1d22:b0:6e8:feae:9291 with SMTP id 6a1803df08f44-6eaeaa5f7efmr173160866d6.24.1742233509617;
        Mon, 17 Mar 2025 10:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxv7impz0+MvxZjln6Fe8dQxZU/4AX0gumYPVdGY1SSFXkkPRf0pdd6esVsnXV/XW4UYLO+w==
X-Received: by 2002:a05:6214:1d22:b0:6e8:feae:9291 with SMTP id 6a1803df08f44-6eaeaa5f7efmr173160326d6.24.1742233509287;
        Mon, 17 Mar 2025 10:45:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:45:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:43 +0200
Subject: [PATCH 8/9] ARM: dts: qcom: apq8064: use new compatible for SPS
 SIC device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6oexzQF1OoJvGK82ren40uxDYNIho3CwgfGuz5+Kfjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+HXznEfgII3QjF7M+kfeptlRMJIBFPK5UQ8
 bqCCEPsXrCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1cB0CACrq2R9bp0kI2bQnj3zv7W6gk+12hq0bs1B/+7+e66Y7Lz958tNrpNvJa13mFJIHrAoNOM
 +i6M1wRCOLbjcrzQ5baxlxr0w+n6u4wiQO9ersrC5DWyYfyZ5ecbTXmUuEyxjitF7nlf68Edtl8
 sez4B9QeWD6QBqVHUmjMD7rPi6W6CLpcFq5cykUj6Y5kZ0Igln8VM3noGo4IUh/wYMkNm96P8oD
 Ai9GhmZhg1Wfa2pno8y3oMqRKl2oWz3K5Pc9m5oBiHCAFN8UyOV648S2i4DY8N0nz8jpyhcAhH7
 M9l5Fs2iqflxej5NdQoJrkjozsJ0jSNT0KdDtGwKwllGKgrZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d85fa6 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=p_EMIZExALG5VSdhSekA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 9gBlZ8BsX3vg2KzGHH2KvUOULN9mnXQ2
X-Proofpoint-ORIG-GUID: 9gBlZ8BsX3vg2KzGHH2KvUOULN9mnXQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=569
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_174512_130103_4C8959CE 
X-CRM114-Status: GOOD (  16.22  )
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

Use new SoC-specific compatible to the SPS SIC in addition to the
"syscon" compatible and rename the node to follow the purpose of it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 522387700fc8ce854c0995636998d2d4237e33df..a106f9f984fcb51dea1fff1515e6f290b36ccf99 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -402,8 +402,8 @@ saw3_vreg: regulator {
 			};
 		};
 
-		sps_sic_non_secure: sps-sic-non-secure@12100000 {
-			compatible = "syscon";
+		sps_sic_non_secure: interrupt-controller@12100000 {
+			compatible = "qcom,apq8064-sps-sic", "syscon";
 			reg = <0x12100000 0x10000>;
 		};
 

-- 
2.39.5


