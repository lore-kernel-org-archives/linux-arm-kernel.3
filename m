Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF05CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 06:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BNDtdStOIIki9xxSs9/BB+Gr6oUDaLjPxhFCW+eeQCc=; b=KNv6CEuyAfXsYL
	U8RwCOqgC77kcab0WwbqBu8bMHc8H4BR+WloImZFDQEsNAzuGqFvKT9qKYo7c0Q2b4A418vum49A8
	rXwS8dpVOTs8Ct7PAsu1t8viIy8F8+2SAhds05qN4mw2/nzGdyF0e5YalsBZQ8MnXTfdJpxqVRF5i
	QIyWAsvfcCw0CXaWSRmZxTAEwu/neagDtNu6s4jROlzwmZI4rLhxttP227x06uv4sxrIP7bxLmoGX
	9hRLBGEthuTjCn+KCwzobZ9P+cd5tQNjMrXKhlmkWLTYujbiJc3FB5gB15F0equ1UM8h5uOsVc1MD
	ECYCcS1qSOjCpkuPAJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoG32-00000009ZFA-28mn;
	Tue, 19 Aug 2025 06:42:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFxX-00000009YIS-3muG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:36:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J39cYm026331
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BNDtdStOIIki9xxSs9/BB+
	Gr6oUDaLjPxhFCW+eeQCc=; b=EyEyXonYYSs6oBIqd3Ln5w1LpBUuXayPhDojXS
	NG3ErmNfjJRADyOdJxZpec0t5sgSYnVXjcmQgssv+XIKCSo6Ktz4xCY4FYYpWLpu
	dfHqSkicd/mXXWD+b+RotNQ3fkTpa0caLH/YBCZg4RPJ9VFIJJJi3EzNjn1l4wWr
	e+s4Z4jn3jHVDXotpBwc9YkwHda1nXxTyBzzWdsYK6g64gt54bhYSR9kA9ALF3EO
	wkwoGgh+/aV32Zxy6rY3iP2jFQHqOQMaqULtUc1AnYiFQtK8rDg3ZTFYkwu59T6A
	ADSgjhXywDifKfwj50jTFX9sg3FlAJQye+dlNtvgJ39sA2LQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cj672-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:36:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458067fdeso60305315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585396; x=1756190196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNDtdStOIIki9xxSs9/BB+Gr6oUDaLjPxhFCW+eeQCc=;
        b=Gut9lD1HlN0BM9gjihdYPFz3q1RtDh8hT07TkB8jQcG4CY87eKZhAxY26TxPVgI9Hi
         srFM/i8ZeZpdVgkmvMJ6lwf6RWFB5irticnH3w2A9jojhZcZ6auieaA6XFmk13Vyqs3V
         yIaKiWBo3R2qaApyAAqCBAW0FR2UXA6sq+E6dJ3XjfvsULrLKuCMH+ohTEyZTdZweQxB
         rXfZmmJnDYdHQlMWiy4PTjFQNP71ZQyYh3V642SKmDb/H4RVCaXgz/b6ZCI42odKl1Y4
         ACB8idCP9JOAwSrqhoUKOI5eomJAqqGfeOFIVULIpgVen9ZUANhJZaU/LriZ7ioungk3
         rVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJmR3jdqw1GnO+yiO2H1emoDDCX2pwYAy2puvyOlxl+vy12p43ChG+EpoOCum8GVWQvYa7/E7J+ZuDniSHthlT@lists.infradead.org
X-Gm-Message-State: AOJu0YwsIHIoc4459yBuniOy+n9+UTiWVF4GRRf5akf40CZEZcjmEAoH
	BQkb3f1ryR4oVvXTrP1rLqjj+vj/kipwNJUpRn2abCmg3nMY/dSeGdcEvY7Dh3ucbeKiIfz5Esf
	S1p2x0c3CCdiTzbATxr4z7jkAFxRkFEztrWoRuiAlvrjwfhFVtFPOO9cZrCU4j/UQoz+XzayIEv
	9lTg==
X-Gm-Gg: ASbGncsNKb1u2Pvyu9k2wQ6jkJb5eawguuUGKbXiKNVOgkVEvm00OaNwtUqxI4mvPEV
	jJmGI5ObMhbpI3GTj0Kt3faQdpb2PVcZc0qruwqpEN8PS3lEpt9rRHUE33kQypt9dT74NJMUVMN
	FQIng+abPq29+f4LrniK4V0ou2tvpIGxohhyR4foFVLFgWtmr/feckO6KL7EikrLy53VdYv88uH
	Wz4bEwf8fqYSC0gsPgTYRwBaup8bglBvBziJ4Cfgyfp7MABzGCKuCiy6zeZ4KKSoSdSwukYKHEQ
	A6KLNsBJ7TGVYYAxmUICWearO2zE5QCpzcdtd+LHenM+qFSA6PMMH1IJlx0SGgM4YleDir1MbeG
	XJNbiwr9g0jZ6a9trBRgpvKVR4ipybphMyg==
X-Received: by 2002:a17:903:1a0f:b0:23f:d8e4:ded2 with SMTP id d9443c01a7336-245e04fa7ecmr18016045ad.53.1755585396151;
        Mon, 18 Aug 2025 23:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7x2rlLjLEjoY6XNFKv6eIKH4qPemYI90LbCuQyKWX6k4A4fAbmZ2rJWHEIcg7kMoDk+m1Xg==
X-Received: by 2002:a17:903:1a0f:b0:23f:d8e4:ded2 with SMTP id d9443c01a7336-245e04fa7ecmr18015545ad.53.1755585395617;
        Mon, 18 Aug 2025 23:36:35 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:36:35 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Enable ethernet on qcs615
Date: Tue, 19 Aug 2025 14:35:55 +0800
Message-Id: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEwbpGgC/y2OzQ6DIBCEX8Vw7jaCP5Ge+h6NMYhr5SBWoMbG+
 O5d0eNkZr6ZjXl0Bj17JBtzuBhvJksivyVMD8q+EUxHmolUFGnFM5i1L3nRYBhAopC5KMpe8ox
 R4eOwN2uEvWrSrfIIrVNWDweCKk0X/JV0OH9pLZzxM6uncTThkVhcA1yLgh2owfgwuV+8ufDYi
 D4XHIjZnK9gySCFXuW5LGWRdpV60og2Vt8Jzep93/9hUL5Z8QAAAA==
X-Change-ID: 20250813-qcs615_eth-9e294256f913
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585387; l=1876;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=8rX82cXmDkiy7mxoulbCd1tP0xA4NYjLb7c/ZyHx9wE=;
 b=aePfqudwbcAPoG0PPnBbU0FLS0s8F7btntlHW3vUPmGfocAQIUpjWpRbyjMfijPe2uqxhVKJY
 McDY75ufw3tBmlF2fvkzXQ/MPEjYHaStCQJMuO2NDkjLw3U+Y3RiqW5
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: P30LnjBaHe-EjnnL2EDawdcRTgFm4Hb7
X-Proofpoint-GUID: P30LnjBaHe-EjnnL2EDawdcRTgFm4Hb7
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a41b76 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=wApU7nzg8TAj0S4BVTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX6iDoggphztlv
 d07g0xH09g6FQUAMlhaAZb7eVAb5nEJQyJ/9ZPIQUmJU+6G59VqycwwIfw8bQHDII7y9oGu17Eo
 msgqQ6mQ1Gvj6lF7oAvxbsz2cZnX4rkKxrse2OD/g3MdraHhIMZltRb+9+Uga34J3n23HrN/pYq
 7xd20URHG9QX32KEdCxEPa2kizVltA/KrbPnMmM/5g2CdgWUR4BcM6twhU7HdlBSc3Q8BAwDzCa
 G7n/Uo3IS0WfiesR+M9hyTeNVmUlsauYgKEKGe4YPk8HJJWckkqZ2ZWuRVcu2WPaGw4h2nbxE/h
 oHgcfIlOkYMt5hpvFBCfTLDclBSnWKribYKCULlliFJBcFBovfcLPaM9H+ZDz7pLTRcIp8/4RTr
 JVIsMAFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233640_035254_CF8AE2A7 
X-CRM114-Status: GOOD (  15.74  )
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

Adds device tree nodes and EMAC driver data to enable Ethernet
functionality on the QCS615-RIDE platform, supporting all three
standard speeds.

Switches the semantic interpretation of 'rgmii' and 'rgmii-id' in the
driver code to match upstream Linux kernel definitions. Updates the
device tree files for affected boards—QCS404-EVB-400 and SA8155-ADP—
accordingly to ensure consistent behavior across platforms.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Integrates the thread:
https://lore.kernel.org/all/20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com/

Changes in v4:
- Change the phy-mode of QCS404-EVB-4000 and SA8155-ADP to rgmii-id.
- Remove the DT binding change related to the phy-mode definition.
- Update base commit.
- Drop ABI compatibility and update the driver code accordingly.
- Link to v3: https://lore.kernel.org/all/20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com/

---
Yijie Yang (6):
      net: stmmac: Add support for 10 Mbps and 100 Mbps Ethernet speeds
      net: stmmac: Inverse the phy-mode definition
      arm64: dts: qcom: qcs615: add ethernet node
      arm64: dts: qcom: qcs615-ride: Enable ethernet node
      arm64: dts: qcom: qcs404: Inverse phy-mode for EVB-4000
      arm64: dts: qcom: sa8155p-adp: Inverse phy-mode

 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts       |   2 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   2 +-
 arch/arm64/boot/dts/qcom/sm6150.dtsi               |  33 +++++++
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  28 +++++-
 5 files changed, 162 insertions(+), 7 deletions(-)
---
base-commit: eb91b04da2c3ac17e4e67079e455fba4bfd1b4f0
change-id: 20250813-qcs615_eth-9e294256f913

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


