Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D38F30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zGlsuieF8HfJaz+k7Z2A0mMLjNmMLEqk6t8sei415o=; b=kxDXWzBm9Qq36Lsxt0epmOI7Xd
	sr/22lm+gpShz2UFg2kGmeASxzlH6Na3RmSylBXVHqsF5fPSR9cxGUJRwwnMvAvn0/tolniwscJdl
	LvlrtiS1EgcTxN0r0iVW7zs150izV4mJqhRb9YWoTAjEnl+gJE8+kOeRg9tNyZZg/4enltSo50tOP
	OdII6+Ht9ULhQbTC6SClNFAMApgkVeAqUj9Nk1AJ8rfDFb+ToOtagqWSF1JljoBo18PeVDX/sCtfU
	DYEtXTXOVQRw1uFRmU4z+jgjoqcWyPuqf4gmLDs5HFtsr8viw7O3qAsBWNOczgFWSq0amcMHQmsF8
	ypriKgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5N7-00000001SXH-0EB0;
	Thu, 05 Mar 2026 09:51:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5N4-00000001SVC-1GUM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:51:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253AAB9865414
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/zGlsuieF8HfJaz+k7Z2A0mMLjNmMLEqk6t8sei415o=; b=OoELvcRWdM9CeGze
	LeL6UFp4Y0ufgp61OQdtuC6wrU+XbgaORw2FKsn48hTjpCcuSeMQP/wHbSPHEh6q
	evvYJwHEJqTao+b1olGryJGGHdo3W2wzVdJyQVW7Qz3QAaZprwlvLCNZOEa9Yd7P
	plgXKdmYo8qcKHkO7dU81yHV692zR5L2HXSVcp01jdNa1Wpm5tIsYGSF5Mpr6oUb
	3hGhr/0eUHWWmt18eQX+nNhOcZ0vqH+W0eSBIwtYUoyvNd7dniyPvlHBc+HEi/bU
	wLKYn4BykMuFsaVHYy26prMQpNa/KBidEjQiHc3skLX5LR07ZQmAPefNjsIM6YkR
	8PXJAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk1861-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:51:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso987134185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704313; x=1773309113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zGlsuieF8HfJaz+k7Z2A0mMLjNmMLEqk6t8sei415o=;
        b=GO6yDj/WwqyLRqtyl9/aWPlfK4lrkIK6mp1iHpdrKti/Mm9hsOopCql8590BiVBTtT
         nW0BjAh5A3bNWzUjaDVgZjDukq6Tq/sk2eX8w8uoMTly2FbAg0mGwO/6Ur9Yfb1hOOpt
         EIOhzq/FOpa6RXxK0JzE+JxpIVXJbSbSRhCA6vwuhcKDM5ydhZUGZYYhR2aVjLVuHyuu
         d1dI32h6xsVCgnhpjVhs8dKPM7k5ujV9/IvTE6c5PITOaLUonaEzRl7uazmQjib6ACGp
         ktDE7FFST1l0hcxSAQ6tOWEpJ49i6EcdpjNBo7Dg2L8JAJo7fhtRj0hOc+uIQx8nCKpa
         KKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704313; x=1773309113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/zGlsuieF8HfJaz+k7Z2A0mMLjNmMLEqk6t8sei415o=;
        b=SqLz8aj4NW9IwhfHPRYj8KCpFi44FPixjAsHQilxPvkqXEFJxq8osPSP6Yl7GzZMDN
         VT9KUmtjr73D3qhMLw+WL8PT+R8vbt1yq3MRiSE9Moa1A6KqiJJFLUQdhDhtIS+vXgCE
         hSKRqqhFFl+B2qeTvBAqdEC3wOD5uVHj47+iOz3h+lOqgfZ1m030toz3NndsuEJ7LvhJ
         SVS8KFqpjXF32ajUtLTyCdhDzC9l6ogsDpH7RSLEoAj7yNpsspfAWqXXwRpiASaKGcOG
         sPk0FBGUCV8MGnTjLQKqRsWC4qe42L0hXj6AimtG2nO49sPJxizAvvdqR2KkBkaEbqwe
         cqbg==
X-Forwarded-Encrypted: i=1; AJvYcCUbxxqTgJgGB938i5fyXPz3c21xiZkojR//IKfY9BPGgotdjVLMC+zngHAm5FdoG6m/XsbXL1FnP0nR1XaXWT52@lists.infradead.org
X-Gm-Message-State: AOJu0YxxEvf/6q0BBQ0fk0wR5tHqp2+vm1zA60wtVWFokTRMr7QRM6vk
	U08pHE6tOL+QYYIhC5W25QgNv1+rIBonWBeF2/4X/pj7/MgPXY2wBzdrBD7PIqDatzxuByTRNzt
	i29n6tuY0f42qoD57l2VponeOyuVOnf4eJEWK+/pMCBv0XQ8lid4wl1dibdpTfccax/8cHxcHU1
	xlIw==
X-Gm-Gg: ATEYQzxpqgE0wh+o4448gxv3BKk/O8cRZsFO1nnPVP6viOQBZMLoSZ/8PCNiH0xzM0U
	CBjUPJVnmDZSU0MmqJXhKua0pQicMOHvCePiBMx5bP1yIx5NY1rKUcahchJv3Dp/sTr6wz0RQgb
	PZJDj8Shwu6nRh5eKrFC9TruDc4+Zix5BlJApJWnCznr1zfU3wL1hnWRnlhFhCXzJ6sIxu+TDcE
	FT9fPSsNGjPlHzEpTuD//FSKWahe6GzYpZnzDZE0oviucerV7c6sQ8TL4mu6VtRLwkrnv+1UlPs
	gxbp5CRy/62Jk8Mz3hsOPWsTkbvItpES4TEO4cmHfcqLgRGJYKWJkrswbBueUpLlPui16w5sV7G
	cah4cUd8J5hT9+MP+rikKQU/nFxx2MhP8ZI3miWqEu7po47A3/PxI
X-Received: by 2002:a05:620a:46a4:b0:8c6:e0c5:7bc0 with SMTP id af79cd13be357-8cd5af2009emr605344085a.36.1772704312605;
        Thu, 05 Mar 2026 01:51:52 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8c6:e0c5:7bc0 with SMTP id af79cd13be357-8cd5af2009emr605341085a.36.1772704311967;
        Thu, 05 Mar 2026 01:51:51 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:51:28 +0100
Subject: [PATCH 3/6] gpio: sim: use fwnode-based GPIO hogs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpio-hog-fwnode-v1-3-97d7df6bbd17@oss.qualcomm.com>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6143;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w+u8gA5XSfpUL1fVDzCB/568FB2uADEJ2aLQiT1wF00=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIqF5bDfNvDEyB2c6UAu36TpqFzWTqhJE5A/
 24jyOm5XamJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSKgAKCRAFnS7L/zaE
 w3TKD/0W/9hVvY0nJXtP8TC53TGxU7WXAisF7NfDZBbc9ZJOaGumieq+KfFlYiRZmYoNZFkYZr6
 gMB0aQ9d5FehTrSRGPDYvjzEyRVMWmo+/Q2+EZuFdkLcXluphVeBSE9JcM3pQkqGCHTRAM0R/tW
 3RhxSL/3p5enWc0rXbZtXmCUNUM6pR1FBrsG1d0O7k41AtUP8+nJkChJ8FrrkOIUWLAV1AA3kyt
 i3nq0Lg7+RhiupyQxWhd0rfXriL1N/Cqwr/D50QL56KmgHGQJ6HWi7CkexCRbAvrltnJu5nwojC
 mou7BtX7+/g19dnURgezf11ZKl8mnz7eVZ5jbh5NBC9AXD7bakONARjPLT/3ZBBA/M837hMAZ/9
 Y4hpIondm9bYbLKwTnzozGO/LCJfTGnOkfhafuYv14U/pELEoKAGstLsaHsP/eIq5yv1AtTz3ir
 fdvLWO7feEZxq3LGVEgFXphSbRdcK/MB9eUGl53+DO90wHLQ9T4HfQOUJwP3LEetlIF+NDr2Cfn
 XXYsjl8sMOJ9cr2j5gQ6J6RlmQ4HPE3CU3pp+kGKXJ4NUVVV7Ua42V1RymFwf0aHHJyMcoIdQEJ
 iqNElW0h8xTrsHdBPNYnktMHweDqoN6OTiFOdJxaguiRBw2MRmbE1NGi6vukbgqTTGqgUYNzZ15
 k7e9vRTrCik7OSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: SY3JuXVDkIJYU4zpqIpG6Dkck8T4Ddgj
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a95239 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=EViWBFm1GAVLN6HfglMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SY3JuXVDkIJYU4zpqIpG6Dkck8T4Ddgj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX/QyVGuvlUe/H
 jfERDAW9yR1krVU1e6rI6QrZRtq9yelVs4I52Va2Z2ZN1sLrBt2Evv2AfaDyOIm+lZ5RpcO5jDS
 W6/8Ea/V31X9kdaWECYIqiPlOiH09uAdblc2P+7HWzuzMqiiW2qiWJ7SIjqLZRnJBI78TTwmSU8
 wgT/cqqkXQCVlJu2GVnMgXqdrGrNj8flQP0ryblXeIYgq2pHhPc+t/S8iMdc/j8TC2fSIRRKsco
 A85HB3CLS7OUoJvy6xf6mJoh8kZPHXI5SXUV5ca5Ha2n5CjufFd7VMaMTAO3uyMpQISvHUvzCew
 azH5v7+JltedrzWlsWsRjy35evwScjTP1odbEa7uC3/WFYqINz0SgRtAA2W6AaNefk1mKbuJMgL
 IBNRF+D58e1tY9mPs0cELWZb5ksCWu5aMd1NDDozMvmxxb0h5V7B3J0y3muSZe/IZn2fleOvx6a
 sFAbNO4ZIppnqY1bP4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_015154_473983_EE32B048 
X-CRM114-Status: GOOD (  24.44  )
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

Convert gpio-sim to using software nodes for setting up simulated hogs
instead of legacy machine hogs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-sim.c | 162 +++++++++++++++++-------------------------------
 1 file changed, 56 insertions(+), 106 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 13b87c8e6d0caf62ce311dad409a9b4d3f091caa..51bcbdd91b4b027b7a340971a11cce5280ca1295 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -40,6 +40,7 @@
 
 #define GPIO_SIM_NGPIO_MAX	1024
 #define GPIO_SIM_PROP_MAX	5 /* Max 4 properties + sentinel. */
+#define GPIO_SIM_HOG_PROP_MAX	5
 #define GPIO_SIM_NUM_ATTRS	3 /* value, pull and sentinel */
 
 static DEFINE_IDA(gpio_sim_ida);
@@ -561,8 +562,6 @@ struct gpio_sim_device {
 	 */
 	struct mutex lock;
 
-	struct gpiod_hog *hogs;
-
 	struct list_head bank_list;
 };
 
@@ -774,102 +773,6 @@ static void gpio_sim_set_reserved_ranges(struct gpio_sim_bank *bank,
 	}
 }
 
-static void gpio_sim_remove_hogs(struct gpio_sim_device *dev)
-{
-	struct gpiod_hog *hog;
-
-	if (!dev->hogs)
-		return;
-
-	gpiod_remove_hogs(dev->hogs);
-
-	for (hog = dev->hogs; hog->chip_label; hog++) {
-		kfree(hog->chip_label);
-		kfree(hog->line_name);
-	}
-
-	kfree(dev->hogs);
-	dev->hogs = NULL;
-}
-
-static int gpio_sim_add_hogs(struct gpio_sim_device *dev)
-{
-	unsigned int num_hogs = 0, idx = 0;
-	struct gpio_sim_bank *bank;
-	struct gpio_sim_line *line;
-	struct gpiod_hog *hog;
-
-	list_for_each_entry(bank, &dev->bank_list, siblings) {
-		list_for_each_entry(line, &bank->line_list, siblings) {
-			if (line->offset >= bank->num_lines)
-				continue;
-
-			if (line->hog)
-				num_hogs++;
-		}
-	}
-
-	if (!num_hogs)
-		return 0;
-
-	/* Allocate one more for the sentinel. */
-	dev->hogs = kzalloc_objs(*dev->hogs, num_hogs + 1);
-	if (!dev->hogs)
-		return -ENOMEM;
-
-	list_for_each_entry(bank, &dev->bank_list, siblings) {
-		list_for_each_entry(line, &bank->line_list, siblings) {
-			if (line->offset >= bank->num_lines)
-				continue;
-
-			if (!line->hog)
-				continue;
-
-			hog = &dev->hogs[idx++];
-
-			/*
-			 * We need to make this string manually because at this
-			 * point the device doesn't exist yet and so dev_name()
-			 * is not available.
-			 */
-			if (gpio_sim_bank_has_label(bank))
-				hog->chip_label = kstrdup(bank->label,
-							  GFP_KERNEL);
-			else
-				hog->chip_label = kasprintf(GFP_KERNEL,
-							"gpio-sim.%u:%pfwP",
-							dev->id,
-							bank->swnode);
-			if (!hog->chip_label) {
-				gpio_sim_remove_hogs(dev);
-				return -ENOMEM;
-			}
-
-			/*
-			 * We need to duplicate this because the hog config
-			 * item can be removed at any time (and we can't block
-			 * it) and gpiolib doesn't make a deep copy of the hog
-			 * data.
-			 */
-			if (line->hog->name) {
-				hog->line_name = kstrdup(line->hog->name,
-							 GFP_KERNEL);
-				if (!hog->line_name) {
-					gpio_sim_remove_hogs(dev);
-					return -ENOMEM;
-				}
-			}
-
-			hog->chip_hwnum = line->offset;
-			hog->dflags = line->hog->dir;
-		}
-	}
-
-	gpiod_add_hogs(dev->hogs);
-
-	return 0;
-}
-
 static struct fwnode_handle *
 gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 			  struct fwnode_handle *parent)
@@ -917,12 +820,61 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 	return fwnode_create_software_node(properties, parent);
 }
 
+static int gpio_sim_bank_add_hogs(struct gpio_sim_bank *bank)
+{
+	struct property_entry properties[GPIO_SIM_HOG_PROP_MAX];
+	struct fwnode_handle *swnode;
+	struct gpio_sim_line *line;
+	struct gpio_sim_hog *hog;
+	unsigned int idx;
+	u32 gpios[2];
+
+	list_for_each_entry(line, &bank->line_list, siblings) {
+		if (!line->hog)
+			continue;
+
+		hog = line->hog;
+
+		gpios[0] = line->offset;
+		gpios[1] = 0;
+
+		memset(properties, 0, sizeof(properties));
+
+		idx = 0;
+		properties[idx++] = PROPERTY_ENTRY_BOOL("gpio-hog");
+		properties[idx++] = PROPERTY_ENTRY_U32_ARRAY("gpios", gpios);
+		properties[idx++] = PROPERTY_ENTRY_STRING("line-name", hog->name);
+
+		switch (hog->dir) {
+		case GPIOD_IN:
+			properties[idx++] = PROPERTY_ENTRY_BOOL("input");
+			break;
+		case GPIOD_OUT_HIGH:
+			properties[idx++] = PROPERTY_ENTRY_BOOL("output-high");
+			break;
+		case GPIOD_OUT_LOW:
+			properties[idx++] = PROPERTY_ENTRY_BOOL("output-low");
+			break;
+		default:
+			/* Would have been validated at configfs store. */
+			WARN(1, "Unexpected hog direction value: %d", hog->dir);
+			return -EINVAL;
+		}
+
+		swnode = fwnode_create_software_node(properties, bank->swnode);
+		if (IS_ERR(swnode))
+			return PTR_ERR(swnode);
+	}
+
+	return 0;
+}
+
 static void gpio_sim_remove_swnode_recursive(struct fwnode_handle *swnode)
 {
 	struct fwnode_handle *child;
 
 	fwnode_for_each_child_node(swnode, child)
-		fwnode_remove_software_node(child);
+		gpio_sim_remove_swnode_recursive(child);
 
 	fwnode_remove_software_node(swnode);
 }
@@ -977,12 +929,12 @@ static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 			gpio_sim_remove_swnode_recursive(swnode);
 			return ret;
 		}
-	}
 
-	ret = gpio_sim_add_hogs(dev);
-	if (ret) {
-		gpio_sim_remove_swnode_recursive(swnode);
-		return ret;
+		ret = gpio_sim_bank_add_hogs(bank);
+		if (ret) {
+			gpio_sim_remove_swnode_recursive(swnode);
+			return ret;
+		}
 	}
 
 	pdevinfo.name = "gpio-sim";
@@ -991,7 +943,6 @@ static int gpio_sim_device_activate(struct gpio_sim_device *dev)
 
 	ret = dev_sync_probe_register(&dev->probe_data, &pdevinfo);
 	if (ret) {
-		gpio_sim_remove_hogs(dev);
 		gpio_sim_remove_swnode_recursive(swnode);
 		return ret;
 	}
@@ -1007,7 +958,6 @@ static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
 
 	swnode = dev_fwnode(&dev->probe_data.pdev->dev);
 	dev_sync_probe_unregister(&dev->probe_data);
-	gpio_sim_remove_hogs(dev);
 	gpio_sim_remove_swnode_recursive(swnode);
 }
 

-- 
2.47.3


