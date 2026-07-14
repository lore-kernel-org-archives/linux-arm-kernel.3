Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA55C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 01:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tp+sv+c71VTdHi1qXlE1u15U+7SzQuSNHRz9AK/D148=; b=DnjxSWHKTLeH47
	aReyxax3LkkfQsJPJRRJ312MePPEJgrGeVxrvRZTaoNnbwXCBUnzcdDn3NVZfbBkSrAvLCKgdIdkq
	Z4vBJIPvAnhxy0HkV+XaUhw4Id6tQ3n4pQEdQpHxY6xIM8sz7rWeFXIQXFuQHCF6sJr3v61WQvDji
	qLSjFIMcTTEg2osufj2voBMTeRaOk8Cy/Np6rUao0aEvTSfxt+xd5mw5lLIPo01MvRGrwkLAWWYRt
	ZZLABBcKGS5d+ymF9GXRhvGKTZ+B3iZiSYlov69+feMd3e9si1jGqSLq9jOsItxwAPt+ZXN7ZaY2P
	5ArxvihoC0wuDP1R71pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSP8-0000000AhTA-0USP;
	Tue, 14 Jul 2026 01:57:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSP5-0000000AhSJ-3DI2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 01:57:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNo0mx2955741
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tp+sv+c71VTdHi1qXlE1u1
	5U+7SzQuSNHRz9AK/D148=; b=Lt5XL7NfRoJOWWR8HMi5u8+L9Bxyt7UKH/i//O
	mk0zDHYEstNElk/MsiQ7QES0PZHqITKhrdr7jARMSK4u2ssThVffL7vrnAlqCuuE
	wLM9ZtHVHg7p+FRCPOtljYj1Tc5Tf6JWl9g/mmwF5RlBjRvpCiBj3dJ5Izwil0e5
	i+7+N3Cn8zKAXuD2lQqGW7ix0S3DM2EredYGOu2m8uXeWCBQAuD+E1AMPi7OnOCS
	ESabFpCjUNDTLaKUi+YhRn1LvloIwSP3+MFf9knwCxeuIwA9N32mK2NEcFJygi1d
	F53KKGBK6YKqnkXnZdr55AogzMwzyw5nrJpq2CoaujSo+Zag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4u88b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:57:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8482b95574dso4710390b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994266; x=1784599066; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tp+sv+c71VTdHi1qXlE1u15U+7SzQuSNHRz9AK/D148=;
        b=XzVj0pmbToJk6+148heDPydCfsFnuy//H0IrLivcTblswkk+RbNH85p1D0YcifT2Nx
         YwSj2h+e6y83Fw052cyy0NnEmJkdciVU2npn0ohClGDLPrt1IA8CXQQhlekyhO6DjMBJ
         mYgJoOPnNKmvpRSV/n1Cf+orQvFfbAY0JfNWuedNsYWNCluA3Htg0iMi5qgy57rAXxfm
         0SrKUAEhMXqGBXTRh7eH4+5R+v1cCkZRcCEbMlikPXrRMBEcb5YZJbJJw5FW+xZaClVV
         ImT8AXdHDKOGIXFf7x6PeT6JmgPlk3YYPDGsTCZBAfGHD1cnxFyRe1K1FG+RJHcKeE/z
         LtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994266; x=1784599066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tp+sv+c71VTdHi1qXlE1u15U+7SzQuSNHRz9AK/D148=;
        b=kL/6+bFM40REO00LkKpteSN8xw+UKO9n7d6VyhVXb+rjKZtkWN2v6LAPNKCj9VGx+p
         vmCm8wOlZGzS7mtyPAjOLrvxLm+Qli42htF8hZRkyEPvURteQ9O34cZ4FpdqdnJe4B9F
         /2C3DgoW/fHpRdU3n9IJAd9Apu29RTlJ2CIL6S0kb9Ji28RARE9TUnRvREOhVg6bj2ty
         GwMw7RFyy3h3bJmJA/dK5WoOVCAiszLhTEMK2dLAemtwgviPOidHluqmPFJpFLtil0LM
         fJaevFQRP0YzRtgCDZjl9RmiOGVIMiHJQsiFc+WDybLOnYhMQ8sVLSuOU0TAp0beeeJZ
         gGkg==
X-Forwarded-Encrypted: i=1; AHgh+RoH97JIzk76GwSzl22Oqzctsl8L4cRYsrCEZqOgGgH867MErq+gWHtZGpNkjnW02m6M+xAjc2lkIDE+17BlVfWC@lists.infradead.org
X-Gm-Message-State: AOJu0YzSgMFJn6wxqgyORTU6JuhA1e62i5aY1vkmA/T8gxBvnExlLBCm
	mzlH2OQeUny1lmfAC9s3U0oA3p1aGWkYRchmobN1X3wSaK8tseVJRd5i4z//8kCFSoIzl1trUGv
	ljOmrtNKIWwB+OFeOjQIj127gJSvDphD3OxsEQlk+gk0g2p7LQ1B2r1poJamUYPdAY9SrYj8BV0
	SD2g==
X-Gm-Gg: AfdE7cmT3L1/33XE393i1neocxy8eXk/8i2PWxaE4Zzm2yI4uFhqm7GniOCyC5a1Gbu
	3iAy6RhdynyV/tIsJTcjxfmxU4Wx+4oO5ZRPMQz4muIrObpOloitrDeo3zyGGTqX/e2r6zvJqU5
	HLW0R+Kdgda/zCWb8RqCxgvn2XQkybgHBoXgVKKgCSiJQTFtAmbgkZ5HSCZZpBcnSat8ParNPt2
	Am9wXxTmEc2sBc72HFWU4qgSdXywVUpTn5Uj3kYLMbYeoXJDBJpiIuI6YZr3FhktLgdGyjWDwhq
	LYS/ii7xkka30+VbIHXkLvBN5359AicMYeXreearzgjL+I4uY5L4zApbeQo+gYfFrniuilP63+j
	EICn63ruYWio/rbNODDdbdKyNPYPVR3BciprwpPn1CclmuLyBgETqrHlg5Et/H3csZ3nIy5iPGA
	==
X-Received: by 2002:a05:6a00:4484:b0:848:700d:c950 with SMTP id d2e1a72fcca58-8488975a906mr10015120b3a.37.1783994265796;
        Mon, 13 Jul 2026 18:57:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4484:b0:848:700d:c950 with SMTP id d2e1a72fcca58-8488975a906mr10015096b3a.37.1783994265313;
        Mon, 13 Jul 2026 18:57:45 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Tue, 14 Jul 2026 09:57:24 +0800
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWXVWoC/x3NMQrDMAxA0asEzRXEJjjQq5QOIpJiEbCLVEoh5
 O41Hd/y/wkhbhJwn05w+VhYbwPpNsFWqe2CxsOQ51zmNS1IzLh1l7C9vrF1lkDtjlHtcEJVpVy
 SEJcFRuTlovb9Dx7P6/oBzTuaNXAAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=1206;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=F2K9sEjjREWTXCiiFvgwr/QcjLlB0RgcEW4s31Wtlh0=;
 b=nhcXZEAnqwFMvxfhtW3CN+qiVqmS7C8vIUCnVOD/G678bP0apyOiIDi0PpEatlNLYmjRNgQQA
 CrX5DtpTQwnA+B9F7EjUkpiwWwy6VWaUTVTpQ/ijdd04dI+/7Cm4ypP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a55979a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YMzFSpygh5mOmOF2B6YA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfX0QmJ/d3pIK30
 byaH+71jn/hDPpOL//kbRnIsMXtV1h5UuE1Evjb6ouAlhIenp/sf7UCNaCxTH5KVaV0Qy8xM/Wy
 vR2AEq4vAWbWi02hWYXTGJ/it1mLKlg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfX60lARt4hkgeI
 EOoN5DHsE19hJrwhtXF7mOxJ/b9wm6R2eCdb6svYyc0YlMHsBtkQrJrOPLqLVKKdmgOG+pmmEoW
 ebGSh8RpBtVyel3C+WinQd6BjOwIGBUD+V02fp5DIaqOEBnBUjN2vMcS1rdMOWP+pOPvt1arPAA
 GJSmrK0xShrKkJ1LVFAS1D5IuXhRx/qdgGNtRPwg/lsvwVaDBUpWiQxUcM0LFGNQsEmI3R8e6fy
 9rJ1u5lUyafNQXLgzEn+yTpPt4zdLD5YA8pIOOoOqogFl60Ngv+dG744ztYVEr/gVihLEHXTEOv
 G0TB/5hJmyXGtv0Kki4ZHjA/y2lKyAHUZj/RjhVWZ7Txb4Ox5R/6lsqegTlQ3YUJBB6hKJUkW5L
 yd91IOAxJ1qXo5mPNxnx6QZaL3Aok7XLVMEL75i/RnlxQvoWZAn6WJYLaD9PdqC9xvUrER9XOdl
 l2NH66VVBKBz4iCox9w==
X-Proofpoint-ORIG-GUID: CVMDd8IUtpMeELOSUpDJuwSB4J7w2dFU
X-Proofpoint-GUID: CVMDd8IUtpMeELOSUpDJuwSB4J7w2dFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_185747_918947_19E6898A 
X-CRM114-Status: GOOD (  13.22  )
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

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1298 ++++++++++++++++++++
 2 files changed, 1299 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-coresight-nodes-for-shikra-fffa261ead64

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


