Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AB4CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/b/CPdx/UP9zJB8T5L7o6k+fxq4JskuiICzDFnr9ggs=; b=0R09yAOgj6vS1a3O2WHizAUDyM
	mxNWVgwEhAKyVNWGvsE8E1vwuev+hSmAL/usf57uB9w/O6yT/iLIGThFeFaP4xD4yPJtSwEovNw8Q
	9OHq3blbgASjW99992A8c3qiXoY5M5hbFgo6uvn3Iv9Em7Kf2HVL4fjG5JKtbKIwaCaXEba20ue/z
	rto9A6xp9N/09+uQM8vNs3BfM3la/6O3WuH8ZDGPKEmZ9kbay6iUlMELlXq/kHdWm1bxYM2+EfBAY
	4dvqI/Bo4IFNFG5WEPVKidRv8grStBBqiUVw2Q5lJJG6snS86u2DgdENf5fLKjVE7F05enyNo+pf5
	VPIcV8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILro-00000004syF-3WZt;
	Thu, 30 Apr 2026 07:31:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILrd-00000004stH-33pZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:31:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNuPPO3636716
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/b/CPdx/UP9zJB8T5L7o6k+fxq4JskuiICzDFnr9ggs=; b=e8ZEcTAZndD7gvDd
	xk7RR6Poc+Z3TLgW4S1as3l4G182g+5Y+a3wT7kEvQnteuRD6Lt3D4dLtI3Yl689
	Wmd48IfyZq28fVE7l3CO9vC1azul95ORfkpoEDWmTigo3EZRBrDmV5+dj3NmJ/xZ
	+Hbk61dmTcH4LE+m6IU25Cr6PekHMJpOqrLi4axzUhLUmfLyYhdsnoyeYBhGl9O+
	bjq9/V1c4zJhCBmbQIvjmAVmAiqoE0D6wAa6LaajksvVufwg5UCq3sCsmXeR1056
	M4FbAgvnZev88GbC2MV04CcYUtTyh7gznGtH5869RkHah4HnddTrI2YIOq8xsbkk
	x36O1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q1cvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:31:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso14386921cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534272; x=1778139072; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/b/CPdx/UP9zJB8T5L7o6k+fxq4JskuiICzDFnr9ggs=;
        b=IWR/fvuKzGRlDOyBtbqM9ssca9Y9C8qiVyOxkDCIBIUu5muENasLYzchTMCAoI/rdw
         YFxE8wSuByOZtxOREZ5RUQqsnqAYO++HXT7+DG37rY4mOYA/0O6DfqOp1RGZ1kJNQKaN
         OkIls1ByZ5snVEKkPXE39yfKkxnqAACbJmGaxLsh59XXAX004jNxGTDXk7oITweaX0LI
         GhK6e9bqQ6TdcShWJxRsA3AwpILQcsev3rO//K9v6ELjdDd9f/vPPlLOUhaHDe0ymiYQ
         iSrLp1wcRfvnrKO2ueWovNRlG5TRnRA4DC0DsXxXyunTOUO6SRiKgVuiiROz2cqGfzxq
         X8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534272; x=1778139072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/b/CPdx/UP9zJB8T5L7o6k+fxq4JskuiICzDFnr9ggs=;
        b=tFeLrkEzfvfxeLQXOvl4ICstQbT3us0wAfL0xRdZAvN/06Bx9kW2ydDGJl8Rpa1j0K
         PXxVK88fR0b2BndOu1INw+1ok64y5Gigr98rJnXV8S2cAypoTTtcYP+BNw15GuxNqom7
         4Vsrx1mzO+9hTvngEncamZTwYGdEAvMaH0xs46EnJlPCTEQ7m+dFuSj4eYPD7JIKGlpC
         dCBVT83KwtrGtaWprxuOchjQc7j010PYTAhDJ1pZCfUyigHVDMOJOSSRw1SiK1pOsgv+
         Vwqil1gMueioeSBsHpAlnW6ip0tqStz5FWoAN23PBdovSvo9Cpdeee0LpUUm1xAh3AH5
         njNA==
X-Forwarded-Encrypted: i=1; AFNElJ9Y3Ok/5pybR1No3qCiHoj18J4txf68VDvsixAi66zKELT7WBcf5elJyIKodnfruPcQVReXvH+20+QFT3tjoy6O@lists.infradead.org
X-Gm-Message-State: AOJu0YwCSU3UdwSoVZkhO7gJdN+XgHH7MNFvmhBZkexSYjMvAQtmhGCd
	oovmlhEppdaMEeIE6kdnf6X0Z0a8Bah+ZpdrngKXuuvchYPPl/ASxaQS/H5ZH7+Hq67YIQxvgAk
	b6KwVHKnbBxn62xeYgfLh4eZDsnn6b4g+zn+xp71FJmisI5sckJ95n8FpIXcMKTNlRulYYvJ4DK
	MfMMGmFCIh5Q==
X-Gm-Gg: AeBDiesI0AQMxykmCXUENnmtRdYCBOxDvmH4T/Xrvn+vf8a6Ccctt34HMUzvVXfVJYJ
	YqAHhAztYYPAmW05CA548F2hQ/vNvsktZXjtpBZpMGlm7O8jc+R9KI+QeukWn2CJD0zRxNwp32L
	yFRxWUurZb0hYcCvDlMJf3OwNrkK+HSO+zM/+GdHgfjRjGr9Yd2g2NvvzU0p+ycFuBQlxbvVpAp
	zf6Prbw5SonSS3LEeV/oYYp0kmFL7Q2iwwxh7rA8l2Bw263SMRjI0Qq258d9KOE5RmhHqni4YQO
	ncezWZxYdFaARI0VkXA6OQ5p8f+QnXDnmbrWu8b4FeoaJdezYLM8zglmICraCjLVUjEB9aqZC2A
	glBeznSwKNB7Xq+4m/KLr0dWNa4RvgLwkt8h3wVXNneiUVCGp6vuyMZNFmI74
X-Received: by 2002:ac8:588f:0:b0:50f:c26d:f309 with SMTP id d75a77b69052e-5102aac21fbmr23257131cf.9.1777534271625;
        Thu, 30 Apr 2026 00:31:11 -0700 (PDT)
X-Received: by 2002:ac8:588f:0:b0:50f:c26d:f309 with SMTP id d75a77b69052e-5102aac21fbmr23256831cf.9.1777534271174;
        Thu, 30 Apr 2026 00:31:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed69fasm59515035e9.3.2026.04.30.00.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:30:56 +0200
Subject: [PATCH v7 2/3] ARM: omap1: use platform_device_register_full() for
 GPIO devices on OMAP 16xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nokia770-gpio-swnodes-v7-2-c88f74c90dd6@oss.qualcomm.com>
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
In-Reply-To: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5930;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PHpDrTZXHmNwZUSRWJMw+i4wybcuMgJ3uN1C9wMAxi4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wU4XukNO7TP55pg4f/67FONGRM2nuEafp/wT
 kRV24+CwxuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMFOAAKCRAFnS7L/zaE
 w3vwEACMegZhfLDIQ41bJnAVGxvOM+tx9kxXuv0GdzvafYaKXSUamw6nOax3IPck2um/WXiok80
 oijfD99qGVMuGCgXiAVeJB3cnUwFGmNSYZNgRdu8cDD0Tbfn5wu6qxzZEPzBWuQ3q3Beet58xiC
 zUZwCZ2hfdTKAQINwI0kxqXrwNX3fYejHuH2EGJGrdM9fC+SRJSWFS1wMg+ExyHbVrceqlUOYKf
 b0q6f9feaBt8wptE6WJJXcNUyanIGiQFLN5ityIWCB9RAzcd6tBLBOzo2FfpGaKaleIRwjjEKkJ
 xUy252eNIl2x6oZbdoTfZTYA1nL85UsSwYRgRDMCEfiwra4dEv1KSXyix6YmaYCeeIObTUSbaab
 0NYI0YxJmUceuT/wXMyRh6kS0bO9gGXOpdWGH/PFq0TloUloHJuA6ZAQYRhTVnwibXdvtWD8cwx
 ks0jKWqs/aO739f/hzvZiMHd2zp4sQrLJSJ7P2Y329iI6lFCfsLzBMNI8vAPm5kIOn/4rNAc4ay
 GOfHfl2szvcTi94YtgvkrercKXtfuXDREpvuRas1ivYiUcDFH+NyrLOcMiTv9rGIa1ZZ5ouQOFF
 8jME7Cd0uZceegeS+xby6ZOagF1EIr08e0lJlyA6SQz/bM1Oqj5uVMoJwau+4ZlBXBBF9WRbkLN
 EdqOak95M9yCBpw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kKJKzB9xrnAFAvk6hqWmAf5R-inD2d0I
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f30540 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=f8xzO-aaW-4QTlJhfLUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX5RUcNN6Cnhpu
 M0XbW7rTmkhfqBMs+LciKXCl+NU5dNCXyqZtlMlAp04rCdXa7nTwdryL9l26spZFQ9kLRrLfR1j
 DZ78fPWL9tFrkk4bw/IKUT/B2q7LrMsoS0dNI9TbtOf7G175Th+/ZIz0P1qCXEwQFDVgh59q7rr
 GPJ73WKPXm1XtSw77HZWWCPD5KlN8bkugJ+O/3L2UScVqimfd4YKXAeLpizfMlvI55qp5BGC/bQ
 ADkEaS8+9CjUp3ScFdAUDRs5HU3oIEJHWQQ8IDG82OgbzS96zdmb6iASf/sZ8IGqoPvYaF2DQ7u
 s9pyKYcMJd6BRfNl9rpTI73EllUot4bR5894/2w98VLMCe/x/lOzWzZ/NFOLgwvsPuQs7NLQKTd
 eAC1NBmDT9QillqVP5Zg4DQJAbNhND2TuSMqhCWpPLtkCnIcFEAJgVeY4HLfXy7ntSBcvDmN7CY
 0XOPLcNkao4mLBoTTMw==
X-Proofpoint-ORIG-GUID: kKJKzB9xrnAFAvk6hqWmAf5R-inD2d0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_003113_894055_45268E9A 
X-CRM114-Status: GOOD (  21.59  )
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

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/gpio16xx.c | 71 ++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 38 deletions(-)

diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index e8dbe173bd33fae72c7c884f930a530f78096839..9cca29f860544ddbec3734cec9b3246ce468543c 100644
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
@@ -210,8 +205,8 @@ static int __init omap16xx_gpio_init(void)
 {
 	int i;
 	void __iomem *base;
-	struct resource *res;
-	struct platform_device *pdev;
+	const struct resource *res;
+	const struct platform_device_info *pdevinfo;
 
 	if (!cpu_is_omap16xx())
 		return -EINVAL;
@@ -224,24 +219,24 @@ static int __init omap16xx_gpio_init(void)
 					ULPD_CAM_CLK_CTRL);
 
 	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
-		pdev = omap16xx_gpio_dev[i];
+		pdevinfo = omap16xx_gpio_dev[i];
 
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		res = &pdevinfo->res[0];
 		if (unlikely(!res)) {
-			dev_err(&pdev->dev, "Invalid mem resource.\n");
+			pr_err("%s.%d: Invalid mem resource.\n", pdevinfo->name, pdevinfo->id);
 			return -ENODEV;
 		}
 
 		base = ioremap(res->start, resource_size(res));
 		if (unlikely(!base)) {
-			dev_err(&pdev->dev, "ioremap failed.\n");
+			pr_err("%s.%d: ioremap failed.\n", pdevinfo->name, pdevinfo->id);
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


