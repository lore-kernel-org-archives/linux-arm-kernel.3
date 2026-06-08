Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD97CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wQVq/uxdsibtS8iiGxP+KmhQ3XVNWt/D020K7D6egn0=; b=JfMECBb2fphwvN
	eOxvYOr1qYTQ9n6OMkK/ko/P//N/G15oBkJg6BHQJjxnCECatMi1paepFYmjOOB5uN7HdpAG43ioL
	Bx3D3Kbt0LfzjzDjJH+esT2Wc5CWPgSwZ9awhhNHSHrFpYXzyVlsSLD8BHKV6wBKe6xUR+ziEM89z
	xpolXhyX4bLSUPGocVdK42i3udJL1N5bGcsVY+emia8tZRR2rzY90MwwOE0SvLw50tX17TuQpHQG2
	UeFneX1IrFYyen9GN2V0+SebaAqcSBV7GX8UMDwSekUE1z21tBznM+f92UPRuHWresWZxVNP+t4bb
	/nWr7VY/01FCLzQJ9JYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWad2-00000003h0F-0A3V;
	Mon, 08 Jun 2026 14:07:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWacz-00000003gzg-2T9Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:06:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR33N3346733
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wQVq/uxdsibtS8iiGxP+Km
	hQ3XVNWt/D020K7D6egn0=; b=a9mxOukiZH0d0bnvWM+NhvQyX54al6FEzzRGK4
	CcP6y09gySNDA/uA09nQSysAXsRi5wAaQ20+cpTmT9XkMyCLY+ao2Fc1e2aHssec
	YiX2sasxAxF16Lz3qbw1pZT8fekfiFxXOTsai+ZshnpKFfW3zGOt34aBL4d/Z8z8
	UUKHkk9oVDWXqTvaQWvRj5DCpDjH9phwgLh5Gof6KDhAitDP2LZwGrF2zEEm6Z/t
	0oiGxZndSsjzTuyaK8ErpgZO53TICVweDmwbIn3cSIX0BYKMBO8JLUm/xxsHag+u
	cQTSm1k9KmOyQ0PLIuiX8Nu2wBtRf2kLuDJlQ4hSldMpbm0w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj8u2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:06:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso46869135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927616; x=1781532416; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQVq/uxdsibtS8iiGxP+KmhQ3XVNWt/D020K7D6egn0=;
        b=ftylePyIFTwg7FzUQLrCuIxOqwt+rvNTlYGV3qYCt8RVcRmeRgg2x+ckR+jtzl2MBt
         1B4zK2eoIbOiLqGeYXikRbs501UgmIDyGb/pIaMYrJXvBmOAyTElTU43aCtdmYaEx+UI
         SfSWtY658/6w9y+YBL8365G0DkMG98kkQJiL+v7aduMH+O8slYCB0Kvkqh5sxssMbTHu
         SCrLk/A8aOjETTz602Ab5oZILuyrhvp/zte0OYcHmYqQeFtzx5g3FSrh4eYOWkWfi+C1
         5TcV/Q1TLw80Ostw1wVMl9GG7LcJGpNsmfTqlGpbWTNC/++IiP88j1IF0RjfUxIAlL7V
         p+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927616; x=1781532416;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQVq/uxdsibtS8iiGxP+KmhQ3XVNWt/D020K7D6egn0=;
        b=IByGB3nnakpJlr49IjaemiPF2MKpiAOoSHhHLjoAvxoCfxTmnEBQBJw2dj73Ee1cco
         FPpW1LgHWIim58HRQ5UXVSPpMwzGxluAdKzVH8IiPV1clqQcPjcBQIKop6019O4Wh3pH
         jfQvMdaXcCnWMCSdWKkDNvwxpy0aXQ8tJG1/JL59cITNck8rW3AQPcTLhgw01UzB5cqx
         d/I9cIfSgi9VaqQj4vae+iNSqDgwQv0cUfPxttP0cKsjH6agjklVSsJ9o+QQfBLkx7dn
         VGog+Yu2co4i7562x/WTxfGA4aprgvoCOogtMCfzJW0GbTTcKkgn1JHg2Zt46n6cjhfz
         dNSg==
X-Forwarded-Encrypted: i=1; AFNElJ/xb6Qy0/dWo1yiXyeS3AK+zCQpwQUf4dOCAZOon+uPLomtJq4jIiNGIQ3P7W9PW6NunlfIOE7QM1rYM4JLP/RH@lists.infradead.org
X-Gm-Message-State: AOJu0YzIx5QQvrmRxMV+5hD4RsOm8ay7voX/RN7nAILdz+g4NTISowSh
	m/eXP9L3U4wfm3O3OKrSOvJP/hZ9olmmIeapkcH+iVRsQWWw3ZDOVL7JjqHSY5pldxUq+DSjaql
	2pKeJ+s9uwXv/BkMyojomd/WyECrATLlhXHOiu1NX1fcN1K7DHcrh2T483fnGLeX/9e3dSGBgMP
	YTweOEE0/0te54
X-Gm-Gg: Acq92OGfsmoaAHGRiYu07t+jlna9iLRzwRGm5w9vNwpGEWLhqZ2C9AFQuU9Uhh2cLxM
	D/K15HrHZuCSSZHN6JiVg8Idjp5JqBIC+UjXItVSaAWy+uAQA0Onm/J59LjMoPkiQg+KflEseq0
	BRUJbYHo6Sq05GPaas0XOJNVnk3RTuE4uSYmIoJJmEZluUfsUbDRC3kcylygnv6nwXin5vsoCOh
	Vm35ScgkvQstLitQYijSFHqszVVCvXUY95xxuHYoLXa/VSuH57GD4BLU7cDaCAULWBa67fCLc74
	1i4Nud5vvpJVSBlDsYqfSlvC4eGIoXJwyxofiE2LD50wO7dCvSo7SQl6tf/7JtwdmoJx2hkNY80
	Fg3voPUPQ4NDBGybdGlztp4a3KLzbGqyIbW6EeYv7ZBJziVQvJ1mqYtf/0Z0Gmyk=
X-Received: by 2002:a17:902:fc48:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1e78e4f0emr186695095ad.4.1780927615538;
        Mon, 08 Jun 2026 07:06:55 -0700 (PDT)
X-Received: by 2002:a17:902:fc48:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1e78e4f0emr186694425ad.4.1780927615040;
        Mon, 08 Jun 2026 07:06:55 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:06:54 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Mon, 08 Jun 2026 19:36:37 +0530
Message-Id: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7MJmoC/32QwW7DIBBEf8XiXCKMYbF96n9UOcACMUocx0DcV
 pH/vdhRpB6qXlaalWb27TxIcjG4RPrqQaJbQgrTtQj+VhEc9PXkaLBFE844MMmBpiGco6aox5T
 o5nCfFD14AI0SwJDivEXnw9ee+nF86ujmewnPzyUxOjmK0ziG3FfgWiENGtViJ7XvGsk6wQQzV
 jiLDXID1qpWkN9QhXFHqusXks3UKmk7JaQAAf3yp0Hw7mU4IdJ4G8vEyzlRXq46671vDOsXSTb
 yIaQ8xe+9nqXe0f9tYqkpoyCk5diiklq9zzkc5ru+bM8eyiDHdV1/AKK05kd3AQAA
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
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=4610;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=+XR8a4QIxvUka2Zv8ehwCWE+21woibfF2m4rPKIhOm8=;
 b=5RqYiF8ZJ4ix2XlVQX1XdpIbS2/xDotGO6lNHgV+jXSRyC6eKHs4pORJrkXU46w4gt62Zo9Cp
 ho2ZFQDHy+UD4caXRs+wZWsjJBWZy2qLe1Y8jofqXWzsw5ixWWyfIWZ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: j-CfNSsnA1tQU4PfOcJwfxo8K8LAFpCe
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26cc80 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: j-CfNSsnA1tQU4PfOcJwfxo8K8LAFpCe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX7uPnEFcAstGR
 igwzylkwNPOlxqdt+KjR/Whk01B7w3Itb8VrA0tlsa+EYl1IpcmIELS/BHtiQfCFXgOj3v+tZKk
 coHe8XBygeTBbupIQ05ktwnHwcc1G3FFhnb425lEFq2flm2Gq3DXCiAfD0IK0qNa8/lPvtK7Im+
 aNB56vRtCQGpuTC3hpTiU+DR7fUXKdeDk5ppFSRKLQVfcl7zhjIEcnaKGFBvjbxQGcNubnmya2o
 huv2HpuA3/RJ815qqFsCuGWvaE7FhW9rw7nj+PNnhrQ5ii/dPSbcCLU374Q+I13zhd4on5zJSVR
 pktbhVKPLdhX5xqBSDYKkeJ9vtVZh6zDIbH1NfSA94n7350aHSNGC/6bgXSH0f31Z3GPRHs4xVi
 VOOsv2Zkg/zqvzC4DyFCsRmZkFkjaRDelTf6OtpwIKuz4hd8sYEABZCNNJds9cZ9MXtvc9hVnfh
 D0jraKq9jRF35OViSQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070657_678889_A1315D99 
X-CRM114-Status: GOOD (  17.00  )
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

This patch series depends on patch series:
https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
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
Nihal Kumar Gupta (7):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      dt-bindings: i2c: qcom-cci: Document Shikra compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,qcm2290-camss.yaml         |  16 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  70 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   9 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   9 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  70 ++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   9 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 9 files changed, 387 insertions(+), 3 deletions(-)
---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260526-shikra-camss-review-cf6f66ac566b
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


