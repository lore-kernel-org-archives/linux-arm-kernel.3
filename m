Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A714D74979
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFI9wvDbjwp3ilnQeTyimK9P4Z6vG59bEnd0aG99vVw=; b=x57nkSKQrFiGjoav+z8Rqpl+Yq
	udtqSbKsXmpC7cGDHzNBockBbQk3ocAFYOg1m4Kw8Hs01ILddRsD85UF7VYFljtlSsOXuS1YFtCND
	uCXr6y67thgcvspPm005QJNtZDk0d+PyWopje93ZzGDqi9cjELWtCjohFOgtfJLW04BYptabNP0Bi
	d3KYz/NHPY0H2x3xRps38xqJXQmHP36cTvLYO+qtkFwoXVNWf9iEpDN8Pkl6Or12uboKQzYv/llbs
	LVoz23oz/U/8KrRUuiSgXfeJjX/LHhQtTNApEzO7VHIPdFteBPx3ZB2OWz6qCICNzxoJpj0eeNMA4
	3pZ6XJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXMG-0000000A0c5-2Fvh;
	Fri, 19 Dec 2025 10:05:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXM4-0000000A0XE-3bTt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:05:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cLhk3991982
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xFI9wvDbjwp3ilnQeTyimK9P4Z6vG59bEnd0aG99vVw=; b=b2zSYhXyptbzATwV
	YdWiC3JdDLpvAWql3NzLP9liKP8AVYQU68qLI0mkoTIPEJbcOUS5eb+fktgvezHy
	NLaP8y+A0g3pghx5JyuTvjCoKAndnrRfjNmAZO1qhxISXbz9zfqq9dMh2/nSr7tb
	gDXn4CSoaV0fy9PYREvykptWAgWn6DwaN8ahBdXPycoVneH5pEwKtme+keR1LtU7
	hJwqgxrSqf2dkjrH/qiXGPoS7g+Z9l/Gg3jeudQ7IGtsPm2M+lyE1R4G/s3xUn1+
	8q7EBqXONiVIeWnEQkXdt9Nrh74iYD1vfI5zuNg8VX/nHKyXmpJzqlme+CX6uprK
	NoNMnQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2da663-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:04:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f79d6afso24884905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138698; x=1766743498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFI9wvDbjwp3ilnQeTyimK9P4Z6vG59bEnd0aG99vVw=;
        b=Mh/OBdR2n0RK2ziIXvy3u5WzudLOB9dIMz14Savyg19mUGAA4Bpeb12Ifi7uV2OkFk
         5guWV6AugLNPTAtXWOzvlKAKRuzdKAqgRJob6cdclZ5MHV6O+yJ+edMrrUXU0RoOTxlq
         tmvTVnN13Mk2tGpAno9bKbsodc5EjMaTf012l4EtQhpTlQMj9vQiXeOngJcnzYRz2Yae
         h9GGO2hawKPMSHHQz/ZWjM3OiqzjLSjrz7qUx3AeOC2mwjGJ7ps5M6UVXCpi971kyimF
         tYOQotb+RiIkzQcvnciGOBxPwlaz9W7BXwg9LFbfZrPsIZxQqXI4ikA/th0vRbehWh5N
         1ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138698; x=1766743498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFI9wvDbjwp3ilnQeTyimK9P4Z6vG59bEnd0aG99vVw=;
        b=ckKv1+Gz8N7w6cct2SxewxF+TKjCklFBFhMMw69TkP088+9WMn2G9ZTSDX8fFWBK35
         H+RfBOAl5Wa7yHEDiKcEEfn0G+nqB+NKc3b08XPEN5VwHUx8S+ruV5yWCzY1+/CUF/KB
         JSSlNuxT1BdwZmctCnJErA/GamGrWgVXCNyRmvXK1hzMb1A7R1pqnbUbcy2C3d8I1csP
         H3JQiAK/h88wiS9Hvqw9A0GCni9WBrCjepjEGrCu32CmKZVn6ejYop31wlFzQ1MiNQ2s
         cYznSyf/WpX8zqLcVTHYPkiip/TKw75CdIq+mQOzzQ3uQI40EBcyIa2zpDg/5M820kFv
         xDUw==
X-Forwarded-Encrypted: i=1; AJvYcCUIjXmg/1+PoQzXXpenppUuH3fkEczfyCrVK2MQRvV3O4vW8H4uEOeD9HHN2z3yRePCDiBc58XwYDg7akd87gO5@lists.infradead.org
X-Gm-Message-State: AOJu0YxwQg0VR/9X2I63/CGC71PkaKGqBK6aoNbgz0Dyk8p7SWqh31j6
	L9vb3b9I/IAvAeEyZxdz79gkUfCsw+h3uxHpFXpQX2v3QXlWUOb7QYfLjacdCDZlhlZCqZMPGWO
	KfpuiFPldHL13te9iurVTySFp7OxIuerROMjho9+GtKw8OtRkycEbIlNxHomGfQryHVcmPVZzcr
	QPnA==
X-Gm-Gg: AY/fxX7mI/dFgCaVqibu0SmJSgihIHS5ik7ly2h+RTLuobZFnbpA5gOiTNxvn/RuAru
	W6+DisKfLSRKIBSxmvqWYh/4dpkifCyjo9J2//XOf7s8J1wyjRc1mtZwEQiw27KiIsfrU6eCAzG
	QBkXCUHzVVjuQ9SAoSPDFY/awGXZNBXaxtQnKDfVwl69VPVC13/8hD+Hrhp371w+weg6u159Y1f
	NFGZBC0eD5Qssng5/ysaI3rAq6yyXbTEvPSC1GxCKuzel/RewDp6bEyyBXWFKwdDQ2q9hi21Cp1
	WFOHH90D4xIM/AFRooUxQOftmemxzcsFqYLnUBSirBf6If9FUgjU5w8E6/QDBoBA99z77Jhywnv
	3ZPluFq8c1GPZk9T+KdPPFPZr0KBiT32xZg+PDAlzMpLQZIAC0vvpGKVLkxOCx6+q5LW4Br/f
X-Received: by 2002:a17:902:cf0b:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a2f22049b9mr22566125ad.11.1766138698372;
        Fri, 19 Dec 2025 02:04:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK5pgx21W4IHOpHsDc411rEOsNe/RGtxKiJPU8c8Bg1GYeYo+3aPFE+vcjo3/9gOeez8msPQ==
X-Received: by 2002:a17:902:cf0b:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a2f22049b9mr22565765ad.11.1766138697745;
        Fri, 19 Dec 2025 02:04:57 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d74bbbsm18164435ad.94.2025.12.19.02.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:04:57 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 18:04:19 +0800
Subject: [PATCH v5 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-add_sysfs_nodes_to_configure_tpda-v5-1-ca93ddfe9d30@oss.qualcomm.com>
References: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
In-Reply-To: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766138690; l=11494;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=pYkWJ39bXMAgla+YRut4Ot+Wr3AUNmRRPeXCaTiOkcA=;
 b=mICP7fyWmwQuBtLJ8evjUCT3HDSruND5oM0Rhwtr2X3x2XZbxbBoY+AJztD/aeqfuco18adYn
 sK/QRELQHIcD2kxERIksDVA6QGqaHbXz8dZRnZlUzyylOI92AKg+1Y1
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6945234b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=HmS9xeJcQxVnfQIoWMEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX+rloiSoKYQo9
 rgwIgVtOpa8gSP7tHNwt90rc+L02wDxCerMR5yiwnmA0aXJ0JLgfNWrUSs+AL7xqLuupfn7ZUrP
 kjBwcjq4Bhg2ebGMx8S4AGSJikaEwKT14mzVJj5o+NI9IrfWBdxSCaGjZdXzUyuDbk4wzMBLoKy
 SnDn5q1mJ2Td50cre1NjswplP1PxkeUDRcGrm0tMAAkQn3gIPMkHzfTcNDDARqnGS7fIFaSxpSq
 IcowG9cKeeSMurWlijyS40ZIxlBK3600nGXnb3nnpwY6qwxGool1vGeBb+LggiVpQWRM04NotLy
 c2y2fczgqFvBeOHDakgNxwEXp6JHiU5yw0fnihKLObIySFoGK2GaMtR4KxChKRQcuV4+n9YPQwq
 l5e08hB/RE0EAdrXq121H7e19M1Ki7O1si9FeMVme8tZN8L6ZO321hDNkybM2atWjDCEjCN7pUh
 SxYIfnZlhm/xyxBB37A==
X-Proofpoint-GUID: JB8GCA01RxdwBWO6XV1ZLyFzp3Yu0s53
X-Proofpoint-ORIG-GUID: JB8GCA01RxdwBWO6XV1ZLyFzp3Yu0s53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020501_039494_8C47FCE6 
X-CRM114-Status: GOOD (  22.19  )
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

Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
These registers define the characteristics of cross-trigger packets,
including generation frequency and flag values.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  43 +++++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 138 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpda.h       |  69 ++++++++++-
 3 files changed, 243 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
new file mode 100644
index 000000000000..a7855922328e
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -0,0 +1,43 @@
+What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/trig_async_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger synchronization sequence interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/trig_flag_ts_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FLAG packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/trig_freq_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FREQ packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/freq_ts_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable the timestamp for all FREQ packets.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/global_flush_req
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set global (all ports) flush request bit. The bit remains set until a
+		global flush request sequence completes.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_cr/cmbchan_mode
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
+		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 3a3825d27f86..d25a8bcfb3d4 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -137,12 +137,32 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
 /* Settings pre enabling port control register */
 static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 {
-	u32 val;
+	u32 val = 0;
 
-	val = readl_relaxed(drvdata->base + TPDA_CR);
-	val &= ~TPDA_CR_ATID;
 	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
+	if (drvdata->trig_async)
+		val |= TPDA_CR_SRIE;
+
+	if (drvdata->trig_flag_ts)
+		val |= TPDA_CR_FLRIE;
+
+	if (drvdata->trig_freq)
+		val |= TPDA_CR_FRIE;
+
+	if (drvdata->freq_ts)
+		val |= TPDA_CR_FREQTS;
+
+	if (drvdata->cmbchan_mode)
+		val |= TPDA_CR_CMBCHANMODE;
+
 	writel_relaxed(val, drvdata->base + TPDA_CR);
+
+	/*
+	 * If FLRIE bit is set, set the master and channel
+	 * id as zero
+	 */
+	if (drvdata->trig_flag_ts)
+		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
@@ -258,6 +278,116 @@ static const struct coresight_ops tpda_cs_ops = {
 	.link_ops	= &tpda_link_ops,
 };
 
+/* Read cross-trigger register member */
+static ssize_t tpda_trig_sysfs_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct tpda_trig_sysfs_attribute *tpda_attr =
+		container_of(attr, struct tpda_trig_sysfs_attribute, attr);
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	guard(spinlock)(&drvdata->spinlock);
+	switch (tpda_attr->mem) {
+	case FLREQ:
+		if (!drvdata->csdev->refcnt)
+			return -EINVAL;
+
+		val = readl_relaxed(drvdata->base + TPDA_CR);
+		/* read global flush request bit only */
+		val &= TPDA_CR_FLREQ;
+		return sysfs_emit(buf, "%lu\n", val);
+	case FREQTS:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
+	case FRIE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
+	case FLRIE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
+	case SRIE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
+	case CMBCHANMODE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
+
+	}
+	return -EINVAL;
+}
+
+static ssize_t tpda_trig_sysfs_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf,
+				     size_t size)
+{
+	struct tpda_trig_sysfs_attribute *tpda_attr =
+		container_of(attr, struct tpda_trig_sysfs_attribute, attr);
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	ssize_t ret = -EINVAL;
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return ret;
+
+	guard(spinlock)(&drvdata->spinlock);
+	switch (tpda_attr->mem) {
+	case FLREQ:
+		if (!drvdata->csdev->refcnt || !val)
+			return ret;
+
+		val = readl_relaxed(drvdata->base + TPDA_CR);
+		/* set global flush request bit */
+		val |= TPDA_CR_FLREQ;
+		CS_UNLOCK(drvdata->base);
+		writel_relaxed(val, drvdata->base + TPDA_CR);
+		CS_LOCK(drvdata->base);
+		ret = size;
+		break;
+	case FREQTS:
+		drvdata->freq_ts = !!val;
+		ret = size;
+		break;
+	case FRIE:
+		drvdata->trig_freq = !!val;
+		ret = size;
+		break;
+	case FLRIE:
+		drvdata->trig_flag_ts = !!val;
+		ret = size;
+		break;
+	case SRIE:
+		drvdata->trig_async = !!val;
+		ret = size;
+		break;
+	case CMBCHANMODE:
+		drvdata->cmbchan_mode = !!val;
+		ret = size;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static struct attribute *tpda_global_cr_attrs[] = {
+	tpda_trig_sysfs_rw(global_flush_req, FLREQ),
+	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
+	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
+	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
+	tpda_trig_sysfs_rw(trig_async_enable, SRIE),
+	tpda_trig_sysfs_rw(cmbchan_mode, CMBCHANMODE),
+	NULL,
+};
+
+static struct attribute_group tpda_global_cr_attr_grp = {
+	.attrs	= tpda_global_cr_attrs,
+	.name	= "global_cr",
+};
+
+static const struct attribute_group *tpda_attr_grps[] = {
+	&tpda_global_cr_attr_grp,
+	NULL,
+};
+
 static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 {
 	int atid;
@@ -273,6 +403,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 		return atid;
 
 	drvdata->atid = atid;
+	drvdata->freq_ts = true;
 	return 0;
 }
 
@@ -316,6 +447,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.ops = &tpda_cs_ops;
 	desc.pdata = adev->dev.platform_data;
 	desc.dev = &adev->dev;
+	desc.groups = tpda_attr_grps;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index c6af3d2da3ef..8a075cfbc3cc 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023,2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _CORESIGHT_CORESIGHT_TPDA_H
@@ -8,6 +8,30 @@
 
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
+#define TPDA_FPID_CR		(0x084)
+
+/* Cross trigger Global (all ports) flush request bit */
+#define TPDA_CR_FLREQ		BIT(0)
+/* Cross trigger FREQ packets timestamp bit */
+#define TPDA_CR_FREQTS		BIT(2)
+/* Cross trigger FREQ packet request bit */
+#define TPDA_CR_FRIE		BIT(3)
+/* Cross trigger FLAG packet request interface bit */
+#define TPDA_CR_FLRIE		BIT(4)
+/* Cross trigger synchronization bit */
+#define TPDA_CR_SRIE		BIT(5)
+/* Bits 6 ~ 12 is for atid value */
+#define TPDA_CR_ATID		GENMASK(12, 6)
+/* Bits 13 ~ 19 is for mid value */
+/* Assign a unique master ID to identify the TPDA device */
+#define TPDA_CR_MID		GENMASK(19, 13)
+/*
+ * Channel mode bit of the packetization of CMB/MCB traffic
+ * 0 - raw channel mapping mode
+ * 1 - channel pair marking mode
+ */
+#define TPDA_CR_CMBCHANMODE	BIT(20)
+
 /* Aggregator port enable bit */
 #define TPDA_Pn_CR_ENA		BIT(0)
 /* Aggregator port CMB data set element size bit */
@@ -17,9 +41,6 @@
 
 #define TPDA_MAX_INPORTS	32
 
-/* Bits 6 ~ 12 is for atid value */
-#define TPDA_CR_ATID		GENMASK(12, 6)
-
 /**
  * struct tpda_drvdata - specifics associated to an TPDA component
  * @base:       memory mapped base address for this component.
@@ -29,6 +50,11 @@
  * @enable:     enable status of the component.
  * @dsb_esize   Record the DSB element size.
  * @cmb_esize   Record the CMB element size.
+ * @trig_async:	Enable/disable cross trigger synchronization sequence interface.
+ * @trig_flag_ts: Enable/disable cross trigger FLAG packet request interface.
+ * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
+ * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
+ * @cmbchan_mode: Configure the CMB/MCMB channel mode.
  */
 struct tpda_drvdata {
 	void __iomem		*base;
@@ -38,6 +64,41 @@ struct tpda_drvdata {
 	u8			atid;
 	u32			dsb_esize;
 	u32			cmb_esize;
+	bool			trig_async;
+	bool			trig_flag_ts;
+	bool			trig_freq;
+	bool			freq_ts;
+	bool			cmbchan_mode;
+};
+
+/* Enumerate members of global control register(cr) */
+enum tpda_cr_mem {
+	FLREQ,
+	FREQTS,
+	FRIE,
+	FLRIE,
+	SRIE,
+	CMBCHANMODE
+};
+
+/**
+ * struct tpda_trig_sysfs_attribute - Record the member variables of cross
+ * trigger register that need to be operated by sysfs file
+ * @attr:	The device attribute
+ * @mem:	The member in the control register data structure
+ */
+struct tpda_trig_sysfs_attribute {
+	struct device_attribute attr;
+	enum tpda_cr_mem mem;
 };
 
+#define tpda_trig_sysfs_rw(name, mem)				\
+	(&((struct tpda_trig_sysfs_attribute[]) {		\
+	   {							\
+		__ATTR(name, 0644, tpda_trig_sysfs_show,	\
+		tpda_trig_sysfs_store),				\
+		mem,						\
+	   }							\
+	   })[0].attr.attr)
+
 #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */

-- 
2.34.1


