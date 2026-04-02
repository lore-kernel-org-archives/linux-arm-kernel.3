Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB68D39407
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4N7tIyw5iZLvzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=; b=sR8UZndiVMnM4ZFQtvGD1J/fUP
	jBq2wMSrVauzFdc365ZSw6zGO9cSyzybJYXFI6jWIVzn+5dCZVMHbbeSieeBd2L2XxK3gapQ/kONp
	sPmu/X43uSzsBLOmlXTkXHV+Y8WEM9bpLi1zktIkt8yRueokYV5XfhtRf8SveeDZwqIvvW2PPCUr0
	FWyphs81aDmbxVY13XZje4746LZwJH0apDkzAg25/zCgVGsNKGTPEBI7PCKCtvtJb5lQGtfINIH88
	/7K10KijSe455bH4CjQNHNrIDauIsLGOGEPyIWMC+MB4Gn94tMg0xB+8CU7bLmJXj1Cm7o5k/cebG
	OcyfRx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EMP-0000000HGvV-1gp2;
	Thu, 02 Apr 2026 09:29:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EMM-0000000HGsd-3RYE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:29:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326nDfD1965355
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 09:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4N7tIyw5iZL
	vzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=; b=BLfps5bPumsutZTffiFBEqxm7TM
	UUcYeFGb/mzApNeLNCxDFtFi92twZx5gtyZ94VRfxwI5NFcORfdDvuf814YwUrgU
	v3DaVxR/6fORK7k8sr1lDYtXFI9F1o7knrLB8IaEL7Tv8gAZF6Cl12f1u1+vsSnX
	M+uDsQJIr8nWYN1RoJzgXrs78QIL/TiQKrjza+VEtQir9rSk0GljwgsxyqoYH5y1
	gbaZNbcAvtm4odW4glYdMRjP4hGxQDhY83/jkN+J6B/nwLdX3eX9duEIAn8AB/MQ
	GTcbFwLPOH6DeTSb6kSAkZLGS/4z3yHDmoTbZTm9iRavS/+dr/y6ijvz6XQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h2d9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 09:29:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdd327d970so417040eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122145; x=1775726945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N7tIyw5iZLvzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=;
        b=GecKlXVprfohfOsBkGIFa7aH0yTaMX44/j6DapfVtZvOmjC3YX8IWkT/KDLDHgXxfv
         n6o/wLELdm4e2g2VxmzfYx3N9cDYAK6PwChT6t/kQ4PCHP3K4rOOlFALMIlSsJJLm3Vl
         UuDH+p3TkwSErDfCl09e3+PzN/OXkRQ59OTfLHitaUgsHIMzCWml7PW9Uf8BB8jNAcW0
         PNiBCDE95rZosweNDVlNaT7qfwttQpXCjw0DltmOqq3HPZnDcePWDi2xeceDlSQm6PfL
         z4+fQXJ4yt/1lgKEYTUQ7G6JqMGoCBOyBrPbcSYfOBXHax2uhM9E900v/z01SG0f5Sof
         yBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122145; x=1775726945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4N7tIyw5iZLvzZnTOYoRHg1O5/XCBmsdPAKZlPxWO8A=;
        b=YuZiLzf0469fm2V0n38mAzdjBhAWFKBA0tWR0ah6gLYqPyDqE9MdJ8BMenSsIvGe2y
         wYxIetmjzWqBXDlTedMgTqaoSo8G2vHKAmwi1j/5NdjamMlhN27S7ZBUuPGn3MziEeiZ
         trWsqVn1b1UjO3zqMSl3lqYZtxmCY2dqQq8C91ABhWuEZ2HOuZMwwXQVsCN0W5PK5qNq
         vx8V68LPdHoKTU1x2cBSh9QSP4L9apA5ZHq7qGCdGYFU2GMkJ22JmTDESibs4NR9Qfws
         Ls5Hvu9amW+kPMBDJxoux4Pcgx01b4QkrT9QKJmUJmdgoK71rd9jYKnD078ewoKY2ULK
         AAhA==
X-Forwarded-Encrypted: i=1; AJvYcCX2EF69kqImbl4vatkULC3C/EwChhvcBH2+UrpXMRwpJlsBev89qAkN5eGOAyKBui5cTO2BtegUMKCsCPOBVZUT@lists.infradead.org
X-Gm-Message-State: AOJu0YzRb3jCuvvl8ZJUeQHaJC4UfOl34alvYynTgiqjVlVApGleHAjU
	/dAGvcI3+4lORy13F0Gto6Bfn0esn9bRvtP8MEVBfLe3DerHBsKKf8HqvygJZVYZIIxjynUdqTp
	dDiubXEJhJbmO5pvs1zNiL6FLdt01VfjodfciJYP7wgHFr5ES551vogpLe3nzBcXBaeGtVfOjv2
	ox0Q==
X-Gm-Gg: ATEYQzzLwrEtxo0WIlbp77rVHkqnigtq8oDAw6gIydv/2QZ9Xz6XuOUZWE0xSAZmdeU
	rNUz3bs+RXOFfMrZ53aQSCXgMdNn+YFYZQewqZTOGz1PyjdC5OTnc7nGvQTzGv/reHCDNDOhdx3
	Ar3O2aDqVyeONvvfSinl8L6a6WYptM18a0cbdakiMp0xdgW9QPFJnCEWL659Wd5OUwhvyjWOjoc
	hOAcPn7by+pm7/aDgNVBQr+jtjZI6/T/b6cdGgm1lk58vMkecJ8ERlJBozrTezzNkOPCxFvA4Ja
	6hBNXdvU+Ay8IbGngiWZdeOPNNf4kTUOfwl+Iqiibi4chynSah/136LnGi7uph7xmqYCNYIoFcP
	iICt14JPkq1hvaFYribMZGdVC7udc3rWZlGL8jS5hkc/UFqK03A4V1Nuy7ZJcdMWF51ooOQCyqO
	T2
X-Received: by 2002:a05:7301:1007:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2cad64be0femr685516eec.4.1775122145382;
        Thu, 02 Apr 2026 02:29:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1007:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2cad64be0femr685492eec.4.1775122144851;
        Thu, 02 Apr 2026 02:29:04 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:29:04 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v13 7/7] qcom-tgu: Add reset node to initialize
Date: Thu,  2 Apr 2026 02:28:38 -0700
Message-Id: <20260402092838.341295-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce36e2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: cE8TKmJzv47_R3825IN62I-xFVha8oo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfX1I8LKzcZQSTh
 QMmvnGcvzSqXg8OgtXS2yTElfk/PLWHDzxnAm3ym8XXm1CYIpgSeVp7w+sz144jkmsT6/luhJtM
 SEMLMKT7ZLfqY4znssLMkLujZBIvy+voySWrHlE8OIhfW9dGlhwiX71fKncX3OnHJjstfrbeO5v
 HUDgWztk21fctdWdNdhu7MsNvHIhqoVq3x6gjZV1glJ8do3Fm4zeCaSKOOeFk+P3VjoakOMsw0m
 rXAueafpaH1fX7V9D0RYQDBHOnvZuGgxm+lT2g5WG2344BNJnyISKFWmMyLEHohXW2trYyd20oS
 41hwR/gm2boK96xubSGVzvkVRrxy2mDgeL0hDr7u9a3sNwwi57SgHeRtiCgziyKj/ee2QXih4PT
 ZyNsscBCNAte/gWYvxA2G/UQ79KjIgrzaYG8rTmRhSN2k9k9sgLFAs7myRNqMUjGFWdPLJZMreL
 aQaAS7Dk9hkipM4Idxw==
X-Proofpoint-GUID: cE8TKmJzv47_R3825IN62I-xFVha8oo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_022906_934549_A4948693 
X-CRM114-Status: GOOD (  17.89  )
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

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 7a3573e03e27..a6b6019c8ef1 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion:	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 4a529520b428..752fcd2963e1 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -420,8 +420,82 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct value_table *vt = drvdata->value_table;
+	u32 *cond_decode = drvdata->value_table->condition_decode;
+	unsigned long value;
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	spin_lock(&drvdata->lock);
+	if (!drvdata->enabled) {
+		spin_unlock(&drvdata->lock);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
+		if (ret)
+			return ret;
+		spin_lock(&drvdata->lock);
+	}
+
+	tgu_do_disable(drvdata);
+
+	if (vt->priority) {
+		size_t size = MAX_PRIORITY * drvdata->num_step *
+				drvdata->num_reg * sizeof(unsigned int);
+		memset(vt->priority, 0, size);
+	}
+
+	if (vt->condition_decode) {
+		size_t size = drvdata->num_condition_decode *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_decode, 0, size);
+	}
+
+	/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			cond_decode[calculate_array_location(drvdata, i,
+			TGU_CONDITION_DECODE, j)] = 0x1000000;
+		}
+	}
+
+	if (vt->condition_select) {
+		size_t size = drvdata->num_condition_select *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_select, 0, size);
+	}
+
+	if (vt->timer) {
+		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
+				sizeof(unsigned int);
+		memset(vt->timer, 0, size);
+	}
+
+	if (vt->counter) {
+		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
+			      sizeof(unsigned int);
+		memset(vt->counter, 0, size);
+	}
+
+	spin_unlock(&drvdata->lock);
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


