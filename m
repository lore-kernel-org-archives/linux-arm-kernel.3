Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559AFC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fIm37QC9vX5p8SeR+t8ls7pgjxqXFcRxcGQJdyZIRs8=; b=AXfTV66bi/LS/U
	GdQjNb7shxj1LkVfSyAY5jXTaGUle93G7yHLUNWGMa/m/7PL3v52UwnZK1BDmXgxxTzm8gn9xh3Yk
	MbfW9/58nIlCr4euL/eRl2FeMEkPA5bJoHkgoaprYwh4/HRADMpTwUSBi9yCGVPKp9pMoAUeZDiSY
	D0XN37FP+yT1DZ8hLU8wpQ/HTp2L1zn14xGKlScehFsb7VKoGe3oOyT0c+jl/q/eII+4WSw4u0xpn
	GW1ztm9O6XHWXaR4m0lGm5WunzMGEvco3M50w0fh1qMEJYi1SjWWuYM7dJbT+keBZqnHrozhH7iGa
	9WvpA7HVhgO+/OH++gdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlI7-0000000DPxM-3r9G;
	Thu, 23 Jul 2026 04:44:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlI2-0000000DPwx-2yqs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:44:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X8VG2478478
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fIm37QC9vX5p8SeR+t8ls7
	pgjxqXFcRxcGQJdyZIRs8=; b=FnLKHSWM4Mn0tX3rmP0lb2evrdaHDNj1SQ15HJ
	2tMHG2u+8GIsqvbaUqhSrHMeAoOEbchqPoSJ+/RfH0EHXtGo5ojrYqi7OnLvrZ9q
	z8m0Rpo4e8qYkFMfwXaZKLqR2CwhWEFUYfkOO+Nh5NrD9TviUUP5VLj2wPOSPstY
	pghZrJF9+JNuX05/kio6AiL3lqEWX+a8Qs6C5Z6cOU6Iv+RrPqi9g83FcdK/fo6+
	RPwnv7TP5FPgSz2m3zDqjY1xtM2JsIFMN/UKKgU4Szrg1ONwcJfwZbLJxmClGWli
	q7kApwAG3rMvSmbeavWRJBvaA1sjiVfk0uFMBinyVGXQE2Mg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7c3qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848544a8496so298452b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 21:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781847; x=1785386647; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fIm37QC9vX5p8SeR+t8ls7pgjxqXFcRxcGQJdyZIRs8=;
        b=RTyeE/bi4cJyoXvR5FLpfx+vLSknnB938ChXPVkdNssdOfpyqQ1BZMtimMwSAYfMMu
         qfT/TWKkZYlxfoYC2wPLOo0hDopYHi+CqS2e/ZfyLqPUV9xE66hIgGVvTFwCXRWXkhUV
         a0mubcEa92wdX/wsGIZQBkYUBzrJQ8iZlyEEHKJkhaZlFAd6s8dl7ieMBgLx7QR6nLB9
         VbXnz+6Opk21cVsq2OdFtiePEDMC9H7Rvh+RR6vsn/WUpYn7HwbA8kjA9ErorgxnimPn
         sP3CCBlD0XjZhPnMPlAofVENernyoVzq5hQ6S6RocH8xhgRl5vOT5VDkgcIy7Pq/QWjD
         ihJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781847; x=1785386647;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fIm37QC9vX5p8SeR+t8ls7pgjxqXFcRxcGQJdyZIRs8=;
        b=sOIe1FckhEd86t67uuuNwY5tQeAY6h3CoLmzq4iXSNLnXhyiMG9mVDFIKqUwUpuXkV
         A6SxDX06GJpdDsbVMczxv+H17l4d0tVlQJIYCyolJas1YtV1LqjwY2LfzOCdWA7ok32/
         bb9tth062/z2kYxPX/6Ri4NKj+5z8YHD0/9KuttXiR2In1Y1/Ddrov/1fsr3ZeID64Mq
         TucQnFGEoiYVOjBGnPIh7/dLon6xw9GruRTqiA32K2JIlgO58uz5w/UxHhdKmneokOhl
         fdc+rENLpsKOdMBBZf50tXpUSalEDYht59y+45qwYzto9HlyGcjCpnPkVNegQGuqSZ1D
         s1Pw==
X-Forwarded-Encrypted: i=1; AHgh+RrNIO6MZYENpFJMcxpuUu4SOxE8MfO//6Xqz3qgp51JmBPzuLieKC9ECoBJVSi95FvGWM7Exa9f7y8RNC85dB7/@lists.infradead.org
X-Gm-Message-State: AOJu0YxipW6An/nwc9Qy9fsPW+ZtVyLOPMRWlph9F8+jdGr63S0QLcfH
	bd2zfe5iC3gi5Jjypvd2i+vCY0rYvgc9FT21gdO8dsiPJLf9o9O/Dgd1jB+O4rGZiUJ/G/QxkEn
	SxpnAIBuH+JD/RJI8RSs8F6rsOsftaiWnll28v1sh/aQV2k9eo08sZjDsCUZg2Bk4sikIvhaNic
	dDOA==
X-Gm-Gg: AR+sD13xeqOBEobtUu5saphzu1WBhPwTvYsbk+2+TJSzV7WqmRo2DXoGup8Z87IsDNO
	pUOJE0PC8PbRPMmLQKFlxNKgEnJ+4LasZXWB6GZ5lVZ7/wdaUz4XfiY6XAJMGD4vEthixtCmIi4
	D2sqMMuJZPv+Nm3rJywZ/xniXCDGcqFRcC1PTssEkqBXzr7BqNcYqDmbAiBMXb10rXyQgFr4py3
	acULqQzJCwW7LBPU3Q4sXIcNonJenVVUV8GmPFANmvcO1eeTjL1gPeoG58vDQlHIpVpt3Q4vtZS
	1jaQP2e+llSnYLiszIedlmU4XSKk4Hx4ETQJN+QdJHIedC5Hg08BEvXHRizqXGjCuAGUS3Llx6O
	s+Rm9ckf91NfP5CX+GCj0XRvpxDvd1WQ=
X-Received: by 2002:a05:6a00:a01:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84e2bbd287fmr1748800b3a.65.1784781847320;
        Wed, 22 Jul 2026 21:44:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:a01:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84e2bbd287fmr1748780b3a.65.1784781846738;
        Wed, 22 Jul 2026 21:44:06 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:06 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v6 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Thu, 23 Jul 2026 10:13:54 +0530
Message-Id: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAucYWoC/43OTW7DIBAF4KtYrEvEAINJVrlH1QW/NWoT1+C4r
 SLfvdhZpAun6makN+J9w5WUkFMo5NBcSQ5TKqk/16CeGuI6c34NNPmaCWdcMeSKli69ZUOdOZV
 Cl0b4pC6qqJRxqJQltfmRQ0xfq/r8css5DJeKj7clsaYE6vrTKY2HxobQKuExCglked+lMvb5e
 /3UBGvhz/sTUEaVRM+ddi2a9jiMaTdczPtyYlfHyk78TimmtyleKWdgL5SNwGF/7EvZoMQvCnC
 bEpXSoIXUEKX27AEl/0HJSllnEZiGVqB9QOGdakFsU1gpb1HYAOidjBvUPM8/JOfS3hkCAAA=
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=4764;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=nKuit4V7ADhVypZf/Tu6SgJ6+Y4O/BLiqsj3vnOr99E=;
 b=OB4LtKignbjqHtdfWglJdcGkTZjNsSr2FjwwBDwKd8jPrU+MBtLDuE4SPAgBkoDkVadcELSkz
 j81RBW1SjE2AXXCYf+nlTSGmfTx5CL5p6PH6Gppjpo1Q+GaB55J6w4E
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: WQv0S-Pvf3aCAfxt8t69oS86N-WvmkVS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX2vhoiFT6oCm5
 9vKcLEV3wRigauW/tvDgU1vOfVCJvKLeVylF2Gq+r/h9nE/LHnfBXh1Jyjfn7H7nb5B7+E98lVX
 TJGteLGT1a7iztrS32qoRX5ld+FHffc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX3DSx2g9FbD+H
 Syq38H5n1PQQF9MsQRdIyG++UrURy6+sE4QxP+SDO+405xJ5AQ+UPByxk0Z1xFDZRFUYJLwrBIj
 PZG8Q66vT1peDqZvlUvhK/2EJbz5xK9NciipZUwXzXMq0Q5clH9JJZLEhz3tlKBfzWEFbihJy6c
 wNAFLGuj36oYCP5mTItOpNAHCXUVRh6uOAO8k3O9d1/7qoABvQZwkoFOSDC/PPdJEFnCEXwzhhq
 l927yG6Y2jYwizFazLH7TyhMQUbLf7418H6g4zPiIQR3lIKN3n4FpdQEilBOVNI9G3TcsZVfqhu
 FdzkLAmyOYn9mQg+QxDn88RE+XpiCogRwCB4Rrlz3zYSo9s2Px9s+ispvtZDDmcGRm+Bxh0z21H
 hyoPbmPnT5d6DhMMIKf05GSSICjF/ELCezau2vKFX/MfAvx69kyiRUuQDFqAFmB3g2fLvUg9w2C
 lwrKOuQZaKzHrqtyhJw==
X-Proofpoint-GUID: WQv0S-Pvf3aCAfxt8t69oS86N-WvmkVS
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a619c18 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214410_914022_560E97D3 
X-CRM114-Status: GOOD (  16.87  )
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

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (6):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 .../bindings/media/qcom,qcm2290-camss.yaml         |  15 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 198 +++++++++++++++++++++
 5 files changed, 377 insertions(+), 2 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


