Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF27C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e5PAjbyonBBX8bCa9McFT9c18q9TrMpdt4SO1ARd2xg=; b=FAt7EXG2jTLic2
	1GeSzphHyk3yipNbrRz7ygT7m8EjLUY4p7knovuJvqKEobpMo3JDK8wdynftx6jqHMZ0MdE5dvN+r
	WCVFltHrd/TxgFXXXPocEmuHP+IfBqKB5a2kpHn45FR7yEXKZGm9SansQEtVe+gzgNJo+sCKdYA8D
	rhSMbvZ6QKs7vzjntoI5whdzL6Kul1Gpf/xF2au1qyVAswzeO3pjqtD0h4OWpWYoEoS4RtVaygXII
	PoLc763FlAoaEOai4+hFxsLuu7Skq2JDazBoi7WOn+VbS0MiNG66rcmbCoqEl3F0xTRptFnZo6cgK
	oVLj9opDoAotxH6XpMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fsd-00000007h0G-0cIQ;
	Mon, 07 Sep 2026 20:23:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fsa-00000007gzr-1Qwo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:23:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687HXFmI552750
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e5PAjbyonBBX8bCa9McFT9
	c18q9TrMpdt4SO1ARd2xg=; b=UKNG4VVL9PcmSwbztCVmkPvy8YlAl72UQcaL9F
	8rzc9blmq146RZrd2A/qvnRzMu81FBLzOdh8oTTr76IX58bQa6dG7hgwoman8E6M
	8P5BG7pF/lMgV9FCA29bdfV9gU2i05WVIDrUSA7gjWwdVvmQrRSDnetlg4Nua73U
	v8K71Hk7TcZOkJ3l97bTJnLyjOuAXc8x/iRiPY66bdysQbpJ2M+YAPsq0/zu7PTn
	ld2wJIkP/XTzJ07b12Skvx2M3g7CaQbYlwhdDP5w3BesqnxdnCmUa6SjiLMFddiQ
	LATAZ2f7sptL6v/qRN0ad33O2gctUIEV13zcRDfEgea74hQw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwgemn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:23:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so3160206a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812625; x=1789417425; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e5PAjbyonBBX8bCa9McFT9c18q9TrMpdt4SO1ARd2xg=;
        b=d+zmB8saF7/ndomgVEGWQz5qgWmskHX6/McUabknFb/1NIM4/HUbulQMi8fDYLG6Lj
         2ZamWBL27GvL44FDyk5opb/0TRHxoPg+cdQyzposGXeHokwXsqnyl7LCpOHNvA65IxL3
         DtsYF+yitpy34T1Oo0L/0mKEm30jRdddESpH2nNvRPbKvihCdEITmbiK58mcVAEynhJ2
         Aj9304tUN+VasDuOuWVdfFmzlozxIEGZe2Pzxn57RJaB6RyXpUjEUE8D15p+Tx1K6TAC
         xDA3SBDcgrdoP6bajQyxRKQN7zC07bxZT/8DfJBQ6HUs6O4erzKMZfmmrtZf+4X2D2dE
         L2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812625; x=1789417425;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e5PAjbyonBBX8bCa9McFT9c18q9TrMpdt4SO1ARd2xg=;
        b=BrpuHVJFG0p9q/RZlvpQ98iJOgo2YtB1uTv4zpDfWVehJUdy4aPusXaZTkgxR9PsPA
         ALBweiMycMCUreL+8jkXs7AYuMD6/DEKJeD+/qmc5IcDr7UaNG3+xyLjzlB+ycPrprpx
         kutpt1OXh1s8EmXO7/DqCE8OXbJAKplTbYJwzQtK7EAwXpR1Sw3hu3zatfiNqOrZ7yPC
         z+mG0teg4Jlnb/LgNNLRYVkezvBzOhu+TpFWnTqgpK+SYlvDUKCjbr/or+6R0qCdKEMe
         Y9YOy/m0knGhXUeVPvz4dPLXtSFE11MbaazmdWwglJ6V7J+bCPSrMkVIoYBwytpM10eF
         gpPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEKwxqK/yDEMzL2yo3/mFByMUZGzQ1AlY+ZQ8QV0yOBBeIDFOs9ObRPhzqcsd1iDiD95D544DcIxsgupPZp2x+@lists.infradead.org
X-Gm-Message-State: AFuF++kvO++INESFfBR/CieINMut4BQfX8wsUeha7Y2Oi6nrKpJ8XR2B
	v/M6JjGcsNy0vHqPxd6l9xvGoLwY/TCCsrK2G0LAtKFidNNdAQ4hbCLxd/w6oFSU2l02Fl4myzr
	+txDP5gBmRw9j8VeFrzXZ3x8jHT75DEE+t2dlQZPuYH32ZQtasoXlkb4G3kgPls337Jp+p2DE6c
	D3ZMTbKVEDsg==
X-Gm-Gg: AYBFou1OXXun4Y5s0NVRLefrBC9fTldjIdG9aC3pPdjf38wpaYYQZp9lOQE5RDJTMTd
	DiRrKoaGAdlHcafreZ4JxmqCseRtXg17BSouTjniXlcwqmo8H8On9qaQ0paQhQZELDRJ2vQEast
	hKnmBtc1Hy0pywEsRWv23OiMN5RUXjJNFKIHZFQgTmdRebhrYzKlahgZsOGIgH/eV2ywttj8tNn
	Amhb1Kf4bvCESmSveAhPTTE6JkWKobopiVRrBd9orUG8uggZMX0O9AZlrg1JCwJ+n3Eoms2PzaA
	e7033pFU5GGE2fAuCYQ2l7ZlhpukINZj8UpbxA/BB5ZBFFX2g9j6cIo2PtALygWc+Z+9u26xK/E
	Le8Wi/MqOo5iWMpptZ55wKRnC7FRl3A==
X-Received: by 2002:a17:903:2acc:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2db5f8cca7emr98859835ad.19.1788812625371;
        Mon, 07 Sep 2026 13:23:45 -0700 (PDT)
X-Received: by 2002:a17:903:2acc:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2db5f8cca7emr98859205ad.19.1788812624902;
        Mon, 07 Sep 2026 13:23:44 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:23:44 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH net-next v2 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Date: Tue, 08 Sep 2026 01:53:12 +0530
Message-Id: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADAdn2oC/2WNzQrCMBCEX6Xs2ZTtT1rryfeQIrGuJmgTzcZSK
 Xl3Y/HmZWCYmW8WYPKGGHbZAp4mw8bZZMpNBoNW9krCnJOHEssGO6wEa3Pz6khBk7cUhKL2RCR
 pizVBWj08Xcy8Eg/wLViaA/Qp0YaD8+/1airW/Eet/6hTIVAoiW0ju67BSu4dc/58qfvgxjFPA
 n2M8QPUp3oPvwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=4796;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=sCoXPX0Yq3nwo2KsW4jRgJUZwqT/+Xni0RoFlfYySqI=;
 b=QME481dA0bhoLDbSXBYvkMkG9PXW95sYcvKCvp0H/2aDSQm5oUiL0uE7DBoI9GRnvPX8bWmbQ
 AEBWe4ah61QBm6PRK35q5+XDrpbYYT+TVgR/wD3NFmzdc3094MQn8L8
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9f1d52 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=ci5OYPSUn-HddWIvASoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXyUigUtAPjZhS
 MvkpHq2GLCWZwDwWthOt1seQvEQzG7YVUZjOJEcyqvVySF9tPFtuaezGK1dilNGmrLd3L1yEYpi
 y3ARfoc16AO//FgeaoROkX7HxdK9Y/WvbJ+IpP3kwDYKajTAeflnOVEviv7CggBdXS5p9pwH/Nb
 DEJXU1Jph+01hLErMeuJkOeaabMa9cEr7MVygkfsPEucBkX4YwAfRddI0Hfbnqg7vpiVbIE1Pij
 EMRlvckWhKmNRCbbUlsNfRoyQb7VU5U4HwfPHKRsjysmGtzP0DZeKzKqNs+VyYSsVFp390wNz7E
 w0LAO0op5ScL0eeKF+LPZq6kQc6nh9tuEvER5WtS5m4+CVuVoGMdPoZBHbNrYbENHeDMrHEAriZ
 4jamTqf/HonDRB12anVqyrbMtDf075arGabJddA/6wFaZj/uoMDakUAd/rtYztEhdHGmadKjrky
 1DYtnSRiR0kQlbpF6NQ==
X-Proofpoint-ORIG-GUID: wpfcsNAzDZZ48npfeYGH771naSu77E38
X-Proofpoint-GUID: wpfcsNAzDZZ48npfeYGH771naSu77E38
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX452YIARaJzQ6
 Omut5ZIuaBLxwW0iRc+/A7hm6onhMdbtBtBzQoRl38iwHDxS8LbVlY2twU/kdeVx9wiZeryl/Dq
 mfdNIfWxGWBV8SlQI+U29hA5WPIgGZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132348_530569_9CA45791 
X-CRM114-Status: GOOD (  23.05  )
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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 218 +++++++++++++++++++--
 drivers/net/phy/dp83867.c                          |  33 ++++
 5 files changed, 300 insertions(+), 17 deletions(-)
---
base-commit: 7042c8c193e5d634198b7c766bb3a01c8e3ee0e2
change-id: 20260903-shikra_ethernet-ae7bee5e804e

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


