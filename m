Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F5DC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x07SNj1YXpj6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=; b=tLue7EXLIUlx+fJoJSrY9x/43y
	N+vph0Sa2bKUgHhnebeb/WdL3sCIGeY6cEeri12kthXeqFrWZYC605gC1+IKLApm9E42p7zm0OCT1
	6MFgZNcNLnzbI4uE0Q6tWOG0NCy4RLtCJ4pkhKaUO3pwfPck5thPkaduc/DwQmE1pXJpGuf2tllTc
	JbYMJaihQYaSkmCt9Bmn0e8K2G//gbAnbK1bfinJ8iM1JsJ+mRMNeemRdyGc3s96KRbRdk4rFgmCn
	oWLJ6wbI+OF/V3SxyG0GlFmnw4Uark/8+0Qp7s0/lyGLseJdsCXPaao4JOGyAhs2bkYVpZ68BoUzu
	BbaD9R6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTx7m-00000004lKS-3oda;
	Tue, 24 Jun 2025 06:27:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwmc-00000004jGC-1eIU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:05:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKl6dS007961
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x07SNj1YXpj
	6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=; b=FdU6f3GjHRbFs8m3J6pr3YFOYam
	OchjWHIfYetew5iKxw86RrBnjvgD6LYTBIDRHxeMshXe3QX60V/KTOaxrJgMgwt4
	76SWEZHMC8sv5BUVcPjB8fx5mOx/UuSPiIdbQQc3dL43jPGJs0fnUXcfkuFOaFCY
	raV8CAqeq9Q1iCkhY45zclLyO++C9IcyE7+Dir3uW3Yy0nkfTp90/fQiTS3CJquA
	de38y0LS9NyUXrrP/fH+rqfZXQdcmmnoIev8Lyqr+yhsNFQ5nfV5KatUf0Svj30l
	CmU/Pjp3fMGUUL+OgFOFLA1JY/rgxbhFmu638RgMNLDvPwS241Jp5bNO11Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttt5pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-236725af87fso555395ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745120; x=1751349920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x07SNj1YXpj6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=;
        b=WdMsbbItnLErNUqLz5cHlNhqVOiyeRn2iztyllwoAoxK59DkWL4u/lbkn4oOXE6DiO
         cuK66wssqAgYVhsBm0jEZCcOOmUYQImV1wWjkhBHxxXmWMU+AlSdAzSSOjJZzFT+56L1
         5RG6jRz9Hhqqk6EX/Ah6fydXbvyNVhG9CZDWxUdf+m2lTPFMd61qTXnE9tK6cib9gkR/
         GgByvx0iqERXMCy4BOl55Oe6bp4CcO2Ox+IBFqrTQJxTsaRLW3Yeqt8jdGBzdznxhbJJ
         qRAaf4/CSmNnMyx0Afm9WAABLF743nCVNLlMTX4ahMSoaeJ4kVYXp+WlCne3sNeE1AQM
         lVog==
X-Forwarded-Encrypted: i=1; AJvYcCWlUhBJUPvZxRyoawORMWKe81UKlFTHR2qqfXga1/SF+U+FxRsUHuIv4vLiscwEaozGUXtMBr/kPshPuZeD+ZiP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8C9dFWJrJjL2IYLwEieWihN+Bknsh0TNHFET5Cuwtg0j0ouQS
	fdBpxgzt3/rqPMhIA8//CNG6QWmiVuW5CZKnwhDveLA2ErMyKTs/WXnhIWO8rYD2TkvySO9v+HF
	wfZwLsXXoYQ3CwXfYvD/5K2JpDt1MqYAOV/IpPBjS1Q88zzIAbUHGyjOBanDvBHSfaFl9vDzFJ5
	yz7w==
X-Gm-Gg: ASbGncvDhaNfNAPO35dVGdPfjyACp6hI8e4QFkKwjTyjVvF3B1UqBUJ7gyTLeYkm0oL
	GUzETO3YdKRwFtd4a1hmprrBYwB9o9w1AIEQs2Dzt6PnwI/GvDeLVj5nizZriXnkIC5TIN/8v1A
	QL+VD5ZBbBsVp9JbUIyTrk2syLJHa1lk3NoC2O03iy4GORo/8y8hKHwDWfkl3xiIAMz6/KXdv/I
	11PKJsH7txjYam+TweUvCjuNBE1xLkoVieawvcUiT6FmrK/ziiryw8r6hAJJT2v5B0MVzV5oJoO
	76hpEW2UksFU0Pr3A+sE66QDKdu7q9hJhxjegT+pC7Sx/evaTObUq4amMiWuET/k60OvwFeagXW
	emA==
X-Received: by 2002:a17:903:2d0:b0:234:8a16:d62b with SMTP id d9443c01a7336-237d970f9bamr253275985ad.12.1750745120408;
        Mon, 23 Jun 2025 23:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE97aOL/swaHhYhRTiIKSN86TTBXV1K7HhrE7lHhuqfmi5WW9OInNk27uiW+r30tmlu+zChDA==
X-Received: by 2002:a17:903:2d0:b0:234:8a16:d62b with SMTP id d9443c01a7336-237d970f9bamr253275655ad.12.1750745120065;
        Mon, 23 Jun 2025 23:05:20 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:19 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 08/10] coresight: tmc: add a switch buffer function for byte-cntr
Date: Tue, 24 Jun 2025 14:04:36 +0800
Message-Id: <20250624060438.7469-9-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a4025 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wDWrKlMOwBuH9W2KgGoA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Qs5fdi7uK90hUuSMZx8VEDTmwyYxM98i
X-Proofpoint-GUID: Qs5fdi7uK90hUuSMZx8VEDTmwyYxM98i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX3Vd45HuWB1kv
 ruy/x3Po5G6UMxu8W8vb8sOYv0H+/AT4gtR2lFfzHg4xnQMaKhMVEy2i3EYDApio2fSJth5cOHW
 i3K9YBD7AjvwR+e3UCH6k4XJA/45mezEUENobb7qqyTLhrwm/5Suo4DJJkd8nPxrihSfDEWGgom
 y8ih79mWS1BuLzVcJmZPabfuxJhclRyJcxjxVw6MqkzJJnJwNhMOXtr8YobrE6NrNn0wbFS2Xlq
 rU+Qm7/Q2S/F7gWbe5eZNPB68Uwi8CrPhz+J+buizdBPhaR/aYEYUzStU57TyM3Nb2CUOVN3mqN
 7OQF+b4pUQnEnC86Osn+QteczYv/D1gDPkqX6q8wZqm2TaZjuKXe2iz3baWL1Wz+hdQaG/TrHLs
 otjUsAzIGktkQvs/b6Yw0iuH22b/TAOEHJQDlKzRFU+lXgcskZUF1CZKb8m1f+P8c0hdlAtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230526_585629_CC11C57C 
X-CRM114-Status: GOOD (  19.63  )
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


