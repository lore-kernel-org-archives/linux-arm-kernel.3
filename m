Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F643CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GxOv3DEpeFsG7lGsUZy6wVj3hN4O8w4tkjgP0Pww0/o=; b=i+2WGEMnu1gt17
	FH6o5BZcl4vstwFEOu+WFFMui2C7nOrVYpARqTRHkdMh9hZ8kdeUYSvQptxFE/GaoT3ftXHRFBjKu
	8PYJ2EiP1OvGXr4Zj1vbaWswPgNKsuvEik71touRKFp9j+gLY4gAUumg4CDcSYDG6ug1RzfVrMz94
	8ri0mGhKNTY1mCqKFhuW5F3lZankmuJjJ56kkCDs6OFPrIV3aqSVQLRTab8j+rWxv2OhFMy1dR4dR
	yVnB86gagOyLl13VsewDUxjrrgOmkQtqK5qtBxum9ZPIy3Euhuudf1kWjnIlmHIlf5TYP7T5NUV40
	kfRK34s3pbdtK9tU35uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChL-00000003FBA-0FtX;
	Wed, 13 May 2026 16:44:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNChC-00000003F8L-3MHu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:44:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAqku2524310
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GxOv3DEpeFsG7lGsUZy6wV
	j3hN4O8w4tkjgP0Pww0/o=; b=okBjSjsHw5BOpXgK5ziJusqTYibbI6kIQpYBmk
	giLoWevafMpybboM+vGfOD8xMjXNy+ZJYLOlAp/kUl+r5c7wWiR9KQdGYb79jycM
	lQNyyEXf7OmwbBPmAY1I+y2lvbbfywFHr1Ab7fVNKgfozyXdCbIIKiSVRydK6EG5
	kyGJsXRxg9Yu1MB4g/QOuLeykYBO6s+qq3CwguXGfoDFzRx3bp8kTSPei/ObVaQs
	WufDZauE0fbf9DThk9H+PV2/DPmFCYv0xumXye7sKq6P+EquzGF3rwkf45D7y87c
	G5VU4h/3Cz6JoKoVgS+WacJW5ycpsfgeF42ZX5KNZfV2JPwQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjg48p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:44:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2eebb099efbso11677260eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690668; x=1779295468; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxOv3DEpeFsG7lGsUZy6wVj3hN4O8w4tkjgP0Pww0/o=;
        b=VZbLk3bpxBQcHjV6NKHLV72TCXCvx0/eLm91vZHp6u8lto55zloz35UOS03A3zBGhC
         cMsrCI/boyax1RovKngUgQjv/AFmOCi2FuqYdcuvpyLHASmTMxBU0hasoOsVJOnWfXyt
         rctg4vKRxOUFukWiKJEnALGy/Z4nhscf/m2QdByzRisE7xMukVL2ojRQv80m9Ht1Tmxp
         bdeUmdM3ZT7U7sPuQZLrWLY/27eWO+q7ax2W7ru4jhB5ZEDPnoMJ3ecPpR6lxWsrC/8p
         RgrRsqjr8XFuNmLR377/Gkl6/h+m/N2nnhfes3OVhrXZvkXnAoO0VjaBfo0rcWEKxAmc
         2vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690668; x=1779295468;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxOv3DEpeFsG7lGsUZy6wVj3hN4O8w4tkjgP0Pww0/o=;
        b=Lc1xZf226F2DqZVvm+QclZGCfBZqelUG/7YOpBXMCQDNRnx8j4yPLv1H0RazYOWKmH
         Qnpq5WF2tt97us+j3OrmaxENVKpsKiEs52Hwa/PrXILQNBuibmxgdsx7K0OqtE2xdqH/
         H6aTOmyuxoFb8tP27iAyFxkczdn5Ilh47DuHnInaZIzbu3H2adKvPBpW6trARx+Nh+n1
         hrH/jxDyKUnpHhZMCK4ELFHxgcuN9E+r0IDqq4pCEZl+RLMjFgQDW3nOHmqhSHxQqiGk
         yJ27l0FW6sW0Gks50m2VmKQYeXqcsPBbyzjUo+Z1/WFr91geJvlES9dMSE+jADUzJx5d
         NGhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rfeaeP++8Du3uwyL5uvyy945ZYiLjj/A+E8xgej1KslDa5B1mBZdgvdtQzbgYusrILeI1w5QeL4MvbeJSYzQo@lists.infradead.org
X-Gm-Message-State: AOJu0YyoQwes1NPT4dvClYXIpKFkfv+H9iGwyEWjQTYwbnM5M9rKwH/o
	7EStzIubqJjy9rH905Xc20CRGUyMlpllLCmoiq1a16mAGEHvq5HUkmX103oRkdlKhukOeIF5l6z
	zCFgcqII9CCoTtawwjs6uUmabPPQeShIUK/h2TBfghYztrOiqGeB18e51LvPEmNSvV3q1cszGkv
	eKyCKGUgP1WA==
X-Gm-Gg: Acq92OHRpdscuydWXh9pY0B60S3rtk7cZS0jzGkcTZ7lgR78soPAd/Q5Tz1EzbpMd25
	EhdVv6nkpBFaBBZE9unGanJ3Kha5YNySDxFwzvWWMIP2G/MPl4zxV5HXSMbgoZDM16g04AH2cPd
	Z/P8g9bTqyI9aRLAaa/usxk+ZOUKjn5IUSMAYcbSzm1I5w2Did/olwpTVduPUmRRvVnRokx0qsA
	O2bg/Eds4SEzGhTg9c+SA/oQzbsjC2lgnoVQWjBYZ7Aj8Q9LapW1DipVHGT9aLA38cl7mOKx69G
	QwNwVBi6XeQ/ryLi2UlFOm1V6TpdGzAydv9kdBBPWE1oAOPVzzS3JpOra3sCdVBw5TIUMo1oT/7
	Z/aEmlcNtAUnhVHrfZl8EipACZaZY3QuhiFY7lsCK1stJYTfa3meXqheAC2TlC1SIw3lAbHc=
X-Received: by 2002:a05:7300:a504:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-30155e304dbmr1975320eec.28.1778690667516;
        Wed, 13 May 2026 09:44:27 -0700 (PDT)
X-Received: by 2002:a05:7300:a504:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-30155e304dbmr1975276eec.28.1778690666940;
        Wed, 13 May 2026 09:44:26 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:26 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Subject: [PATCH 0/5] scmi: Log client subsystem entity counts
Date: Wed, 13 May 2026 09:44:18 -0700
Message-Id: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGOqBGoC/x3MTQqAIBBA4avErBuwQvu5SrQoHWugNDQiCO+et
 PwW770QKTBFGIoXAt0c2buMqixAb7NbCdlkQy1qJaToMeqDUe9M7sIz+IVw9ytWbaNtJ42UqoH
 cnoEsP/93nFL6AFz84YxnAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690665; l=1343;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=owGm+6Ms1s9d1BVzLgyFp+un8WuAsYAf6l9Aw77jkfw=;
 b=W/Xp+gageC3TE/YpgFXFLe+pQ267y6ZmcjgpS00EQKpFmnevoEgeH6XSr277h756bxENsa6q3
 0CHZJDNRK41CRyitjcc/SiRtRARtb3XvVyWqFikd3hYiupPgngaWxsP
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: O3mt9diGEa0JcIXWqhI7B17NifEujDXD
X-Proofpoint-ORIG-GUID: O3mt9diGEa0JcIXWqhI7B17NifEujDXD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX85dIkJx7DVHB
 YWhD4Zp3x4kJfx1ifOUP6WM24caDbxyqxgXru/tTEll/p7UFdkHnoQuuduOAz3kKyPAf0ano99a
 jQ29wngLSdll95O4E4qUfRr91GowdNB12JwMmP8yOITd1CEs7XT5I6Hs6xhIuZsUQZNrdFti4N4
 UFoC7IoSsXvRo4RMg78922IQbpv9LBEjddH8j3Iy/klE9Rr0Wig80cd5BW5Dq3GM9yCF+KBRqqk
 iNiXz6UXr1KYw3UOrUsRC7L/PiilYktIwHJigOI+LAKTn9DOPWo0dfiVzolZemj4taeLCVw2LaP
 7kgmBzBSC4byTDzUiKsmdveRQs9q3yidoxenpfF8xACETY6cfdNoeE90GwPMjSUfRCsIHQdVaL7
 PUDbMZbrXl9Hmyx9Tforq98JrlJN72QNxaY5LgtZGqZcPDUFNnHZI9fkBPkIFkEpb9iqngGbhB3
 QtBRaa9t5LPuxXB94wg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04aa6c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0wi9YMwNQcJCIsSnl6QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094430_965933_7549F449 
X-CRM114-Status: GOOD (  11.95  )
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

SCMI client drivers do not consistently log the number of supported
entities discovered from firmware. This information is useful during
debugging because it shows which domains or resources were exposed by
firmware during probe.

Add logging of the number of supported entities to the SCMI cpufreq,
pinctrl, reset, hwmon, and powercap client drivers after a successful
probe. This aligns these drivers with the existing logging in the SCMI
power and performance domain drivers.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
Alex Tran (5):
      powercap: arm_scmi_powercap: Log number of powercap domains
      cpufreq: scmi-cpufreq: Log number of perf domains
      hwmon: scmi-hwmon: Log number of sensors
      reset: reset-scmi: Log number of reset domains
      pinctrl: pinctrl-scmi: Log number of pins, groups, functions

 drivers/cpufreq/scmi-cpufreq.c       |  5 ++++-
 drivers/hwmon/scmi-hwmon.c           |  1 +
 drivers/pinctrl/pinctrl-scmi.c       | 11 ++++++++++-
 drivers/powercap/arm_scmi_powercap.c |  1 +
 drivers/reset/reset-scmi.c           |  8 +++++++-
 5 files changed, 23 insertions(+), 3 deletions(-)
---
base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
change-id: 20260509-scmi-client-probe-log-173cf85d5563

Best regards,
-- 
Alex Tran <alex.tran@oss.qualcomm.com>


