Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6DFD39426
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wES8wcKZ1pvEl/GAGqGsZxc6MwZbf2WUlgbApncZLUs=; b=iNo0hRJJ7tJkWxeNqxZqSZLHoe
	Yeww6ZLQ+cR9Bk6rrNPD2ksZ7lR9P+P9uZduk7ni3/m1gzSHuIev6rzYg3o+nJ6vO+mJ+Xhe/i9S/
	yWZ5nC53z1Mo+yX1SrwfcjyigpmACopViIPvvN6c8LwVuCcQupLh/sR8Aj7IlfbqRtg5xCkn5fchd
	QTvLEBmMs4C9CEbHrLcmFYApTz851En4avNRr5r8FfbekqWVxEg9d4fSSSSuBF+uoZDx2Elo+f0YY
	Zm5/0fopmVvYp0NoKD75l+jVZLmUbLqT7mRQa5JHr6soTPYScIra4aJSnyo+KsJK79ZVcnZIHFZv2
	Jl1jV9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Iqf-00000000IvU-2ghz;
	Thu, 02 Apr 2026 14:16:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Iqd-00000000It1-49j7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wES8wcKZ1pvEl/GAGqGsZxc6MwZbf2WUlgbApncZLUs=; b=hGd6IwJKEdbBpMDWPcjZ0MGIRJ
	C0hOvK4vMwq1FBFVnGVKti75BuOdJnpK1NQkWse07WWjtmV22RQfcpnMlNZPj0Xjhb4I7tbnYAKSO
	aCcGvzhkd3X9sbxKtKX/pvtFsx+HDciKEOz5dFAOA17JsOaXCEjIxIm5Rmbw6OVVqiSiBWRvw4Kg3
	SZwb0+6R2P6VWE3bNjy3Pt2uQq5T2BZVmOYtymX++k5Owzbg2bu/bgLlwJBiIyPaitevnNCnNkzs8
	AihRCAUPoiVIcYa4Sr0uIi+feTqex+UmFmRQa5146YhBKTexx2bLdt8QDYSpnUkXnYWGhPT5YbouF
	n1ai0fKQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Iqa-00000002eZF-2fnT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:16:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BWQvM949610
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wES8wcKZ1pvEl/GAGqGsZxc6MwZbf2WUlgbApncZLUs=; b=jv3WMqmFBff5n/3D
	p2Q4nbtgyH7nrv5A28lD+FTh32DfaAjYQfVtWjy/XIWhE3JRLMEnijm/ei4Bj5rh
	KvckIv1qIpteRNPmKWmeBghWcVyUw/ccZE0OdZ4mhMN3p2hCsfKxJj7GsLAZaa95
	Jd0HLcyHDy1CNPKgQzR3YFGq9gFir+g1xxfsGNqrdI+fZINbYfHFqqjulNSPwHfb
	/LDLzCjZ424Jf1kaxV/+iRqX3M/ZK8mVnoKZEtkE6m9S3LjIq1aNxYN/g4NzOlz+
	r5p289hpQSq0k1knzA9gfQj8xYJp7mA+ldH5icZ3f70VOdC8bo0307DZ2Er+DOAk
	9prNJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9qnu0pb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:16:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso36448781cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139391; x=1775744191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wES8wcKZ1pvEl/GAGqGsZxc6MwZbf2WUlgbApncZLUs=;
        b=ByXgUc9WGUo5jG41rpR4HqcQTc5URB5XBBgQ8jiy+s2bV0bu1LY5l/IwosI/5OTuLr
         ear17oe23Aa/7dbm14AiDaThSEbDxHtQTSswlDFZGH8Ow0QenSKLueT/rpbLiR3yLkN+
         +mTaX1U8WJeb4YXCbQkXjXxuZxLLU0zrGZzglwZ9OF2l9KcRz71IHc+X0A12yB62Yw6U
         L9Ry1oqN5UzZ2iG3EAqhbtA87dRbVKtZPSWOM2rlvQlJDg5bMjj/ZcI6x6gUH2lyDzOM
         /4EAK+yKh07ZMssBl0huTFS+sHCsADvo/hh/OPZEXcXI8YEQrB+TlXzGFo4gC1lM3v0R
         Wf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139391; x=1775744191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wES8wcKZ1pvEl/GAGqGsZxc6MwZbf2WUlgbApncZLUs=;
        b=NiInoap8bhyKQ8wH7rujPWfICE3D23sMasiSgrJRS07FzQiZmc5dakB5EjjVVO5x1d
         hPKHAXg1jdwRFmMsflcypfjlPwawq8ExE0qd8TU64fu+Y2j3uGWIqTEzICTOB2RDvJKa
         CeXMGHCOy4Na71+8UDmnm6o29FuoImn4hWcLXjmSEvrer41OLyv4gxUkeMXVpUi+J9Qe
         EK26sERN9dU6ogPm94HCgbmEwRYngu8RHwMlUcsJa5toT7iLDoa77Zt4N9rEfnOfIADB
         MKOhj9IeCdlmZI/ccpF4IHyWc28PpWZTcfEkyisMBHUJK6NaLF/XGPLVKvS6zr6R+fxr
         1IxA==
X-Forwarded-Encrypted: i=1; AJvYcCWATE6Ara0mGoIaHaoxXe4gIGSAqIb54FvCQjkt94GCSEHiXYtsERTiuCnZDQz4KHdUCci1T9n2xDRcRprsX4M0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx724UEiLJhnwhoketaUKtwi//u6OWUd4TWI76l/q3pTQ2O3Mks
	hXOvGmvh9kp7Gliim7zYmccfYVxpQQb82LfTeClo8j9L0Mru0mgcuYNqkonvhcCugYD1Ex8Hj+0
	JJ4cJuZ6bBFzfmSCLvEHfMhqPf0pMYPJhWwus/vx9WdVWJbpkAjzwIN5aAUlfB679K46eCoU6IM
	IqIQ==
X-Gm-Gg: ATEYQzxGrUrwEWTr33M5ag0/F20bzw0f7RY7FqaOgHRLoTG8xXvR9seuIluy4j86CMl
	BZFzgVaZxo3ooxQPRPjxzmALkFKwq2httw1JdPHQumrMT3SpSqFtJ8XvrzH6r2veBpHe4hk7g18
	wEGFBpvE32FAFhaIgkNhdLByBOljXMgMmJzxIwExjfxaG1NyCD0RdO6sHF3Qe0g6lg3QdTpnSrp
	cmDsfembMM/8LqBLv0kvGGnT0vjOQaPTvTG6HmPZWSLSx/NUh0Cl7L9bLF9mMxGeVYFoCYbej1P
	apIvNZRU9ShhagO0eImFO3G973t/60x6J+vbbgjH9ObjhInsorh8bMtQbMLo8G6Bbvv+RT6KPtt
	dFJA6zsomF1emFoEdrVUBM8YZ1H0udtbSifSMAuaSbp/21Am///N5
X-Received: by 2002:a05:622a:1648:b0:50b:7d38:9453 with SMTP id d75a77b69052e-50d3bc8d065mr106378021cf.39.1775139342876;
        Thu, 02 Apr 2026 07:15:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1648:b0:50b:7d38:9453 with SMTP id d75a77b69052e-50d3bc8d065mr106332871cf.39.1775139322170;
        Thu, 02 Apr 2026 07:15:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:15:04 +0200
Subject: [PATCH v5 3/4] driver core: make software nodes available earlier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-nokia770-gpio-swnodes-v5-3-d730db3dd299@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LCXTRWIgG/99GVhp8MFYkc06vlJUWv5VfMB08f8sFao=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnwjyviMXX92bx3A1RXtxXU4Yu4V8IwHdYnS
 LameZPSOhGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac558AAKCRAFnS7L/zaE
 w833EACzWlKbqVGcfZAhKjZPDmJLE3XoLYXCIx6/AmX6i/x38OUku4A8Hy5Vu6BnJmTohfTi3l6
 ICdFhU7cVmlDO7NZtv4bBQokXVA3qUHb6ucwParLHw4jS6OPQrClb9B/GM91u20GomjJJOeKJtr
 a6E4/Rd2atvM8Q4nD+Q/V8fg3p1O3AOoJ+OeSZQa5JD4/7GzGHVErq06oN/Lh9g2so7xlUv0Hlk
 1mt5+BUNingwKzQ7YP1d04QJLigehOSy+bOpAvPwUsBiAzwRhFB4UJmgxrhXCUekYXxDNQlbj58
 wv50XhJTMr1sJpYVLAnJeXIgpuW376dd74Qa+ixJZXo+5ov/0scoZV9lATu7VCGPm7JNJ8J0cOG
 xN0eUm2khXwnOVfXlM0JYIbDg05TMFeHJzcvlNl4vATbxBudv4YHGgvAkyPeRyhUTcdBoNeTfK5
 sopWdebg5X8SzCgGQMTBzhK04LSrxiHZJeucP0zYrwAr7JAy/y2FI9/AfWTnc5RYOartdhkdCLL
 f2JrVcdSLAaMToMNOHZ4IZZddi4+nQTcg+/9OWnYESTHZ1sIgnTJxDuA2eSeJP6p3syatFohtfm
 BsLzPKbFSQBNnOw5sF2wGIz4DDXMqcrv1XY86Y1X/LEm7kA0uxNj6scB3+QtLzDjjbqTOe7RBIt
 LjjR/jmjXCsDhcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: _0rtZ32qVzQFEXErYocotYJ5tletKVwQ
X-Proofpoint-GUID: _0rtZ32qVzQFEXErYocotYJ5tletKVwQ
X-Authority-Analysis: v=2.4 cv=RoLI7SmK c=1 sm=1 tr=0 ts=69ce7a40 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=XRX4SzNu4mOsujJFFI4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOSBTYWx0ZWRfX0kvr46xKnkch
 6XszBwJGax9XujAdLARYCvtluLRneAMXv3BZY4jI7g1Jom27lHFryWvruGq+N5R/N8oscq3DObV
 X0fGbaxVLSOtwLLcl/Yof7mKlRmfHbbOXZ+0BhMXsQu6MeLWS6ni86AoUsgNl9f2WWXp+j6228k
 d3kNnsH3oUGt2BBxrSFatnUzRHT+7PfYkRt+z2pUm2lybV+hLZAnjj3Psbk1BNGR5Ad1RpoItaz
 XQ0VqCpu3nbLYw+u1x6w/ZDGLpLnfJv8OWmkKC4s/OxxQmzdbZliQJh/QB/2/whdRF0DI4hSVCc
 E+GuRpw0BJAgvd2nTz3fG6v3+fwr8VSxpPx1fmGkcamf1nQYrCchsEkXkTy9vvrkj1vQyuRVw21
 44c2oh2FQ2AjRn4tvtzaIjvzlBmT37Ug35kv/bdCwVoJzWLiybGVfq0GtOwnrIXjRZ9X3FfwBV2
 D/cohFl17PDwR18eGqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_151637_133478_4AA37F5D 
X-CRM114-Status: GOOD (  15.32  )
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

Software nodes are currently initialized in a function registered as
a postcore_initcall(). However, some devices may want to register
software nodes earlier than that (or also in a postcore_initcall() where
they're at the merci of the link order). Move the initialization to
driver_init() making swnode available much earlier as well as making
their initialization time deterministic.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/base.h   | 1 +
 drivers/base/init.c   | 1 +
 drivers/base/swnode.c | 6 ++----
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index afeda89fd4710c4c5492b5f19134e2aa8e1e581e..30b416588617bbc3fb433654c999c9b533d73752 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -312,6 +312,7 @@ static inline int devtmpfs_create_node(struct device *dev) { return 0; }
 static inline int devtmpfs_delete_node(struct device *dev) { return 0; }
 #endif
 
+void software_node_init(void);
 void software_node_notify(struct device *dev);
 void software_node_notify_remove(struct device *dev);
 
diff --git a/drivers/base/init.c b/drivers/base/init.c
index 9d2b06d65dfc6bf8759f6c232e2d3f753da139ac..af8014416c2460fac91b08ce919c082bf961fcce 100644
--- a/drivers/base/init.c
+++ b/drivers/base/init.c
@@ -34,6 +34,7 @@ void __init driver_init(void)
 	 */
 	faux_bus_init();
 	of_core_init();
+	software_node_init();
 	platform_bus_init();
 	auxiliary_bus_init();
 	memory_dev_init();
diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 26cbe1c2a2e043a2315764085207561069c23ccd..a80575bf598b509eb1469cae8a09c601726ce0c8 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1127,11 +1127,9 @@ void software_node_notify_remove(struct device *dev)
 	}
 }
 
-static int __init software_node_init(void)
+void __init software_node_init(void)
 {
 	swnode_kset = kset_create_and_add("software_nodes", NULL, kernel_kobj);
 	if (!swnode_kset)
-		return -ENOMEM;
-	return 0;
+		pr_err("failed to register software nodes\n");
 }
-postcore_initcall(software_node_init);

-- 
2.47.3


