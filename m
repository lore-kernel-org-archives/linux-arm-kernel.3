Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9676CFF494F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e448+MMxh+/7H+vtw0PBLnj/+MwlVFLeTPvEog6+haY=; b=ovR06iTJPpNM8/DdsfY4RLwF/U
	9/KgBm8sGgimnbOErl7wnSCCqCavg1PkmBUicrZg5J8bEro+o2J/m7ygfrGl+7YU20S4RWalMLv5n
	zEbKssJv/QvGo0cz+qtBKmjg+W/Pf9EYLQpENq4irH/3cVJrWsgrSmQzF6+kzHicZe7dbx4qpeeao
	2C3KsPMYl5FkQqcm2+wuXX1FLp/nIZl5DyE+3IwwCQgJ4BMGnQ1qJKh0x+Jmw3KtaBZ7KTBlnoLbj
	ZeHvKEeR1SqhQXTI48xdyCknwikV60lyDXnQGUWs8xEpaZAxwCbB50OKcNmPaRA03iKGAelkVJdqc
	FaISIEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bvo-0000000BHDX-2sWb;
	Mon, 30 Mar 2026 12:41:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bvb-0000000BH7J-2nBc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 12:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=e448+MMxh+/7H+vtw0PBLnj/+MwlVFLeTPvEog6+haY=; b=XC9xuM7uVVeoGDMkfAkL42M8TR
	7M5qCXUdkYUT02oJa47Tl5BLiPticMFhX/1bm1bTcWLxKz8A9pgFZnzM9SAvhUtJXZzAcLJKrMist
	9sWq134roloXWf3lz4/nYcHBorrtc8ZFaGiMCw9rnyt79txs6arqZpIzAE3ageb4V+DbxgjFPCQ/K
	WgxN8DE5mtQBeRYBxCKltAfUNjLQnxoBQ6cs6TruGLCP3q7beZT7XoOZzQKlun504uR5NPkrRIfm9
	LZXM5nymBblPD3goQtnN1DWpfeaundq19i27dAe4oDHkdyHJiRojobtoWrvi/cDpjMhaGFjjWKeVQ
	8oj9W0Pw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BvX-0000000DqNr-428Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:41:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9ELix1753671
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 12:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e448+MMxh+/7H+vtw0PBLnj/+MwlVFLeTPvEog6+haY=; b=J3xyZIR7IZGl1n2j
	KOon/2PvGrQXPrvW0hr7FhOl4Pk6qmFlI7jHpbLVmZccARTygxT9T/9pwOF09tjt
	kWQ2SHkqSbaSzhpMI/UylI8Er2gmRjuPYScIfqWx7wtg7HldWZOwP7IP9esC5n6v
	CNSQXzLKqK57ymwWjTMKH467dBmq1ARTLWRI8Lub0tXj3PRL/opFRWjW0TvFeERV
	Jf7KbpSN50eVNqGRRovSTru+ItpJA64ZsexmxpmAw4bOTSxoBMm9ihPdXTT3rekn
	60Om1QqTMOXp6xRPIptJFSQNaBhbNjAPtfNUveg7uBen9f3zYbrERQLGER4ZXP+9
	YRfhRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmmaw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 12:41:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfbbf78ca8so1061584385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774874462; x=1775479262; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e448+MMxh+/7H+vtw0PBLnj/+MwlVFLeTPvEog6+haY=;
        b=g557UNQ7LT5hUZNB5rxJEoahxedNgz/+tDFNRcVYrDaEJDX4w3gJTBelk85Hkqnr2g
         20cFv/bniq/QuY3KWTq11mLqb6YeEhHtITfDqhV6Szemuu2Vd8X6sZaLYWOM5+FXiYlH
         yHbHBdRBbPfjbQd7gD0OvEwkciU2c6tCiUwaOINFYvunM0SHp4ZhzYOgqR5Tgeh9LUxD
         osY5mA9Z9/yVZQSXrzUan+HONwQh58t6DSwmIJqm5NokG0zyyrwM2FjGP7PC0Bh/RdQC
         +kCKQgM0mCWjsnTwxKkREm4wLk/GnvT4FNsWRUVG2TjlTtspBXshDTgeMwFAAhRfDRMo
         tFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774874462; x=1775479262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e448+MMxh+/7H+vtw0PBLnj/+MwlVFLeTPvEog6+haY=;
        b=oivkCRfiOjLH7/A/1XcIFLQqBOwa9RIJLdwCWne8XMOQ8sCqgG1Ils9zFzRIDH9pJF
         lCvVPFuwnNG5kkHhDVS9914AIKNo7nHzc7sW+lskzANqioZsLQ5zPmjWgqMLT6U5GVkq
         WhMerCU8DeaSzd0goRNMG66zS0bGi0Htigh+HOPiiYnhOhdddNzRkFJwMC7Ahtm4BYBi
         5mGtu1omB5oLU/B9ZYHU8F1RQp+fR2hSzcdx72mD1nZquMmq26O2yhNTRruKTDh4/dvf
         RDeRjpPNg03MpXy9ChCL9pj+x8Vp9M3AOxa8OAwoan8Q5gl/1TmNSfU9WCfEjmtjkwoN
         9q1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpOkXNVx/o/jORCNcqqjFHuGt5hKPVbx8cQG+J94yLLqp2MZn8kv01KvJFWKqT8Gfn3HVlLDLJ51d0phpDiC43@lists.infradead.org
X-Gm-Message-State: AOJu0YwKDBoV6DxBzkat4N9453gdDGXmhYkaWG98RULHuhUahaU82ecp
	wKdobShXvctPr6TlEfI3i3OecG28xrLMJZHVreukibcRUsj3zBl3cuvFJfqzzuF9DMof10YRkyu
	Ld97O08fPujKeJsJMR++qdjsIoGz5z/tuKtzIRmlIxuPtTKFw3MHheIBBq2/vFUq9pYDWpaih9U
	6KtQ==
X-Gm-Gg: ATEYQzxX0eHtvKL91isMFP8KlfpGSzAMSEl1sY40Z8mckhaA9LnO5tEe3YVMgdBIt0v
	FpPm52xmbXgJ3lv6ugD1LajwjW4xy0fmPMQvPDKw5wETeurgbKSQrHZuA0l/8qOsFy/96rAW+sV
	DbmGfN/v9DCkO5ioBDVD4gUoSgDXcjr+5BWKA6R0KSaMbb10Xq4D0H/TRNI2vanq0vaKXBzBUA3
	727X05beqGgBWEtIrmgrYf3fARt1de79PH0hBBMGRKySnLTUBKeOM1nisKgqvAg25ed6C19DfXc
	DMEET5hto175B/K9hQFdTIMBaHmRIpzAJVS5j4xuD+tO4U8U0gK4hf3ATi9ktyDVmiKuCrm18wA
	Vlo0qx4619OruXRPfBVUExmfG2lbW19U01RqRQyPGuJu6pjUZ7mvA
X-Received: by 2002:a05:620a:4cd:b0:8d0:3c58:c7c5 with SMTP id af79cd13be357-8d03c58cb7cmr224181685a.58.1774874461798;
        Mon, 30 Mar 2026 05:41:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4cd:b0:8d0:3c58:c7c5 with SMTP id af79cd13be357-8d03c58cb7cmr224178385a.58.1774874461364;
        Mon, 30 Mar 2026 05:41:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:e931:8d81:9955:76ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm19576153f8f.30.2026.03.30.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:41:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 14:40:46 +0200
Subject: [PATCH v4 1/3] kernel: ksysfs: initialize kernel_kobj earlier
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-nokia770-gpio-swnodes-v4-1-b68592e977d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P5PymIvljl6p0WRzyDTMcM9zlkuK6HlOeCPW5+0Lkaw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpym9VDPYcvUDtQcRRyLXiSGwTCL5TtoBoMitI9
 5KEwtMyxMWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacpvVQAKCRAFnS7L/zaE
 w12lEACc3qlLfd7n/bdgg8wuL8w0hRu8DG0YSa1pHDI7Gz/2qDM8CkzS7RgvlWa2k9XnRqaQpvb
 qYlWakeZWTehD7eXQEl+Bm6pA/ZLje+dyUXLIEbTbQMiGmcJUb4X4rABtrFmCu9hx982XFNiojI
 WjdfnBWqz1ESmg7UbHCJrQqTgNEsUFD3Nr65/Fmx+RxuOCJUn/vf3fyo30+G1Sw2NX5bnXnceZR
 Zm4+KUApxI0R10dWCzZ1fEmzrGi0Et1gE3FDqN3ahC1BJ5PP4GPQqCaCRTQ1uj1Te0ApXEmK39J
 AW6qSVVVOXY+6Nj1ISo6gqwoDTgT6AsATzX6WskIW0Oqh5g/U/vX90qEyvAYOjPTy1vl77R6bXD
 6utqFHsR1vZKI7e1UEfRORFVSijqHaWoTM1DJpqtUOAhrJbrHRODBNPbarb5XIPH9oQHzS6Iwae
 i2ral9+gCb+6p2fCD2UTRMADtSpIiUx8V4dyFUVCsfAklTBjxMpgA4k98LE37uXj8ntc0WoMadP
 Bcbbp4Z8FP99OrFMBssRy10jzs8sptHkzebdUIynsjjAa5dyjq1ofMN/Sqb2947QSPJ5nyt9oZX
 pAHLUktXKQ4yg+wkDsLCKFJAUV0SZVPh0hc0tcttlTqMW8GkyC9bmRr1oF2WS8G4VH08z5VmBjC
 gMl+KvVfyvagquQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5OSBTYWx0ZWRfXy/wUKHjfXCMK
 Q/EwRcNcNo0sk9cj20vRnX15Zurr8E1H8ktU+PWV7HLBbHl0QqtDPsE3crSC8jywULz4eUfb0t/
 eQJTihsni3JvgcAR8oJX7V6hhponzHCL/mnbKDgXOK3jtl2GOC8ycgG/7HJjlqgTWN378kIP7mq
 EZBJvu7FzjdCTxOXgVew+nomCZuZUFXMCpyELgNFqfRvFtY5IgJ6upEgsE/mFs1CFJNJuyijLK+
 u3pxeFaFPN/SGGPgYCDYneYofp5IP4bL76SGRr8OydL9pvHZ89GXe1ygbO7JTr8apF87KK/LRgV
 EXj6Tu3YAMW3zfOMiroxocun4j5unLP3j9366N09ok1nXC5uSmbV07GLrw6Kl0sk26duzoTFBtC
 fDHpl15KGjaNN+IpwlMyf5LTQKHVWBhnv4KjsEsd0cr4f9VXgWqvtswhoNrZJtjBgblHnc8pLdq
 2513hdT/GiCNBuh5PsQ==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca6f5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cUGsBi5UaGteNmT5bNcA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Th1JfiXv8ol7bUzUapf0Buf4X1d8r8jj
X-Proofpoint-GUID: Th1JfiXv8ol7bUzUapf0Buf4X1d8r8jj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_134108_495228_5A2F9542 
X-CRM114-Status: GOOD (  19.07  )
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

Make ksysfs_init() visible in the kobject.h header and call it in
do_basic_setup() right before driver_init().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/kobject.h | 2 ++
 init/main.c             | 1 +
 kernel/ksysfs.c         | 8 +++-----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index c8219505a79f98bc370e52997efc8af51833cfda..71b9086621c35b7e4ef99b9d3b6707db23faf58c 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -219,4 +219,6 @@ int kobject_synth_uevent(struct kobject *kobj, const char *buf, size_t count);
 __printf(2, 3)
 int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...);
 
+void ksysfs_init(void);
+
 #endif /* _KOBJECT_H_ */
diff --git a/init/main.c b/init/main.c
index 8b7633b7ab720b9c13a231d64291d35d3852602c..1a9046b563e469057cca72ce39a0701c9c4d49e1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1482,6 +1482,7 @@ static void __init do_initcalls(void)
 static void __init do_basic_setup(void)
 {
 	cpuset_init_smp();
+	ksysfs_init();
 	driver_init();
 	init_irq_proc();
 	do_ctors();
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index a9e6354d9e2579317d3b1bcb54223432d3ce0950..ac546562a6a1202a752de2d36719c6a193520a79 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -213,7 +213,7 @@ static const struct attribute_group kernel_attr_group = {
 	.attrs = kernel_attrs,
 };
 
-static int __init ksysfs_init(void)
+void __init ksysfs_init(void)
 {
 	int error;
 
@@ -234,14 +234,12 @@ static int __init ksysfs_init(void)
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


