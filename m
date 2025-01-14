Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2A7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 22:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFmc3fWwU+UWkA5NAjC/u/5zyqF+9SC/CSG4ZyHvu1c=; b=HA5L/cWA1KBqi92HVqSUOf4eL1
	j7BGtkg9wf5Pbpc7uxJwwf+Pf1RKWBCDBEkdGv1lv/ssg63z2KBRlQxqQGuebGQRTUOy58FEYO2L5
	+9H3YKlxMGNPHGMaqYEzQr9Ss4Rb7YfxrH2zvJaUXcp7QKjDDv8AZdB1KHJqtnUOuuNBQUWInhAa8
	uTikjkYnR0DLiQka9omOuzE5h9jXlbQvqkSFjxVlvnslLUMQN/OkdxNaCuFHzXMgNH8TfyixhMt6w
	KyXtb5AzPuioWFkLuvudPhclbA+AI3o5kA3MMqC9wzGoO8bpOb5UrMm37nyuEIVw+fmonSALl90PD
	OCik4u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpCz-00000009uiB-1M8X;
	Tue, 14 Jan 2025 22:16:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXozc-00000009see-2ZY4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 22:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uFmc3fWwU+UWkA5NAjC/u/5zyqF+9SC/CSG4ZyHvu1c=; b=HsnR2wn1cGxsbfigrdRLew35LY
	NLSKiQUZUaBjjpqMy1t2/Yh2Z0XTGfAqpcJHwJfF6Dayxc4AdvCV9hW/6TTrA2r2uQ+PQQwnS/wBY
	FiclYm1xg7xhOjc23HnTVtHf6UAhB2j68pSufv0D5xzxqzTugVkVjQfnuSpc5ebYz8BHPiuAPFoww
	IyzXzCCdAzUvxECjTpQEMDVspaJ/pYkrRqWgcnuRD6AVH2GdmQ5fDeVm7C2ZnBQn5jcoGaldP7Br6
	VmfjO6LBio5o1nocMnd4wVKeYNdKKvSTgAQDuFYK2udI+JUsjIlU+mKbFg7PpPrc6dtJ90BlfftIx
	vzzmVetg==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXozZ-0000000AfAp-0RLV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:02:35 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EE6KhN013488;
	Tue, 14 Jan 2025 22:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=uFmc3fWwU+UWkA5NA
	jC/u/5zyqF+9SC/CSG4ZyHvu1c=; b=EJ7KVL1wRNERm7OA0cQwCPrmwEx08pRBY
	Y5RyiPDr9P11PADsXBhmMaRjT668X3QncBrkstV/4nW7kvf1v+sci4FVxeY5RNBJ
	UGG2/j57WpKSyQ/KqzgVU/A7EYGhyMF9RaUPd0tZM3bnLRJyjNMaIF4Q7hHqmgdy
	GNDxk6DcQb3YsJfRA/7RARZkcC/e/cgP5zWw8pYCMnb0/IcH54C45MIAwgUEyjwR
	vQRt+GG0xKx0GQ5Ypag0WSm+SKYDKP9DlPOIfqgjTTf7/6bdnr8BQGu6D2KU/i6Y
	NIBrhu6zLjAFpiG2dEzBxqUyX5dEit1E0f5TGPX6BKEvPFqPXlYEg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445sd6213t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:01:55 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50ELvOuP028050;
	Tue, 14 Jan 2025 22:01:55 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445sd6213m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:01:54 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50EId9nJ001089;
	Tue, 14 Jan 2025 22:01:54 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44456jw1xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:01:54 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50EM1qgg18612872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 22:01:52 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EB6658059;
	Tue, 14 Jan 2025 22:01:52 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15BA258055;
	Tue, 14 Jan 2025 22:01:52 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jan 2025 22:01:52 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com,
        openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v5 09/10] ARM: dts: aspeed: system1: Mark GPIO line high/low
Date: Tue, 14 Jan 2025 16:01:43 -0600
Message-ID: <20250114220147.757075-10-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114220147.757075-1-ninad@linux.ibm.com>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B42NHJSvYXt5wbHtYnQzFUlhKQ_S8xna
X-Proofpoint-ORIG-GUID: 65DADc97KBHndruFj5sytOJNwr9iFl0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_07,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=909 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_220233_869481_B5078A43 
X-CRM114-Status: GOOD (  11.66  )
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

- Mark following GPIO lines as input high:
  - GPIOL4 (reset PCH registers)
  - GPIOL5 (reset portition of intel ME)
- Mark isolate errors from cpu1 gpio (GPIOO6) as active low output.
- The fan controller reset line should be active high.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index 089a8315753a..1f0a6247f97e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -383,6 +383,34 @@ &gpio0 {
 	/*X0-X7*/	"fpga-pgood","power-chassis-good","pch-pgood","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
 	/*Z0-Z7*/	"","","","","","","","";
+
+	hog-0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "RST_RTCRST_N";
+	};
+
+	hog-1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(L, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "RST_SRTCRST_N";
+	};
+
+	hog-2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(L, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_FAN_E3_SVC_PEX_INT_N";
+	};
+
+	hog-3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(O, 6) GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "isolate_errs_cpu1";
+	};
 };
 
 &emmc_controller {
-- 
2.43.0


