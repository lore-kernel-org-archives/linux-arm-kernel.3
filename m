Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DFCF89251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=3tnQNmVu2J2nKutTHz1vj0sP6t
	qrC/u4xXyqx8E/Trs4+qAJXkXsvxkbaWdyNq5KQPWvalWP5cwxD7eAXZjNSvygiLd079/0SWDsPWu
	thMYz3GNPGw61f0ipDI5kojjTUaWzXX8Te1CqNgRr2TphqFUqTfOmjv4+gsck5GLMuJuaqgx6kD37
	jRqSE8GvyK4rHIx8bMxL2KIVTYrraDTkeX6aWpRZMVRQSwImFBd8FYV84TfAISpA8zVRJZG8GAmv8
	2rRKh8bCET3Cy8jcma8NIhjSFD6Vj9b16liz1RCWE4GPuBw72jgBXPK7iwyvIp4VjcNaK0qtLTr4z
	yBrY4Ung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mP-00000008Tdc-1QVd;
	Tue, 21 Apr 2026 10:56:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mM-00000008TdB-2vqv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:56:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA2bjf1809111
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=frT6FFwtwRq2fagi
	yCMCsmR1P1rleRvNY6MMcT51/wjQxDgyS2GEV2R4dxDtvTc2tQ0eEymz50l2Pjlc
	jTtxy2v4AaW4wUgZZogfkLZl4PPL5B+ERPZG9/RLPgVsIOQxJVeaf/YDTE4ZAsPc
	kGgl6RsngDvapEWPrJglv/fVaAuxNyIjdIJ3KZVcDMqklzPRH0/VpYPJMjU+NcqR
	547SujVR57i8YnwdnGwQw+ZpbOPUgehwDLh6eQk0eE2RQtNZozKrR+0CHq7ruqj9
	F7D0N4w/EoXaHjYrci6mE3bg/KoHR+6nPnh2HnqN36PNUpA0/ZINLg0m9bWxK0in
	wKdeag==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp74xr579-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so3666395b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 03:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768988; x=1777373788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=XGznRcJJLTQ/gKhdRVOhPM2AZsZove/+WbB2BVHnVrAdGk419HmKZ/f+yduqbeqOqx
         edXCVAdkQNXsFGkmcmBBc0HwAyRyI1hK/U5XqGXSDaWvha92YnORyLANxwC4XLEkNA7Q
         DmObLvIqJzAxII5PjT8996GMfjyno1JUhoBmOq/uO1rNC5RjEAraXTXCPLUaWK6Rv58L
         eCqmg8VBU7GRzgRg7CPBQIDPqfEPMIc2Km7AmjJ+mFI9iJWuefT5dFFFE9zboclJoEMj
         ElVLCYkxZ8C5iHZrxfL/UuKaXZKdM9m4auQDpfU/bd0woWD+8hJSwwvqNGqe47GnsgAP
         seiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768988; x=1777373788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=rLo5yyYKUCF4qekzI2Ax+ZoVDXFNMNhLyYeLH2UA30wU8EuBBokTRjy/YgOVE6iEca
         YZpLKFx3lHSuDU9CfelX3z1PhfBZOkvmD469SbdaZ+B5Ebub5p4s5EOLl8J+NETJ0nFY
         hoIh4ABrqs6InuADLsXkdOK4T8OFb08ZzZwimeaI09lqo5lX0yidjnUHi0661i55ZYga
         F6XSgFpQboHXz6uyml6k9WrNiw2m5ZQMY8mAIrQss8dXtILVxqQ32BkcuYgXCczNzUdj
         iLV+8WGjPA19NZVZQ+1oyAYHKWQY7d9MSdtFt0STxSB8pv3b3MgsKp4+TjWMkaHVIgqf
         83Hg==
X-Forwarded-Encrypted: i=1; AFNElJ9pOGIVMyK2F8AECmsDhVThinBpBqcoXaiZo2cVuatbuOLdLrvGjULG8YmHxiUxcx2/rCVCcNXMGP5S1HO8VsD7@lists.infradead.org
X-Gm-Message-State: AOJu0YwXwyXk+JULyi2EwJxHFuGRtrbPH12IUDsfjMgIjgjr+gGzORU8
	70WPXFfOoReruHrCpWaaCPzqOSKMquAfzVGGf4ZfZ6g8AHi0xohIlGQoCGlnkcTvnYpuKoDlGni
	QmHh/bfs+UD7PG6nTlhXiT5RZbN1cIpMSjBQq4bSE06OYLGGFcRRhDxZHv6T02C5sB1bs/RRDab
	lq6w==
X-Gm-Gg: AeBDieuRoj9zzmWyTKwIGC/QYbFz4kd62pDyl/igp1Tv87eqMlUsFLZyLgJ0cBQsLis
	+PYcbJYtdrhjg3rSY1Ei0bSC7t+22yfu/mUG6gMNQqd1W6L0awho0bcxt9C00wd5x8BqoTgDMU5
	EJPUxiBuJs3XQSLrGXsClsM9/ypsN2gOpzhicZGmT6yxRQ9zoRqcqm04FvZVUDNBhhX6EDMrXWp
	qqY50YKVdG9JmDpQh6Jr4LT5oqaW2fDGDP9Im1AFp9H0yDF6vvNxVeuZs/sbjKiUjPOCg7PnN7G
	o9YHUl92GSb/gES5pj1KkrQlco+IYTodWCUaoVmnSuRd6ZipIEC20aCckW19Ko7T5iSRot3oDWC
	+NO2Y7/6v2qkV+8Ypn9baqf8QZkp7tES0ZteNlpColy4DvWG50xlIx0hZmQd8h7DEKIJ5DDD5pi
	9Ba9atMM+fq9AlikyYq1g=
X-Received: by 2002:a05:6a00:4fcc:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-82f8b3861eemr14836826b3a.7.1776768988086;
        Tue, 21 Apr 2026 03:56:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fcc:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-82f8b3861eemr14836784b3a.7.1776768987579;
        Tue, 21 Apr 2026 03:56:27 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:27 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:50 +0800
Subject: [PATCH v17 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-1-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768975; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
 b=jJqeS412XiAqfCTbtdzyLQXnfDg5+q8/Ah/2X7ff6xs2SFRDsFaqNUfSyRmR3sH54wGIc4VWS
 x30XByjBve6CxO257mPlnkzyESL2AiiP6g9qvFPG8SB41KM01M0g17l
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Vq8Txe2n c=1 sm=1 tr=0 ts=69e757dd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: r5__ARvryCIjGga7Ad4OdWUfHu-V8AbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX0HZhY169IkAk
 gE0V2JLAVrIQEKi/owu47AEdqf9Jt0r57yWXyDJw8lAxpdExoErGSt+WzEyUngyMEU4J3k3xULY
 DOM1T4I/MOQA62aed9o9siE9RxIilMXrKq9oKSSo2mfZ+/tip55SWYHzc5t5iJyN4osJOJmNTZF
 HoXzUVkX4lUQzrLYCqA7D+oXY4MJgCjM8dmgI9lyaQUhz6y8eFXM75cx+PqwFIrzj4DclFdIZI7
 xF6D9V5i+Fgt89e/BqSBuEjAeflX+v97Fez4uPf0Pt+6AnQAipkfUoHYkYXl/KvUjghzIgo6ef3
 GHS7mvz017+A1ziD7QtSD3zVKrCW2Mc+7Gz7JahsDvjU5sqTNct1fQX8Re2hVLLk0PuCwtJSo0f
 WcoliWQKVXw/juwSuCl+Cg0rbB+naSk+oi2Ofx/QiY1JqwMrqe0LQAlk6rqP2RxWgjQnO9c4f8c
 TyEeSc3b8rQRR9DCZdg==
X-Proofpoint-ORIG-GUID: r5__ARvryCIjGga7Ad4OdWUfHu-V8AbR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_035630_910291_71CFA650 
X-CRM114-Status: GOOD (  22.57  )
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
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..221de57ca57b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -588,6 +588,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
index 1ea882dffd70..5532ec82e82c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


