Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1177FC88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZj8U1PD25cE+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=; b=bcvsrT7Fq/Bh1TtkDiPIYRqSDT
	uSulGdhNG+5kMejZob9a8OEgj3Ot6jT2Mk2ffFhcaMaohHm1hNCo4jYZpUA5lot+1L8eKdl52Zhtq
	ib8cG3K8hkBvDifKK+H1aLD+9/YrglaeP0ih8WKbwUVNLaB+PmqyRGwx55MHziGPT0rUxADrtmPo9
	DFOTYeMpRG5PxNz5r2W1M0/5suoVBC9eOT96PZNdoM7p2vYXLNLy4yYCLSqH9m4TZAF+qw87KK7os
	/N5MRhpqmTTpoGr4C7tI5SK1X9Xh5BHMeu3mHW03j+2kdmQH02HdPp4IJ3nMTugZsjr3ZVAEFGGik
	HWztPPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536n-0000000H2Ue-1Kub;
	Fri, 11 Sep 2026 15:24:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536U-0000000H2LH-24dV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:23:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmF9T798918
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mZj8U1PD25c
	E+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=; b=LhMHT+xBhFwTdV7bkSdWxz4EoAC
	z7U/u39CJNv7+23UyJYMvjDYMEGHhjYtseSJJci9B0nWGAImnllxhTjT0EANdoKP
	O0D4JBPXRbsyNibsjRLB1PDsU7yNh/QaRMmRbqfRkzOZZ1O1flN8oloWTgobel/R
	IZXEaxIvwmnbmwUbO2FFAb44stsRh+9EwQdAiFTWW4r1lIJOfnYoBLXOcc5Jfz6t
	acExdXWI4GV1osNWm9kSyXrS9jbH72IQhj7vmOCHuTfn55h8fGXsH0rp8Fyf6AfX
	9kEIFFa5/DRPc4fMAv7p4LQVQQ9KeWYmcZyeujF6e8i+L2GmhgV/24R4f1Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q147ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78580a6b2fbso307435137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140229; x=1789745029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZj8U1PD25cE+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=;
        b=gjoyuUn86W5zxc13NwQf4OBHhjv7e3GzrcFD/MCMK6nvjECVUoLcAVDNdbbj+jJPtO
         MA5rE4OxWKwHl2pboBRfMnkhlRXOhe/NclDM4YCUufiz4BUYr014+TrnVMShV7r9Ksw8
         T1C65Z5NIN4zW6VLYb2WJF5KYtIYZJuYVFYvHhs9lvpvSEIuMaW+Ek2O5lP1QTPPzy16
         dKj6SZcGhzZQ5Si9L62wK4brKtijW/z2rPF+jX0iY/62b7ceJy9B2Ym/7fKzdIYMABmG
         1++ECZyYgS05du8n7BHQVk79ErE0xivu87uJJ2Bq9uFdKlpYzQlAECxRksy2HaX81QdX
         UB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140229; x=1789745029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZj8U1PD25cE+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=;
        b=M1XbdZotN9PFUnA8llZNM+be3zyjjxZxtK0ocabUfOL16DN8k7h8mby5M9MsVgM8ta
         USF/wnYKB+Rl6hi93cZu+hsBWx5spEIxfeDBfe1it3Y91YOv1c3unRnSOyn2LZ0ss6u5
         p0de68xIfLOR566oko89GyMwmoyF0aYY0rJ0rQeMxsqI9PCa1qgwdo385YInNlUTOIg7
         nRFsMIpX9ugOEnDCvbpcu49Vp15LlZf5TK6ZRNzaJupMujpNYtcdDgQiylROGK4A/2qv
         oV93tWMswVQlo0Qn+0AAV6nohUaRqkn5ZbJHwgLvtAKHpV1aTNB8uLCwoWDWNPJbau/I
         wKVg==
X-Forwarded-Encrypted: i=1; AKwUvBw8vXK2QS0QfUfPGU+YBW79ZBSeW88qChOnKPjqpWWhuKXWCnN1owxGFYFgHM/iSPRUa1AUbK0KXzCDjow5AX6C@lists.infradead.org
X-Gm-Message-State: AFuF++kpu/PlktYB4PZwQZbx417+r/NUXGLBhpljPtLlkf0hdDyEmMBI
	IYsPmT412xFFYhG1z3BfZob2rd3EBiiQyYwGTDHLbIb1QqGinu0+lK1cSxbsJsl2YF7IyYXDcwY
	UwwW3SXL0wqRT01NWSbkERp8lN93Ra2NBoHSUYxJWFhzkh/xo8uB41YAiJjW9miaPWAUYU+46Vk
	FgLiAh8txbFg==
X-Gm-Gg: AYBFou27dej6BXKLRS05bQfJAeiv0APj1V0E856b4gp9VKPKtKBZCs9Si9+NzrPAExw
	lKvkEY+0I2c2BK5y7uef6R117lEI1MzL/qXNg03StKIaphv2XWOKDQV+370HN46sD9/9D35uDtr
	F5SM1nt0Rx8ENSDqfdiMMV8QxQTcolkPRMCB+ltKamJmaKOK/Ihqo3pE/1Q02P9nb0z6V45NUG7
	DTehCAL7JEPkrzrvx80xmzTYw5IoIcB5Lrhji9lO+KoOWJOgywbzq3TFEkoZU5br215wDiIHS/5
	rpqSEahqJw9j8/Dhj4xP7GjMyW5SkVC51GOsk/35EVuowW0ja7Exd1Fixexd22/LOdmDNGBAIes
	HBwnTGtC+HD1F3UNUmNY1SenIXWWwvR7/0E9Snefeyp42750E+HzOCLoNf8o3VXhNrA/Y8JNSDn
	OZBzw0pMIZ2/HhQjfvdmkXgDEIBA64ZWuMSaX0
X-Received: by 2002:a05:6102:c8d:b0:793:980a:d1ff with SMTP id ada2fe7eead31-7939829b4d3mr3029882137.3.1789140228734;
        Fri, 11 Sep 2026 08:23:48 -0700 (PDT)
X-Received: by 2002:a05:6102:c8d:b0:793:980a:d1ff with SMTP id ada2fe7eead31-7939829b4d3mr3029791137.3.1789140228322;
        Fri, 11 Sep 2026 08:23:48 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] firmware: arm_scmi: Always create devices for standard protocols
Date: Fri, 11 Sep 2026 17:23:29 +0200
Message-ID: <20260911152329.5822-5-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa41d05 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=l971TreVHldC-rsvbM8A:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX+q7zjx0k+6/1
 2LmIwn30JnIaCZ41NghHEkE5x9JzobZxzmVzQmItU0YNCapmh9838Kxab1vGw43OgeKh2xnlwyh
 C0SQg64znj3EbIXZoH7CV9smGSDZKVRazDLmuFTS7yd9/wNhR6hVON5+X4EhMksYR9P8y9zSOpk
 mSXyg6D/P/QdEvS5bvgTIIGVqtLUPkP38Qa/t5V4N8EeT7GnR7oBRl1ViUODN0rvP+pT1SwVJUj
 lJYcsAT1sdiRLwBIftUOYqfji5PFitAA9eMYeNeSdTX+/bSmPFVIjwupewPcB8q5DGkxNqk8Nnz
 3rmmOixj3lb0zDyaQPazxyMSkTO+rYn68vHr75GPwg0ADusLZIcJmZQR5kcJrvJELOktxJwVA5d
 3vPWo+c/BZmzEim4epPhRKdSC6fUF935Lq3mFAb/DVhPhfViID8f4S9brAGD9EVKAw5x+UVImEm
 bbxdMK6Rd7kATquq4qA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfXzOX1HvJus5Rv
 ZiItgJlelQF2OXJtB3f6hv3LpDRPQcyuSkYV2r0ZymHbe6fYWGD1dGDZnb+jRBUBSKtzdVR4FLd
 BWDZ0k4+R2aLUEY4ay1DZSM00B+IbBs=
X-Proofpoint-GUID: 3cEph5fCeOJN5p5gPWQCf-JeBPrPH6DZ
X-Proofpoint-ORIG-GUID: 3cEph5fCeOJN5p5gPWQCf-JeBPrPH6DZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_082351_470926_B4F1AF38 
X-CRM114-Status: GOOD (  26.37  )
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

Protocol driver module auto-loading requires the devices to already be
created for udev to get the necessary uevents based on which udev loads
modules. But SCMI devices are only created after their { protocol, name }
device-id has been added to the requested-devices list which is done from
scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Add a list of standard protocol device-ids and always create devices for
these without relying on these being added to the requested-devices list.

This removes the circular dependency, fixing module auto-loading.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point.

Changes in v5:
- This is a new patch in v5 replacing "Pre-register protocol, name tupples
  for standard protocol". Pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
---
 drivers/firmware/arm_scmi/bus.c | 50 +++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 651d4ba06574..ea59dcd95b6a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -511,6 +511,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
 	return sdev;
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
+static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
+{
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
+		    !strcmp(scmi_std_id_table[i].name, id->name))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
@@ -540,22 +568,38 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 {
 	struct list_head *phead;
 	struct scmi_requested_dev *rdev;
-	struct scmi_device *scmi_dev = NULL;
+	struct scmi_device *sdev, *scmi_dev = NULL;
 
 	if (name)
 		return _scmi_device_create(np, parent, protocol, name);
 
+	/*
+	 * Always create devices for standard protocols, even if the device-ids
+	 * have not been registered into scmi_requested_devices yet. This allows
+	 * auto-loading of SCMI protocol driver modules for standard protocols.
+	 */
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id != protocol)
+			continue;
+
+		sdev = _scmi_device_create(np, parent, protocol, scmi_std_id_table[i].name);
+		if (sdev)
+			scmi_dev = sdev;
+	}
+
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
 	/* Nothing to do. */
 	if (!phead) {
 		mutex_unlock(&scmi_requested_devices_mtx);
-		return NULL;
+		return scmi_dev;
 	}
 
 	/* Walk the list of requested devices for protocol and create them */
 	list_for_each_entry(rdev, phead, node) {
-		struct scmi_device *sdev;
+		/* Standard proto matches already have their dev created above */
+		if (scmi_device_id_in_std_id_table(rdev->id_table))
+			continue;
 
 		sdev = _scmi_device_create(np, parent,
 					   rdev->id_table->protocol_id,
-- 
2.55.0


