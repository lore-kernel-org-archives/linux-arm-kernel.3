Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E4EE7542A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=; b=hh+9dsKCsqLa51IbkUv1hTZa8F
	/qG8+pAJm+KRLhcePWxaKWrG8vUdJd0j5PZuwu9VNdLn/9+q8DkBBJS6CGzyGW4oqN7YisCzP6jib
	Pi1SCyRuJRGGJ/EySerS/vZVs95CBuGJl14MW5W1BRUAgGTw6A3xks9WppFkgKhFBfYSjAuy8F8/w
	RJUA3eWRthbfuXdvRfcEIszTfrAUdfYjevdpy7Hrsh/Q1Mk6sBh4EX2/BiaNMYrSmJbUoxKFQglZJ
	tTl8FnAUVdcq8e/oMFt8n3ZCm72lrXDrF0JOkAUeS9UqO526HnbGyC5NnVuI0HHWMz3CTLWJ6fYxE
	y1N4ORKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKqN-0000000Gbpj-0pKE;
	Wed, 24 Dec 2025 09:07:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKqH-0000000Gbkm-1PIm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:07:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8PCcn721286
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=; b=Xc3zRpH8LgHJ/XHO
	XQ6wcSyKWOHzllg2/iBJ4sR5z6j10AvQc1VrWD7co8MuLS470yXRfYOJbPEURAig
	vHGn7wabZ6XwZky8aBUY1xO++ZULXeazWZnNF1cu1O6ASXcKHeSCS/JfL11m8JgI
	VwMHgFasds2JQgfOa6eKNSNzZ37DcZrEjxPqnVizD5xFKb4h9NKFXupTv+t920tP
	zLYE+h8MTcXTKE001iO0NXO68TNGa9h/GYtG883Sc4JakZkIQA9TERtrKMOivJtx
	+EAn5njYZjZWcCQVUYiVjTtPCEltZ1YBcNa/Qr+fdlL+jPB0/yB07Se99DE8iDiQ
	441LvQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt9r6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f69eec6so72554825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567255; x=1767172055; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=;
        b=j1rm19aFQDBLOQfuaXbnPnmWNbO25FG/leEYG6yfl7wEyTLHsUp4JIMNFZ0ycCZySs
         vB6FM5HFdRE9EU/niInXqYyPR6DBRbsPcc3E7no/TbvOIXQRw7e5y+nFN/4KYtFz/Paq
         zoOljEBgh8L9b17BiOG10tlgOYlAgWCpx/tlnvzco2emzh/I6DQUQuWSdlDyQLRox27M
         C2YJcwXrTTnEg4tqMwlFYEP9TMj9gwlSxKF8oyzWzbGwD6ePYopVyKJQP5yDNNuW4eQ/
         XW3sjM7uAOMseVAvLrsV+TIDVm12VwlGdT+JKzLic+sOHM8L6oXolIzQgYHhjSLXdbEG
         geaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567255; x=1767172055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=;
        b=VntVNzOK8N6PhESgxxsV82PPUvr/KqWXC8spcYWWWAm6qFbI1gJw6JDEnYpccnkIue
         TU9/bv9yaSzTnXkFxdrmZxK95H9qitcazXm3FxlvwNqB+aukXParF+CDO4EcTOhuxT9Z
         vhP5Caqd9MWCOShvBjl1lDJarD8pTTZB7DGHIjyKeAqI0uO8y9Gsgtqoy23j2imDR6Us
         zc6Xw7nXA+5KJ9c7439P0yLOEe8BeVMnGvhiHcYy3jeVTIx03fU/1VW3S4HiC48x2X13
         J0Mm7MSMar7j+eoQm/YEPvq7bGl6BI3A4VRnbue/7L2NmwVtTGz4LLQDKKxF52U1jidV
         J2Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWmFaqA2qTmHm7P83PjHmlr+TX42ADpS8Ub3TA984rRCUNw2DAZPJo6PlQ3np0CN6nhOXc4pFSTbet1WbB4Nb8Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ZSBdxEfX0u+NaJGMU3nO5I5eING52zt9mRyJGThYvHx2VWw6
	S/ZOPY1oHTC/Dg28TFSANzSKXJxsXWr7B/10wsrdD6psESyhW8VdV/k0U+hDdo1G0b3mExOI8JM
	4npY1WBvEDDhsWw4Je1Bb7mXeRgRUNebf4g4gGLtrN7k0DjVaqzOm8+bkGsfVaZKEvBr6SCWbTr
	KyGEVvVmL6kg==
X-Gm-Gg: AY/fxX7qKNcPfiSDoqy3/783xiiLIwjU0WE8hBmfaNNfwvWtnglNRU0RUMF0+hUy2fR
	dlCXlEeB1FyYpmU8KRFBwyxA8CJsc8CT3KJCHxmo34eFPmZI2Z0IR+DuaQpnJemmNFtLrdcEo0x
	jSIm9E7We/e7ETpDD/zJbXDXRKlYeYKI5ks5PUBO5ANAhAjWUzCii4LM/VAA4567y57I6atii0b
	EiH2kF8/Ve91nanErVf99p6Ls7s23PwissCalDF1yJ8ySK7MD0jYy0vy6bjra3Izlcuvfb7lqel
	wlHnhQIdz3qljIzg6x1QFJ6sNGCEGlvh3Fv41ELnUqnxQ9+gH0NBk+VCpwsPZbPBwVdxRtK7hqX
	83fY+LIXDaa4aFA3kFdH5dLSgOxs26D6a+UovDRDajuRLHtHDOcRET2jnbvjgo4BUYYRUHCsN
X-Received: by 2002:a17:903:249:b0:2a0:fb1c:143d with SMTP id d9443c01a7336-2a2f220d70bmr166139315ad.1.1766567254848;
        Wed, 24 Dec 2025 01:07:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtlDjLrg85QpNs/nDXqL9KQlAfHLs/TEb14kZhD7bfB8JqUkFh5EDf0SN5JVIgyqLXbuFdZw==
X-Received: by 2002:a17:903:249:b0:2a0:fb1c:143d with SMTP id d9443c01a7336-2a2f220d70bmr166139015ad.1.1766567254297;
        Wed, 24 Dec 2025 01:07:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:34 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:17 +0800
Subject: [PATCH v9 7/8] coresight: tmc: integrate byte-cntr's read_ops with
 sysfs file_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-7-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567216; l=3605;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Oy7z+jq/TjNetJ2Zgz+w8FIQKCJz069QL66/p8AMAm8=;
 b=uSaM/v/6IGPwFdUgM27elSIz+7592+G9joqAqMykPDiujN0xGFIL3I8ImHLoA3zeBynz6jEHP
 S7phaA0hB1fDJ0se5c+j5hyfyFqHefa53uPF5zL3nq8KKJlDnROnRz8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bad58 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: liyObfR0JriiSsWW1oDH7oK8nzFo6K48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfXzJ0JLgKH0MnW
 qXbqE/fWuEPemLF9TSNH6+Ilbd3fzTsjKcF1eGQhKGVMPLM4iKwCfUPn0ybdLBbVWT0RPYtF+nL
 uLHiJ4AnpMLZZKxpfSi0Ko83Vw82y4fLOIrFZn/yMH1TizE91l6t2W842PWhbV0HQXHDJXzv+kD
 zbtmHoSgZX1VP3xRDpC/3HgwQhGWgsLDrZl9e/e22xsimnnBAOSh/6Iw8ye8yHHgN/3GXY33j9/
 QsbW/07tZNdWbiFDHUxtO5FG8bZI5C5sWDKRQuMcMINc31XVQTQaW8s24iX0Hpx9nYccjQC8YxR
 pe7TbrD+gflAWOxzYzkyqZSkApHtWy8mgm1livilbvh41WcGS23eXq6DMrexHiQ9fYIT74Tc79h
 NhcXKHIWMKWquRy4gGywd+HFpremHOl4RkXuvbHJiYRdNaZC0zp2wZXt9lw/SUY0NORKdZ1/GzP
 h3oKusZwXVkvRCI9bdA==
X-Proofpoint-ORIG-GUID: liyObfR0JriiSsWW1oDH7oK8nzFo6K48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_010737_539781_079A149C 
X-CRM114-Status: GOOD (  18.45  )
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

Add code logic to invoke byte-cntr's sysfs_read_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 8b0397a77e57..5e74f33f6a23 100644
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
 
+/* Return the byte-cntr's sysfs_read_ops if in use */
+static const struct sysfs_read_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = tmc_etr_get_helper_device(drvdata, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_read_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_prepare(drvdata);
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
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_unprepare(drvdata);
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
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
+
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops)
+		return byte_cntr_sysfs_read_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	if (drvdata->sysfs_ops)
 		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
@@ -300,7 +347,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
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


