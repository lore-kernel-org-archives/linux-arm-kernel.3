Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90A9105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=NNH+oKqj25pFWq4DLtbx8mnkrY
	5ah1tPtM901x+m7A4ig2xnVl9f7jTg9hgWfAwA04WxZ3t5nkLY6ncEdmZoKTNXkFDWZ/Qvlg+jMQS
	KdWit4z71w72/HspuWMeywBE0CZ9/dDJParH/+iOFzd/lEvsMYAFiy/pz1JSdJkbfIVcmr5dQH7e4
	pZ9BDB9/LZ+GwaBlKVE5277YogxG6n7XlfM5dwUCk0UlneT4VVplu2cRIgqdoS5jVxrry6cq7iY2r
	nTR7238jE/9EPMftHDhq0sPOoER6itDCZ/ruA9QSDckH1+DD9olRnyuToHYriWH3iOkEadEVS6iXW
	EDeqHrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yPy-0000000HL2p-2BUf;
	Fri, 13 Mar 2026 09:02:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yPs-0000000HL13-3jal
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:02:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iMpD2262607
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=THZ0iXBnRpfwi66q
	bycRV2natZUmE2rHybS/kvBqs+m77SehKofeSekf/WSIseZNZsB6vA24t40smfgh
	L7GGveMOY+zhDhBhmvJr1AMyVk5u1BjiylSyw4xlDU8UZ71iUdqu3kyi2ZCgKzyB
	aD/qYgrE6uJEuZ9un974J2LjSou/FVvNuIQaHL7TaihRV11oB0/GDzr+DRKvoyCJ
	UhjXnh2gPoRMaor8VTmqfzcn9eKEfXp+EHbrmAFWmULiSfk2qz76yF5g3WuaTq88
	70eL+3pu0FLxgFDpkdYDUe2gBXPcTDbkUiZCUDOLyHLM2NqhpP2IGbOJstanf/00
	CFTZ9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4r9be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:02:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a02f3b8e2so8459741a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392564; x=1773997364; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=aIyS0NX3aMOl2bQnforbjkZsiOsLEImRAzFE7+eM5ZXzvp2jY1LduSskMpfctgwI5g
         h8zWFhMTyYUvT9ZDoZTBr2B1Ye8JVrfO5i4ulM15hahj84qGc/wZZViPwM5dABNwe1RE
         vRFwdIeu4aqYRz+vtilp3L6LMNBAXM4gB5gmeE0pYT2xjiyQ7WzurtFcoFHYzn1DYR9j
         RbzhRc7NnnHe2YURpYUeosyOEL165i290107myKJoZjtSKP0vruPOGrqZmnGcn1BKgev
         WvnlzxOoidmuCP7F136L5VwyDwJv52ivvwiTsfvgELerQjR/NE1Ar9qaJkXaz5uFz7aG
         QoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392564; x=1773997364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=eC+nP/+ltYb95ypS5CQwg1tCXXcGBIfGoBG5p7YC+8vN0AznctG16l0Kfk4WPk8lV6
         Iskj3bvOMvvDdU45hwmS55WkMN8WX0YvhOn5FMSrGkodua+VsoEYSKgCCLIQM6lMKJ8T
         zrDMwNywRZn49vyVJNO3CyYZbm0VpHfUFcZAqgEMUx7ufffU98XGxFjnr2XyCQVZcBe5
         ig9iEitxILdzg3sE2E1WAXtzlPDZG9XrKgR3MizIviYSMhYYeS5cc2YpjYS0f87AbsUd
         nI0iIaDK6mSV0Srlt0538qUL+iMne+ejnsNF27zj2ANl8fzQ5yHsIKvmTNSOw4OtzTRp
         xIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSV9IfmvhbiJjwPdhv8gzbeRYl2pGt0lfnrlsag97X7jZmWGCVSzmrMDTF5jwa/GUy8TZKDifAljwc9M3zAzNd@lists.infradead.org
X-Gm-Message-State: AOJu0YxYCCHdwhVOQtkWHMudYvlRrQ5CqsKp9FForohFlhgGEjUq6bBX
	jjmag7sWTRTisgm4JA0HOQMNhATXHB5IL5Qi1XPhm1pcCuexsm9MX8o+uq48ZUpzW3GY2uCHAZA
	QDsabaQDLQ6dKyKR5K0f92vJG1dVbEA1PMiHRhZs+9YjeWLXo2DckxriK6OgjcgnL9+v0qVcz8T
	DeOA==
X-Gm-Gg: ATEYQzzKjHX4u3N1mF9opol/4Bqh/+dzyuVg6Wreh2bfHdKyXPMuBo2EO+jdFjRKsUM
	Z+YalB97z1NMoG6zF3IQdPDeBnsfmsEdu9+EwF3XtNu/uUCSOmosiBnjGF+i1jTRgPrWjAJQYWj
	iAO1+KkyJo7eXnuVCL5X/YMwMNVFcZt2n+Ycha101rf1rLh0018AjjGsUWNfrA/z4hKoCSTaTve
	DMgeGMG3xsbZI5ZvCoFZJoH+J1DyzyjfJMPFKYToPT4/QVI1GJn1aVsZAuM2fkmPNx97MMYLGP6
	pD++7t5oDs4Ov2YJgZKcqrBiFKbStugI2aGyKASJ06bDZgY5NDx4dzyLWBx74cDiM+Fg/LFXlQy
	fj9l58GZd6kldBh+tKOBQVI/JJvxvwZZdjpRM3hAGO/SFTltj10lyRJjrYES3ukC6gg5uwRWZI/
	3cHF7FhgUU
X-Received: by 2002:a05:6a21:339a:b0:347:9ae1:cffb with SMTP id adf61e73a8af0-398ecab089emr2423221637.24.1773392563581;
        Fri, 13 Mar 2026 02:02:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:347:9ae1:cffb with SMTP id adf61e73a8af0-398ecab089emr2423158637.24.1773392562923;
        Fri, 13 Mar 2026 02:02:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:04 +0800
Subject: [PATCH v15 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-1-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
 b=c/dRbCE5JkmyLINGwwdPHLcTkYrm7yMV8q5tvofpzFQTU7KcXIJgFI63txp30QPtCREO35GBx
 Q5aR9IeTh+HC3vuo91oweld6aAYBhoPk90BhhK3WfITAv129Baly/sG
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 9DEBws-sIzWXFYVbVNSp9OqJEqL4aBJ4
X-Proofpoint-GUID: 9DEBws-sIzWXFYVbVNSp9OqJEqL4aBJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfX431tfo4yYmRn
 caxBqApDYhn5EGS7MpnPeBWUyHZMv+adK/qNWIx4IOtzLOFxVAMF1bWydy1s08XCnCzKO7WTrnz
 8+D/mjtqU3e31S/ZISqOP5GVH7JJoj79Ff3i+J9d7Q/Mey/5pp/FJZgY/m6i1IYV3vhjqqyKzVw
 FytMzt9e1+ri24HbB7Sq0aJHHJJ8nUFdJoiKiIyTqrlYIroqdW0ukR7RxHsMAC4wxDEFKVGo6P/
 rQkUs3F9UAb6Qj13uclKLQkh+wtplZi7zZoyQK2EOIstwTclZa7CkmEHt9nE0IjHvIdLxHN9BOx
 Li0Hl1NWI2G0VLOvugvjvfe7qZV9f4Yw4+uY15+qrMHZAg8AMbBnCw9iVTQJMucOOIJ8ITIUdPA
 IQ3uZzhbnYCap4BNyK+Rgk0+OTAZy98sFGjFdwiGASw8smq9bp3yXOQA4kQKo7wdhybLtSuVVUx
 T/nf6TBoPXhZadLPntg==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3d2b4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_020244_937183_E78DB208 
X-CRM114-Status: GOOD (  22.10  )
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


