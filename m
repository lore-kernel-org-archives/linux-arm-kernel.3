Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B410CD232CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WVO73lg8H3MqrdW6UnPUf0qCgX6e5vtCpaCq604azc=; b=CyOw4Y5joJe4qbzIDc5qaQAV8b
	UFnS8sFgI9ba4/5ZXzuWuNWYhccpCrCCQnP1EaCpWw5YS/dtrDKyImmsRk2h66HWfm7Q9CASotZzs
	Jib381IquizfcPzWpduaEe/emTmcoHKYY2uYdVL9bwC/4e3XkqFTYxevpmwZVTMVVmzMHeWK2q6Zx
	5mV+KmCwg8mjVsqdCgAhaetWVVMtmXOrs0DftebWdcSE0UxJn656pF0wJsTwhDGoPjb5kGVDZ45tN
	1Qa/2oarOigkitbVYHd2jnzrB1hTEo/1iNkO2P2c/CzWITW/UrGIQmYddj+IyK05/iYzC32tZp7qh
	Qbo1vp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1z8-000000016Zi-3NUo;
	Fri, 09 Jan 2026 02:12:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1z4-000000016WI-2spt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 02:12:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Hjt0f2765544
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 02:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5WVO73lg8H3
	MqrdW6UnPUf0qCgX6e5vtCpaCq604azc=; b=C7WIvEGd05Nt3zR9fkNuoeMLDJq
	5ajka8PevZmCOjads3pfvv6b9rIRUbBJ31/ZEvl/cR8VtFYgWuHVm5AyHrZqR8R+
	UDiIw5T35I1mIyr459lajbNH7ADLWXTIbLL1VJSC+trE02wqHI3ooTZtGdhLCl0s
	oCnpZ3/GyDvqMCjwEX1U5JFQa2UhYa1rWhGFzQKVPSiQvgiTP2A7dUBU/L/oapOS
	3kq4yAj5tA3WTM2L3DbZI9+5zbErYpXamlbMsK3m4N3MbJntRwCEDOiORHf03dc/
	2hDypJJa8n3TIsS79SM/I++eQnlU/P7rNQJ872hDW7maBZcY0PWLLRwjUdA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfejsmx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:12:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b048fc1656so5317020eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 18:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924733; x=1768529533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WVO73lg8H3MqrdW6UnPUf0qCgX6e5vtCpaCq604azc=;
        b=bgHhWtL7rE0oPTryjG6L9hUrAUKvbWRiS9P9cDk87dswUcmJd8caYtL/vD08X1zhD6
         no+MNJBuXIWCxoEnS3T5tS+dfMXjPadHHD5qpYG7f1qsNW94IhIdK5eoZM749vcHXqG7
         tQO0tZiyEVuX+0AyaxHiMF5a6IvTApu6VCKro02oTkKoYjS6xVA+GTQvdpgdq+eZ2WQe
         BAZ8ebti703OidWT/xxZnffEKZylzmQr0WKJTbKJlOCTfyDdFVyo3GWMmzfK/zZvVwvN
         ii3mTxIkWhZeEc5Ovx83V6VKZv58yxg3qHa5/z3tGKqWN8BNIt0A4The73TNvDR/3HCU
         Xlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924733; x=1768529533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5WVO73lg8H3MqrdW6UnPUf0qCgX6e5vtCpaCq604azc=;
        b=g9ZVoDyrD0qFQ3tDmDn4tuzV1OUAeIURbsik609kgXgJA9hkIFcJtcAi/QxDJbpOnh
         UnAiFOuNsS5r8iqpg0biPZVRK6lNvc3Lrxci2OKfQSYxshdRj9XrU53Qss5H9rm6r29D
         C/gL3PgbP0Hzt74kYVMC7eAvJBLa0Cpxix47URjmmokI2rfoaeOIz4L15G9RIEbChTOd
         ZYpDJBleXW2pd/tWCT1dHHBopiFcwqWm7TEe5F3+tI8wDnrPGOexzTsEwUwWkZhFUhEr
         fCJXjba0yYxPiOzWnjhxiEr24JB30GTA/L28eYeu+2gqbriGEkUKiL9+r/cSWXLENdn5
         OEsg==
X-Forwarded-Encrypted: i=1; AJvYcCWhXtvGxuqexOpL4ehy6TZi8P3869P6tOG8/h9KWV31u5ltgXkTwIboq8c+o07MLI7T5o1+6h1rhWV0xvwxcke8@lists.infradead.org
X-Gm-Message-State: AOJu0YxwAfg4Uq0fkQ+mTMexk531Izyhjd1Hfm93/sNbXoyIXJGRtMR8
	1iPDJ8M2kIzphQy/Y/I2PkE0+1/ZSJH560TYrhTtFXQBsvKihfrnXdCu6QMzWSgfyL6iREl5+O6
	fkLb/kJOdkH26rKwxi5pXuH8Ut9u4QGZ8QI7ExRA1C/ODgX47m6r59lIz2QssSRbADhEsqF/cKB
	Qtkg==
X-Gm-Gg: AY/fxX6cr7kQKfvfdzRWy8/aHtqOD3r+YGRQTIsSrTS3ZBf+qneomYho+f80+esXn6P
	DHyS7XTQ7G2yhT5VL0vAdMZ21jY7qZykQ69gFAKlN/PBmFcE6UF6tQzBIdQ8Mh+ir8c/wjmlmSj
	At0DX2sCcr/BdSV5lOVeHZGOZBHdfKFOQHo3+bDBrSU0ooTLzUh4jvJjlTWlHD3lhvMKz1sRuyF
	4vcwtEvamBbJ+HKn5DuxCy6dPSdHlaY5HaFAWHfZwvJFezopb4/X/GzMWPmdAAD9mY8lCWiK5v5
	fg7FZdy4/xxVFkVH7FNGVYiLjH3+73lU8wb7q1vGsb1Xr7bs2NeD9pNpAU37q1ojF10s19aBOaW
	9hoM6Rqebf2q8FuHRxIibnu6UPyj3yt3Rp4x1uDCq/gfzKTbMLVrFROy2Kg4A6Bmx
X-Received: by 2002:a05:7301:5f0b:b0:2a4:3593:9695 with SMTP id 5a478bee46e88-2b17d23527emr5326615eec.18.1767924732378;
        Thu, 08 Jan 2026 18:12:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUu2PFxFOXUcj+EWrOOh50w4JB2Xz1rrSqKPrl6QbYgC/sAP0pFru4LiT+M4Q8VUJfQBSsNg==
X-Received: by 2002:a05:7301:5f0b:b0:2a4:3593:9695 with SMTP id 5a478bee46e88-2b17d23527emr5326591eec.18.1767924731791;
        Thu, 08 Jan 2026 18:12:11 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:11 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 4/7] qcom-tgu: Add TGU decode support
Date: Thu,  8 Jan 2026 18:11:38 -0800
Message-Id: <20260109021141.3778421-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XK5sAATgax8Pt9DiFAVvzge7kmxXQutn
X-Proofpoint-GUID: XK5sAATgax8Pt9DiFAVvzge7kmxXQutn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfX+ssqqO05y3eL
 LgoKvqgFMZfh9R81MAuWu5lVWvM6VLv6uO5KlGm1whCbGzFsFprVBp9OwVVSZ6x26SZXkKHvvuI
 b4cfF9CjHFE5jflwsSRdT1CYyiyjSV1AF39Jg49c1IUiqczdBwghHYMttZkFuDswNAAPmRJZJ3t
 qaU+5tCAfgSe2om4e2F5Ct6Twi7ngQ5j+nJ9LsDZ8BPehDeppp/7xZuG+pTE8DL2hi+Q41jNI2k
 VCbUARGS2u4khiLpa+FWqjISMco7A9RyNEAJjCnRfS9JVfsopXxq6g8RvrW7bETuBmQ/kA9k3H4
 S6qmhrTB0j5l/JHh7kob6+npbBbRz0baNCc5nfPLNIhXbPNwgy7mRMRR6KXCQFgRQbUl9jK6qr+
 bBohhbQptaPn5gJNj88o1yMuLppjeoLHgSH45yIgfNw//7+pVv5N87a91yBowc21yfYuB2WP9eo
 mb/5/feOSq8JNPdgABg==
X-Authority-Analysis: v=2.4 cv=ZfAQ98VA c=1 sm=1 tr=0 ts=696063fd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=17ZuibbC0m_VACr_8A0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_181214_873072_0B07CB6D 
X-CRM114-Status: GOOD (  23.15  )
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

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 162 ++++++++++++++++--
 drivers/hwtracing/qcom/tgu.h                  |  27 +++
 3 files changed, 177 insertions(+), 19 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index ec630e6ff2ee..4efa36a11d8e 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index f8870766d624..39301d35ee9d 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -18,8 +18,36 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 				   int step_index, int operation_index,
 				   int reg_index)
 {
-	return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
-		step_index * (drvdata->max_reg) + reg_index;
+	int ret = -EINVAL;
+
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		ret = operation_index * (drvdata->max_step) *
+			(drvdata->max_reg) +
+			step_index * (drvdata->max_reg) + reg_index;
+		break;
+	case TGU_CONDITION_DECODE:
+		ret = step_index * (drvdata->max_condition_decode) +
+			reg_index;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+static int check_array_location(struct tgu_drvdata *drvdata, int step,
+				int ops, int reg)
+{
+	int result = calculate_array_location(drvdata, step, ops, reg);
+
+	if (result == -EINVAL)
+		dev_err(drvdata->dev, "%s - Fail\n", __func__);
+
+	return result;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -30,12 +58,26 @@ static ssize_t tgu_dataset_show(struct device *dev,
 			container_of(attr, struct tgu_attribute, attr);
 	int index;
 
-	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->operation_index,
-					 tgu_attr->reg_num);
-
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[index]);
+	index = check_array_location(drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -47,18 +89,37 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		container_of(attr, struct tgu_attribute, attr);
 	unsigned long val;
 	int index;
+	int ret;
 
 	ret = kstrtoul(buf, 0, &val);
 	if (ret)
 		return ret;
 
 	guard(spinlock)(&tgu_drvdata->lock);
-	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+	index = check_array_location(tgu_drvdata, tgu_attr->step_index,
 					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->value_table->priority[index] = val;
-	return size;
+	if (index == -EINVAL)
+		return -EINVAL;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->value_table->priority[index] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->value_table->condition_decode[index] = val;
+		ret = size;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -74,13 +135,27 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 	int ret = SYSFS_GROUP_INVISIBLE;
 
 	if (tgu_attr->step_index < drvdata->max_step) {
-		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
-			attr->mode : 0;
+		switch (tgu_attr->operation_index) {
+		case TGU_PRIORITY0:
+		case TGU_PRIORITY1:
+		case TGU_PRIORITY2:
+		case TGU_PRIORITY3:
+			ret = (tgu_attr->reg_num < drvdata->max_reg) ?
+				attr->mode : 0;
+			break;
+		case TGU_CONDITION_DECODE:
+			ret = (tgu_attr->reg_num <
+				drvdata->max_condition_decode) ?
+				attr->mode : 0;
+			break;
+		default:
+			break;
+		}
 	}
 	return ret;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
 	int i, j, k, index;
 
@@ -88,8 +163,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	for (i = 0; i < drvdata->max_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->max_reg; k++) {
-				index = calculate_array_location(
+				index = check_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->value_table->priority[index],
 					drvdata->base +
@@ -97,9 +174,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			}
 		}
 	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_decode[index],
+				drvdata->base + CONDITION_DECODE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
+exit:
 	TGU_LOCK(drvdata->base);
+	return index >= 0 ? 0 : -EINVAL;
 }
 
 static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
@@ -128,18 +219,32 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
 	drvdata->max_step = TGU_DEVID_STEPS(devid);
 }
 
+static void tgu_set_conditions(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret = 0;
 
 	guard(spinlock)(&drvdata->lock);
 	if (drvdata->enable)
 		return -EBUSY;
 
-	tgu_write_all_hw_regs(drvdata);
+	ret = tgu_write_all_hw_regs(drvdata);
+
+	if (ret == -EINVAL)
+		goto exit;
+
 	drvdata->enable = true;
 
-	return 0;
+exit:
+	return ret;
 }
 
 static void tgu_disable(struct device *dev)
@@ -243,6 +348,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -250,8 +363,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	size_t priority_size;
-	unsigned int *priority;
+	size_t priority_size, condition_size;
+	unsigned int *priority, *condition;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -269,6 +382,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
+	tgu_set_conditions(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -292,6 +406,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->priority = priority;
 
+	condition_size = drvdata->max_condition_decode *
+			 drvdata->max_step *
+			 sizeof(*(drvdata->value_table->condition_decode));
+
+	condition = devm_kzalloc(dev, condition_size, GFP_KERNEL);
+
+	if (!condition)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_decode = condition;
 
 	drvdata->enable = false;
 
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index f54cea01e427..0d058663aca5 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -15,6 +15,7 @@
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
 #define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
 #define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
+#define TGU_DEVID_CONDITIONS(devid_val) ((int)BMVAL(devid_val, 0, 2))
 #define NUMBER_BITS_EACH_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -48,6 +49,7 @@
  */
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
+#define CONDITION_DECODE_OFFSET 0x0050
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -56,6 +58,9 @@
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	 REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -68,6 +73,9 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 			reg_num)
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -90,6 +98,14 @@
 	 NULL                   \
 	}
 
+#define STEP_DECODE_LIST(n) \
+	{STEP_DECODE(n, 0), \
+	 STEP_DECODE(n, 1), \
+	 STEP_DECODE(n, 2), \
+	 STEP_DECODE(n, 3), \
+	 NULL		    \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -97,11 +113,19 @@
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
 };
 
 /* Maximum priority that TGU supports */
@@ -116,6 +140,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -145,6 +170,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @value_table: Store given value based on relevant parameters.
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
+ * @max_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -159,6 +185,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int max_reg;
 	int max_step;
+	int max_condition_decode;
 };
 
 #endif
-- 
2.34.1


