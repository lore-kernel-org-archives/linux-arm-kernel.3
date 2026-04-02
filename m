Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03D2D3943B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QP3yia4CdU5PX7yrF+zFl8JFATM5bcCf24XnEBdAEY=; b=Seo9LIapiixkMWik+QxlAoou07
	G+j7Aj8v2Sd0Wv3hlYHc+MqCJEVwNRTqNduG0iAK4VEZBS9kRBwf+N6W9bvBFhTtLty15cbG7BXoC
	/HQ6SE2/zrbKJn0liuDTHNNNqhVwNWGAyn2eIzgyHdD6sFLtUOGUzoSBJChVQUjZpdEF5e1uGd+6t
	ogkY5FfcumsvdoZVJPrxXKJXeuGARJNEgsH1dBxkXw7GWWsXcTxavmyBmXZTkOZOMu3THxwn3o90N
	5tN6B51xC+Fq3kw9RbnUoHa8GHzJmHmhpiMkLmbGeKEaQeGYdSsMkaMegNCoqnw1FsTYUb2RfmIGI
	v86xBrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JGj-00000000Mnu-2z0c;
	Thu, 02 Apr 2026 14:43:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JGh-00000000MnN-0bBO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:43:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CCf7k3956485
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QP3yia4CdU5PX7yrF+zFl8JFATM5bcCf24XnEBdAEY=; b=ZJ9HwgEw3XRIYWXB
	5Dy0Wpj5dn+FGEp441qjsC2bPEzYqQzvcRCFp2TTSuP68RwkhbqNAvZA70PHDvBn
	eGfBeQet+Z0Kx/hasgTcjeAiMJJ+ftCYY+DPISLN1C+Q9ZW5iEsZyC84njmCX+Oj
	iaoD50pu+JIiNtP0wZ/1d2ZoF/2uLPBzdcwRYXzLCx/oPNfikHn9kkWNiQjWJV0l
	uyOtjlLm+YMd18I/aO+OQxhGwl9Q09DcsODECgPhtYTgFobVJrD1TmEgdkfnF3eP
	9WBPqvQKDx9EN2qdHhDxjj4wswEx9iRpmMsoVcqWL66sxbvfDYC87b/Z9xC3ODHD
	1Jgv+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5km6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:15:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so3114071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139321; x=1775744121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QP3yia4CdU5PX7yrF+zFl8JFATM5bcCf24XnEBdAEY=;
        b=ji/YmeemZRX8gjdOohuHyWhNEzTnZkClhWw6vl5cQ8zx+HI2UjZg7Hro4qrklftzzU
         9P6tPqD7RpV8GM57Z5tw/dNRC13RLPeKwLyPFihP67hEJmnQz6B2KN+aPyYLXwRhSBE7
         lbZr5j2AlGP8zxCoyDQtIj6Y0BA+dcJ8yTnHl+gg6pJjNUsMTXus3ODwqFR5DIaPS4uo
         M1u11IMlsZft7cjqpPhj+flOnr8GCdpDJ2IaTYw78gJHyombGsTEvgUq2eOcTNbePbcI
         fu97SQOBNaz80c0lzVa7m7DmyBpV7QASNlb+iVXrp940YeB4Vj3LH2oLAaCxt9SGPP4s
         cvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139321; x=1775744121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QP3yia4CdU5PX7yrF+zFl8JFATM5bcCf24XnEBdAEY=;
        b=qgwi/PGQL1iCFeEmVHbtG9lG1ITReLicvNa30swWWVe3x/4jg/f4T2pUblJMF5ls3R
         lhC7RU1UIntO8EZ8OyDbvble/K6pcIHWqn9+ulKuQcMUaeJ6Wh8Eg82fUfdSHhw2hwoH
         YInpQmeyy3C9xnnpLLgQ+5kmHmfF/bRzfzW2AmzV0jj3WaRl1KxXiEZjPCzs5PlltFFM
         UCHzlgkevuxPbdMB7rDppM5z/Z9OimNGJ1VR5QaBhq5FaR3KPF0g7PEwyhEHRL7t1uay
         H9IjT5KJNa1YkSflufrZfbZvpB4Ka5fRiTlnTpqZErl7izTk26bUFZfT/pXy21iiSIgj
         Y4+w==
X-Forwarded-Encrypted: i=1; AJvYcCX4WbR+eScr2hSDn6JU0vzaktzCzJJXxrPJCsQ85b8xuIB55GcL0ypLTXLu5QAM8G54zDcZRgvsAVqdO2+Ybiju@lists.infradead.org
X-Gm-Message-State: AOJu0YwCOwd53v58VXQUfWRgWnYymf10aE2TVkeKxcU/oqNXQlpBzE+b
	ZJoFjnCY6gEj8/Nu5tEX3rY336g1HLoUDEaYM0KqzJ2qW391VLzsfZN9fdahT4eEEDr3U4w8bO5
	fhTYNmiUm6bXy49ohFWYyy9aZEsThI7uWQgHxjCtkhDCVn4kOyt9Q/jhvadAQa6+7p4ogPH3ubd
	BpHw==
X-Gm-Gg: ATEYQzw0m5X775mTSjsLuU6cf6fcOuhUx0SPXfnyhLQ+j13H31ivJg5wUYOKJB1u/qw
	0SHrHGkZ9UFVhsH9AjO2w9gGMroZGVMOu20+dNwo+obw3Vr8beYw9SU/E26893K27bu+L1htwP8
	RxX8NHKCiB6qsGSu1fRNNUYXAr3FeLQXwX/sLMoYNtyF957mzLOewxhQcBAlF0YJbJSAgehonkt
	7S9j5uxZd1Rk+mQ8L4rOedijtCBUBv/oXImzyQlLL9r39jWmz6slJXIqDYAo/QtOQ7g/3pnr1m8
	QP+JTXXwPxrA07KdTQ8vZEfFtKjTDrbXYeId9VCbSWhGGgAY6ESwSxauRFdayauIQx/jManZZzM
	0gQpt5RSCTeqLbYEbViqcJsd0jTXDXqlgjYCkpzQmP9u/qteZNIAW
X-Received: by 2002:a05:622a:e:b0:50b:893f:7d89 with SMTP id d75a77b69052e-50d4fcf5467mr29566581cf.36.1775139320152;
        Thu, 02 Apr 2026 07:15:20 -0700 (PDT)
X-Received: by 2002:a05:622a:e:b0:50b:893f:7d89 with SMTP id d75a77b69052e-50d4fcf5467mr29564051cf.36.1775139318611;
        Thu, 02 Apr 2026 07:15:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:15:02 +0200
Subject: [PATCH v5 1/4] kernel: ksysfs: initialize kernel_kobj earlier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-nokia770-gpio-swnodes-v5-1-d730db3dd299@oss.qualcomm.com>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2976;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=biv+GH+fROKOSl4fjZqd21aT3c4FLHEhSXzFKMuT8pQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnu7om+n7+rbJOz3z08q9B8Y3FEV7dYeTCln
 OZLROiB7lWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac557gAKCRAFnS7L/zaE
 w+WKEACdYAfS2DGORcLixPHvLig3V48ch0qzhA4/SOrOeb8/L90oRYwHpVF3FIN8XJzcj+sXrqR
 mlvTnt8vY4kXOYEKWN8M9ozIXntN3nD5cBV970wYhYxNEddy/g6xcFc2D7MLu/vKNsU18jaLRG2
 uUqYfq1288iNrwpEa20YD8fdUsTj68e4RHXkBiG1F0WsNOEx4fJJGeAbiQkB26B09EfDCSkvZxx
 ItkmsL/OjanSVB+1Wad3WZWFE5g8Dwx6PbqCZXp8oja4Xrpo7opxeKIF1dr5YFMwKvCjlZR9TvQ
 332efEH7bJT0Tov0H/xOSgTKMOezKuVG+EN+cODZ+CsZrOSyCtMYBENElpyfAf9vV8SB60tGFGa
 BpJ2VG/WASYT54LNTh+sopX5OYCnYlCEDRZFIlatE6Y4WgPGovNHUKI8I0R2e+RUME1wSggR6p/
 HTLsIgc8Fq1kTvZL3ep+ygvuwb7eV0fBtv2KR0Hsb4gTnePyZSnwVeFxfCR4Zi2HIWAE1OZKOBP
 mkH6cVwt35lSDpumJverYjHAkR7wJRlqMZemeZDsWnjW8+NU3920MVWAUGAJ0MbCHUAqTVuYIL9
 GLLpdx7e48FFJh6X8e8ShyK6edBvSrsYGdzeN/5jZcUgZ+LBlWFgWWQN0SDMd1lC0xe6hL+gyz5
 LMEtq/0VCF+he0g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce79f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=cUGsBi5UaGteNmT5bNcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: elYAwmBClKHsNro7KcRwnVWiQvj8ji0x
X-Proofpoint-ORIG-GUID: elYAwmBClKHsNro7KcRwnVWiQvj8ji0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOSBTYWx0ZWRfXyqsafei7DPNl
 XTU7RN3TbLcIaDh/EK0u1M/3vvPm2x+K5vv3o2tOJC3hprQASG47Xx0DJOJzOABDr7W0bKLcLtC
 EpoNd5grR2Do6Qrvh/3X9lza1+V7l6FTRdmplZ4aVVjuGLTHiFAC4hI5sFUbwdQx1It//rn664p
 +EnfEvNMVhscG0MSStSks7hWO9gaEW2/OqwFEZyWaWeCUVLpWgbS0IC8ZHSSQ74Jp0xM8iCuC+y
 1ejfIy9mK5cstobBkt889oINwOErDwhxGpe3010GJGKK7/jLGgXZuPJFxj0rIuRHtZMsgiJxsq/
 Xq0LNcYKXQRsN25P5U5zz6O6XyPKlvc6s3aLW3Tiq7oKIS3u6ZnN8oSfoHmnNq8cSAfIG+7yqto
 TC0fwKHXHFSree4MWQI2qLkTyxRqs11OoLrZHaQ6vQXcPu20vnVXsKuLB9qd7tNKd/5s0cCkX0o
 ykfhs43hZ8f1yBtyvXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_074335_304621_8AAC980F 
X-CRM114-Status: GOOD (  21.80  )
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

Software nodes depend on kernel_kobj which is initialized pretty late
into the boot process - as a core_initcall(). Ahead of moving the
software node initialization to driver_init() we must first make
kernel_kobj available before it.

Make ksysfs_init() visible in a new header - ksysfs.h - and call it in
do_basic_setup() right before driver_init().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS            | 1 +
 include/linux/ksysfs.h | 8 ++++++++
 init/main.c            | 2 ++
 kernel/ksysfs.c        | 9 ++++-----
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f258aeeacba184d2025b932d90280cf2aabf4b0..8bc934162e712cf8ddf033e53bf3481054cfb7fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7843,6 +7843,7 @@ F:	include/linux/debugfs.h
 F:	include/linux/device.h
 F:	include/linux/fwnode.h
 F:	include/linux/kobj*
+F:	include/linux/ksysfs.h
 F:	include/linux/property.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
diff --git a/include/linux/ksysfs.h b/include/linux/ksysfs.h
new file mode 100644
index 0000000000000000000000000000000000000000..c7dc6e18f28e8a12a66d64ffffb13749d424a881
--- /dev/null
+++ b/include/linux/ksysfs.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _KSYSFS_H_
+#define _KSYSFS_H_
+
+void ksysfs_init(void);
+
+#endif /* _KSYSFS_H_ */
diff --git a/init/main.c b/init/main.c
index 8b7633b7ab720b9c13a231d64291d35d3852602c..96f93bb06c49013bae8d3d6b7afca13d6277a868 100644
--- a/init/main.c
+++ b/init/main.c
@@ -36,6 +36,7 @@
 #include <linux/kmod.h>
 #include <linux/kprobes.h>
 #include <linux/kmsan.h>
+#include <linux/ksysfs.h>
 #include <linux/vmalloc.h>
 #include <linux/kernel_stat.h>
 #include <linux/start_kernel.h>
@@ -1482,6 +1483,7 @@ static void __init do_initcalls(void)
 static void __init do_basic_setup(void)
 {
 	cpuset_init_smp();
+	ksysfs_init();
 	driver_init();
 	init_irq_proc();
 	do_ctors();
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index a9e6354d9e2579317d3b1bcb54223432d3ce0950..f45ade718054af4eb72fba88dab10c86287986ee 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -8,6 +8,7 @@
 
 #include <asm/byteorder.h>
 #include <linux/kobject.h>
+#include <linux/ksysfs.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/export.h>
@@ -213,7 +214,7 @@ static const struct attribute_group kernel_attr_group = {
 	.attrs = kernel_attrs,
 };
 
-static int __init ksysfs_init(void)
+void __init ksysfs_init(void)
 {
 	int error;
 
@@ -234,14 +235,12 @@ static int __init ksysfs_init(void)
 			goto group_exit;
 	}
 
-	return 0;
+	return;
 
 group_exit:
 	sysfs_remove_group(kernel_kobj, &kernel_attr_group);
 kset_exit:
 	kobject_put(kernel_kobj);
 exit:
-	return error;
+	pr_err("failed to initialize the kernel kobject: %d\n", error);
 }
-
-core_initcall(ksysfs_init);

-- 
2.47.3


