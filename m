Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F8FF30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHD0ZvMybN/f9h6/Y0JvrxV1/0Bjsr+YtXr5TqQuVw0=; b=vXR9vq679uCnpZXaNkC0UdJRaZ
	X26Xw58K0kBqqkcmltc50LiftzMVIIc7LjIjvMTUSQB52OL9mg+JDSqAUP9odbD4Yc5uJVvDUY+4A
	8JD/PdJWtg9IpKdw3fQMV7CZ6JRWaAgTGa4ZWC9UFBDYEgabfJyXNPbv7lwsY5Ylrgcg0zT+EGkcG
	dsygy2IeI0/oHd1dBST9X1OV3lqr8KUr9jUtiRHIY/botkCxcEeaozEPNdJFmy7eZVYAeOMuO8YPP
	BhBObB/mXV3NRERxVAdWbdsGvd+zQs1Yj8/NBD+9dNQypn26HiHfSJUQGXGSgux6MU7fLOetSiAx8
	QjRcVwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5NH-00000001SeQ-1lUl;
	Thu, 05 Mar 2026 09:52:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5NF-00000001SdI-47Y9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CHD0ZvMybN/f9h6/Y0JvrxV1/0Bjsr+YtXr5TqQuVw0=; b=qVstS5BIozICVDGmHb6OPT+ekt
	BgUiqP790O4LsDbQ20D4DMzXTkXNl9UwwCXoC9qcGKy0OPqG61I92kAW75MlVK4YTqx5D39ykp0rs
	X5eTrSwVWvl5w0Oii396ITeur6ZmWg1Easire1LJV8IEXJjpsMiz/SLRlLi86BdKnwQYJNi/uRmLV
	R57hwrqY1bJErucZZIzro0jwSmz49hPUk0/Qf4mn1+edLoF9Q5VLj31hidM7wt1ENzVVbxgcsbDBP
	99jcxZQYCdIyWIxBZZcci/mG5dyDLmkvB2gDxZ+HgmbPlyOdNf88wJwmo521vhdOgmJ4C13fh/PDF
	7Y6p91OQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5NC-00000006OfS-313N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:52:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254KGZH1852944
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHD0ZvMybN/f9h6/Y0JvrxV1/0Bjsr+YtXr5TqQuVw0=; b=am21ufQPh0hu2PwZ
	4Wg+bv86mBQiRBwf/Ej1najcNbnmrAMFcJkEeRUX1AOkHd+pe+guARxGfTpJHLAG
	fiRzI4lzaQHdYJx/E4RXfKcRp4ecSfTMwgzfUd9eVpVhXAHYIom9ldftEMRt8Xya
	wv6XDGDhdRoPmAYzPk3Tk7UanyNku573qvtwxshE9vwfiL2uuX3bMgJDYwsvCYpw
	ctroLjqDJaPmvisffJAyN7d1hhdvljE92rZt5I9YMMhhGy1YjM2hqz6tZhCJPtaE
	jDc/7PeUHEDGk+QhLJu7TzyJDRlf+nq6ZM5BHMfOXaUenIbBoRETNMP6heP8THWM
	9ayEOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q812s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:52:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so5481278685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704320; x=1773309120; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHD0ZvMybN/f9h6/Y0JvrxV1/0Bjsr+YtXr5TqQuVw0=;
        b=SB6CzjUI2U56Si29B/dnYstgGxPHGWorV3AGDN/lpZRU1Guixoi5rJIEktgwHfBdEk
         GkchZKXJgD+kEbbOJSisBiL4NmcAqL3XW/0omgVy9VRTckotMJM0cR7OnrM9PN+x+PCz
         SiU2ltgMKC+oE2i2+64WRjBivhISLUvSA4Bfj2ydHABNqWhS6mbe0IbQb+GCtgIq1bfy
         aS8EDc4pf52jovszt6LNfkfqpjlP8Q8JtOOa7a+Go4ebvZ5cQ0bpIVa49bYHY71aHi4c
         e3Ke20/4y85P2FJz6b55r9/QjhZRBV1D+GfTKy5G7InkYyhkCOITCF+PjN7qYX97Jj9d
         wdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704320; x=1773309120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHD0ZvMybN/f9h6/Y0JvrxV1/0Bjsr+YtXr5TqQuVw0=;
        b=mBSw8lc7yC+2j1Lp5VpwYZDryCW6wcqFtjZsFuZ7xDk1hlc7gP1R1a+Tp1eNlya9be
         EEhZaQTmbV/A+z3U09A3AbD0huAAfJhYWS4xUCmAnfDOm4ldryNIFfO5wY3Q3CcyHD1B
         LL0N6qrRcDyRGOw/L+jDi4ArsURxqf28NFnFCDIpGjOW5XwqRDTvUqALm2909JpqU5RW
         V6fOqKoDWFgAHF/u0zFbXhTKWuo8vHLWVFiC8Q5YShQh7o6qenXQwrBFhAyqQRyTJBiG
         kG5v5YoH5xn4i09ydgY3zNY3y1ckWamfeqQTarx52jPBglUw8aSs8HgS0OPCFow7iHZ3
         gPAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdSx+vxU9IXiG+M86x0s7t1/Lnx7O4HIXTmKkr/8pJtxk8QRl6T8KzImBu813jd6tUHUBUqXMKN1JWO0LUconr@lists.infradead.org
X-Gm-Message-State: AOJu0YxUVZnOZA+/b/cG7hiXrZWDtNBUbq5Ajf4t0W0v+FFCg9WW3yo5
	nu0txVZtjVAw1IpeugS+uSdx35Ozjn3MT3E5qffSzLE3z7CJ1sYJdZ54jufei/hJKqfK2ChxP2j
	WItI4I0jCMVDwY/DJTV8k8PStloCYByH0hr5HGRwUKLibTYbWXeu1NLdJvJicJrQM7x/tCOzNSZ
	V1tQ==
X-Gm-Gg: ATEYQzxK+LjNjZhge52miPIC2XYys1qmu7hrMZR43CkM3+MjtW5tl89dLZdwhi+qRTb
	vxXiqnGwyjN+hleAo4vR1PNqoDkh6yRJnlEgfU1blQnLgrwqXiLjuNcAV99Uej4MfP++kGT+ocB
	et15DeHE8aHVSyMvg2GuSFr3Qp2R3iWmdN0QEQSsjhteybF8JlB9lX0yd0MDX+4HPPta56/sfE3
	6boNddMGQwK1zrkuXMP0IxrlDS49sVLkr0UDMstQMdDszqQZwhbnrOlxD8X/rIQrxTkQf0Vct4H
	Nw+gBN57ZXns/o1W//jttkkyMA/wI2h989JUDufmbC/3gWR6qSX5ivf0iVWRHhFn/wRsspDn3o0
	M/HabOJU0s6tWu2r4ozyJo4T2KC6TW4/1S5kzIAuydcNnrltUUITI
X-Received: by 2002:a05:620a:29d1:b0:8cb:72b2:2a15 with SMTP id af79cd13be357-8cd5af12a64mr588826185a.33.1772704320005;
        Thu, 05 Mar 2026 01:52:00 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8cb:72b2:2a15 with SMTP id af79cd13be357-8cd5af12a64mr588823785a.33.1772704319561;
        Thu, 05 Mar 2026 01:51:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:51:31 +0100
Subject: [PATCH 6/6] gpio: sim: allow to define the active-low setting of a
 simulated hog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpio-hog-fwnode-v1-6-97d7df6bbd17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HHxKSnrx8QF12IYAV4N9qkzXGUbUGiRNZBd69B8GJus=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVItGibV7CIxkL+FQcAk1MH5WBNN2KFBq4i2N
 nNYJebj6OOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSLQAKCRAFnS7L/zaE
 w1gjD/9X6GlKnqvOTIly4upROqqQSVnKHqiA8DysHPSXiS5iN3krsYiZb4kjSRWtLDsjs6N9RSH
 66v14HXZDcxmd97WQE2xt0cqBYYxE3LKHrw0901xDk1HzAcPxeoAOB8j6tOQbGN9N8U+frKyruq
 6hRZNl6N4C4w60ZvrFbVT5KD0dJ7aynBsLgIFaB5v6bDK2uf993Pelr/fAVd3Wc64YtUUuM4Y4K
 Y82r8lGxsfD/t+wvUxxPu8GAkqGTuAEww+g+sGNR4F15yFwGTD1UXWmMiAaupBwB9D2XDTj5rxA
 9d3GBcO/NXSX38ro2o6SlgMT5ZpZvXsAU28+rVB81JrKYavQn+u2B5Njj20vpXVHbOipFk1ZxpV
 PDxU0lZD9uOcaGv45XumkJVu52UROm9GhPYlfQE4y/NIIFChQ6YHwcxXR/NbR1VBn0EbHOL1+77
 6eVE1ytqDcMd3kvU4aqZdvBMlL48SGz8x1c9rCnwAjcB1SYvzwMaOfWkXKgqsF0H9mC0CXJl77V
 EHGvjr8+nTeytrqVFiD9cQcB0f7L1rHDcJnztVNxu8uQYh68/3EUw0frZec8ZpGW67RQnC4JW5W
 uTN0EOg0HQSGwnKfd5gzUOVdVaYJxnZ+ykuxZ144n8Bbx474aE5atdX5Hn81viTWRb7pBy8dDwu
 t4r0f46Ohl1gLZg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: vooMW9mA_hMxvdrVyYV1oMp3AB-VccYg
X-Proofpoint-ORIG-GUID: vooMW9mA_hMxvdrVyYV1oMp3AB-VccYg
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a95240 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Z_vE--IGminT9Q5MwdQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX4bR2Sw83u9m/
 JF08gi3b3RYRuKQLrNDDTa4ydflHHOnaC5kR5yBGI9WKq4rUx7CyH7c0mQIpjQIOZIWn5Vzxz3Q
 j9eDph+YDOVtPsdXLVA8CUrO0hVIPDm8+ZUj1kfhWqxeytT3Yg/NaHEkQNEtAF24AE9PW6xbroW
 EKWJOrIg+5uL4X0OX3vbejxf6djJtSjHSAXgqAIsx1fOikwi+pa79+FufwTZro0mSt9O4wt0ZM9
 rKBdALChP3ao3amlSqYzRXZ2PngNWSwFCQG+vxVZ75kPN4yp+VtbRzfdio+YtICH9CjlOv/fO96
 7PXGSKe4zS0FK7DCVM6XxKHqYz7OyT7y5ExECCxkeRWBhwD6ICIZ5ZjTYSEDBdQZFMzuYIGJSFQ
 IgHwfK38/03GblvAzv3IlA3Jl6PTixdL1nibsxFZvWrMY55X7FNCxFSDOVJ1OioLQYF+d335lWH
 4tQoLnVbNQh2IB4t9HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_095203_164697_BBF123BA 
X-CRM114-Status: GOOD (  18.10  )
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
active-low lookup flag for hogged lines.

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


