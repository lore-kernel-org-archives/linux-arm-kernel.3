Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16738E83057
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 05:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=; b=WTOiexcT8ivJFSj0eYCeD8iXSy
	MOf+JoGTC5l5+KQ2BJ32sQ2oOKfz3WN+w5qFQicecA71m6rzl7+Q8A3Hn/0PM9+G9EX8rZ4/Dusk0
	vM4vZ24a2jB6hzx4bwI+n5kpLcAI2DT2TZo4XkLIIhAGEIrrG5iMK74FSvdmh21WkCCpSjEFoKd9I
	YtOFQfPjCbTc/p1oUjbBFZWXY3sdGoFatAE5qGSVK/jguYG5y26AEZL5ED4zsOfE788+T7z3xMMuV
	p1xnifnexz9AcFiNKuliq8Q7Qwy/y8Uf87RwWna1AcV/273JNERF+jVKT51hkbuxf1eVHvrKKFxC4
	LqTUHgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9L1-000000068lm-2HqV;
	Tue, 03 Feb 2026 05:52:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9Ky-000000068i3-1GW7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 05:52:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6132ebqH3386845
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 05:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=; b=X8PoCUAeHt4sKJuk
	q2uqwLzaBjMBI2nWiGa/33M27T4ZN7/1RyUhx/BUFkneQ2RkpTSlbXjYcTqLrn8L
	JVNAWfUnUDqI4+Fj6mQx7RL5UKybXcQoDBqWMuC8aU9An/iF8vglDF+l6unPhP+u
	CQtuIk1Juuh6pPfvk1grSmXwcHnEpOAzKTieEMMSJSH8Deug0wYw8r05bOVco9e3
	ccF9S2BxOzUIY4f5AaV+aaM0w0SYIP4V4tJOLCpRGF9I+v2y7zjN1CDYGEZCSZyC
	O00QvbrA9wfF3aGrTNCDFyx+dvtbfl8Ga8mIXP3g3YPaM24Sjk1XgOx4EMwEV5nR
	ECHiCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2xvbt7y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 05:52:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a77040ede0so52277095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 21:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097950; x=1770702750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=RSR/5N9jmdBOaOg7x3ZHAc+rqMu+2clEQ9tBJ+G28ePiYkTPY5PBYKXQVLMJugsXV4
         A5digkpoCTDWpbwqzCrGEHSCyXX4SV/0bASRbBqEaUuk+3wB5krj/3mYLs9LSui3QMrK
         zq55ogZcGH3QRH9sCNv+C4CtivQ+0GAQl4wZYFjk465no+x174oVEmkZMUzHFi0kkJf+
         Ki0aWinChMKJusgOicftQv6s193pTWImfmzUBFHMKtBfZCAwgbK/PCljos1O6sUt6ERv
         6Zt5nfKkNcmWbjfhT/ECKAGr6LGOp+F1Gs5b551sjlCTa5CHiODYnwR9YHDFGZcrfdCo
         JSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097950; x=1770702750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=ZjbuMDuf7tRl2mUgyni31uEm5MDvYctMO7auslRdMHjGtGx8wDCYyPt6BZcCSdQ46m
         G9UdI6NT7fQiTT1MviPL4WQsOOZWHCwx8TMPzm1cSs0HkPi79EZE/eJyWnUUtXW/vGQo
         ro7Luwo+oU9DLE5uVhnSzRRPieZYgnqexzv+D5m48NU2iAeIk6t/ZEewe0e95ohtrtYl
         BcJWXmLFQ2J5sZ+PuW/PKWujZyQ0WaSrcdzW6EA1QjF4YD/59A7ymNo607ePIeenmZwV
         ATZlH/VUT7QtXmm+Vzl5mY+N8IqU6N+1iG2b1V9LfFCq7abbEDwX4ZodfL7hkJxXFKCz
         PcnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkRHlc+i8u4kPH2qlT0i8JLfDpZ4eghUfPjRFo7C0EJJ+tfZOo0sxIKqLrnWhscqfV/n5lhYp0GhC78FqNnoG/@lists.infradead.org
X-Gm-Message-State: AOJu0YzahF1cjuklIh2/HhdmFZOQnDAov8HZT+DhrtJpVMQBaZ8Nk7nu
	eUW9CPtpDI4aQcWON4p+0kMqfbz132uxKTpdELF8dme7uz3T6avkILiK99HOR1ih0LOirIJ896H
	BFIZowAYMES5iJy5NtlbBM2VIEgzYaJZZPLC+FN5KBkINhxf5sVllO8qlgqTWHeCUNokRTW1Er3
	ljkA==
X-Gm-Gg: AZuq6aKBM4rysqNQX8BSMCf6YXv4awx6+Licn36rJ+Lf15FG4V4Ixj1wqx3j8n66CAf
	coFJ9cu/h2G2OhLWmBiW6w/BGsOzx+R5gU34WxHLf39UOubmQxnjVVcADDPGvjhRWFD80pn0juZ
	gOK1/ZK8JLm+GxxH8fRzldxs4Ozr1nAaWWtAite9bJjGy77O3i9+nMvnYcgVh4Ra52uqnJyXwZB
	wj21s+KcdLqtS160tr5VK2QUe46yWedvX9Vqmo5dINBwiPyrtu4qn9dd+pw+0VmDh4pd/xXTjHu
	2JDE2TrR6uRaAL2jkEGyFq7techhH3TxPCPtCW+bzzPZxdt3YIJ2JH72E2JBjAqeyQEbxcy1WAl
	R17EFwIY040LOHsvTzBQE5uIv4LY+kCTnnh6B8s1Lyw7Of2jfEFWvlaeLKArT0LUvRwE9UKvz
X-Received: by 2002:a17:902:ced0:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a8d990ae07mr158884235ad.33.1770097950170;
        Mon, 02 Feb 2026 21:52:30 -0800 (PST)
X-Received: by 2002:a17:902:ced0:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a8d990ae07mr158883885ad.33.1770097949600;
        Mon, 02 Feb 2026 21:52:29 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:29 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:23 +0800
Subject: [PATCH v12 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-7-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097897; l=3465;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+caVanCR1MkRvTlDCUseywuTVg2NMA0xm0dQkI5ZlEc=;
 b=0aOnb04P44kXcGnsHxDOb6cbQen5ROGAS2XQyDBqaHKVyj5sjZaeFpCmJjSPKNNE+BMBcZS/c
 FFgK17b8+98Ckj9YidIN7fV22sSSJPMwv7A1Kk1quwFNDXOCVSizsHK
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: CQBQ9Z_NfuqmaTisWE9w-n9lYHzZla_I
X-Proofpoint-ORIG-GUID: CQBQ9Z_NfuqmaTisWE9w-n9lYHzZla_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX7O/CXStwkcHk
 PRqSNaC2ndrDec1BbvILdNnC/F1O7pH/hbR42GECA9XGU/526+OaMltm8h6CNpJ761TUR/4dtn9
 9ae2OrYe046jOT5iQSiiEEBoqnGWlTf2p3+f1HpXjEONeKfWW2CfKPUpPNsALA6wmLzpKhZNVbY
 rxHBOk9+6IudhnmSFcP+bkph8hnY9DrmyK8kK/ROAoz9KyUKFFAtGINg70bPsg9o4pT/YZWhjoh
 bjqi8eV8OEGAP05F61f03BoZU/P5ubCim0gL4SUJ1MLpDSzmKBD8ms9TtSwQZ8l686jDUzmACV1
 JMe3RCJAsRDm+jRgJYdn3PoI3/yIqEVQP+tXGZ7fPtW52wfhFsQezT6HoEf4YFZv1MnYzddil6R
 dK7xjanD6SBV348x1cuMEXzFP6mGu00+i0iHhio0cjpP6niIQ+lv2B9fSeC5xSDklYTxDEs6Ppd
 PbZ2FYgCkvMvwNQHUyw==
X-Authority-Analysis: v=2.4 cv=AurjHe9P c=1 sm=1 tr=0 ts=69818d1f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215232_487119_41336097 
X-CRM114-Status: GOOD (  18.47  )
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

Add code logic to invoke byte-cntr's tmc_sysfs_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 32ca2ec994de..6486bdafdddc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's tmc_sysfs_ops if in using */
+static const struct tmc_sysfs_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *ctcu;
+	int port;
+
+	ctcu = tmc_etr_get_ctcu_device(drvdata);
+	if (!ctcu)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, ctcu);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(ctcu->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops)
+		return byte_cntr_sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
@@ -297,7 +344,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


