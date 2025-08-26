Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B99DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 07:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mTRaR+aWbFTUCZaXg5d7I+myL8Z4TCVvhpp1WowyOY=; b=bBRDP4jdNCKKYYbeu5O8wiPqzd
	f2Iei2BzUTBw+Ucwu9aBvwzjmYoyzwE0Tfqs5AtRw4R5IAKZFxkHK7f0NORfIi2FicLWIJv5ceh+8
	/UBlG/3T1ZqN5GnEtFgDUrLUxZB6ZUy1E/nC+Iod0u/POg7DSqmyOMEsxQ7bcXvp6LLqcCexVA2s7
	RGQcArVPLywo9/5nPIfAXuoCW1PSEQW1IiGAGFZCvzFfo8tv5qjCBYgSDkzWiejHnSMTTa+q0WN2s
	TQBKYIDz1m/Euh/zzK/XVwFlchyLGiiZIfA/ewBGjmiz25zDKQ5dQHVw/M0iUj9U3NYVaAFEDeBGM
	z9c410KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnra-0000000Ao3Z-0gs0;
	Tue, 26 Aug 2025 07:13:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnhD-0000000An0l-2qro
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 26 Aug 2025 07:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+mTRaR+aWbFTUCZaXg5d7I+myL8Z4TCVvhpp1WowyOY=; b=jhd5y+JW9x0wep20SRBRtb/1MU
	/bb2rnEfuDHjO5W7usMTQli1Hky/psX0ecbUIkq50znlIXPm5KoUSM99WaOpSyG+icucElGLT1vC5
	IdGmha1Q7uoeJu5xoNF4Z17lwSnbks6s8KCdOtOIb9MILSRFaua0lUKXPZDl+6NHP+Rrm7mxYBfD2
	wqOcYeAwcmZkM13w6GXst1auIlOiXoV5yti6ryZfS4R47QEe+Lk1m+tN/tLHFWL6YeqE7qVF4DLsJ
	uH8RY1+BGkk6fl3znHwH7NYwaOPc56bXTb+PVLOGQwzh/e7fS2OD5PuV9y4Y69W8hn73RXtBjbDit
	xHq3YrKA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnhA-000000029Oo-1B3A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 07:02:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q6CIol003654
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 07:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+mTRaR+aWbF
	TUCZaXg5d7I+myL8Z4TCVvhpp1WowyOY=; b=M+Wk6QH2pFHpmpFO3m7YFOnTSSQ
	z9kmxagD4cTb0/hcg5psKXBwiRBx6DnVBH6modHXpsNB5vhOIjqADxeTRke5hD/P
	vSoIXL7u2yoQECu0Y81kF/ELox6dafPQsscWpwf9TiaigYWkPUtCW7djioIIlarY
	LFgXfi40eglJaWUZs8gNvLSCnurgdTf7EgKRxRyrz54rRMhPZqTaJ2Pi+C2lCCCA
	EHsPIpDgCKHbd5Zg36YdHhTRQeop399Cfz9iXSn2YG7x/KVpKA0G4vVBJJD4FAyJ
	EcZvLhRGI+VBLRVA8T61trAFZh2zKZQKMKFDEehXPEtAgJLcCF5BBOQbJiQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5fmcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 07:02:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-246cf6af36dso22237585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 00:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756191730; x=1756796530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mTRaR+aWbFTUCZaXg5d7I+myL8Z4TCVvhpp1WowyOY=;
        b=q/JYMYpQJmk01r884vvGi571+sgheHyII3Eb2L09u25rld7Jkxe4YA0C8j0KX9D0J3
         3IOQReSbxwiBrtbREg4WgEc+ozAOBIUU8DaA117OyTdCq5R6mFSZ6J5QBaP/VBUz5AWe
         kNMZwXJNnD7XCIjFRw2VkdLYvG/82jxVzEQb2AAvAyBaiytVnBUREJvy5QPEyDBghoyW
         BzUupyFyEmSjD6G6WQhLcNGSbybcyc7dZJ/+DMEk+eOVXHnAZYijYKFumtVqLUGlsAw5
         +MBK0PGlPIHcva+kK/BQ2y2Ad1vHMR8MH3p7r2BmMS8W13R/ZcNOgEV/WpqJUGz9rX9G
         xxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5reOA8ZtS7xsV+wHJUrEelXXDXWzXghcNRAnAc6JSNziN3jvEbLf60qfVBemSw8f0RJwy0eqhozfv+N0RmfyB@lists.infradead.org
X-Gm-Message-State: AOJu0YwHs8pKSboClJ7qYRRZq3Mf+N/1L93pFhk8We7Uk8HZ+RwN0CVM
	4VsvqHjXWUxj/GhSZTWklGzPmqYgTm07jxS7SkwY29GYPUPMkjcFwf3TO88KRT/8jgKqIxhuNQF
	NCO4S9lh51OwSQ7m+oajQ00RNYFKR4SvFxOTBKJYxug+MYJ3wwBq6SxIv4zyQjf0qdw6Y+ECjbz
	cbiw==
X-Gm-Gg: ASbGncteRVFr3qm0sedWR3SvY46wencbJF38ziz4IVLpu/PQNtvR4li1oyLpQxiiac6
	KPOYkXrQ6TZsQhWPmJZOONmImyfIIebQ/s9I0W5KhAKAKKD3I5rxXegP14Noak6JXkkSHuileFe
	kNyvmeCdnfMqDr9xtC3MPvCbiFL+214dW+OfCyYxBRSmvgCVaX21ZNL19/LoKYsK6Bdy9HkrJu2
	tmW+zGram1atc/LYq+NN91pFzvjbOwMAqK1V3U5EZuD64M8eJ26uS/tmeaECz1shptqJylICzcb
	hslfUaOxDwXuKdIIWS4V3SDvz34ieNU5ZkgZ56Vg/kWCl3cwYyIYG4Ed2v2pMG99CkkTbwoRqH/
	AJ4uYq5kb3TfRhOkCs658
X-Received: by 2002:a17:903:244c:b0:246:b49e:d439 with SMTP id d9443c01a7336-246b49ef64emr93665465ad.38.1756191730219;
        Tue, 26 Aug 2025 00:02:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoRc8uc8vAUbrMEPeg17gEclVd7NzYl81uv0y0+g5JCi7ysOqsMZE8I6TUqXsU2PMBTgzBHQ==
X-Received: by 2002:a17:903:244c:b0:246:b49e:d439 with SMTP id d9443c01a7336-246b49ef64emr93661165ad.38.1756191726678;
        Tue, 26 Aug 2025 00:02:06 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770b5bed428sm5628582b3a.16.2025.08.26.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 00:02:06 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 3/3] coresight: tpda: add sysfs node to flush specific port
Date: Tue, 26 Aug 2025 15:01:50 +0800
Message-Id: <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXzvZt4H+ilnS8
 0JPPlgCxReG4vG37Yv1lQMFX7q8teeXyWvBPfVW6lcyq+b8EEqznY6D/FgaPmhcsdUS5zqoyeXW
 z1WBNimBCgAHjB703LV49TG01X8CScfZ3Xcmzwv8V+p3ba8LviYFDnLuOq3s1qwSE7gSj5frWuv
 uiDvYx3muksZacZaYNfQaWUBrqCLy4Szi0iUFm+7TWawU9cQU6EgdASCHSnTSfUbOZaFbMEn/fz
 l4/h2RmofgkLpgJiVmYyDMbhbL7WRmBcAtdomXRh1R36wK7nqE5R1YwHK9QRXJR66AYII0XHXFb
 pxn9rj9+f4I414iD/vg6hwWTOY3ffH7W7U6iV2mBGf19rPy/XBdt2/r9qvI4Qlae1lW7rwcVE16
 bDwbiGtF
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ad5bf3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=UsKUHg3HdU6Ygep39SEA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Ll3ZQVV4p_Twoo2tGgWvLuYL3hM3D7BL
X-Proofpoint-ORIG-GUID: Ll3ZQVV4p_Twoo2tGgWvLuYL3hM3D7BL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_080216_762696_3A19206C 
X-CRM114-Status: GOOD (  18.41  )
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

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
for port i, forcing the data to synchronize and be transmitted to the
sink device.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
 drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
 3 files changed, 53 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index e827396a0fa1..8803158ba42f 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -41,3 +41,10 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
 		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 9e623732d1e7..c5f169facc51 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(cmbchan_mode);
 
+static ssize_t port_flush_req_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EPERM;
+
+	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
+	return sysfs_emit(buf, "%lx\n", val);
+}
+
+static ssize_t port_flush_req_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	/* The valid value ranges from 0 to 127 */
+	if (val > 127)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EPERM;
+
+	if (val) {
+		CS_UNLOCK(drvdata->base);
+		writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
+		CS_LOCK(drvdata->base);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(port_flush_req);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_trig_async_enable.attr,
 	&dev_attr_trig_flag_ts_enable.attr,
@@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
 	&dev_attr_freq_ts_enable.attr,
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_cmbchan_mode.attr,
+	&dev_attr_port_flush_req.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 00d146960d81..55a18d718357 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
-- 
2.34.1


