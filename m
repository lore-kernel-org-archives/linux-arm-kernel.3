Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276E4C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C1+PSr9jTvLUZgF2jVOKK42FMwWjupbC7J3Dg2bJxRo=; b=Hr0X+LoGjgUzrU
	QiZFael1saNeyfctQlBtbM/X5opAOZ9yM2WxEYdhvW/7zR3JTCCi8vzlP+0KYclTeIJPdMLpKQ/Q+
	lpxx46HZeNgMdglFCjkDtHjO+9z8wOmFEqtZyGUMrKxv4qSMCLLxBt3I8FqqLGLUGz05tYT26ZukZ
	S7+791uVS3Stgr7kcYL0IfMp+WMRHc2AzrdsPtBETte/rsPtcumrh9LPJo6cvZbVbL9BBpw5rYJho
	BsbQrPLaFaPYmWquTQSQuRc6Hk/Gz8WQ632GhKBJTB+HWhWL/eD9YBvPQCrnagzBtVpV9mua6pC/Z
	Xga36qDsSoiRbF5tQ16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBIx-0000000Em6g-0SbA;
	Sat, 01 Aug 2026 15:07:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBIu-0000000Em66-4BZw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:07:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Cd0NH2819824
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 15:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C1+PSr9jTvLUZgF2jVOKK4
	2FMwWjupbC7J3Dg2bJxRo=; b=hbKYAaOgrW9VLRXjYaqYm4QSF3bAEEPccCNS3N
	Bb65qYVSGt7K6lU+Yn3yG0rj1hwH+xnjS2YNYYXCzMmon20kSuy7deb4fExMjAXU
	82SXyBfExzkM0qx8Co7efHMNpnM5VHQ9uXfPXsf2ERb8rmwz+436mK4Zft9Vevvu
	ddj+9V7l2xAsyxa4wujUpUnbWZpXZNS7H6hc55r0VRYK0pMEEJhmfN5BaUMHsfQr
	EfYrQva31ZX3GUJBpoBcDqRO0ibahO+6sBZO1DOUgTQqqa+71bXBt7NJHcY4/mZ1
	7c2HFgXQjGGscOOGb9Pec+AxTT7x9Yj/aBQN/WMCbHytWMqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfs0gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 15:07:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so34918041cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596831; x=1786201631; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C1+PSr9jTvLUZgF2jVOKK42FMwWjupbC7J3Dg2bJxRo=;
        b=R9sRmM03ocmG3BivxPyf8Qjw75YCbkbyIX17CwCNybX9TlHTbcCzAc/lzXh6ssOZn2
         79B+R6SivI7WB60D8w8i1UUR6Cpe5hpbwPp6uospdm5GsMNSDep3m+/zfCKILMXb0MBq
         uVVz86f8iS5SKPzpmyw/odmr4UIllf3nZo03RPoNmPcKIOBP6zOLNbBUB46nyPMqZTLB
         W9+591QSIskUleKG8R9p0JUzgfhfzeWS1E9tpf7FxCtRk5RZeCDAR0fAvmm3oBl/WFKO
         SQrmrKRLV5xH1FLvz5qOIU+MpTTTiahjj5kbww/tHWF2VAilSKljDoVE77V5hCaRbhvK
         GxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596831; x=1786201631;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C1+PSr9jTvLUZgF2jVOKK42FMwWjupbC7J3Dg2bJxRo=;
        b=Yqiw1m4ggCASoXtFBs4RH/gr17mL3GETYop1ztBXfHFMpdqTD7RhqBMp78cKWWpcmc
         fVAkXlBnNP44bBaTnqh5b+SRdZM2w7yeagsHw4YmyQySD4E2ryBD6587ElIr/mE9Cu1/
         sP0AvV1tJSsDai9z3UOzDnLVKkkK360X+rmvwjwWCVMkQLpYAudhFjwcaxaFJQTjeVHQ
         zx3vf0RJXMyLLg1LmxGYBcyb999VA47pKzGRx0+pau9d4ACmc+7i6j0sxnJ4ZEntQees
         Gp1nQ05Ec8mi7GjHzTDq/CTv14z9OcPLePTngFNYaB/l75imBV89+h+qUZ3VeEVZ6Z+m
         zQHg==
X-Gm-Message-State: AOJu0YzezlT0r8YaSTwu37D5g0QisFFsn54JwXuMUMpBV/Ab/qRa42Cw
	EED1bjfojvZt8+ck3eiXz+9BIpL7svabYahj67rtR6zvCkbnuuMLbbZ6cHd5cYCF/N27sI0mwu8
	vM5gjVhVHgZ0BurJUiPg5/2AgpYIVBcwW9PjrAX0ZRwROnwEbD4FK5wQUU6fvy2M0iZAN+Rmyl9
	dvSA==
X-Gm-Gg: AR+sD13/BkRLk/EYAeqLwCWQT0uxo71SSQb12lJlUmBU9fBdpB2nUj0q1crYnBFW2gH
	m7OymgFaOEYB0br/lUcGW4ukyJ0QrjHa0YesJ7VtqT714j0TS6Qt+t4bpxB21mLJtfRBJ2yg2QB
	lypio3orWRH6uYFc3Q1eaeyrXWMuL3zD7vMOwqhCFQQaKCWZcuYFVVzJ7mbSkevG40Wf50gOco8
	Byi8dJ+mhkmoZJGdVYzTp2eIGGr5ONSH4BOVvVoJEQGwmtYsNikM88VefTrv1cgOReJGl/eMzZB
	W2DvrEMxvrXK1cYzNqDWJpIkuBFTJOouiAgLLDCXDB8ITZDxQJDYA6AeJjB5fIqRp1kCLPS+jMK
	G+2jBoeTjWnMUMNeSD7gOYta+
X-Received: by 2002:a05:622a:5906:b0:51a:896c:9aae with SMTP id d75a77b69052e-52b566ae2a4mr85649351cf.13.1785596831348;
        Sat, 01 Aug 2026 08:07:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5906:b0:51a:896c:9aae with SMTP id d75a77b69052e-52b566ae2a4mr85648491cf.13.1785596830895;
        Sat, 01 Aug 2026 08:07:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/8] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
Date: Sat, 01 Aug 2026 17:06:55 +0200
Message-Id: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr2K6tqQUpODKexgW0E6hBqh0CpEQ7
 m5BE7dufvImP+/PShCcASTX00oczAaNHQLw84nIthoaoEYFJpzxjAme0TqlyiOVVpmhoeiXDkI
 6Iz0VTKdKJyIvNJAgeDrQ5nXI7+WHcaofIP1u/DYcjFNY9b9aa9BbtxwvzfF+/Wt9jimjUEACR
 S4KxS43ixiNU9VJ2/dRCFJu2/YGWhHJQvIAAAA=
X-Change-ID: 20260726-b4-dts-coding-style-strict-70f4df3789fe
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nwH2p+9JG+z7o/nKYqSaQ2vRP2rkbEajPK7I4Kq9UHM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguUT/3cCi/kZ702ZyY69ynV2TZoiTQ1KpckL
 SSs0iQfeDyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LlAAKCRDBN2bmhouD
 1+GyD/9lNCU5KMSR1vVChoP0MqrjaxU53nsd+JTHhxnALYdiX7LJzcCJ/9jFJBEm1YbOkECb1YF
 SHWbfAjh1MVkJHtwbv0gwYUn8n+61gs4Bc/5cbYSG94uS3+Qdhean+Jxv2ZNqFIXl3LMlia/0/0
 4sAlWdHSjqKg2H+QUxyZgY9gRiNHT3VQLzKQLfd4O3m9yQSEQlB3QrMRtZnY/JDLlhvUcBeIMbk
 3KY/GHBjTnuQubQPQK9xPHXWMDJVb6zsFV78vv42OusyBGa75weLSpUrtTAUD+felJv8yUhLWqS
 FwTNiXzOqK+S+jJg7GvwOwNIrHRi0tc+cSOdjwgwKSkjZpELIsfWVPGM+HqtEnMjTVdFqMJNj/s
 zhTbwU7yWINt4Xq/d4qQKExBJj7vAhYhMHx346UP34/q9HtXMVLVpLbdcK5vTec/pmnrqlTZuSI
 Z0wyoN9H0ZTwIcy9Fw1XByNuXcKouMTwh3lIXpE/TrPRfybkwj8tzTDjatiZRhWBNMQ6PvtjQ+D
 R0WtEqgi0hOr9WbyvesbNfmIF16pIqHdqF0qtGOG5/qhhqN4C1hmxUvlrPvIF+2IbPP7z3AEUga
 I8rlL+UfLseZOJh05kphwAGhc56034MP2sBEPKu4rjOZPBR85WwBOFYuK9ulvFDPMdIywpeBxAy
 o3uDY49mSH31OaA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: JPCq2du5JqaifS8xjvzpjgfOGZGQ_ZpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX901wy4jsZ1Dq
 hUA1/QQ/7ypRu/i92mrqQs9uJ9MFsGwc5TBLdM/ZnQQkhZOwaeKtf9SfASIt26mqXgM8B3hBVW4
 PXTfO4KgfULTjVGIyJh5s6eePS8RUPvS8nwmbMPDR8Eb3pKpHHRsgThu+M244x7aBwtxGm0IP4r
 +BU7V3ipLtvXflGHG5D1OQLhnNOL1kjZ5PW2WoA+5iTV7kVHYL4/opey1Wh/lvlUaJa3VOVl8ZS
 fY2Gd1vhFnap3MdTfA657IGN7ec7Al6yRaL3gNUkaYeSFw55xfKX/25MxLp+gfmeIsxgLLqJkX4
 dcEZBMNrkWg6oNVOhuos40EuDqmWE8Npkt+g5bh44iMkRXszksRN7ega5A0WMDpln18nN/i3YrX
 W28A8I3iKqI3QEMHa4elOI1Y96IW2fstN0/PQDk90lv3lLlMwl5gYQhni63XIk5PZETgM7dSe1i
 wVmBPp9MfK9zV/I/rNA==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e0ba0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gZx7o9k1dQs2gHzPI9AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: JPCq2du5JqaifS8xjvzpjgfOGZGQ_ZpP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXyGZiuRbQ6jVg
 kZOSxuFbMuBWz/p7o0b2D62iS/a2HytqI/CaVt8P3Oj5qIlp4Q29Nr2R/5GrMCzkikHck7JvR0V
 jKufY3oynDPP4gUyaDPx2Y05crnoa7E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_080713_066138_EA0C833B 
X-CRM114-Status: GOOD (  13.52  )
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

Changes in v2:
- Fix stray blank line
- Collect tags

Fix a few obvious dt-check-style strict warnings.  No functional impact.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      arm64: dts: exynos: Move 'status' to the end to match coding style
      arm64: dts: exynos: Align continued properties and add missing blank lines
      arm64: dts: exynos5433: Override thermal zones by phandle
      arm64: dts: exynos: Re-order clocks and align continued properties
      arm64: dts: google: Move 'status' to the end to match coding style
      arm64: dts: google: Align continued properties and add missing blank lines
      arm64: dts: fsd: Move 'status' to the end to match coding style
      arm64: dts: fsd: Align continued properties and add missing blank lines

 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   2 +
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         |  98 ++++
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |  29 ++
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |   8 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 167 ++++--
 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi     |  49 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 570 ++++++++++++---------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  13 +-
 .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |   7 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  58 ++-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |   4 +-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |   9 +-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |   3 +-
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         |  21 +-
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   |  13 +-
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi  |   1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  47 +-
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         |   5 +
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   1 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         |  56 +-
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         |   9 +-
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       |   3 +-
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       |   3 +-
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      |   3 +-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   5 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   9 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  86 +++-
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |   2 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  64 +++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |   2 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  12 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  81 ++-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   8 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 121 +++--
 35 files changed, 1165 insertions(+), 406 deletions(-)
---
base-commit: 59fca6221f5572ee171ec977df75e347bf18a9a6
change-id: 20260726-b4-dts-coding-style-strict-70f4df3789fe

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


