Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F384CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aXgSSn27XG5QktxMkuF7jAmn6KmQ3QqMT73PjLfre2s=; b=1GTg2ITNBwbCtC
	jKZrrQd/EOL6DH2zSn0FglAMiWRQjsgO5JbES0bXwqbl2ersCXWV9BFCfcPywmkgJ+Qu/n3KOA1YC
	xr04E6OUdZEoCggcwvZBUN82tcrI5QXj0HsO4iPOmlnH7EbQ9IiW/LfpqfLr6TRK9ceXgg/sQ/QDM
	T45EHixT7iLutC90UCZ4WNkyBHD4iitS19bJRgG+c+7nO5FVZAA0Qpc/eqCF9KPlTEbpTB4KPBvVC
	UIWT5+Q6cwT3HWUmDCJxjCjaqvVDFc61/oYazt6vFqo6sibtNOLufj5LE/QmwtBOG7q3oTVx5uNvl
	c60eBFFmlTunUecLUKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAUj-00000002u8X-0YiT;
	Wed, 13 May 2026 14:23:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAUg-00000002u7w-1Xpr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:23:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DASYRp2338932
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aXgSSn27XG5QktxMkuF7jA
	mn6KmQ3QqMT73PjLfre2s=; b=XDZU+OE+cRby7iIoaJQu3bRDUpjLRAuDfY4cSJ
	D6CMEdRvkpq65Rq1yZnQB+o0EcafSTCAyJMg88i0neUAs3xw12rqSF6QIF8vF79/
	w6w39tkVwWdg0aBI8O27c+5eqA7BAyUgj85H8g3QL4uihOw/+5qoPfXcV4NRCCBG
	ozlXcVGtn3R77wYhXGyEgDMx+v99TyLQgqhQJ851hfCWPmYrIOvAGGM993zsjv1c
	uG4OLmrmYJIzq1cYGLhzl7oJyuCubXF7S224rHPzVEqKMtH2hGip3wlLMlGdDx8t
	I7AV9rXm8U+O/HZ/cEMwt2Hqycz4porw0mlxvwuPH1zo/dvg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxbv74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:23:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba115ab6bbso66960385ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682202; x=1779287002; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXgSSn27XG5QktxMkuF7jAmn6KmQ3QqMT73PjLfre2s=;
        b=dHvO4/GnhsBvf3Cy0JFEmVcZWUDt6OZ56Q4tCo5nRIbiYlIHHJWffbqvLcigKbNsov
         McdcC0CQfcUojNjG1rC272xcXZ8aQH4rAv71/3cLNOcsp/y7+UEmU9YjgWYSrHq2Mlaf
         eEc0EXQCVvzLDML0YJgcdq0t90MXZIp2fjHkJ/Y4wUrt2KHrA5qyw9WjHnfiCZc5zNLJ
         9PTItiVYwnl7UU2mEO/HSvjgcG8/VBMWwKzrRyL7mZZ54wo6zHqReZOgFZTTySCBGJ6A
         pFPvnhPJXEKkq39Omug6Hs6JE/DLLkt48hU0DZdt/5IM+X6ZAKHgVB3XDWakK0G1Ek2u
         b91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682202; x=1779287002;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXgSSn27XG5QktxMkuF7jAmn6KmQ3QqMT73PjLfre2s=;
        b=W/llfVDMgYu75o7aLAZrzc1WCb0ldHEuatZ/VOarzn1Mbhg+06Tnkj9quOF+rfuKdB
         dLZqF84xFwosKNcrWkl9tzoKEa0i5vZIY5OMv6YpwCuxSOqmkkWcIDi++PBPvmdcRstT
         rSgsbVUidX0Hwmpqgv+USlSXrA964zoNjF5l/wWmZCJxeG7mexbwNPQgZCqN8U8zBF7U
         bH2ckMYZaHpmGWFY10BX+t7lvTCsjIimS6ScU0uA+AQ65rRLyezaQhxx936TTeN08l+2
         V2NqZ+/hlzKk7+EhpCnLqIjhNXYE7jTdiUZdnDvWahyP4vBwhz31AJUMjML9sPOv3rWQ
         A8Ng==
X-Forwarded-Encrypted: i=1; AFNElJ92YhDsYJwY0Ce/cdkUP2CRRBUHi5paPgbwmczVvjwponFVRQDNfrVTe5KNPVXcPOrxd7/1y5W4fr8j5j2JzeUD@lists.infradead.org
X-Gm-Message-State: AOJu0YwPQoNJFfgLciw2tjqtT+HMlBZrTZ6pdHUfNGXi8uCCzr4KkoUU
	mSmgK8NENYVynmKxvXngtxp0HzD071qXmnw1khIDi/enTPR7qjKbt0ZD+Y3H0Unghvvn5mrU6oI
	I2sjBsWtKdYer0KzP1l6k+3zxVCINJevw3B5bKlb7dU3KTK6amk/+zkJZQ8jgWSzNyKHAIstggb
	jAOg==
X-Gm-Gg: Acq92OHYkYNMSV0LKm8T081Qsnt2gYtKD6cBxK6J8HXwegUXSADzMzTaboDMthvLeDL
	90nJibTa2XeE8+geyj/XbzTgD6MhyNFXaFR0DCIG2CuNyjt1UskJz10WhktCpCObFJdtrPq//iS
	aDdr7oporMP4MFIO6w4ryB5EFNMwNgT0NpTAwlcQg5ttokeXUIGqZX29l3wy5f2AlPLSQAszN2f
	8Xq/nXW8ZuOBIl4W0YW7FVNN7AZsV5PkaZl9ORCp9CcZHpGmB19QpfTNtSfyYDm8AFWgNSkmXca
	xXqgMmjmHRERc0boKW5dj5wYh9x0ubOXTchjNNmx9PHFWtlC+87MY1s8/ltG5ELZhhyj3igirdI
	i7Xj8GsMkTxddxSEGXDuBU/VieKBpGjOEsB2jbRqxYht8gg==
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2bd27158ce7mr31344865ad.10.1778682202362;
        Wed, 13 May 2026 07:23:22 -0700 (PDT)
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2bd27158ce7mr31344525ad.10.1778682201746;
        Wed, 13 May 2026 07:23:21 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Wed, 13 May 2026 19:53:05 +0530
Message-Id: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqJBGoC/3WMwQrCMBBEf6Xs2ZSY1gY9+R9SSrNZ7ULT1ESLW
 vLvxt6FYeANzFshUmCKcCpWCLRwZD9lqHYF4NBPNxJsM4OSqpG1PAoa+dN3znWI3aKElnusamu
 NrgnyaQ505dcmvLSZB44PH96bf1G/9a8qRwqDEhtrtTZ4OPsYy/uzH9E7V+aCNqX0BSEHayezA
 AAA
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: m0tOVx-DKCghgp3mMFS5yyZHXYsbMZVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfXxzBpgq9gJ+8f
 gU3AzQOTemKw8+76ULfIOnP/JQ3ZHRpedelM2pl/ND6f2aQb3NF3beV+4YU0rOk/NjZW/jh6u3a
 mCUJ2lXuz+v64z3fBzlU9oGKGbh3tvz5R9h8d2Uuggl42pcpWNos1n2ToamP7q8S1dMKNUEMtcQ
 P9L1iJMhBuysbpggLV4lZxTZkNezB5mXwQbGX0F6VZZj1z1GOSnOf2Zq3MwZJbMjpmqcBHg1YSk
 0KBAHhtUDycd+jPPkOK+Ag7sqPrudGXJzeJU113XXX4+qXgHpICIdNSKqE1+/730RcgJuRiBO51
 M1JTX7mvD8dPcDdWCVv/njaLHK8Pwaly064+ucrgtS1FwQs1eC8IJUlvciQJ7frQeEkUHEY9esC
 1byR2kDCY6sOTNPWl7LXkz5DrvlJQDL+xsxoakSzdrqps8VeItqKwTDmIS1BPY9iN6S+2dTAWkQ
 +pQm1tYP0PhjNAh+Vqg==
X-Proofpoint-GUID: m0tOVx-DKCghgp3mMFS5yyZHXYsbMZVW
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a04895b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8r5jHq557GnqU3WSqWgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_072326_537919_BD6F0996 
X-CRM114-Status: GOOD (  18.05  )
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

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   11 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4677 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


