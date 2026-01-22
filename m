Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3109BC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/MYp/oxYtk9Ft4NZVFzK+zwSsyfBXDmUHdLa/l+8vBY=; b=4YE5gp0JhLJT7W
	tCSUie6iG/1bEUeuCETz42yTDF5GXnkgHGmk7dJ6lxBsRHdeI2xVKHN9B+SaXgHqLucNvIKi8fInt
	2/HSq92Gq35bp9B+41Y3O5LjOUjF9yqII0v+6BU0T5ZGVGuHIkhmtf0jbKMiUZXUeoKNiuNn6Ezp+
	qFJrfWWsDrTJoi91g2IZsJdX4MgOU2tjqI/P4qH/gJ9Wlt1Oizum3oBQyevDMH/tx0s280JQqclKo
	xMdCkF9tpyYe8/OO0p8v6j9umcdkIkUsqdk1qfoCEhJ31aJ7g3NrUzNDCLKBWK+9RwIb6LRhoU19r
	8MGOSISVScQfC82e2LAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visFw-00000006uZ2-29J3;
	Thu, 22 Jan 2026 10:49:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visFu-00000006uYR-0Hqx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:49:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MAlm8R2915314
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/MYp/oxYtk9Ft4NZVFzK+z
	wSsyfBXDmUHdLa/l+8vBY=; b=nPcbKyPFl1LlOrXFRS5IYtwNwJ7eGQ9axLyCaM
	gwFuXsMqkZ5g+cWQqgQ5u9BoSvvITGpvTyrSnu5jpajJHy4EZ/b3qA/IlUIQHuK+
	gU5GwiYT2GefaQr00ONaxrcv6yP0jpfp+KeaD3JPwNt3qcQKbNneAkmDahx01GkV
	CZj9JrtlLROAdHvRTKsbtMB4vKLh7BSTjaNbdGal6Xwfa86MPMaecpd+VlRo4UtI
	FudTqsZlkhPRbjPvWLvbYWNlwyKNHEeWM0RgyJJcaI5dAuA67uuKoc6v5CI6rYyp
	dvzoBH6MfNcWVXREngSDUkcoztytctdOwonUTfJ7RKAqDHYw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujf2g058-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:49:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a39993e5fso27647946d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078976; x=1769683776; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MYp/oxYtk9Ft4NZVFzK+zwSsyfBXDmUHdLa/l+8vBY=;
        b=SXut4e0SdeYb6sHKbyjuWRqaNSCaBIXFE+WTmb9ypYr2G9ZrEOyixewIBqavnb1Fal
         6Hp863zcgwDIT7PgmvZTlJ8lsvu/IhEp+qpOGQUvU8IBfPPLb+cf6RiHUXzUIKhvtsgN
         /KmSQSfV+5Ff7lW2oxVNWexe0LNwkV4U/5tS6yvsOIJs0SCqJ0FgpXb2FkGaknRM4Xxw
         YVs0tFZbPffmTkEPqjqkrVXrtUGssOx7l2ILM/wdZ/nQFQy20qmoH7iMSYaY+6AemfTJ
         +DoSiABXgntl2C2vmnv5nJtxHvlvM6ia92z2ZQcKVgq8AO+S2vp4IdV4fp053tMwAryI
         3ejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078976; x=1769683776;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MYp/oxYtk9Ft4NZVFzK+zwSsyfBXDmUHdLa/l+8vBY=;
        b=gqZR+5EuQHAV3w5uBWQKufkFtqO1+QwcWeXRsP/iEdUpPmI943b5+ftrcM0ZbH0UZb
         0kzBWLGdmx6d1a2iHv8jQlqUqnqgTEWK2EGkytxeuXiBW/q+H9y6puhp2iom6v0g7T9m
         JeuEiD96qPiMUIWjPZPLFOHdAy06Cuh9PDN1beKUfl2/47sJ8tgUTByrDfmIXNHbWOYY
         /H8kzZRd4uDZ8KIXrInUzaJcNsYKu0NOzEqkQSo4r7TQlHcchii1tSqNwo5WQuJPt8pZ
         /4/WeUQlCpOAT1R2G0K7vy+T9STwG3jS3I+k9EttQxRhOalZWYRMzLBwIkeYHJku65M1
         BaKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8f4QtNPgIuhKclpiF4qYN5j4hbH1tUhr8MxsLp7dehE1nY5b9dMy0L0QMajZGDpYwUQtLRy2ixCMlTGqQp0n9@lists.infradead.org
X-Gm-Message-State: AOJu0YxZNQ5KUj4uFkwAmQYUmv8fOHS3dp0A1qol49gtMCN99TpBWbRm
	TIW4JiA5VDt/DPioxMhkEkUlldTRJsI+iCJ/4h064deFXaSDxLSg/bbWa+FD1tfkpOHnwuJPh55
	CAR4/zH2X7nkp1VGmboXyhwRe0SRDHwDzoQ3/+rsRvSXDkJUBOuxB6IxU/JR6FhJdC3H7vzWUDG
	D9Zw==
X-Gm-Gg: AZuq6aI2BqUrG8uQwF6UB+WBmmTH4CLEAFUXbCtNlTmCTgWaZZchQqFgYpoVVa0NmcH
	Wu5yehlx3xG8cwxh/J2q3wILjivVaPAo9C9ypFSNh/TIRRf9pEorsyLWGZJkjwjRobRljiB3Rnx
	JZigq5KGyR004uiLJ9hJTgwpudnegxiIb7OM/oMYVI4Ls1ogaCENIFVeMp/EKxbfXuVzKBtPbnm
	tT1hAzrqTahUzODD7du1GZRWQVdbyv3C0ruJfu26wt2G7doQdb5u2NGZwyvqMQNIhDsHzIY509+
	aGPbPmVZJgPbwERxuZqT2dPiPlXND22QWd97/env9wsy5G51e8USkuZo2mjM5q1KWZiEo9jrIeN
	2DD3xpRev5QH/Lt2q0PKDXNjfL9QD38Md6b2qQXjq+zFR74OwMpcDC+dJMnm6n1OQeBqxF92z3i
	QM
X-Received: by 2002:ad4:54c5:0:b0:894:7c02:6062 with SMTP id 6a1803df08f44-8947c0262d1mr36539546d6.32.1769078976005;
        Thu, 22 Jan 2026 02:49:36 -0800 (PST)
X-Received: by 2002:ad4:54c5:0:b0:894:7c02:6062 with SMTP id 6a1803df08f44-8947c0262d1mr36539466d6.32.1769078975577;
        Thu, 22 Jan 2026 02:49:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:35 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Add CCI and imx577 sensor support for Talos evk
Date: Thu, 22 Jan 2026 18:48:51 +0800
Message-Id: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJMAcmkC/3XQS27DIBAG4KtYrIvF8IrtVe4RVRWYSYJq4gRs1
 CrK3YudLhyp3SD9CL553EnC6DGRrrqTiNknP15KUG8V6c/mckLqXcmEM66Ac05T0KDYB+ZP2qB
 F12J7FLYn5cM14tF/rdjhveSzT9MYv1c78+V2YTQDprdM5pRRawF4bxvhdnI/plTfZjP0Ywh1O
 ciiZbERQL0IoggNKK6dA6Wk+EeQG+F1lCyLYFrWONk2LcfdH8LjOWLE21zWND3nJAFTMuuaut/
 WJDDGpKhBAAMtKdDyNo1Dxvmapogm7E/B+GFVi2lNQrqU8VNXZV1DS2OvS73HD4OMZKKeAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=3130;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=nC6j/UBzkg1YNyck8xT90UzhtDTGOguWkcxnNWp6ewY=;
 b=Xd0CsYpg8UgAyqxe9Jj2R9X0n/yVlm2cjTXkC+S6JwzzYyLfg+OKDfCYkcYmJXxCov/MqfH1s
 4xGu8GXMqtcB5dWVc3F+dYIMLIAocYY9x73zft0MScc3fVy8y0jdJhS
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: m6pSt7CS-S_RtbvEBK2TArSod5rq54zR
X-Authority-Analysis: v=2.4 cv=fdCgCkQF c=1 sm=1 tr=0 ts=697200c0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=ld4WfEqAmRoefWT_AfQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX/hDqb/8/OE8h
 qVJ3yukXGcsIFCnoHFS+bfQoFSJ+D+tvuDksMJSaEGKYcFm6PghgIFzI5elPBLu0IUDSjTQYnss
 in20rclCGORuF4d/VaeD91CvoG2G743NOrFijdqyRPkoXO3xk0z/mnPnPWgEedqZEDRSpC9KdDv
 9X1dYPBYbaDa+UCdB5p3aG/ljAktdPQ4IGuV9GjqymMseRlJ2vkeDvBQR4iA+qvQH6OWt9a0xGx
 qJTl2X8LR4hmOffN7OzXwvJSlGeIEExnxvzSTR7tnzjjj3EcuPN8tUs8y3yrvC9R0pAg9DdsFqj
 7yr/e7DxQ2gpd91s5sUuKhBV42LZaajlyCfZpORiZw//QX7dIDax5WUHLCIXQDUjW3JxYrEawwg
 av7Z2ZW1BC1yVIDR+jhj4ycoc0OWAmgbwkAy03NOFDjUHoPfPYFWk1ZgD6ItnU0Kcv179Ta9qsg
 +IL5TbJ00oAik4LlGdQ==
X-Proofpoint-GUID: m6pSt7CS-S_RtbvEBK2TArSod5rq54zR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024938_231288_AC2CC014 
X-CRM114-Status: GOOD (  15.52  )
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

This patch series depends on patch series:
https://lore.kernel.org/lkml/20260114100043.1310164-1-tessolveupstream@gmail.com/

Changes in v5:
- Modify the commit message of the cci dt-binding patch.
- Link to v4: https://lore.kernel.org/r/20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com

Changes in v4:
- Add CCI properties to the existing portfolio. -- Loic, Krzysztof
- Modify the incorrect dtb install configuration. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com

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

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
 4 files changed, 347 insertions(+)
---
base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
change-id: 20251222-sm6150_evk-8ebed9e9f3bc
prerequisite-message-id:20260114100043.1310164-1-tessolveupstream@gmail.com
prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
prerequisite-patch-id: eddd1b1714715707d386608e4f9b24396f51cd44
prerequisite-patch-id: ae777d7e17e32afc36fd1f741bb57ff0d3556841

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


