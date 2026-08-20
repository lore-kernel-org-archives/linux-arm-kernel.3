Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE56C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=y+LZo+3zXEwNQQI1L0epsjfuMr
	Jzjjko5ZAumyEcRSr3pwNCrsrokwvAdLgtXehdxmGEIXnIZq2o491h25v/7DPXLfkvQUmb9rLyqk3
	J7poaqXxmZ4KWRIhMdM+hJOOM3eUHt12dIFPJCI98UpwMGygDFyOtVJXsXYTAeJWWCL5ewkqOe0ND
	wv1cDUfJnJ32QWoC0qxfOMxLpWJ/lwUPnkGiavb1AupTMH+lbbsOW3for5H8al9Mmd7YmmXcD9CFV
	1IvXihxufSvSbDNAtEWjN1IrOxvB1kHAqz7EhAtRXCTnkMVfewWKDhYY/aHVW6lxYd83kdAglBQ/u
	Xq6rrDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8l7-0000000C8h6-1WPH;
	Thu, 20 Aug 2026 19:49:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8l3-0000000C8fA-2hwp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:49:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIttA3705818
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 19:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbJ+FmOGmDz
	b9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=C3O/WUVIys4ElKd4LJDGfaih8am
	CMM4C5GhUxPMgEVmQHnGmtChtz6W9H1+0BzjPj8WFolQKvn1EyoiTw9luB1CodGd
	cqF5E/RX5CyEyqkKEHkZLzMlQ/s+RBH+rSf+ktOBKxwTRx082kHzxg1ZiCepKQ6d
	7/mM906fhyR9D+f5ql5NNNWsnJzco4NDlUtdCA5vTAHRCElDYMhFuAo0AIPj9BBH
	GXZiTYo0qXri8xXVMWGuXtnwKKJNSruEMUhu3MFFKA57gC1CPCm7FKgdj/eOgBvP
	ihtOAjiCkF46+7wNxCxXWO/BbxnRj1Ala3KN0UBpzdFxL42NGu6Aiq+I/BA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7ufqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 19:49:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b571432fso19193385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255340; x=1787860140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=J+wA1TRH1ZRI/RNYMcpdx4IvJ9qO29R5M0ohgr98m+ozs3RY4vNZCaOsm1UHZZbrGl
         NEvrXqPPiZ1104aEzw6Tg5oAdbXAZe+XjCQZ+GLmoBojN2tonaxS0+Wee5PZ/lmCtS3L
         TxJGuybldqo5pkluwGyhKirFwggMcm1tkLKxWP4Ho3lMrQgsS80NFZFm7sO7g5M3uRbg
         SiAmDvvbkGKV9PRznbUMZv56YlEUYfEkSAnajtsbmHZ7HclY2QdHW8gDqr1tkpLPL06B
         Y+2V5qd2yAVkV+Y/e2dIirCNR0BTueEJP0EVVCUb4zr0/yjMQTkpKQnlhjr3hE/VNqYe
         J6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255340; x=1787860140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=j1JPn42YrlQoPPHx8gai7Lg+XNp0fRCxd8C7dM45txIifmqYFSGWIjESinTXzHB7Py
         +pYcy9Gs2b+1659yNK8tjTlCIlz3PxZGuL0DEbb9nLmZpGol43MV1kd6/PEtmeqiui9n
         sS6KrINnNoE3+QxkD8QIeSkPCt1YWhCZgy+0S/w9lEJWOsx4AS5kA63gAyDaO5mspFdQ
         dKdNngKA6oUPTvuLgpyuwCuSTAiIrPGiJ7EdzjYq4HFQLglrSGCOz6yKuCLsYoMM4z5x
         vFkxq+JUlad8r2PUMJeUqg3ZZ0G1kG13SJ6E2me1KJW2dJDkLSaxQmPvOtcg3yGj8bKA
         mL3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpLjZ0goo/6IYZBPmObn3bDh5XS7hdQqyddWlherk5gfBs+Kth5XOaSUBfR4sUN+2FYcFNEjWsc7bkx6iJnVSuV@lists.infradead.org
X-Gm-Message-State: AOJu0YxW/OCw06cFRbWEEMCC5FF7zUpwGycq8HfkBv00ggxfxbpc6fDj
	sYnsDpv8mT4NEcPJ5dfZL2c0rL7M2G8D5n0LNG0p0IvRgZ015OqvB1TBF4yU1VohWT39O5QOv6u
	K4cLBpkJQdf5r1+ydqAo3n1JiCLY508ehmPjwhCtwXYBdo7XnC+ouaCjwHHuNGpRSYVksC//3VA
	IdYw==
X-Gm-Gg: AR+sD11cgtNz23A0b/jn0bHgZu5+GD5dqwCO/6z9TO9PIn+OLKaYiekf5ER1bMQ3UQ3
	BrwCr+3nP6pqVkSQWA+EK/c7KJ9/DaJ8Ty0P7oc3xa3gWf/FYOZd8YQOnQWT6d+x2vh9JQ70ZtQ
	ybD9uSQsO1wlC2uzs5zBEFF6pawC6dO9OXZHDhiO78QqpVShB59qrER1iakw0XwDGnUUtRuM+/4
	iE90aZYa+aPFJE5wxvhXI4VCHQpT4Lk4s6ZsBI8+neUM9MF6f74DhVDAvAJ8boO9/cSQZzzq6AA
	hJSpyJL39mCD7TUMgaVgyAJTXRbzTKe9276qOo705rWCtVlZTiANDndJh8SkqY5MOv2ojMryyHp
	zo4zqGrZo/kNU
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr977537985a.21.1787255340085;
        Thu, 20 Aug 2026 12:49:00 -0700 (PDT)
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr977533285a.21.1787255339638;
        Thu, 20 Aug 2026 12:48:59 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] firmware: arm_scmi: Pre-register protocol, name tupples for IMX protocols
Date: Thu, 20 Aug 2026 21:48:50 +0200
Message-ID: <20260820194850.459739-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX8O7RtcNClNyW
 8lUyjk0+C4iTsSUkMKCX3JEpHt0KWcX1Q0bWZuPrecSB2PEAh7phg0l1H2euP+iekRDMrfMlmSp
 enRonA2Lpd+u7rhDy93vHk8jmAY6WX/AvTjD7d68rd3zgNBFaZRL2Z35sEiRLTPFUsHodJ3dkL4
 OxmkjSBRMDWrItjKm15q3grmoCd3NjpnNqXIf/d0xzbUgbFTY6YxnuLYi1or7XzsprbQg5fxKzm
 dVREXRnJyWEi/f/gbYGTChrSZQBRr5QPWSCzMeVlYUrg/xxEAiB6C8Xe4O3zcpPRgkmGAlq5LYJ
 m4bsvvT7W/CScZEk36xZQ7xURDqPwEq2aTqd6MkkRQBqAvwQ9ghUkOOxue3+eUhNz/o6Y2vGGvt
 CKrhaR6B0e+vxduqqJ0/5jYTY3cn6MpY0HKQ0SMcptOSC8ITLOCYzNB8dUHlybHf6Qj7MipQDZx
 Vl1XWkFAbRVaEvuhV2g==
X-Proofpoint-ORIG-GUID: 5I_8GrvjN3AuXRBhuw7zavRRNvSfcxEp
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a875a2d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=88Q6Yv8u5fullXUEwxUA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX6hx8J/OfZGsW
 HKdtABPISNEEAVD2ktyHaDCI2diXrXsEuN1gLIkiryr0VCjoadsbneIB193FSF6zsUSSw/oAeRE
 +pJQQOV2yBq9NeyPyrIrwLWLzxIFog8=
X-Proofpoint-GUID: 5I_8GrvjN3AuXRBhuw7zavRRNvSfcxEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_124901_689240_37D3D8B6 
X-CRM114-Status: GOOD (  16.78  )
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

There are in tree drivers for various IMX vendor protocols, also
pre-register the { protocol, name } tupples for these to make module
auto-loading work for these in tree drivers.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- New patch in v3 of this patch-set
---
 drivers/firmware/arm_scmi/bus.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 111727904a89..9f5740dc606f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/device.h>
+#include <linux/scmi_imx_protocol.h>
 
 #include "common.h"
 
@@ -580,8 +581,8 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
-/* Standard protocols table */
 static const struct scmi_device_id scmi_std_id_table[] = {
+	/* Standard protocols */
 	{ SCMI_PROTOCOL_POWER, "genpd" },
 	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
 	{ SCMI_PROTOCOL_PERF, "perf" },
@@ -594,6 +595,12 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	/* Vendor protocols with in tree drivers */
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
+	{ SCMI_PROTOCOL_IMX_CPU, "imx-cpu" },
+	{ SCMI_PROTOCOL_IMX_LMM, "imx-lmm" },
+	{ SCMI_PROTOCOL_IMX_MISC, "imx-misc-ctrl" },
 	{ },
 };
 
-- 
2.55.0


