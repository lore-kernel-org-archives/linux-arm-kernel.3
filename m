Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65DCF3C241
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5nIeS9X1YbhohJRIffAt90+vLpOah8/bJUe3CSaJyU=; b=kaRCK3cpt+NMGdFs/XIpO7Kmas
	qzVp7TPgPoqTYeby2e8iM4Kc7mSVjZvttkyymUBGYYqpF7uxBXszYERvGhUVGeY9lBruyDlk8Hb05
	2yd1aUAV6UeIWDPZtwfWj7IwCVarxYbUt5akJojgptGyaRf1UHQkpTahWbt3auKsq/1T36+yg4UTZ
	kTLtStnWEe4q8OpWvJ2njmpKecJoLXr5SVepHgL9ejZCVY9YCeggcIDjaqjIy0rOk2MgY8VMXXyrO
	cSUkgkeWRcl2kObgBnzO3UOg9feTpzlX4EX/ZlsqIXvO5ru+W0zlL2b6lpuzfEKmKajmvsQw96Bzh
	Iu0SKhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZx5-00000007KWQ-2II5;
	Mon, 09 Mar 2026 12:43:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZx0-00000007KSG-11fl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 12:43:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WHrd3773507
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 12:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5nIeS9X1YbhohJRIffAt90+vLpOah8/bJUe3CSaJyU=; b=a71wUr1pe4R5IEa8
	iSygIp4wnj5qqTTJPqGOhK+aYYo7Cw2zreCRcO89hfNNn3LzGoViM3kFxy4dtvtb
	klXS5g3nnay5U+/kKE2PJStRpbmuBpEpqs7f55uUHXRlCg1WVwVw3huhJpYKI6mI
	RU48Bv9snpSqu/J7BEd3HbcmiTyLIliDKgMrQ6Hd3R3qt+GWK+/n+wP+PqVowCk4
	7Ut1SVvEpVrjiJACPEuonRem4fz16fQvrjWl/NbqeX4oua2BIoh1L2BHDtdgUJYO
	f1pI+VpqKAhZw5BS3uqHmqYqmTdWVvGfPvt/zAeebjQXUQHIA5MmFEI1M4e7tHCd
	wmhs4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8ur8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 12:43:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd820c6a4fso1163408485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060189; x=1773664989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5nIeS9X1YbhohJRIffAt90+vLpOah8/bJUe3CSaJyU=;
        b=IQofSXdznkxrKgPBISzEmSB0sZA/iA0DhfofklNt5hrVogCQ15XBplc/W2ejhow6Bp
         5M++G6obuttQ24cyRE4JsubJ83F3R1Sss8gl+T9AkSSW1czPQ9I6BTeToOM2g3l3N0M+
         oYLd3XtVe7WU+RQtWYOc5TxEbdfQlZyTtJoy0EAr9w9GKO8BsBuipGU4T6jqzskE7Ko6
         kxgCcB0MraMFPwwLJ5+4blOoyJSsA8Z07bxzHVDCRgDzFL0sZcl17kxLZhgaGSwMun6C
         3Zod2Nc1USTngJoStvflcCW3xLd9CSSxHA3S9DLw7j46GUGgroPFP6zKV7kaZiE5Fyjv
         Olfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060189; x=1773664989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5nIeS9X1YbhohJRIffAt90+vLpOah8/bJUe3CSaJyU=;
        b=nN6JeS8H8PDwky/ewBiqgr8wp33lXPmRnvnDrZUV7GyP2lUuf29MpKeXw/zG4x/qjN
         VTHO6WKn/M+oquG0aQ6NqcOIA2LONfO7MkiKFs0xoiBZjvYJ1nxRxRHb9/+NitypUReX
         67W1eh3p+7mZQzaqiL597uS+awR3Mddf4gMQLOW6BTuxBoeuKV38GfDAehKsWnkuS6HG
         q2dnSTgqzZMqyQGRj6kYFU5aP+dyV2fU6VU+kDIoEwGSVS34hClGSgyD5tG2HpBqH8cf
         XejAo6o8vpThv7dbajSj6F3ndmRQifA3Eeca/WNRkZtq3CtF9hsDDCmOykBD8zinuY33
         +Mcg==
X-Forwarded-Encrypted: i=1; AJvYcCXxNexwVWS9jPrg/K5dRIbkqYpu3AruUBxGaxQhat99dMHqXR0B3xZ/go3UKeRRla6MYxVI8yXN7dfTikjj+tuj@lists.infradead.org
X-Gm-Message-State: AOJu0YzN280vD4YocYhGR/bFpWFn4Ou3F9qcnGv4qze+wvzAoL2zaSVw
	5khQ60wecYFm3u477z3qrVrwD3Rc4fO7uJJuyaeqlLKRp8oRTSKk4z6GelrGmLdaqxipjWIUPGQ
	Pz3CrgEflKZNFyiwKNFecwpMDsuPywmWHlHkSkGhWhXaJEZcibjQIIqynmIDSLZk6awbGXmP1Jz
	+QFg==
X-Gm-Gg: ATEYQzwzjpj6b98ZqFRRQ+CbeZVufwMPZSYjsL6d4EasMb+q88LjKU56R+wcJRGf46G
	l6jGW7wSPp7ptZ7QwWomihKct6eX7gfN7I6y9+FRRhAhj6tvRTSLbXYbc0GpBwTB1FDKrOzfJae
	lUsHltFoegyJzEiFEMY/TfMu5IQxTbxDdQR1Dqsaf5FUA3DLSWVfOhm9Ckqo+eh72vBPhk+sjow
	ubCdl8AnjD+c5Ztb8hcf2w9eypVms0YmG229LANiDdNhO6kSvOFdCmR+7lRlmaVGpAJwee6shUR
	H++YeB+fan8waEUgrWdu8igVe0+0iwb8YNj+e2cgIzFOXqYTiVV3XjJWdhfStTK9cFpunABt28s
	mLs4EETnRhIKYSDtD98gt7Z+meOO0fk5FH/qA5EP5LRQF2dSltS9L
X-Received: by 2002:a05:620a:4586:b0:8cb:72b2:2a01 with SMTP id af79cd13be357-8cd6d42728emr1388186985a.18.1773060188416;
        Mon, 09 Mar 2026 05:43:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:8cb:72b2:2a01 with SMTP id af79cd13be357-8cd6d42728emr1388181585a.18.1773060187916;
        Mon, 09 Mar 2026 05:43:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:494a:62d9:d95b:cb98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm107803345e9.8.2026.03.09.05.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:43:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 13:42:41 +0100
Subject: [PATCH v2 5/6] gpio: remove machine hogs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-gpio-hog-fwnode-v2-5-4e61f3dbf06a@oss.qualcomm.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
In-Reply-To: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7227;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4BnEUtmMiOiwXU1lQlZ9yMyJWb+fawm1Al0WC9Bh4bA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBprsBM34X8qWjOEe+ZIX7SQxEMQg+Byczj+gL/y
 9GR18NPlZaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaa7ATAAKCRAFnS7L/zaE
 w+JFD/9QC8D34cOdqUHb/kJTimscTHraiX+HApC9PJcT8Ybsb9sRAhOhzU8XdLexeM9OyapI3IL
 ftjBOhqv7huCWsA5ChENpkS/mhZyFmjNZCpDgf9Mc/dHJIl5cKwYYIGSTNmTZ2bN4ONtQMoagfa
 gz7Kfe64CE3mayaZKIQq97j431fJPAYCdfusPtQZimHCFkPKPLQ/LDf0Sxl5buLpl7gQMLai36z
 aY1wG5XpLxhM5/NRicW56ARQg2DxOZbKGdLWkxQTkd4jVuZGNB2ef9dzmamHYRxqMVG23U81/JB
 XQTdpbY8q0boVBQTi8M8B/1kHxA/Hr12CQhxMEon0ZwM8WIop3/30+N1SJBJgSpXK+BaSuvrS86
 yJ4nbV/KRmCwHcptGuGZ5vQ3tBKm0yRpYA7/DO9iigjXJvciROMp69HCS7Yonv4JfHFBpEzt3zZ
 yzO8FK+TTWKZpjdoy7vEQQHbpftOmJv5KRo5pdnZTSejilcUfNn6wZK2Opj4VvJFxwuwsZkyq5D
 8E6xChvRWAn1p8FHOxz/hH9WfUkOY5KzNaCo6Ue8S4iovjzAHCIii2vnZ2bfxjIJIV4dctBKNwx
 YpzfO9YDXGcNa9zWTdgBBhaSwRRhymFfk3hoLBhr31i7DBeuDBHkAkDeyvLKqVoxrE5TUDi286f
 08Oz7S3X9LtMxIg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: DEGySdgl6r9ooiFaSzI28qRVREbH2yYB
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aec05d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=EJ0IlyYtn7jNkuMCNfoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX8hfiuGCiwzZi
 MGtsJd0FjbNPYK9boJDp1OcCiADEX4VExUNiQGSu0Mb4oAkwL3BW5uQjfvjXHkACzSFsGfDzAoz
 Bnjna3OLDP/vuENGNeU5kA8RhmHgwo6Oco67IJB1HBwe9yvw03k8kwR8LYHz7er1TZFlmu3qE42
 4ZHgI4WOFxn5sbPPTEzmZppzJaj1PO8J6+Igm5uJbF9DNmZ6HCtXpVuw5EKYank8my+E5bM0ap/
 yOscB+LoS7ORWlilu5QAU4LDYFlYIb9u3M+vEl+6V7/foACDUwjS0FvcyE8+rM3QsupbdWgNhez
 GnUTFpInUgkxtY74z1iCSGHSlw16bjP9A/k8wHPE0Y6/c16Y2CzoLO0+ldxl2pRA6s8llSeMfBn
 itgv8RafJmsqeNMbFgmusRcd5yh1C5OiiLC7/OwgV+X2rA98J0xQZ+Y548qOMsOQ3dDCjUURzMI
 OIYTPKDZS2vVmWnbjtg==
X-Proofpoint-ORIG-GUID: DEGySdgl6r9ooiFaSzI28qRVREbH2yYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_054310_411510_A0280FED 
X-CRM114-Status: GOOD (  26.21  )
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

With no more users, remove legacy machine hog API from the kernel.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/driver-api/gpio/board.rst | 16 --------
 drivers/gpio/gpiolib.c                  | 71 ---------------------------------
 include/linux/gpio/machine.h            | 33 ---------------
 3 files changed, 120 deletions(-)

diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index 069b54d8591bdeb975a6c650d643db4f7eb98ab7..0993cac891fb5e4887a1aee6deae273197c6aae1 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -239,22 +239,6 @@ mapping and is thus transparent to GPIO consumers.
 A set of functions such as gpiod_set_value() is available to work with
 the new descriptor-oriented interface.
 
-Boards using platform data can also hog GPIO lines by defining GPIO hog tables.
-
-.. code-block:: c
-
-        struct gpiod_hog gpio_hog_table[] = {
-                GPIO_HOG("gpio.0", 10, "foo", GPIO_ACTIVE_LOW, GPIOD_OUT_HIGH),
-                { }
-        };
-
-And the table can be added to the board code as follows::
-
-        gpiod_add_hogs(gpio_hog_table);
-
-The line will be hogged as soon as the gpiochip is created or - in case the
-chip was created earlier - when the hog table is registered.
-
 Arrays of pins
 --------------
 In addition to requesting pins belonging to a function one by one, a device may
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b993cdae79e6dc389ca42ed079b3e39d1f9fed5a..829774322f3595d191e13e89ef83001507f6fdea 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -103,9 +103,6 @@ static DEFINE_MUTEX(gpio_devices_lock);
 /* Ensures coherence during read-only accesses to the list of GPIO devices. */
 DEFINE_STATIC_SRCU(gpio_devices_srcu);
 
-static DEFINE_MUTEX(gpio_machine_hogs_mutex);
-static LIST_HEAD(gpio_machine_hogs);
-
 const char *const gpio_suffixes[] = { "gpios", "gpio", NULL };
 
 static void gpiochip_free_hogs(struct gpio_chip *gc);
@@ -930,36 +927,6 @@ static int gpiochip_setup_dev(struct gpio_chip *gc)
 	return ret;
 }
 
-static void gpiochip_machine_hog(struct gpio_chip *gc, struct gpiod_hog *hog)
-{
-	struct gpio_desc *desc;
-	int rv;
-
-	desc = gpiochip_get_desc(gc, hog->chip_hwnum);
-	if (IS_ERR(desc)) {
-		gpiochip_err(gc, "%s: unable to get GPIO desc: %ld\n",
-			     __func__, PTR_ERR(desc));
-		return;
-	}
-
-	rv = gpiod_hog(desc, hog->line_name, hog->lflags, hog->dflags);
-	if (rv)
-		gpiod_err(desc, "%s: unable to hog GPIO line (%s:%u): %d\n",
-			  __func__, gc->label, hog->chip_hwnum, rv);
-}
-
-static void gpiochip_machine_hog_lines(struct gpio_chip *gc)
-{
-	struct gpiod_hog *hog;
-
-	guard(mutex)(&gpio_machine_hogs_mutex);
-
-	list_for_each_entry(hog, &gpio_machine_hogs, list) {
-		if (!strcmp(gc->label, hog->chip_label))
-			gpiochip_machine_hog(gc, hog);
-	}
-}
-
 int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 {
 	struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
@@ -1047,8 +1014,6 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
 			return ret;
 	}
 
-	gpiochip_machine_hog_lines(gc);
-
 	return 0;
 }
 
@@ -4582,42 +4547,6 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
 }
 EXPORT_SYMBOL_GPL(gpiod_remove_lookup_table);
 
-/**
- * gpiod_add_hogs() - register a set of GPIO hogs from machine code
- * @hogs: table of gpio hog entries with a zeroed sentinel at the end
- */
-void gpiod_add_hogs(struct gpiod_hog *hogs)
-{
-	struct gpiod_hog *hog;
-
-	guard(mutex)(&gpio_machine_hogs_mutex);
-
-	for (hog = &hogs[0]; hog->chip_label; hog++) {
-		list_add_tail(&hog->list, &gpio_machine_hogs);
-
-		/*
-		 * The chip may have been registered earlier, so check if it
-		 * exists and, if so, try to hog the line now.
-		 */
-		struct gpio_device *gdev __free(gpio_device_put) =
-				gpio_device_find_by_label(hog->chip_label);
-		if (gdev)
-			gpiochip_machine_hog(gpio_device_get_chip(gdev), hog);
-	}
-}
-EXPORT_SYMBOL_GPL(gpiod_add_hogs);
-
-void gpiod_remove_hogs(struct gpiod_hog *hogs)
-{
-	struct gpiod_hog *hog;
-
-	guard(mutex)(&gpio_machine_hogs_mutex);
-
-	for (hog = &hogs[0]; hog->chip_label; hog++)
-		list_del(&hog->list);
-}
-EXPORT_SYMBOL_GPL(gpiod_remove_hogs);
-
 static bool gpiod_match_lookup_table(struct device *dev,
 				     const struct gpiod_lookup_table *table)
 {
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 44e5f162973eb6f6e85188f56ec34e1e3e2beab6..5eb88f5d0630f83b6a3a0e6727103c319e139b27 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -46,23 +46,6 @@ struct gpiod_lookup_table {
 	struct gpiod_lookup table[];
 };
 
-/**
- * struct gpiod_hog - GPIO line hog table
- * @chip_label: name of the chip the GPIO belongs to
- * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
- * @line_name: consumer name for the hogged line
- * @lflags: bitmask of gpio_lookup_flags GPIO_* values
- * @dflags: GPIO flags used to specify the direction and value
- */
-struct gpiod_hog {
-	struct list_head list;
-	const char *chip_label;
-	u16 chip_hwnum;
-	const char *line_name;
-	unsigned long lflags;
-	int dflags;
-};
-
 /*
  * Helper for lookup tables with just one single lookup for a device.
  */
@@ -95,24 +78,10 @@ static struct gpiod_lookup_table _name = {				\
 	.flags = _flags,                                                  \
 }
 
-/*
- * Simple definition of a single GPIO hog in an array.
- */
-#define GPIO_HOG(_chip_label, _chip_hwnum, _line_name, _lflags, _dflags)  \
-(struct gpiod_hog) {                                                      \
-	.chip_label = _chip_label,                                        \
-	.chip_hwnum = _chip_hwnum,                                        \
-	.line_name = _line_name,                                          \
-	.lflags = _lflags,                                                \
-	.dflags = _dflags,                                                \
-}
-
 #ifdef CONFIG_GPIOLIB
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
 void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n);
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
-void gpiod_add_hogs(struct gpiod_hog *hogs);
-void gpiod_remove_hogs(struct gpiod_hog *hogs);
 #else /* ! CONFIG_GPIOLIB */
 static inline
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
@@ -120,8 +89,6 @@ static inline
 void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n) {}
 static inline
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
-static inline void gpiod_add_hogs(struct gpiod_hog *hogs) {}
-static inline void gpiod_remove_hogs(struct gpiod_hog *hogs) {}
 #endif /* CONFIG_GPIOLIB */
 
 #endif /* __LINUX_GPIO_MACHINE_H */

-- 
2.47.3


