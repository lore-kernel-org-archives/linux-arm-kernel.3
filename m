Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC16CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=; b=X0gafrvZNOgOBg9ksGIS+3ZDUv
	JwJ+2UZ8MpOlF4ilmZKrmyHeM1UhfBzN1OXLiF3mClnctaod0Izf3YPMSkT1py0s2SZFlpc/tZKXx
	GK2vLI4ae4/xVMv66zdwm9Oe6RCcnKMDu6o3VOmOmEr8u/RSbQV4Q0WGpLlGj2aUVE2TC94MP7RCK
	IQ0MxuzOD9FHCC+wix+tT3zOxRV4UHxVLHhomZM0WprYPPCAa37vwH398RbV/vwV9cwO1FFhCS5C5
	kjf7kdp9WJYv0PBgfyYD+ECf3Yy/R/o1mPIyPHZZVZAlHdgmsmUgxHd4RLNA4KBKDkkPhlkalo2Mz
	R5TwI3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF6o-00000001XaM-1UHX;
	Thu, 18 Jun 2026 15:56:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF6l-00000001XYi-3soY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:56:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IFGbud2192153
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 15:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=; b=HMEMYtpU19n4fkV1
	DQ37Sr1kDaOTWB/nWmvLonPglOnDbbEK8K+ZHjGmuf1oYnizmR4qzxhH8Um4/xTn
	GzAoy3tPV1X6X7wJjUDx0LRDgXSBr5IfcEf8QStMbGZM/2GQG+S+L1BOXvs5Ze65
	1P+yGX97azGWM6SHP4yR3BgzxcU3EDgXS3b6Q8hjSetrRP5vAmSpWJ3eyRKo0Rkv
	duA+cpOdN4Dqo0oKjtjK/rq2UVuGZHe+LGmfnyg2k4ieWpWxs1ss00sODjm+Sijf
	pHJQW2SiUinz1bpcstciCx3dnKPgWRP9mT453bdZVIreLV0nqJt76xOQ+fe/QjJ9
	AGL4yA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7mdn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 15:56:46 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1382674ba2eso1919192c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781798206; x=1782403006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=;
        b=flibmmsCkgW0RqNRFct/lOPe/wnR/GS7PrtBxsM6gXRaVl+IoqBBdy/RkxEVKtKclE
         JRha+cowbSxLVuBCScZJ7HpuaJnlhjsNIIwiWKp6HLGM5RzOq4fNOPxbz2aUAcRNzunC
         +en2RWDtvnbVLUMO6wmtgrQEsldj5+MeCYoqnZmM1toTcWA3J1J62pWiS7qaKQmPTTVM
         KdgVdXI/cCDUqRXXurVwUPPFXR9fYzhNCRYyJ3OXdMbNcCNIcrLyq2BjEfnGyqjEB5JZ
         zI7A0MuDwUpS7ruFfBIEGewDXSntnh6IBQ6oDtGdXfhob1v8SlpLs84Ldums5v2C41+v
         KhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798206; x=1782403006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dDt5YgHrQVTFxBlDvUvkUD1S0U2BleXm5ZDJEm+gpk=;
        b=SsOK963bWjskaQZzlw+mziNWLYyk0ougxSU7QpvVF8VMA9qjvVGQ+mSOuz7X8g4UHL
         6Cyoy2Q6OAxS4udEAhKR/7j7GrapMIuIG27Fx4Q/eqHnnHFSs1T0ccdfxCNOwsX8JZN1
         4DQ1H83LT3MYere+tNa0Tw6ZLJhC5/HFFnDxGDuCLOYZtAKNoT6DEDFzdtIPOiLHAhOI
         uF42zfSu2nWnluoeXONiTmT71YbcDTmuw2o/v7eA7Y4STxik9/Qn8MiFcX68QWR3uW0Y
         2LWaUOHrn7MtJ0nk+wl8QSGckipobWsF2ietLeNr+odZH51krHpmGHO9odnRqyal5JkY
         bV3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+o7142hHmxcmGVb6SDKMMZRrToG3Xu8eOQ7/wdrpgKhJHITOwO+iMzB2UyEvlrEEp1P5iMIzu28MMQKsBhESSC@lists.infradead.org
X-Gm-Message-State: AOJu0YyjcGVhNqsj1zMEEduLWTrBp1j0TCd8XVDZPPKp46WhFkAom46G
	/2VURRrg3BQo/ks2h38KtMrmD/jyZpHR5/Jjg7Dji2aMoBBxPiqs9b8wT2Djf8iEbZ5pMRoPOXD
	nGupBLEL78ly/M2xdzDHcIxlM71G+WaXAmRWh/hnwvWL1DCn8ct+PEF4gCi+PRP2oJ+1aKQhGKz
	pUug==
X-Gm-Gg: AfdE7cm38brXgYBiZ4CK+sUp8oMJHJJDFO/i547jQ6q/6Q9B3u8ibscGa9B8G7AGeQz
	nhRLoC02jYyYzjIOlGnOmHRw2vvbxrs+iDEzFJ1WiLi0Tac61bcrhY1rBxae0jaeLxVYsxaVcy6
	9vUyaQ1O9mmHbJZVstAADRtOO+6hiHkL2QuECDFHpRwmyV5z+oemZpv9cRp9KGlLjcSuYtl8a0r
	OlDUxYzdTCsHejh9aiAxx83ICWRzyFv75PD3MzfKz5pFJdLvhhUK7ujPv+6mGEswqqkVR5uWFQg
	MBQzree8iOvlHbbohwAOzKQFVayfj+0RLN8uErnqBbXlixmQrTX8qjLPHdTQqI/Uq9EPyXBJG+W
	fJTn5351r0IiYt035tpUcU3lu7xwrG7cMLeTFZEOJaxS9jfi7Mf4p
X-Received: by 2002:a05:7022:e0a:b0:137:8bc2:f501 with SMTP id a92af1059eb24-139a20b8f2fmr156782c88.7.1781798205861;
        Thu, 18 Jun 2026 08:56:45 -0700 (PDT)
X-Received: by 2002:a05:7022:e0a:b0:137:8bc2:f501 with SMTP id a92af1059eb24-139a20b8f2fmr156745c88.7.1781798205339;
        Thu, 18 Jun 2026 08:56:45 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9110d3sm19671267c88.5.2026.06.18.08.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:44 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:56:35 +0000
Subject: [PATCH v2 2/2] firmware: arm_scmi: request modules for discovered
 protocols
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-scmi-modalias-v2-2-8c7547c1be21@oss.qualcomm.com>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
In-Reply-To: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781798198; l=3118;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=ISo22YJnXNXqaVnPUdI2iwKWaaF1NM0ILyuyDS+MJCk=;
 b=5f2jzig78+7i8GOi9XkZud3yAV6oYQt+ilyEeUyLhW2skjQn50HhCx+V7eK5vQ/uA0ZWG+L0c
 UxiYpJMAspCAqqob00Y6y3CAenu9vXBzFSvBJJIOzsu/L/kkrEbLYzL
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX4Id6BRaJAbMb
 6t2/416V649TxR/KESAjoCS9yG/y2ycYf+gS9a9zC0C243APRsIZXZpX8oDowzycPpNOueoC579
 XaVg+sztB14ifcQZEEWPcrSeLzHkSB2GqmEfxIeFdmJF1mZGhnRAFZsPrQlFbWsibOM+yuvr+dT
 /0QlUqVgXGyZcysoLacfVTcr263ZdXGvOa8kLNWcjWj/LAqrElXRtpcvZf9ih78gVzI5tOKVbJs
 pSAAir8kVpF8bBVg7fdto4BlUs9YQW1hJwKvcCh8xEYbGyxVhvTHmyLCe0YJLbMh755TnrKt62y
 +N1pyfOl9SmR6jrDi6FggFHqwd3HbE9KpO6A5Uie8GWeoEKcNU8xfy4CAl9qtiHX1qyx1d+AysE
 y8K3G/fF0vOUF9U/isEtA2/Wv+yoDHmhN5slo58AS0LpKFZS30hTj4rFCEwPJQmmI4t3yQHdF3T
 kMzTU2Wle+eqFh63V6Q==
X-Proofpoint-GUID: mdTDEFtNdu7YpkdgiVWDHK1SK1ZcRVj_
X-Proofpoint-ORIG-GUID: mdTDEFtNdu7YpkdgiVWDHK1SK1ZcRVj_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE0NyBTYWx0ZWRfX3MBl7PiVWhoz
 58zA2lgdOpNrXKfchESRnnA4HjhDcCs1MvT/1wQxwAtSy/V9GsjRDVB8ucPiBK9/CVMfRXIafJN
 4qCnbhcK6MogmkVZLqLZ2jwoZ9yU/sU=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a34153e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SFLdN7fYUvWWIfk3OzkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_085648_087587_CA3D8B62 
X-CRM114-Status: GOOD (  18.89  )
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

SCMI client devices are created from SCMI driver id tables. If such a
driver is modular, the core does not know the driver's client name until
the module has already loaded, so normal device uevent based autoloading
cannot break the dependency cycle.

Emit a protocol-level alias for each SCMI device id table entry and
request that alias when the SCMI core discovers an implemented protocol.
This loads modules that have registered interest in the protocol; their
normal SCMI driver registration then requests the concrete client device
and the SCMI bus matches it by protocol and name.

This allows e.g. ARM_SCMI_CPUFREQ=m to autoload on systems that expose
only the SCMI Performance protocol node, where the cpufreq client name
is Linux-internal and not available from firmware before loading the
module.

Assisted-by: Codex:GPT-5.5
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 2 ++
 include/linux/mod_devicetable.h    | 1 +
 scripts/mod/file2alias.c           | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 0fd6a947499e..7d33fab94e28 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -48,6 +48,7 @@
 #include <trace/events/scmi.h>
 
 #define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
+#define SCMI_MODULE_ALIAS_FMT		SCMI_PROTOCOL_MODULE_PREFIX "0x%02x"
 
 static DEFINE_IDA(scmi_id);
 
@@ -3363,6 +3364,7 @@ static int scmi_probe(struct platform_device *pdev)
 		}
 
 		of_node_get(child);
+		request_module_nowait(SCMI_MODULE_ALIAS_FMT, prot_id);
 		scmi_create_protocol_devices(child, info, prot_id, NULL);
 	}
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 769382f2eadd..2cc7e78e35a3 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -477,6 +477,7 @@ struct rpmsg_device_id {
 
 #define SCMI_NAME_SIZE		32
 #define SCMI_MODULE_PREFIX	"scmi:"
+#define SCMI_PROTOCOL_MODULE_PREFIX	"scmi-protocol-"
 
 struct scmi_device_id {
 	__u8 protocol_id;
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index a5283f4c8e6f..40a37b6bf1ad 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,7 +852,7 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
-/* Looks like: scmi:NN:S */
+/* Looks like: scmi:NN:S and scmi-protocol-0xNN */
 static void do_scmi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, scmi_device_id, protocol_id);
@@ -860,6 +860,8 @@ static void do_scmi_entry(struct module *mod, void *symval)
 
 	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
 			    protocol_id, *name);
+	module_alias_printf(mod, false, SCMI_PROTOCOL_MODULE_PREFIX "0x%02x",
+			    protocol_id);
 }
 
 /* Looks like: i2c:S */

-- 
2.53.0


