Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F52110D14AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opfaxOPhT6iAK402N9SQHjFMmnwGP8bV8DD5Qr7SvFM=; b=wE/Xw5wMJ7CnkY1PAVOnYNhQ42
	DRKrUKF13t/ufqwZSN/15ZXDmF8/KXU0wf+v4wBYxE90U+O1FvevaVJLnTJILM3FAph5dQLRxXVKW
	J0lf1OyzfEA0f0JX3UrAC38x9JGytlIHT4ds8Gdn/VBzltcWJ0TDVWRcSKm6/fDJSGkjSk5ZxDd4U
	/Y1hINguAnIPkp4LyZ8ywL3sYvmf7J4FDn01VaDvjX7lDM5oVoVIC9C6IPIkSdyuj77VmvLD5Ahfg
	ZhFp18FryvDYVBtqk5LSC/BHOh6eUT2WeDEbvnJZEpmUL6d2pa0EuhagS7ysGmqSTZ+k20mj5uMnb
	hiPeAkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bvc-0000000BH7U-0MkJ;
	Mon, 30 Mar 2026 12:41:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BvW-0000000BH5z-3Nvv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:41:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UBZbGh4013544
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 12:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	opfaxOPhT6iAK402N9SQHjFMmnwGP8bV8DD5Qr7SvFM=; b=TaGPeOVrGR9zBgAD
	nstkMpeQuy/3ZwmqZiD2EHTWs+/Ub6gGDHdwcs+Lz4sEaMZhbabQ3yBVe106p2zy
	vZ//VJlc9jU/nwKsZIOWeRLatPCZTBj5j7N20ICgVYFS8OYDiG4113C86OUMKWwJ
	ufogVcYrLECvo/CzTye+eemjNJTGXvkMmijtHarHcCWzP6yfPCzv/ofCa+U+o79i
	v/oFgEojvMnckzxT9PEMEJd6ScET9hS42yVJeH/rirA+8BFu1PEqhXDvVhkzqJE6
	vWFYyUnvuLm5Z54L24XDEYdHqE0hA1o/BQNShWUB2C2+vB2CnzioKpxhxI5zG2ax
	pbyLOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regr8pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 12:41:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso131502281cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774874465; x=1775479265; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opfaxOPhT6iAK402N9SQHjFMmnwGP8bV8DD5Qr7SvFM=;
        b=METKwtChVZ5X7fN90ZZi613QzgC8Iglkj8kI5ghfAGZ0OWNWhPQ0ndmrQHS+IFYq8t
         2kwLILd6BKDUS5Sfx1tkjrLQYsFvm2mWrsS0Gfvb73r/+qPFfF+DzTQXtni0X9+qOAA/
         DwoRztQxeH8e7NgWsxqKQUOqI3w52zGzu5TR2MlnI21ERfUm4hS/c1dq6PPhoQ+BKv2+
         5tonmhnXadQv7DVOzazP/Ab25c9J+Ncyv+C/5HqKVU8mlQU2/rlDE+DGV5RTuuQ3XVSq
         QsToGa0INvfFWOwH5sRW9eBIu0oc761Kb0EzcYA5JipvTT8D0BZQSHVbKwoE0BXI3NaD
         JnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774874465; x=1775479265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=opfaxOPhT6iAK402N9SQHjFMmnwGP8bV8DD5Qr7SvFM=;
        b=n7R9RSnyXYpOuE3B4qVtld7UJFEwC+e3WVvaWujWPVYejwo4jwwzh62aeTx3mSPz8Y
         X+uwPZyKtqdBGoiRm0ztoNYKUFfgGovNGCxENgTHBqX6EosyyFyQIvmS+UGG1aAeWLpp
         ZrCwifWva+a+Kniziy/sxTTmImNPJb0KUkYTS9nq1TITFYUtxjHLP1Ql1KHGD0CX0AP9
         w/hu+bVY6n4SOgQoZBcHgg5FZRAKUChciRNtBanPoImC9Re2VEZkHqc/PfIj6buXghbX
         HXIU+TiaZcjum693Z6Rkrq9lTs+yRtBo9pVDz3BGz2PbekIfL70KJSjQqEc6i2WKIzlk
         xWKA==
X-Forwarded-Encrypted: i=1; AJvYcCXpZ5m3IrnCb71uaD+aOoKIGfM5z3bmGuhHpgjnbs5Z4v4gtBgO6U33h44922GaXYZq2oh2ZY+XdxTws/i9ShaW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7A/6XZQ+mFRMPXYiI/CJEkP25OkZv5YYmb4+bRKh8YzXaMtFa
	FdhaWSwovZl0h9F/7FWwfqZgJ06R+zltsFpYkdWNwV1QoWA567zxu6HrdcjRHIjxhukhZGXKv24
	gBuSkTaDiFFIORA1+sQtLFNRYOjxbmTPNfg+q94fMhTvNytQyvpuR6ho04wGiW3vMAtIyzZqK41
	NYAw==
X-Gm-Gg: ATEYQzwKCmDGNofYSV9cmycQmWisQmj3tv0ArH4doFieKw7XhRIzfAkcl8W3bpYUpNI
	nrc4Qhw4UQvVWMTpwZFFYi3AKkgG5Tj2VGqigJKdYOQ0yu6BW08S14vhaqHL3FD8mHeaHr3Len9
	iSP8cG0gBNr2aoSey4p5pzoIyAaTfnIzZSdyoMgwiVcZ5G4+AAc/JF3ACEZ7w9aPCa0Hzq9iCch
	3DhC+2wC2pVoc8be/Q3NUYaMtDtMOn8T/zU/g1SfIJQ/vhM8c+tpZBifwbSSZR6/JMWKNaQn6E3
	peCcZSzIS0zsFlhswaZKa2moS/QZerbTGfpUYm5mOwk8uR0WiXosb2nSupBhn0K1vyY0tkNtvv6
	zf6Q60gPFu5WZSxEsnKmBDYUbDtdjZEJF7gNCmd3i2z2OaxATIntd
X-Received: by 2002:a05:622a:4807:b0:50b:3a6d:db5f with SMTP id d75a77b69052e-50ba39bae92mr157209341cf.64.1774874465193;
        Mon, 30 Mar 2026 05:41:05 -0700 (PDT)
X-Received: by 2002:a05:622a:4807:b0:50b:3a6d:db5f with SMTP id d75a77b69052e-50ba39bae92mr157208621cf.64.1774874464360;
        Mon, 30 Mar 2026 05:41:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:e931:8d81:9955:76ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm19576153f8f.30.2026.03.30.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:41:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 14:40:47 +0200
Subject: [PATCH v4 2/3] driver core: make software nodes available earlier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
In-Reply-To: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2409;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gJwyjiXRCnugGv/qc4veSv3kjlfeyPx7bWEjN+IOvTI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpym9XXiSQyC7OynNfgLxf03QB4HoghAslTf5Kn
 jeVOS7U8YOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacpvVwAKCRAFnS7L/zaE
 w6QpD/9XIROG3IAgmmHH1FUKBarIpLInEIqyvgVn4+D5u9EYIZqOmm8qK28LuCy2r+XGYofsJmr
 HBMDO98ZjZHo8YCEoD61fK+414ewpgTeAIn8pEsxv/zTAHrbFRiAuizAdCtTDBUnDpRXZGtHdYi
 N354SgY3nGnp1nVldydHpYHbsoGi8gDzOhedaKxKM+S0sYpGaTFaEQdpFlkRIKgRY+vShICU/gz
 ANsxjc85EB5iYpuQail204re8lL67/AmfUOOwVxyeZeTuMXqY+w8qcfjj9IT7FFDSogeeqnKdR3
 dX8WHQDSAOZPFgoUFVVndqOy251BMcBHpMdGlszmE/2IM+dBo/5cPm2OdQYvuVeGVKdJYFzlo6O
 +AFEYhpFuIPn5UIDvoaHr2dXxVgx3WQHRo/LXScWe7n9qokYokPHxWJ+bVp358tqhekgpeRJVIo
 qsg6D7m9aDt9PmPsYy5vuAdaa4NKH8oJimvi68NcJCg3P7xvk5alF94cWBc9rGNyv6CxXLVo3zW
 duLeuK2AZgBWp3CUpkNKBcr90rswv70jRDFpI9kcQweSe/wLdlwXCkrosciwDkGLAbeufagU6q+
 h7G57YM53sWxGuXvtwSkiobFnUQAnLyvQMowiIKJg8PSWgbqZ5CBebTrT+zwfiy0dpsU7p8chvf
 L/eWTFVN7jTl1WQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69ca6f62 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=XRX4SzNu4mOsujJFFI4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5OSBTYWx0ZWRfX/5Ksdk/G/ggV
 cYE9rHCiHUCJGwYBhqZUGasdr7VGzVM88rcJLOQF603m8JpNontw98gTP3tAfUvdaWAYfz+palO
 5Nchz7/5k9Vpkfw6FMl/MA0k8AlJpu/GDRIsKSDMyUOxkmg3UIjWxZgLJ8GrZ7kAia0yYmvzpjV
 Q6EkFTIYa6I3hBZoEGfNVYDan3kiFTz9H5IagkXJGy0ZXeqw7BOsUgqJ4CsNsTyXTHScMQfgSAv
 c1iT2V5DdRQ6t6H8SUt7CFul+XVR8uxIrOOKS/RiiaHYAOVdG38oPIs+llg5kizrxJaxIUI/ve5
 T8X7gGyqbDLUQqf9VyoKg6jdlYaZH3ur8tbRW8pdMv0CPqCmZthPS4jC/OgOJI7yXmoz/V1ZqJS
 Al2cmJoZuI7Hss48gRZJARSqbp0kuGi4Fvkmik0vvSxYvBRJ3AAw8N4H6RUq+vbUn+ultu+F2Qs
 BRzA61cAWr0MbL7+JdA==
X-Proofpoint-ORIG-GUID: xtlS9El8sYR7uKMiwP6Fnn44MAlReuB8
X-Proofpoint-GUID: xtlS9El8sYR7uKMiwP6Fnn44MAlReuB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_054106_857706_4A23FD59 
X-CRM114-Status: GOOD (  16.33  )
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
 drivers/base/base.h   |  1 +
 drivers/base/init.c   |  1 +
 drivers/base/swnode.c | 13 ++-----------
 3 files changed, 4 insertions(+), 11 deletions(-)

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
index 51320837f3a9f1bf4f65aa161d9b941affc74936..a80575bf598b509eb1469cae8a09c601726ce0c8 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1127,18 +1127,9 @@ void software_node_notify_remove(struct device *dev)
 	}
 }
 
-static int __init software_node_init(void)
+void __init software_node_init(void)
 {
 	swnode_kset = kset_create_and_add("software_nodes", NULL, kernel_kobj);
 	if (!swnode_kset)
-		return -ENOMEM;
-	return 0;
-}
-postcore_initcall(software_node_init);
-
-static void __exit software_node_exit(void)
-{
-	ida_destroy(&swnode_root_ids);
-	kset_unregister(swnode_kset);
+		pr_err("failed to register software nodes\n");
 }
-__exitcall(software_node_exit);

-- 
2.47.3


