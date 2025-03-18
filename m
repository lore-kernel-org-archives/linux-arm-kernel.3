Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C18C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=; b=BoU9+HJkLEP09973oN8t5LeE3p
	vtRElBGy/TkBbINGzqMUMAW0NGiTTVS1nKeUAXu/y0lVOxNE3WyoJDc/HgTG6ahCW5Xx6hWg9wAi6
	KOUXDDLf4tkiWd5kE6svyOqZL559a0oDrrH+3YMtaC3j0438HJGBy6wrzasQQV5msrBM39Emi0Puu
	1iH0dgUMa36FXk/NV548OoaXSttBi1tLKjVBU+jqbmY1Rqd16AsGC2FcksQ+bmePKOOiBXiSwqLng
	a46yCdD0roHotqK5htojy1IUBxWsUOWfkXtnJggQXVBSxg270bnS8jKnGpzFYF7NJAm0Mjygh8eVE
	fx6OMlvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXC4-000000063IQ-0LLg;
	Tue, 18 Mar 2025 13:41:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtx-000000060S0-40l6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IBf0om002325
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=; b=LqcDrKJWDWR39x5w
	dVWo3BD5DFu3bY8ZR9VASJLckV5qn4RXK3z4sIA1mJ06roz1cXizmhhClfLVj1+Q
	VdNGhjQ/zXoMEBHIqAc1PFZ23YULE9Cr3ztRPcy+82NQ31acR64XepBBwS2bFFVC
	QJc0dGbMmixU+54RDONmm81JCebs+8n75f3kQ0TKJOkvZoFa7rx4nkE14VSDSkRE
	gJGugN/R9k7ba61Km/ivRAUE7SavwcYjL8dnw2Ij4olj2Xn1rxit/cZ0muM6eIVr
	SOBodE/Lqyiv/nMFzA433N8szA1u8Ip3V3qbmIp8xKYlipCvltL8xhR67TpS7K/h
	yn0aVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f010htqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476aa099fb3so186954651cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304140; x=1742908940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=;
        b=T7rTKz8O1NlRkiMR0C/R/Stv8j6s+Svc1YpHVnVQRkCIGcfjRdutS6kc7UFbjU5Nbb
         7eUPaT1PX2cyPNyiY3o/gSjIvA5lGOiy+306+/GsEYukITHBp+E/YdjC5kbIRWBHLPzj
         s5YypLsLs1rU/59sv/gWRCtk1c7FbumBlGKbmV2mC2oNLTl9yCYAQ0Azlzhi/FDtgjCw
         DBDPcuMJu5I1HCZh79Zt4Gw0TpGZusuNFn9irvhT+hdF6ajcR1evlVFQKZntpbnc91gW
         8sbkp1gMP2h7v1d47Fgzv8yAeNTgaHB7Iy5qlxARFmMY2aIU6BJHeyRxXZZZlzV9FGUF
         yjtA==
X-Forwarded-Encrypted: i=1; AJvYcCUMagi3CmAj5sorkY0Ggzm544wbUx0Tp3EQihTSBGW26bhJWZUwKdukwQs1817tgFxKM9uBmNlBAMxJphFpJ/T1@lists.infradead.org
X-Gm-Message-State: AOJu0YwqQ4qq6xlE0jJvk9lFCx4jSFuskaiqYFHYk0AVqHSmCbGJ4gmR
	2uRqbUg4qlEhinm9zsiEv3BYinJYmF2FvLc64j2yElYwLurtthJuz0YmHsCnA82x7rUZah8QEPq
	xb0EKQOkjnzSku7i3jsarFWg7qxogN0VRqBHSov/tS9mSdVNqQ3IqwbT6lD2i4aAFo/dW2+lyew
	==
X-Gm-Gg: ASbGncv0xPDDp8ZTwXUSQrphNqL2q+X1YQjBh8gL5VS0GryP2bX0OY+PAQmyJ70HQ6k
	8zio6LkFzbdTY9xOlsFvHlkubDNQnPp+Kwld1K5/WQF7bvMIOyuDMh58Q8W0fUCNXW+zmgwqP0t
	M5M7YFWy4Oub/qALPc00DJhgdSZVs20XgxRtK28p7Rj+qSiiruHaIIhzJDFH+MYnUWszyEtaoIH
	NCXCo4fSPu5389/ik3NwFekZ/gQ2A4nCQGLIon2zocm3XVDS3WhDRpKAgWWmlot+VTbXJ0nKa3q
	0OphRbYJ9XVGpnZcNz2TO0wm31eB5cW8ENbTe3ZhRfid2tQHTM30Y7MHHnEwFicXWHBg8j4YhEn
	MAmZGV2mtvKC9FZwA+M87FCmkV0qA
X-Received: by 2002:ac8:5802:0:b0:476:7e72:3538 with SMTP id d75a77b69052e-476c81d8e94mr316429311cf.50.1742304140094;
        Tue, 18 Mar 2025 06:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwyFkJjOgyoKomBt2wYBMfOH/z1hPsNpjFOhgy61zIEiVBQ6NRmiZvk/992/PdhTpr5TKEQQ==
X-Received: by 2002:ac8:5802:0:b0:476:7e72:3538 with SMTP id d75a77b69052e-476c81d8e94mr316428741cf.50.1742304139749;
        Tue, 18 Mar 2025 06:22:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:22:02 +0200
Subject: [PATCH v2 09/10] ARM: dts: qcom: apq8064: use new compatible for
 SPS SIC device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-9-bcedd1406790@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rGO8ljRJj2lTMiYab3pEL79ThIPqrqw2LC84J1Wlwas=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN2VlgxbD3pLVZFmEWmBFECbSfg1LbnAQwzl
 9Crg6fK9pCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdgAKCRCLPIo+Aiko
 1QPGCACpysEPjxlYldEhFTaYVNzCM1Sc/vDP7O+jCuj3Hs3CN+4o0HMa4k9V/p38QfeW2BEmEcG
 KVmH1uIBVD0ss2Uwy/8iqXQc4dzUNB188/NwxH2Hs3u08DTqhf3GzbwXko7/g21D1pJkxlGEvCs
 G4SvhXRsBAcgzprYbN4GYTpmjFfATfjXT5U3xNQzvEQvsIFNBoFteNlP7Y8gzUx1xgpZKR6QNxM
 nQOLiBulGpduDFsPUDpB/nL5JoeSZs4qoXbW+jeeQG3FIDmki0o7XYO+jhYEZSmPzSTeARYxw0Y
 Yiz1ZcvjNRLgxItgEP/f8Vt83nPbP7PnEfcBnPbwYzMN6FfC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: azzqxu9AnDQI2OTmRn9mUpdnAYYw2aae
X-Proofpoint-GUID: azzqxu9AnDQI2OTmRn9mUpdnAYYw2aae
X-Authority-Analysis: v=2.4 cv=G50cE8k5 c=1 sm=1 tr=0 ts=67d9739d cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=p_EMIZExALG5VSdhSekA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=638 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062238_002959_D595768D 
X-CRM114-Status: GOOD (  16.45  )
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
index a5aad4f145dd368aabed44cf520ffc037018b37e..b6533630e347c8fc5e3f0791778cd05760b3f3c8 100644
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


