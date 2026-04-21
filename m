Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9742FF94CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmzMlN5DJAj3TfNpcj5dVfDRWJ5iyR0YEC0nsFFtGJk=; b=NMjlsonMREkWwnwLIs+Whq0ZOr
	q58g4kctton6HYbFTgObme5eIYtfevWOplLMI/Fe9u46Ah84OwcKtxLc5+CvxTAakNc/arZ+T68GD
	MJjQsXS7te/nSKyv3HOKKz9l/S8DJztFAYXDEwlhbAiprogOv3qEfLsxuJvA5OOdFfFQMu6Ogfqnf
	Mwe4igN5KT5xUVJchd/UMdUB31X3m6KAQMw+jYh1y7CwvcRgNaGSBC1AZkNMRza/o9objVt6SNuUd
	1MXbMEBEWMBr8vC9mF7QZgx0NspnW03QrU5j6KCCuy13BVuLZaOKE54APUF9OQEfWIhNuj9/T2YCW
	26ewFFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrM-00000009M2M-2LSi;
	Tue, 21 Apr 2026 22:46:24 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJrE-00000009LxD-2Rbz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:46:18 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LImXLm679940;
	Tue, 21 Apr 2026 22:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vmzMlN5DJAj3TfNpc
	j5dVfDRWJ5iyR0YEC0nsFFtGJk=; b=D91ZHNvgjhZzL6fwoCz8WxpbuH73KALap
	OiQ0xzNgjfj4GcAqQ8kQpzejM0+0DkQRnfm5OvHcNWh+AoiBUOazDaU6r1ZOhyn/
	wQWHvJx0GumbGkYaT4Cuj4LDJHYRF3txYE/NW4JQW0bdtJqLu70hKl6b1pQv4het
	Mrf2GXCxziDNBR7dFFZtYZOEDRnoJSBvdOFn+cZlC5vbRPv/W3/3VGY57BHlbBp7
	LFSvfWWiOXoZ3oRBY8lJ4TiuHIMFqbB94GO23VvvRDHCF11Ydp87L03dbt2QsBkM
	AUPRvQQYEerPEL+XMp84JxhNFCWW5jySdZU+I0x5GpMm5zI7GrlVA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu7gp69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:02 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63LMZPkg013601;
	Tue, 21 Apr 2026 22:46:02 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmnsh2js6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 22:46:02 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63LMk0oZ14025316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 22:46:01 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F31258060;
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00C0458059;
	Tue, 21 Apr 2026 22:46:00 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Apr 2026 22:45:59 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>, ninad@linux.ibm.com
Subject: [PATCH v1 3/7] ARM: dts: aspeed: system1: Add usb virtual hub dev
Date: Tue, 21 Apr 2026 17:45:40 -0500
Message-ID: <20260421224551.1611818-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421224551.1611818-1-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: OIZAoSM1Qb0Q_kVv2DW5srhm_dw6vMuf
X-Authority-Analysis: v=2.4 cv=Ksp9H2WN c=1 sm=1 tr=0 ts=69e7fe2b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=ShWUfGWSBk52ZyEv2HIA:9
X-Proofpoint-GUID: xSzE-azazQjZvOlC0hXUBgGX8BHu-_RU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIyMiBTYWx0ZWRfX+ateUsp1rsZR
 ooto2QRFj4GCj5gc0rkyjkR/r1YBAKVVr3nj05Ccrw+wZHoJgXXv5rCCuHcDhmXFBUif8BAH9H/
 zk4WpWZB7VI03ggc5SRGvy1ZsapysFv2mkxNA3W+EKJ2B92GU05atE86jxuH/i6l6raeJMM69RX
 LTt1G6w/nGJxed68ovSsduXh9bi1mi05H60kfi16y6hSbx2A0+VZuEj/lb0gvFOWWV6x4zeIUJT
 gMPj0OWb7kh8sXZLSg5nkpuCLfsqjYTeGRn2Zc/1nA/xLBekeBwUVHOdV+HstbaKr2/s7y53AiZ
 YHxP9mpahSaAs7+ir3Pzau6Gfyr4aRzuwbDXvTi98covoEvKTidszwRyYKexydcXiWMVrDwZMAh
 X3dHxRkigsnljothcTuIIy2z3JKGUaAsDT2C4I0OZFWgEl8mnOwb3vqCHva4iklTTRpAY2Lnz7+
 7UxuDqqi3CkfdORJ4tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604210222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_154616_737311_31436829 
X-CRM114-Status: GOOD (  12.50  )
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

From: Manojkiran Eda <manojkiran.eda@gmail.com>

The usb virtual hub device is required to pass the typed keystrokes to
the Host OS as part of enabling the KVM (Keyboard-video-mouse) function.

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 0ca799893791..b0eb1767c485 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -535,6 +535,10 @@ &video {
 	status = "okay";
 };
 
+&vhub {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.51.0


