Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFDDC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/p0lRupYwuhASYZA8idRjFcEvQiwEq1WLL963CYERkQ=; b=2B0+xZKKMp2AT8
	USorKhtMC6rh77EYZQJcV3/Z7FbDJ5WrWOmtK3HpbpZt/T6LgrjipF7V2KlE3gG9FGNRn4WKKTbhQ
	BqziQqsYkgVPZnFm+XcfEQWYWnuTqJ1Pz3GTXfLqnjSGXfLvvow3R8kXQnBYiT2JyyINRGnsJ+gaG
	ZRbYZSd+tGVezSrFMIkgV8w0NK11SM39gQVcNhWKg7GHiF/iD4vycFWnr07ql1uI16RBIVL7Weu8s
	DNgLw+cK+ht3arHb0h+vUOsPxDYf7WfO3Tri6fxeymUDZ/IdP6zWbhYMb41Sdv3nzKdBzZrEhspoa
	ej6Y5ikn04erJs6D4zFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Tm-00000005qbS-25n8;
	Tue, 22 Sep 2026 15:32:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Tk-00000005qaQ-1Wf6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:32:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjMcY318235
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/p0lRupYwuhASYZA8idRjF
	cEvQiwEq1WLL963CYERkQ=; b=fic20CR8/WdMqlYLe0WAzOmYBwgwwWhgyyI/5F
	Arsz7977b4kCmhCvJV4jylF/aNMhZlviAMGBbSJwaD0ILFBR37BMEHFGGQJjmTyz
	wf71KkoIrim0sxt1MrUE0ClOAvu+JL48ZIccKUfbFskRU8P4XstQ1ExTQJ1ePHOK
	Yq+NJsqCh5zRIns50r+F9jwMCxGxHEnMX40nH20bFHwXbhGVKvzTHoqi9OtJ+H2e
	Tkq29mPT+vv+6rur0y+LFTXNdYSMNc//KUHORdizDrUn2ErMO/2F4JaaVfHmZPyv
	HdhQR13FFk27pacqIIwrS9lQZW5EZ5MB/ozU7u8LHvSZz+tQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqhudj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:32:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df375fb9b2so36779655ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790091138; x=1790695938; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/p0lRupYwuhASYZA8idRjFcEvQiwEq1WLL963CYERkQ=;
        b=I2ght6DzA3bY3uXRb53xJBp2GjsyyNjPdJDAAXLf5XlBOwjzciujB4y6WkefzYf/jv
         3jANT7CtWHAu/25TZ4/3kguQ5ihtyET0NINEb80K38evZtvhIgOIWTEXgKECAQFK9YAb
         ls7lhFbMleiPhUiyicO/Qh5QpkvcHHJ3tj0rW3arFlTRh9ULEhlnl5tWQ9oB1hK/YsTs
         hnFThxfpUzqu/sbHcpPZr+2KFUVkyklE7Lh7QV8JpMmfsqnqwtysspvLX+Bz64IDc8rt
         G8GXClMFo1W2dAGAtcRbVX6/3dN53NkZ0/XAd1RaOPQm3OTE1qOhj7H+jZbgU5LRg0x1
         B6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091138; x=1790695938;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/p0lRupYwuhASYZA8idRjFcEvQiwEq1WLL963CYERkQ=;
        b=1DZ2w+ggVK6rsXPUmpqN5RsIDvNbWFxrTLcL7+yu6/zn+fKcHuZKEjeX2BJtzgnn3M
         IGYHx+zZIzSkKIwybrgXbMPs4jK8TklUIpv1Lpw97y+O8Sk00KVzDjxkqwMVheW08fuB
         clD5Dqna0V6PXPuOr81W5rT/ayAeTGneu6wkXZEYZK6+Ow9haE122FS9TZb3AMvW3ren
         3OTnflQC1sC6WRuY3KQ0EN8QEEXA52WV1vF35nY9BLOPD28koF52J1Q7P2mX6/ONAmE8
         8iIa9tB27U39pNzyyA7lBLh0gkf3bZGv8qdZcY9J8wraiu47WWRgWuNS7aY5c+6OfsoE
         s2uw==
X-Forwarded-Encrypted: i=1; AKwUvBzUVIH9UkkT4QmG5P9kYEgGbJSXTCw/yTkQEsLpE1srVFpN7J0OPkDGxNgkpII+cXsmWcavuYpvUPxPaKVVf8mO@lists.infradead.org
X-Gm-Message-State: AFuF++lM2VbYkaSxXyD+c1h/4wNSu65I2MF74T3IfUTzC1Ocl6Rpp7V9
	xB+vYegzfmjxDEPTz9d3iHdP42IUd4xgxpG9Xs6+GJ39lSqZrxqf2nnl7gk68cRbrkyrWa86+ct
	g4zgR/1b91r5N53PC+/UeV2SQpG7ksBf5Vs0/Uz7vZlUs9D3GPP6+OqKSgbKu2AFG97MIg+ZNeR
	lWuA==
X-Gm-Gg: AYBFou1bdprjH2NotFgNPqxvmLnuArJlLdm1Wf0ccBP2PpTVU+voU7O26oEnjSP3eWO
	Oo5u0A2RnPE/KCLgk36AKCelLPi10YZ+jdugZkqHkeFUNnqKAsT2GOxSiF1jwsK4nqmlVPsz8FF
	4EjuHa2nhlQd6WFBnScgVnXck4icGQnNBOtwUMoCLdYRvyzCp0DT6D3RXkNGyjJg+i5E2divJU+
	GEYVIrEoXFfIep+ABWw72lwJPZNmGPA4DTLNcdBZOIAM2OOhzdMSVo4LtaJnEET5T9/8ewTLXHV
	DofrGfLvaX1saBFSYvrH1ustc6o7KA+h3f8blft1KfIICEq83K/cPv5RuMmI2feXlBbcIm7NEsL
	ZWW8p9XEnOV2yopvXGPGO8p8nomXdhhzYxm4=
X-Received: by 2002:a17:902:ec81:b0:2dd:c0ff:e723 with SMTP id d9443c01a7336-2df60b66f9fmr19445435ad.53.1790091138140;
        Tue, 22 Sep 2026 08:32:18 -0700 (PDT)
X-Received: by 2002:a17:902:ec81:b0:2dd:c0ff:e723 with SMTP id d9443c01a7336-2df60b66f9fmr19444995ad.53.1790091137602;
        Tue, 22 Sep 2026 08:32:17 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047c40sm12334945ad.50.2026.09.22.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:32:17 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v3 0/2] regulator: rpi-panel-v2: Add vcc-supply
Date: Tue, 22 Sep 2026 21:01:58 +0530
Message-Id: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6fsmoC/2WNwQqDMBBEf0X23EgaidWe/I8iJcZVt1Rjsyot4
 r832mMvAw/ezKzA6AkZrtEKHhdickOA5BSB7czQoqA6MCipUpnLi/Aj3T22IrNplukq0agrCPb
 osaH3sXQrf8xz9UA77fXd6Ign5z/H1aJ27391UUIKaXVuTCrr5NwUjjl+zeZpXd/HIaDctu0LZ
 Y50NbcAAAA=
X-Change-ID: 20260907-rpi_reg-8c6885b35e5b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790091133; l=2083;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=qQ+8A7jlgueIaNxtKQ5naiv06CQe+YVVt6R6F/kOjgk=;
 b=AKVJ7umpg7/EVOsRH0kwdxgazwLWrXZYnm4QisJMsRwzeAOhxWVnXp9zpE1YFsdDdYj0Amty7
 JU4mjs3eA+CBxVeSMUZtPJzRS7LXuX8nDFu47bqDjArxL2D/WmPidYA
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfX/lPrs9b0OsGM
 7QDqq/dYx8DMthZoPZEkQWmRuDXiVAarzGrynUvRDGpktKGcW/80iY9FKflCblKD05sb1ex5pOV
 oFSw4J4dWsBFI61gpfjV4WnddMG0iUXu0AVcowDoHgRSgV2VkQdqg5ZT08RnL8mFMo6Q592Es6o
 Uy4lhBxcJYg52YuXPGGHPM0NXpJYd31sb5S537AvpA3wpOnQZdqgdpzlleKOHfDKV4TDyn6x7k2
 pTEBPqJogTwJRMEqq0U2G4swvzSXWh+o7EG3AiiyPtWFUp9NGrw0BRRALTUZYSESv4b4GEPwis6
 5lM2UlDMAJfL7Zc530LhLtdD6Czr8sBiTO6BaQgEnIUEZB+h0/tdfK4hocMJGVcvmMxT0Kj0goH
 WcKg21RDMZQg1DINXKyP7UnPFzfKCiQD7WaeoYatc+g1SOfeutjdkr+4b3h/5HeuCAL3wP0HD7o
 1uUzX0F2ysmq0qenPaQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab29f83 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Q-fNiiVtAAAA:8 a=b3CbU_ItAAAA:8 a=JfrnYn6hAAAA:8 a=hLbFB0PV-noiyqnaVYIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: AR1s-D0258B8UWYddZxrzmXtO-8kt3U6
X-Proofpoint-GUID: AR1s-D0258B8UWYddZxrzmXtO-8kt3U6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfX5ipUu0k9xpBv
 AoYesAFogAaHt74Rd0ZaJ3XH27+o2p/PKWNnhwhv4GYlkzpbqM3h0GgRe0c0BhxVon0Mv0GjU0z
 bo2gnfdUutP43XdsGUpCM0My/YIDajc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_083220_525220_7285DE71 
X-CRM114-Status: GOOD (  15.72  )
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

This series adds a vcc-supply property to both the dt-binding and the
driver:

- Patch 1/2: dt-bindings - documents the vcc-supply property as an
    optional property.
  - Patch 2/2: driver - uses devm_regulator_get() to obtain and enable
    the vcc supply at the start of probe, before any I2C access.

---
Changes in v3:
- dt-bindings: make vcc-supply optional instead of required, to preserve
  compatibility with existing device trees that do not describe the
  supply.
- Driver is unchanged from v2: devm_regulator_get() returns a dummy
  regulator when the supply is absent, so an optional binding needs no
  driver change.
- Link to v2: https://patch.msgid.link/20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com

Changes in v2:
  - Made vcc-supply required instead of optional (devm_regulator_get()
    instead of devm_regulator_get_optional()).
  - Added vcc-supply to the required list in the dt-binding schema.

Changes in v1:
  - Initial submission with optional vcc-supply support.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      dt-bindings: regulator: rpi-panel-v2: Add vcc-supply property
      regulator: rpi-panel-v2: Add vcc-supply support

 .../raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml    |  4 ++++
 drivers/regulator/rpi-panel-v2-regulator.c                   | 12 ++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: bd2a0c2d8c49ffb7acfcb0c1177af355ea417caf
change-id: 20260907-rpi_reg-8c6885b35e5b

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>


