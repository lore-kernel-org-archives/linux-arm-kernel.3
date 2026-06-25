Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358B2CDE009
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=; b=seS2U5BLRW5kwuYqs6QFyuxeY3
	AbA78EgN/fh/A4OCEE66a77OrJPUhifSsjuad+Jjs7iOoOjUbd6x1ypERupPh3JiyGw53XGdpihIR
	5g1wpsSFotJ/IGbtEoBQs45AQFy498Wd0HB7sn1BpDiGAgIVlX25y3N0e0ULCfVJEYmr036if8zgh
	VUh/zjGdoyEqFdmyfk4EfBajoeJPzUz35cYbphDfaYIQaeTZB9c0KJCR8OAwUnkNLUZZ1GmfZutTF
	bAZuk5JZiNV57RQ8StFR0hEoTOeY0wU3Blif6kl0yz/+nPIOSEoW5WMgLeDqMnghTuq+g4NLQhKU/
	HPlmwfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbL-0000000910O-1xb6;
	Thu, 25 Jun 2026 10:46:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbI-000000090yq-14aC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:46:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9kDPQ1948361
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=; b=p2vlIuEFK//7zrsL
	WruckMQiBkDEmLxwbQzmmfXGIGL5YOMMjWUSo+i+xpaX91ShoIoUGVXvevgXGeLD
	cIXFyN66VSv22T4lID2FK94VHbBkoJhf10M9BIbcrJcqiVXS9lJxUTPzebq3BwSi
	hCqycZ7QJy/cTuk15n/eoNiBUV5l24kQf+IcD5fQ4ILiSZmvuwx8XyfbBLpMqCT1
	WXlhrLNGD6I0RF/534OGWzZ49z0KfeaA8hsNK36vvdxh3gjpRAMv+1XIIe/GCzA5
	Uvl4+4BBns9OuUe/jHGFHQg1JfC6ySV8R5GlXwnYnd/qkNSMVpPDvwhrHIGDR+3i
	nJQmjw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8rxak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32faa62so32277795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384386; x=1782989186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=;
        b=jk7pc5FuC6PDOsmZcUhrSwc7TvGkMkJtoYiprMkCeFgvBuHNw0A5ZdKctaTKkIoT+c
         bpl/nVG5238xV9Ulb8yD7Zq/RVYjbr5kb3Nm+OHZM6c3gi9ZI3VI+Bv+9Z8bWGpXHht3
         PBYeC7aqRsSTprqvB/nncsfV/cql1ub2flRr6a+NJRa+VQCqs/3vyc2BzAvMJoo412Nz
         MwoSWoQqqtO+qRODmtgWCJDz3HN3j88JCqcHU9Y+ko1nha084vGKR4pyrCEAoObNupwM
         sfhnHrTbJkTnGzlP/z8dssRQNzfTLa3GItw69+qKjvac0b62DtOiC/yEzCU/i0AbrxHO
         9FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384386; x=1782989186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=;
        b=G3WTqOJNDAf3mjnB4mvQm2SKvEv9yXG+ycdoI7CoPOcQ6iyjrI95TzKVquuG3+clMs
         G3YpNTJf7AN2J25bhd14gdSenDyeWji0axOAyCrJyab6pJSm6AMla9g2sb1ayyg/Zsvb
         RWZTUtUgesogAVmRatVScXrI5C/g1q5p/b+INPFoVSXtxp9e+ngcoMN82v/F9nnQHiC4
         EYvSg35I7o6qeVQTVhPBDShkRPPd9xPz9wOGUzzNb6v5BFFV0zI7stnBWzoehobotcpY
         KSbZ/BxLO6qLxr3xCX2cTfcn24YB0q/qyTH1x9RY+0E7AMGsNv5OlM95D0l4njvTQn3B
         bhSw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0HgTGHIWWlofRLh0OAs/lUM/MGG4FUq2W/W3wgAyVmU2POT0HVE0fyitR8RvDWQfUrNpJB+XXb+6L2Qi2S3kB@lists.infradead.org
X-Gm-Message-State: AOJu0YwGS8eJ7fJdGysNWQWXYIr+0NJYJIfOp4jtnCcrdBxd16ZEhCet
	V0LFszx3nRzkWK/MU5IvtOBmRgl8amQUE1fLa7rORod8n4nZ0qRBNcSv6eOWbCj1xwQpN7YNtV3
	Bwdo1Fs3RcCC/HxrkuMwVcgaecww+p4PV766fgcoF2eipJ5jWhXX1Hiunl9tLRRNc3wdg5/DmWD
	qSjA==
X-Gm-Gg: AfdE7cl93Cl8noq/my4Sfju21YJxU4NLn03/8wRctbf0cawAjiWYOfQZx45fuY0SCPk
	5FU6xZPk2Gk64BDBPSz67HeHB7sJqyA3Uk/rRyhl1/18aSyH70AsFDIsuYhtjhkqHAYgNosNuo7
	dQNr9Z9IEWalytrIWMdFZz4+LwsAc4UySxDn4S4ebtHKZ8YHzoPRi+ljXOSeed2rlJPXd6NMuvy
	7GwxeNJjoEs4KyZb4byfN6JoBxEvN0pa+RQr02pn1+X3/3tC3sxejVJVzbhclqV4lekoJ8mAEmx
	tnfzYgVFz4On6SL6HK9w4eW41vmFxT/wlNVI2bq6VpMy1GCdkCF0e4CjEsoI7fdv8cZFj/18jr5
	SYhgq+EbuFaoDsWe5KUSjKUzX1Noob/SfFXybqLj/3eQtVMPMrD5JOB3HEim2wTOgNqVA393lfA
	==
X-Received: by 2002:a17:903:2cb:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c7fc9b9eeamr21454895ad.35.1782384386258;
        Thu, 25 Jun 2026 03:46:26 -0700 (PDT)
X-Received: by 2002:a17:903:2cb:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c7fc9b9eeamr21454685ad.35.1782384385785;
        Thu, 25 Jun 2026 03:46:25 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:25 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:51 +0800
Subject: [PATCH v19 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-1-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=3815;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=2qv5ewq1ayMiwA7pIPcW1bE63RIRPVWk501yvyFDS5Y=;
 b=3vlrcWFnAHSdC4q4HVI5kWl0yLxPjWU5FuOyiBV2dpVW3NmwTup+szP/owlmFgK2Y9EGCu8LL
 0YhWZr56BubDg2VIYoeooe2EAPBVOOCGz3bihyEpTHrkLSe0+ocJyDB
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX9M0e1lhOL4l/
 itXJPSfPVbnGqszANAQZlMoT9j4NSgve2ztlsxQPHsO0iMva8Shi6OsSHgOPHI5Pt5MXENgnghi
 XQd+aIDmv7yVENHz+v/9skUV6Vh9oHU=
X-Proofpoint-GUID: GFNji97DTrhOYW-fsYcYaIHcEIyTTu4L
X-Proofpoint-ORIG-GUID: GFNji97DTrhOYW-fsYcYaIHcEIyTTu4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX3P53EhiAYbja
 wh8J2DEyDBa4h5K/AsNtq7OJVv2j6eBBzCg0gJeWXJjqxPuTGpqfMH6HeQaA58cs5Z3DcnF+J0o
 i//+WhGjFdCxWCyvEQmcQEvN99LXYWfrGATQtpuq2XTiRDU/dgMZnM7erQSa0lRb/6WoxR/VTdY
 OQLtWIbGx04aCf2rbUKcY2Ewq8zQyl/hz8RHJXmsAErPD0zZFHlcAN909ZpYgu2J/4WEZG1Rr2l
 o3YexTUh3KrM16IUuebSUaZZQntwUtkevz+Hn9HAssy8AYNoPyBWcuvMp7KQkq/yN9Vsdp7VZGK
 Lye0VtR/e9U3xl8YpoXssWrREgmHQOBdzELcg3GA4MyQIwdIwZtUsrD/5mLRgza0ueqz/l2hSKg
 xQz6xtVMqd1Zs6Evy6zNu7vZpWJ5yJXTDxN2+JpPFWJ4Z8NlHD4JSZk+5hZOJUMgKiiYSidd2Iz
 zB7ghwflFYRdxoinaWw==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3d0703 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034628_441866_D6511EF3 
X-CRM114-Status: GOOD (  22.40  )
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

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +---------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d574f..7a7a85acdca0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


