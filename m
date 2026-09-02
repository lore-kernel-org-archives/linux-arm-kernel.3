Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE19AC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbORKfBAEcYHO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=; b=3yUS4LbCU4YJq0YSuObhTrMG2s
	YqfNJxurq9DoLQeP3WRNUnWsF6Bo+Xe/DIIzDpsNnXOVMmFc1hY3V8nLWB1jyO1hExF8Z/lphh2SQ
	TIsWKYlpic+bQrsqX03sHmP7XToEJ6ZKC0zl6EhFf8JfQLiE2uzCKSGgnlhYrY8NYA6UTzibQkckj
	69u70n8nWaMTPITbTLpKI5lB03gNCdMdHtw3Zr7Dio4x89/yJGN/Wi3q1+uR3Nk99GYTokcvKqo6C
	ce6pk6mZpSURBGt1qBhqtTNMe/l9q84HsrlVETLz+SwKHdLytXvc+JdiRv+IqAkKK2Plk9PpArQrO
	gIaNoAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pOO-0000000FY7C-302N;
	Wed, 02 Sep 2026 18:09:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pOM-0000000FY5c-0Zq0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 18:08:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrFha2976078
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 18:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bbORKfBAEcY
	HO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=; b=DxS6P7SLUnmuzeNOqzF+4g/zJxu
	Ce2GUi0lzlVVbLVCYigkJKHMuQZCRp411lPCy3f8HAp4JJ7J74PFJfi5NjXp9peI
	Ryus9hn6rdlRnFw+PdD7Rj7AhOFxeXKLxxpExLLzmdjzoWjz9XHQ66UNquuTn6H/
	1TrFa94LmcwyCA6MDaT9uHssmcMH1IUYYOQk4zU8ZLLmAOe/PpUS8l1UciAcNcer
	I0nMGjUHGfkbk4hxBgKikY2O2uXoRezFF1Iyxpd/3iAEnFAiSICxf0rlswxNkquT
	84rUO5n6Awh4naqesajSsDeG0EpfCHZYzIDCqG1IaIevEX8GGxNNnb/9VUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn876j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 18:08:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so374494785a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372536; x=1788977336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbORKfBAEcYHO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=;
        b=RNCu6jgH+4UO1PXoEx7CY0x7GJuI1MGo4H6kyYQ61CN0mNTNKG78cQWgxiN5jfvBDb
         dDaaOToNUEl8OCPcdrgYh7Gbwr+xdMY4NmLMfqQK/h13Perzyntpp021seBVnWOaVlOx
         goCh4uBgCANk5/gftnIR394VBXay2Zqqyf+IPJWmNs+DCkcJhKhCjy5feg3TqIvXDHxM
         1gEM6cNj72vRATcVyY3/SBIhfSxluYmggBxRmrlXqchOunlUHbMVZku7FTd2aumueNYv
         5Ghs4hSwSJ1bYAtbBjZw7V17Y3XAcogwuYbXS5eKpqlGHTFx+alYQ+vUyQsV/dOY0k22
         e0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372536; x=1788977336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbORKfBAEcYHO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=;
        b=eVGnQBNfpIN6Td2oO+XqJedzSFpvidKc4zwDaJr8bRuiufLBEkvAnM40t6UFYdwrZK
         FxVvRI7phhYspfrO+NxYIB0LCflqdUbJFQT+PLTPjSdPMu+M7TZSl/yfcNdtMm6d/5WJ
         DyoZTTBz8u82F6KmcBLh4IFMQYYPbo4zjRJPlHChtA79MeSLHhSUhwcIm6ZYJ9Dq41Cp
         HkF2II0nWSVrLB4zuPqfnB3JOOvnug0gBYr9JQl3p8ej94CuZGT0N35RGhZKLZBm0AJE
         ELpPj51fOIeXt1UYvE0TGsXB99ptgYuomB4SA0jPMWbIHQltrICO0wNQTx+agXY6qdFW
         1GQA==
X-Forwarded-Encrypted: i=1; AKwUvByngh3YvWij/Zi0S6bsOlGKCrcK7GZxn2jdFF3AxBws5ufq//XiokmTO9azcapmm/PsredhITU7+SBJvvkJhlRJ@lists.infradead.org
X-Gm-Message-State: AFuF++lbNFpgDd3i6LsC+cTBwl3wMTrvUN5fqCvvSgyK9LeW6PeoW6RC
	PeLd1ysl9dCoejBd6Ap3CqpU1yigvzMBNfNYgEErbh/pHj4+I7WR7UC74QR11/YBQEeX6QyyfbZ
	HfYHmZhOhp75KoU3Pr8ZDnD+0YamswDcQp5Yc6c40uhvN93l4ydicUHWS7V6dCfNUFz5qM4/C3A
	hNRQ==
X-Gm-Gg: AYBFou0RbVDsej8w+/vWHecGyw2etEpbcTLp19x4eeMquHTcl9/jrDYj5Kkn5O8sXGO
	X8lPtXcMtURMZgn5w+G288E/6bsPZIyXuePTsBiaxp/Wa1oPtQgE5f+JwYZcIV32HNWrA/yfnDh
	WjtRJesJSO56kRY9PSnMXo8jdH2mLapqbve6oDgaaeKQ2kywdU3hnZuwVNrbXGPyiswLO0YL0zW
	bCgGd48+++7Bf5JFNpdpJgGQseFG6VWK7QmsvpyDmfp7GFvIZQNhvRNkm2OH/TSrmE25M7ssUAU
	UaCuIKezPM4WRTceAb2qXDUzbo4vA9qezfqUrFT/z+eBNDmSSaikdpXi68MKEXuacHZ8R7EUkNH
	EFZSXiYo4ci7XJJ+Uesn9GsT1y3+/p2LMXjD2yZrbuAwJMKaZN2fYzMaI4yaFesR5BCK4wq7c2T
	KXEgp4UKfK+221X+g=
X-Received: by 2002:a05:620a:28c7:b0:932:ddff:1241 with SMTP id af79cd13be357-93960efc6d7mr820782785a.26.1788372536521;
        Wed, 02 Sep 2026 11:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:932:ddff:1241 with SMTP id af79cd13be357-93960efc6d7mr820774185a.26.1788372535857;
        Wed, 02 Sep 2026 11:08:55 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:54 -0700 (PDT)
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
Subject: [PATCH v5 3/3] firmware: arm_scmi: Always create devices for standard protocols
Date: Wed,  2 Sep 2026 20:08:44 +0200
Message-ID: <20260902180844.41230-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
References: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a986639 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=9VS019lR99HtUmLVNGAA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfXyO34TF8NM0kI
 uGZDlCJn8oSKLnwradRWyWT3Oz+Pe41Gm81wKDR/7bhc/7y3gNeQ+5GZft1cwHvtyyBoX4AJTim
 RbfF2WVtjJX0QoK3tRZ/R3+nll/6icM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfXzFl95gT4mjqg
 xCm3F3gZQAK+NZXE2LWx4kH6LGCvyo7RU9Kpn6MzXBxKiEngKLtj2Nnmu6MDIyuq97wtM3UKCPN
 pVDGgiV5YNfcO+gyLmfEsKFJhs9MITRnqCFq6ZRbNZMJBwCiY44C8PwiF7FZ4cpbSh+Nj1Aq8To
 WziQWprcUz9Y3Y5NXnCZbcSf8UU9HFRdY7Gm7cjR7qi+9Phqbq9sT+1VAvZS5GwZxUyKCXSw0al
 NR9OEUWanpDsnmMnzKrCpSpe7yPgbVHvE2+uVvUmf4nuqBF5sOkXKDdtaoO13ymcWaZfJIzRmZF
 Gwmq2A+0bYXs0xWaplI+O6U+xPdzz6U8ljZhSy31I7zEunJUUNDpQ+syM0UIR5ePdmuOj2ToWfQ
 cDHZuIS2yKK+oi04Yz0gDH2kl6VgFGu2YvQ+XrGaEzPZoReVSJQo3TrhLLhHQkMLAKWrqafM0wp
 n6wvRmjFQm6tQPmTwyg==
X-Proofpoint-GUID: fPjhsmX_A3ZU_yPBdCB8wAaSlQErZFMb
X-Proofpoint-ORIG-GUID: fPjhsmX_A3ZU_yPBdCB8wAaSlQErZFMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_110858_194384_EC10D9A3 
X-CRM114-Status: GOOD (  26.80  )
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
Changes in v5:
- This is a new patch in v5 replacing "Pre-register protocol, name tupples
  for standard protocol". Pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
---
 drivers/firmware/arm_scmi/bus.c | 48 +++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6f667e4ffeed..10d15da76f19 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -505,6 +505,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
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
@@ -534,11 +562,25 @@ struct scmi_device *scmi_device_create(struct device_node *np,
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
@@ -549,7 +591,9 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 
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


