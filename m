Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B09E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 21:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1+hsni0AagUQPovftNiRehqPHfT8siZonAxT4C2AOc=; b=QDsu6M+B5UKlqYOeZL/NO9ScmP
	nTlIkUilCsX94zAz8U/O99AxDO+81KH1gO663hGzisalcSSNVK1U1AiPLu6vywkKV0bsOTOzBI0ot
	EH8U2QOHe1F2Q1diMQeyuSeq4DLX3vECG29jOtX1oSk/5mB0dWv4OjjrEPfS/DNjjGvS8LeUZ3snJ
	slTXowGYhYSQwk8htsBuBdRmnEBJ1dm8kWtxhd9oa717PpiiM81DLIjOzkb+QYpFKVSxIdEdJJfcu
	d4b3HpAUgZ0+CDa+O0LhkJFkSKd0lJk3j0cUMuSd2bzsen/ejnDVrwvLktmjf7PQ5wRD34u6clQaV
	xo/M3JDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLr8S-000000021lf-20su;
	Thu, 12 Dec 2024 21:54:16 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLr4I-000000020ty-2HNT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 21:49:59 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCFrbEC005478;
	Thu, 12 Dec 2024 21:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=D1+hsni0AagUQPovf
	tNiRehqPHfT8siZonAxT4C2AOc=; b=KQjzk+fcC/snk8b3HdncawwyzlcH3b7Ds
	nRbR/xhQCCj1Rvu7A73Z0yR5sb+255NDUZJUyrTsuwgwxMn6f1RjERXjx7il2UdB
	F9SwBprwVHz3tQbzUXnotekKW+U+TviX/5be+fLi9zaKZo4A7+cZxb5A9NNKOiOZ
	szjwTBEAThXHHP6FpOdVB8hoCnBcsWH/ngPr8PLB/DuVLRTPXclh7z2LS0wK08st
	MiXC9cn6JbeHFNBEoGgqj1vBVRGmAgXyScoAkg4Wiytyy79LdwjcF4OrdKfBgGRq
	K2Cb2fSEGvkesuLCU2viTldvsgWV/BZAQFQ3j0eljnoJGfYadg0wA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cbsqp0bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:49:37 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BCLnadU025486;
	Thu, 12 Dec 2024 21:49:36 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cbsqp0bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:49:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCJx9xD032724;
	Thu, 12 Dec 2024 21:49:35 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d0pstx5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:49:35 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BCLnYNt40698430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 21:49:34 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04CB858055;
	Thu, 12 Dec 2024 21:49:34 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67E585803F;
	Thu, 12 Dec 2024 21:49:32 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Dec 2024 21:49:32 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v1 1/4] hwmon: pmbus-core: Add label for fan and temp
Date: Thu, 12 Dec 2024 15:49:00 -0600
Message-ID: <20241212214927.3586509-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212214927.3586509-1-ninad@linux.ibm.com>
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0-KDHa8H1pe7UfQWJ29Y9DTH6_3lCjMP
X-Proofpoint-GUID: 2jHY31tH_BYQ5sdwMWIySbLvH2IaACgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=963 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_134958_697198_FBE3C5CE 
X-CRM114-Status: GOOD (  14.69  )
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

Adding label files for fan and temperature sensors in the power supply.
The openbmc application dbus-sensor(psusensor) requires those files to
consfigure those sensors.
Note that prefix for temp label is temp[A..C] used instead of temp[1..3]
as dbus-sensor(psusensor) application calculate index based on last
digit in the name so we do not want to make index double digit after
appending page index.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index a7000314e5ad..149b3c5f3a4c 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2144,6 +2144,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
 	{
 		.reg = PMBUS_READ_TEMPERATURE_1,
 		.class = PSC_TEMPERATURE,
+		.label = "tempA",
 		.paged = true,
 		.update = true,
 		.compare = true,
@@ -2156,6 +2157,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
 	}, {
 		.reg = PMBUS_READ_TEMPERATURE_2,
 		.class = PSC_TEMPERATURE,
+		.label = "tempB",
 		.paged = true,
 		.update = true,
 		.compare = true,
@@ -2168,6 +2170,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
 	}, {
 		.reg = PMBUS_READ_TEMPERATURE_3,
 		.class = PSC_TEMPERATURE,
+		.label = "tempC",
 		.paged = true,
 		.update = true,
 		.compare = true,
@@ -2282,6 +2285,17 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 					     PSC_FAN, true, true, true) == NULL)
 				return -ENOMEM;
 
+			/*
+			 * Add fan label.
+			 * Assuming paged attributes while passing page index
+			 */
+			ret = pmbus_add_label(data, "fan", index, "fan",
+					      page + 1, 0xff);
+			if (ret) {
+				dev_err(data->dev, "Fan label add failed ret=%d\n", ret);
+				return ret;
+			}
+
 			/* Fan control */
 			if (pmbus_check_word_register(client, page,
 					pmbus_fan_command_registers[f])) {
-- 
2.43.0


