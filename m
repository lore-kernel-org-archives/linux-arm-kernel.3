Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0A2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x07SNj1YXpj6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=; b=M+0gqyYoaVFyFgUPP3oq30/Yo3
	G+MLDUnqW0pvdu22gZO17X8GMQRswS+arKQ9j31ZxkUpBkXacWueUhabHjvM0zys2jjiUnePQjdOl
	qC/5+RLrqLN5Upd00hEr0RzNpBW1COrr4BgqIWykoOMQUiVtx1ugtfnXQ0Q9ynoQfB+LKesWGHdbq
	VUbi5RA4IbYC5GryPUGDGn3N2vFWGa4vf71PZIpbTVh6W94VKQW+CgAtFUrfYCTaPTpYdrwQQE7uu
	1WjEPdT09hTC6732DCrhz9905F+3Wrm9zl+GdkzrBXCiHUnUDHWVJU318fd3aJLOLOL8zM88CwOQl
	KM4JVkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDIx-00000001Qi0-4692;
	Mon, 14 Jul 2025 07:08:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCjH-00000001MLO-3VYM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:32:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DKUxFM001550
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x07SNj1YXpj
	6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=; b=p0Ml7n0vTDmc1YlunS231ZIeuoW
	jT/NRHdzV5N7ud9iV/wl48L1N+pjnhRWvIP/vBZun14m4tVkFSRo7zzpYRpAEifv
	VwhE21dCrtAgQESi6Nc5dIQK0YS08/ZUTGzeNXQRoez7mPHx3JmsTdDy7xfK/Q5g
	ujl7LdCj5g7TbHHFnYzNhLs+zoJYhwCkjcDob2Ocr8m55rVgd94vpZfAYbFpalPw
	GLfXp14uEOL/Z4IRfIyEOBHLmf9HvLIkJOguk2beaSPK7nIphx0hKoUMPTtsjPUt
	x/TCH3EQVZ/Zj0aEbBb9+Aons+aN0mx+488hXaUh37kUP3gZeIuk1zWsfVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37ufgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e7550f7bso38790045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474718; x=1753079518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x07SNj1YXpj6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=;
        b=IE2aUrT8LOPhAdvkiXZVOqDB7h4vRTMhHirnadl/AFdy4+J6hfId2MCSBLht/4JQuF
         /9tTf5IX2gZ8wJeMNJOM+diuiiu5J6tzB/2ykWtZssO6LI6yK4msDX6mTOwqWCqO86lI
         Gc/5Keq/nlDMXBsQJNPejeGJSuGNG/D6DuvKChzIGVCC7NyyYTzScXPpWjx9nHZp7Zhi
         WyI35gv2+f9A7z4en9YAuRMZgK1XFXxx1CBVOywCs03SOhhltzBXp8MzBU+bJ8Oczuw6
         i9/179D7XnhmBVF/HfbMMafrKfqSKFZQO20tLWw2/8f64nK3hVKsAdVJ1spts9mLSGD1
         xe6w==
X-Forwarded-Encrypted: i=1; AJvYcCWmFnAKyYO69FQ0XB7tdvQ/158WJWfHr7byYnUFA5t2Mx0hjgIZ3GX9U+tTz0YFAadJ3xOGdk2IbRIot+lOieLr@lists.infradead.org
X-Gm-Message-State: AOJu0YxBu3lJQ15JxZqagvQ2OxAk574z2gzuJYsWVttvEyQbbGrMVZen
	4tu3MZDBgpXTtbRZ81gfz1jiNbO9e3ADNurxvCrtYVzYwHaMRRl8/GkbZCWGHjXh4dX8jebj7oY
	4Kb9NaYxnjalkqZauTC12xocwgAVq9skZvUyTDS9PbqqCMkFYIZS4x/WjoooLhmZwmIZ8r3rCBQ
	1XKw==
X-Gm-Gg: ASbGncuPw2uNURuqBmKYApCMpmjt/SWm1LUIHuK2rh2LV620zqTylVVdRuJOvikJrh/
	rnbnUaBsWR5CyqUTPHYjWkuAWYYoSzMZQM7M2DjKxlQ+lhJjHuSxT6ZU9uVninI61Zagt2ze5UX
	wY40yndW/SAv0mIKa0X62z6qXlQZmak8onn3L/jSuAY2GNYCQ6dZMY+bz6W7usK+DF6plHxcCyC
	rvk4/33OFtF7A1W0AJvDGXLn576e/ATXPFZtz7pZJBzbJSR8rugUhocxAhlS06tEZIwbGEqrLIT
	ilqAV+6mBSAKQzR/MJCLMrDSw01Sv13c3sBJMgTFIom0N5DIYUtWpMKFEtBl9weF7KxxXzC+r58
	aM2gWLLT/nW/XqTOk5N+y
X-Received: by 2002:a17:903:1ae7:b0:238:121:b841 with SMTP id d9443c01a7336-23dede4611bmr207184805ad.17.1752474717714;
        Sun, 13 Jul 2025 23:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfgAAT9PdM9bRbi+at0lzqsfYnbzx5YAban5kucbRgbI52/04jPmJtMd8Ou3a8XsGgoWkAiQ==
X-Received: by 2002:a17:903:1ae7:b0:238:121:b841 with SMTP id d9443c01a7336-23dede4611bmr207184305ad.17.1752474717246;
        Sun, 13 Jul 2025 23:31:57 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 08/10] coresight: tmc: add a switch buffer function for byte-cntr
Date: Mon, 14 Jul 2025 14:31:07 +0800
Message-Id: <20250714063109.591-9-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX3RvlexLVTH6x
 I9Nqyq7YxuHMVSOwFlrBr/Zb0KAyG05hf0bUM0vZplOCpdDNP97DRrtuDGmzBdAu0sSVld3z9c8
 2IJb3axJQj8ugrriVJn1tpEkEd0No8baEcsoiSpvzHyyDJjldfnQKxElnIgwk9Tjq9tQNsWzpe/
 fdxLnztB5T4CIffAiZaZZVM+7wK/LiGLJ7zo8xyasyfg9S+GidGpC/75FOIw91O2ad6tDzW+baJ
 woRRh7fAX2AXDYphidtDVj5IRd2oR5yhxLJfQRgwxHXWWH6A5Vb6M7Z/Lk078K/6h8KTxFvDcde
 AVH8DZoVBaFaLoLBsaxmSTT20YDrL/XH9DoSPb5DGfGZpuAuE4Z2i6jFGrBRaSA+57igeSlxeGC
 J+QpaQnqAl8O/Bg+a1/ZH5TjMwOw6xhz1NfEUxsCC+lncv+BF67oT4fOmE33B3ylXW7cMexN
X-Proofpoint-GUID: T6Q9V5Qp8r6dwBYNDZ_ub860VgwyS6G6
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874a45e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wDWrKlMOwBuH9W2KgGoA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: T6Q9V5Qp8r6dwBYNDZ_ub860VgwyS6G6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233159_996082_861C01F5 
X-CRM114-Status: GOOD (  20.12  )
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

Switching the sysfs_buf when current buffer is full or the timeout is
triggered and resets rrp and rwp registers after switched the buffer.
Disable the ETR device if it cannot find an available buffer to switch.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 2b73bd8074bb..3e3e1b5e78ca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1287,6 +1287,58 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	return ret ? ERR_PTR(ret) : drvdata->sysfs_buf;
 }
 
+static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
+					struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct etr_buf_node *nd, *next, *curr_node, *picked_node;
+	struct etr_buf *curr_buf = drvdata->sysfs_buf;
+	bool found_free_buf = false;
+
+	if (WARN_ON(!drvdata || !byte_cntr_data))
+		return found_free_buf;
+
+	/* Stop the ETR before we start the switching process */
+	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+		__tmc_etr_disable_hw(drvdata);
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		/* curr_buf is free for next round */
+		if (nd->sysfs_buf == curr_buf) {
+			nd->is_free = true;
+			curr_node = nd;
+		}
+
+		if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {
+			if (nd->reading)
+				continue;
+
+			picked_node = nd;
+			found_free_buf = true;
+		}
+	}
+
+	if (found_free_buf) {
+		curr_node->reading = true;
+		curr_node->pos = 0;
+		drvdata->reading_node = curr_node;
+		drvdata->sysfs_buf = picked_node->sysfs_buf;
+		drvdata->etr_buf = picked_node->sysfs_buf;
+		picked_node->is_free = false;
+		/* Reset irq_cnt for next etr_buf */
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		/* Reset rrp and rwp when the system has switched the buffer*/
+		CS_UNLOCK(drvdata->base);
+		tmc_write_rrp(drvdata, 0);
+		tmc_write_rwp(drvdata, 0);
+		CS_LOCK(drvdata->base);
+		/* Restart the ETR when we find a free buffer */
+		if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+			__tmc_etr_enable_hw(drvdata);
+	}
+
+	return found_free_buf;
+}
+
 static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 {
 	int ret = 0;
-- 
2.34.1


