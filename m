Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC77F94CB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uVv8xeMGu4mFMCnNaO/jcbkxpR4qemBlce3MlgH4uQ0=; b=OCPr6Lrwl2QE5BrqHmqPGX1q/W
	TPWmKlJnD2SYhpK92BZzkaKgcahwwDhMCwIe+78pQQEQj1JlIAYCA5uI1GjM9XagekqM8R/fuBWQE
	3kNYr0CxsXwFLLaiftkCbZ9dJAjImRw+ljVKHO2wvC0JWYdvV5F7mIp7G/5PZZ5PcYF0JJvFpGxjb
	Cl/TP6XcSBM9huT1D+rV3DaBCUNHQpF8eZRcL7+rLTBYsJ5RpA150J8SDFzLcKJxmGvsAl+RfnsBU
	lkQuLjzi23TFlzcnZHtfb0EbXsl1AjkXX3VH+7DGP+r5k3XJiGFRkKjznMO0Kkvvk7MtlJJhWHl+A
	uqvfp8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrF-00000009Lyg-0p3n;
	Tue, 21 Apr 2026 22:46:17 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrC-00000009LwG-3Ep5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:46:15 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIljX3589903;
	Tue, 21 Apr 2026 22:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=uVv8xeMGu4mFMCnNaO/jcbkxpR4qemBlce3MlgH4u
	Q0=; b=d2hOcqqy7GAvRWp66J8yPMlzonsrBUv4j0JoVSIvwuJczD+QiP872k9QM
	ks6T+3Dairvyrvky/IaArXWINggXv/sf2WPLJaC5FSzlfHHH7oZUG+cSJOXuxf+C
	kWwgNPSWrJT7g/GQJMb6+USExPGAu0DQYyeQY7iWt7/lPvxTxERxCJYX4mMxdSWe
	pVThpd5rLh799STMElcaiIu7CsFuCCgKU7m+WBIJOJPh/zhbhKuJmrHrxZImM5TS
	YaARbKffx8N/LOd+eYqTiZDah/XzfQ/hlTJJpRUv5vQKqYzVGQ9NL15MEzsYuFxm
	JdqkUnCPCTpJ58Je4mUBe/B8+0sUg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu20qgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZPd9013594;
	Tue, 21 Apr 2026 22:45:59 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmnsh2js2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:45:59 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMjwJV30737046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:45:58 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7774058055;
	Tue, 21 Apr 2026 22:45:58 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D756F5805D;
	Tue, 21 Apr 2026 22:45:57 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:45:57 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v1 0/7] DTS updates for system1 BMC
Date: Tue, 21 Apr 2026 17:45:37 -0500
Message-ID: <20260421224551.1611818-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ht2NluW5i7Abk4E84EJHIDn9ejs7EeCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfX0i4AGE/NHfJ6
 SX4uzvG/6oCRq+XSEsAf+7WCq9ERcSfvDptaK2QyCsp+9OT9iyfproUDEWlUqTgjaSguqUG0lrb
 XY9zJijItRy0ZBOv5q44qrZ2sW+FHibM77GdxzmGJ0unACPLCk7txhyLpoRvFj2D16QUxQ+2LEo
 jx+kmIal0zPjIH/XnwHttV/Oo7N7l8vFbC7t+sWhEqbcuX2vZqrSu4e909XV1IIdnPM+1t47sex
 C6vSC5KmbnEmWdclT7dLL29BlGtIebtDVUcZozL2fpv/REeExqqvOUOLxQiWaSSjSMvAiKqJnHH
 /4UwjVoe/NqcEn9Qg+6sXhqb3V1VJ8GsUwIXsdNWGpMu8aSc1h3ZeIHB5wPBJ2wvA3nNnlugZyA
 b0j0qBtaElRyIPnonxsub8RzCtBT8l9AFS7LLQZ8QIpABA07Im+PDN2A/o/kewp808Hu1eb9gIq
 Zg+pZaHyZzGT6Ajpnpg==
X-Authority-Analysis: v=2.4 cv=C8LZDwP+ c=1 sm=1 tr=0 ts=69e7fe28 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=phvD46glpbon8P5KJSkA:9
X-Proofpoint-ORIG-GUID: ht2NluW5i7Abk4E84EJHIDn9ejs7EeCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604210222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_154614_843053_B34B0434 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Andrew Geissler (1):
  ARM: dts: aspeed: system1: disable NCSI net port

Manojkiran Eda (2):
  ARM: dts: aspeed: system1: Enable video engine
  ARM: dts: aspeed: system1: Add usb virtual hub dev

Ninad Palsule (4):
  ARM: dts: aspeed: system1: Disable vuart2
  ARM: dts: aspeed: system1: Enable temp sensors
  ARM: dts: aspeed: system1: Added status LEDs
  ARM: dts: aspeed: system1: DTS updates

 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 1445 ++++++++++++++++-
 1 file changed, 1423 insertions(+), 22 deletions(-)

-- 
2.51.0


