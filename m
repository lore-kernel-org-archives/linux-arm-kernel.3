Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E25C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0mqMCw4VfOqq/B+icSACyedIdFq/O6teVK4CC3YceA=; b=V/zinmJ+ZTMSI+tux+oSMbelE5
	wpEOUVh3V3tkqpzZAz98L3KZ5jgHnrEbc3/fkzmYTqhQA9OZS4B831LxFwrJnPO65HBKggYZjEn/e
	8G5gJLSGdIPLq8qsDJfrUM1mxSC35mDbwttN1jtV3DDRexdyFDhjUuowHjEV78p6Vw7ye7NyYtmCY
	eUrygUUZwvewvvLPY8k96J4662F7H0rvmK7F3AmfmqHhSLok/AoHzGYOcsuSgCG1pV2l9QGwiZBbn
	ARc+3Kki+mUt+M3i9aeYXd1ZbKtDZ94z6IN1X+SEJ6W/ct8UjmyLINi/rPfQadlZ/NBKv7br9b0Fn
	7mARxvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLoF-00000009o2Q-16hT;
	Thu, 30 Jul 2026 08:08:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLo2-00000009nvp-1aUo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:07:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7xjUT395376
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f0mqMCw4VfO
	qq/B+icSACyedIdFq/O6teVK4CC3YceA=; b=n1405DbVZbZ54A+ySlsRkIoMYlz
	xtlayR4GfUYKA8+DyRoWJs/N7xysocrmgrqriMZvT5RVOWCrqJ4qxLp374eksyUr
	LV80NCD6wY87LPHXb3xyjBCA+PxfZ+qKgEvrQk+piI9yXCs10g0TXNchTD+w1Ftq
	CzD+tnDaI2zIcSvWL2+QOiqgoB99vQUIK0lrznWW3LlIwvfDUXvViYCDYCF2vAt2
	uDe69Hd2Uuv57tSLz46RQwFLJNRNHjKDl/bNv2EB6mpq+jdL91rEfcfRA37jtm18
	VT2h2909gVjH72hPeRr1cf67ow+sA2I2wmt5vMuc0PiiIWvJtGfEzC+gk3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2qbg183-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7621655eso3006447a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398873; x=1786003673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0mqMCw4VfOqq/B+icSACyedIdFq/O6teVK4CC3YceA=;
        b=aPlsu6jONG/K20KMQEGaiuS/Dgml2hzPt+ttEZE5vsXYmroywWacntmCHJezMRYFfv
         MNMmi+E1/J9DgxIgHB1QAWk7mKDqoYVvFQno6ehl18dJgYgzKFGqBDBRftyRFlSta4pS
         l1MAY5a38T9nLX0hwiV5QNvCj4418V9lDXaqJGy+smXTpa3j9oGaVfYThMcBXYL0zp+I
         hpIcLbIUeC6OTcTZ5j1iBDIff8b2drUz4YXk/+AEnLXU7baf0cmXRt9N0vPoIpyDvgtK
         R6tBUo+tLLBF+/OQYn9CLjBF9ggLYOy7gw1Uk2E0RYQbdzmasLYgygZthO+Dh3iBLQSv
         cYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398873; x=1786003673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0mqMCw4VfOqq/B+icSACyedIdFq/O6teVK4CC3YceA=;
        b=pK3NCqu4NRKoLSlmR4GQcu5cTK/Hx/I8Rf1pO5RX+8Bhn2r486Rf9NId3wBzCXkAIT
         x8Bu8TlkS7JR18aoge3s2/bYNUkJY8mbcX+VWTgvWwN1XCEJH5FagDEODLbpG92i1Mev
         lq8ElA8DNn8FDdR7CrlWiuBUH+j9uX/k5InRWulWeqTPX4q0uxVWbNLd1dGhvviabmAM
         crMv6jrI00W/YPQBABmuChnODg7QqVyG0Cn07HX4hZrS4ab6cyG0KhR/JF8WpNmaNwhR
         bsGixbcsP0+EkJj14xaeUY0EE51KQm8kUw8WdJKxIr5QkyI4wue6P2GFsFYxpQoWSfvz
         ahdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1+oEq0MHMZn5Zk2DRaHR793pEsP032lhtkWqA6Jroon6S7vDI6M/5j/H3cuTy+rM7+O301kzMjqvJjc69Dcev@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0pqCAQf357Djm5BIS66k9t0MPKSCL5TotUE5HNqdY++pUUg/Z
	ubozJgPiG5m79xacOdCwBlVBD5PDw1Xx1pkKysuLkxiM+mXulzA4KRDMaY0TqeJPucCRxpig1UV
	6XGT3hv1SDxy3qbBJPQiOprkz3Cgbr/kQCn5hClORxcXYEJ6uGsYcsmezsNHQrpoDnHFIuY/iPG
	++hA==
X-Gm-Gg: AR+sD11CRUp3BM4e8o0AIuZNFTlmr5JRtFDc2peBktADyhAGdI2MLELZIgMWB0/Y3Ji
	YPJPHw4CdnUXMXKNgMsiZWqEMWgYAfcLt36HzcMB9gpSJpMWZjGmRLC2ddprQhi1OvcjmIla50f
	vm/RFB0uVk6+dbgEht4YKh+VVWMN+F1Wq3Rm0/Z8aNmWYKuRHt74OGYC325PAibKIktwuaV8sbJ
	Lk0YAaJe1IOOiysrRam0XDqy6NzHUywK1mkccIXRxH6M7CjWkQVi/rEB6TvMQtesaoEhb6fpvd3
	xmkM9g5fkw5C3DdsxC0yH/dATptClnA0YgL7LtW5T9nnZaMyrRjsu9AbM73NoorwjMJoaZuhIJ7
	WoaTeuxpP/QOzpxsqj/BLzgBhDd9T7T8AvV7jIom3NguGC7/zuPQnyA0=
X-Received: by 2002:a17:90b:582c:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38f9bd692e1mr1404445a91.7.1785398873034;
        Thu, 30 Jul 2026 01:07:53 -0700 (PDT)
X-Received: by 2002:a17:90b:582c:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38f9bd692e1mr1404427a91.7.1785398872578;
        Thu, 30 Jul 2026 01:07:52 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:52 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v16 7/7] qcom-tgu: Add reset node to initialize
Date: Thu, 30 Jul 2026 01:07:04 -0700
Message-Id: <20260730080704.2903540-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iubJSv9R1aZ6v-pVYCiFFNAd4eldhJxX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX6fT16WQ3kfQC
 3tYwXavhyKdGELuEIg6CrOiBeMiTExMZ0UVZR7hdMdONMIYONRauYov6nz7i2C3gAKC1hhFZfzM
 vwLEtEpS9+52sjTrsVuAXGO9JQNpKYq5F38irks4TkmyBnQHomKeoNGGZi0PU55rSr4MXkHiZ58
 2fwBI3ahOvQw44wB4uBP9mAPijUXubOzPfmJvnTeuh+yeH6oKQYvkKqMf58EpXD1wO9zW5JSsyV
 Oxr6DMIfQVCnq9uE0XbN9lAqqDiYej3OOBC48domaw5RVx7npe2/RYm0+38vl9mIOyVcaQoMowL
 j0Fs9LbAfMobOHGbgkte0Zl5wgM1F+2afs411XKtXo2sF5sVkhryEvyXxMjp8vzrcJkLc+nSMqT
 v30ujdJRi3BdIcxkGyb1OZlftMw0VST71zrNIgpZRiT7+lpEWT3vI2xBDTEnE/ZdwA8UUSwzqlK
 HGbBLbfPQRt6/3U7trg==
X-Proofpoint-ORIG-GUID: iubJSv9R1aZ6v-pVYCiFFNAd4eldhJxX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX70nFJCMhNZ2C
 yNM20pRPF8e5iPQcBfyOPzKeW/Fh9Q+5dROqBznFdF7Uk1VLODZHMTqbUYbydE2XRj5swbKRUiB
 wrxZxOYxw41rgqpitq3smAVgB6GRWIg=
X-Authority-Analysis: v=2.4 cv=SoigLvO0 c=1 sm=1 tr=0 ts=6a6b0659 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=79gz_PYK2aiFH5aRGwAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_010754_424124_221053ED 
X-CRM114-Status: GOOD (  22.74  )
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
 drivers/hwtracing/qcom/tgu.c                  | 84 +++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index a0cad2f16310..5c928a5fa033 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -51,3 +51,10 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index ea83273a628c..d65a68faa741 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -228,6 +228,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	int i, j, k, index = 0;
 
 	TGU_UNLOCK(drvdata->base);
+
+	/*
+	 * Quiesce the detection engine before mutating any comparison input.
+	 * This function is also reached from reset_tgu_store() while the TGU is
+	 * already running (TGU_CONTROL == 1); rewriting the priority/condition/
+	 * timer/counter registers register-by-register on a live engine could
+	 * feed a transient, half-updated match into CTI/interrupt consumers.
+	 * Programming with CONTROL == 0 and only re-enabling at the end keeps the
+	 * program-then-enable ordering for every caller.
+	 */
+	writel(0, drvdata->base + TGU_CONTROL);
+
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
@@ -459,8 +471,80 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct value_table *vt = drvdata->value_table;
+	unsigned long value;
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	/*
+	 * Hold the mutex across the whole sequence so it cannot race with
+	 * enable_tgu_store()/tgu_dataset_store(): the enabled check and the
+	 * hardware access stay consistent. No PM reference is taken or dropped
+	 * here - the shadow tables are plain memory, and the hardware is only
+	 * touched when the device is already resumed via the enable reference.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	if (vt->priority) {
+		size_t bytes = MAX_PRIORITY * drvdata->num_step *
+				drvdata->num_reg * sizeof(unsigned int);
+		memset(vt->priority, 0, bytes);
+	}
+
+	if (vt->condition_decode) {
+		size_t bytes = drvdata->num_condition_decode *
+			       drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_decode, 0, bytes);
+
+		/* Initialize all condition decode registers to NOT (0x1000000) */
+		for (i = 0; i < drvdata->num_step; i++)
+			for (j = 0; j < drvdata->num_condition_decode; j++)
+				vt->condition_decode[calculate_array_location(
+					drvdata, i, TGU_CONDITION_DECODE, j)] =
+					TGU_CONDITION_DECODE_NOT;
+	}
+
+	if (vt->condition_select) {
+		size_t bytes = drvdata->num_condition_select *
+			       drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_select, 0, bytes);
+	}
+
+	if (vt->timer) {
+		size_t bytes = drvdata->num_step * drvdata->num_timer *
+				sizeof(unsigned int);
+		memset(vt->timer, 0, bytes);
+	}
+
+	if (vt->counter) {
+		size_t bytes = drvdata->num_step * drvdata->num_counter *
+			       sizeof(unsigned int);
+		memset(vt->counter, 0, bytes);
+	}
+
+	/* If the TGU is running, apply the cleared configuration immediately. */
+	if (drvdata->enabled) {
+		ret = tgu_write_all_hw_regs(drvdata);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
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


