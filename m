Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A5AF01806
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KwSnW4qeW+GyVsrlhEis+pzfTAM9a6NyEmut4ayB74Q=; b=Ap7q65qUqTXeFDAn+fQ2Ycoj7F
	pyYeFzCJrWcuo+gC6/mnf+iV1lcDOMExr4uzwcgFcvT35DfqxJ5aK3IpWyalGz6ItHxSLnxiJtRRl
	hxmFJfC3pihzQa1akH/DioGqGQVdw3E/qScCW2yWkspR23I5+FM/LwMs+fgCKWvhW1Gc+bzQGRsIQ
	0eCVwWswxg19feWEvqB1khyDf1efvb3darkOTsOSMN830cdudtRg0sts1qME3GForlYIRndHbofdD
	8vFh45vaI7GIeR9E28Z1GU58KTYwah3aRYEAyJxNHTeHUGl44PB/QiT+2y3Ay56SKrlV8Kdb2tjOJ
	338yhaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPzD-00000003BCY-3cuN;
	Fri, 06 Mar 2026 07:52:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPzB-00000003BC7-1GQq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 07:52:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264ac1W3886718
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Mar 2026 07:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KwSnW4qeW+GyVsrlhEis+p
	zfTAM9a6NyEmut4ayB74Q=; b=CvHtbJ6/xSVZ24Z2586DSsqsY7aOiFNQ6q0M1K
	El62Q3EjLayXMhiscQN+Zs77/IxLbyzFvyyyAZePnuj/LdeifhEi9mGJ4qaNgB/n
	AlbI4gmkc2UTlXLOMFO15fuTXzOkHUfmCpmGjKeHwCyxEj9qZG21HZN0KSqrX6yf
	WNySV3VySdKxXmMWQZzgrs+mjOqSM15oHV+uOG2MHYQCKg0VilV1gO2N8fC+3a1O
	g2upc6b74rkExjJee78UVfiGfWKprURIUV5YDSwKeJ8z+VRV4GCa0y8XztD2h9u3
	jBii2x66dsCIydNkJdcRFWRlYWKJkZ0KDOcEPFO/sDHr+jmQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4s9q07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:52:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35979a03106so6084378a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 23:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772783555; x=1773388355; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwSnW4qeW+GyVsrlhEis+pzfTAM9a6NyEmut4ayB74Q=;
        b=E8BfEXTHjI3J9FuRcXXNTORUY2Y+UuWCzxk+MwdfNIeKDoKMVR7gkyEx5unuduaaVq
         7AU9gwchkn4y2uz3hzb0Ea2ZayK2botHDpAUUi04n+QY6pXBwUuqfOEBfdq9L7f3AMJ/
         LUrzyHazY6A45Q1tGVhF4VXVwvNN52gJCst0WylY4jkmUa430FgA4FCpo3HjRhAJRLn1
         z87kCUMfjnPb5q5DttiyWL1Q+t4Y2aXkpfEH0I5JxaAa3kktvYcl7xjBuW3QJAHItzQI
         4yRZ/gVWmOOszbRLHko1QIAe3XoGWSkPs+pkS6zySnZYdzJeBGL+y9arKSAVpfyN2936
         Go+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772783555; x=1773388355;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwSnW4qeW+GyVsrlhEis+pzfTAM9a6NyEmut4ayB74Q=;
        b=BzVV5SAFGd3QXGrXD7DBRb5TIw38vipKnMOtjs0L76WVTN3LOZHLCdiGClzSo3egrR
         R79pBFUJQByUktIhnxmDVv54CO5PARQ14Lsgv3AfIEXtPt6N2qOE8m6CnElk2fX7EUHA
         AZEiQchHAGmB4mYqQY+IG3myDDY4/4lZO+2xH98JFofJG0N/JC7QsqYI7Qc0Nr15SZt/
         uxGNXy3aLQOOfVJ5QzcGq1+mZIaFDx/tSJu7OGP8JcvC6ocfL3OUdRN+x9X33P90Mw4s
         /Xy1jH+Uvw4t7nDPoPtYdPZSYwRXXtJfBzjiGaTNi+GX5BDoqHTRbn8SFQORxAtfdWE/
         t9YA==
X-Forwarded-Encrypted: i=1; AJvYcCUM4VfOY5bZGwwOkmsNcDSAyQA3NYC40SzrvxZWrRiF+wLzSYIdwmuosF211vZWxjTQxk1/AM2WrQzDYBqB2Ubi@lists.infradead.org
X-Gm-Message-State: AOJu0YwzicdGasmfzJ/N0OohRs0ZS/bxj+1e6AVE+m6cPDxLrgbJy0Z5
	spxwp/omv3OVQWT8OYVxvunUzgjDjz43JVTOgK681+VP/Gjl2Bs6tp9IteznVLmA5HeInH1NP4J
	nLrka+NpUkcutJ3uxPU6Br46khIRX+3ff4QSM+jkXnA7YvV1/+CULWwkZU/5+CCA+IBzGzwSiHI
	hIyQ==
X-Gm-Gg: ATEYQzwRhuEcKKrlcGQE7aXw1va/d5CivwqJ1FqEVryMujUtjHtqq0c0y+GSZ1sT/K7
	Dwk4BEzNe7sY5/MsbkJd+kzKOjTszqU/0ektyxZGXndvzJEtTIHZpadKStDaSGJ2jhdCFU0uo9e
	EXwtB0ZDd4sQSmrtwHYSN9T97qU7h76F3sSK5mHvG7OWa6lv7IE52JlE+HAGn0PI+YO9U1sLPnc
	M2EmI5ohSIuTDNQtOOBkKAGYGGHYvFMXi/83VdO7ihIWPzIdGpm4W+nSWh3n82Q6Ijl7fBfUlMJ
	VfgC6tlL9k5dgSly+eC55lB4iH/G/6CmlQptZhmfioxTp6/zy7qcxuAoCz3wbOpqtGiyu47AtkQ
	OvgsWHJyg0ZBYd3aqXf80aP8HJrLTm3Q8GiuY5tFTRg3O5HADUqhH4f4tCbYsosACVJHicBPwW6
	8x2VxSmNAg
X-Received: by 2002:a05:6a20:c989:b0:334:87c2:445 with SMTP id adf61e73a8af0-39859087843mr1488514637.36.1772783554983;
        Thu, 05 Mar 2026 23:52:34 -0800 (PST)
X-Received: by 2002:a05:6a20:c989:b0:334:87c2:445 with SMTP id adf61e73a8af0-39859087843mr1488487637.36.1772783554454;
        Thu, 05 Mar 2026 23:52:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48ddd18sm892761b3a.56.2026.03.05.23.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:52:33 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 15:52:04 +0800
Subject: [PATCH] coresight: tpdm: add traceid_show for checking traceid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-add-traceid-show-for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKSHqmkC/x3MwQqDMAyA4VeRnA3EOjrYq4wdgknXHGYllSmI7
 27x+B3+/4Cqblrh1R3g+rdqZW4Y+g6mzPNX0aQZAoVII0VkEVydJzXBmsuGqTiui/zw+aAwEHF
 iYWj94ppsv9/vz3leH7LAD2sAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772783551; l=3535;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=9CToOegMNE4EKR1Mvq634IgvqKvCeOVHmiKbGKVjJhQ=;
 b=GsEmbVoHqCW30NLzJ898S/W3Q/0ivtDfk6zg0+wXZOvLo89sLtb5+pAr0o84hGlYmDQrAKf4O
 HOmQ0k/DEHODuVFuBp2HQJzmdnehIhRcBcRsmTomN++59apNNW561XS
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA3MyBTYWx0ZWRfX7oSmjk42E0aw
 +bOzf9+cOW710FWGtxIhcZsswbfWN/uRmfXB8Q5MiNHxAXaZ9SQe743gZci+s7iUTbpGzDWkB7b
 I7epW+EHaxC8beyRv2iePpfWEb3yTE+vC8UCvCIs/K2AeHEfeovE4//kS3ATCow2tP4L7YJwI3a
 /PcFAxTymQVTTQlSZzdhe1VwCzhU0ZXTCIzKVyXWsJmua/jeWFLVL/uQKb1vjffrvKomuZF2xTK
 bBVoX3Zq8Brebsp9zaar850qEX4MvctjSQjLgx+CESy6/AFRUyznfd+8AFvw93geylGxTBtDBMM
 11ZnbHMNp82e/p5GWrPRUOvv/nw98vPivTz+tAgzPaq3nkuDuj3NQboJ56/YE4kW4dIxRkfhDSg
 BzrMopymGa8SFQTn1DgoOgq84EvQty/jog0QrXv2WO7BGxC93NYObFbCn/Hgcbf69wPagcXrZAb
 UTUdn9baiqz8WHWMDWQ==
X-Proofpoint-ORIG-GUID: -6s3auvH43JMn4LVoA4PHMNX_zt6MJDO
X-Proofpoint-GUID: -6s3auvH43JMn4LVoA4PHMNX_zt6MJDO
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aa87c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6dUr-SwRHgjYzu-3eYcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_235237_372432_885F4D8B 
X-CRM114-Status: GOOD (  16.98  )
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

Save the trace ID in drvdata during TPDM enablement and expose it
to userspace to support trace data parsing.

The TPDM device’s trace ID corresponds to the trace ID allocated
to the connected TPDA device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 31 +++++++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index da77bdaad0a4..c0c9d2a7ac61 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
 
 static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 		       enum cs_mode mode,
-		       __maybe_unused struct coresight_path *path)
+		       struct coresight_path *path)
 {
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
@@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 	}
 
 	__tpdm_enable(drvdata);
+	drvdata->traceid = path->trace_id;
 	drvdata->enable = true;
 	spin_unlock(&drvdata->spinlock);
 
@@ -693,6 +694,26 @@ static struct attribute_group tpdm_attr_grp = {
 	.attrs = tpdm_attrs,
 };
 
+static ssize_t traceid_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	val = drvdata->traceid;
+	return sprintf(buf, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(traceid);
+
+static struct attribute *traceid_attrs[] = {
+	&dev_attr_traceid.attr,
+	NULL,
+};
+
+static struct attribute_group traceid_attr_grp = {
+	.attrs = traceid_attrs,
+};
+
 static ssize_t dsb_mode_show(struct device *dev,
 			     struct device_attribute *attr,
 			     char *buf)
@@ -1367,6 +1388,12 @@ static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_cmb_patt_grp,
 	&tpdm_cmb_msr_grp,
 	&tpdm_mcmb_attr_grp,
+	&traceid_attr_grp,
+	NULL,
+};
+
+static const struct attribute_group *static_tpdm_attr_grps[] = {
+	&traceid_attr_grp,
 	NULL,
 };
 
@@ -1425,6 +1452,8 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	if (res)
 		desc.groups = tpdm_attr_grps;
+	else
+		desc.groups = static_tpdm_attr_grps;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 2867f3ab8186..befecbb896f4 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -300,6 +300,7 @@ struct cmb_dataset {
  * @cmb         Specifics associated to TPDM CMB.
  * @dsb_msr_num Number of MSR supported by DSB TPDM
  * @cmb_msr_num Number of MSR supported by CMB TPDM
+ * @traceid	trace ID of the path.
  */
 
 struct tpdm_drvdata {
@@ -313,6 +314,7 @@ struct tpdm_drvdata {
 	struct cmb_dataset	*cmb;
 	u32			dsb_msr_num;
 	u32			cmb_msr_num;
+	u8			traceid;
 };
 
 /* Enumerate members of various datasets */

---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260306-add-traceid-show-for-tpdm-7402100afada

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


