Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BD0CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=; b=sBpvPVgohT9+3nlc0k9ltWE5Fq
	jNBQAeb0PW4SASda4RYbCisYLmDm/XGmFVZgvyZUo0QA+kTegcsYoBz+9K+Wd4nUh3Um0z/E0W3h3
	HoTyRk9krp8XpnNnjTq84aOK9Ec+GogOcu/o/6kbC4vRzh2R2mbxYT9i8kR03s8khBy95xRcu+aSv
	8ilFJHxO5MXo/OwO51KCTxUDeU8rnpeYcdrLFaYUIRelPOdLn6JReLzLUTQ/qBUQp6cJ2cxpEQkR/
	nrDxKXUL4QvrQd3czN3yu0GHMDyxzXQxd6LPep/kDE0U0uNaI2zlPAu4thB/OvRkHiwii3ySX72WE
	LXxAceHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChE-00000003F9V-45IZ;
	Wed, 13 May 2026 16:44:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChC-00000003F8Q-3WPh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:44:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAu5Y2524334
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=; b=C8KHt1JE0kglxy4D
	vqNfiYBPgRn5k5qtEg7Xr6aFGruSU4sdGDOCBqf4i78qfDWAA0bNToyL18FGM7ky
	FEPa20P7r2uCs7vhZJAaF6al91MtG0Oc2IdOah2c86KlWHKFAHOaitfQiOk69anJ
	be43IJEtSroB048evvO37sKIa7ZHNTskDrWESICr1MsaoaCE3Dj0IHflfiyMkJL2
	cOvKqPy6eSAOGrSfu2pj51F29MQvE4AOeR/I8+ZCMW5EAgLpqjCyvHdvweGr04tY
	yZxR7Lqbm35Y/M8Y2JGepKDU7/zl0/eevgeZNNtIFhS9qazYy7Uf4oCevSXZojeT
	hwrjQQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjg48u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so6051026eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690669; x=1779295469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=;
        b=Y4pFgjSAagKPfZT5JxVMRrNjNDWFTEzungfkqrVtRO836Z9hJqTqPz6fpsJHhA18SR
         Uhnh/G1y80WTCOF5RbwmnW7R3CXPbxKCii8r4Ef2Xlku0pj7mt3UiviCc1DM3wteWmbo
         Ept0w4oA77bAVJzfcLYeP+rA6JVcduJpcWwhKXTBd3qJBfac1chmcGK0IqEsKgMLmJHx
         kBdxfV3gSkXIGyxGZh17PFVwFJa55GGqsx/LqcgVql/lq/O/S8NI4dRgfcXIg/5VcAyH
         O92WwDoHLuMTdw6fPVG7aBSqIPZw1IyF6Rs9GwEYdx24UPVE6cLVSGrRGQeF+yC1PDeD
         IQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690669; x=1779295469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NqpHbTw5SrTogkQ6SExJKQySRSNYlZPHGNncVU5RI/Y=;
        b=MnULPIC/RJx2Q+5TlOyVObRMTJN/sTpbcjwTGEWq3KF3HiNMmnrz+e4ACkrSpz/vhW
         Ca8QgtdugqnqNE6uZX6kkzpuVqgOLs6Wz2XhzSRBTRzQg/yZ2iL1ohRQvt3/T1NiY3xw
         apYT9FtIQyYt/W1g60Wtcy2jTocLT4e1MSWUTffhlDfbxEdjZzTCqm71T/B+MqdpKAGL
         OzZgd6HH3FKGF6OfxoJqZAGDqNN+HT27QaBB8yz7xmbNJocTs+u1CzNknDcrAWJV5Izt
         E2fJG+6X9bmOhxwHdoaQElR0FpY0asgWa/6HAQu3pxfNpMPDdnn9nz37EBAyFOt9o7Al
         3N8A==
X-Forwarded-Encrypted: i=1; AFNElJ+dKCJqP7kbSV8btdw9SwveRo/91zlR07Q5AiaQ7EAVmIyu5+tprt3ol1+453JV8coi0a1hLYszRSJNhNrlN2Vs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0sqcW4sglKzNmENLyomgzDyIDratqiQJRCPR/F4FKXh4tAqMe
	ZZ73n+vcM4kJJ7FyLKADjVP87S/hbWbajl4sMYZGYDLaCMhhTuK3+HzWTPl9yQYoZKYKovEsgQY
	ZKxELL0xcbiIYKIHX/FmfdqRTxpkPpZrsO4HELTPrsxmAYMvkqgG8WijyTEBOicDPCQAsSdKA7+
	fkuA==
X-Gm-Gg: Acq92OGMzOXYBVoorjMdECllb/jxgjD9hRboOJf1JKqoKgBe6b5MzddvtUex4m6QLMw
	3e/kGe4hsfXTNWoZsscLksHKijt5kg9TIlSbvEs+bAT6wiMW1W6hEEk0i3e7n+PRQQflH3QfBlX
	mgTK2+9cjcN1eSaVvZdCAipqUL+riHh/G3R+U5qkRN2YPpaCgZetqwGKudDHvKFG4WX/aiESu4u
	DvAjvBzqBw76jEfXs0joloaDIfuRylQR/c9O39XJVtirNQiiER9mT1Dj7PQ1Od5c++IE+2PsYuU
	IWxMRKN7mmr9xKkI4I2mcxL0A8USz+KYbp2NaakgRgB2Kr1+pM6/HwGcaEfVhnTOwFhbTQaU1IT
	EyXU1B84YXMb49LP/25/HDI2+6gx/Giri2tAT+nevo1MCr0PoGVJxfWfSpVUG0OsTasBHVuw=
X-Received: by 2002:a05:7300:a50b:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3011a369c25mr2262183eec.30.1778690668583;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
X-Received: by 2002:a05:7300:a50b:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-3011a369c25mr2262156eec.30.1778690668042;
        Wed, 13 May 2026 09:44:28 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:27 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:19 -0700
Subject: [PATCH 1/5] powercap: arm_scmi_powercap: Log number of powercap
 domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-1-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=942;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=b1XEOyYfA71ulQFPRY4KVUwTd8I87LzQvOwhzVXsPXc=;
 b=My5DR7z1/2KIWwHKe0cIBTddjrYizysbTmiPqsKJxVjsb26CE5501wqsIcvFi+92wv43QWc7p
 CdUopfQLwVqBg3dE2T/aTJ84vQpNT7/PK79MNjb/MZXiXtast982sre
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: YBBj4PIDpK93h-eov2KVBCDCgzeaYqww
X-Proofpoint-ORIG-GUID: YBBj4PIDpK93h-eov2KVBCDCgzeaYqww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX9ofJzMDo3kO0
 X1TpJa6zxukq9pNdSgfJ/p7yapmRd5OiPOtaWHwqpUhjuUJlNKy3U2TWD/qOG6d0i8BvKiHv/A7
 7qPn8XC4oTWWOiWI1zOIWmVjVTMO/SymJve4dqf+yTNUAiLd6vypgiYrRrXu8pl+gF+1fQ5jboI
 cfrRT9GVoDcJTK2QVV3nOPlTeBzbMNMW4ge2SGq7viWhTfjd8YbOM7bIXNMctwUV28haJT0RipE
 TcDpdF+fqJrn1XWih0zYI9/zUs1IyFYZv7Hn4Ippt+5VLqmmeRp63M79mnIgW5qXAa6N3ER4CmV
 c9Ici07bebxGcrv1lMQPxMAKdBqROBCsj70ig+ieL8b+ehSEOh7rnhuoeimEARBwu8PnTg/Crz3
 xrmKat5DXREYnCW7zX8K1qU4BiL9jRx5JUlKJzkUJUDZa0afJQGULTuQvAa0RgCb1LlUSD+ysR0
 Otf6ohfEPay8PXHPpVg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04aa6d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Bjf1dfg4zo7KOAcPRCoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094430_996130_C441FA26 
X-CRM114-Status: GOOD (  12.91  )
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

The SCMI powercap driver does not currently report how many powercap
domains were discovered from firmware during probe. This makes it harder
to confirm the firmware exposed powercap resources during debugging.

Log the powercap domain count after a successful probe, aligning the
driver with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..48d721385f94 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -496,6 +496,7 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		return ret;
 
 	dev_set_drvdata(dev, pr);
+	dev_info(dev, "Initialized %d powercap domains\n", pr->num_zones);
 
 	return ret;
 }

-- 
2.43.0


