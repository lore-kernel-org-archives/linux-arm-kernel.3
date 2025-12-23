Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F71E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=; b=u0UTE0zR9D83KuiDISAVJNZfb+
	2mHB5u0v/hai5YRpLRUnwUkjYPbUjkYJcTA24mnz/aZrFnmtnMw8AvFCPyOR6QjwB+o/Au9I3fdlJ
	CLcjYhwd0C7bujZq8955zstKnRfZ/2qLrCg5f12dXzBN0HZBYgywTfQ0Qxovwock5Y9UBB43gd2Kb
	buEsqG4vgZ9q1x8ZQf5oNGYaww0ILT+y2uETGfUEvG8Qd6lyH/RJoly9EXROU8P2XCzV0vVyHFAGh
	kTlqPvyWSinarc6WoH6HZjm0981TRZAaUmxlHH6CL8PztLg3NvYgBOqqTjvJ8Qu0Vr9FrFaJc3ZfN
	uBaglKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxyI-0000000Eh2X-3wv4;
	Tue, 23 Dec 2025 08:42:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxyE-0000000Eh0o-0xaQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 08:42:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN78UKY4044542
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=; b=Ij1sJMo6fnCLMP5c
	GjVjDVWH9xXiu0k8llJe98rK+vj+hBHJ/e5mFLbfg9xdWx7J7KZyQwKjzjtDkK0h
	cXC1uY0cfi9FGfNZqG8m2Q3/popLxk32qX1PBEKxUNw8hwdP5Uzt2xFK0uC3TyIv
	U58Jg6SMUiP6NHS6rqFdGxTK8AlmFXXkRwAhlEjRGnPdeWoXgsl8YImfc62NgK9E
	6jLIInxFZd8wNMV/m/jO3oiprb1sERB14QEEYAP7wmdCfFGzx8ZB2wuWGP7Fsa+M
	n28bz26QKq+IdZYYpJYlskD3BW37ZBnKg3VG5dpc+HDALoJDxbUsSNdGg4VljNJ7
	i8xT3w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuh9vsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso5363622a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 00:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766479337; x=1767084137; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=;
        b=QR2PrzHrk1HYGgnvgAnyW/CaVqsDF11nbIt7DFguxaKcePd4HhmAQrngVegDNoGOuz
         gshnwfYAzsalXD3HxcUAsZ8pMQH4HoUc3sxCTj5UAY2nMe2/Sfoss+dbIRgcf2xZpWFn
         io1zIbsSbhKXzdU4W2OYhD+0Rswmj0GYofzUtXaCMzmerzFu+TLCeVzkDKhYZLJuDWO2
         1V3nle0IjPy/7okYO6Y79iteIOQrwBR6qZPDmqeCcE1BH4VHNaRBzTm55CXdVV/B/7vW
         7kS5gs32ZhiI9enFsrrbYzIA6fCET8ageIOLsTdD2ql+hhLsOlch8nRqtP8C/Z1Tx4Dg
         5mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766479337; x=1767084137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=;
        b=akLf2GVsTCWZ7W22oYlfFxGZjpVYJRoSDb1k1OvOPyK/ZHXuTyB5Kuw52k9SfQX8l/
         qhzV7cUHJpRSe/xALLesRy7xP35q4wmZ8hdXlIJhD8CX2LdzZAmIYlini/yrpdD1rn0l
         1OA8HDlD9yGF8e82YGyRml8tpR/IxWLaQK2mcxeh8+rcfq8W3SpiEDdwHhfwJlHCsm3+
         1O07Byaf9rrkKAWK5TI7hjXyD/6U6NiWrrNtPNL1M+HZwl8UANHbU9xgbyKNpr2H5+zi
         F/sy0+U5rIDujDQDClJbbaSblRCSqfkMM+TcIb3ONVcWvtwCFL0ZZvnL2mmxDX2SxnR9
         6eCw==
X-Forwarded-Encrypted: i=1; AJvYcCWDn+w7oJbSqtbgljEiqPLRzD2pVZcect4ZyVSbVL18DdQhp+bP5UBQK6INhLfcBFlbTK3phdJoKWXajbvgaisT@lists.infradead.org
X-Gm-Message-State: AOJu0Yww7NBS7P3NkgnewNhGlCpZfyjpuv9KteIaTeat8t45puJeqQjZ
	ZxQvfroB+czZwjL7d9HMdEewr4SB9hUfuF+Y7LIHdXLbV0VwCIiH63m2OCDMJ/V+9+N49qsiFFn
	D1M3ji4UZIV6P0ZAJuAVT8vB8ChJ8cMBi89lCOWk+6MpjhlgaBS0guSp+k/2aPNp2Fe5SLhZvGW
	pKn2prkH1OJZwP
X-Gm-Gg: AY/fxX61aPsnD/zlIYJ7jkIpwHHCKsKKJheVu4jxEQ0HRRdR+GvmiISH5oX1e4ig7IQ
	O3GtaqpSqoDZ7HcPd7TGG0oO0MipmTnARRdjoAgUSKcw46kkJGKxkrOW99BwiCOl+MliUGnWefQ
	212Wk2DiL72xXy7v3QcUpbYAmnnY+1oY0MHLMg7Dn6N5xVjZnqfcHkHhmlq6DyYTF0x7wcAOlim
	hEjEqt8KwrpXgGKpddGhLd48G7XAbj98Rki9hWwFJceYvk6b2gqCatjD38bFz+knYuNF/JDuIUn
	3cDLoUJZ5+jY/bla285bjz90XboZJ8YvAzCJDNcKayGK2lSIAinK19ROJgxAkdrBEHy0pruqypp
	9T3CehxpVFQf1mc5orSVDfMMyA1/jz7mwgg0bULGfoUX/SRr6h13eCRQV4bRw7O5wCgUf+/sG
X-Received: by 2002:a17:90b:3c4d:b0:340:6b6f:4bbf with SMTP id 98e67ed59e1d1-34e71e6a525mr16007309a91.18.1766479336824;
        Tue, 23 Dec 2025 00:42:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHch9eBTiSP/pCDSMLf4OilcITJiPd0Zas6vtDcAVZDeGP+bmdZb3QX/hyzMj+muZnSmjtPTA==
X-Received: by 2002:a17:90b:3c4d:b0:340:6b6f:4bbf with SMTP id 98e67ed59e1d1-34e71e6a525mr16007289a91.18.1766479336208;
        Tue, 23 Dec 2025 00:42:16 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961e045sm11163561a12.1.2025.12.23.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:42:15 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:41:46 +0800
Subject: [PATCH v7 2/4] coresight: tpda: add global_flush_req sysfs node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v7-2-db4e6810047c@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
In-Reply-To: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766479326; l=3748;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=BRgMyJQu9Kzy/G9nmhSYpMl8s8NAvtzMpAI0JLWtcFU=;
 b=HD1KfiwSAk27AjrvRDJ2aBSt3CPSYGBhmhRtSM27xm4YKTFqP4fyJXFCZGbIbwhll/MEGjrIo
 U5dCm9GDej8BnePk0B56Fi1g4CwvYzklxC/bB3Fy12lldj5QP3v81x1
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: NmljIKLtrGspFDMI6fuAok7Z2Az0kcmJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3MiBTYWx0ZWRfX3YiuV/Lg2AJv
 PP4IqoM6aIewaFjQwGyYRZqzxwTpGvnTB7f9oFZc7/7x7qEJrFgMKOz1oGKEmNJhZokJdvwuDuv
 Lkx9KY4rcs0fNHtgutOPJ9fEwA2o7LNjHbRVIKG+8VwL6TM4EF9cle+VeWK8bV7eZfDLq8z2AsV
 lAihT/MokztwO96/BzQzwQ4fCmphqD5VIOYood2SPQ13gPYZF/vSu1Q7XivU+a4b+ptgfnbtk3Z
 HpySouKuz0WSxFgnIqUDt+D9rH7VKLb2syMZQlyAwNbeHYH5clR4bC1rnbrf6Z3UBRvkFNmn+ii
 2VIxf2kbQfBkmgiY4IRzgpdqif4zcnqykIHT+GXYSLwbWA74EVeK+WP0KVXmMrfswQhOUFgbxDA
 yUfLvv7gLh8ehmcacGKxZ1+jzUOCEtRviqFWLNoK626B6JHMrd3c0JjiAZXaGJvC+SQiCGEeFIA
 x/gX5SP37Q6FZa0AIGQ==
X-Proofpoint-GUID: NmljIKLtrGspFDMI6fuAok7Z2Az0kcmJ
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a55e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-PhlUL0ANfhXhD-FZUEA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_004218_273245_212D7FF9 
X-CRM114-Status: GOOD (  15.29  )
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

Setting the global_flush_req register to 1 initiates a flush request for
all enabled TPDA input ports. The register remains set until the flush
operation is complete.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  8 ++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 45 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  2 +
 3 files changed, 55 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index 735ce0e494da..c8bc7b19ab25 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -33,3 +33,11 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
 		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set global (all ports) flush request bit. The bit remains set until a
+		global flush request sequence completes.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 2186223ad33e..d24a9098f1b1 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -341,7 +341,52 @@ static ssize_t tpda_trig_sysfs_store(struct device *dev,
 	return size;
 }
 
+static ssize_t global_flush_req_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	/* read global_flush_req bit */
+	val &= TPDA_CR_FLREQ;
+
+	return sysfs_emit(buf, "%lu\n", val);
+}
+
+static ssize_t global_flush_req_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf,
+				      size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	/* set global_flush_req bit */
+	val |= TPDA_CR_FLREQ;
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(val, drvdata->base + TPDA_CR);
+	CS_LOCK(drvdata->base);
+
+	return size;
+}
+static DEVICE_ATTR_RW(global_flush_req);
+
 static struct attribute *tpda_attrs[] = {
+	&dev_attr_global_flush_req.attr,
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
 	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
 	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index c93732e04af2..1cc9253293ec 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,8 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 
+/* Cross trigger global (all ports) flush request bit */
+#define TPDA_CR_FLREQ		BIT(0)
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
 /* Cross trigger FREQ packet request bit */

-- 
2.34.1


