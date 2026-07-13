Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927FDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q0wnSw6IM70ZatIRQ0h/nFSD5yzhjm8eQKBwsFtZV7A=; b=Ia051EnfZBbKAd
	6mnS+bRDdBpuJZC7gk6v4Szuxs3gjkghE2ALLOfDEkZfVCBr87x8sE0DeII0lS3pjRx1n9E52KOGe
	esEJ604gMmlehJKHmNPdCTAzj/fRe4/LhVOTxiALKopU1qHlGyiB4XjHbUE5k3rUKQ43PvVbd23uW
	fBJpZh2K99frdksE6Ymy1BjRNZK5SwOBaEcwaldTx0aeYoehKqAYz7xCTs3/I0EoB96NLgZhUVJU+
	4DwiFg6uuJAvfPbD7tUIGwSQwZjuSQ4ukjaQGlh1eEvG12SUV4NLenTqvi6ORc3IRNIc+RddHUrkZ
	6skEfKEnVb9h0nnDRm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCy2-00000008j9x-0ltw;
	Mon, 13 Jul 2026 09:28:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCxz-00000008j9L-1wyn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:28:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NdhJ469194
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q0wnSw6IM70ZatIRQ0h/nF
	SD5yzhjm8eQKBwsFtZV7A=; b=d+ZsdQW+UAY71hYNVEJ643lTUkZjPviGbuF5op
	k0sEWRytegRpGwtK9ToTMm7Dz9hL3MCKu/ULcWKIAjCI6Nak9Fke9FpxK05xy7Op
	12SUOXu2GO2cYp4hlF90R2u2/z16pC8CPZzUjo95r8sG30urqX3iijmeWSZX8T7D
	KeN9lL2hSHgaFifpHC2o3b6TJuCiLFA0dvsP11Yb6Yj0qiRxC2i079ldTVBZUnoP
	alKO6zA21PiXRhWpO/HGC48Ym+fqE6bjiW1Mql6Gs4Q2IpgIFjf+jYDTgDtIF9jH
	3fg1gm7d3v5/q7IqAouL/d4iDlH8rix+HL7R15/Kd7S6lBhg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf485dqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:28:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484f26852dso3712132b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934926; x=1784539726; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q0wnSw6IM70ZatIRQ0h/nFSD5yzhjm8eQKBwsFtZV7A=;
        b=RyAs4uXxpadOUPp4aYjBZDAp1kB8bWxmdI7gFSAhVtd6uf7QsCo7T1j8z4pRd6FqCw
         K/PGOHxXYuXSZVwAWCQI91eiNV/Pc74kTxfQJDcO32m5ek8rSufrDJ+6qinne2KWDPY5
         QOfo7zw3mlsfIarqJkJQqarxGKVpK+t5jEdGwK+/w6AmZ0+cMqyU3kCBzFJopDF0DGfL
         xRGpvb9m0aPZUzwN4v82beuUipVOPXxQvjtllmkx9E8DS3HmLaLYPZkqqMFUDafoWh34
         euGPjTavP6DZugChKv/aQyLvVgFgQAXUws4osuGFoyznn8YdUN+HIC8Ykgy1vsMKZE+D
         bSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934926; x=1784539726;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q0wnSw6IM70ZatIRQ0h/nFSD5yzhjm8eQKBwsFtZV7A=;
        b=qUTxtPUIAKmaFSXk+EpeEfFI2mHmfT/+I7dosrWR6sjmq8xogLrQTiFMnIh6hIK11c
         EewXWGY6OpfEXG4kXx8u3A5kQWiKBQghp/wf3SBx7NWoeDyj3D0xjtkxfGQbAzStKpaI
         cfX3sTMp3nb9WOeICTxQNfvoNAmnxP6nvROgUZ6lHxG/hUYCMwBv1PMGeAolYXtn5C4Z
         pG8sgW7Hr39Yf1oJ4DuBsOh4PZIPD/tx/8DGzzM2xwxm5pgBXbGpPtpmcBKNeb2hIiDd
         Q8aORGGvm2XV3P2Z5uWuHvTISiqHcRge6gA2bG3bpu9uc/8ApJ/qtR+Zfltn8DxujrC7
         nGKA==
X-Forwarded-Encrypted: i=1; AHgh+RqydyrGFXdzp++AiAeRDGFkhJQoio7mqI8/SFCNlKg5gD5DWFtP764Ypcj+pcVN6+Q+88V2gRDAQSmf7gPnt3yi@lists.infradead.org
X-Gm-Message-State: AOJu0YyXslF3KVNwzjgBC4KAleOz9zep8P+EC/eAcafXjN7asHo3zfbs
	3qTFx3joWUjtqIMd6eNZP78Swb5N65DhjWLxwgcgr1idMHgYcjaoLAqezhsgxqTlkadYcf6OnPR
	+cuO+HLfDPCDopA9wSDXvhDKYds0kymeLj5D24MfSeJpe1ntj6WAzBUy+yAmmh3v6aej8Zf2aIb
	8qdg==
X-Gm-Gg: AfdE7cnK3GSoeJWNArGDwrAUIfmxM8ognEbCEl3Sa+cZiutHQGZ9qsUQCoS9NrM56Ja
	YT36Hh5M086C8O/Jq3CYC4ktTv23oxoJEwLCTETixz2E2T7Yj0Q7/CXUnAkdtHhD4f3Lt4Xzb7l
	lFA6lT+Sd2NASqp+bRflaj4OdLBySIoyjVETDK6DItOKnTJR10dp6TcdwN9odqntM7PckqhoQ2O
	VN+i3yyY/mLzK9kNky/fCfrFZjfSUG3ZfUq3Mli1q8mbcqwNhOXpEfkJ+Nbbd5xzb+Sl6Eqflr+
	Uno/lkj8o0LxYsofWHz/8n/Kyx9TeKOukLYtVx3TKtE8JYjEomY9LUTn/GNq1WIjenr/D7HNRVG
	ld7czYJK4ez4j3rPAwdrr+waT5Y6S+13O0D/lzqNirw==
X-Received: by 2002:a05:6a21:648e:b0:3bf:80c9:6b3e with SMTP id adf61e73a8af0-3c1109f717cmr8402576637.30.1783934925911;
        Mon, 13 Jul 2026 02:28:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:648e:b0:3bf:80c9:6b3e with SMTP id adf61e73a8af0-3c1109f717cmr8402553637.30.1783934925471;
        Mon, 13 Jul 2026 02:28:45 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:28:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v5 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Mon, 13 Jul 2026 14:58:31 +0530
Message-Id: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCvVGoC/43OTW7DIBAF4KtYrEvE8DMmWeUeVReAoUat4xoct
 1Xkuwc7i3ThRN2M9Ea8b7iQ7FP0mRyqC0l+ijn2pxLUS0Vca07vnsamZMIZR6Y40tzGj2SoM13
 OdGn4b+oCBkTjFKIlpfmVfIg/q/r6dsvJD+eCj7clsSZ76vqui+Ohst7XKBoVhASyvG9jHvv0u
 35qgrXw9P4ElFGUquFOu1qZ+jiMcTeczedyYlfGyk78TiHT2xQvlDOwF2gDcNgf+5w3KPGHArV
 NiUJp0EJqCFI37AEl/0HJQllnFTANtVB2g5rn+QrMUnlzzgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=4511;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PuN8ENYNOK4zFEX7iR5tP4Qc4qPqD1yrqd+US3xeGx0=;
 b=EKIr3fC4K4hhA9EAn48PYmRKnOCL56cBopti13qR6AQU4CmzUuuVy6UWePcII27pGzhDh20fI
 UycOoqoIeOICfIByBVGqXJqdTH1mDw6i/FM7OrwttkHWBF5eRfn2avS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX34qf/OtD2M9p
 os5+YmZKmNW0FEKQncpxDzyJP5ryDIcRhlUe6sP3rbGa3yXqp0GwRMKfRr5Y5J9Ka/5MOeG9U43
 keg+J3G/mVCgSTZoUI9t2bj9tSplMrY=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54afce cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX16A+x1sfp9Mg
 7cmyM4MjZaYbYzQtWpu5hEtFjZ8V5+TLPuvq9CR7CIZ08xCdCLbDSIBl90op2C35YgL9fmX6B4c
 4s5vFkVKz76GiNkoDskksv0FrSfoM40fqZg4/+EDAD65Jg/go/UJlAjBLK0NOxKI0Ark+04+ARC
 77vYauGMgbliwAzZl5iPScTiASCp79KKuX3AWhqcM4NBue4yhTwCoA/rYuqSzen/kLIqU9iw180
 k6WBZdt08XL1VpSC8CZgtqT6E5hIoJTq6J39hkHEZKhE712CeiidS+4cCjPkAyBuG+eWC49391H
 F64CUMrJ9lm6d4o3yBijeVo3N4f6SGlw2wOvLVarVBgKO4kYmA/6e0Hj4lz9aTClaT1UGukbEnS
 2HJBQb2XGyTnKPS9SKln4ufNch0VZqlEihqhWZuA6a29BJ2slSezDhPpvXPRyOJthNIiroGbJsB
 8zvkKGv89XEwWkOJaEg==
X-Proofpoint-GUID: dsVjGIe1IiMe10Uli8fsnANdxAYJc9TN
X-Proofpoint-ORIG-GUID: dsVjGIe1IiMe10Uli8fsnANdxAYJc9TN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022847_539009_33B354BB 
X-CRM114-Status: GOOD (  16.61  )
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


