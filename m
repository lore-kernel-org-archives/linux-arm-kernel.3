Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B26C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xgZvAtnkh1TR5Z0rCcHGoMjGuVCV0EFXGJ3p8XQKkqs=; b=wHyIUiTbZ1+gTO
	wg99m12dRKCwQxLM2OBr/c/5h8q80gEH8ZhhDXbKckUPw4c+aDpCDfOMnnWAGZ4VpscSuswOXhNGL
	4aWDNwejG6B3GUPxkblu/AHVtiXr8qlrGe/gL1s/phyLB3OCrPkQmLqj8VtYu68N+75AGogyHA+Lq
	jiC0JbgIrRb/dMoPtFfQmr87dPoxys0LJxs3WNXa8XdMm48gpJ0tfoDdaoHYNZ5e2Ho8i8BOQDsUg
	JAVVSetynaLk5NchSiI8CveId/zkiZI8f0WVZ6lLmI1DNipwPw/UkdHhMoD/9yv9Z0MAJZLJXoEtF
	aZlTdKca7IkoisSm02sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGB-00000004VFT-0FE2;
	Thu, 27 Aug 2026 17:51:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeG2-00000004VDb-0fQi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:51:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXb52419729
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xgZvAtnkh1TR5Z0rCcHGoM
	jGuVCV0EFXGJ3p8XQKkqs=; b=ZD67LebbZf8qCVux1rp9Y2wNnJkJCBqlrw5ey0
	ep0iMdx7y2saZsArzypCM2sGkxUMt8bSeCb/AawMR7eiG36cFqzvWmUZ4WEV5gsf
	rCeCaYfYK4lb+PwQ/NrwC+IcSGImogKHwyj5mgXOX92nRkqn/pqr/Ug8amNSPFPS
	Aps1Cr2u7HoEDdygr1fXj1pVrJs3ag9+4BAkV+FCDoB0ta78jLp1w5jqt2V6qC8S
	dmd/wWTt+0i7xI2g8xgaP2koiYrtFAFMHfD/Teqsk2FEbOrB8BNDmTQzu1Sa7GGS
	j6awogirQtvB2Z9SQz3qiuUIulmDwYIDI6ptXn4/CbHvk3cQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjftktk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so1264515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853080; x=1788457880; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xgZvAtnkh1TR5Z0rCcHGoMjGuVCV0EFXGJ3p8XQKkqs=;
        b=ayQJnLLgSSPTVXhHhi5DnbC2kTE77fVkbiBvtJPFZmDFC0qgFG/XUKOSK+tYwmsr1u
         RsXcjYs6dQ+LSx9zVRq7LFTZUavw+RZrSC2G1pPRMO9/TWgJkdN1diwMFplkvihbm1Pt
         HnI+Xg4V0lyyzDnVqYRsg+NVobo//ZXbrsF3N9mdIS6No8E+gHwqZPT+/rbLqaPNbBDa
         LVyuzf/D8UusGxcnN/lnDsXYZsMrcaio66BbQaS6Fczq9r2Gm6vnXSt5j3yPLJKmf2SA
         xn8GwLegtm1cwF1yQfNOLf/oUU/kAxzKu7YYtA/iyYcDTF8P4u/+mBjn/TEq+4thuDFk
         EDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853080; x=1788457880;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xgZvAtnkh1TR5Z0rCcHGoMjGuVCV0EFXGJ3p8XQKkqs=;
        b=Y9UCsUba7C7QGrvk8QGb8ABATgeYaltLdSb73RAz8dZPVzfnkE7xBeSbGf5+DfsCnz
         mWSqkLUpsA2sPeB7piRU8uE/WDVP5SfaYua84lXKE2PPxozMLYWsxez0NCAhlTeMV7NM
         V10KFt3rsIYQ397ZQiCSnOtf5RlFaIxa1TmKxGYO2h9gtWS3bb+i18y7hOBFx5U4nQOL
         mx2eRVCecVhtZZy/ZwAw3IrJ4kWE+zhd22AQBxVXabew/gpQSUuUtbhKgC0DcD/JrcDU
         qtaBfmmPEC5WyZ3poVj7/Lkuk+aD4tQquVqBhejNe6Q8oKrrbH0lUFkfRm8PKNYHWO5H
         DmGg==
X-Forwarded-Encrypted: i=1; AHgh+Rp03hFLSTwKbfq0fUbfSHt6QpXMckB4J19j8B8P9PTQDeWH1onUN3judpFcj+75KFtBEwsE4CfYUF17y6ZsgJSL@lists.infradead.org
X-Gm-Message-State: AFuF++nChwqErFqW0OD5spbuj4dMcYC3Rzc/fCbeUfiVzEQG7cCJ9/ho
	NliTwKX2vRFbAQPa56mdJd6NZ6ZGF1diSBics9PPSdSaniLeuYq0x9nsD1vsS20+Y0kUaBnaM7L
	SOUTc3LzKHqS8ppDhUbuySMBHlNOakq8YJ4hh6LjRXFV/O835f0UyxhbHqk8DGR6uYIKfMkgiul
	4TkA==
X-Gm-Gg: AR+sD10XrqdFZHAHJ+0R7gyXg+BibnUpnHC7gHtoKEFCtbfFANu3HAePC/9RfH/RUa4
	1Obe0n+vHK+ZvAg4Lli38j+24TKELSgQ07dvoPNxMp9WqBgWfaCmai9eInPQKdr/Jc9//UGiAII
	D2yGW4QC07/PcvX/ma+KNYULfk8k4IwepW/38sLSU6CSRX1YK8CWHavN8VLrViT3Uziy2aFVl/i
	a8lADx9CTFJ8Ya9isKbZGvrNv17svIM7cmbuE+RAfv4iKvFkVUCamwwTZk1KCOgdzAvIgk/Sz+q
	gL5HkZqyFrWyVVCE4nHfWKBT5rt1/9oaZng2WT44UgOGXVm5JA+RvTDxKcc1Ygcty9pKdPDCGoA
	u1enyGQ+pPCNCL5Hai7TjekrI6kGiPRRnb0f5/c5N1KpnZyrrasff0r7I5IAtuSBmejD7TEPtgK
	9hp0OgIZS/0ZHsKP78YGN4ApY=
X-Received: by 2002:a05:6a21:3390:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3d2685a9673mr866157637.17.1787853079487;
        Thu, 27 Aug 2026 10:51:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:3390:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3d2685a9673mr866064637.17.1787853078944;
        Thu, 27 Aug 2026 10:51:18 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:18 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
Date: Thu, 27 Aug 2026 23:21:03 +0530
Message-Id: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAd5kGoC/33NTW7DIBAF4KtErEs0/BjsrHKPKAsMQ0PSGAdsq
 1XkuxenGy+cbkZ60pvvPUnGFDCTw+5JEk4hh9iVUH3siL2Y7hNpcCUTDlxBDQ29jV2kOVqax76
 PaaDMmbbmyiG0npS3PqEP3y/ydP7LeWyvaIfFWRqXkIeYfl6bE1t6//ATo0ArBHQoDVjNjzHn/
 WM0Xzbe7/tyyLIy8ZXD5IbDiyNAN7qRHrwWbxyxcjjbcERxWKOQtwKUUPUbR64dveHI4jgnpOe
 i8paZDWee518VW81BoQEAAA==
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=7496;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=5X+jgygeM/R9MNvIWMo/5BN6WhjMIfX+055sFgzWCYA=;
 b=8xX1WDF0njWw+gA0gYAOtfXvnEgBqUaS/mBYAmOoDsAEd5Iw3lH+VY1uPWLbymUp84ExSIPyl
 uOu3/NNsMujBKFJ/4TIyxutl+RAhR48MyCmfbPcvcpzVfLfPrJ8zWCQ
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: 6Ei6gE0ZzRGvdv3Vf7Yj5lC1OOSPc7yQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX68rsjQPxLQKY
 IlPMZgARH38KwrGM9zcdWB8vjlLgio16fhD826yM3epvopVTTH1VJAyw2y6mnJjZg/DNZ5t9sQK
 2tFoJ4nmZN8WVJUGeblURSRH5zc2XxIR2jwgkWbgG6YGtUY1ljLKvePOh6i/lkvEs5iI5C7XxAi
 gQIsT7SdyAQNENTDODeqoalKNXE4use8sPFV7Q9FrRz3N83GrZZRBZWBYMvrTWzsKHzk9U05ofQ
 5XYYMshbPxHyh3P/kxmxj3ul/AIoG+Xpn2cNFYlFPBTDDglO+BM6L5N89vY2xe9ZR4H2Th3k2Zg
 qCxj5pLmw2/2Ww9C8LCVKK4UsByArMiR5jJUHBOIw7dPJ20RuPMz1JhidjJzNXRE2vdEX2wcb1m
 9mLSMsfuM/xHQg4IE2wf0TPQNBbcl0MBRYjul6zIwtE3ETmJGGW6g0tQzDMCSWNtJxQj9YQTIiT
 /ghiXc8t9R2VBufuOQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX8iklxUstWypY
 aJR+2GglzuwEBpqho99RfX3QJcElBgHxES1wNUAUZC7VcJpy6YbiCSW7wOheACo1WA/VzUYf+n+
 2MzgbX/Kr7JRJQPUswXtFkyxI6qhddo=
X-Proofpoint-GUID: 6Ei6gE0ZzRGvdv3Vf7Yj5lC1OOSPc7yQ
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a907918 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WLf8-PhWrFoBkVTCP8sA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105127_143880_551EDCFB 
X-CRM114-Status: GOOD (  20.40  )
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

This series adds initial support for the Qualcomm Kuno SoC and the Kuno
IDP reference board.

Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
the essential SoC infrastructure required to boot to a serial console:

  - Global Clock Controller (GCC) and RPMh clock controller
  - RPMh power domains
  - Interconnect (NoC) provider
  - TLMM pin controller
  - PDC interrupt controller and SCM firmware interface
  - Devicetree for the SoC and the Kuno IDP board

The soc: qcom: geni-se patch allows the GENI serial engine driver to be
selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
depends on.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Changes in v5:
- Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
  (added in v4), so like the other Qualcomm GCC drivers it must select
  QCOM_GDSC; otherwise, in a configuration where nothing else enables it
  (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() returns
  -ENOSYS and the clock controller fails to probe.
- Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Changes in v4:
- Addressed v3 review feedback:
  - Registered the interconnect NoC provider from an explicit
    core_initcall() instead of module_platform_driver(), matching the
    established qcom interconnect driver convention.
  - Replaced the NA mux-slot placeholder with _ across the pinctrl
    PINGROUP table, matching the upstream qcom pinctrl convention.
  - Added minItems: 1 to the interconnect binding clocks property so a
    single clock is valid (system-noc), and aligned the binding
    examples with the sdx75 labelled-node style.
  - Added GDSC power-domain support to the Kuno GCC: the binding now
    defines GDSC macros and the driver registers the EMAC0, PCIe and
    USB20 GDSCs, so #power-domain-cells has real backing providers.
  - Split the cpu-idle-states phandle list so each phandle is on its
    own line.
  - Collected Acked-by / Reviewed-by tags from v3.
- Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Changes in v3:
- Addressed v2 review feedback:
  - Reworked the interconnect binding clocks: dropped clock-names and
    replaced the flexible min/maxItems list with fixed per-compatible
    clocks (aggre-noc: 2, system-noc: 1), required where present and
    disallowed otherwise, matching the sdx75/glymur shape.
  - Made #power-domain-cells required on the Kuno GCC binding and
    declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
    is a power-domain provider (following qcom,sdx75-gcc); the driver's
    GDSC support will follow separately.
  - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
    a distinct qdss_cti_trig1_mire pin function (and allowed it in the
    TLMM binding enum), as the duplicate funcsel-2/3 entry left
    funcsel-3 unreachable.
  - Collected Acked-by / Reviewed-by tags from v2.
- Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Changes in v2:
- Addressed v1 review feedback:
  - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
  - Reworded dt-bindings commit messages to the "Document X for the
    Qualcomm Kuno SoC" one-liner form.
  - Canonicalized copyright headers on interconnect binding / driver /
    NoC ID header to the single-line Qualcomm Technologies form.
  - Dropped unused <linux/mod_devicetable.h> from the interconnect
    driver.
  - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
    driver.
  - Extended interconnect binding to optionally allow up to four QoS AHB
    clocks (matches sdx75/glymur shape).
  - Cleaned up brace/space style in gcc-kuno.c to match peer clock
    drivers.
  - Reworked initial DTS: moved idle-states / domain-idle-states inside
    cpus{}, wrapped fixed clocks in a clocks{} container with peer node
    names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
    stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
    idiom; the YAML example uses a named placeholder), dropped the
    RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
    no corner votes / no pm_runtime, so the reference was inert), and
    added a bootloader hand-off comment on the memory node.
  - Collected Acked-by / Reviewed-by tags from v1.
- Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/

---
Hardeep Sharma (15):
      soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains
      pmdomain: qcom: rpmhpd: Add power domains for Kuno
      dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
      clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
      dt-bindings: interconnect: Add Qualcomm Kuno NoC
      interconnect: qcom: Add Kuno interconnect provider driver
      dt-bindings: pinctrl: qcom: Add Kuno TLMM
      pinctrl: qcom: Add Kuno pinctrl driver
      dt-bindings: clock: qcom: Add Kuno Global Clock Controller
      clk: qcom: Add Global Clock Controller driver for Kuno
      dt-bindings: interrupt-controller: qcom,pdc: Add Kuno compatible string
      dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
      dt-bindings: arm: qcom: Document Kuno IDP board
      ARM: dts: qcom: Add initial device tree for Kuno SoC

 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   52 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      |  118 ++
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  110 ++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  423 ++++++
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   15 +
 drivers/clk/qcom/gcc-kuno.c                        | 1483 ++++++++++++++++++++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kuno.c                   |  988 +++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  801 +++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
 drivers/soc/qcom/Kconfig                           |    1 -
 include/dt-bindings/clock/qcom,kuno-gcc.h          |  100 ++
 include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
 26 files changed, 4271 insertions(+), 3 deletions(-)
---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>


