Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83738C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YfIfvoK+FI2vd7dzKE6Ouv+LdM6/QML+2NPw7na16ZM=; b=JxX5ckNIyVmGR5
	CxoRtp3SYbgYsu4dcHez2MXqdam6ciS8oE588xWvLIlEIAN6JBip+fCFLubGw3qB6OHGBs+vim/QG
	RxIBmBhTi0frrSp5Z8+BslY5zCPqhVM7MqWmXkFAjnSnicvPsgNrv5TQOJFR+WUIFKSSe7afTefsx
	2XMQHT8gAie8GvElrmBUsK6Tv/Uv4DQWaFoSDUmgAEh3EBWpyV+euI3B3Pqm8LeIDWPD2cmZqSNQ3
	ORCtP1fA01EMXK7QD6CSjsMePiO9LuakJvpGDp2w9PUeVZrJTyMiGq95xkgUVlDggjfjWLsn4Q7+C
	XfABjzPgswDZMN3hEvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZV-00000000OPU-3Vfw;
	Thu, 03 Sep 2026 18:54:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZS-00000000OOc-2fYf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:54:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G38rJ346124
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YfIfvoK+FI2vd7dzKE6Ouv
	+LdM6/QML+2NPw7na16ZM=; b=OOUVLY6juR0atG1ZKT98zwH8K7kbnOLYTthPRH
	hUeR8qtXF7HMDhYGa7fK8YN0fgPJtGOfl0ncNqcopeU4RrTS1ebWt5h/S1fuBf2Q
	NY7tgqkOOdE7n9BJxkFSRFPn8izdUt1H2LsynnQmFa4oMBYoO2ClW6cDV45x4TTw
	qd2MNFcjJ4pnnoYsZ1SrPDXjuVkVeop062q4woV4/kzYFIDhwRLU1WHujKZfxVBW
	mHZEOCypZ8x5k6hkQNgi/6baQKTiwsmNb+G8+IbkRIv2LCoJ5prLG+0JpDY8/GWs
	3jWjkEX1q+kv8Z6snC2k02tK9Y9/0dTl5EzCe6Q2jMVAD2WA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdtqa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:53:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so123684a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461637; x=1789066437; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YfIfvoK+FI2vd7dzKE6Ouv+LdM6/QML+2NPw7na16ZM=;
        b=CnwmeDtCVON9CziXQtkKfSMPVjfv3E8rxjMNf0YVFU9M6QODbGr3puRi/jSiedGx+h
         T5uqaMihOYswD3KyoH/5B5R9glrK/hd6nYsJVVcNz0rVmdoSVc5+Bp6wc7nBz4vJpxTx
         g7jHc+n7xK0btSjWOcENnqVYTg2M6AFg0NQPo5aK8/GAG3KgT1jadUnxfiOhtYdJgowv
         z+lTEH+PMx8kgc5gK7gbru10uyfjV/9Onl2xih1EWUfWytuRyNLfvDZn4UplZf5PVpcm
         7ykoIvJKZBFnPtsd+fAOCBm3lwslbhv0YOThuPNejjCelWNOtaKpgP5Yl6JaRG29Hj4+
         3AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461637; x=1789066437;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YfIfvoK+FI2vd7dzKE6Ouv+LdM6/QML+2NPw7na16ZM=;
        b=Sf/NmAQ3U6CuBFpyDGMHogorYinoPdAejzSir5fwOzoRfIOoREGGYvIOExmH2ZgDOm
         do1GWJAfh6U1JuoYzEq4xMGue//hVRuBTHyEK5Rzt+B/PL2oMLtqc5gA2hHO5sxHKBGo
         Y7NIUPqQbwFhSTBFIN8LfafGDocwZkDdltYCt16czh2Ksj/ZY99Wf0Zlv+Ni39TfdeIn
         bbzXNbJ3QKNCnB2VjCCvCZiznDDQVSs9Vm0qa4HWdlAYFxCK1ms8TC//Nm4lKQCNw1bn
         XeNGf/G9dXV8U+7+UKyF+qJzxgiUxia5TEVfI1o/YYq/Q+piljKrmUKug/+pC08gqBED
         PEow==
X-Forwarded-Encrypted: i=1; AKwUvBwwLkiKr7jFlneLBfLEf7Yzv3JL3YKX0nG1Pb8xYknnJyGbKRuGcqM7lVZ+/RvLAWUB2f1PuQibbkGA6zGRiKne@lists.infradead.org
X-Gm-Message-State: AFuF++nV2t1Lh+SzJybIkvwBsOZuVH+qpcDWcQHokJNVZ32mBJwkH/Oj
	D27MVN5fc6pWByuP2B0g+bCQojgW7VNuUDgK52NU8Sj3Pgq5EPgwExoZcGWkuRLsensuo7Svb/C
	CNUu3GEr3icvtrWQmY9qfnoIXhduCLfoQ32aEbYUa7x8YnfVafDFoVY6/A2f1t8wbZOgfD2tfeh
	zcTw==
X-Gm-Gg: AYBFou35d2qfaLld0AaMRpfw+UwHrF/ZX+FqJ0/Q0L18INR5PcWBuzf49uLZTpg71Y9
	ufk5oBQ5iOgWGNJXiOs5EVUM4RwdrASqivPDqTD3VRPJH/53lelpanElWfos/Rs9XlyJsNkvOfQ
	s/jHwGuZ01vK9gILl9469sFdMWAWR9S57sH4vg0BCnm0DJjMMwJTZneBuDe1+bXGMfyWst4S9Em
	XMtRRrvb9G5zjrC1OOxlcWHxmERcSlow5abMXZ3BaYFTugQ5przpHQVebzwUIJaCn1PG5EjJgpr
	KuccnlpGcfCeiifJsxhlyPf94ESnglvQOaqywnWT374TTQI6WO6jbM7jkgIxXW1X1FfQCM961+J
	j8zwKVVfqPqkWS2vEiaWHqk1kT4+JuA==
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr871690a91.6.1788461636444;
        Thu, 03 Sep 2026 11:53:56 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr871599a91.6.1788461635851;
        Thu, 03 Sep 2026 11:53:55 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:53:55 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Date: Fri, 04 Sep 2026 00:13:42 +0530
Message-Id: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN6/mWoC/x2MSwqEMBAFryK9NpDxO85VRCTq0zRClE4QQby7G
 ZcFVXWRhzA8/ZKLBAd73lyET5rQaI1boHiKTJnOKt3oXHnLq5gewUIcgjKoB6DEVxegWO2Cmc/
 32NJfcDgDdff9ACahDhNrAAAA
X-Change-ID: 20260903-shikra_ethernet-ae7bee5e804e
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=3811;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=jkQki04nla6n2qSli7OU4B/MaOggI1fMv/5WEisQM20=;
 b=+v6PObHonz99GSWe5CJUTp4vTnsVNRrUqDxzeSCcBd55iqpEKpmYtvJpryC0nK95B/4Ukb36O
 2eXo90saUhfA0WMBEkqoiEMtjiI0FLhNEETdWF8B+Jd0c0jgxd4MZis
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXyOFryza4JQ+S
 vS0fU4HhRcRjZxGSm0Ts3swyKeFYFYxP6GTB0sN8dseCcV8B0DCfsgjnucdt2Jv4RP1aSsX8VsV
 y3iOZi76GxhI+BHy29uqRFbdjUYnsVo=
X-Proofpoint-ORIG-GUID: N5OF18Ab2B2BXhldC0hyoau4pzacEcB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX0bhQwrSwoY7H
 NplzuOcuda5cijW4XIT1kXwyz9Z9PjzLMuhLNP8eGJH5RQBD9fo/kKqFWHO/uABENT9tC+71LSy
 pA9+75PFty980r/gL8FDmyLMqhaLYL5TT0nYOsWFTJakApJejcj7bFDomfwjpOGWwn1+iT+Cn65
 H7/hbwuh00MCGWZdquLqbOzW4utOB7n29+J8/r7C9GwwOqrShgWjfF428pIB2CDijYakNlZIoME
 1WxPNBlRB9MYbgaB5fOSD8dZNyqbuvP9IQiOyTL6kAN1TYeTmySjrSOUduYMddHZkQaJOkFMyHf
 q2EbGneiDoKjR48ofP7u9hKPjakbGCQuQdRcMVisEj2AGCL+Z0vG1fVccJ4sBVEwNkgBl0PmzL6
 sB9npCybtlOn10yuuY8XT4F/WK/drhAkrT/iNge1aGPGQpQFyK0pTOvGxJt2wFih5zzwVJScTfO
 Ote0ZzD09tHiue3s2iw==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99c245 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=aofnmw3WZ5OT6iA2A7UA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: N5OF18Ab2B2BXhldC0hyoau4pzacEcB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115358_793943_F49B1A92 
X-CRM114-Status: GOOD (  19.58  )
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
https://lore.kernel.org/netdev/20260605010022.968612-3-elder@riscstar.com/

2. The generic RGMII fixes from the RFC remain. As suggested, an
additional patch now emits a warning (patch 6) when the legacy "rgmii"
or "rgmii-txid" modes are detected. A new change (patch 7) now
initialises the RGMII link clock at SPEED_10 on probe instead of
SPEED_1000, dropping the unnecessary 250 MHz source before link up.

3. NOC clock voting (patch 8) now uses dev_pm_opp_set_rate() so the
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
      dt-bindings: net: ti,dp83867: add supply properties
      net: phy: dp83867: add regulator supply management
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
      net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
      net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  50 ++++-
 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 .../devicetree/bindings/net/ti,dp83867.yaml        |  14 ++
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 211 +++++++++++++++++++--
 drivers/net/phy/dp83867.c                          |  32 ++++
 5 files changed, 293 insertions(+), 16 deletions(-)
---
base-commit: 7042c8c193e5d634198b7c766bb3a01c8e3ee0e2
change-id: 20260903-shikra_ethernet-ae7bee5e804e

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


