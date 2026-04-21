Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C5AF94CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/OfLF/vRyE81uJ4oXNhhevO81e0z/5D7qca2PImSDw=; b=bRk/oakOzHdVHoOJpzZtPDnhwc
	Lb3GEFIbpibRvz6R7BBm8vR0BEjiWA4TkRNZqGfsba8/dEMaoVIJoGXwprpa8h9C50ExVdqf4ZTKT
	RDr6vcptbOBKyrLwObwOSJ7zkgMc/sWvK9b1nv/5buZhlJ3L0wrSyiwN6/4762cOrmQRFKnaNQfcc
	sitSmzQXf6PbiJp9/VPaWIjawP9TXN2eWSmXg2MrLnntnSxdG48JD0ykUMZtIiZefFs4reE5mLGKu
	KyT/jMoqfPUQ+XC5UTozweGnqeJBIDP/nhygjFGXwr4CabSYNW5G5PYEbuvr3vtU7oD28O6qcCe6t
	0oPNkCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrM-00000009M24-17as;
	Tue, 21 Apr 2026 22:46:24 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrE-00000009LxC-2RcJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:46:17 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIn7xQ680898;
	Tue, 21 Apr 2026 22:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5/OfLF/vRyE81uJ4o
	XNhhevO81e0z/5D7qca2PImSDw=; b=M5om/Lln+lYeSruVPd1WmiACzW2qY6pIP
	gjvCfhxOkbwf48lRq00SY8G9ALAfDrG3YvRw6L2VhimKvC70lc8xHiyMSThghk3U
	pd15LZwWsH3p6+Z5OHVlDApiQfZojjVR7g/7r86LfOSdNPJqRnnPSwyATfbu+jRW
	2nBrN1A/7nvBHcoDaFJkrunxYNME6Xdp+oEX58NZIBG2fEllmutN3gpbFBAW3KZp
	p2uc7XcD5QCTxootirszLbJxzm8dWz7h36vGqS2K9ECFnrJbZ3isxRYi7YyOUQ7L
	GPHR3GuTQvhSoCOhv0CP8r1Fu+WfnREi2i5L2w/hi9/o9Ag1Gn+vA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu7gp68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:01 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZKtG013563;
	Tue, 21 Apr 2026 22:46:00 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmnsh2js4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMjxr92818926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:45:59 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B8F958055;
	Tue, 21 Apr 2026 22:45:59 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CBA05805D;
	Tue, 21 Apr 2026 22:45:58 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:45:58 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v1 1/7] ARM: dts: aspeed: system1: Disable vuart2
Date: Tue, 21 Apr 2026 17:45:38 -0500
Message-ID: <20260421224551.1611818-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421224551.1611818-1-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: co4fY0lIEMwhIqn1ofsbesUWqyaoFO_y
X-Authority-Analysis: v=2.4 cv=Ksp9H2WN c=1 sm=1 tr=0 ts=69e7fe29 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=bKK4mZ8mWJzw25CKWzoA:9
 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: co4fY0lIEMwhIqn1ofsbesUWqyaoFO_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfXxOvQ8x3PZZSP
 Judv5q/YUzq8d/N1QzRiZlE2lD7+oqI4xakksk+FTPv/fysipIfHHHgmjykNxj4FbQQD+NaByKE
 X6yTDc0/2exT7CNLPiVbcDWiZ1fZQtPOkP9S3XyXfpCQi1FC7pdlihrcU9A/CfnjP6j+HZ6zfO+
 Wfm7b/rywzjMQuJGbeXI4na1SlFeowr+LmpSIZZNcz4KPuKuUeAXta0B+0xCq16qnCSb9Gl9pkJ
 grG1fMCTIX3GQEZh5X9W50qtoGRjkRie3uiwg1vcxqeCAzNtYyFtn4r/gGOExKDcaoVtUFOTla8
 HVt8pwd8+odGWfdB2t6JCjaf8Hn6gmv7PTTOEPmwgY+H8C7IX274e5dkj5rsKcGx5D1ubfHP02w
 1A611ysCaOOGhdlZzxGpf1JDoomMyliiwWEqaO+/w61ORrGv22MHbb9rfLN3/kULAU43heRVw0W
 G/LVMfUuelq8rf0oiNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604210222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_154616_736965_00A4615B 
X-CRM114-Status: GOOD (  12.07  )
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

system1 BMC machine does not wire vuart2 to host hence disable it to
avoid any errors in the journal.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index c8267c97a44e..488d0b3916a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -472,10 +472,6 @@ &vuart1 {
 	status = "okay";
 };
 
-&vuart2 {
-	status = "okay";
-};
-
 &lpc_ctrl {
 	status = "okay";
 	memory-region = <&flash_memory>;
-- 
2.51.0


