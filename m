Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8999AF8E4B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzlwHG7jhotLNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=; b=3Arf16YoEpNtxM5FCKFtuRceuw
	RKptSsf2eUsaEcqJRClu1uw/OQvAehm+4hWQwSHqzMF1XK3n4LTD2kI4X8LYurvnJnjsEDS+Rgd/t
	WZvTHvYQfDKQQKuT8VkRoikfCo4FVf+fsVcbGCwldnKQZ+pVABQQolokAOqtjmNijfpdCW00IbCFo
	U6XDpjMl5qdbBoRqgZcO3Y7oWXdl9sUmgLUbcG6grZGJxpfs514O9too/CMlBMZqnbnHOOQYHvOsz
	HRAowmdoqG2/f7o10jqEePE6SKgZeB6Ht/aKuqMRYaP1Ncxg22JuhxD/+z6+kF7yTbp043D0EuMoX
	cSkU9zFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdjQ-00000003awx-0i3m;
	Fri, 17 Apr 2026 07:35:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdjN-00000003avE-3aUx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:35:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H79UI13942129
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzlwHG7jhot
	LNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=; b=UkaTCHx0RtCDf+fkEkOhUHMBWjg
	3J83PH9M0UvtNbr8tdG2ZT4RkRPt2ImAaEUFe9m+SWSTi7yIlAqeDtVFX0KO5aG8
	n5DXxjvEUaP7jPIv770RNiG/b1GopU4phME+XUfS47P1A6NOWt79RHzKi3qF80Zs
	DDbun5ElxRMAE12FkSuDsUIDvb19D4oqavvMliOf95HPKU9FfstAOwJasf4kZ9p1
	oBgw8VzPCRnhE8d6IqzGL/hgFzOXudszMFP4Ng6nw9vXvSVpihQMagBcsrpsSr5u
	+cUZOBCR1dWPz538Y+qBZQH8Q7/5YzIGucncFytmdym8jlrC5jLAGLWHgEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg7rr4j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:35:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso479015eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 00:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411251; x=1777016051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzlwHG7jhotLNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=;
        b=PdDOo98mLbaOCRNreem3V9kwCJ1HWFWBbQT+g3z4yN8rHG3RiS8+mmJ2ZBnMVYrOOS
         wF4YjkTIZDXrj1gSYURnESev3uIOPp2IpgoA5sPdpKWzOkOSVwsNdExWknaFEVvLzFTC
         4XxTvJR/sXOXXxF+EgItNdCxOdX/siyyKWsUpOyNNZeFsEfgVeRA+QBveoJ7228njuxH
         qI3TJ9bpycPjqGse2RehU1sjW19P7spnuqb7CdFGggf6S+08ohkMys6PItY+JQmJ4Bdb
         D4Z1ETY4YsnutOh/a8CJSm/BFD3ewXn027n6HZwbH50kdDkIvh+6iDNoeSsPgaR9mQoy
         NkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411251; x=1777016051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzlwHG7jhotLNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=;
        b=LS1uMQ0AzxJmyVK3J4FgTarDo304AjQE2/TSblTJVGzYm9TVVIC2LbyIXPtk4nAHeN
         qALc/X0gtBeMQZTUAIzRECz4SACBMT/ojkW66TAgbUUZ6WG7OydgVROXg+kKGRhayjqu
         zo05ONMxneLzWL8HvsLphbqA3z+Tldzr8uARQb66Piu3PkIxc8ZBNRhu7HwdKizB4/Qi
         DRDvk7JSR2XGLP2lvmcsguOW8cLUzSNQ+QoWN4XGqcymjmzTC/qDHbdkJPeDtxKO0+qg
         rSGgDMVfVSTJBIQ7YCptQ6rs40etOOiH6yk/VqFUUOt9AbvPTMm6zcEtGTYJMJx0hO69
         /Szg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ji3z0XgV9uGvDOLiT28MUpgRdjAEoXYpJHru6wQzPS9Y6sVWAN8LNFH0wPyPH4MspAYHm271/cPJwtZN0x8rq@lists.infradead.org
X-Gm-Message-State: AOJu0YzjGNGEVv8oMazN9bHtFZ5Uqiu0D9MqHEONxBRdwkdMk6LA7S0A
	8PqpB1LZ8SEBdaUNFMhp3xC3dU9OTuYNlhv6mnsRF+w+UDnXyRcHqP9JsyyGkXLf/s9JUFYBXrd
	VyUUcbXouGAFlHS+0rU9YDGchyPdsVqjXXaiSX3v3fWOoTdhhQ4Q2hqL9UQq3H2YS7WrbqdFMJ1
	SLXw==
X-Gm-Gg: AeBDieuu9a27f4OOxBK5jllUlLnvKY6y3I/orq97L/HWgfQ0CMGWsdU39Gg10OW8IRk
	mjBfilf6St4k7T6f/MYHGKe+KtGeXGDoDJAuYoIMgT8/R0o1dju/eAlsV26ORfBEd46mjAD8Max
	k4HHFf6hxZacr1136nF0zsAqfT8kCbhtxIxb4IuK9IE1XqpyxfvOdRX46CLaUzxJc7n1EinOPuh
	cSZWHlZmgprShYay65K56GdsVQXtla4ItjEkqgQcOw1q/aA2kz3dt/6bZlKnTU2N/azayBKzAE5
	iJ9ftm5zHxJhFktO/Gdv68uczRPFlVk7qjkDgG26Oqi7M0bgAfiwPqhauJO4/eX20b9moDlb3f1
	JDdGwWF/d+CrvBHNOjOR+zEvZbrP6eGjJOy1Mv1uFstlZsd2Rp89uaJMX3R1J51+7FveDyuOtD/
	phHv5Jf6Qtr6k=
X-Received: by 2002:a05:7301:4591:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-2e479214a0emr691205eec.26.1776411250714;
        Fri, 17 Apr 2026 00:34:10 -0700 (PDT)
X-Received: by 2002:a05:7301:4591:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-2e479214a0emr691194eec.26.1776411250104;
        Fri, 17 Apr 2026 00:34:10 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:34:09 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v14 7/7] qcom-tgu: Add reset node to initialize
Date: Fri, 17 Apr 2026 00:33:36 -0700
Message-Id: <20260417073336.2712426-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hHE1TXLn0c9Gneqyz-Usk-3UgrzKoOoD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NSBTYWx0ZWRfXyJUF6J/yIZLn
 Wrismlbcaj1lgpJfVQDFi2TLU5H8OwVA3iE3rISce1pGiu1LMob9oaRFeNosVbc958fi+wYIvSy
 HE4sBegm+f2prw5KQuV2u98eqdDkJjiLBRwWiw5VDzS2pP6m5N4NJf71S8fffwt3KXLcvoqCcYJ
 qeauWWhgH5OBkejmXNZ4YNDAM+GZIxBXyGyZTkXpGrrh7Yd7WVoRKr7CXwv67ckhehCDOzkLPpN
 dDvuw7E/YJW1n20NJ21RK0rHb6RtwNc6B8akD80KM2LsgFst3RsuFBjINMpD4GCMuFIer/yHXBW
 xU9MTdty8+WLnTfHJREi3jocAEF9rQOypkOa6nAUsb5MxP8xKBzMK6bY5W8xj0GZ6GSPZHn9BWM
 602ON5Ek+YQOhoacAOyN1/nNvrB/B2L7wtOqi5czILnGAH3jA2S/CQwDc+Zo8GhzLkoV6gBNfL3
 wXoj8rUdTz0e9AmhDIg==
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=69e1e2b1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: hHE1TXLn0c9Gneqyz-Usk-3UgrzKoOoD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_003513_929554_7AF1095A 
X-CRM114-Status: GOOD (  16.99  )
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
index 6d5bf2621cb0..9fb51f2a912f 100644
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


