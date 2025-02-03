Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F7EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvwpfrEgGuj6O2Lps8W2ZtH+Fx+MCupa6IfkENeBymw=; b=oQiuPXwtWCBiodXUE37yv9mBV/
	yNqn9AFiAfOeRbhnSSdlgydqRxUUm0M5rYL/lhuk24q4OG6N0IQ6xM5z9MBdBFNuCUM9oFK5nXO9g
	eX8CiEEYu72zK3mrB/cqaTEqkkShH4ilEuSaBUReVyf4hf/EF1TIzeMCaq5rZjwjQKB/zkdl0JDch
	paTF5BQI1kN20ebduIPttUWqvC2sCS+dvCkSFzUarTZlGjyAmwAPfwNdazJFHQMGJPd3OEx+jQz1V
	nAzllldQceekbRwJNFCAX+MW0zBRxNgjwlw17e1dVSpDN1GQemltd4+on6Ba/nhAPeh6GSyOBZLGa
	aSLthqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texkt-0000000FkXC-2JUv;
	Mon, 03 Feb 2025 14:48:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texh2-0000000Fjeb-0Llc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 14:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FvwpfrEgGuj6O2Lps8W2ZtH+Fx+MCupa6IfkENeBymw=; b=lStl4fJpx/w5BB8KqMprPWEqhR
	CslUlzWpuZhsZc6HoJcmXyY2lJ9v3D7081PWqNp3TMCwJhCRJ+4oW9bfahjddScNGk7ekKNKHFMz+
	zM4o+nmSmmsplzmS6hYMR7OYoz27eSiRAtzA7x+MEDDOD97NHUhCP98brKYFIa6Ls2KEMrgYjPxoa
	KdZ4c2t51n7ymnK7k9sprhjthTtPHkjJ6zuJheThSLQNP6HsEUucoqeeAO0uDfbEHsK0N4+pEDVTi
	NUfJtNXo+IEooFuqEXVpPJJDOCvegGBF/2Jku5imUFNnn9tgWAFFtWygaZIFFFP0ZsIgzqHMyA4Vg
	+y0xJYxQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texgy-0000000G6G8-3Eeu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 14:44:55 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513Di9D5006146;
	Mon, 3 Feb 2025 14:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=FvwpfrEgGuj6O2Lps
	8W2ZtH+Fx+MCupa6IfkENeBymw=; b=AsXopSE4ruCyT93l9ZHSGfZ165682xbGk
	TZfkOnxvUALLSk0UvBa4rEJ9KIhsgvDPMrQNai8APoPLvChabNd801nQC72MNxID
	Uxxd2UFNhWLwSLntwwj+Zx9eZrO6FT8ep8m+fGWZmdxe6L7vL6w9C/n5nSamSq4H
	9Ziq6bIluEZBE0ukrLkZKDUWfmsLpOkmdtF7GoH5kZBmLZtgAinTNCZQGr+lxSps
	0t6lZmNzjSZgqMRqduIDZlNKNxjZ2gNkts9Ag5D7NIiSbL3LG3dUiKf5IwoljLq1
	j1v2rHrU65oirEvwslg+pJvE4/pTror488ja5jGAosUarZzWU6Ucw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jmmyb1jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 14:44:32 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 513Doaio009235;
	Mon, 3 Feb 2025 14:44:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jmmyb1j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 14:44:31 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 513DBE0c021483;
	Mon, 3 Feb 2025 14:44:31 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44j0n16fnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 14:44:31 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 513EiTxY18547286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 14:44:29 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6336D58043;
	Mon,  3 Feb 2025 14:44:29 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 645CB58053;
	Mon,  3 Feb 2025 14:44:28 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Feb 2025 14:44:28 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, openipmi-developer@lists.sourceforge.net,
        netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v7 3/9] ARM: dts: aspeed: system1: Add IPMB device
Date: Mon,  3 Feb 2025 08:44:13 -0600
Message-ID: <20250203144422.269948-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203144422.269948-1-ninad@linux.ibm.com>
References: <20250203144422.269948-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cc-DQDPy9smoBTtvez-2XSihY_aE7jwS
X-Proofpoint-ORIG-GUID: EjG963wTK8uDsY4hXcDu-rQ5GsLY5iNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 mlxlogscore=741 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144453_099046_5387B237 
X-CRM114-Status: GOOD (  12.53  )
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

Add IPMB device sitting behind PCH module

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 8f77bc9e860c..0d16987cfc80 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -763,6 +763,15 @@ i2c3mux0chn7: i2c@7 {
 
 &i2c4 {
 	status = "okay";
+	multi-master;
+	bus-frequency = <1000000>;
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+
+		i2c-protocol;
+	};
 };
 
 &i2c5 {
-- 
2.43.0


