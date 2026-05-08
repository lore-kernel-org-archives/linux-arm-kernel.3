Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F48BCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4dL9MbqmO5NoZOGWEnRN0vTi6HOFxJp7JBK/cQnJ5/4=; b=OfNXvPiZ53FgPX
	iljPjpvoyjYVKjpgxbWOsW2uRWj1JCAv4V/cD4WydtkfGxub+aTruttKCPhx8tnLAiEeu9pxm9ztF
	UaB88zH5t8/QfZIOEIEYwImwunwzdUzZnW1C+fIvzNznDoTOLRnmVso8lBVguhhhLYD/tBmq5TBGG
	ee1M/pd1K6K04yifJh5BS1+SX/N995tlpOt2wKT2CmKcHJ7xPkGF/b3lfIWP5A3zNRjYdfAURwLOR
	Qcy5+VVIOauaikTqfXc377gijWpfzFrcGc5tmJ5lQiAusDlQd87ZBztE2uoeb+WbICUTJxHVq25ex
	Dp3N+mMDpm0njIOznCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJZo-00000006Meu-3zhU;
	Fri, 08 May 2026 11:41:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJZl-00000006Mdc-3fHl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:41:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485svkO1174015
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4dL9MbqmO5NoZOGWEnRN0v
	Ti6HOFxJp7JBK/cQnJ5/4=; b=gTcx7TpjQU0Idrtt+MQK5Er7+hvG8rlLcsN5Wk
	sWlfLLS5t4HkzTzj9Kb9H7a1gbmz2ZLj47mwmjazDl7+TDlA5NXKe5Ety77P9MiA
	Uv4t4WMinPlKeVAZ6AqrWnQ3xNG1z2bwF7+/eO8veO4lZpDISsOC9BVGuBw0q8w7
	2zD4AGUoCg5bJfHYkwKjtRJ6ql2HIJK4qvy/NL5W/7KqSYkfEwmoJHY/PJXN6Kzc
	tb3n7oPmTkSxjU4hpezryw7RyQ8lSFAf4KqKUv30btG/eEcN3IbR2sEBWrPAbArF
	5GrSHy1SvkfNOg4gJs3yxKKWzRfXBPcnKl/Ol9ekaqsmL8+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132hapxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:41:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ed2c173d3bso362118185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240459; x=1778845259; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4dL9MbqmO5NoZOGWEnRN0vTi6HOFxJp7JBK/cQnJ5/4=;
        b=LHXCJetS4a+6phahEcBPVhEm9P+WCKlSTVGnky+98mb3ZNzhSGLQUUZqAo7q0CxvvW
         B0XsOlr1xMh5u22iRLygOnRQ3d6gKXAhoiG0if6ytAmMYbHaeLs9ndDy9yR+pw8qvhQF
         xx5Gh7AdVMu6D7pxrRpdix0fj1hqnOFy6pd9Vyh7dPvXz4pnSf8oF4CXZfpGv5eAMmYu
         VbO4GpckghmGMBZqlGH7jApywZdxUio24XafrJUM4LTJpzH5W9NFAEzX9a7yxsTYHomH
         vxIWA0/tsEB+Mj2zC6porI/1Ql1kXIQ4H4Pz58V6EBnTt0zDvC5aAsyaynjN3/xJ3IHX
         /zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240459; x=1778845259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dL9MbqmO5NoZOGWEnRN0vTi6HOFxJp7JBK/cQnJ5/4=;
        b=TW/8gFehdybsaVyvvqRJpf0XcU+BKxApB5jY09koMa/rjJ5eysZahEIEIrYASbQ3dq
         Zi/pNRBZpwP7Sh6XFzai4vda3E6SmElsHmbtYO6nxL/pm2aAiOXbfpZnwI8MZhcUJS2O
         hDgcnK1UI9NWebxQ3ux1uRSKfNp1I4muFsyQJrfIlPE6Tfof7CPxoEb14oDU39N8pfuM
         tAsJC9qJhYl0sXiujgpUp2plz7X4sB+FknAssJPRUWzfRNxGkv06srU0xzh8bypZgQMk
         9j9Tch7T7vrjH3FfO3gbKLH4wCiVkptaKzv4ZsKNuo15coQ34lXSRkXVTNEZ04Epu/uV
         CThw==
X-Forwarded-Encrypted: i=1; AFNElJ9My5ZJpiNi5lL2kgE8xY6mQ2oGBRp5vrK6HdaNehlTtqy+zy4MyRPsdpwq2JHYfT0SfdsDwR+GFlY203k3sU2Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv2Q5bcLK5rM62AQt9uf7gx9pmWKXrXuAJtD+isz6KGZvew/JZ
	T+aIA9IsXKD5PDlVl2kQF/noKy28DZoAA/zEWWrOegntP9ZGv9J2yJCXPbJfB+txhX37w2PPeke
	k2El3y6lr8KMsSHs8PZSACQjk2yRlk3qw7NHqLhWm2sWxM5rQ0lkwnfbd+TIXK1rRXJaG1a/mbh
	sD9A==
X-Gm-Gg: AeBDievsn2V2cXp8Q5Ksv/i93d5F1oR+tKptkTcbQvcSdlwPADkDINUO4X3S0kmyIBf
	QM06J85KvLYg8G8i3o8Q/GmRjTnRxnP6cRSX0qafpwxQAIkI56hALEzaAy4Uau08xSI+IY0KHj4
	sl2lvpS5AkXc/4vRhWtkaX6zOl0IoxpRaPz7UzLsNCoZPlpycVlvwso+r+du5W7QZsT/AyUHwwr
	O8A2Bw2NNzE/GbmAnYayNxvwSo0+7wYW8QIH+b5mKi02Znl+SUHfljlq0uujG9w8cQ9EGtkkx57
	jZc9LGBBPigRzetMOa3GQV10hhC+ozFhARP2jNGNv8kGQatCWEUIH+pmMWrPurRmHJOhHygYvUM
	8ahNdStEohFrJIULrPgS3A2v3mbiwYspaeNMaeyjX1fg9G+IzGC9oHcfbXKmc71lKtSQBp8nHY8
	lscOOq+H9zmZ6KKOpAfFfDlW0=
X-Received: by 2002:a05:620a:4493:b0:8c7:ad9:d0a2 with SMTP id af79cd13be357-904d4b5c91fmr1821327485a.22.1778240459405;
        Fri, 08 May 2026 04:40:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:8c7:ad9:d0a2 with SMTP id af79cd13be357-904d4b5c91fmr1821322485a.22.1778240458927;
        Fri, 08 May 2026 04:40:58 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:40:58 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add Hamoa Evk IMX577 camera sensor support
Date: Fri, 08 May 2026 19:39:56 +0800
Message-Id: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzL/WkC/22PQW6DMBBFr4K8zkSOsYGwyj2qqJrY42K1YGKDk
 yji7jGkUjfdfOmNRu/PPFmk4CiytniyQMlF54cMYlcw3eHwReBMZia4qLgQNXTYe/yk9A1CKmX
 QytI0Fcv7YyDr7pvr4/zmQNc5K6f38M+YC1af4hWMc7ghJGfIaw0a+5yWLJdlLWqSuk1qlV8wE
 mjf925qi4HuE/waarZ2dS5OPjy2N9JhK/vn4nQADmVlm6NCIU1jTz7G/XXGn9W8z8HOy7K8ANR
 TYhUVAQAA
X-Change-ID: 20260227-hamoa_evk-2455daf43d86
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=2824;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=fRzq/bQJI2C5j5nUIqvt6eWcoRIMc2Yy8sViifhUlIE=;
 b=pm1iTN0cRuDGr++C9tkC79mDzIlvW2vPQrXX2yoIZuHLs5D9nStYfMk6lqzLZmFYv5peqDPLA
 /mfxkjq4KlbCK68I6wQ7mQp3lrECU6TeeSQrWgamAg4AS+srYfRp6aT
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX5hSvshnlsCr7
 fFfzfpTQX+hcdeeMcLDjx3c9XdBpP6GiOUtsyWqs9dwsiGhIZ0i2KtEabgVfF2U35e2yh0wWIkq
 xS9lCUumUWDwXlxx77jlT6mHhRvBYq9UVPA4BmruiZiSiLyKudc2JvZkFs3IPqBgISbcuWJ8Jh9
 Cvti3WWrksCfjtjZGQw0r9ATbxNOSmpH/C8NVem0k3BBZvMehnmq141CV4Dd/NWKtoJ6DJuXpfd
 S++akK8RX6gC28benPrpEjx4X0J8rEpKcy1niuHMCsVvFSFEoVdaYr1YfLjT40dj97tfWPMtcJd
 EEOssjxTTBD54PqG4b/Wm1/fxTsMLJjP/12U/x44v4KPGiI0IyoL7XtNiaS+chPhXA5hWe51Iaf
 LNAg4qfD01GqNYwyWIZM7RMzIHIgp0n4sjpTTX5+sThu/nR1KfatHYGLUg+8lBtFBNh6ICI5wvA
 opEhG5Ne3IvH9qusZiQ==
X-Proofpoint-ORIG-GUID: tt_SA_kFcos9K7byRbrBosAeGPl96Dia
X-Proofpoint-GUID: tt_SA_kFcos9K7byRbrBosAeGPl96Dia
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdcbcc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2_56qyuii6Uzx6krxeEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044102_037988_B849D048 
X-CRM114-Status: GOOD (  12.96  )
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

Hamoa EVK is  based on the Qualcomm X1e80100 SoC.
It lacks a camera sensor in its default configuration.
This series enables the IMX577 sensor via CSIPHY1 through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Dependencies: https://lore.kernel.org/all/20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v2:
- Drop src clk.
- Fix typo. -- Konrad
- Port the code offor Bryan's IOMMU, CCI, and CAMSS.
- Add mclk define.
- Use the unrefactored csiphy.
- Link to v1: https://lore.kernel.org/r/20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com

---
Bryan O'Donoghue (3):
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      arm64: dts: qcom: x1e80100: Add CCI definitions
      Add dtsi to describe the xe180100 CAMSS block

Tingguo Cheng (1):
      arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M regulator

Wenmeng Liu (3):
      dt-bindings: media: qcom: x1e80100-camss: drop src clock
      arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
      arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT overlay

 .../bindings/media/qcom,x1e80100-camss.yaml        |  31 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso |  74 +++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   7 +
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  15 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 368 +++++++++++++++++++++
 6 files changed, 489 insertions(+), 11 deletions(-)
---
base-commit: b25f15a8600145233c948b40cab6d7d57bac3076
change-id: 20260227-hamoa_evk-2455daf43d86
prerequisite-change-id: 20260506-purwa-videocc-camcc-fef043727e4c:v5
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: a03b10745ba5c628d09fc5278aef832864e31823
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: fecc5a4a13c8e1c35ddd2f35e7469a327ead3b82
prerequisite-patch-id: 24424189b11acee204622997908d85a0efbb2503

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


