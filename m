Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E4BC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WsL4jvS+Ga31ijLrJHkZmBbw/qA5cEWR9eTI/qq/0YU=; b=GKL2SAU60os/Om
	V+RofiVhHLIH88QqtBM749d37pIQOuqeOIillVQHJs7SCuPRJAKHWmRABOM2v7919HpBY+/+vT6UE
	YqVlfDdXimkyoU6BeawNDmKArR54txJXufZBq3wcJ2rsod0FEXCNFXyYblTxWCPs4SEJJIfDR0/t2
	wVk1I8N354HmkfzUrRMpXps6fYSazbZ7AbccdvhVu7+bxJyQwCYnqk8i9C4Q3/OiN4n9zmK71PTKA
	82cjIzBuwPvYY0vVHK/Gatw2SZVXK+5wkouo8ZnlFiDuluTCHvV1cwJKgOlWz34CyEmplJMftEIJc
	Ocsw9T+qc+/VYnuiVa2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRnv-0000000Dkmg-2FXi;
	Fri, 21 Aug 2026 16:09:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRnt-0000000Dkm9-2LQZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:09:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm6Nd3876557
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WsL4jvS+Ga31ijLrJHkZmB
	bw/qA5cEWR9eTI/qq/0YU=; b=AwtJ3m/TyJp+TmYHfMaDN5nxIh9Ip6mEqguaCK
	eb58fRKb+czLKDDBeJP+3J87Ci44GUX2hLbHX5F6IRGfpJBjpW8AdOrIAvnuCi+z
	IzB/wCF5kaiMfutPG8LXWqGCGZU0jbzzxivo+PwIe/2pLKavxgQ1AaVzkTfDCj04
	OhapEGqqkYyxT8W6nca4RUaLus633Iea0IXLMfzRwgztIkU+tMndWIJy3M/M81IF
	ceCwCR7di09dZy1DivZUeu/bbYs8ROycYKTeD57G6GD8XQf03b0DQE27ADQ2o9VN
	a2mc3BvedW9PDnb7wOHhFjKsW+/AvBUkSmOJOJJ5pLK25cyw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9thqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:12 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4959c49e054so1101348b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328551; x=1787933351; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsL4jvS+Ga31ijLrJHkZmBbw/qA5cEWR9eTI/qq/0YU=;
        b=cHQ6XMcZV35PJ70DFzMQmBHFZSlD1MSRsvhiY7owoOF4HirDzZhC57PWR5hSlOzJ40
         kl/wl2a1dKuhQzxJgFKW3b2loR0Jn39JYSAtROtovibkQuwduGBrTPZgy9wB+OVehJcM
         DjBPDl1VLsUQAfuhQu/l5gjoDf1EYlbPdcuHlVqjlf4iUPvX4z3IA3XkzOG6nUVrNnXH
         /NbAYTvp2Ul/+fPqHBa7i8JtXUfjV+3c7FvFMksUrbrhDoh1g7Wn+VcoaiiQJ1NlfCOt
         ZBKc7SdQrVc9/XJMEpXz4c598k5TmMFqxzvQ15yOjUmf/LyoqnCREdJcsKS5U3aXU658
         J6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328551; x=1787933351;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsL4jvS+Ga31ijLrJHkZmBbw/qA5cEWR9eTI/qq/0YU=;
        b=RVriiRrtQUOrR+cEe/+TI/jDqCxtZ4z3WXCSX75F5Vmq9CA1S1FPTdcvKXxaY/p59e
         jJz2vCYmlnb6Cch7KaUNkTzT57hOHc1iCCBx98nH5s5f84rSgYCEo58UBymuTJawWgfz
         xOEQonsYjVA6h/NArGdJoC1dytjE74OAdlf00eAA7ZqGN2zLaouufT+KoUxO8yA2N8AK
         Tc/FjJd0U1IjAD4b6hyW8lB8tq1aL/4lQs6OvgfRjSC0Bsr58VreJtHs6Q4aZgnlCF/Z
         /GHJaMJhZqx+ul7tk8scIAmvn46RWQEFcrwVZrEoSgZSrcqk4rCPf+GYKvR55+PGrfpb
         k+cQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXwloWIeJQk/Ltfka3cKbx0VfCkUF9psjpaijE0NuE4SXSZG+O7OIBqWdu5wG80EPTky5GYJTiQLO7tKzZRtS4@lists.infradead.org
X-Gm-Message-State: AOJu0YyfnHGcbgZKEJYPu2qZuvway3h1OJZ+ira8TN7FDFnKLolcf1TL
	Yro5LeSGkL+gn5kEqERSlcQibuWKQ8rr3lbpSA4cu2pHnjiMseT5QUWXdVBdK9ZZm2eE21EH7Fa
	yqSe5JJgBecZzu8ciJ0+Ww16O7tOeeb16f+/dtvwvybt6XW4DnsV0x8YWRrsS3fzeQYRGO/7zxO
	3XJg==
X-Gm-Gg: AR+sD12QJSS5TfP7ERGgMjpkTilzydePRbf7gI1AzKSouIlfE8zmRQI01E3Gpsjhe4G
	slxF/S5dHxbXnH6IXltCyqkxyWzJmsDiW4c5BmcurpGgNULk0XQ8GvW7Dsij/ztzuEMVRYDc3Dm
	HrSn8QnWpzy1CGn1svFx5sEiQrbKnI9byH/DGxUqEvZgzSztPTwAQRQ8GtmZCqMDoetz6pOy+0z
	AbZZGwDiztthBMEPOCA9X3dHjE4GbFeJ+jaLOroDzDNVxR1sBft9lwPGKWrhCWlaMhdGcwzNTWM
	o0VhMHzdQaUoJEJzHVtEuKvz9sgWDGHecPkAYzFw6b4e9CeSPIiweA/tydtkcXBo9aL+3MEWXwr
	87M0jQvaAg5g/cDAZMbhFH0daAoRtmi7LaDcD4UB8yhLSKLRV4k7a/gIHUqK/dlho5mIG4rHapa
	+wSlV+wndEp5TdXTBwsuVT6V4=
X-Received: by 2002:a05:6808:508d:b0:486:45c7:34c5 with SMTP id 5614622812f47-4b2ef40e01fmr8568546b6e.17.1787328551342;
        Fri, 21 Aug 2026 09:09:11 -0700 (PDT)
X-Received: by 2002:a05:6808:508d:b0:486:45c7:34c5 with SMTP id 5614622812f47-4b2ef40e01fmr8568402b6e.17.1787328550692;
        Fri, 21 Aug 2026 09:09:10 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:10 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH v3 00/15] Add initial support for Qualcomm Kuno SoC
Date: Fri, 21 Aug 2026 21:38:53 +0530
Message-Id: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABV4iGoC/33NQQ6CMBAF0KuYri0ZClJw5T2MCyhTqQrFDhAN4
 e62uHFB3Ezykz/vz4zQGSR23M3M4WTI2M6HZL9jqim7K3JT+8wEiAxyKPh97CwnqziNfW/dwOO
 6rHKR1QiVZv6td6jNayXPl2+msbqhGoITGo2hwbr3ujnFofeHn2IO/ICANaYlKClOlih6juVD2
 baN/GFhZRI/TpxuOMI7CchCFqkGLZMNZ1mWD53Xd1URAQAA
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=6010;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=jxLA9VmqlASnr9fzzhm9WsTas9antlNxLiShCgjTI60=;
 b=MDYrLP7FcQ+j9/6vo1UFppH0IwWdS86/8og5HAAgIs471fU06m2GCKJ4hbqwj3pUYTH0IYKP5
 Eyv8HwzJtLKCk7AXx93uQ9sX7aXIV7h8HAYjrLM+2imb4FkDcnRF8Cd
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXzOaosBfqNbPD
 IH7BwKZkh1trQgybb/jbmWi6Gc9oSnOPoGT/7+jSFFvUpMDS3IAXwa9Fzs7YVgiI5Sywof/28Zp
 Vkam8ouUBbXBFqPtlIoS71w75YX1YbUlgzbay1yCe8ORLzoltLn9kJdCKTzu/yCJ1mKHN0pOvC6
 BjXf/ymZYudQ+WJLgzZNGNYbe8CWGOmuiTkNEEz3CZb6W3qEGsueGkdLchldtPCiKv7V/4SWYhK
 SPAhM93t2vx5N5RUuLFcC2ZWGNsFDqhMzHHvSzV5P5p0lSBGAIXHyNSKV8oxLE0O3U4hoIKdK6H
 oy4rslgZXkiHujWV99mQ8figGSSpsGX6+w0fI/3aFpMyEjBVqS91qdy0/BXvv7IBv3WGv2TzplC
 UBU5nQtEzRbzbG8/He61H5vOIEVAftCM9T+ZBIJ86h7K/mwDPAIPOuTaP3FehhqI15WjeP7zG2b
 jYN23Es3LOTS7BYJbqg==
X-Proofpoint-ORIG-GUID: CNAL4FjDxzymaeYD28-e_01QCE7xe0D5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXxL5eJ28/GjB2
 GPinDeNxriLsr8b1yR8gwfOLoCwjdRUgzWuhhNq7Eio/aaGMo0DeNacG2LlJ3NnN5O+69OF2cfm
 jp4oBPDu9x7iSqphp2V3MEVdr6kip3k=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a887828 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wcjD13wQ9fZUy7fWwpUA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: CNAL4FjDxzymaeYD28-e_01QCE7xe0D5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_090913_627236_625DE58A 
X-CRM114-Status: GOOD (  20.85  )
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
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      |  117 ++
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  110 ++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  422 ++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   15 +
 drivers/clk/qcom/gcc-kuno.c                        | 1438 ++++++++++++++++++++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kuno.c                   |  977 +++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  801 +++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
 drivers/soc/qcom/Kconfig                           |    1 -
 include/dt-bindings/clock/qcom,kuno-gcc.h          |   95 ++
 include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
 26 files changed, 4207 insertions(+), 3 deletions(-)
---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>


