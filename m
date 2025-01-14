Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AE0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 22:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcXYfq7y3Ykx9nkv3r9zTbWUpugtYvbNec4z//sgjIQ=; b=WhHdfbyRCBNK7Y8z/JOiqmb1eB
	IV7PotldkjIuEC5/EeB0PV8I4iUnPvt70MrKaVFetX62lmMxMwwy8Y8PzlWY9Q4pF31iBd3uHRs+r
	7DT0GQ4svxxRVuXr7tpOVgF5AjKl5svpHZvD921q2//WXJx4HsftvfF4phs0Fd0Tx36za1PtPonmk
	c+4ml93C2CuCVDD5APXWZcjbsI+P1hc/anatwMU+W7Mdi6qzrBPZ9FkcaUFG4uYjite0ht57RosmG
	x6Z3IMye0i2qGwnkQvncwhBs0QfuKRaKPHlm+ywHw69bXJq169xR4MFI35Pnr/nOnLkqxGr7Mb9mX
	3veKne1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXp4S-00000009tc7-3dvf;
	Tue, 14 Jan 2025 22:07:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXozX-00000009scB-0MYX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 22:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zcXYfq7y3Ykx9nkv3r9zTbWUpugtYvbNec4z//sgjIQ=; b=muqJu2k+zuIh41/Ad8aFXPBnbB
	s2XmT+UMUQ05wdL7J29mysn848DS0iCTLw/UJeGAb5MNhgkuJkLIunEpMGKoOF+XF9All6gI72Jjo
	mFmie0a4UkhJ+2N9qixEa3g+4WjXpY9BKM5ZUQUtsMwJRZWSUY7YKG8lfqedP3vic1J8a2ne1eWnU
	uphK4Gi5AatnkAIOfU/zbjbzOsIQLVx4WrkDEslpTQjY8rZo+FSNWPYR6Bt03IVseZveHegRB02dM
	muzbw+KwVtmrbRGT/z+Di7a10F9o3pIPRnHargBoc7FC8r96ImiaP9vdlWvuz6NdksuSZF9rG02Zv
	KnFuawoA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXozT-0000000AfAm-0BVT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:02:29 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EEPcDd028858;
	Tue, 14 Jan 2025 22:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zcXYfq7y3Ykx9nkv3
	r9zTbWUpugtYvbNec4z//sgjIQ=; b=VRmnu1BTOy2FY96lpy2TM07TjTv8XAmuQ
	1K0QJUib22cuaoN6CZek9lOFtKc/0GafgmcrJ6j/t0okoaG0KQImowJBOYTB6S2Y
	RhXIgbmpN7xoAFDEBAQeJ1jx1gppBQBmtgsHS9WXhNqcPz2rReu8iVKEIPO+G2m2
	NCS+vW3MHB7GkMsDXJkEmM5cl46yny+ewLM7IDnT5JxkJ1nB933W5MN4q9hMirgj
	JTfj+XZXrONWIbH6qqKroDEcoWsZItJCJoJW69e9XDSS7Log7+aRbsUJBIHepmoP
	YKy26PShpF/zJ1pOw0CyyB0r1H35x7ujZ4A0J8N2NHRw8+UccjQhA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445cnb4y8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:01:52 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50EM1RNB021473;
	Tue, 14 Jan 2025 22:01:52 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445cnb4y88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:01:52 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50ELB2R6002666;
	Tue, 14 Jan 2025 22:01:51 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443by5dj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:01:51 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50EM1o8a40698582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 22:01:50 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0294458043;
	Tue, 14 Jan 2025 22:01:50 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B366C58059;
	Tue, 14 Jan 2025 22:01:49 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jan 2025 22:01:49 +0000 (GMT)
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
Subject: [PATCH v5 01/10] dt-bindings: net: faraday,ftgmac100: Add phys mode
Date: Tue, 14 Jan 2025 16:01:35 -0600
Message-ID: <20250114220147.757075-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114220147.757075-1-ninad@linux.ibm.com>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 76MBiHBKeBv7zH-V57kldJaA5JyIP1E9
X-Proofpoint-GUID: GA3jCc5-1BcKbb-HG3DEmBiQEpl11kYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_07,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=948 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_220227_899790_6B98E796 
X-CRM114-Status: GOOD (  11.09  )
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

Aspeed device supports rgmii, rgmii-id, rgmii-rxid, rgmii-txid so
document them.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
index 9bcbacb6640d..55d6a8379025 100644
--- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
+++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
@@ -44,6 +44,9 @@ properties:
   phy-mode:
     enum:
       - rgmii
+      - rgmii-id
+      - rgmii-rxid
+      - rgmii-txid
       - rmii
 
   phy-handle: true
-- 
2.43.0


