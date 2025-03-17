Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C076BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 17:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZ4TVLTWNx/gGQLOA3+7bg0q2y6wNvK2yyuXjQgEGjk=; b=HUfL2F9b91OCPApfgGesblOvOW
	muiFZeVjbriWdmbP/8OtnBlquEdC5hGBPGELoV56584Fn5ISZBoQEqmyigfIWATcjK11ZlMyIgrqC
	/ZfD26KXGhFXWylN7hev+zHQKARahHfM4smqR8TtRjZP+jXj3SNDk3v69QQQP/uJGD6TSNUYjRbMr
	8pWwqRXutH4ia+4uTbb/bW7+WTVpyoNrpQidyv6/cozEEXOqXUHUsCo7NgiqKLQdGTl6pNVuMr3HG
	R4i3LDxWAbBY86RZi3VYvEfm1jY7+R9Sa/V7p4OgMYuaTKffe0qk66RFhYvT09PkHpn50MiqJrqil
	o1w8qZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEhj-00000003c2c-2jd3;
	Mon, 17 Mar 2025 17:56:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWR-00000003aSd-1P8Q
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Mar 2025 17:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PZ4TVLTWNx/gGQLOA3+7bg0q2y6wNvK2yyuXjQgEGjk=; b=eePw5kiukOqE9VXPSWWKX6M4CD
	gD26E+VrSwwUizr0Z180Z5lktegRF4OhVO2q0N5TNheC2WPi8hGPo+CRPV0v6y9GKpYOTA8Y6Ucd9
	MgS1X6h+JqHCKlNhd1mQ77hZWuxg6iqKczdQkDxM1YRQA4VCGUV1uADLzPOC315MxCd/OkvlMrPGU
	Om8ltSo2Qp2pTn/t5Y+p9IpKFdenUizEh8ZlESN4l60/VO/MEq+h7bxkE89RchGybHSB5doFjFmK9
	3CCD9BsrRLanrjiWwwwaf40lZ35lfo+hBLlzd5MQe3LcT2jutLvsRKCgvSm5Hn1l+aohhxyRKlgOU
	gLS2Biqw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWO-00000003X0j-1eex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:45:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAMvL8024976
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZ4TVLTWNx/gGQLOA3+7bg0q2y6wNvK2yyuXjQgEGjk=; b=J4Cqq/saBNeR6xDU
	KdCrWM3ZHY8mdkcj8vR59Q2rf5RCerBW1LVUBGyUnw7p5x5hwGkiWW0Ft3ULr7+i
	ui7YSWnnOTNLdtFFkles5Wx936lVAAv3SFsjtB/ZUxr6xYWv3cs4UFu+udQVBJZO
	beYFqSey1eR3oJUhDVaLAMgko4kGN5UmuXl2t2Fh1T/TwrpJqyx/BQRciq8azisX
	VEtchdXjufztadLVxnngZIRxAYbLKpKzkVsVgjyqonsQMmG/torf1UhCsof+Jn1/
	w8FzLXig7wzvX6FiSreKYG19M7m89rhcZjjioFTj6fjcyz73JUPQ5wC2/91mhUJl
	L6gpTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utwg1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47693206d3bso128287041cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233502; x=1742838302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ4TVLTWNx/gGQLOA3+7bg0q2y6wNvK2yyuXjQgEGjk=;
        b=NhprNiLPGSf5RBwacYzk0envxaHGiUJf9xi/WJ9Odjll3Wf7bmRFy9XYtgT3jeex2K
         AUJuGB5LpTY7twtSO4xsx/NqpDgfOLSHC9QU0DfYmdRhc8xrlmkcalmoGQbEzS49A8+1
         ScaIEr3V+B2Jb29W4D6xWcZiCLqr7G//g+jMGG8mDDvsyAg0rognKzQ+CP+CpYIFm8J6
         ArxrLJVgpxG6KMWGS28PP7ygQxieJ/eLo/fA3dI9ehhD6EOIn72VOFnb9XLV/wN+/020
         s8F9/+A+4T036CsuYJHrR5pB20LblO3filWFVesqt1FicmpIeb7h247x/lyAhGQr4v01
         ZcEA==
X-Forwarded-Encrypted: i=1; AJvYcCX95/Ukc1/MA4e+ZzJ+KOSfOzdHknvfRhbfZF1ogn9Vl7EJ3mREZKNBmrmAsJGkdohlMXMVDZjIdHs2F+c/g1G0@lists.infradead.org
X-Gm-Message-State: AOJu0YzmbZ4B4M+MtW0Kk5Q1LbDe4vYe5zFi9S/xUaFWznde+iJ/Y84c
	NZQOilHq7xKK0MqBVak8TR7+yKFPsUC3A13S5poqFx4WKOuXA4SZIdaRNyqQF2Q7+8CoN9Lzzdv
	iGNdP/Q34RVJlHZIBQ4OdMdxo1vACfalmHVDAyFh5tDxE3Pa1WMGO6TSCzenxUejCrg54y5hidw
	==
X-Gm-Gg: ASbGncvsADKDYA+g012Vs5SAHa6LHanztpNLyxgABb35JM9tSCKDminrIx/E6L73oUV
	1LOzBckZQtfy0HEgV3zHz3ogukDxbBHnFYIBA53kXXFL2XrGIEoQ7J/zr+NidnAXnDDdQSHgGCb
	ypQ+bf1J12amwDBMgt3zfYct0BE/5cOy6rS7OOg+ndfKGTrTcWQgGL56NX/OMuu2NlTRgENhU7k
	VxAztTC2tYSfVR89ESw51YB09ea4JyMTMI8ER1ukQM6eyti0l67TYFuAtfiMXnW3dmn2KqZFLHc
	dQktcjqwigKshsM3puAcoKx9WF5RsojmZWvbVRYM2qKT+jcMj6C9t/xNHFu4vLqHdwOv6D3loCE
	0nQcPKP7o+MEsPTpdiqXt2mVvMpVd
X-Received: by 2002:ad4:5f46:0:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6eaea9fac05mr187988536d6.17.1742233502177;
        Mon, 17 Mar 2025 10:45:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbtkhZoh7ZKjpQve+rs4/e9Pgietbgyg5OyGK6q/QtHdKWWg1YEVRp+W9jdcYyAx96l9bmHw==
X-Received: by 2002:ad4:5f46:0:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6eaea9fac05mr187988106d6.17.1742233501747;
        Mon, 17 Mar 2025 10:45:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:44:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:41 +0200
Subject: [PATCH 6/9] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jexDBYn9BNqo5ubVBhdyniVFq50lVyAorid4LoYZ4a8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+HrvJahQkZGPwOjUg+kkUB7W4G48kd9aCWw
 r7W1ash9DeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1RTFCACyTCsSbBBguAPI+l9LhhuDNYE3CZwWSivzYEB+8936g5PZxR2jhNUfSJYvtsA7/yTN3EN
 etytkcTaqPPy14Y3mJaIxfR1Grm1XTWQaIRWHOY6s1K1RiutiCO98ZTLqaLIerm89N7XZEehCSy
 OcXVKt64FJU0PZIABwDELDc8yJs8DNqZqBH98+8e9Aw0DBFnKMJVLwVehz+dcp20QkHJxtmD1UO
 TaBEK9puloembdOTAJ2jlWX4HTi07+l4KPJ1sPmVREy3IUSRwOpslwJggxzH9h7003j1ueEAvUw
 HBoBovqszxUPCunPJADDKteSoyLz9dbcuNk/Vfs3ozzeykV3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d85f9e cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=rbKIQ1AqokDPPu1yVMsA:9 a=QEXdDO2ut3YA:10 a=FZlSnJes_g73BORgF-R2:22
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: D2-e5nmNinj8ABPYBKgmQZCOQvDtWIkA
X-Proofpoint-ORIG-GUID: D2-e5nmNinj8ABPYBKgmQZCOQvDtWIkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=599
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_174504_693588_4673395B 
X-CRM114-Status: GOOD (  13.65  )
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..3728875a5506397b36a4c0d6a5ad12c067bbdd8c 100644
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
+		sfpb_mutex: hwmutex@1200000 {
+			compatible = "qcom,sfpb-mutex";
 			reg = <0x01200000 0x8000>;
+			#hwlock-cells = <1>;
 		};
 
 		intc: interrupt-controller@2000000 {

-- 
2.39.5


