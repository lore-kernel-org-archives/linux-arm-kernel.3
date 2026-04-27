Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA873FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMBhjJ4gM4j7t6ItG9Ak3kejPO8aRcxBWs0HcVt7qno=; b=ZeW1UHGI1KcuhzV5Yzs2MLycKu
	1zTj1pI+wuk1q1yxsDqWO8SJw/+OvctCWUzzs2siH0bxYKysZgzDoYNVMS9k0xn+vnOu9eotB77Cm
	OIfZCEY1MlNkJqGHg32K7x2MfWgLZDsATs0vzpTZdqQfVxeSNkaTbbAls3qNhb6fXKAz9Xyli9qiF
	dkNi5xYgw2qxgF6LM2oT4Z62VbFwFtU6xd3qKGNq9sRPnAOgyDamsUqpiw2ymiAgwEpM8ThuA/VRH
	191DtOjdl2QiHW6PlR6l2nkjKNMxBcf8gBBnUbXzGW5BFTrN6vRdlzeaWog07LyCN5hc7VzX3pmXb
	oQJLKsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJUU-0000000GibM-1O0O;
	Mon, 27 Apr 2026 10:47:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJUR-0000000GiZt-0DXb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:47:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kOnP3962048
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMBhjJ4gM4j7t6ItG9Ak3kejPO8aRcxBWs0HcVt7qno=; b=ObMX86bP460I3rov
	h/HnTRn/J888NwsUFC7X30KH9RWzLkpfQlIvbFDg8E0/S6OL8yJVGVlICY3E3WCQ
	ahs96rT9rWMOdKBOYYz2Mo/bVcjLveADkGe8M2EzCmR3AsXmh0968Q9jlJh9SCtM
	te7fq1Ld4VVx99aZ9IQZd6YBON67cHKCpb4ggttqcSslMkF6o2ltGNmmFGpPSqps
	2l1+70eXTloPdYwsaTJE9gTkd/ix4bzX41OtUIRUXtMl48aSa0TjLyAUL3gzX4Ew
	rKUH3eQhVr6zDzX6H4F5ANDPOd4WL/jMKgZ1ySQe9grYwcpug1wmXhuiz0H/xdlt
	+13mvQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k30pk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:46:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so215440771cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777286817; x=1777891617; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMBhjJ4gM4j7t6ItG9Ak3kejPO8aRcxBWs0HcVt7qno=;
        b=G2kC3eQoeEOUeiOuDrOU+FvaMCxKoKgxkn3huHvxXpouUGgQCgPHCuCcEPq6hNuf4h
         HdxZ7iC6ehvHOs8Qoy1CrMQrUwfq6WFhraQYMiCC5jjD3NS2TEIJQfZuiKk6Gry6MbEu
         GV19Gu36jh+Ny9FuX7N/tvNJIjMCNKeSVWeDbXkA7iGwpj6bUwaPTd6jBozbMfg5ZPtz
         W33hj+R5EWcppPEU89REsohYO2o9QqdTAQPTUhNlkIeecZ2NUFjk1qbNcvckCpTe+brh
         jKfn2V2XSQc5FFSWTixNxKF6og89MeFwiSH4WvSpdYSk2ywWgGAkmzZVknXXHaczEYQX
         Rc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286817; x=1777891617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yMBhjJ4gM4j7t6ItG9Ak3kejPO8aRcxBWs0HcVt7qno=;
        b=Jv667muhLZ3VziDWFAdCIiw1+Q5gi6q2Wki4O6i6CU3Tgc8XMefydt/sVEpO/HRZAu
         6B61H+uNz1t+7jZQft7MXkxYz0mbK6/V3WO7f8Y0YvA5VHLjwlycT3sVd4MeALZU71Eo
         33+AaRXTl9GlTGvsWJTxrvOxmkRiGzoPqUd2xy4LTDJioFh4JFUl7TboRV9RrI5onRmN
         3P6+FtqqPdPmaeVdh5eN8ZYkFPXpd5aGKi9sh/dJP38CETIMXKnP4GUtuHkaEsxyiKq0
         4Kc8Wif7J34xjfh7cUTsvXfZ9XuyPb9hiXpog6jcH5W8AcktiGvP0OBDi0yX6wncFNkd
         yA2g==
X-Forwarded-Encrypted: i=1; AFNElJ+QTJc/dpLpIzt8qwWtFg2vFoDyRCOD8TiR/6ZLYzc8MevoadEs5xjZUsIbMa/m4RwXaa0VreU+Kt5ND4cUC27S@lists.infradead.org
X-Gm-Message-State: AOJu0YxXcVnbEDTOE6mqcQyyaw4VOf8EMy8+4emQTwiVdfjBs+GC7X2F
	L/WDZbmLrcgaCXHvdDkqzBL9XDyZiW0dYlyrUJVhYP6svskaNRBmNKv2ENBhbePAeD4DRwOpXcL
	Dky99NCzagfmXqGl5Pyty1exXEr81KsOMasvd55in0ZhAdRKPoNOCQcu7m56Qd27oYi/3N5Eg9B
	V2aw==
X-Gm-Gg: AeBDiesXkIqCmWDqlnEj4oB9tbnwty7hvYelBfuIBIgHc+oVzGEVQqM/3+GGTxPki56
	4nsN8bH4RJPzsMeS8VzHSF0gnqNG9Ig3GctqeecYPLUIjcQ5GgrTuzoiTM6RPTBdFsKpn0IhfNW
	2ScDjxolggMkCfq0RmOBxi1B1Mci2y1Vo37QzdQzdEp5ckBpai6fG9a4YXrZx3BMd/5Bp+vYZVL
	q81ujmHQoi64YwmDUjN7sh1JNS6ReYJtH2SMvASv1pGutLpvB250FgWyl/d3RNbl6Drf9P8S0DF
	gW9WEGyjBDZzCAfn81ou+Yyvq2ODPVDWIwb3GXsDWwMSQZdqZ0k+hub9eC4zspmVK88ZZBd5q3F
	jh+fahuGHySKsiuDGxJmKM/0M49QjqkFBq3xCfDFB/bqoGxgCmCQqaUsa524OpA==
X-Received: by 2002:a05:622a:58c7:b0:50b:577c:e259 with SMTP id d75a77b69052e-50e36c1277emr560394131cf.35.1777286817579;
        Mon, 27 Apr 2026 03:46:57 -0700 (PDT)
X-Received: by 2002:a05:622a:58c7:b0:50b:577c:e259 with SMTP id d75a77b69052e-50e36c1277emr560393961cf.35.1777286817174;
        Mon, 27 Apr 2026 03:46:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm80353681f8f.13.2026.04.27.03.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:46:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:46:33 +0200
Subject: [PATCH v6 2/3] ARM: omap1: use platform_device_register_full() for
 GPIO devices on OMAP 16xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-nokia770-gpio-swnodes-v6-2-b693296c1985@oss.qualcomm.com>
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
In-Reply-To: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5830;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bzdvpv3oXCtAm3pD+12sDLx1Xj/eF5XT07wIxOiRgEU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7z6XnHxXLbQ5/CCsvyIBlDuIW5n7WWWzycWjr
 PSV19KUtheJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8+lwAKCRAFnS7L/zaE
 w4bKEACPiNJFn33zMYyRDA+LIFkjWo/O3e5YsekS5di2eUt0NBw3FxcR3usc1yz7G01/ZatGQEu
 2FOZSg1BRM8iSqTOE6uTWrlZVs7TC5jGMP3wYXr8KHMWxlaKga+eg0IJ9VUUcbfeWA6yrgzSuUe
 rEa5XgQi7Rf5QTpkthcejRuIOojoyIidI3FQMOnJh28Ct5i1tYdRr7fE886KoSwCb/Xc1LDD0O0
 SS3HNHyy42KAhSkTwDwQ8qhKSDvxgoRGTmqUf777NbXOvEUkT3mTduQtw843Z7btOJnfWuLBigE
 b3UXDdl4w7xShIYRq7b9Sv2AtTaOaPljLiWoksKb+qR9izqZyP5FFE9zn3jBu8lphIs3fUn1PuM
 H0S5KvamU5V0frfEoMpsh/0KOeSrPy3U3R8KPMNJDUudj2oknT34c6hk8lDOA1K/UybEAysFyWh
 CMj35cUgryxQMKejE2Fg02nvQBzI5m1fINDI8cq9WlyUua2W9j7601/izTeG899K2FnCT1z9eq/
 1sz3Sks0eJDxpkWHNGECwZqn1pkyZp4F1JVkScDXZtxvgY5hq+HgJxU/3YbFNw3voCCnOxg1a3s
 nouMp8PRNA2P91t7qnuSUG2MShXLZWvp2pJtQlsAf2jqmvneSXcpQMBKS/y+h96NEXsp3cYPLSC
 jSvinHE1dlM0cyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNCBTYWx0ZWRfX3zB+kwNOmLpV
 LaP23d9/06mgfOsylNuS9MwXr9wR2UovoGLo754yW89CcSZ2IA7uXhGWSfy0VBv2YhweqFxHdSq
 1NPRr2WNJN09I4xMzrvuMvPxYv8rwOiHzAdm+uEiP0pI7touRmLyWLPAlOuHM4TztSpRtqDtZTk
 jUcJf8aYlsnP/qFLwAwfLEsJmx/m14j7zseYgf5eWJ7C+qT6jrXQMts7gP/lydzWXq3KXjHk4DY
 Yf6MzJ074DspWt9+tSsmnxZjoQHUvpknMt6qBKXAb9WuJx2L9unI0o/d/4Tf8jW4mztsMBiddFR
 sM+tg/2bdwA1x5PPHNFiWp9qIs6sklExyf1c2xtgieYhi45iu5StosllRUHiWRR/A+pPmxIMKOI
 Rkgbb8/6Ph0tUZcX8D7DPvfOdwqc8wkTYAS/iaQcXlvHzHLo2w/1XHqVnxkZYqXlrhjCHCZ4/4X
 bZhYBKN56v7dgCwWH4Q==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef3ea2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Ng6QAm6ffPCIYYv3ADMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: fh3iYdXJ2xG-LIkNG7astHI_8J5hR5_w
X-Proofpoint-ORIG-GUID: fh3iYdXJ2xG-LIkNG7astHI_8J5hR5_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_034659_119028_A86FF37A 
X-CRM114-Status: GOOD (  21.00  )
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

Ahead of changes attaching GPIO controller's software nodes referenced
from the Nokia 770 board files to their target devices, switch the
method for registering the platform devices to the
platform_device_register_full() variant. This is done to leverage the
new swnode field of struct platform_device_info which automate the
software node's registration and assignment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/gpio16xx.c | 68 ++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index e8dbe173bd33fae72c7c884f930a530f78096839..2904ce38c001505d48d0996f7053369bbf683209 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -55,14 +55,13 @@ static struct omap_gpio_platform_data omap16xx_mpu_gpio_config = {
 	.regs                   = &omap16xx_mpuio_regs,
 };
 
-static struct platform_device omap16xx_mpu_gpio = {
+static const struct platform_device_info omap16xx_mpu_gpio = {
 	.name           = "omap_gpio",
 	.id             = 0,
-	.dev            = {
-		.platform_data = &omap16xx_mpu_gpio_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
-	.resource = omap16xx_mpu_gpio_resources,
+	.data           = &omap16xx_mpu_gpio_config,
+	.size_data      = sizeof(omap16xx_mpu_gpio_config),
+	.num_res        = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
+	.res            = omap16xx_mpu_gpio_resources,
 };
 
 /* gpio1 */
@@ -99,14 +98,13 @@ static struct omap_gpio_platform_data omap16xx_gpio1_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static struct platform_device omap16xx_gpio1 = {
+static const struct platform_device_info omap16xx_gpio1 = {
 	.name           = "omap_gpio",
 	.id             = 1,
-	.dev            = {
-		.platform_data = &omap16xx_gpio1_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio1_resources),
-	.resource = omap16xx_gpio1_resources,
+	.data           = &omap16xx_gpio1_config,
+	.size_data      = sizeof(omap16xx_gpio1_config),
+	.num_res        = ARRAY_SIZE(omap16xx_gpio1_resources),
+	.res            = omap16xx_gpio1_resources,
 };
 
 /* gpio2 */
@@ -127,14 +125,13 @@ static struct omap_gpio_platform_data omap16xx_gpio2_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static struct platform_device omap16xx_gpio2 = {
+static const struct platform_device_info omap16xx_gpio2 = {
 	.name           = "omap_gpio",
 	.id             = 2,
-	.dev            = {
-		.platform_data = &omap16xx_gpio2_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio2_resources),
-	.resource = omap16xx_gpio2_resources,
+	.data           = &omap16xx_gpio2_config,
+	.size_data      = sizeof(omap16xx_gpio2_config),
+	.num_res        = ARRAY_SIZE(omap16xx_gpio2_resources),
+	.res            = omap16xx_gpio2_resources,
 };
 
 /* gpio3 */
@@ -155,14 +152,13 @@ static struct omap_gpio_platform_data omap16xx_gpio3_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static struct platform_device omap16xx_gpio3 = {
+static const struct platform_device_info omap16xx_gpio3 = {
 	.name           = "omap_gpio",
 	.id             = 3,
-	.dev            = {
-		.platform_data = &omap16xx_gpio3_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio3_resources),
-	.resource = omap16xx_gpio3_resources,
+	.data           = &omap16xx_gpio3_config,
+	.size_data      = sizeof(omap16xx_gpio3_config),
+	.num_res        = ARRAY_SIZE(omap16xx_gpio3_resources),
+	.res            = omap16xx_gpio3_resources,
 };
 
 /* gpio4 */
@@ -183,17 +179,16 @@ static struct omap_gpio_platform_data omap16xx_gpio4_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static struct platform_device omap16xx_gpio4 = {
+static const struct platform_device_info omap16xx_gpio4 = {
 	.name           = "omap_gpio",
 	.id             = 4,
-	.dev            = {
-		.platform_data = &omap16xx_gpio4_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio4_resources),
-	.resource = omap16xx_gpio4_resources,
+	.data           = &omap16xx_gpio4_config,
+	.size_data      = sizeof(omap16xx_gpio4_config),
+	.num_res        = ARRAY_SIZE(omap16xx_gpio4_resources),
+	.res            = omap16xx_gpio4_resources,
 };
 
-static struct platform_device *omap16xx_gpio_dev[] __initdata = {
+static const struct platform_device_info *omap16xx_gpio_dev[] __initconst = {
 	&omap16xx_mpu_gpio,
 	&omap16xx_gpio1,
 	&omap16xx_gpio2,
@@ -210,8 +205,9 @@ static int __init omap16xx_gpio_init(void)
 {
 	int i;
 	void __iomem *base;
-	struct resource *res;
+	const struct resource *res;
 	struct platform_device *pdev;
+	const struct platform_device_info *pdevinfo;
 
 	if (!cpu_is_omap16xx())
 		return -EINVAL;
@@ -224,9 +220,9 @@ static int __init omap16xx_gpio_init(void)
 					ULPD_CAM_CLK_CTRL);
 
 	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
-		pdev = omap16xx_gpio_dev[i];
+		pdevinfo = omap16xx_gpio_dev[i];
 
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		res = &pdevinfo->res[0];
 		if (unlikely(!res)) {
 			dev_err(&pdev->dev, "Invalid mem resource.\n");
 			return -ENODEV;
@@ -234,14 +230,14 @@ static int __init omap16xx_gpio_init(void)
 
 		base = ioremap(res->start, resource_size(res));
 		if (unlikely(!base)) {
-			dev_err(&pdev->dev, "ioremap failed.\n");
+			pr_err("ioremap failed.\n");
 			return -ENOMEM;
 		}
 
 		__raw_writel(SYSCONFIG_WORD, base + OMAP1610_GPIO_SYSCONFIG);
 		iounmap(base);
 
-		platform_device_register(omap16xx_gpio_dev[i]);
+		platform_device_register_full(omap16xx_gpio_dev[i]);
 	}
 
 	return 0;

-- 
2.47.3


