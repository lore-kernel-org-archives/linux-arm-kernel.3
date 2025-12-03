Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605C2D12699
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAnZPRoPnmAr0OgnZky4GgITZgZg+aavJ0T05/kKawc=; b=DgcQbozn8YPeCHGaDt4Y3DS7rV
	fzx43vO1eU5m+oBVvEuGZK8Ss2lGSHF4QnWPv0YALIptJYEeF092M/hqpxg4TzA/50r3L7qe1eyPI
	OfP9sE3y6TnWg+3/9kooWx8JCkSoOVsbb6OJ0IZniff8owjHDPKAz80IO7ERO3/UljVk9PQRQvL9U
	SAyyFEpq8j1VFMoKTdswgoRf6kdC6Y6L19sHMs+tumdfouuVEujuo8qHVz/jC7SiUvn42reaWxcxR
	XUvDKMN/uDV/B49cQyWIarxWgSfQmZf9fYjNAgIAqv1PzvS5XYrDkVi7zg4CVQZbSzztyQHGv6dgN
	w2CKflsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQikO-00000006MSD-05qc;
	Wed, 03 Dec 2025 09:02:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQikH-00000006MLL-39co
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:02:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34ixxe385711
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 09:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vAnZPRoPnmA
	r0OgnZky4GgITZgZg+aavJ0T05/kKawc=; b=AEAk5hj10MkZ9+sicBhh8B9h4l1
	36lSLGMBnJHcvnVZhw99w/VOQ5JoNZ/cHlCLHJwSQ9+Il7tS7bKRFoAstGRRODzD
	CwVpi0hzf/m0je7iAztt5cIP10MXTX5jWwIAQYATMMIcyEgCe8WIhFNU0jNsPScT
	gzp8mRPF8TiLCnBsy1lD1q6ak+03Jno4GbMGGFt93j45kEJ3wCRzjF+uV8ZL0Vlp
	Z9yibJN7bjPAO35DTzV2VR0PX+hXEd4qjP4Fe3oqA7qi5J/EHejyNl4wK+F/VCer
	IzmhV4DfAb64PtbBeAV3kt3DNRKrKqvt2HeAPsH9/5SaPfH6pCWTAG68yeQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5db29v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 09:01:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11bd7a827fdso905487c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764752516; x=1765357316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAnZPRoPnmAr0OgnZky4GgITZgZg+aavJ0T05/kKawc=;
        b=S0JdqfmHycmmL2xVm2c6FRQ4p58QDJpXeLgULd1etGeCIti1lsqoN4GUA6riDWoPGk
         Y2pZMgJK7nmyHu7+zHyoi1bQ5wNRAU+MonUxP6+WpU2SOpadXOslQdtFYgTwksRM3TuP
         zKCeg9x8615khkiE9TtOwDo4BZP2LTxG3TxMHycICeB6T0pObjiLTCH+hfR8SJRW8r8r
         u31EpG1D3+n450rOruy9FQ/yKskqdh/io2tulWfpjSKdr4rUbZQRPApGlmM8ZW36X0Id
         IlNCRH4zke7loM4DfP/zriNhT7DcThKp4k7hfzW5Qz1B1VruqoNfx7l1zquLrFmx0Zlf
         AoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752516; x=1765357316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vAnZPRoPnmAr0OgnZky4GgITZgZg+aavJ0T05/kKawc=;
        b=S69zF5a1PtohtZye3qt5Y2fZ+cpzN2++nLRN7Vgi9YIOSBBZLgAGlThXEmC8hyEnMs
         cZYH/t3lFGALQSqGHY+cSqpUxtpBoKQ4Kuz0RY+deRixq4/J1f+lrPEIIA4XrEnA//sw
         WuexEHqITZaeOM3Iys48Nm1fmHvFFT3E+GRMuP7s27c9RPLhxMI/SJjmfMw++fa5CF6e
         OSe+cS7GSBUflHlBvNU4HlP6B3foXIF72NDSm6PQnIUFeLVNXSHdqIZdxjeN6sgEBp0X
         D8r2tA6T2J+k1ui+crKIUCY/ep+Bh9W0qaSsrATVJkvQ3YIH8/ZXemHJr39yL50OtZN2
         9PNg==
X-Forwarded-Encrypted: i=1; AJvYcCWEooxlZkFRrpSI9bOHr3JUoWgs6F6FDhpkLt/Aptw6ksAfo+E+OIOn7DRzZ6LSSPmf63NqWXuLyyIslI1gZkEw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz3WSDXJyG5DsVj6pRhzRvd0ivneju8X6pTQAf2BheQs4fL4gN
	YMt2sJeVgeFsHW5qEZWAc33ymcuwzUJ1XXsuW6FKBsbCR0NZeTxOjVGcssDwIDCGKJvaYwLhTR1
	FW4sSWaxwfbI2B5OldbS3ednT8wXvCYIl5NrAee46vfZ8KtQGmEyaWZm+onGy03zvb2gNAETD9Z
	oOeg==
X-Gm-Gg: ASbGncuOTMPif+MuC/IZ8JjHGDFqgM4137gffzbvtu/2jVSTFwDg2A/7phfB6XZ+g+5
	7HDaxhu0JFXnfaHhUduiv1U0HPw2MXA/tjju0azjM4ybhqr4iEOhZA+KuJvoFM2fwzEnarCOuvL
	kPQ+IgQCCuUVAWhBJ0Lp8C6e45/2bdnFmDY298wuv6+Zzv+2kIdguOfrG0frp5cLaLVf75MDnJ9
	Zsv3SN/sdQcBYtsfm2Y5twb21pAUgyAtlmYJKrc/pEdsBGTFURsm4rACrdoSpWra6iFnEatsXQC
	4CNKRGNgUglDrTjAdFZrwwmmlU4bjzv/+IG/R13VrTypkgfHXd2NE47q+Ehzgi6WL3V6vxAl8Y0
	WoYFXGdlaTC/txjqVRp4lVmEsqaOgYHc+YQ4MjFOeuRpoZjWaxNTbmRYpMJ1RRbVx
X-Received: by 2002:a05:7022:618f:b0:11b:82b8:40cd with SMTP id a92af1059eb24-11df0c463e5mr1170458c88.14.1764752515489;
        Wed, 03 Dec 2025 01:01:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSNRtAZGBTSJue+Ey8VONMYuwnZj4Kvoe/oRjlVagfklSEUJXSEiWRgsKNGcC6ntzC8e0u3g==
X-Received: by 2002:a05:7022:618f:b0:11b:82b8:40cd with SMTP id a92af1059eb24-11df0c463e5mr1170428c88.14.1764752514936;
        Wed, 03 Dec 2025 01:01:54 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm100001866c88.9.2025.12.03.01.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:01:54 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v8 7/7] qcom-tgu: Add reset node to initialize
Date: Wed,  3 Dec 2025 01:00:55 -0800
Message-Id: <20251203090055.2432719-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A_aQ4NKZaFW-qXK7T8RtqTrLuTzcAPav
X-Proofpoint-GUID: A_aQ4NKZaFW-qXK7T8RtqTrLuTzcAPav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MCBTYWx0ZWRfX77FGl10lO9g1
 U2iicuh5AHHVJrkGw0K98agyUiMBFrjYuz7Dwx37c0vGy4kytVfF9n/d+QVvDhGSqqdC0J6GyhN
 4ZU46QTB2RXIip3lK5PyQGEfE99DY7EQmTGW8q6zuuDygpMx0oRHW3TRHsV4fjeeo1dJbnwTj4Q
 e4jmochGEi6ivXMklpbtDkjv4/RA8/ODzBS3w8R+8U2bRWylCaqYo2lhsaDaVj8RaRbU0rWXOu4
 lQxP1nwiuiDKOKYbUMMU/QAhNEz5JRqQnO319lfJwqrhoqL4tE6vjtRLnfDb4Sf+eO3//iUjE7F
 At5/uKI6XbbPUA9xrna5wMqmTk5gnJNop5UZ9sQeFpotRfxkC5fiiqakx+HadQX1b32pxj0KKo5
 WNwui2DEr3VLSDTIuTLuSCptzShcWg==
X-Authority-Analysis: v=2.4 cv=VoMuwu2n c=1 sm=1 tr=0 ts=692ffc84 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgPCHI2mAnvcCQI4J_AA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_010157_940093_55AC9A5D 
X-CRM114-Status: GOOD (  18.66  )
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
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 75 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 28d1743bd2fc..3029f342fc49 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/reset_tgu
+Date:		December 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5db876c31a63..a164867c6b66 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -434,6 +434,80 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	unsigned long value;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value == 0)
+		return -EINVAL;
+
+	if (!drvdata->enable) {
+		ret = pm_runtime_get_sync(drvdata->dev);
+		if (ret < 0) {
+			pm_runtime_put(drvdata->dev);
+			return ret;
+		}
+	}
+
+	spin_lock(&drvdata->lock);
+	CS_UNLOCK(drvdata->base);
+
+	writel(0, drvdata->base + TGU_CONTROL);
+
+	if (drvdata->value_table->priority)
+		memset(drvdata->value_table->priority, 0,
+			    MAX_PRIORITY * drvdata->max_step *
+				drvdata->max_reg * sizeof(unsigned int));
+
+	if (drvdata->value_table->condition_decode)
+		memset(drvdata->value_table->condition_decode, 0,
+			    drvdata->max_condition_decode * drvdata->max_step *
+				sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			drvdata->value_table
+			->condition_decode[calculate_array_location(
+			drvdata, i, TGU_CONDITION_DECODE, j)] =
+			0x1000000;
+		}
+	}
+
+	if (drvdata->value_table->condition_select)
+		memset(drvdata->value_table->condition_select, 0,
+				drvdata->max_condition_select * drvdata->max_step *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->timer)
+		memset(drvdata->value_table->timer, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_timer) *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->counter)
+		memset(drvdata->value_table->counter, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_counter) *
+				sizeof(unsigned int));
+
+	dev_dbg(dev, "Coresight-TGU reset complete\n");
+
+	CS_LOCK(drvdata->base);
+
+	drvdata->enable = false;
+	spin_unlock(&drvdata->lock);
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static const struct coresight_ops_helper tgu_helper_ops = {
 	.enable = tgu_enable,
 	.disable = tgu_disable,
@@ -445,6 +519,7 @@ static const struct coresight_ops tgu_ops = {
 
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


