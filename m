Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38D6C5DF8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=; b=tS3C+u4Q4FOhTDGFuXUaS6vNkF
	uyCYjL25uOMz680tMqXJpjdEvtBwzigdOmstGAUxbG1iDU3ZiidsAKg7kuUXXvGQSoqMFtLp9y1J+
	bL8CgYMNyj6vudPG3EMtVnqPVZy5zO9AnFd0vyyIwsV2EeSq2Nd+9tNJaXcLtI3cWwTICom/xStus
	nMa+xeE30NWpVbVrUU3csgls9astje6DdWpw7yy8DXxO0Cc7frLQpxObdtZgoTUW4CWbOKZsevh1y
	KnAly3CpBSYy7ZCB0YXF/UtbeCUgyS2IrLVFOFBMtLn/tAJo0k3f6XTVhqkqiMTNq9N4hWkhs5SQP
	5vMfFDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8l7-0000000C8go-176H;
	Thu, 20 Aug 2026 19:49:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8l2-0000000C8eM-0lEG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:49:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIuS3571519
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 19:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5VY/KOB4mi
	ZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=; b=cDgaiLCF1U6QfVNFp8f+3Ueeh38
	InEt1JCa4eRGJny6UkdnXEJduqbZYLnvFt/R7f1JjpPhw+dCn5cwsdyn9DVuZvN5
	MR9Rh2dDKKSWPNk5njY0QlSYqEY4sC42FK4qrG5G1wXoEAdNdGHbqqVW91c2Mh+D
	TkJ3Z5ec90h/HvI/ErXO2xmJRbAkTJKXYD+6+0Nvpryy8oLEH5x0/6yOKFX1sjFw
	OapQzIlmLGUwMhI8298Gu8xvKxwyRvx1g/DFoOeAa8wyToJIcYCcb90gbxe6Do2G
	3TH7HGHYaPnn5AcjlZJwU9lTrkxnKnvSyil5/iVeeEsHGa9vmeqvqSRmntg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcb0cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 19:48:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so16455485a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 12:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255339; x=1787860139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=Gqd07iWltk60A3K8hONrT4plBtFKGyRwqneTDfwbM8MKTth1D7XjQwDNlYDQhQbxVS
         3nbjo8/PLMZPLQi4TKTRzW58BpGKHQt97PpbqK5OGJr/evrQZsp0c3StnNzOvQdxzuad
         v76t2TXwDIvLwYnGaqg8tO5ZNKzvDK11r2xxSVQypWGdochSVueK3jDVHsbefU67D0RO
         3BdHvKgJIdDW72DMHgDRvs9OxUSiv644wruWLoPYxSO4vKqv2TMrfYpDU1fnCQyDSoBG
         YyEXtGA5GA+BS4EBWrFilcILpHA6aNSRsp2/BHu80lHiZnhFmJnZoEuQhkhbNr1D9yVr
         USsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255339; x=1787860139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=NwlBGW1UVrz1mG9gix689QU35sfPHRAgPj+lLOLGFZi81aj547vo73PQrMHrJcn/PJ
         Y6XdUalWDsAV4ZNdQTJ/h9EcNFo2VoooCs8OCdG6mO55WrvaBzEOiRIX2rvy26xnpIpF
         oDa4urvMda6pRwRgLQgo59whAHmaih3QMPCuPHEGSXk3TcyFKfiuzlz7Cjff1fYJZc/Y
         PMimep6X2xjg6VcZsNwZj5mfM1HeBgvUaylCD8Hby8lYl/CvGr5N/jW+ycQtRezVXIOw
         vJWFSSCZPjznGuWvLarM+PzZy4fUz8xi9gyphauhXiWsZ86auNEqN/fJa+6La0HQqn3k
         sLKg==
X-Forwarded-Encrypted: i=1; AHgh+RoAAf/O46t27DmQmZ2sEHWgPgbeMxnasdiud0BISsLmNEfzXjEQNHZfKyQlZdKY2QhH89cxCXYEM616+fDBi5no@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpl2q3UfEDhvQFGBf3uiMX60LDCXQyQ2lFgst97lMGfxGZbgmH
	oNi8VFgA8y9u5WHCCFTvufCZtPCAlnoZnIfmDtrUUqgP9VglO7Yp1WTOppKcKrKbdN6CcBdgTWv
	kuyC9ypUfRohyKxnBJz3NN6vdbQOcQz1RQL1UrsSaPPzwycZ1VUmMLzVu//mn/Pqna3HtMMyOGA
	rBMQ==
X-Gm-Gg: AR+sD1254V4zM1TtHVqDvjazHBGJlHAUQG28bp/amje7PQl4vTEUmeSCFRTUFizcIaA
	55+Rzx4IIJ0XAyyoMB2Jo3xtrzLV8DtlZnLZnzS3WQUu8Hvb5LVu3q/ktxztkmkvRUfTSAu9prn
	j1RV+lXZSZommCVxLXS43lyrhRR1GFov7sxJ17HA93Zyz6w0yCkWhMnPUrSqSV6ng3dZ0Lul+/s
	j2Z2Af6ORWsZTGl07c6y16JqWvPFbXG8q1vAFtiKIeDS0dFVXSls4DoYhfrEiyN/PJ33s1XC9xe
	SK35lrc8Q2ix0VUH9WXyYKGim/an1OdUMFktDGVs48i6L8BPB4zFWuemaZSVY2qKH+YeZaOfdWQ
	//my6k37LMG/4
X-Received: by 2002:a05:620a:4014:b0:936:8840:427f with SMTP id af79cd13be357-937395429e3mr52933985a.4.1787255338615;
        Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4014:b0:936:8840:427f with SMTP id af79cd13be357-937395429e3mr52930085a.4.1787255338126;
        Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] firmware: arm_scmi: Pre-register protocol, name tupples for standard protocols
Date: Thu, 20 Aug 2026 21:48:49 +0200
Message-ID: <20260820194850.459739-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a875a2b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=VscC1fOeZKh3OTZq1J8A:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 3XhEd0gjiK3rSV3FTBLZ6RWp8m3pSH4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX7A79OEWjZ++y
 a02HyMyLZc5nWgtwuC0gXBM20eOf3HN2kFSYGhoEVYU5Vrvi3i38/hv5tlVuDOq287Tlud9594y
 2GgdZAaJYdkyAN+eH7mLW5BY+kZ/qt970UNek5ArJWRBo9ffafKu+FZZQRDQ258X4mt8Et7oWs5
 kjXlCv6N09gdtg4Sl8W4iA4ZZZnDhKCaEGXYrLYskMOUdzLAkEb3YvBVzOghrfYj/13uvTOOPGx
 7+CI6vsIO/Q+OwFbrXD25EbwsWN3CpuQ/9T9Qvsm3ZL/ODOQb4MP0WpUbj2/KpVxNjnPI2LPkVq
 CBKCUESfXDZp4RWSEe63lBOmquIsErdtX/x28tz1mjysGGNy6j9JP5Rpwhk3Rb1GnBP+LMTXk8p
 tRBXlH6fT/czSTC3s23zCAd8yjASXz5ndcARuti1N5nHny9UAlQW44YLC6ILxpz4oJiJxJux8+o
 jWjn/ixgIJFfJ5I+Icg==
X-Proofpoint-GUID: 3XhEd0gjiK3rSV3FTBLZ6RWp8m3pSH4-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX/uNbUXlGLwTm
 1w7oO3HdQbgPFMO/HPZiQiKsUoSRLWS8UmB74q0QXpYrqkgeIINKBCn+Y5omAd+NBe4KtCnY3tL
 bnV1leOHdmW47ctYqXszLHrwnurOOtA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_124900_225010_E2D8682C 
X-CRM114-Status: GOOD (  20.73  )
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

From: Cristian Marussi <cristian.marussi@arm.com>

Driver module auto-loading requires the devices to already be created for
udev to get the necessary uevents based on which udev auto-loads modules.
But SCMI devices are only created after their { protocol, name } tupples
have been registered which is done from scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Pre-register the tupples for standard protocols to break this circular
dependency.

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- Drop adding of a bus uevent function this is already done
- Update comments and commit message with a better explanation of why
- Link to v1/RFC: https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm.com
---
 drivers/firmware/arm_scmi/bus.c | 47 ++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..111727904a89 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -77,12 +77,13 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	if (phead) {
 		head = phead;
 		list_for_each_entry(rdev, head, node) {
+			/* pr_debug() because dups are expected for std protocols */
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
-				pr_err("Ignoring duplicate request [%d] %s\n",
-				       rdev->id_table->protocol_id,
-				       rdev->id_table->name);
-				ret = -EINVAL;
-				goto out;
+				pr_debug("Device already requested [%d] %s\n",
+					 rdev->id_table->protocol_id,
+					 rdev->id_table->name);
+				mutex_unlock(&scmi_requested_devices_mtx);
+				return 0;
 			}
 		}
 	}
@@ -579,17 +580,49 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
 static int __init scmi_bus_init(void)
 {
 	int retval;
 
 	retval = bus_register(&scmi_bus_type);
-	if (retval)
+	if (retval) {
 		pr_err("SCMI protocol bus register failed (%d)\n", retval);
+		return retval;
+	}
+
+	/*
+	 * Driver module auto-loading requires the devices to already be created
+	 * for udev to get the necessary uevents. But the devices are only
+	 * created after their { protocol, name } tupples have been registered
+	 * which is done from scmi_driver_register(). Pre-register the tupples
+	 * for known (in tree) drivers to break this circular dependency.
+	 */
+	retval = scmi_protocol_table_register(scmi_std_id_table);
+	if (retval) {
+		bus_unregister(&scmi_bus_type);
+		return retval;
+	}
 
 	pr_info("SCMI protocol bus registered\n");
 
-	return retval;
+	return 0;
 }
 subsys_initcall(scmi_bus_init);
 
-- 
2.55.0


