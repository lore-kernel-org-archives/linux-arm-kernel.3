Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C979FD4115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FUcVjOfiAfC2Npy7DMm5myY00iOuyg0GYv2Ui5BqhaI=; b=0qfjM4uBmeiNOE
	oxMm1Fhrz1LgtQmgYAi8zsAvEn2cCyacqA6RBsm6de8JO7d0uD8Sylbh5X6LmjHYYcWz+lOICRp0y
	mfC8wnh0y1uL2q5hLC1eVxue+DT/2NgHlic3UgX0Czi3hT+ncyHYOiEs+2OKlL4jGacl3DhdWcVtN
	YtPqTCb2MvzUU+TwX/5JIrg53An1Ee9Gy3YuueRJVxpSNnfhC0aFsMWievJksFiN61Fha2kB42c3n
	5gilRGhJcUCpgpMOE2cJwCB0tW3I/SRM+5fAtijMBEKN2tbG0QaRDM7DpWyRpqvaEknVApsqMpjrF
	nmXPTCf9QNVj7kKTyxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKLo-0000000C87C-0BFC;
	Thu, 15 Jan 2026 10:13:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKLj-0000000C86N-043P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:13:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6ff1I1744860
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FUcVjOfiAfC2Npy7DMm5my
	Y00iOuyg0GYv2Ui5BqhaI=; b=kWznsNE6xeiOtlyS9YtRtnnHXgHEm/ZjWDWrO8
	rJxSlBwGYBIISk/Hk1HfUpi6lJt1PJbGKoc27wS3DWUL52CWppw+Nb88ODeE8rQm
	Zn9pTnXgBc2Hvj+d80Y7bW8Bcyj905B+Y8c1XAoZaZvheqBGrA8CndrraqJMclnt
	CZPiJOBPfzRGcv8NqE/Aa+GqOMU+0wQYZyxoDdomySIoRvXWZyy6dEwjPf+Bc894
	pg3yp8OzYP2/yb5XtIF8xXCsygoov0n7OcS7Hf8DSfNEbQBr2QTl+pG1lVZeZfOA
	DmICjecrSgZUksJUakMubUk/uVVJWoK4YTmIlm/29ZYoHkGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2gpb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22ab98226so310200685a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768471984; x=1769076784; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUcVjOfiAfC2Npy7DMm5myY00iOuyg0GYv2Ui5BqhaI=;
        b=Fpb0iOF7LtoaihzQeAGJELjFEltGdwrQ05hBYm1c2cY/sc7ayWPSno0oPtHC8TfLUN
         g20m8LCx28aWdNoXGl+21hoZj25ObKhPb1mPODkovUOnozaip6oNcgJ52BSHnK5w14C4
         BwCIZLW+GU+KL00HE3WrNQcHa0Y/NVczgC9DFN+DFzQiOmQOgy2SqmmHnJK2upYP7h7a
         R8PT4q+DaV81Yg2ArIuqmkmcAux70XR6PO85BcWDQcemKkrjcDWHpeS7rhZ+QvksnGhp
         CxzdKbP/IskQA5mFB14xJwPa5bTn8x6utNQzGyYeEvedqQxpTEv7EtmDZW0kRvkYNRwl
         10Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471984; x=1769076784;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUcVjOfiAfC2Npy7DMm5myY00iOuyg0GYv2Ui5BqhaI=;
        b=NihdE2uEwtla0lOtiTzVG6xmu/bn/wpzevi+GWpcnxPkYzJPnOKnFUSeSu8DVtditR
         ZDKz45JTF4vNPOHZSyPOV+urogmCLcQs6XAuUapPN+OZxg5LQfggw9LOaqKFtu8RNHhF
         wBvO1HT82Wc+gHbbu5ayNv/dpGCFtiwicL8b5MviYpeCUFjIx5Dv8uyyejcO1g32gNRX
         Aa2BLBFUVUvRkyVf7PHTeiin8Zi0K9GD3wAzDW9WkK/5IYQRDNgIqzKSnO3ea1FoV56g
         zg5V4PgQelQRSHBusdAqmT3hDEthgcoew8WXdDJtY2q2045KZ1j13h0Elze0OrulLbVm
         juYw==
X-Forwarded-Encrypted: i=1; AJvYcCUMD5YI7CmcTI9pnLZ7QPcgyWZa5QxuLeem0ugaump4k0croqM7lik4bHMC4ifqvzX+B/7U1ry4nZ2eSQZhP7/D@lists.infradead.org
X-Gm-Message-State: AOJu0Yx56sG7guMUSSTIbyUn3lA/Ky4MfAgvj8tqGuAo+hPIpwLLvNRI
	jo5FdRfvKp7gIu1ip0eQya+vGRN0EgxdqV1vckD06kJQ1CR44/U8u0sqnIPRGe4Vm2/w2DdEoTR
	xvD6/qolklI5RLiAExjNRBBR94SnR+tinYr3Uc7mOEpcVt3CDQtfNcEErrzCcB+do/y3P1POgVd
	5lhA==
X-Gm-Gg: AY/fxX70I/9gFE/QNwxH0+uoA3ySDytJzKUdtDm5qj6MrDUYIzJv5exO2wdOy3v2xst
	wMteTNCoFPwSIMRDxMFVzY+RknjX2QJEbmHPlHyfjvN12EoTYCDxJMIemu62ChpXWM8EFvkh1Jm
	Ww323juI6eMLijHUFUJef0+NUCaZjrQAbbssoJchvhfMv5x+JShWqxpnpXB0jcAYJ1YwuKKIlsX
	CqQk3+cirCtf6z1JgRGhmgKHta1FIgCfl0OE2/37qXJ0eRGdwakGEhvfiROTQ1YdP8CjQWOAMWA
	mgiVpglCkilSRLOtbxOJhf6AuwRw9K+OpwOl+liphb06Nm2NxNmQQDQsWZihJNa7InmMvQMa0JJ
	Rk8tJB5lvzbYCiYZUmr+ZmrtvTJXGZ5X9xWC2JtOoh34InydaiZZqqKXMiCJFo8B0T+JsAACpG9
	4s
X-Received: by 2002:a05:620a:7087:b0:8b2:e15c:be60 with SMTP id af79cd13be357-8c52fbde32cmr822076585a.88.1768471984424;
        Thu, 15 Jan 2026 02:13:04 -0800 (PST)
X-Received: by 2002:a05:620a:7087:b0:8b2:e15c:be60 with SMTP id af79cd13be357-8c52fbde32cmr822071885a.88.1768471983961;
        Thu, 15 Jan 2026 02:13:03 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:03 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add CCI and imx577 sensor support for Talos evk
Date: Thu, 15 Jan 2026 18:12:36 +0800
Message-Id: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJS9aGkC/03MQQ6CMBCF4auQWVvSDoLgynsYYmgZpNFS7WijI
 dzdwsrNJP8k75uBKVhiOGYzBIqWrZ9SFLsMzNhNVxK2Tw0osVSIKNhVqpQXijdRk6a+oWYotIE
 0eAQa7GfDzm3q0fLLh+9mR1y/K1NJJat/JqKQQmul0Oi66A/7k2fOn+/ubrxzeTrQLsvyAy2jZ
 5urAAAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=2776;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=dRFzhQfshHTf84BzdT/POTnud6IjyDSFvgLl3VTPyVM=;
 b=s1Z1RtirMGwlxfUdjWrldiB/bQvjXr4ImPeJMLJHSozmB5ORPdo9YjJKPNFRviUIuQcJ+qDrX
 B3gRGMBGT/7DyCutB4CHtnkgFg6NO8W9sKclihqrL7gpdAAYQwFEj/O
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX5C77LYKTOj17
 7XGY64Dg1gaiAgv0YpD9n5Fie8SckeR+ru0vdQb1RHfETD8qNx/oRNBhZ5TPyyUoVLIqra6DzwU
 okRJZ0nQfRlpo06fSFsM5ZaOybOI4nY5cPJp0dbwKsu94VLG1RgF26SGhvLCcJSgs/XeqshrXOD
 I8ekiE8KQ+iaQdA2ICXBcH8OvNht1z6oCoBSpKUpdJ6ae543X7+7MDX63Q+k4iXjO50kg1vKHHh
 0ns6jIJR+PUHOPNcfRrXzPvVol3rgTc+V+TcBJublqyz3E/aEZDno17Ry1ZCISPvAdxTXqe20e/
 9YMCc+kHVt/prbD0IQN/oC66JCCY1YUwxn9hCzg1l5l0wHjBOZTmHYxFtQwWrny2HvVbjyas6MV
 P6HFtO8UdHpI2C6XyQe4cNwwLN2YaIBJRDHbK0dV1m5yRex5UbKTSsMEEAST8UoxsQiROVscr2d
 pdxT2piHrBoq2fijn8w==
X-Proofpoint-ORIG-GUID: U8mj7vV1SMnHjP6HD2sB0bxzvimZaaJp
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6968bdb1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=VACOPh1vIOxWScL5tJEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: U8mj7vV1SMnHjP6HD2sB0bxzvimZaaJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_021307_187605_E03BC42B 
X-CRM114-Status: GOOD (  15.58  )
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

Talos EVK is  based on the Qualcomm SM6150 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Driver and dt-binding are waiting to be merged:
https://lore.kernel.org/lkml/20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com/
I moved the DTS patch from above series into this patch because it needs to be adapted
for the following changes:
https://lore.kernel.org/lkml/20260108092542.1371-2-yuanjie.yang@oss.qualcomm.com/

This patch series depends on patch series:
https://lore.kernel.org/lkml/20260114100043.1310164-1-tessolveupstream@gmail.com/

Changes in v3:
- Add generic names for the CCI clock. -- Loic, Krzysztof
- Split cci node, removed double space. -- Dmitry
- Rename camera dtso name, add detailed description. -- Dmitry,
  Vladimir, Bryan
- Add dtbo-y for dtso. -- Rob
- Interrupts cell change adaptation.
- Delete cci sleep pinctrl state.
- Link to v2: https://lore.kernel.org/r/20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com

Changes in v2:
- Modify the CCI dts style and commit msg. - Konrad
- Split mclk change as a separate patch. - Vladimir
- Remove clock-lanes. - Vladimir
- Add mclk3(GPIO31). - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/

---
Wenmeng Liu (5):
      arm64: dts: qcom: talos: Add camss node
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  18 ++
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
 4 files changed, 363 insertions(+)
---
base-commit: cd8d9e120cd9c8f1772df99a92a5ddb29c068a9b
change-id: 20251222-sm6150_evk-8ebed9e9f3bc

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


