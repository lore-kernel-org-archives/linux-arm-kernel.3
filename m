Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A62D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et0BqRDEb3FWb91DYGPH0rIORWl6LBer6lByJmNNNSk=; b=VqEgThK4dlSKS0ueDHuaNVBsN3
	+TxSq6Bxp3UFCCXTc2S/JApdy654noWNVKYfz5iKpWe9Oc89rAMUfcSSh1/C0mL8VSak94nYkWlXj
	4SWZvRSuRWjd7XivpgL7v5HQR3QhvMgQc+OEIYJFQTQhO8YXCY+IuOar/WJkvuGWld7Dzl9o6L015
	XHdHXGV37orDWGHtj2aZxRkBPL3KkwtsIPOT+GL2lZ14Wgz+/JIsP9bZvooA67DUF/k8gL+FsN+j+
	Hxq6pAHdIgy9+hu5sUxL9x+uubdR1kLNHjt6r06tW8jNTxp3AFJmzA2i9hQV2yaCAr5DoCXmXgntw
	z9ReXEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0g-0000000DEMH-2t9q;
	Mon, 22 Dec 2025 06:03:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0c-0000000DEJL-2ktV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 06:03:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM00UiD208636
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Et0BqRDEb3FWb91DYGPH0rIORWl6LBer6lByJmNNNSk=; b=eA8Bc5YQ/sRaY+/R
	OTgYCtw7/LvfcneNz/Gqp2j3PzxNJYYG78GXOY7LtMxw46V9Cpm6FfR9uR1ID1VG
	VzPm8cGqSvxLXx79v/SvBEnfzGh59bjto88c76/uNuisibbqktJbnSM3Lc1Ufd+R
	/rz9qep5eF4In6YH0kJFJpBQbPiIDHEdVTXNgV4SEw60SuEwaE5PRH/0r4RqnZzy
	qgsMFdjkRKC4xlTAh0mli/HLJ4F7huFv12xuvcIeJjS/FSKLLgs+1K58zXWF7rYd
	zTEZE1b3YisnkuyMc8pEmK62KlrTioib4oFv2c3kGDU7L1A1GtjIrDM6JJPZ+KsG
	KxxNlA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrabudd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:03:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso4445839b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 22:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383384; x=1766988184; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et0BqRDEb3FWb91DYGPH0rIORWl6LBer6lByJmNNNSk=;
        b=d9SyfdQM08NuiljvdNUmvbC1mVjzt0BobyW5QZz1ZlMy/nB/TX9by/Kp419TVy1Uq9
         347jYLnEInjOpL6FkWNW53Hq/UNuHxYd/4DCDgQqIzUFl4toePwsredQN5XFrUUfbL3f
         c4oPNZIDK+lZfunen/hCQyNDAe/4CeU8MUuyHaRFw/f6ODH2A7wbBkytP1jMuG+wokvr
         ye+pLOucuj83Q5+ctNsYaMkLTxzmFpNEaaWVpvXBit+ZLHTqu3LrFqEFjzI3FdR8PXK5
         SMOPg/2ll5D0jcKt4upGp0Q0nc2XXjr5fEc0lWKra0G0T8naSt6RUkdG9+U2f467H9of
         7E0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383384; x=1766988184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Et0BqRDEb3FWb91DYGPH0rIORWl6LBer6lByJmNNNSk=;
        b=fYBYkoMzDMGKs+0FsZzmrH0tf2I7gsrO2f7tu+1HA/YHRSc64jkvBOa5y15DwNd310
         NUFuaB6pMfhgOFbCjIxcxQKmAwxXBID4xmwINMne8sgrCDBFKBNLFVsVoAD/4UYNpZqC
         45HKo9YhX/+JTz7BeIQYU3T6qaKBq258wl5dcizgrGBIaSgq+d7FomMuzLFjSS87W5KZ
         VQTMMc4bvH5GKEDhoa04nVDsNu/fTKSnS9TrDCtv139cdJhr7Qd+axKITY6hZ6htXwxS
         gMdwoPy5DiWpqwA7ZhRBhz9MVxpHGDp2DM9x/Ecz7DA5oGvcmlxsCFw0EhAZzqprUUzR
         PuaA==
X-Forwarded-Encrypted: i=1; AJvYcCWVaU8w5xBAfZ0y0VvItAiWBpO/8h1WCXAvoe0AgnwwRbaOgKeVv9mu5C015e/Pvc6iJok8CBNng4ER87XIXeDN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/TY2JbfiKT3nhJje/IvAj+gN2WmoPxQQtUgBTKS4jc67wpMKd
	VBRmFTRgMbDS2xRegRLGkjZ2PUaa38o1d9+863juv6xM5l5vWgNls2AKv4wP/zC+HjkrXnzGT8j
	YD08Fofybtw/XPy0n8qmM9oUn66qvAMnYSCBuJJXmFBw8l4DZxG4by7qaSI2cJwM0zOzmw24pdS
	ctYA==
X-Gm-Gg: AY/fxX6rbaIg3IALhe2TP4Z8FsY5IL76vmQryGLFUsZF8QJCjdmR2OTCNtzHi8pHj5/
	hOUA40vTJ0VnWcxnc7uR/WivBGXABvCoKUcseETQ0vHFuM10ftOkbotAco09TJtFWbmp5wDp9aG
	ZlPGBK8tj2jmv1XrwKQQRCACD+eaS02pKv2UIYI7AG+cJz2SzdLp3OdHsfWyAb1LE9FlFemFjF/
	ezCxJpLNWpy7bCwJyF21GTDQyLCyUJ9rVWo6JMqQ33YhJVAmOQE3hF2HZCvENCJTJH3w28rmH0s
	0/5rURlBQgCXc4SKv7g13V3mNATtKWMJOZ1JB7wcI7UaiCKrFjuVgZxgBp6fcLFHUPoP1qSLA/D
	yf1dd4QnhH1wSl6UfbNdg51YfekQDSfB4dXcKLQIjHq7DXiZHLMDBBb2IOu09Z5fRpe1ft4AI
X-Received: by 2002:a05:6a00:2f8b:b0:801:f1a4:6dc with SMTP id d2e1a72fcca58-801f1a407bcmr4492176b3a.15.1766383384320;
        Sun, 21 Dec 2025 22:03:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6oMvcA3ywnzVp6HijnT60dFLWESeiLW1WZcM5afrmr85QyxW7KTnTNt1I02ag5b6IkaXMTw==
X-Received: by 2002:a05:6a00:2f8b:b0:801:f1a4:6dc with SMTP id d2e1a72fcca58-801f1a407bcmr4492158b3a.15.1766383383766;
        Sun, 21 Dec 2025 22:03:03 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e892926sm9070130b3a.66.2025.12.21.22.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:03:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:02:23 +0800
Subject: [PATCH v6 3/4] coresight: tpda: add logic to configure TPDA_SYNCR
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-add_sysfs_nodes_to_configure_tpda-v6-3-b27143d45c86@oss.qualcomm.com>
References: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
In-Reply-To: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766383369; l=5323;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=a3nnThULr7oV9TDmuW/OSuwqdlkJ14YmI+sHJq21AiY=;
 b=ndpVPu7Zd6YlW43+s07whWbRTEWZF+CoDPzG92PQb0mu7Inp2bmCKUlI33aURc/3CCiHJTUAX
 vpwUfCu7VTvD28boN1VUpV2kG8c/YM6QVBMm9nex1SCICZppYKuSzTQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: -bOOLrVEaaPLsJGqVFgRr4ouuXlSmvux
X-Proofpoint-GUID: -bOOLrVEaaPLsJGqVFgRr4ouuXlSmvux
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6948df19 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=BPbcchGvNsiIBzbuidUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfX3QGU+VUmfRkU
 COHYM/TTor6SsB8TvZaURcl2NG62fShTo/ZVzP2U2cd5D9w8+Aruf20xp54gyiiwutMDz9NgNP+
 Ukxm1AdCFmsw5iD9IuCXsPftW0rEzDYto+6i8siYzN/KzuR49ENI3W44gVFF0TY7pV2Sueh4WQ0
 ZFLipkTj4swi6cvmU+gpAb9ErL95u5INjdCZS6H6OFdy7sDWB3JafJMGWpXUjw+5p6Kqjverk83
 wDWlZ8wwCGTTPlfKUPY7Vf7On8spHF/8iY2m9NY9IU7HLvat+Qjvv0QQUlnlT9zaJdl8rGV2IzP
 TWoHq4NTvX7bAhxGcAfLmX0Sh+l8T7mfNd7+eWnjiGZjdsshgOkxga6zrytHAJeM9bflRnWdvvj
 W5DGdR534Aj6E7MpTzkEHr4Ci0rT0oq7CiRWQpaEqzGRa4draZdlviuC2FuOGjTPSrZcrzgi285
 Yp0IcHvIWafA4YYijbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_220308_836353_9F65B607 
X-CRM114-Status: GOOD (  21.82  )
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

The TPDA_SYNC counter tracks the number of bytes transferred from the
aggregator. When this count reaches the value programmed in the
TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
tools to accurately parse each valid packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   | 10 +++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 46 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  8 ++++
 3 files changed, 64 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index c8bc7b19ab25..d359d90dca72 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -41,3 +41,13 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Set global (all ports) flush request bit. The bit remains set until a
 		global flush request sequence completes.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/syncr_mode
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set mode the of the syncr counter.
+		mode 0 - COUNT[11:0] value represents the approximate number of bytes moved between two ASYNC packet requests
+		mode 1 - the bits COUNT[11:7] are used as a power of 2. for example, we could insert an async packet every 8K
+		         data by writing a value 13 to the COUNT[11:7] field.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index d24a9098f1b1..7baa8a0965d3 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -163,6 +163,15 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	 */
 	if (drvdata->trig_flag_ts)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
+
+	/* Initialize with a value of 0 */
+	val = 0;
+	if (drvdata->syncr_mode)
+		val |= TPDA_SYNCR_MODE_CTRL_MASK;
+
+	/* Program the counter to its MAX value by default */
+	val |= TPDA_SYNCR_COUNTER_MASK;
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
@@ -385,8 +394,45 @@ static ssize_t global_flush_req_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(global_flush_req);
 
+static ssize_t syncr_mode_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val, syncr_val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
+
+	return sysfs_emit(buf, "%lu\n", val);
+}
+
+static ssize_t syncr_mode_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	/* set the mode when first enabling the device */
+	drvdata->syncr_mode = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(syncr_mode);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_global_flush_req.attr,
+	&dev_attr_syncr_mode.attr,
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
 	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
 	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 1cc9253293ec..1d2de50bb9f9 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger global (all ports) flush request bit */
 #define TPDA_CR_FLREQ		BIT(0)
@@ -36,6 +37,11 @@
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
 
+/* TPDA_SYNCR counter mask */
+#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
+/* TPDA_SYNCR mode control bit */
+#define TPDA_SYNCR_MODE_CTRL_MASK	GENMASK(12, 12)
+
 #define TPDA_MAX_INPORTS	32
 
 /**
@@ -52,6 +58,7 @@
  * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
  * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
  * @cmbchan_mode: Configure the CMB/MCMB channel mode.
+ * @syncr_mode:	Configure the mode for counting packets.
  */
 struct tpda_drvdata {
 	void __iomem		*base;
@@ -66,6 +73,7 @@ struct tpda_drvdata {
 	bool			trig_freq;
 	bool			freq_ts;
 	bool			cmbchan_mode;
+	bool			syncr_mode;
 };
 
 /* Enumerate members of global control register(cr) */

-- 
2.34.1


