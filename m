Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553DBCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 05:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMlKTPnWLB6KAjDSvcqtInqYwyX8cf5M0iQm9SoLBZg=; b=48FaGGOym3F79qTjOL8WsAjwXT
	eyxoqpydekXu7pYvq7XP4Gebivi3A9Q9lWtP6/pGwiV9Sym4jQB4XUdgtNx+oNK0NpcsNFbTrVsmC
	PLMDTZcdglMNFfRlWEN2Z54Ps1iz0AZBlizDn6iBIVf1N4UkIN8n3PS/QCpfI2x7htg7n+9ePD14Q
	74PHpz9M80HDyoCjctZonSrQkmjRqNjgNPF2h252uTMskoclZq05XD1mhksuZ6jGmg8AL5vFQFedK
	C+xVx6bDN/SdCK+vo3S8huROclXOKXVO861hVL7l9YwPCDDDIUSx+IwOZKCcCWgvlI7e7rjPLasad
	q0Ac4qBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRu-0000000CISn-2Pa1;
	Mon, 13 Oct 2025 05:50:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRr-0000000CION-2XCQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 05:50:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D4q4JD021855
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMlKTPnWLB6KAjDSvcqtInqYwyX8cf5M0iQm9SoLBZg=; b=WNMkMmULutiH/Z5s
	NfoRth4fLrrifppREYfbguCkZvX57TiwOYiqja0y1wS19D+I9D9mX6cro2mL2DCC
	eqVsxhZkHmp1u+vhbGQ3DZjuE27qOA2tJlckM5phJhX31yQTmJHts8Mp1V2XFUdd
	iHHAiG/uWXawrbmPiLtoq/qZ4hZYFLI/uiNQQ524qCdpaIXqj0boBVcEaXPUDIbk
	HaGSRtX3DI75crRoFr7Y2OwHr/rgkT/5fjhwEzl7fUMy1BB3AYOzkOApxHopMBqg
	H9gTpm2GWq7EhKknhy+fai1C1K0Ew2QNN3I6h1RGxYCBSWuWufppfKRRzPaUGlm5
	scvNKg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt03vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:50:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78108268ea3so7954949b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 22:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334617; x=1760939417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMlKTPnWLB6KAjDSvcqtInqYwyX8cf5M0iQm9SoLBZg=;
        b=Yv1MMwwnSuR9y0UKM6fq4zx3s7/OoQAoZ5GZvNvMTglQdqDcg6hVjaG16nN5EqROjk
         ZbkDhe9t5FCBcR02paithjD6rvLyERCYLGdXi7LqMujf20JbqT30d44aXDkLy576oXAu
         jNxnXnd1ai9JXYlOak6JYbHXX5EhXkR5ZpPOuXJ9sxLsuArVPMMD8XFWlBFd4RD39JK/
         GVyi5HegxNqoNETp3jhRmnl1y7o2yrUkV7VKzWPcbifUoOvsP3RbAFRSREqsTa3SvtKN
         mJ/pJRSoARPIHUn5NJnyLnQ7ioFnkD4nxO7q1meuJNmnlrbGSLGINGcEMiXwMW7y73QY
         XdVA==
X-Forwarded-Encrypted: i=1; AJvYcCXuSw00xLlBmwFrAHzOdVLIjHXwKIthTD1J8ZTQsnAFuw2FL3I3jQeLOwhFfTkl5KrrPJHN4XqhwhM0kojJDdc6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+7kiN2mAgtxEranxR55deIxL62QV9pYsMs6kVtXYhCKf71sO2
	3uVKQlFjwcg6nSKkP1NqjCE6avFbJMH8M0RTonfIrMMZ6HJDeImX+o/hN5vJ60PWRSD0jL7Azwp
	p9kkoNpTYYQPo7d9jwD/M4YvEpK+gC5Vi+6hLscVFD0KuThAb+pndvO6vzsogLXMiSXgYYVwPRY
	plOg==
X-Gm-Gg: ASbGncuohNbyxRsgtabbrillHxMMg7VJiLFfoQNDG/4Z2lP95txN/QSOIK3SlKYVGCy
	/UCimfz9DqnKAANTejLSY9ey9MWYnQJw/qdhbUJEfvv4Z2mY7ASEC/58rRhE/3z+86Cos3xj0oL
	Pj2HOL9CO5av90XxL3deJX4WGJVNCrTApC31OFYGEChmTu9LnlyffiYSvUlz+2N650fEWH64oIU
	x1fNH9AHPvfVbeOlcuCiC9COmI7+56V9WzplW4v3aHOVuF5LY+TlKiITE4e5sNGWcVSbSwzGi96
	isuHXc+fX+5ljEOeSZ4J2vH0bTit1rxV3hRzSNCfa0II3JpD9Q0xSbw15Ebd+DZkwQCBMQKtgip
	cOO4Rtq0Fyp9JaMYwZ6rcGCfeXVI=
X-Received: by 2002:a05:6a00:3e25:b0:77f:2b7d:ee01 with SMTP id d2e1a72fcca58-79396e6902emr24684062b3a.1.1760334617280;
        Sun, 12 Oct 2025 22:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrDS9dkWbosdt3fzyV3ggWtWU+VOXzip6ALX9MSQWGXKLPxdvtnDUJcDyUCzCRYo4thMZYWQ==
X-Received: by 2002:a05:6a00:3e25:b0:77f:2b7d:ee01 with SMTP id d2e1a72fcca58-79396e6902emr24684031b3a.1.1760334616798;
        Sun, 12 Oct 2025 22:50:16 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:50:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:17 +0800
Subject: [PATCH v7 8/9] coresight: tmc: integrate byte-cntr's read_ops with
 sysfs file_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-8-e1e8f41e15dd@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334568; l=3612;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=3/1ZMiiE0c/Ajqqz/CPyZeAohyGVpM7WQv8cRfrMzxY=;
 b=6boKoq+iaZr1MSCZa0006cAlMOW+pfSDbmTGAekh9aCAdp+5fkZxJQKWs0fFTrONTnRPA7UD4
 oqzhmQccG9eDUmrA4TfRP1/bIcvpzCAp82RVQLhEFWCTd5cH5mL0oUi
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: QLNunLKo6SKoZ8L83Hwp4Jaz4BByLFI_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX/eX0ADTTC8de
 4rbkVtmIn9+XNAFWnLWWla8M5JpgTD6JJTOWcgVShHQwgfxZT9UsOQcDJJAKs75Cn/mf8/Hp36V
 iPAY832t8Ly0/8DqXTGy6Tc9fRnWGcoT8Q/Ia7vUjnQi75UlrJqmPNk//gk3Lv5h3OUB2+JpH9N
 c0ItWpvJsPARaJPIpcOc3nhuPOaieV2EEQlJ2D7faZlYlRHW3mTiMRNkTYRWvVB7DTnL4cYmogw
 Z/oIl4CBzp21JU+2qqT1wQ3LA+OV2sPq+yGIevXsLFQmNUeG3C7j2Jh3u3w0fqVvZ1Jm1IbUSRn
 0Z4OrWWCBhSe3jsVhXXG25IkeuEVpZCvtOlY20gaNDDoInZnrTyMhFIL+Zq8ciusA7xZ0lzxGFw
 qOLuGh5snQesJ5vqlzuxEK18jmFwQQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ec931a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: QLNunLKo6SKoZ8L83Hwp4Jaz4BByLFI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_225019_816893_974BC235 
X-CRM114-Status: GOOD (  18.43  )
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
index 8b0397a77e57..35d42d09e554 100644
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
+	helper = coresight_get_helper(drvdata->csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port_dest(drvdata->csdev, helper);
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


