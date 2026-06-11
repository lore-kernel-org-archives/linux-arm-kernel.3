Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FE9CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E804jMacXtWtCDDLwtWj/kLWRm+8LbGO5xfXQFEkchA=; b=C6zuJd967yJECV
	A/oHFVHYOeU+ynawX4wWAcuFsyAnbokkO2mjwdtBYqRnwkHkyi2831sN06q3+/XiKPF9a95lXN/7n
	RY0H6pgPcUKlG3/84i/EQ1ok2XYqkLEIBiHBMGNTnb4IBRwFXjJph2v5KjwcDGoYI/ioDOWPRLRh9
	07qAW/gjc+17MCYNgo0WVms4UYo2l8PQfGgqqdRpBbyrQrnGq3QpTWBKJYcrJs1rRUa83ccDBW0bp
	Tbs5bWJNC1oNs/UJvJl6X7ZI5Bb3JL5eLFbhA+f0i/A1oynUF9z/sF8ZCWHlcU8gZYIvataKJNO0w
	qoYP4W5gW8qWKyNTzZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHM-00000009tHc-0uSK;
	Thu, 11 Jun 2026 18:37:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHG-00000009tFC-3uLR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:37:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIS2WO1449430
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E804jMacXtWtCDDLwtWj/k
	LWRm+8LbGO5xfXQFEkchA=; b=Am+kO7MvE2JznTUpiQv9SuQvbh0OX/Ic8+aNSd
	t1MErlnFU5i100juIcjkAXCarM8B5S2gmabQZt68Bz/+nAwpBCPvfZ1YpK3+Q77p
	Ew8ipyemW8UzvkMr4Zk2TMq+gCgziEX1lu/BX13+/TN2zxDxXSSN0B0kdv2le1Tm
	PD2I1xFfrqdubBZwQNnfXlpLH1i1O9PJHRiBdH61/uJjxUAWCAyte+Xm+CBh48J2
	BPNEQRq+5iHPnkUDfrEA2YYhNdqzcutOBfvwS+7JYrYNpdfS0WNW7aPIR7m0O4VC
	2Coe4tXA0ylM4rXC4zuEniYmZBn+suwAkS86dOLGGAY61mrA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29ur1m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84240b58211so124012b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203035; x=1781807835; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E804jMacXtWtCDDLwtWj/kLWRm+8LbGO5xfXQFEkchA=;
        b=PHb1LyB4i9YS7C7+iT51XL+uYBzWNGaBk9TcVRKSEi1Ge2p4+6bSnFB52tBq2cNQj4
         75Ggjot9k+kPU+OzUItHJ0Zib+7Gp7ViiuuS+75C8Jn6yADga5C5goqzpQ539Hc32l9G
         4PsThOjKPN1hZEYcjGCA/Aj49H7Lgc8IeSkOKLQ9bBIAU8AhKkZaul5N3V+f2VZGI8ln
         Iq3PTdV8wpaIt+Qsv4MLHMSh8H6S050HS4bti8SRtlbOouL79XYWyvw9a0zHBByz6y4t
         07QCvuCSz5pMlaTmgAK53k0mIyL11RPibFdlbQlarWRonOHL5YR0IHYAGvk5Tyh2XYw3
         Q4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203035; x=1781807835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E804jMacXtWtCDDLwtWj/kLWRm+8LbGO5xfXQFEkchA=;
        b=sUEkgRYeMXVjpZGN+ATyC2PKJVm7omCSsunLZjYzAgV2Lvs1Vef0GLAWp37gmWQEl4
         OMeAEgVQv9rXvons48p4DMXjXIIwv0iiLCxEejZBVTkUO5KhrD7L989XAxuUB2pJAqZL
         37NyviH8SLOBELQtj5DxFiW9yFLft7yIt1vrL6nae+on0ooOaTPUpsjr3ZyDG6AfVXFH
         MxfjjarIfyeNg7Y1D36kx8YuDU+FYDx875proIgK96OBDHSfFyD/fwAty9rmAN71m7H2
         Fdeajqch67D7LGQ3fPK8rEteBavLYGT5Zjo4Jw7R9J+pzJt1hSCC4x4cMqvD5Fil5jNJ
         N90Q==
X-Forwarded-Encrypted: i=1; AFNElJ/3R4cooinGw/vq7DwoNJT+Q86GfJN4rWv3SqM+6pFfLyUibDBs6bszL7EZ8ClsRmjNZgPgc6DcnFEBDfEmQHc9@lists.infradead.org
X-Gm-Message-State: AOJu0YyQTah2fRxHyhkBR3aPaURIS/hNchyHBdZgFD7MwQQMdHYq/ynt
	fQgPOm9c6n4rrwednQJWZWLfomnmEz6Qq2Io4gakB9sic+qhy6RKFsjiNK7x9v4s3ls1/h5Wieo
	ZhC8+XS1auDADAFT6XgPSQuOG//OAR3ICbZ4sc4jdA7BKxrnLc+fGd1zXAzaM5ttjKtZw6zrjoX
	SpeA==
X-Gm-Gg: Acq92OEhTJKeN2sceMToSH48VJrSkOClYfiVG0WCmAkxwyLXHij2Wo/zz4XRY+dswUn
	YvM43fEmqfqgHGmDcnMcqNF9FO3nfuPICLb6IOwU1vIbzHwVeSR9alPBfZPBSe8led41863CVUy
	KTkKr91E/WQ3Z1iG98Z5HIdOUpiegZKl+3M3G5QHTU3YR762Nk4PkHY0MQvtVUFaFGtbClGB+Fk
	zuJHDxG/xkGLMUggQ90PYV14D3OxIJ1hsuV86peD/3j/RMgWAZ1uH8eITFiePNMAscnkA/KnFEY
	v+yVgL7rVjoWkyLYtBuvXh6DiyIS+hlijOahSqO/JqVKhtKVDSbqlutiv5giK3qNkZ4bhvCcIeG
	khJiaTrMH2NzHiTgT7Af9O9aE++mw0k3/XrTAq62g0056KwNv6OQ=
X-Received: by 2002:a05:6a00:9a6:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-843370762e7mr4554947b3a.23.1781203034626;
        Thu, 11 Jun 2026 11:37:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a6:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-843370762e7mr4554891b3a.23.1781203034021;
        Thu, 11 Jun 2026 11:37:14 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:13 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH RFC 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC support
Date: Fri, 12 Jun 2026 00:06:56 +0530
Message-Id: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgAK2oC/x3MwQpAQBCA4VfRnG0ZsslVeQBXSYthJ7U0Kyntu
 9scv8P/v+BJmDzUyQtCN3s+XASmCczWuI0UL9GQZ7nONKLylncxI12WxNGlEA1OBVZLOWmI1Sm
 08vMfe+jaBoYQPj4Pg6ZmAAAA
X-Change-ID: 20260611-shikra_ethernet-11a1b318d5b6
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3357;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=zOSsQzKp9Ek2NG4SPxgCoFd3tA9TdR//8RVoOu+YbLw=;
 b=mC8YQ0sxi4GApKV3k18i5RVzeURK1818Zj96NEZXl6n//I2UQPAi66L+X+JKeTpokQCenfv4t
 981HGHRwgSGBYozy7hJolcaURX9DLt3h145D3F7ol68bmeUpGxMO+pe
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX3hgfIgZ3kx23
 0sJ6Qz5OwRsSRSe67mcv7MmdPzsSIJv87lUoTly+K4sRnlsLKe+soNIiB57S2zEgU+2bKWxOS1C
 Qcj02+WEFwlc/ohk5wh3bPVMhtgSU0Q=
X-Proofpoint-GUID: E1sY9EGidBCMarWMZYVTWk2wv3R6WMG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX7G/utVQ0QKzR
 f38xFVQKGU+P9tKbk4Q/2ohATt27s9fYOCdoC7xmV6cY8vjfegGFY4fmXIhS3XFFZM6/o5dd6kE
 h8cDQ3blJcT+SdJXHWR6Alkj1eKwt7de+WvRm+6wqDv4XV0sC8dWkDuLCgBhEsGkP8MyVGBbCBn
 V4O+8bj0lMrPvP7vgr0Rr7LqsI9Vbk0hl2Y7Ud+1hmwCMqgyl/ehZ14392SV2Q9urdS7Yhs0l0E
 /bGKDiDGbUTIQtyJNRqX3LcQHo3c0lT79ISNRar8DxYYvonCvDFFZLz0GEhldktobwWLAg2AJUQ
 BJmDf8C94at1u+Y5Fayve/RuQxpskeSTyDNFx0Rgv3hufhUOiovVxMvQl/yBUQeu/xEe6UsJ0Bd
 z3Mpn56xHxihy0ngc4Yy4HkBlOxokfjmK353iqEylrnbpw8HaRi0sGLWInPj5hpv3JzQ2BNSaJw
 b5ic4mpI7EOXGa+GgMA==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b005b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nYSQqZ2dnBPUVzQNBmkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: E1sY9EGidBCMarWMZYVTWk2wv3R6WMG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113719_118933_D947608F 
X-CRM114-Status: GOOD (  15.19  )
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

(Sending this out as an RFC because we have a couple of fixes for RGMII
handling in dwmac-qcom-ethqos, as well as a new framework to manage
clocks required by the System NOC. If this gets into a decent shape,
then this series will be split between patches for DT and net-next.)

Hi,

This series adds Gigabit Ethernet support for the Qualcomm Shikra SoC,
which integrates two EMAC controllers based on the Synopsys GMAC IP,
similar to previous Qualcomm platforms.

Before introducing the new compatible, two generic fixes are applied to
the driver that benefit all platforms:

  - ethqos_rgmii_macro_init() is converted to void; the return value was
    never checked and the speed validation was redundant.

  - RGMII_ID mode ("rgmii-id") was incorrectly falling through to the
    standard DLL bring-up path, which may add MAC-internal delays. The
    fix powers down the DLL, sets DDR bypass mode, and programs the
    IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. The clock
    rate doubling in ethqos_set_clk_tx_rate() is also corrected for
    bypass mode.

Shikra-specific additions:

  - On Shikra, access to the System NOC from the EMAC is gated by three
    dedicated clocks. The axi and axi-noc clocks are sourced from a
    dedicated RCG (emac0_axi_clk_srcg) per EMAC instance. The
    pcie-tile-axi-noc clock (gcc_pcie_tile_axi_sys_noc_clk) gates an
    arbiter internal to the NOC shared by both EMAC instances and must
    be enabled for any EMAC-to-DDR traffic to complete. Generic
    infrastructure is introduced (ethqos_noc_clk_cfg) so future
    platforms can declare their own sets.

  - The qcom,shikra-ethqos compatible is registered.

  - DTS for the SoC and three EVK boards (CQM, CQS, IQS) is included.
    The CQM and CQS boards expose one EMAC; the IQS board exposes both.

Dependencies:
  This series is based on linux-next and depends on the core Shikra SoC
  framework (DT, clock, regulator) being merged.

Tested on the Shikra CQM-EVK, CQS-EVK, and IQS-EVK with rgmii-id mode
at 1G/100M/10M speeds.

---
Mohd Ayaan Anwar (9):
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support
      arm64: dts: qcom: shikra: Add ethernet nodes
      arm64: dts: qcom: shikra-cqm-evk: Enable ethernet0
      arm64: dts: qcom: shikra-cqs-evk: Enable ethernet0
      arm64: dts: qcom: shikra-iqs-evk: Enable both ethernet ports

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  31 ++-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        | 119 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        | 119 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        | 235 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  78 +++++++
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 167 ++++++++++++++-
 6 files changed, 730 insertions(+), 19 deletions(-)
---
base-commit: 999ed3289ceea2b2808f396b4bd2f9a43dcba033
change-id: 20260611-shikra_ethernet-11a1b318d5b6

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


