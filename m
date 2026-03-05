Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71635F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lXayYJMb4sTE8GVHr0RX0rbTjMxVYXXnx+bVcFFBhk=; b=s7h6YA7moNf9emqmEc3NJt5rwO
	/CI4nDQdxMoOuQo5q690Dw0JuxGPciv37VZ9WZhCyjx0qmZw8bERIK3jP9Yadpig1FyFBU2lya261
	k956NtIe77++RauRs06eQ+8zqmKfN01Ee74oQ5e2xfnUXzDm6k6xGvTDT/39kFdRatYscU0N9gJv7
	VNNjS7xhPAkxNrUqug/hIQ/wZdokU2uYj3vLdpNhRzVLuBqGkBGXHFrSNZrJ9H1a+T7UcxDEYu51y
	rhoWOSmSMnZHmxz+g8RQGzZm35Uc9Fo8BIu5d/xMDhOtnQTfnXvrFyPcc7My6PigSzknv2+EH9Ycu
	RljEFa5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5NH-00000001Sev-35fW;
	Thu, 05 Mar 2026 09:52:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5NF-00000001SdH-47sK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9lXayYJMb4sTE8GVHr0RX0rbTjMxVYXXnx+bVcFFBhk=; b=lstHdRZXD12UrFma3KgCh4PZ8N
	4Q2nxL2yf6I4a3hnbkibSe/zt+3V6mG12kIyQcig+d6HUVoaYhVM8DLhAWfdaNf0BIE0OYyKEcjFT
	AwC3mT9JbGJQnl6zEoi0puhGJGfpCppGUXy9RGFPw6dXO2BVohWVm9Lcm1Qwdr9SaZMTShRBLQ7sh
	No9AzNgqWPjY0ym24ty86c3D6WCyAPPnojOkFceYVVd8RDOpoe5jMa3lX6hWNov1TM/5BzUvQWyRx
	GEvqltNeqWW8PG0ZeF1xH/5ycv84bNgpn8KXJ8ygjcgH2Dkl+uxc9WUNGEj22rP5oATTYSDUecCtm
	f1/DS/qw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5NC-00000006Oep-0n4l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:52:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258vNrh2665250
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lXayYJMb4sTE8GVHr0RX0rbTjMxVYXXnx+bVcFFBhk=; b=jSg/4hJghyJX7lU7
	UqNa0NeFSNDZTu2aeyWp+WKa8GFkTQBkF4JpTzvgoE6DsaalJjvMwNzhqeVwMugr
	wNt6j5clx/9FfcwA03lArVyuABsLpfefsK4uYJk74G0QOSsPs0waA5+b0vxoXycF
	5On7egWWivRCcT/cY/X6ZqFJ4TyMVEkdBDFaaQjVtmrBlzbrl2t1VDVWKnAMvntK
	OwirLW3Hk8VdDxZl5syi0QaUPGUSMRC2P2eONS7pEPFqESjFtwDnJbmk4Zk8Nogs
	Xn+dltxPgSn/YhBQLmUDCD4bkD1t7/JeqwT1R8blXiaIBsV0zd3Y7k0XTQap+Dad
	hc3KWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb286a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:51:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so5473130685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704318; x=1773309118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lXayYJMb4sTE8GVHr0RX0rbTjMxVYXXnx+bVcFFBhk=;
        b=dOZdAnqvkw+lfRgBKI3czHhKi/1+kSnjh9Ky3QHg1N70s3n9JI4k5ZiR11/cTAju4b
         reA2QMPTRuJg+PLXZBjdTEtvMXnAOaoFs9xtP3OmXVqoqPlpasRQkKVtLAyBhiSS1oSj
         tVNLuV6Lc3p6vTegn5PyXoncvh6TcN6b++MC/3tskhOOj3egjCbmf0EvZw9rClEcwaYe
         Y3/r7kXwGYJL5VCeKMBrDH3OeJuKVY/yrwQX5SWNuqI726ThU/+4Qd0NCCBgfw/PsWMb
         5ycbek6SGHm1tvUUD0Xq17v3tC7g1DmAf21h4qgZv2TlSHfNXDLrl4shp7HoHZrt41eL
         +Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704318; x=1773309118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lXayYJMb4sTE8GVHr0RX0rbTjMxVYXXnx+bVcFFBhk=;
        b=RMbYQe/iPi/9jDQAhp4EKW+8rfWedxYvZJW+bGmTVn5a2n+Q8FoSY2n0CBC4J3fTff
         DmiORUcOcINW4SWQjMaJ6aZ4TT2YIuL3+Upp8UWp5VUmtHjnV/LhqZlRREcudt9WYEI8
         jKVPIT1GowLesEhTc92zls6PQtr/yIwd9LmsZH9aZqXcWcUrA9cPsj+lAV3iK6+8I1UN
         roC+m1CmkBzmeHpKq9p/WQWEm99aYTEBweNtqRqZ4huovTlh+l5jYpevRvr47defY0s+
         ul5g2c8x+V9rZp6CoUYooLQdV7w3/oITxgMdviL2gd5tW++PdA2onn+08IhO4sPB8SsA
         1zzw==
X-Forwarded-Encrypted: i=1; AJvYcCUklw+3dT1OvxhqGYLdkwVUpne0PrGwOhyFO7TaqKfeGsf+BvrQ73N+jePZ32PSE3/JMATcDVoKaJZcprHUraRW@lists.infradead.org
X-Gm-Message-State: AOJu0YwK3rI4s2a1hwacFSyu6Ck0M351YBYGM2siYTxcCvJB6CoPEj5A
	fw44N0Zg/GbJxwS+sA4qv2+QUBo22dP0cNAD7G/9DVg9+F4yq3Y/FxbAM+a9ecrOeUc1vkvgawa
	90iUd1gQJ3+5Y7wdY9YVUGWnl6sziUK1kYYDki6KE5AyH3UDin7xNiEQCfNZYYYGPRLyfSIqtDY
	YK5w==
X-Gm-Gg: ATEYQzyqLPsnMcyFLmaBhnJpoK7kpRwBgNGaTznL5PfHLZDHexl8QYhTNjYtv08gdHF
	+ZlO9f8lQETd2/OYyDyEn6ijTwL2z2eKlfi8JHpFdK8m+A3mUVB895RR7SCA+6xE/C6Gb82dzEQ
	gj8NkxMJIwY5Pems4KXie68FCwYVfXPNPe9RShudlClbbFdJdFNpQKaszROPiYYnf63RqbKjFrW
	DMLg4sFoodACBJyHpgKG1JLMpmkZy4m9sTXkccUlctQLk2gKezSWD949x3ibsx8K1aw5ait9lBY
	+hT6CZ6df7UmX1vMufdXL484Z5od9L9QYxrDYNPvPNiigAf8WmRuvuGRtJ6q45VVPLGT1hJwwEJ
	deD9mRc1I/LppO3sAFB8FbxPxgXmhWjsSrqcQTPq9LeWmqcVrMa/1
X-Received: by 2002:a05:620a:1a94:b0:8c6:670c:953f with SMTP id af79cd13be357-8cd5afa51a0mr579593685a.58.1772704317657;
        Thu, 05 Mar 2026 01:51:57 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8c6:670c:953f with SMTP id af79cd13be357-8cd5afa51a0mr579591885a.58.1772704317222;
        Thu, 05 Mar 2026 01:51:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:51:30 +0100
Subject: [PATCH 5/6] gpio: remove machine hogs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpio-hog-fwnode-v1-5-97d7df6bbd17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7113;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nHHCSm94RSmEIVpUlb5PB0C2I8hqgvSMHOW0imJuagM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIr3OTbQ+EhTR/0KOPIsw7kVLs2Ax4N5tZgk
 wRj0KhbwzOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSKwAKCRAFnS7L/zaE
 w8qkD/4sUoU6WuCaaKi2i05/0ZwSbE8TTFhBiPRiYDkdfYLS6WyiOS92WfOTLqKUORwgNJLJce7
 0he2vPpJWv8I5nkqqglm3uo4hudl7P9RwR8tJnmUyt8MYPoKqNRJex3EC9r4Ud349DlvZ6zr7T2
 PWuGqbTlNlY2qvulNPAM9PnvLU14dwT4Kw60jacWu6SzA8FpX8PSDLQYgayVxVaHf624BU3GIjp
 Xjm+lnPeVRt2m485svet2KXR3UfJTWMC9QkWIZJfwM8PCNtviAvdSBBQMgOpKXKL5T3IZGSj6Op
 wHdAkU0u8oT3Coc0JQTKRmZyQG1wtyoKJ5qNrwCoVJoNUL7NhEgP2xX5Ordg286h4szTMSwsRux
 2KqcC3+Om7DAWIA6ZSRjIIhL5zkNvQ1N/3KN6NmQ2+RMnK+fw5WmrqcIE5igotMCNGdX5wWWiWp
 guEtIXSTXIg5teWGUIx4sLQaL4Sb4cB5jjrGWBUCH65KzsVTf6THOyyW48SIXDzUqqOk5t1Bp+4
 s/TzXkY8lfm3VCmfqsEZZuccywZVEl5AEAX30YAtEYJeSRIfgduGmKMi7byO2CT/zv72YxHCZsd
 QYcKlgEAOGe9yEAFXwhmTQLZjLj5aywhBnJ2NKBwVsXJk9TZvilTgRHDA3inVwXpiJjoIPtYheC
 HhRpJgAzingRmUQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX9qDqwit0Jef+
 t5l1SIQjRjHseXJxXPdYqb5IcYPKb9XgSih0gpK1zQbgd6Mof6MueZfDTXBTKwTsnwa2rUT3x9j
 nl08U0fEM9C0DhAHWRqa/vtKFJOWpd0BAYSJ/wZzTPWvuvj+4uRBJre4FVRUyCJghbny+oA2iik
 TrhdbshBrtE/zQ2afb16Jve5pT4gX1vkfZ+XCsuB7PqS2P1qhdkr3a0LE5p9fONSM1j0TANdHaS
 p8FMyd5jFYMMAaSMkQUbIeS6F/DtG1exHa+lblapK9UWh1GztHD+ulwAmAWIZejLroZyJ5DVL9e
 Bk3PC9drLLY3IJiZ1dFGYZtRo1PD+V6VkWgmaNy1NgHYLQ78TkGzmVDxLT27E1ZnbnX2JmFCpEQ
 +tP4cWnT0GnacKcQrc6FFwQ+fDrb9n1finfpyG7+wWoxRiSXJwTIPBMB4SubeKa4lpy6tCDJ+Nd
 Riup904sW9HzeD8CceQ==
X-Proofpoint-GUID: vtlLAwCZKEtAuq6puk0yC0_ObWcyq2yB
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a9523e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ljULaDYbSg_dSHWjUBoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vtlLAwCZKEtAuq6puk0yC0_ObWcyq2yB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_095202_656365_E289A701 
X-CRM114-Status: GOOD (  26.55  )
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
index be2e6ed0e744c23939491717a060d3a8456c842b..e732427e2a975585ec873a5240ab92e3a4cf187f 100644
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
@@ -1049,8 +1016,6 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
 			return ret;
 	}
 
-	gpiochip_machine_hog_lines(gc);
-
 	return 0;
 }
 
@@ -4584,42 +4549,6 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
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


