Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A38FD4606
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 02:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oc6efl1YSvCJ4xlvycJVJOfJR851o7jM97hjpoKPK5A=; b=QpCLNhYNskbungGtToBtmgcrxe
	gjQrVNQLpngENqkJgPfx8fGFZqfJ9hqJ965qYJj9YRekkyPn+8RIzea3th9guZx+q7k6/gMkuaqkT
	hF40FGpKRBqHqNfzE7GtP35T632hltn20fqJlaBsLgz2lkJ5r+vwNn4bJLGZLh6M5aVysrrRfzkd4
	eyKUuKvNVXClU8x39erM1zl1B4Br6OHvYNhJE3rPEkDlZ9gKk+tSX5bqte6N7hNQbAqtaEz56uMCi
	i7ak329jxu4VB4tzj1dyhXR5FJeFOVAJCfYcLZxwrIYTCBsSAdNL9+sG+CaDhZDf5YUd2IgLZm3M7
	o/YOFRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQl3-00000005DT9-3x6f;
	Thu, 26 Feb 2026 02:05:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQkv-00000005DNz-1LUw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 02:05:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH2OjF3101009
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Oc6efl1YSvC
	J4xlvycJVJOfJR851o7jM97hjpoKPK5A=; b=l3E2GLb2z5RVcsdEyc5BnEHDdw1
	75My7oqor1O9wESi9ZIn2/iQitX98Q3rxhWhMD0J3IxLOX7HFNSTK4cGNgUgPz3V
	mkPpjLcggTD0UnCb42bOQzPv1bixc12461pczcNvsab1mbaiGJfMpbJ9B75IIeD/
	21V1eOoMYiK1ao1qYk/03/+aOlJVjMzvAtLyKLD38o1uY91nD5+6PVwC92iutd5P
	VVMLMCaPyv40gjv7uoVBwcZBfkyWLAmA1jDYkt3PzQjicXsBGilTJRmdh06TbSKo
	DDzppvtLEbEB6b6bQE3kaRZpQ9dhN7sgwLZr1Odz4RoOG5qs3xm+a4VU4Tg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54p9e9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:32 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d1950b48f3so1603244a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 18:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071531; x=1772676331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc6efl1YSvCJ4xlvycJVJOfJR851o7jM97hjpoKPK5A=;
        b=FIHKX8gtmgZ6v+NiG0YzH26vEf5b4YaeVzZhN8N/w2SRkXEPt9znvAM1K4hfcwavUW
         nJtpzbPNwWO7QooBprpH3g7XLeAR2JmHOhy+spmGoXEYXAW8sN8t2LzR/qBmjRfjTXw/
         vTYerr/NZYnR2vY4Jjs0wrs7QtDax9pyPMji7msFuYdSQbdxwk5QPLOOWLteKKnoc4VH
         kxUegVs8zUDwjYRnOrpkL9y4vNncd0jXba1APQXT5YRIg5xTX9i6P2S/DUM78CnByhS0
         JO+Q161ITYoQRqHkuerwcWTmp3HeEPnWnJLGFcbWd7Nre1UC3TnGpbgo2tXH4WZqs5Fh
         ozDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071531; x=1772676331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oc6efl1YSvCJ4xlvycJVJOfJR851o7jM97hjpoKPK5A=;
        b=IArmRw7kypoaFJGEwM8e24PIu1yjOnm97h7MDpCs8z3iJZQEjQ0xTVQbYXaMoWElT/
         efyx8Xeb2rAtIte+6irJZjBzS7Tg3ukBHfxMHgXq+QI8SHeEgtIbzl3Z4jykivUaFf55
         c0mQemZ7OdkBevy3KOQmGSOKX+Fle+/Nt/wzLxpot4MKHXkoN/IEGP0TMt0e/HhEW9kI
         7/vMDJPRGbNxnVcyo1ILlCiYMu6rkHNTmIdhQE+7eCjRr4015ehch+PO3xLxKVigQgkV
         rSkqFEYRUcvrvcu6aNbTAuTlMY7bn/IDepuVsNH41OHFqP5XJ3h9ZjpVimyxuxQmAXx+
         Mu2w==
X-Forwarded-Encrypted: i=1; AJvYcCXL7IVKV5nW1GkB4/gdg21ufbN93YyN91bbaWuQDTPGVaIgLZgIe+JYmEb5lgJXTqPkKuAF9uSCLDzwDQNUyoub@lists.infradead.org
X-Gm-Message-State: AOJu0YytnJ7gWpAbvGddbYpmXlTAI9z09CaK0kpKhp0/DVF2txy8wMgX
	vQqKM75ZIGozX4m6IoxrjnbG521Wl66ArABK6sO+9yQFj3ogtY7PebQPW8NfkcJgmgStl4IQ7me
	PMCPKQnaTSwoJ84XxcB8Pmc16dGB2m0lUknaJSdwLFN2cxgip6YpCsHuhPrzYrkQHRO1eny5KZp
	mSYw==
X-Gm-Gg: ATEYQzxjdcUINhcamsQSAe2aRgfpgnwE2OapbFaskcY5tEfTCz96e2UU1CNebhq2kni
	YwryACTkIDzj4Kc2Hd7fw5k/a2NLICTTVdA8MzAnu/lJzHUsjOowyiQ7p8JK9PdJNm0wL1vKH/B
	5vv6eDlZf24KAjuJLLdLR/l3g8WY5xortV6TkIgNLpprMnaW9taJOa40pcjv+JYsIUlqtV3CCfx
	Eda8MnzqGC3k7IXW8TIn9YaNe3yU9WtRnrHeh77JQje/+ElVmmmrfeOk4UXrdICb6uio1mGs6Ps
	5n/c4GhbmBhUL6rwpvobGRGmskmvtmeKhMksaunME3HSdNTR6w9LNM9W8m3CjJgURK2OdAMlWCS
	cgaBdyQRBprhs7+4vy5953yMiEs6BgwV81ulkAZw2FvRsu9+FE84QJKyHpUyue4kXGcXE4kwnya
	mD
X-Received: by 2002:a05:6820:1c92:b0:662:f660:5a1b with SMTP id 006d021491bc7-679f3c0761emr294780eaf.0.1772071531499;
        Wed, 25 Feb 2026 18:05:31 -0800 (PST)
X-Received: by 2002:a05:6820:1c92:b0:662:f660:5a1b with SMTP id 006d021491bc7-679f3c0761emr294769eaf.0.1772071530953;
        Wed, 25 Feb 2026 18:05:30 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:30 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v11 7/7] qcom-tgu: Add reset node to initialize
Date: Wed, 25 Feb 2026 18:04:54 -0800
Message-Id: <20260226020454.3210149-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfX2+i8UB5PMOcl
 lsICJeOU2myNoLkX79czkiG/6pWepTZfKqskkUagyZt3Y+zP/c5tWTNt+wLOdEuaDgNvrtkTwNW
 BmTlIgyVMzLX/wJuNFjNfUnhfP+3OFkhlfU+tJ5jBPT1F9eVZl4lMfO1m6sfAw/ScEmC7IX5Qv6
 pwLLm8AplyfP5KSHW1DwMp2bMILPHArvDa79xtghWvD4yCTgCY3TcJ98EbuibDEixzI0eJ3SqA7
 XSUdRaDtUUfAPjUTPSGTfrGsnMmlpyBM9n6ZRrw+h+5rTKqj9bn4TR+xf6F7ceUwRlD9sg55CPG
 YlK/wgHFtvCdMOil8Lc2y+4Q+S2luNtmk8EVJr7o3HiifP5j1ZjVpWxC+U+ikoVGt33TFaWgsFM
 XGb8RJoLjbg5iSVP0KQ7QTu8cj67IgNrRkUXtIu15R3u7B/yIz93iznfPrLd9BkvGC36INiBdls
 UezBUCKqdW9xW1xaREQ==
X-Proofpoint-GUID: PS_DAu7fRDWU60jUjkarT6P0qzsSgqK4
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=699faa6c cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: PS_DAu7fRDWU60jUjkarT6P0qzsSgqK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_180535_485199_DC306724 
X-CRM114-Status: GOOD (  17.56  )
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
 drivers/hwtracing/qcom/tgu.c                  | 77 +++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 9daacd68eed0..3ff34a769d94 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.20
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		February 2026
+KernelVersion	6.20
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 4539415571f6..e28e6d27cf56 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -410,8 +410,85 @@ static ssize_t enable_tgu_store(struct device *dev,
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
+	bool need_pm_put = false;
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
+		need_pm_put = true;
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
+	if (need_pm_put)
+		pm_runtime_put(drvdata->dev);
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


