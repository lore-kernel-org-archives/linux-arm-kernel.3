Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E55CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/JffYfPWEmdpYonKFGcekrAZIyf1782SlT6HKhqKKg=; b=cRNISSqdPUAmjQ+ArX9Sw/L8kD
	JuLDugok7P6mRrnqKAQMnzOuKiLD/D5wV9fBeDrK5xWZSzAwXy4ASB+Ih/sAawaE51Vo4u77a6xdt
	M1kszqtDc933Uo5ciufX9yfVTQ1QqeQQBBUn9dgJptJ6L5ZucQkVWqF5AD8YeQqk3Ve+2ISa9LYuh
	bd27qXEcLx1YTMLoTBGW+N1q9Yv9CDWV0tYVWPurE6aX1o6n1HkrE6QMNQiIYETrk+wj/CcSkpuiL
	v/+ojJFiep5wreDduOo18xELt3hGpYl62pmSwIRzbksqPva/JN0qVnsYaHZLJlA9qOT414GyhEvn5
	lkfuD6EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6VL-0000000ECpJ-3Tju;
	Mon, 15 Jun 2026 12:33:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6VG-0000000ECk1-2B9E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:33:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApmWD151923
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/JffYfPWEmdpYonKFGcekrAZIyf1782SlT6HKhqKKg=; b=JTkChcaQfIRtXp73
	stp+D3SDoHRo5NvoCZ74oCPNJjaP8v7Kt6VixQIhJut6IxzoMo+IaF3KMEiTpgRu
	gjAILCG+VQhZjW3Zi2uBs0oAIAKr6gvXEVx3Hl0867kSU7JTUMPCOCjJRs8v1vBB
	AzEvjYOuoYg7+uapyNNHzR1I8rgUN48eQBIXQGtilrUC4gCmPXrl/P48xr0HhZu8
	g5FzDH9L2GW1FO0gGvUuuGfLTHWP7pDQF+N0Oybpx3R47r8LVVi2OX23CrncY6hC
	ujfJYBp+Duc3FpVUKC5GQftEF+Wmb1OKt6mXKa5bVlZkyvexE0ytgalzWzW07D8V
	1rElDg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf0nsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422f987f2eso5544835b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526800; x=1782131600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/JffYfPWEmdpYonKFGcekrAZIyf1782SlT6HKhqKKg=;
        b=c7Eo9QDIm8lSyPXhGMzqNdpAC2IRQybGzU8vAsJV5xeBmrA+l5VTwP206tuMeYANMW
         t6TGYmhe9NfFeurXxGum3ZriVw58xyaoLVZ2zztjz1cTiIsz1EqPiw6MQ22a6oqPHMoQ
         A+fhb3H5S69bTq3C5hX8To9u5+Mm/EIZhXlV/YRdo9hdziiXV0uEsRFegZlE3gZ6acgc
         Ox8cN1MdSDMMjuKI9RO+sWJtxclb8kmVNc0Zh+Ex0zF5hYJKvEuappeu9zs0fHTb/hNa
         wNrkvB6JBUVfGomHdkjqBXoWnaBOyYKN2ypH+O/3I4HcD5hq4UZxNpLuLojV6/LxWRMP
         6eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526800; x=1782131600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/JffYfPWEmdpYonKFGcekrAZIyf1782SlT6HKhqKKg=;
        b=l+1ydzmMgmimMc6F7JGg0rc4mQpG2ug0tSRoYRMPVapWBhz/Ws2+vSpUYrQj8aGYRR
         cpt1T0q4gTmzscHnN/Az2SpB0RHT+Il0vU7xDuKluG2tIaYb7NYNjbltk1/IsE5Hy2fZ
         eUUiolKV+or0IE0q85zc357Z+M9odRe/HvzfP0WISZrv0m28wZikMKJRJlkm4itn5W2Q
         66Ltb41LHQ0nCiWE7IUNIS7b0LYz4XIIJfmaQpk8Hrv5YMbd25I3n76o5dDqos5kOcSv
         OD503DD94XKqot4aH+IraunJ7rmq9t7ly2hCiaBks/QocQZXA5sTUaRYHhUIzkz5u3wZ
         UWKg==
X-Forwarded-Encrypted: i=1; AFNElJ86XKK834sWbIi6BqvoQTZ/KlENdk5V31gzf1f3GGIVLWpszygb5H/hbZ9ch05dWrtowvyqVQcgDFQ8TI0zLgFv@lists.infradead.org
X-Gm-Message-State: AOJu0YwL+AQsT2nIx/jNryijeUOyf+D+adeN/nf5nJNSRFVeLrU27fou
	p/CnP+1Xo0EUGQHlB19oa7hXbKu+AXSs16citsXtGyD2L53GJtFlD8Hrd+cTMEoHSDsrHXBKXbM
	Of0z5IbsGlJQv2gf/5Vdgh75lBsp1vPr3qFDB9y4dVYL1N4BEFOBUxlHeLFOSRs5jvq0/yDED5N
	r6bQ==
X-Gm-Gg: Acq92OGQryHOM2jTpJ5cvbNriQsbZCwWyEr68ImEVlpEt/CCVYn/mD0T5z4TtxRuevT
	9nE0pC5foB8FhWfguu1ICcKKuGvk5mdz58JC8yu4ImbBxEa+60oTvSu70yl8TH2qQ/OSiFp/VmD
	eW+rWxECgjV48qQCiBtFd2IjLuccoW337sVgaTuc5GbTzXBt1DT0qvyURD1W/yr3KYp1MEH2XlU
	WkpmwcX/AObXnBLBj4Qj4VSPralVQPqeo0qjYGIEbWmn2mm6X1jzyjOeBjIW+ybb+yPxQIZo5bq
	Etini7HmhL2QhW/31j8oymHbJtf3+mt2QysIkSMACd6pjDLsW7bEL3tSWNBYunDrMaRaNCYrdcT
	kytZpDUvmgAlbY+/+vFuu+lvRdkkCQxD2/4KUBVgSZtab7knn2jNedkb1HT17E8WLzw3A2NtTlK
	ShbJABOSlxgIuhsw==
X-Received: by 2002:a05:6a00:1993:b0:824:374a:1407 with SMTP id d2e1a72fcca58-8434cd4914bmr15273591b3a.16.1781526800243;
        Mon, 15 Jun 2026 05:33:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1993:b0:824:374a:1407 with SMTP id d2e1a72fcca58-8434cd4914bmr15273572b3a.16.1781526799808;
        Mon, 15 Jun 2026 05:33:19 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm9968393b3a.50.2026.06.15.05.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:33:19 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 20:32:32 +0800
Subject: [PATCH v10 4/5] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-extended_cti-v10-4-1c1694b6d8ed@oss.qualcomm.com>
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
In-Reply-To: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781526782; l=5618;
 i=yingchao.deng@oss.qualcomm.com; s=20260611; h=from:subject:message-id;
 bh=nLJJ2LG0916NbMbQC/CB2id4JlgiNIupcL84YiH1LSI=;
 b=6mqmr4mIJpAqOe8iXiZqcp1T2fvrZ54s8SytoqqlhFhB5g/CboVG2Byq6U3yCs/mg2C0SQ2CY
 +beqXV9dsbgAGvuc7m+JPrn98/qQ+9y2xSYmZBE3wbiXwNXFWQvTaTs
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=+y3U2mIt7mf0C+x6qBUD670cd9S2QV+yl5015bUYMgs=
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a2ff111 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=yoa6GI8vE20v00mW0vsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: wLM0jGJD44RO3Qcdrtn23erJVBFrFol0
X-Proofpoint-ORIG-GUID: wLM0jGJD44RO3Qcdrtn23erJVBFrFol0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfXwjWTFabtHplN
 fYYop9R0ZQs5akL/i1gqCnVLQmX7XxEnJJj+Py+XzOw7lQjwFZnskoAdX1clN3Yr2MxvDb6jxlR
 ZKzftXx6v35SEzI1mXfOTBvxGQeV5g8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX/NtDr3zxmaal
 Ecxod+O3CdE+AlPxZPFVIzm0XDu4nihkyQH7YoXlHnFI29plUnRExtOlqnLzwkoERmhBNVVqBIk
 37oFvDWFpGEMySgN+2stmfa01+GdASlS+mlntSPX1BdW49VnbwZdUp35WGH8C4YL+kuUg50cfZW
 75ry6S+4IilsDv+5SpViIZZN+iM8OJrl9zWP9XrjjnE2DYtOKo3wHwAFSjesnmYGPID3rox9fv8
 OxF8qKN5FgJz8JuB7Xvw/bU196zy8vRO/E9Gs9nkbddacbLwZiTB9Tk5v9uXzXsl9ZOIMjBv6/l
 wEf7O0OXW+2Hzp320ykm+8lSJTnFE/7G/GRiwsyPy3JZIQpjT3JrLHLKAXkc22fWP079YVqjYSS
 e5iInzi1yF+rZnIhlNXzrQPTmonybARu9w/Y504SME5YxzLELUfAYMpIt/1TYBArM+WxcXoo20c
 1I7jbtYBFwQftShcF7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053323_231667_05DE9E47 
X-CRM114-Status: GOOD (  18.34  )
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

Qualcomm extended CTI implements banked trigger status and integration
registers, where each bank covers 32 triggers. Multiple instances of
these registers are required to expose the full trigger space.

Add coresight_cti_reg_index(), coresight_cti_reg_rw_index(), and
coresight_cti_reg_wo_index() macros that carry the bank index in the
cs_off_attribute.index field, keeping the base offset and index
separate rather than encoding them together.

Add static sysfs entries for the banked CTI registers and control
their visibility based on the underlying hardware configuration.
Visibility is determined by comparing the attribute's index against
the number of banks implied by nr_trig_max (32 triggers per bank).
Registers beyond the hardware capacity are hidden, preserving the
existing ABI on standard ARM CTIs while exposing the full register
set on Qualcomm CTIs.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 6165866eaefe..175f20d69232 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -207,6 +207,15 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   }								\
 	})[0].attr.attr)
 
+#define coresight_cti_reg_index(name, offset, idx)			\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_cti_reg_show, NULL),	\
+		offset,							\
+		idx							\
+	   }								\
+	})[0].attr.attr)
+
 #define coresight_cti_reg_rw(name, offset)				\
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
@@ -217,6 +226,16 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   }								\
 	})[0].attr.attr)
 
+#define coresight_cti_reg_rw_index(name, offset, idx)			\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0644, coresight_cti_reg_show,		\
+		       coresight_cti_reg_store),			\
+		offset,							\
+		idx							\
+	   }								\
+	})[0].attr.attr)
+
 #define coresight_cti_reg_wo(name, offset)				\
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
@@ -226,6 +245,15 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   }								\
 	})[0].attr.attr)
 
+#define coresight_cti_reg_wo_index(name, offset, idx)			\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0200, NULL, coresight_cti_reg_store),	\
+		offset,							\
+		idx							\
+	   }								\
+	})[0].attr.attr)
+
 /* coresight management registers */
 static struct attribute *coresight_cti_mgmt_attrs[] = {
 	coresight_cti_reg(devaff0, CTIDEVAFF0),
@@ -515,18 +543,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_appclear.attr,
 	&dev_attr_apppulse.attr,
 	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
+	coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),
+	coresight_cti_reg_index(triginstatus2, CTITRIGINSTATUS, 2),
+	coresight_cti_reg_index(triginstatus3, CTITRIGINSTATUS, 3),
 	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
+	coresight_cti_reg_index(trigoutstatus1, CTITRIGOUTSTATUS, 1),
+	coresight_cti_reg_index(trigoutstatus2, CTITRIGOUTSTATUS, 2),
+	coresight_cti_reg_index(trigoutstatus3, CTITRIGOUTSTATUS, 3),
 	coresight_cti_reg(chinstatus, CTICHINSTATUS),
 	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
 	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
 	coresight_cti_reg(ittrigin, ITTRIGIN),
+	coresight_cti_reg_index(ittrigin1, ITTRIGIN, 1),
+	coresight_cti_reg_index(ittrigin2, ITTRIGIN, 2),
+	coresight_cti_reg_index(ittrigin3, ITTRIGIN, 3),
 	coresight_cti_reg(itchin, ITCHIN),
 	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
+	coresight_cti_reg_rw_index(ittrigout1, ITTRIGOUT, 1),
+	coresight_cti_reg_rw_index(ittrigout2, ITTRIGOUT, 2),
+	coresight_cti_reg_rw_index(ittrigout3, ITTRIGOUT, 3),
 	coresight_cti_reg_rw(itchout, ITCHOUT),
 	coresight_cti_reg(itchoutack, ITCHOUTACK),
 	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
+	coresight_cti_reg_index(ittrigoutack1, ITTRIGOUTACK, 1),
+	coresight_cti_reg_index(ittrigoutack2, ITTRIGOUTACK, 2),
+	coresight_cti_reg_index(ittrigoutack3, ITTRIGOUTACK, 3),
 	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
+	coresight_cti_reg_wo_index(ittriginack1, ITTRIGINACK, 1),
+	coresight_cti_reg_wo_index(ittriginack2, ITTRIGINACK, 2),
+	coresight_cti_reg_wo_index(ittriginack3, ITTRIGINACK, 3),
 	coresight_cti_reg_wo(itchinack, ITCHINACK),
 #endif
 	NULL,
@@ -537,10 +583,22 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct device_attribute *dev_attr;
+	struct cs_off_attribute *cti_attr;
+	int max_bank;
 
 	if (attr == &dev_attr_asicctl.attr && !drvdata->config.asicctl_impl)
 		return 0;
 
+	dev_attr = container_of(attr, struct device_attribute, attr);
+	if (dev_attr->show == coresight_cti_reg_show ||
+	    dev_attr->store == coresight_cti_reg_store) {
+		cti_attr = container_of(dev_attr, struct cs_off_attribute, attr);
+		max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32);
+		if (cti_attr->index >= max_bank)
+			return 0;
+	}
+
 	return attr->mode;
 }
 

-- 
2.43.0


