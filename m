Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C931C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 01:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JGoyxRWmZCHMD3A/caoBoHDEKS871mDH4i6spaluJNo=; b=OmtUHLxSUT9l7T
	pc34EzsNXFKoaIKVT97aAbeYoh7338sbXZ57wxMrJVDptct+ehsPnc5ck2f/ejYklRN1Q0BAzw/Qd
	Ur9rVnttQD4hH8+C86HCUdkr9VpzPiteqla1u2Fxn7Tt62vwzPrMTg1Uhzs55dyzuIgxmTy73Zlms
	A9OVlCiM9HfDiREiDyv2haacm2JD6dYWs0cdKz4gIq+YUgN8nxbYFmHgnKdEIF3JoVipUqQDye2F3
	2LkFtkCuZqU7A/d8KTZxjc9V5a0xl8iQrcyvhjrLY2/kfUrzo/obsV9KAdETbbCV3Fe3PYp5BmO3w
	/PEwdqadZHGpdKyTiWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BSz-00000006pC5-0vVK;
	Wed, 23 Sep 2026 01:08:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BSw-00000006pBj-3jso
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 01:08:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N0EbMt2645824
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JGoyxRWmZCHMD3A/caoBoH
	DEKS871mDH4i6spaluJNo=; b=oy8ScgO8WcSKr7Nrz2gJkgQjzkDZz2WAwAHe3C
	ZSZ3MK0hlGGv7en1LCLhos7eKPog43BQLwYnlYwrf8R6AXfxa+toIGrNukXRnI9t
	Cbs7vCaPQSeTgNo8EtoYbZp7QxCvghiVcw3uOy+z9yYc5KI6l1+X80U3hgaU9MOD
	2xZrLsxH/WfCZPgyyiaPbVEsFLcH9TxEWwsp0kI6Bt1VEdUdXojEFUy/l+TJD2RV
	4+DeFkbktcGYhAh5i+CJEAyrX3SMC5/t/WlqxOjq9ewE6FhTYwyTz9lm3OEbqj8R
	RIbnYLyzPm+VOQ2WzpGIq/JF2c2lnvM47awYOTCUEbz8vA5A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428r4ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:08:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14371f7ba1eso580062c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 18:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125685; x=1790730485; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JGoyxRWmZCHMD3A/caoBoHDEKS871mDH4i6spaluJNo=;
        b=gBGNAevl3rBIWTlHIqn0XNz8HN958Fp3WkV5ulmtImt4gCG4DMhOaCMMAQ9nfMS6OD
         P4rTYd5X1D3ks4HzPZGQImhb5EXWiw5LGIeBEPH1bYNhOxtjyaKarUR+oOvHM1bnmufa
         FVP9qoClXojY7q9bvV1YXj4JZNmAmfmXS2wDIwP7RlBdWfH7fPwK4uiSLIv3dtBIgCNZ
         UOmKg0s8eDaDv/XiQmjsH8wxtWzYLKrf/brrlVET+9LNwKdi55vKrUsETBpjg+s0dAC0
         1Z9uSQwrJTjgbb/k3/TA07Jx/K2DKWa6JPR/xdo8fTsjOZndqCzOTXQvbQdg2kO6JDTI
         f0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125685; x=1790730485;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JGoyxRWmZCHMD3A/caoBoHDEKS871mDH4i6spaluJNo=;
        b=b/QxX6lWLrYfCjQc9NcU1nv2aHY5wmmknW++a2zWL5IuDA2xQtT06MheOFmRZIUZ8Z
         PRNMKTcXD71bpvfAISGROKk9KvZGb1ZsmEpYGw3Xsvx1vzgd/850nsLf+7JxHEwn1jHs
         LAf0jCezcCEyg2ECoBL8hN75JyKXYiqtW/VPoNzO7KaGZhb0duqb+7tFuiqTiF/2Ft8d
         MSRP1eAOuf65LdcTBbzXR6Q05HkxP8YrhmFYXqWsHPGQVuU4L75iXreN4FtMO6w2hUbK
         oEXLbAm0J/cZAP9i2FXfncKAqFi//mJz/5NBgTkbNUQEP46UltXvMw/vT369Prvh7RrW
         JyMQ==
X-Forwarded-Encrypted: i=1; AKwUvBynTvBNleH0VBE6W86GSP8ej+DRsTZAzpoaVUpwTF5g5MhWVs8MOxQu56I5DHQROgW6VT+cBuMiHwQGLzyS1iq6@lists.infradead.org
X-Gm-Message-State: AFuF++n9EtpVBvSpAjkx62BpGYL9S2V98ipTVWyz/5UcQIz6mFR8INe0
	NPz6viuXfdlFKdp0Omw5XD8Qr9v9YZpuicx7l9+OYmMTnQvzOh1NlnugAF7ssAsif9EPRJIaz45
	OwRH4/b6nHCw94xLZahfsxsOty5SX/hADKnMteFz3PZzFAwQJGnImssdG0Kvh+0PzG3GiXz7rrR
	7O9Q==
X-Gm-Gg: AYBFou3MNNiBxBzKaBzPb8kRg5ycp21pDJlmCF11R1PSgNj30esnWIFDKgbxJQ51qna
	MAaYbWvnu6velzfenEfVLs1DrgUbpYC0B1c8wiN8l3Eudr0CYPW3AWNQ/DJXhXgroqdtTO18iax
	6BqSqBk7ZvlG3KzCC3ZH7r3BUjPca0GabOGjRuvrj5PwPMxsZ+5xpH3YrHxqIHnB+glzPGrMP42
	sPCGfg8skZzTOQsUwxRgHIM/tnVBedhbt5Uu2hx3luqcwwBCsfd2sGfjWQmho1K7IzTmbJ6xKuD
	I3GDws5rxMYRrzI1PZtrNOGlP0iXaXNWcIxyUhVG5V66pELMT9meklf5QkX5nbLU6xRYgWAUPVW
	A6mxbuv4/RqoyCWjAo9AjspP3JBBL
X-Received: by 2002:a05:701b:4206:20b0:143:72b1:9004 with SMTP id a92af1059eb24-144f91721cdmr1164653c88.45.1790125684378;
        Tue, 22 Sep 2026 18:08:04 -0700 (PDT)
X-Received: by 2002:a05:701b:4206:20b0:143:72b1:9004 with SMTP id a92af1059eb24-144f91721cdmr1164606c88.45.1790125683728;
        Tue, 22 Sep 2026 18:08:03 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:03 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
Date: Wed, 23 Sep 2026 06:37:26 +0530
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4ms2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNj3cLk/Nz4ioLk4vi8/KKU+NTcxGTdpDQjS7PUJBOLVJMkJaDOgqL
 UtMwKsKnRSkFuzgp5qSW6eakVJUqxtbUAGdwXLHMAAAA=
X-Change-ID: 20260923-qcom_xpcs_nord_emac-bf296eb48e4b
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=5546;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=Ci4TmBLiMpoXjBSFDZQyPnrK6xcPv6skVJDuumYU+gw=;
 b=mPxelajzt4OzX4pwVyzuH4GuJc8WRk1XziZsAh78ZzoDSlH+Sw2qgtHAh/OPsxsRKrG/uUVCD
 Z/SVyHwWktMApVUGkKJaJr5KgP68GKcGrNZ/RTXr98xpWBnXoYn4V5s
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab32675 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8 a=_sE-PX45xJdWcABC03UA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 4tWxYv9zN-XdhU4JePZOGkgq0hX1wxHc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX8RyemNRFowfv
 5eAxGel60refjhl0lfEuwCwD+m/kEoe/lgz2aHIkdpGzbRl61c/RONTMNxOhA8tqDbrPL9hoo9u
 sAOv+FQsau+N1+TawXIMfJ5VEXKbNB2StOqN0yGtB2oX0MgJWS7oLDfxoPI06No8V6u0SwbZA1J
 uWKu02eTbvp+7iO5radgb5aW66pMq4nNAeAH/tZFeSN1nJDffbNdNkF9oCUa0Y734RYWKmtiddu
 otJ0UOyN5bEXOBVFFMEX7twbIKuoGPXUmL/Ey4JhCIF+/sbNCdKgOUeu1j4rPEeTnwoTRvBgjPr
 bDdG+0mE5X5SaA8a1X0zL04blaFH3sVVsTGK1XIUD7iO/Mizp+20IkogtRPRAtXU07UCHRfeXH8
 vleXBmd51tePdusTtxbPaovpbJ908LVX5NotByT12lIGHm8GwmV2t80GkDvyTCk5BJ9Ah4UWyeJ
 D6HcNfd9lKfquZbLKzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX47I4t5uFJIoP
 PXg2YK0IFSj3wY6ZZuzryn3oQQHZWrdGaLQWR/rMQeswa9VvvRx8hqdjyu499x0uMAaME0mZyMf
 q6LRzqxeLktJ2zFGlk1zOVe4yAdkcCk=
X-Proofpoint-GUID: 4tWxYv9zN-XdhU4JePZOGkgq0hX1wxHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_180806_989029_AE0EC7A3 
X-CRM114-Status: GOOD (  22.28  )
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

Hi,

This is an early RFC which adds the XPCS and ETHQOS plumbing required
to enable 10 Gigabit Ethernet on the Qualcomm Nord SoC. This is the
first time USXGMII together with an external PCS is being supported by
the dwmac-qcom-ethqos driver.

This platform was somewhat tricky to work on, with several new pieces
having to come together across the MAC, XPCS and SerDes layers. Any
feedback would be appreciated, particularly around the XPCS modelling
and the generic stmmac register-layout changes.

The overall hardware path looks like this:

  +------------------+      +------------------+      +------------------+      +------------------+
  |    DW25GMAC      | ---> |  Synopsys XPCS   | ---> | QCOM SGMII PHY   | ===> | Ext PHY / Switch |
  | + QCOM ETHQOS    |      | + QCOM wrapper   |      |    (SerDes)      |      | USX/10GBASE-R    |
  +------------------+      +------------------+      +------------------+      +------------------+

The series can be broadly divided into two areas:

1. Qualcomm XPCS support

Nord integrates a Synopsys DesignWare XPCS, but exposes the PCS,
PMA/PMD and MII MMD register regions through separate direct-MMIO
windows instead of the standard contiguous or indirect XPCS mappings.
Patches 1 through 5 add the binding, generic platform register-access
hooks, the Qualcomm MMD-to-MMIO translation, and the runtime-PM handling
needed for the CSR clock.

The XPCS also uses Clause 37 control and status for USXGMII, while the
generic XPCS support currently handles USXGMII using Clause 73. Patch 2
adds the required Clause 37 USXGMII configuration and link-state path.

Using a small Qualcomm-specific access layer around the existing XPCS
core was the most straightforward way I could find to model this IP.
The core already uses synthetic IDs for the NXP integrations and has
vendor-specific hooks for other XPCS implementations, so this series
follows a similar approach. I am very much open to suggestions if there
is a cleaner way to represent the non-standard register mapping.

2. DW25GMAC and Qualcomm ETHQOS support

Patches 6 through 9 add the Nord ETHQOS binding and driver support. The
Nord integration has sparse, platform-specific MTL queue and DMA channel
addresses, as well as a relocated timestamp register bank. The series
therefore adds optional XGMAC register-layout data while preserving the
standard layout for existing platforms.

The ETHQOS driver then selects the XPCS provided through pcs-handle and
adds the Nord wrapper programming required for USXGMII, including the
EEE clock vote needed for PCS link-up and the platform-specific SerDes
loopback control.

This series has an obvious dependency on Jitendra Vegiraju's DW25GMAC
work:
https://lore.kernel.org/netdev/20260402213629.1996133-1-jitendra.vegiraju@broadcom.com/

I understand that a v10 of that series is planned. While bringing up
Nord, I also needed a few fixes on top of the DW25GMAC series. Those are
not included here; I will share them separately with Jitendra in case
they are useful for the next revision.

Testing:
Initial testing was done on the Nord Ride SX platform, where both
Ethernet ports connect to the on-board MV-Q6223 switch using fixed-link
USXGMII at 10 Gbps. The testing tree included the DW25GMAC dependency
and the additional fixups mentioned above.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (9):
      dt-bindings: net: pcs: add Qualcomm Nord XPCS
      net: pcs: xpcs: add USXGMII Clause 37 autoneg support
      net: pcs: xpcs: add custom platform register accessors
      net: pcs: xpcs: add Qualcomm Nord platform support
      net: pcs: xpcs: initialize runtime PM as suspended
      dt-bindings: net: qcom,ethqos: add Qualcomm Nord
      net: stmmac: support custom XGMAC register layouts
      net: stmmac: qcom-ethqos: support external PCS
      net: stmmac: qcom-ethqos: add Qualcomm Nord support

 .../devicetree/bindings/net/pcs/snps,dw-xpcs.yaml  |  17 +++
 .../devicetree/bindings/net/qcom,ethqos.yaml       |  57 ++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 drivers/net/ethernet/stmicro/stmmac/common.h       |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 162 ++++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  94 ++++++++----
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  34 +++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 128 +++++++++-------
 drivers/net/ethernet/stmicro/stmmac/hwif.c         |   5 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |   5 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |  15 +-
 drivers/net/pcs/Makefile                           |   3 +-
 drivers/net/pcs/pcs-xpcs-plat.c                    |  47 +++++-
 drivers/net/pcs/pcs-xpcs-qcom.c                    |  86 +++++++++++
 drivers/net/pcs/pcs-xpcs-qcom.h                    |  16 ++
 drivers/net/pcs/pcs-xpcs.c                         | 126 ++++++++++++++++
 drivers/net/pcs/pcs-xpcs.h                         |  15 ++
 include/linux/pcs/pcs-xpcs.h                       |   2 +
 include/linux/stmmac.h                             |  11 ++
 20 files changed, 707 insertions(+), 121 deletions(-)
---
base-commit: 6598456d72e48d779445bfec8f72114747f8b8d7
change-id: 20260923-qcom_xpcs_nord_emac-bf296eb48e4b

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


