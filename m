Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F47C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjlH2n0Y7dLEZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=; b=DKgVwx73JNRiStlJ7cifBKEdLS
	w251SUhWbfZic6Df8IhbU4bUCX2+6JuyKKNVkndIRlS4N40x3Tu0DAH3h4sJgEq3/ujinGO13ONWL
	iOYu23+1WcL2kWxvb0IP7DfbYnznc0rDI4R0f23R4tq/DtwhTkVD2akxCAfxtG3/5CbBKzpbK/q1w
	lJKuFSnrrgwdF51tf8GiYcmWwYF6rBeyuDG1GJOZgMApp2oAk8u5jzoS68tMU+A640IMOO65x9EgT
	N9f0jM3M/wf8Iha/MtSqX06LIv+qW1KLRdN8ZLJE0EZfzScZtDEyVP93TQbAJ46IypnjK/6TMNGBQ
	WyW2H1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenvx-00000000kRZ-3qxG;
	Wed, 01 Jul 2026 05:56:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenvp-00000000kKB-23Lc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:56:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lOj4133226
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 05:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NjlH2n0Y7dL
	EZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=; b=Up4mXx6vU5m7peDfWMiHM7UgayS
	VIDNPj/TywOf3r832SWR7boTbFnWkDyFI2jtfcxeqPBIjXHyNY1HuyFe4XIyg8xX
	rLEaUhWnc6xgonZpvV/0moMOV2HMarF1Z0OUqYuyAikgJPVLaf7JOgXzn+1eX016
	OOsdC2qP8V8XP+EJJy5aS21YDhXMhwSFaAoL7Hl78fPFnwqKpyFpBAc8njeVtfaE
	3HTPKCMOpghBagtPvTborTJPnETgl5TNbLglQNC7nnrkI1Ok0zCGcOlEmXc699GX
	I5pqO9Ltl+/cBT9yhX5BuWRikM8HOaeSorrtCKgzPBU2Xx8RB9YxzfKc+zQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy0x7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:56:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9f0073e20so4013915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885379; x=1783490179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjlH2n0Y7dLEZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=;
        b=jE97wx0vnF8/RI+944JF+GSryG51Sc0917vforg5Ft6N28KuwamDOPtWMSl8E5N0Qr
         sm/V0IC4c8/T9u0Lwqy/Qa1otu29X7uJTdgib8luR5fIOi5G+EIZ6Fly4kTQ8ch7FzPi
         DyuiH+lkbgxhT32XGA0ufKT975sOGft9ZGUy2pxhkyIwU8aQ3DJZslwALcttVBIPJxvr
         Y4Mvvt6Gp2bJxelHNG1xiWdeykuFG6DIurlB2soyopcPRoq1IA9auDbxMxu7P7CmUoDC
         eKsQMq51DfbgZpiw/e13OA/L0iQN9PQYpTj4mmW1p/xKZKN0hhrs3rlMvzabpEorY61C
         OEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885379; x=1783490179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjlH2n0Y7dLEZ/GZ6FO/PlPMn7f9rV+JPlftsjUFv94=;
        b=cePK652aTH7zEI6Ko8Gtp2XVS94s2pnIyzXW5tvecHQmEGCkaxP4Q4lN/3Mxj1c99Z
         uW2BZLh1wage26LlCwcRl4cE8skM53MP47sNIFnXcU3P8v3vPzwwly9VI50e+GaSsXDp
         EhSBmlPQT4XGNvSI4mYj+9igjGrv1OuBD27BHCR/BNMR1apk+vXKTxjFSJlVnWFpj4+D
         ECVBrF5nEEvkIIaCdKc/ui4iD524K31Jfb6K17ZQQbns0LC7OjI9fx6L/aX5qrTWOoGl
         imo44id+7DKao5Co3lXtEnjFrG70AasAl/rUVSezMOeVTtQE1j5wRIFvfTj51AZZ4WpJ
         m0YQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsLDAS+N1ucZ2/1NHIbAfyuwYfuyKEWstJ886f61cgkFRJ6J1eDPaaKPKHN+7SxWskD26x+0/xXq/ISSirg7Pu@lists.infradead.org
X-Gm-Message-State: AOJu0YxomGNgpE/nkfm94LMCWWJiYtxbghxnrXW+go9DUWvok+n0yWtx
	bKsH9bxK1aJpeHeoDF34DcepxKD0qAJKlGYpIIoAKiMT06y1g4bRRZQVI/5j5hNqOleuEsUynfS
	iWa4rK2tGhRPOXVX/0BKvdnHzq1Q3QleOUJ3GdHKJ2mPqX3RQ9lT+gmI4HpSNjefAzFWBqq3A5e
	ntcQ==
X-Gm-Gg: AfdE7ck+2uD9sf/y5M/6mU9Ts6VGnCFC3cFdrSvTT/Tj53L2W1N48MINi9Xf7+LRZk6
	pCHbCV414fa+xqlUA0ZmsIDRaXrFmGsjWp7NDPJjfs9SsH/jFLywTJR24gw6hKzO4DY2HR/Emjm
	kCxVweui0TmfXFqopWqINfEnvAt25LEFj06kCAlaSC8FOrWPhfO6hsFPbiv82moN/Pqf706848F
	RX5b2JR0U+5RXC9r/AfKF3VZOVUw455zwmPNvpAfkOzOuPj7b/mDoOWoIxmutjeK1gdNpru+tXV
	8h5KAVVM15fl8gSUgNH+HJDTD0oAjlGhMHGEYQ0s99E5avxWRjL6KRB7GjPClaFoEQSp5Uag1WA
	KPAhwPerks5n4VBswdfB8Qtp8h+UdmTQ/POXdeCqbJUsiphxSSvqZJaGPSTkLyTPMOQ==
X-Received: by 2002:a17:902:f685:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2ca7e65408cmr4281975ad.9.1782885379493;
        Tue, 30 Jun 2026 22:56:19 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2ca7e65408cmr4281675ad.9.1782885379038;
        Tue, 30 Jun 2026 22:56:19 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:18 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 7/7] qcom-tgu: Add reset node to initialize
Date: Tue, 30 Jun 2026 22:55:29 -0700
Message-Id: <20260701055529.445819-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uRe19ayfk3Q2Eu2zcfxgbmOLSdJZSixk
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44ac04 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX750OxUn+HRvn
 5bmMBQ1lWm6tI/wV3WBJ+ehF6DAI164/qXJ9xFXyN88lZPrl9OdPS4sBWvnMMSQrosXXaQ2DUL8
 NsHDOwhcYSrSSqkVFXqJfVYOS6IBJ8nE6vIj12q15Ogpv1SfHc5mEKO9qOgdod+LbBel0atrZDg
 iayqEvK09N5ETTXVtmK6J0CMYO+suclVLsYBFGkBw0C/lxP8XzC33KFD7ohTbm3vxo1J7aWsGz2
 iaAHK6mCgOiavFF2wOk3f0gSjoYqCKhDD+PPV3Nrll2OFO74+r2+dxVVnkqhRQsVkAWSZqfXN1d
 e4UPhqR86rFjB6nyE7hLXPo9MCjX2pLN2nhumqovI06LJl0bnsRegFFPw+aPLrJc4L3hOrQ6VY8
 etQCXB4CwoqFUmNzopSJxy3HG/DCmany4qSaRhnD7HOT47dAmKA9lbPMRH7csfYiK0McqB9xkLU
 3w379nthkWCUbZ25GiQ==
X-Proofpoint-ORIG-GUID: uRe19ayfk3Q2Eu2zcfxgbmOLSdJZSixk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX+SvixvodAE/n
 afMOwRO15IXpn03fS9f6NRmu74yTIkla2MMIoCH13CCG81pRgJr7H76E4gsPfuhqOzhdD1sC7L6
 rpLYxQpquIytrStHf5lmgtce4b3XDiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_225621_723842_DC7DBE94 
X-CRM114-Status: GOOD (  17.95  )
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
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 7fad11eb759c..cb0710fea9c7 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		July 2026
+KernelVersion:	7.2
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


