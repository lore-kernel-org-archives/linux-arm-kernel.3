Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940E610F2862
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LhLmWBDumfqN5d8iw1ZWmxQBWAs/qsQPKjiuqcOx5ss=; b=rDOmlQWtbqnxp1dswlzlt7xbG0
	tQ/07QDEIpvWx8V5LeTl62mlmF7tg/o/Clgi6UgC5x5AY3hwaUWfFVRUWArV/A3N4TenCfYwZ+BnP
	5oalwurlzMv3DO+GV41GStc5VdbMouY0iE1A6bUo1HRLWvit2axCRyXWkWpQ8UJfHn3SD1Oe/ReUg
	UD2HAf1zrn/Bzfuntyegre++2upp5oh56dQbiJoBp7W3uFFUNpeNOxKEFA+Jmd5BTH20EazhQYSfN
	aXjYAqJlwNzzdXTNRjFKBLpMIW+tymFoX81oqMy+LQu+rWmatlk1i06euy2MN90ElKKSMp5Ik+Dxv
	5+DQaXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BFK-00000007sID-2LbL;
	Fri, 27 Mar 2026 17:45:22 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BF4-00000007sEj-2kwb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:45:11 +0000
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RG5uuK199946;
	Fri, 27 Mar 2026 17:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=LhLmWBDumfqN5d8iw1ZWmxQBWAs/qsQPKjiuq
	cOx5ss=; b=hf1MwA0eQfuy2jYrHK1Ks6ubKmWx2zruO+ruEbUvi9hrtb2vBZmLG
	sqOwgEHOKf6H/u5MljZitFC0igQlRw0fPgYeu7V2Hvs7ERst8gRJFwK3wdTjbkQB
	nn7AwVW/7JWC3OU+uQpzIkZirnDs3cKIxf8E88HXS+dF50Fi2WwWfYQl3/cH9JEU
	k4WPjmqaoZk1OqRKsWMOi+thLaNFC0iJ6A+pWoiVYIf23OZFcba6X9iU634Oa1zA
	6WypGExfj2I9CBJoLuidl7Zi7zZKIk2mpRixu1K6d1dFrSHBLIDvItS5WHjNSsxS
	QBZN5BbdMAcH33+gLtyaCRcDlzZsZBSxA==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d5qvcn6fx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 17:44:50 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 3D869310FB;
	Fri, 27 Mar 2026 17:44:50 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 450A5810AD5;
	Fri, 27 Mar 2026 17:44:49 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: Add HPE GSC platform support
Date: Fri, 27 Mar 2026 12:44:42 -0500
Message-Id: <20260327174445.3275835-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mKdXloMvImZRItuJ7ju0cAXUU_qV6pkN
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=69c6c212 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=3haJ9R1Aw3gUfsUHDaCR:22 a=MvuuwTCpAAAA:8 a=YYSzPG55KGHO12cqy3UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyMyBTYWx0ZWRfXwSLvB6RRoi6J
 zlx8GyjzjBeNH54/x4brN/3qoEvTkjje+RYQfy9la6L2XbiuYxY7OSHEzdGX0BC/itOujUhChNo
 IodW435I2l+Q20DqEgzXLdCqbDMY++biMjoqITluhOhTw1WiPGsX2JDjXUSAm9RrAYT+W/S/vQ+
 1Bx5b4EKIO2tjnY8xs/xemjnGq1u5IgljN2nYpTiJ4goFYQa7tpLz0H7UmiYI5uC2/T8pLeA0MV
 imZ8Ik5vD5rJIvNsWBYf4UOiDMqpUUbZtm1+gs0Xcc7gbmSjYjABcYsRKbGzbRT/+JHJjiZq4fP
 /Ftbpxk+2gRpnqFBQ0hDiJ9sZdhiTUAskqv95Pr2Qx1odFzRFj9ELGU4Yk0rJkgLiD0okRI9yqL
 UJMeesBFKqWtgivkoUd76z0EL5WpCfNCa2o/HiFgYOtCyx8PCC1oFdt6wr8bDH05vEfDsWDc8Pq
 7c9JRrEtLd9vNg0uX2A==
X-Proofpoint-GUID: mKdXloMvImZRItuJ7ju0cAXUU_qV6pkN
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_104508_645961_9E36F389 
X-CRM114-Status: GOOD (  11.91  )
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

From: Nick Hawkins <nick.hawkins@hpe.com>

Add initial platform support for the HPE GSC ARM64 BMC SoC.

Changes since v2:
- Patch 1: Removed separate ARM64/HPE GSC MAINTAINERS entry; instead
  renamed existing ARM/HPE GXP to ARM/HPE GXP/GSC and added arm64 DTS
  path there (Conor Dooley)
- Patch 2: Replaced menuconfig ARCH_HPE + nested ARCH_HPE_GSC with a
  single config ARCH_HPE; removed extra blank line (Krzysztof Kozlowski)
- Patch 3: Dropped clocks wrapper node, renamed fixed clock to
  clock-33333333; renamed ahb bus node to soc; reordered UART nodes by
  address for DTS coding style; replaced raw interrupt triplets with
  GIC_SPI/IRQ_TYPE_LEVEL_HIGH defines (Krzysztof Kozlowski)

Nick Hawkins (3):
  dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
  arm64: Kconfig: Add ARCH_HPE platform
  arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS

 .../devicetree/bindings/arm/hpe,gxp.yaml      |   7 +-
 MAINTAINERS                                   |   3 +-
 arch/arm64/Kconfig.platforms                  |  11 ++
 arch/arm64/boot/dts/hpe/Makefile              |   2 +
 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts    |  18 +++
 arch/arm64/boot/dts/hpe/gsc.dtsi              | 104 ++++++++++++++++++
 6 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/hpe/Makefile
 create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
 create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi

-- 
2.34.1


