Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D80C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EGA6gUn9zRkuVLwQf80uhCdEddQ0d36aW1lKnlzmiRQ=; b=VnPZLG1k5Jrqumu1am6huVO+/W
	ZPa895B5tR1vygKgqaFzJU9Kzc+Xdfnf8IFB2OwaXWbUI5SvK+0n8BpCYVFohiUy1ylcofH5Xc/Di
	k4UWGaWM5iEX1eK2ZNpUQiauHn+xBIJEt/GBABtpFmU7chedIW+d581yNcQu1vBg8cn6g8i6XPGNw
	JMgJO4ktFGZLG1VNaKkILnAv/p3GDhxoGgacn+HSovS3O/KfGRXnsN0hsd2ljUBzwv1wl/lPfvNbw
	KjLaC1oW7Edly6EaoQkqvQhCMgGAVXA0OQwQUNyLYy5RzEEYf/WuiiyzBv96v+/ojgJ+PflYWfaOT
	fik+igaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOGu-00000001Juz-0GWG;
	Tue, 04 Feb 2025 19:07:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu4-00000001GVR-2pwO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 18:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EGA6gUn9zRkuVLwQf80uhCdEddQ0d36aW1lKnlzmiRQ=; b=E8rX3aYX4wDreBGBorkN103EnO
	Rt5tE0TaSjBnDlNzVIDr+A/oSGXhjeoHNqH7bi9od6KMMjwvlNWIms+b2Idk7mPWY2dZxdcwioKUl
	5RB9ODWBsgKtGEh7kiP0yCKT9lwIW7OBlfgu8RDYi3AKU5vm4lt5+he35ngNvVfIpqBevfFL5QHRI
	LMAzVwFUhVuyIRgKv9k/DKimkHwrfxvLrdsgF07ih0BVHRA4TLMeXooRe1hICheNcuQFSzcc+Qbsx
	lc8ku6tW2/d1+YgWRkh0MolfrrquomS/yOD+uCEDm/vyYDlavaopsQfhoF5cbUlUuMpDWqDkOQbSB
	UK161LUA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNu1-0000000GNeh-2RiK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:44:07 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GEnWO028618;
	Tue, 4 Feb 2025 18:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=EGA6gUn9zRkuVLwQf80uhCdEddQ0d36aW1lKnlzmi
	RQ=; b=bIebhRt8NW06bb1R2iEF9rHXjje7eQhp6FSqccrpeNHVicQ0bcn+x37z/
	PU5DlOTBxkqbfXZrWtpibxlSHT4kO+ZPgGTc7JQOMuh3RN90LmyI9puZ8Gq0tpWD
	Mh59Rf/77TXXKzbCBSDcCz0canUoQ1+qTm0gmkrqaxaclcbGD5bs5jTRHr2rDCw3
	vsAz3npuxg7eViILUs93sZ0yk20w9yFiojH2gXyET4ZGLlucziw12TrmvWjVMIuJ
	4m3yEouwRRhwAZzqnXaQIC8biAf6MBy1ZJYYj/WIQnNuqHW2imT8ZKT7Ghvv5Oyp
	UOgdmCks+e+6VI/bMcdXXGwrZWa9Q==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44knqtrxfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514GDkbq006502;
	Tue, 4 Feb 2025 18:43:42 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hyekcuuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 18:43:42 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514Ihfah25101028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 18:43:41 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FE6158058;
	Tue,  4 Feb 2025 18:43:41 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26AF858059;
	Tue,  4 Feb 2025 18:43:40 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 18:43:40 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, andrew@lunn.ch
Subject: [PATCH v8 0/9] DTS updates for system1 BMC
Date: Tue,  4 Feb 2025 12:43:26 -0600
Message-ID: <20250204184337.3896834-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sSYgMD278uzYUMt_Vx3iymDjSFnl_9I0
X-Proofpoint-ORIG-GUID: sSYgMD278uzYUMt_Vx3iymDjSFnl_9I0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=616 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_184405_938787_F19C789A 
X-CRM114-Status: GOOD (  13.97  )
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

Hello,

Please review the patch set version 8.

V8:
---
  - Updated subject line from bindings to dt-bindings
  - Updated comment with reviewed by.

V7:
---
  - Updated pattern in the ast2400-gpio.yaml
  - Dropped "dt-bindings: net: faraday,ftgmac100" patch sending it
    separately.

V6:
---
  - Fixed dt_binding_check errors for ipmb-dev.yaml
  - Changed the hog parsing pattern in ast2400-gpio

V5:
---
  - Improved IPBM device documentation.
  - Added the hog parsing in ast2400-gpio

V4:
---
  - Removed "Add RGMII support" patch as it needs some work from the
    driver side.
  - Improved IPBM device documentation.
  - There is a new warning in CHECK_DTBS which are false positive so
    ignored them.
    arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: gpio@1e780000: 'hog-0', 'hog-1', 'hog-2', 'hog-3' do not match any of the regexes: 'pinctrl-[0-9]+'

V3:
---
  - Fixed dt_binding_check warnings in ipmb-dev.yaml
  - Updated title and description in ipmb-dev.yaml file.
  - Updated i2c-protocol description in ipmb-dev.yaml file.

V2:
---
  Fixed CHECK_DTBS errors by
    - Using generic node names
    - Documenting phy-mode rgmii-rxid in ftgmac100.yaml
    - Adding binding documentation for IPMB device interface

NINAD PALSULE (6):
  ARM: dts: aspeed: system1: Add IPMB device
  ARM: dts: aspeed: system1: Add GPIO line name
  ARM: dts: aspeed: system1: Reduce sgpio speed
  ARM: dts: aspeed: system1: Update LED gpio name
  ARM: dts: aspeed: system1: Remove VRs max8952
  ARM: dts: aspeed: system1: Mark GPIO line high/low

Ninad Palsule (3):
  dt-bindings: ipmi: Add binding for IPMB device
  dt-bindings: gpio: ast2400-gpio: Add hogs parsing
  ARM: dts: aspeed: system1: Disable gpio pull down

 .../bindings/gpio/aspeed,ast2400-gpio.yaml    |   6 +
 .../devicetree/bindings/ipmi/ipmb-dev.yaml    |  56 +++++++
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 139 +++++++++++-------
 3 files changed, 147 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml

-- 
2.43.0


