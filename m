Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E34C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 10:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=; b=rD1/jVuvTKG7TMbgCbZOT6WdDt
	AmsbGF0TCoOao2qTBLRuB1GRm3CeXfVHelEJSzx3CDxYosDyOq9e91i6W2+KhXSvy2hdQ6/12fuUP
	CSq/lGVHJ/36NLjwuqysEVw3Ams89U4LrfgWL8fw+rUOgBzH57ZZyy474Z9msPDxs9xbOa/C8nXYR
	3EYLoxAmrwjzSX5oZ/oysa/m1uMfL87AoL41BL8NiRHLR6cESdkE8+NL6IzwbuWkJna39QfFYF3mD
	+v6SjppWY6mS9/NbUanvsz7tkMIHhbdikD+EwM7CE+GYc9i1/d7gMWp/Ic2Z0qziT3Ot+4fOOt074
	lp9nL/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzArP-00000002Hwu-0Yoc;
	Wed, 26 Aug 2026 10:27:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzArC-00000002Hrf-0vqN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 10:27:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHAnn3648326
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5VY/KOB4mi
	ZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=; b=f3ToAtLnnYAf6zOg5679hxdEAY8
	VinJg18H1mIPlvYvTXCu7/GToxUrtiMSrz0i4hAGa6PGY9m8KC5p1dbA0/DjesFL
	dOCuxSXs+BwIxiv6K8fQJoKEdVI6f7mSCow6kKgymCiMH8ypSKsC/J2p5Ubw9f5k
	YooO9OMs4Yx7uMQmvG4yZcOXYy5Krbjq1qBAdQvdzvx/EpaLWWBLYtJ3zWiU90qA
	u0zX7s+7c6bK4AnHveNHlGMfy+2OO9Cia4QyjUVq5ZOnJNa5t6i2TiTf2TG4bg/t
	J0bJKZvwrSPXWN2foz57MQ5CRpf7vaP41N/vW+g+OdvJeN9kJsxVDTvzTzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrp9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:27:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ef04756caso1121731cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740064; x=1788344864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=VSRAsueSJ0L+57hLsdD9y5aEqMBbSC7XWtkGEGPMzWEiuASXPgDl1NsEXEO3TLH0MA
         j34o5JwffF86EemKZNGgkqtLWUJR1FCc7loGcy6gej9xlIbm7YKd9cmD+/UNLAaLivF4
         pUvSZYiSRleRltfhR1XMHyPURqBVp6jHwXkbH7DGBMJsBnyrHVmO+l0sWKOBw/havZ+9
         IedldENihNn6AMVF+QeYv/8Cbj4Hiy0WFeaWaBDkIjH0Q470I1w3OEN5stFW487b8jN3
         sJ+PAVVJkfgq9IK0kc3J8JhwnTvHV2P8huAvSEiI9f8HC1HWH5dHPRSxZ2WDd25M5c8D
         eRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740064; x=1788344864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=I3QtFigOdJYbdBelnEKn7jiMH33VhSSVqLEfB4MTHqMVZRUOzo0m2vQmrldNPtn+LW
         0m4aHpvkocjUB5mMxJ5J7mcROnYfnA5bcRPLQq12tyUcg4VsqUzd3gQqbuvcXy3D2TOu
         QjqSOXBu0R/ITHj5Zw8r94Ofn6QQv0FGaZ+FJOQBle8sY6LeEQfAqsxP2S3KUI2Rdw9l
         uiA/POMPW0hl6y0IL/vRQutmkPMTrYP/Lqp5Amz38iLVzJaltvgHghgsnTO5fpnsWbto
         gO2R9sXqb5WiCUhy8AkhfGOPb2tv84WEWvRLT95c4Mlx2pSYvAMosAhJww+bZRLDiAc/
         xSbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPndUBpP4EW2Z7xAJo9BtO+8DsrwwHnb/mukZy1cjFoB3OPc5peajM38E4wuWTCUaNSd/pi1FYparktdAQB4nU@lists.infradead.org
X-Gm-Message-State: AFuF++nCTb61A2bZcl/IsYTqDLojcuXpu21SkZyonR0uPcUYRP9HlBDC
	SzWSXIJZZcdnetDTaH8nKZppjoQu30tBWJxBet6uawIWIiuw9aWsFwu40fBUI4kX/UaZR6ALh2P
	kYryaNplOiRcWn+xyJeSDkKcbFLcmeDt8fq4ZQgYWWzem9mwqXo1VS7/Ut8w7u4KpD8qLW4AwPa
	Tnhw==
X-Gm-Gg: AR+sD139Mq+g2HnCU9QpDLsZGylUbA9vhXxAGq7rKSmYJFsEV6/UW9Z5oxb1Rs/MlzZ
	L6G+8rHfYUak9AEVoOMFacWEVAkpHEVVT3t32IGSrq3tCZ0CgQ0nkDBqmwZRK33IkON5l7bYv+m
	8YnUtOfJTYjzNa+Ofy+6ABQ/bYd0EVNU/un8g3LTyIt6iMqeOQsMDBg+UxlixpJPlXEM8bFALSW
	3Y7m+Qr9JXh653rhyY0bzZCjMMBOxa4NzGd/Z7MGi5LEYETgYaYwcHl9cv+TRATgryCg9eaCJcc
	o7r/dxKhJ56vwcQxMUC6DIhlYfzcMNE7/Ju+vgI8o4RNBU0lMLgVsmPxUIwGNQSv2QiGrsIEzX7
	JGiQ8YGbr8chMVwG6ZksAKfFdkp1pSbDc+Hizg8h+0ah4RKay/kN5Iz2xutymkFUy2DkyFQVmpq
	yRcGmvrJPbt2zhqDk=
X-Received: by 2002:a05:622a:8c1c:b0:52f:4a76:750d with SMTP id d75a77b69052e-52f4a7675d1mr2035441cf.9.1787740064339;
        Wed, 26 Aug 2026 03:27:44 -0700 (PDT)
X-Received: by 2002:a05:622a:8c1c:b0:52f:4a76:750d with SMTP id d75a77b69052e-52f4a7675d1mr2031811cf.9.1787740059146;
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:38 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] firmware: arm_scmi: Pre-register protocol, name tupples for standard protocols
Date: Wed, 26 Aug 2026 12:27:33 +0200
Message-ID: <20260826102734.31766-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
References: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ebfa0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=VscC1fOeZKh3OTZq1J8A:9 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: CvQt9U33aU_dDop5_tPkXODflCmzPJmp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX4ge+EdSUvQug
 266gs4OwZw+FnktWpsSM3NXFLsMtMmZI5sC8mh9C/+mcFdLFBU/iiOPmhTZAJWoZ+pJdpBHd8L0
 zFD7+FE8NGrWq0ibcf4fBrnPmZSZUhpd0HE0snc+Ivfl7BRLpsJZW3Q7HeZ56jXVjdeir8b8fY4
 7wwIHbooBT2jHFTGQodDaERjuoBDBbUTxp6ld5H/MfYDO93OG8IAyh0U4MKLMx1Z9IxvjPGN7QL
 lUeIsZiS+LHQh5z/cwk4M8KLNKmqG6CWg3XwWaEjJuwZqbbC6VNqQ/AshQ6uKihCpPDgPzI1YUO
 ih1c7W2xPiYw5iVW6bj6db3QTPEb7jSe5EB6sN0iZ9xODBlC026LFvY+6moeBTq2ZYgWI1aWOPX
 mYU5XZd9jkUD2R9Odw/aYvRZBTTl2UqDPK93nxKZmrd342qLLGytRZzVRT5Bi8PDAW8aaYiS7VV
 +xC+5LFIwUGy+OsMOXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX/Hht/AOt9Q+4
 nc7Ld9BbAQVDFWPB8EesZKHlxMl+DCWD4/hUC0oZYzwwEky3Zlj6m+u4bkHnGI69zvZhLw7IyH0
 wbJrhHfXpoRu3c9S+THWtN5VrfOmFnM=
X-Proofpoint-GUID: CvQt9U33aU_dDop5_tPkXODflCmzPJmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_032746_442166_3F53F456 
X-CRM114-Status: GOOD (  20.59  )
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


