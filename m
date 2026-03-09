Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2261F3C245
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+44pNLvKD6wmlyUHopw7JCev4MUbKdOMecmtcoK78I=; b=zZO96NLf/CQb5jIhWiPlZo3ymx
	hHj9Hg0kpf/2AYrRRM04Vpo4ftcwBlXS1UruCeNZGh5p1jnZ/dsZUJbmaPBjiaEnXIWIV5tSTTzdO
	w9navwzOFuBGIXQv1PNkKAGy9fKYj/VzoKn5qkJMT2IoLJcmqKBx4RxbeYp3o1EGSk++jMMbuxLlf
	IqWGdgMmpznmv9k36rVStWbpGX/dsaW3F8JF8menxxU0Ih+7QpenXcb8bXiN9xRB1pZeU0BSubgBe
	YVP1iiRu8hV8CrsjxdZygUnp0Fm2MDxzkzCVh5fKUswzQKuNFB+XkYrDHtCFQMB1FpDAKLorb0dU/
	MrJigINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZx5-00000007KWs-3gkO;
	Mon, 09 Mar 2026 12:43:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZx2-00000007KTU-0FQf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 12:43:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629C5dmV526826
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 12:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+44pNLvKD6wmlyUHopw7JCev4MUbKdOMecmtcoK78I=; b=keI0l7AZufa5NJR9
	FxGOQJ82CTfr4mFRHFugkpK3cXX+IIsYH5lra08dS+9AK9XSvgBD5JKR2q6iWWuZ
	G8MRhRAlcnvmPlUbQKn47suu4v6aPEvDVZv8G8kqBAA05GiP/GR3mwa/R6A0hBk8
	DvgFbcQbQ/V/rgisY+O9yAaHxvTChxp8wpZ8PVrlzO1OPGydIInKtfEhGUhftXU6
	eUiH8X4FzkJMa/99XU6OgK67g3k5UqBsez9pUt6e04/tmfM0KdwodjRo3xWzoqs+
	lgk29vdKF1kcH+bRQQBndZoexA0ScP6R/hBdKJRSK5k1SzCBs9R9qf94OesuLpDa
	1EIqxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkg41e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 12:43:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7de0e161so970240085a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 05:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060190; x=1773664990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+44pNLvKD6wmlyUHopw7JCev4MUbKdOMecmtcoK78I=;
        b=DVVct7O+bqepLB08MM0LPsLIrxv14yGm06hMbEE3DSbFojIOs3JAbyDgeUD9JlocrM
         DDwA7GUfIvzAulHqmGpfgBql8aXl9QBOnBCS/799REH3nn0KpLT3cKRz17nHC0waMXIi
         SIERGFoutAiU0pjggLhTZmgXrWxhdWyfn/MVGH19ld9+pOUARQtqw4ZgLLP85vmZF00S
         LY6ZitSXq7DkmFHjK5YeDI8DSZ5PnvJNRLDe4key5z59n49k4pweyjBZsB4/hZWDtd2E
         ScBUhHfU34mUXBeEejvJu1AerKq43IcV2df8nt3+EKcq9JjJzQlBb4MaUDmGQwpVDmBy
         WEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060190; x=1773664990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+44pNLvKD6wmlyUHopw7JCev4MUbKdOMecmtcoK78I=;
        b=SGjPku1OmzoERIXbrIpJjC4p7XI63vnSb5U8xZjw+tQ2u/J/yeBK1sAGCrOzYVFH9E
         GFLKrnpcoGrMwSEfRYeARwnk+kQx5QZ+7t/GK8lBH8bdNTlwlTS317ONaLqNHK8INwMX
         z23/ZkbPNTOq3gaR9j/y0h2ELh2xtUTcJmkJMavh1Yzwd2CDqYrBmEG0+IunHuupRykb
         MBqZ2rlsDue6daaX8fu+vSmVpG6YbkJhoKNSmDYKxfov5bpvz5hhSEHnfKkNbmT07fZE
         2Ciz0AMQuZi291oVnoHE7g3Ik+0VV1zhzlruVK5e3oZE5EBoEC5wq21RjOpjr0bNoA/w
         ShrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjQ5xmurmbZ7DsiNx0l17knbDl8VNxr8EzE0ntYmF5HZFktz3O9GGESlUXS9MTD7sMHdmkWqYcVcdYgZU+knJ0@lists.infradead.org
X-Gm-Message-State: AOJu0YyEUXUELDsmzMCsJNoVttEu1qcZlZ42yK/bT2lpOJHcLYeYGAK7
	M5WcjXET5cMaaXSrwXI9mZpncx9fVy2QpwyWiUVBd7UlszBbaibv6M1v3BAnaxT38OkZAJS4bmL
	SCyyL3rhDucqJpfDP5o5domwqyqRM2ETEwoUUn1f9HYQnijIpWChMONxaWFGRG3ZDuUtAe6jTko
	xqpw==
X-Gm-Gg: ATEYQzwyqNYSLqjK8EWieNg+r3prUcERjt/y4P1taEZhXTcvOx4e2GZsl8qK6fXdO39
	fJMuT7xhfm+AoksK+kFMFhISCWLfeSEREPpF2zy8yUFrBGc2y1fh7YEk52Ij+va3FHrW1SB/7Wb
	dMvkyBo61Fhba3dsHiQUj2f9ST4qHDj63sP2sFLwl5ls0QbWQkDiDpHMo9vayL5vkxpgbk/SdCm
	AaVJc8tgWnf/PyD6UhwF3qpMFvXWldc9w65IHv0YXSkbe9cVbNWkKDrh4Lofuw6yfpNwqbEC0IT
	nDABKz+4TDOlldanD408CBDX6dlp1Ow1BBauhjo6M5YzFTPkyyia6PMVsof59euLbldIRw0vJWZ
	UqPGnGr1IiRgcamNejoTmFQqFxAPEL65T0yW0SiDOzmZ0NFr1epgc
X-Received: by 2002:a05:620a:400b:b0:8cd:8efb:b7d9 with SMTP id af79cd13be357-8cd8efbbe47mr163770085a.28.1773060190442;
        Mon, 09 Mar 2026 05:43:10 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:8cd:8efb:b7d9 with SMTP id af79cd13be357-8cd8efbbe47mr163765685a.28.1773060189835;
        Mon, 09 Mar 2026 05:43:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:494a:62d9:d95b:cb98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm107803345e9.8.2026.03.09.05.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:43:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 13:42:42 +0100
Subject: [PATCH v2 6/6] gpio: sim: allow to define the active-low setting
 of a simulated hog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-gpio-hog-fwnode-v2-6-4e61f3dbf06a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=R4Ywu/pAKIvIVEZDR6pAqvPYf0v/XCn2dkIco/jqnjY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBprsBNxYsA8Q1LF5HZoRzIH4kwEDuPpcFPljJRv
 aDgYFtdqiKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaa7ATQAKCRAFnS7L/zaE
 wzp8D/sFgjA+zH/WzHB4KtIHoXip9zBsEn/LDT+Fc0zQjsN9Pq30alODEdm8KQ+4kbj30kiNHoX
 dstNie7A4CFOFdJPwCFC30iLABL/O3LGw0GcuGqDLpQyrQzw4wvdqKrSTu4mtdwyiivYzCRq8os
 u0H8OQF4+84yB9DQkNLZeGhmzmvXwz6+k/kpqHKJOzFIV5SHNHdwPV4n0+GKX0dM1YnGl9ggY7y
 isMrdgdf2mRdxkcuoHIq5Rj6e0TbaRn0noJig2+VwRyCSYbvQBCj88TIvDvzed0M+mp9Gwp2EnP
 x3fzOCgD8Gsava3M/x+mNa8MI3AGFCYHBrEGa3ST13BvF5u1P7NyvfgbHLY3qhafqoSd6Wk7WHw
 HUxKt/9nSykSy5BiCq8bbEr/Regwj3eWvVt0kOmfUNkz7oN5aFhS30szutYVtyIv+pyz//vvlvf
 PIVRWLbKRPH+narFofUFn7ynAgZf5cS/RKt89sbbM7qbCPisCZRLuX/kHvgtAujYbJy8N4cM0U+
 mrzJYamb4ipvmCxMdOG+2WG+3LqW/9omjYlWFhOzZ2v6+VJa+yxmVSfptO5zH1GoTfymaly/vir
 6u5EXCUzF9qDtPLwu6tfIR25m1CcmZU5WRnXPt9lPRFZ8NNZmctQoaUAdle8rpzM7F7e/dp0JPJ
 Mt+lWwKr5E+YH+Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69aec05f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Z_vE--IGminT9Q5MwdQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7t_OxDW6MbUNLVfov3BxBm6f0SuN_40I
X-Proofpoint-GUID: 7t_OxDW6MbUNLVfov3BxBm6f0SuN_40I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfXzMqunMUa6sOa
 N6i68IQcisvji4vj8JuoLJyIu5gtZ+HKhEb2oTWANWxA8DRyr0dJLdoUjgaT2fsJJdWCGo/kKW6
 uoRH7vDWe+cvjddl8NVlILi9+QpOWsxYGf+Emsu69XqaJzHNOPdc+PZgbbH6sdU7SwL0Om4HkWW
 rlm6x2FDc8LuDc8eYwXyJJaP+J8HqxYMASeNU0aNPYB1jHm0dlSIWTJ1hplUHAvM34kB8gIH4T1
 2c8KcqG/j/GxPB4ujLi5QzsOUuWfier10PL0E/3RjbhKxWVmDtS9lMKJWT5toTxhOkKDdXxikgH
 8jzEniSFqxnd9JrhshLKg5zLSZ5mJRVYdToR1epfywYsoHG2eJjCcakCrhGoUzNEcT1WfB9Alx+
 TffKG2vt4QZwtzRCN5QaidT+jQ/DLlQaGJcVZuE2C7x7PdTkspWaZ0r5TqxxzLePEMWtVJdGKDo
 w2jhb1pqgdlfzmeBSdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_054312_226381_355EC5B1 
X-CRM114-Status: GOOD (  19.72  )
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

Add a new configfs attribute to the hog group allowing to configure the
active-low lookup flag for hogged lines. This will allow us to extend
tests to also cover the line config of hogs set up using software nodes.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-sim.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 51bcbdd91b4b027b7a340971a11cce5280ca1295..f32674230237eb08bbf8dd1337a79b5d0aa13259 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -654,6 +654,7 @@ struct gpio_sim_hog {
 
 	char *name;
 	int dir;
+	bool active_low;
 };
 
 static struct gpio_sim_hog *to_gpio_sim_hog(struct config_item *item)
@@ -836,7 +837,7 @@ static int gpio_sim_bank_add_hogs(struct gpio_sim_bank *bank)
 		hog = line->hog;
 
 		gpios[0] = line->offset;
-		gpios[1] = 0;
+		gpios[1] = hog->active_low ? 1 : 0;
 
 		memset(properties, 0, sizeof(properties));
 
@@ -1315,9 +1316,46 @@ gpio_sim_hog_config_direction_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_hog_config_, direction);
 
+static ssize_t gpio_sim_hog_config_active_low_show(struct config_item *item,
+						   char *page)
+{
+	struct gpio_sim_hog *hog = to_gpio_sim_hog(item);
+	struct gpio_sim_device *dev = gpio_sim_hog_get_device(hog);
+
+	guard(mutex)(&dev->lock);
+
+	return sprintf(page, "%c\n", hog->active_low ? '1' : '0');
+}
+
+static ssize_t
+gpio_sim_hog_config_active_low_store(struct config_item *item,
+				     const char *page, size_t count)
+{
+	struct gpio_sim_hog *hog = to_gpio_sim_hog(item);
+	struct gpio_sim_device *dev = gpio_sim_hog_get_device(hog);
+	bool active_low;
+	int ret;
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_sim_device_is_live(dev))
+		return -EBUSY;
+
+	ret = kstrtobool(page, &active_low);
+	if (ret)
+		return ret;
+
+	hog->active_low = active_low;
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_hog_config_, active_low);
+
 static struct configfs_attribute *gpio_sim_hog_config_attrs[] = {
 	&gpio_sim_hog_config_attr_name,
 	&gpio_sim_hog_config_attr_direction,
+	&gpio_sim_hog_config_attr_active_low,
 	NULL
 };
 

-- 
2.47.3


