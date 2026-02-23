Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C25E98DEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=SZe/5zfdTgUea5roBP/OLBP4lN
	3quXspkmYuNsbEvxcfzydrFee68Q7dFP5Qvb6CnijjWfNZK32uy1JKQvu6nxA0LXafTXFwPBA5Xz5
	ZDTuF7LZIgFlJDi1dZ6JcjalxqKNLemcz7v+PR3RGr+TCvMqPUh5eiRFLAFeMXDTqPJKiJ1P/FJhs
	6NNWm3mLhG/iZzDdN2eqPI+tSmVng/OcPMrOdgGtRpkmzfxCkrAvau7Ke5bAETs+C453QwqqxPOOw
	GEjTgnzqDh6HhPm0OqHQgk8l8I3sRUd4EMn3APMfWRbsdRQvvXQUs+iXB2SPmh0Hk5QC6UyvKNtjm
	zcwKNgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPgt-0000000HJ7Z-2CcQ;
	Mon, 23 Feb 2026 06:45:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPgq-0000000HJ6l-49pc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:45:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJj5rn2425433
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=; b=Gt85oWnEcPTFwVoq
	1Kz7eSbhehMXi9y4glNxoc1Ppk/rS98AEXxikS2feuNsldfPtVGcvYjANBuvHTyD
	zX9s9/Q+Liu2Ctn2SOXpNmbtKbB/ZUNPDRU8MCBihMm+4SgXOE3ea3uuhVXJwm4g
	+K1/Evk1WIXqLZXhxYXdEkAC1nMFs2W6HKqdFa8Grkpp7nWMXLh94XrpUcSNhndH
	XHflUq63rnHX+Zak1vofPjnMM/1PipFuSQdmntf1Tj9+/n6WSkRFTg1wkRaX/xsw
	olm+kdEeO6evQ/p6cgyjulXEyKRSwylriVyHc/8oi0m2w08NNctrlUj0CE+oZAC9
	JfRTgg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgupeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c5269fcecdeso2439275a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829107; x=1772433907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=C5b+ezdHQDDP3HKmy/S+vWpkDvJWohP0W9JkB40SQ7bgjz4MEXvW9/zdXnZpZsEYvy
         TYZHsI3JBzF3QqrekaegvKAtnJCVzuri1VA4XRA2I1HtGt3MA8RosiGf8sBWEIVFwspZ
         Q3mw2blSv1tZBZ1f4rDPg5LF+HAlaFxXhAWktjzlqAyp93YBnSASn2kdjfMIjIxYhNrO
         V2edduFXtbItMZSgEEnSmaM46PCpxvs9yPuUmiUf1vhT2YIa8eIumeO4vg1QudvV3/y3
         0XARFoAGDvzoI47PEAyJheEBcfTvGoUV9woHkCP2nLk6f1kvunJDkuciddSiGZZUyglg
         zRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829107; x=1772433907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V/JNJXfM7FDohbLniT/dm0wA/+qShrtEurl8w70+rXY=;
        b=M88QZt0PK+hO9dh7Phh0+cjGjP1JAwxfIRwcGD6IgRf0JE7Uc7DnGm1W4nUAfFzDJh
         +KGNe41qnlsE4VZ8uz7niPZYwAnPelhlRR5kYQqea57ki8+k6rL3jBbcmy+LEs0ac1jB
         nZej5ZsONtZjtcmTIKIbKyUqjtCsiuyo4rGQNGV3R8EUoK43Fu9+6FmRfFFpJwAnVEfI
         K4pKfc+q2kzOZ3SATIShdAGsXXFJStcnaGrWtv7GUQ2jurOx6NswBiHoaalQ6Ftw014T
         c36Kk3e0nfaC4sjwTihfK8+pTFwL/9uwjjk6uiEkrKCQni9m7psUA8HZIYC0808EDr+Y
         +ArA==
X-Forwarded-Encrypted: i=1; AJvYcCU6RcJ7XAqExW2fDTmIAx6Sgu6by20ZuaBNQmWHbjUOZcyZYsexTs8J6fliVm+ppz4cva9EnoCuZCEGLXPAtA6k@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx/5bZHuXZAL3FGXf7ZD/r5b2p+fV9Vtva6qnrDrtmhAp3rpmX
	lwtVW7ag7tDVJGtb5UBg3pLoTwRY932NNVPKKzMVkXCi/li38/jXVG/OrcbQ1GW9bS38gCsRQ2V
	gSazki7bWDSTDXQsVqnV3Gn7g9OjuWW9XP0bjQbzQ+URE2BlAnQFQA9ysU8lV6lQlXdTlAInWvd
	2Wag==
X-Gm-Gg: AZuq6aJeTkC16CKV5xe/sFqk0IWGK4bFoDFCfrt0ox29juLy1qAvyF8mi+d1t4e/hHO
	T40udrEy6R9vpxOWcM7sokZagibMV2Dz2I+Tin+Tj6/r/sBhDzuCdD3ANs2G7FNgd7P7pB8dM6E
	asMUx3/bfRD2WAHcI2wCm1oxdkn0781Iuql7Po1aCUN2pdjQrwNAqBIkVDp88EGkD1UT2ykkFU4
	s/OjX3FrtaP/83xTv5GGRAIMs64lIrVF1acU2xbCgmBdPgD1H3iOUythaqc2qP+C7DFavKneBRj
	IXkhzAf6IsFMR5ixvhjmkGV0z4ZxzPZmnQt4VXu8O2DOlIrkC5k3S/oT1xNe1Zl0ZDNIz7IJafD
	HEZP9Yrr1KchAbgEj6xbROcJ8zSOUNObtSERAh4Tu9Vy6puRZPi/1HkBIilbYSqyj5BVPrVvx7f
	8Nlrqg7djGarcn
X-Received: by 2002:a05:6a20:158a:b0:38d:efcb:2e84 with SMTP id adf61e73a8af0-39545ee9279mr6513130637.32.1771829107432;
        Sun, 22 Feb 2026 22:45:07 -0800 (PST)
X-Received: by 2002:a05:6a20:158a:b0:38d:efcb:2e84 with SMTP id adf61e73a8af0-39545ee9279mr6513109637.32.1771829106926;
        Sun, 22 Feb 2026 22:45:06 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:37 +0800
Subject: [PATCH 1/8] coresight: core: Refactoring ctcu_get_active_port and
 make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-1-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829096; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nzaF2yP3ATiqQC37LSxmXVL9MqWLOY4wwOUNTmvz/UA=;
 b=6PX0+KbbUxmx0pLLi8jsGxkcATkRnlG4xmCYKqJnrQba0pudV9Z7EqTAJVU86wlPFlBQRecKN
 A7FhRx5xw/lD/7MPk7J4n0yJTu3Q08Kr9uXwdywud4R2PpUsgmVgP17
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfX66+79n1u49YO
 UuJwJYHOmYAgcXcUw2r97mwuBLqTep7pby2tqmbWHHSfyfzZrhMuBYaoY2uZugk/lKk7eBmPSdx
 AUIWrE5pz/2n+LBhOomcbNTI7JVYMcS6+rTcPpAkcFtO1vIcj0kBPO3D7lziJ6ZHJDseHtxmtBk
 Ju+xIm0mRaeRFMXqqXp9KgFchAAJMhsr5UPZWmIhG8/WLihYl189tTgPnerNi9CO453Ck80xfO8
 ctGnOeTJwTLTAFzh+xm/7+s/9CX6PO98aPEmKmds/XA6aTiTYmyvYPCB9Z7GaVCLY+OyeyzEzhh
 H8gg8EjVP5ut1b09XPBXjc+El3kQPLnqYSPlAinAWkDAqX/SAyEvoVlCBunG2CNzg4EuMA9Rh+T
 9c1rMpK7WokHhwY/8v194cPyeLbZxhZnJGNPvJpgLGGSpT8W7PVlXFGkkfg6kjuQKYEDJZuf8Md
 LirPuw1IuvufvmiQaUw==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699bf774 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: e784lMNVacl2ZZ73vJDw3jeoesrtVPsx
X-Proofpoint-ORIG-GUID: e784lMNVacl2ZZ73vJDw3jeoesrtVPsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_224509_064472_A668E00A 
X-CRM114-Status: GOOD (  21.95  )
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
index c660cf8adb1c..5f55f0c510e4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -585,6 +585,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
index abed15eb72b4..78be783b3cb2 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
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
@@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index fd896ac07942..cbf80b83e5ce 100644
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


