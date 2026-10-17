Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F21ACCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XMZcfz/11DnDHLN5NSRKwYjq0JKQ8gstJmfqFEICHQ0=; b=NAhrcFgXIhL0le
	lCDzDsB7xKTxhVvXepFTx+Ze6floV98Urk8G6p1XM7a096v3rJnsD/wGXAZTSMAQqDwyrKfvRWqHc
	yF6ptBZ3gFmmsrbzrqAG9+UAHeSoVbK4yE9TJTL2yboe/UYWsr9caOC76fGBLwaZk5T3LIh0wWhtQ
	aL0IPh/fcvPLY+4SSY9UymcM0bt9JVSSdb5vhxuIKMeYNBnHeVBIIRfKnNgJF5HlZbhNu1eyFrenB
	lcCqZv0HZj+Vme2mWJFENVbhaZgbElILRNHqoVcB8RSofg8ezbpxFN5JAzBYTjMddWCmM/f7LNaOa
	L7eOrSD83thHie1i0BcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0yx-00000004dJi-1APf;
	Sat, 17 Oct 2026 09:45:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0yt-00000004dJM-3vLX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:45:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o2AW1402779
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XMZcfz/11DnDHLN5NSRKwY
	jq0JKQ8gstJmfqFEICHQ0=; b=J7Bbt3X2LT9eYAy3C3H4CKUnK/KXG0ARnRqhbv
	DQ5QLIJ/y5x7/sniek3WAP9y+SBY8a78JAPBFcnGWLtVAuKBDKnfSd/HBweSEtz0
	UGoBQle51wScUN7pcRtresLvxTU/AdQUPHlqjlLcNjN+93JhKPTCBJPLr38+mqcr
	GjpuqczOD1XkhibkFA90XbC9/wre29B2QX/w2uXw/KIWEOYKVLORIQ71EuVGu1Si
	sSCJnhFgisbgyMnsEDKd4m/xm9YxaPQXCqC4C+WoBJXDonUCXEdbAQroN4tEifc3
	+vKsPREHgG19SZ/zUsrzDa93BiMd1lsoKJmOQC5m6eVQRPzA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys0s92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:45:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso3740518eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230334; x=1792835134; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XMZcfz/11DnDHLN5NSRKwYjq0JKQ8gstJmfqFEICHQ0=;
        b=AvJeZIW2jsY1DQ+vvXW/O/sY8lU638VOd3BVie+BLdFqSQ38bdPlqr91yKbAf5b+nS
         tob9i4QlJch8gO9V1Q178KJWr85LUcgsNlcIaiYXxlzjQjulortxHbuyroq/1u2G7gYs
         Ar3hUGHaTIakD8ALhXJuH3r9vspSMUnCJSf2TquwX6wkmUc898rMJ8q719ccOeSPqc4y
         nLQdwcm1eu0OuGBgT/Sv1QoOQY7b4I6I5kcbzznpbOP2h3w4Ym03L/G9FaFYeN1VpcSr
         4hHGHJ8P/t+9PgAwq9429yWD3tVa2ou73tqQahcmfz5mMzypANZMxDMX1lobO9Xd2tdj
         HKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230334; x=1792835134;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XMZcfz/11DnDHLN5NSRKwYjq0JKQ8gstJmfqFEICHQ0=;
        b=gGamOnTuLd8kKWSzLhMZ0yJFE8/LVVsIKCSsJzaS+G0wWykJZPH3pTxyRrl4Zm67Rj
         bIX13O+ssqEiosuVWYWx/nOnu9ab2scrrm9YNR0lji8ODlZMA0r5buWZsXvuzPS+YaW9
         f4JTaw1mmeB5H+WAF7xkKLYhffWCmjdRmX8HVFJaduNOEaAUCEFVNQoiTo/eIWli1E5/
         7yMYpmy8LmJLIHkEz17g0pX786IHXIkYLgZiQTBYdGm4wlIS6LmMA6B36KZK2i/zQRy1
         4zRc4ZjmFjzTPyRAOmkpIekxRvzVamaLmlELZFhp6gSJm7wnc1xefLaZ1K7281tNCPEc
         AIrA==
X-Forwarded-Encrypted: i=1; AKwUvBwvX8Hhu67LbZw0shnJr2m94FOHc++K6QBMX7tm2mC0cB24ZhxypM6cBT8FPPQPQZ3tiSdSi5SHaIHF++7oguTG@lists.infradead.org
X-Gm-Message-State: AFq9FYImVD0UZUn+ws3zbyM93ob1cBCx52Sp4qwRaVnXtGLZpI03aHlM
	L6StTR3q+KLxpS00tJvkQivxwPr8j5YjsyKj6TeoRtV94zeojONhAoyvVpZfcTewueAFCt3l/QJ
	Wr/0d0Ak9CK5NUR006nY5bykrVPgXxqhT7f8bR3ssBVjX38opnWUAP5anDxOZ9cjLUhnG+UjOhe
	JZ46BVMTXAOw==
X-Gm-Gg: AYBFou1kc8M8R2DjIOQpFiRoeHZ0LBxk0cQWj9KJsWjgHGq3kUI3c+wO/HU2GApUZa9
	r0WXc8P1mGh4KNBHB8Obd/D5wxePwiPsOmZWhkfcJ0iyGRSAkpwL7CXFxpXP2DbebP9thNwxbbI
	arMbObzUUroIpN94OJJx3vWhpjetPtBZta1+hgDvZgkfpum6qzmrHHNG95Yc9fOpaog0vCp5ljA
	MTYaI4MZmAx21Sch3EPFjzjCbJ7vALBHbeTnWP3ZTq/A0LCEb2LlbtndJmWv2oLHVuDk3B5qDFs
	J2Lk6qql1kLXByk3ziTaC0gT392TkI8CfWCEweIfNBoLSEcYvuWCI1p09KpqUOpAhaQ7tJLypqB
	yVSVVIquYfHyi1NmxKsjwfLgn31g4DQ==
X-Received: by 2002:a05:7022:ea44:b0:181:83c:5df8 with SMTP id a92af1059eb24-1851238b3e7mr3256400c88.11.1792230334187;
        Sat, 17 Oct 2026 02:45:34 -0700 (PDT)
X-Received: by 2002:a05:7022:ea44:b0:181:83c:5df8 with SMTP id a92af1059eb24-1851238b3e7mr3256364c88.11.1792230333493;
        Sat, 17 Oct 2026 02:45:33 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:45:32 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH net-next v3 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Date: Sat, 17 Oct 2026 15:15:11 +0530
Message-Id: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdD02oC/23NQQ7CIBAF0KsY1tJQKLR15T2MMbQdhWhBAUlN0
 7uLxIVJ3Uzy82fezMiD0+DRbjMjB1F7bU0KbLtBvZLmAlgPKSNKqCAtYdgrfXXyBEGBMxCwhLo
 D4NCQClC6ujs46ymLB/RZMDAFdEyN0j5Y98qvYpn7r1qt1FhigiUnteBtKwjje+t98XjKW2/Hs
 Ugjk5H+Ms2aoYnpOmCsaQciOP3DLMvyBuIZ4qoGAQAA
X-Change-ID: 20260903-shikra_ethernet-ae7bee5e804e
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=5696;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=IYXfTVPMCK/el0CMUANPRO8OaG4Oym+gcs0IAqN8PEE=;
 b=ioR6csnsJjP5p1t3JOpR3QmMOEtM7iEG5xSslMTKkeP1bLZ2CK60dEg9coNaeJ0xD92rmPXMv
 Bsujezmf7QABhibFvmlczlo6A6SR9z8A0OYYj6Z1ef5kUZQ2Q9TPvMB
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX5HKAFua2AOhH
 KaDnyDv0VzEh9FRjz27+c/jvYLABWlFsaEBLFzUqv8GbiVpsCQ3R2PWum1x/5MPxrdn6Vr+SwXK
 FRrNWG9mzmhfiU1v+tDEPAdiVVnRq/lxZ9m33QbNrFvofomDNh6C9jsDYdMdl+pYBCVLRgHN760
 jDSCdEd/TMLKmlU8y+8myWVTaeDIzOyeHcW9DjszzhaYz760rbguccRPZUZ/QTxrTrQDQyIByRs
 OfYYKQMf3fQm+cVo74NlIf/xcDfEGTaH5+I4rzVGpa6F33mcctUSkUdUxUKl8zDrqjJIZe5zAbd
 O2pXFOsvzOIUW1916CcIWtZLkZZx4g2KoIQAr1I+DX1puXCX0x5+zVVUXN+DXQyoBq1aaN5L9hx
 XJx87A2drSd2FCGrHZ7NX5sS7eB7WsWfHODx/ku++zGj08/C5Tx7i3Swc4HNRMOSzXf3al03Tdq
 L7fyGMEsdDFmpKsJmtg==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad343bf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=oTwP7VKmK1vJnwN5z0oA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: rRdwkXX4c8l5AMQuFom4toSiP-mfDki9
X-Proofpoint-GUID: rRdwkXX4c8l5AMQuFom4toSiP-mfDki9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXzIC7/o4cdhzW
 VHo+fbQJfvipALVWjOAmbaV73BK2/yMx+tAvW/yKUMTioKuRPPxcd7Jfti6Psig6voSFBo7Ex6y
 x/BF2YZwpU+84ndyn4Rv1kQigI+JZYE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_024535_990106_4BC6DC7B 
X-CRM114-Status: GOOD (  24.88  )
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

This series incorporates feedback from the RFC and adds the dt-bindings
and driver changes required to enable Gigabit Ethernet support on the
Qualcomm Shikra SoC. DTS changes will be sent out separately.

The series has grown from the RFC and can be broadly divided into three
areas: PHY power supply management, proper support for RGMII ID mode in
the Qualcomm ETHQOS driver, and Shikra specific clock dependencies
required for NOC access.

1. Shikra EVK boards use a GPIO-gated regulator for the DP83867 PHY
power supply. Patches 1 and 2 add supply management to the DP83867
driver so the PHY driver holds the regulator vote at probe. These
changes are largely inspired by similar work done for the QCA8081 PHY:
https://lore.kernel.org/netdev/20261015143849.483339-1-elder@riscstar.com/

2. The generic RGMII fixes from the RFC remain. As suggested, an
additional patch now emits a warning (patch 6) when the legacy "rgmii"
or "rgmii-txid" modes are detected. A new change (patch 7) now
initialises the RGMII link clock at SPEED_10 on probe instead of
SPEED_1000, dropping the unnecessary 250 MHz source before link up.

3. NOC clock voting (patch 9) now uses dev_pm_opp_set_opp() so the
required VDD_CX performance state can be propagated through the clock
controller. The Shikra binding (patch 3) is updated accordingly: an
if/else block constrains Shikra to exactly six clocks and requires
operating-points-v2.

Testing:
The following boards have been tested with this new (proper) handling
for RGMII ID:
  - Shikra CQ/IQ variants (with the TI DP83867 PHY)
  - QCS615 Ride (with the Micrel KSZ9031 PHY)
  - Talos EVK (again with the Micrel KSZ9031 PHY)
  - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
    regulator for the PHY power supply)

Changes in v3:
 - Remove #ifdef CONFIG_OF from the dp83867_power_on() function. This is
   a result of the recent discussion regarding similar handling in the
   qca808x driver:
   https://lore.kernel.org/netdev/atCSWZQAyqvz62_K@aspen.lan/
 - Clean up the -ENODEV handling in dp83867_power_on() and use a boolean
   to identify if supplies are provided -- Lorenzo.
 - Patch 7's commit message now says set_clk_tx_rate instead of
   fix_mac_speed -- Sashiko.
 - Add a new patch to abstract away the common dwma4_addrs for different
   versions of ethqos rather than duplicating them -- Lorenzo.
 - Use OPP table to set both the required clock rates and power state,
   update ethqos bindings accordingly to specify how the clock rates are
   described in DTS -- Konrad, Lorenzo.
 - Link to v2: https://lore.kernel.org/r/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com

Changes in v2:
  - Collected Maxime's Reviewed-by tags.
  - Updated Patch 9's commit message to explain the double enable vote
    on the "stmmaceth" clock. Open to discussion on how best to handle
    this.
  - Wrapped regulator vote for dp83867 inside an #ifdef CONFIG_OF check
    to avoid adding an unnecessary 200 ms delay on systems where
    devm_regulator_get_enable_optional() would return 0. The change now
    mirrors the QCA8081 patch -- Sashiko.
  - Fixed ethqos_set_clk_tx_rate() to double the rate for all PHY modes
    other than RGMII-ID -- Sashiko.
  - Moved warning about the use of non RGMII-ID mode to probe instead
    of fix_mac_speed to avoid spamming during each link up event --
    Sashiko.
  - Fixed error unwind drops OPP before stopping link_clk -- Sashiko.
  - Fixed OPP vote set in probe not cleaned up on error -- Sashiko.
  - Link to v1: https://lore.kernel.org/netdev/20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com/#t

Changes since RFC:
  - Two new patches add supply management for the DP83867, replacing
    the gpio-hog approach for PHY power -- Konrad, Andrew.
  - Use dev_pm_opp_set_rate() for the NOC AXI clock and require
    operating-points-v2 for Shikra -- Konrad.
  - Warn on legacy "rgmii"/"rgmii-txid" to encourage DTB migration --
    Andrew, Maxime.
  - Updated binding document for qcom,ethqos and snps,dwmac.
  - Drop the duplicate "axi" clock from Shikra's DT; use "axi-noc" and
    "pcie-tile-axi-noc" as the only additional clock-names.
  - Initialise RGMII link clock at SPEED_10 rather than SPEED_1000 on
    probe.
  - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (9):
      net: phy: dp83867: add regulator supply management
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
      net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
      net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
      net: stmmac: qcom-ethqos: share common GMAC4 address table
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  55 ++++-
 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 259 +++++++++++++++++----
 drivers/net/phy/dp83867.c                          |  32 +++
 5 files changed, 297 insertions(+), 52 deletions(-)
---
base-commit: 8b71f1f5a28347cefb1a4711c4eeb492d5c619fb
change-id: 20260903-shikra_ethernet-ae7bee5e804e

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


