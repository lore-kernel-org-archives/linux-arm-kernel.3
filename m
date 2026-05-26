Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E87CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pow14EwOIn0od75ybgcQR4L1r35iLvKxModRsY1OKyI=; b=boknYR7+CH4D1q
	HvD9zigMr0WAm4lyhPz95I/2T5g93U/ti9Nh1C2hSLjVaeEdbUcfmqRqI9IVtgyDxph/xCU8FChfc
	3smqvN7XXgmv006xpW22ZKa+Aa0TcPPcLXQNwBuCfJAINY8C3FKKZiFUuqUI46tqyPzIUEJvFYof0
	Ahj/eM3JNQ3yF3Db6CO74qo/u2D5YQRGLyqY9WHahwFYExk4gsXySlpdQNdjWRwSSZFZBAbUVDqDn
	5gT/rDOqpbzqFHHwG1vAMVk2mLXcl1Pa6NcVDCeZ+cVHqmCxyVgN+DOEfqZtJ+PYVOj+3OUbc22Al
	i/DR9dSdEo4EBhKMEs3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvKv-00000002foA-15cH;
	Tue, 26 May 2026 17:13:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvKs-00000002fnP-2RwG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:13:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dYD3147074
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pow14EwOIn0od75ybgcQR4
	L1r35iLvKxModRsY1OKyI=; b=TFZ5hjAFp43/hPTprCZQ0Gv8xR/rKTIXOujJnz
	DMVhYAHCyC6omlIDU5q2X7jxeX5ccmj91xfrs/JMGgHOczzgT4n3QEZIyyBCbFjF
	xZ29ME/hIXH5si0epr/l4zJ8V0e9P2/7+xKyA+ooJAqy9OuYDXjneshXs9S7wS1O
	Mm1B4HE1Y6BUW4mNkVbpQt20RyLp5xuvEie9kxaUbODIoV2Rv6xVzom7NYNUaUx4
	3s9xGTKGWpQOAHelvzQgUFrJsQH8oms9YQFSQ0qLbn6wa15vImnJSeeIxnqs5zjm
	JSHGASxB4caap1TkUIydwonG6KgmwUUvoaLv+RTDJNM5rwbw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3u413-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:12:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso6860721b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815576; x=1780420376; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pow14EwOIn0od75ybgcQR4L1r35iLvKxModRsY1OKyI=;
        b=QLrRtS818bQjAxg1yynrH2K//4xarkA5Ld3DEIcU8D1yile6MvTMJRLPi3qwrTvXxE
         0/S+rWAdgf/FqN0T4LUTnBdO2MNMwOqaTZAiK907BMg3XmUeMB367Gi/T5Nu22xau2A4
         HumvZYDiq3JthYCjqiPgbANt9LSNdE2xQerfopC03wJOjA1XlEa+OeEMmD2vrlmLs+mk
         7kt/BpIf8q7zrA9iRqStLrrKcF6c9G6vEeMvw+2zp1igEeW6hfArViC7Nyk8W24crL0A
         UFusKInEo0vH0VLY/qud366yLUgmYhd9ZMXgXKL3ylt6hS24RTuJ0CRZU2APIbLZfo/W
         Gshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815576; x=1780420376;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pow14EwOIn0od75ybgcQR4L1r35iLvKxModRsY1OKyI=;
        b=amU0WjmiabWqERg3kVymr0TgpPZz92o10ucEM1efh8PXMoc0/yv/0Mw4Uaj0ykZm2/
         KQOvdy2LnplsGuVO9/wQOg41yfYu3valwZRtEymfPh/Dq7190MTGNN0tJhZKUvgNqD+n
         o7TsVPnX96kumvb/mR3OxAI5Lk5ogjJdOpGxSEfeRnz3tyI1VFYmTt9GKPjGPhZbMeH6
         sHNAv3q7v6Mh88wLL9QHXjKy3fd8DLhgXN5DnMJuaH3BH/0beBWN+PEtpWb4qghEeLou
         Y6u3OT3LIbNb1x3pK83NMzU8njyB9r9NMrrmltiTsaYX3USb/Zemh3TACIqDpH0bp46e
         v41w==
X-Forwarded-Encrypted: i=1; AFNElJ/OnYvTaAiMhHNTbfW0/8yt+ndAwIXmY0SaEExAIn6a2UibGJRDitkYevUNHqG/ixpv7Q8J9q0xG8IVOOwZSSBm@lists.infradead.org
X-Gm-Message-State: AOJu0YyZGlB+uyKIok/dJkNZdSZD9wfvk5NZLEa/g2xaIr/miCbamah1
	pDxmzO4r85jOiKX5zXPMp+rKsRT6NkO8z4/EqrdETbjPn6ZpMHarRktzyGB0lCWtbDsDJ8oLJ4Z
	5IXGEt2EpDkL94YleDjMH4JNFMXkWDKvNfvTvhdbvVmzkYj13yUPFUc9E8GKUESNxFqYABYc8uX
	VHFA==
X-Gm-Gg: Acq92OFNZWviFra12jxharg4EnvlXV+ydRj0Y/o/L3YUWY9GpEyq7ZZNS3gSFfM2G03
	jovds+PLuDyu+TMDpPzZqlYwKuPGc/LEnvw7QtFdaJCnC9n2wMEhE3XgsyjfSEgLg8+6btNtrKd
	FHdG8Yo/3fZWasNNEyf/fCS4MSjboUt+DXT2+ifw39N7EYSGDijzt2FhJf3Rd14ApVW4TIALKl7
	ptnxfYw/njJoovOvrQLcFiJO/N7zd4mg99H8kdQtlzGhMiShW0WaGWDX0AxZTJyVkw303yXbN2T
	1052w3o2DnVuyUbgb2fd0kZMWEtcNEU8WoTMm4rX4zomIRKbr70A7NcT6neyp5TkLjjG/Ldb424
	jDzr5EAQIGGihsvrZ97Ri1cAV/dzXlI/v0xakWWhFnQGJp1CGHvAL
X-Received: by 2002:a05:6a00:124d:b0:835:cc47:6ff8 with SMTP id d2e1a72fcca58-8415f3a54bemr18300638b3a.45.1779815576089;
        Tue, 26 May 2026 10:12:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:124d:b0:835:cc47:6ff8 with SMTP id d2e1a72fcca58-8415f3a54bemr18300594b3a.45.1779815575564;
        Tue, 26 May 2026 10:12:55 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:12:54 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH 0/8] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Tue, 26 May 2026 22:42:44 +0530
Message-Id: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzUFWoC/02OWwqDMBQFtyL3uwHzuj62UvyIyU0NRW0Tawvi3
 ptWCv2cA2eYDRLFQAnaYoNIa0hhnjLwUwF2MNOFWHCZQZQCSy2QpSFco2HWjCmxz4OezHr0iMZ
 qxB7y8xbJh9fXeu4OjnR/ZPlyjNCbRMzO4xiWtmiM6RXJkmztfZYIgdjImhuhdNVw56Un8lTBf
 1RbHEmc/5LcwlylXVMprVBhu0ro9v0NFga5fuIAAAA=
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
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX1d6c2HkF6dx3
 PKSrVLLy7p5rNWQlQzsy/GMVG+dGuJT3zH5Yu6kervZBW6SKgzxCUK/V1IGZJgKLqnUpUQs+tdN
 VA90ex1LcN4VHNNDTrqOs7tQpSNS8NQIdxfWdr5pBsO45jrawp5JwLH7FyvEdWxu9hIgIxuttUT
 WPyMEJ1zc/5Y+/SAhmN9GrLc1urrwfMBjT0k3A/BD63oloHpr3aU7vsO8eVUUIq6tISAUknuLbw
 clwjQKp6wk/zGY0/prH9ZpN6WOjwgQM35qlogQ6IIpr0ZvvkO5cot4k/vwg73jnbAQhfe8ExMU2
 6KeuOVqWNfBrSmwFFdzddhpnmkF3CN10XoUovhMCHteyVcSXDTTiA/qzt+E0tyb5b6jsOUTjlpI
 rmNf8rJIXzxoPW3XEw3f9w7OCVZs1oDf7cZdNTDF8prpcsoXVWACBCosjeJi3qj4LJJpoVfpSxu
 DsHEm00q4p4S6zHD57A==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15d499 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0ARVRLQPdUDne_cnrioA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: MGZFUb8rX12DJ2NmUxj3wttyKF3pVG46
X-Proofpoint-GUID: MGZFUb8rX12DJ2NmUxj3wttyKF3pVG46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101258_743480_AFE0FCC3 
X-CRM114-Status: GOOD (  14.72  )
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
the 22-pin IMX577 sensor via CSIPHY0 through a device tree overlay.

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
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Nihal Kumar Gupta (7):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      dt-bindings: i2c: qcom-cci: Document Shikra compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

Prashant Shrotriya (1):
      media: qcom: camss: add support for QCM2390 camss

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,qcm2290-camss.yaml         |   6 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-evk-imx577-camera.dtso     |  63 +++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  63 +++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss.c          |  13 ++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 355 insertions(+), 1 deletion(-)
---
base-commit: 9aab4e30ec8ffc5622669381a245791df3feefe7
change-id: 20260526-shikra-camss-review-cf6f66ac566b
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v3
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 391f9dffceaac9f44df7c2daffafb66fa379ca35
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 7e351b93b3a238145ca642143bd0824bb90e98ce

Best regards,
-- 
Nihal Kumar Gupta <nihalkum@qti.qualcomm.com>


