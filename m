Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EDBE6F074
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 08:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMejBhDQnL1Dv7MAhsjAmW+Z4TxphMeOV4eFeWWSDhE=; b=25/rqVhZRAkpfBA5/5/AdTiLkE
	u6/EEPkOjmJMJLFuvk/GjfQVatCopnyZ+PzArztXUlN2FWlmCcyNXT5ChakrtHDKhjWhdH2zSTKUz
	OWogO5rz5/o5AtixZQ8KmK2kecUdQcxvogEu8SOTL+bvj4tSOTiY9PpiNa7kVrZTgWR9XA740x6bz
	iDtLOvwgyZL0aLZBzJUKD61Wv5WdXmZoFdBs2Ik0OpxA59IaVpMcRTgz6OXWBIcrrbSKxi/46NzUc
	asLZcCTfGxQoBn8rk7K/olryTep2xf9Oxl65eY3F/Qw2QogKOZoqn8JMZ+zOvcfDSl+mf5pqwcltn
	IXoZtpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxyR-0000000Eh7L-0um5;
	Tue, 23 Dec 2025 08:42:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxyK-0000000Eh3T-3r2f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 08:42:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN74v9x2115196
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMejBhDQnL1Dv7MAhsjAmW+Z4TxphMeOV4eFeWWSDhE=; b=GWZHIPRucvFHhlBc
	egcDJL7XcR2bGWp5wuBR1o5qqzgDzsJJQvKS5sOrK2pubNVGbh4p68LtSDf2acF1
	LCrE3GbL249fAoOQGaK7iUTppJQ4T1rJ5dQLtYlem9hryatSbQ5pw69A8jysAYpB
	LBOnCb3n8rZSaTKz0hPXYo/8S4Wd/4l601KRSwdPAXKmc1l93WDrbCJOJdFmhYg+
	Vta7g5aOqcWGS2NPvY2WRvDJQ90sLWF4jAnkpUh0r/HmsTzQt0E0zl9KOLCE7y1g
	CMQg1nVuxgTafdg+4lf/dmau9qKtR2n0NY4Vrfz30I3Tzh5lhoN5Dz3/aGBH+Wft
	casp/w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudhxn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so9423479b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 00:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766479344; x=1767084144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMejBhDQnL1Dv7MAhsjAmW+Z4TxphMeOV4eFeWWSDhE=;
        b=X5MnvszXXEGtYsxyXez8nMKPbFDnQBRwcoteqv8rDN/VlfKuUbwO1gauiX9UfqNZul
         9LF5cO3Dgl3mt3A54lPZJ/9NZ/XHwddbBjluwmkm4G0nA4kawNch+vLG/yz1wTudv4+1
         joLOhub4d+2NoxoJ44ARIvBwPZkyFAgQPiO1EH85r8qOif5a5mOqAbLGUcpiv0h25ZJR
         MtfpnNPW+53+OHr2bwL2XCKuDJsxJoCbE/5/0TrkV30axchDpLM1AstyKHudpzcFogkY
         T4eht/hQXd9QQAwXj7aPUi98r25ZX6OiLUH93FYG6lLu9cq6lKR5MhipAyXPznj11j/W
         7nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766479344; x=1767084144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BMejBhDQnL1Dv7MAhsjAmW+Z4TxphMeOV4eFeWWSDhE=;
        b=JqRVNYvdmduktw7X7kfwhugQMrIP/ikxwT90rHM5U8xfiM4RFO8Jwd1u0cIzz58+mW
         C/o/lH7IFsjPHV35MdEIWzomQ7dHDpeKtNzvELFQ2KwAu0qh9HAccARnbFr4t3MZ4lDb
         xM524vULfceG2ima9t4Sr6+X/a+M3P9ODQ+s+E+rtBhomImfW0Bq7xvV7V6FmnLHWxOs
         q80KkuQP9rnW0L5gFJkwi+NbJEenRKLBncRoLb2nBZbzd9E1XMkIn7dUEH7BRAiifWfD
         35btaaiOn5y76MjBT3lFYoOZsiCzdj7Z+QCpFXAH7nyr3LrOHAK9onefDnjM6ygvG87P
         sZvA==
X-Forwarded-Encrypted: i=1; AJvYcCWH02Jz6ooy5H0HjnxrwBLZbkaHuo3g++a2wUvH+e79epO1oPLpi5fKcngjv/5D2Sh2wURbCTKF+GxGOYzEHNqm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw98Lr9ZyXurg8EYKHY9jvwFMTXabuck+KwnEHj2SEMX7D7Isnq
	UilESJKTCUZFrh1Y5nyo2Fe2lNxT/lpFSiAsR38+5xrFAVAsKnVLMESxOX48IffVP/VQ9wS+6u2
	i00fNGfp6ZJAanEwh3Rja4GFuZElNr6fxSQiuhhI4+/veyH+t8PVwNaLB31laFFf1U+WIeIKwR8
	GHzg==
X-Gm-Gg: AY/fxX5UCL3zaGTccq68nYE9JbgGe2ugflISJJAX1bd3WlulXAAEefhSX4RlA8TkvBl
	QrJSZNSloOjHcr7cDZE3JX7ivhtyfUptdsO9hWq7kQWFAP8FeQuKv+kqamxOK67PT3qgHogEkbR
	+OpicYkIL+IBZsntBySgn9vCdQ4N62s9vJLy0/0UJssNPSoY7XkS1yw4RS3BcTzzP9ivJGY2Kxz
	dW5O8YT92oaLpqoTfeTbRw8QzKITCu5/7JOfDqFNnNke2376QTA0A1nP3ZEwJU1/Hf3LeQct8vQ
	x4DzK9PDhOkhNmpaMacsXiPExcs1vhtepH/llnHVWz3crR9DwvGn5mNikXALM56C6Xut/y6nXD2
	EG+MQ6ob57RqAdAPm8eZYK3I2dLi6IhtJ+JWPG5oyv93P6yVx1juqPqQMdYOcJoShF9Z8MOaL
X-Received: by 2002:a05:6a20:5491:b0:366:14ac:8c75 with SMTP id adf61e73a8af0-376ab6de4b9mr12659875637.75.1766479343630;
        Tue, 23 Dec 2025 00:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrwqlganMO0uU0/gpDTUGfrR3rz//Zs0VeY5iH7PswnZRTDC3N2PeEmW04dNTjIRgxiXSckQ==
X-Received: by 2002:a05:6a20:5491:b0:366:14ac:8c75 with SMTP id adf61e73a8af0-376ab6de4b9mr12659855637.75.1766479343125;
        Tue, 23 Dec 2025 00:42:23 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961e045sm11163561a12.1.2025.12.23.00.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:42:22 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:41:48 +0800
Subject: [PATCH v7 4/4] coresight: tpda: add sysfs node to flush specific
 port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v7-4-db4e6810047c@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
In-Reply-To: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766479327; l=3701;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=4WftSXGb7/EAYR5QLxu88DyIlZc6o4w30QAG58MQiFc=;
 b=frDDCwxICYIU3uhxD5qwTrKllsVkp9CyMR9T9Gf9RNytm0SB0u0ynAd0Lw26ZCu9jPUSF63dJ
 0XPUZBRbRNoDGZbpp67OL9gdiN/0bWDK9k2y4x28L4OMa+xa0FptqIA
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a55f0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Uaz1Er67hVaxBR8z2rIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _WK_oEoUJN-nhqhA04Lkp8nEHL5xWGc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3MiBTYWx0ZWRfX7+o1mN1sUDZd
 i+B1LhOSyoWV/PPQDFfhTKWwqCe7ggPlChJOdm0oIWfXK6kaAWBfkhFwy6IYaR8wUrLX3ibv2Yw
 FXZu53tEXUCvxQ5silZO4TbbCxW9Gt9L70hcC3IZWElTbo/t133BW8Qfkflxy9SKJw9g+Eqz6za
 tbtw7vCQ+yzCmoeWTqQJMIfRNnrkgnSrZH4igtSL1PEd/XnItLAbGPmE5kq36maZysChI1/j66q
 BP7jbHf03w0oIVbddaIeCIMsAkpESPxsEECPbc6ciEfze+eoi7y6fU0LWZ/x/MEt1UxzzP1T+f/
 5epND5Xqu6ohYy557REilHYemH+Y1LHU+23BVU6PaPVug4otX56TOCPf7M+W1J0jP+kRO1u42aP
 zBe9wspszdjf+AmiP2gNI5pHIJRBWNuTDSM5sTKDaUdnsGIrURhC3tB8reWPt87ayBK5uvwJsN1
 Mi1Ei5m+BmxAsT0QA7Q==
X-Proofpoint-ORIG-GUID: _WK_oEoUJN-nhqhA04Lkp8nEHL5xWGc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_004225_001719_D8F9AC08 
X-CRM114-Status: GOOD (  16.67  )
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
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  8 +++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 40 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  1 +
 3 files changed, 49 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index c989eea1ef59..48b8fda1b796 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -59,3 +59,11 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Set value the of the syncr counter.
 		Range: 0-4095
+
+What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
+		The requested bit(s) remain set until the flush request completes.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 8283e16ec400..412c35decc8e 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -473,10 +473,50 @@ static ssize_t syncr_count_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(syncr_count);
 
+static ssize_t port_flush_req_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
+
+	return sysfs_emit(buf, "0x%lx\n", val);
+}
+
+static ssize_t port_flush_req_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
+	CS_LOCK(drvdata->base);
+
+	return size;
+}
+static DEVICE_ATTR_RW(port_flush_req);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_syncr_mode.attr,
 	&dev_attr_syncr_count.attr,
+	&dev_attr_port_flush_req.attr,
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
 	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
 	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 56d35697303a..a090352009bb 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger global (all ports) flush request bit */
 #define TPDA_CR_FLREQ		BIT(0)

-- 
2.34.1


