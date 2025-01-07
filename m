Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F655E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GYAgmjZBiA6JTCjMJCmqD3MxCfAICQ4dJqivijHe7MY=; b=qHT6nhBDvwLmlUdg4DDdUpIby5
	7G+4cG9328Jx+5jwCcQIpI+c3BKqbCOqpcW4zZPHZ3JBXg+vouI/bn/qmDq8lB+WN+OUM6WO731YZ
	kniPMn+z39kbFFt015dLVmWNsfeSOw+HdFPoUijE2aGHEt1dDtJf4m118PLNYRYh3c1syq0HGmjmX
	oWxK+33J83LgM3deSeZgoaF45cau5/U3KxuAGn+tMzV2TqeD+GOk5102ID1J4e+2pEkCDS+Wbk2AC
	XNmV3/8G2vQmh6zLsRapUXzJd3eT/b4acHvonMnWRwLSZZJAwrKnTft8Kh627g6a2oY/oLbOyyeUx
	yNHxr4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCPt-00000005ciH-2NnF;
	Tue, 07 Jan 2025 16:26:53 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCNT-00000005blq-0pHb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:24:24 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507EY2Ic012681;
	Tue, 7 Jan 2025 16:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=GYAgmjZBiA6JTCjMJCmqD3MxCfAICQ4dJqivijHe7
	MY=; b=TTWYQqdRGeqluXIqgecJrJE1sRlU8IX4x6J1EHpptKy/GFNIH7TV7Smf+
	s44jRd76covn2dlsO1xydkpMe8FF+bM8Bj8C2q2Kel+jGoNsU673DtkUcKO7v5Hx
	GxgC+ZdFGLcZ+JffHpOOapAyH3O2P4tbmw8w5pKX4JGF/UI9wPvXB4fmIbJeReiD
	0VlKFgm7/c3IKBq6Rze1OKhz0XuWtw/3gInEadmVDQ61YfbfGqIY5EOx48xovxEH
	2cgErcOT9bFOnDYoe9L/p/pvZW0D93cJ3izUBlbD6RpuhbQNVYJ1oGOsOSXL6Wum
	K4J1or91AKtDkZyZA20cEMGCxukuA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440vrcb8n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 16:23:55 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 507GNsIb018908;
	Tue, 7 Jan 2025 16:23:54 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440vrcb8n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 16:23:54 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 507FtRF1008875;
	Tue, 7 Jan 2025 16:23:53 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yfpyuf2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 16:23:53 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 507GNq7P21824080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 16:23:52 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A79658058;
	Tue,  7 Jan 2025 16:23:52 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE14258059;
	Tue,  7 Jan 2025 16:23:51 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jan 2025 16:23:51 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, ninad@linux.ibm.com,
        ratbert@faraday-tech.com, openipmi-developer@lists.sourceforge.net,
        netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] DTS updates for system1 BMC
Date: Tue,  7 Jan 2025 10:23:37 -0600
Message-ID: <20250107162350.1281165-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZK7yhZ5I33Bj_qEUveZB1hnGoTeimQ2R
X-Proofpoint-ORIG-GUID: ApJbNe-3Yghr4WJcLLm9p0paPourxDzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=448 spamscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082423_249767_56BE4A30 
X-CRM114-Status: GOOD (  11.25  )
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

Please review the patch set.

V2:
---
  Fixed CHECK_DTBS errors by
    - Using generic node names
    - Documenting phy-mode rgmii-rxid in ftgmac100.yaml
    - Adding binding documentation for IPMB device interface

NINAD PALSULE (7):
  ARM: dts: aspeed: system1: Add IPMB device
  ARM: dts: aspeed: system1: Add GPIO line name
  ARM: dts: aspeed: system1: Add RGMII support
  ARM: dts: aspeed: system1: Reduce sgpio speed
  ARM: dts: aspeed: system1: Update LED gpio name
  ARM: dts: aspeed: system1: Remove VRs max8952
  ARM: dts: aspeed: system1: Mark GPIO line high/low

Ninad Palsule (3):
  dt-bindings: net: faraday,ftgmac100: Add phys mode
  bindings: ipmi: Add binding for IPMB device intf
  ARM: dts: aspeed: system1: Disable gpio pull down

 .../devicetree/bindings/ipmi/ipmb-dev.yaml    |  42 +++++
 .../bindings/net/faraday,ftgmac100.yaml       |   3 +
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 177 ++++++++++++------
 3 files changed, 163 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml

-- 
2.43.0


