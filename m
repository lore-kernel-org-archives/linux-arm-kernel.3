Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333E3105F782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3QKe9UEvF2DO5cfYaW3eH4Kymumo+ieIlTFLLIUxrU=; b=zNpaWUUpmRvUO7I0w26OzYv5Wu
	noUPVZbSm31tteSCxwKdBwQBsa04qMOi0LOLD+r4i4Mn88lCPgOgRSTAQsh26sIdgAH5k9btY32PP
	Xvd2ih8FtWa0C6thaD6XJp7JpCpCjvCte5QSjzwEOrOffU7T3I59MBkbE+0Dyn7oYr9TTVhaDpktI
	0/KflK38HQaESNC2gw/csQpfLLumX91i6HmNRifwmxayHZesX2buCSTk37sMswPyx95uRxxY6DY/1
	8oQq2ZbgJlYN3ssdPEQ/xhl/PzCbUytLCdKtT/ifYT0X45BAxF7fjBGN/Dn+IVORXR6iphf0tec9S
	Hz38WnIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yQB-0000000HL9A-0Gce;
	Fri, 13 Mar 2026 09:03:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yQ6-0000000HL6n-3JeQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:02:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tclM1176374
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3QKe9UEvF2DO5cfYaW3eH4Kymumo+ieIlTFLLIUxrU=; b=QJUSP//V4NS+aQIo
	n/iEjSXTXQFa82nnGfgR3XQ7XZn16yizAvPIrYC0Xf4ZkSJWhaUVhQZ16Rrlg+8f
	h9bJu05RqPo+tdjXk2Ji6CECtbs5FLIZOlql6vd8X6cjPpl5zOSeef5TZPgouaYV
	LAD0ZRFsMboM+i2ftLAYLERyarzqoHmNxbDGZ6+1K7+uKaghX/YlQ9PgKcFQIyPB
	hcgaXyulZZGZ2g82T+wDC/nDXURAXhErKcr017vfMI1xXtZB5JziIf4TGy9Wposc
	Sj6LMoEgskLk6A7XJAggwv+LLbk4sv7bpoByomC30gKgeqNda5OA9JaQWzkYJIZk
	r37fNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqcsf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:02:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aece14b507so5250565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392577; x=1773997377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3QKe9UEvF2DO5cfYaW3eH4Kymumo+ieIlTFLLIUxrU=;
        b=dQpmuF57IP+As5H8TNEmXBMYTZKm8ZEShM1F9JDh1620t9Gr0V8dF1Lbo1Ur7oFDYs
         TMI/aXvg5z8wBDqXAzpugW20H5cQ0YWYoxl4FdvVBW6mi6C1YPHecI5mpeThtqxdeqs9
         qyAXxj20GZM5dqH/Ai+50XHiiY4XRhMhOJawDMbV0KJDZWzfoLN25W7VA1guC1m94cAa
         I8vDb//6hCauYsO/UH9G9nC/YVYbNnLl8v68gdoQ8EXkow+gKJV2xhW5G7baYRI8nS7y
         dcsvK+6KnnPjQtfSGWAkqDNQkjgY9XxoEAzZpG1s8kJsRKx4yMsex8MhNra30/cD3GZK
         eRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392577; x=1773997377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3QKe9UEvF2DO5cfYaW3eH4Kymumo+ieIlTFLLIUxrU=;
        b=dXkhEuJSIOY9k1/vyMt1YMuvZ+ccyrC73E8FnYBWfSLxXLy+UrH+V4Z6ExEkLZrJyj
         4Mxj2qeuO3b0D55XWDy3x9mMHGOqXlH11n/Hg9LnKidt5MlbDh8C4G1/9szTvm/Hex/0
         cH3O/QVWdAfG/Yr4gGQ5SJs91wMMbqixWQ5+628AoLxfDTaOY1L4/jb7BQUyklmdkewq
         JBLY62pr2x1ak1jFjVynjnh4wmdDNmzZSwYkT7gc9Hm5aIeTcV79rSl+o9Uwew4iJkxS
         rrqVTt/1gT+oMQZRIr4BOqf8k2V2m1LmF+8S3fzDMP4A95DRo3UvuafwJV1amF4lsJSu
         prpA==
X-Forwarded-Encrypted: i=1; AJvYcCV5USZkT1iMkvlMQaouUNrIc2LspQn8Hw+pRL7nGr1bOVs51j+TDRqFmdoHnNJsTudu9NNyEewhxCIduvSBY5+8@lists.infradead.org
X-Gm-Message-State: AOJu0YzsYzmu2/jtc+v46d1heP6wvAZMEg3vZaYaTIYjjTXQBdf4JLFZ
	uZPt6ae9GJWVr0NKUa/iRzl3KuhqJRhK54593MSqoAKhqCIEtizTL7Gq+VJqOB7TSVcBz6o7WDF
	s3gwGWR0hdvA3lynrGqKV5DJGiy9XCA2N52cMl+7ZrG7FVnuEwBvVtfTfZb0GzOL5h7bwU0jkCN
	59CA==
X-Gm-Gg: ATEYQzz2r0Sg3jZBtby8vpWT739cT70wnIMxDHmYQLYID2HddMYBB9CHVtPTe769xHD
	H1wMIeDNJI0QeeFAuz4HK6JFkAMBDvX84Qy09P710ViCc6pAxpV0z83qTvB9XE3EpzQKv1zZzJ+
	t+4VLvszk3kUDoLhb3J5TY9oS3tcywlhZcAf+3CN4hhHsTCVEeMlDiYs6dFhWCbpcQkxjKmqTmM
	0eYi54ixEqVGyYBBngyhHm/Oud4ggamcuIIBmT1R5UxLcxSlcHCaXS9HjWsI98aduuyHMfpvcG3
	SI4sT7zw9Hej8tRYen7G5as/DJtV0ywDB8H/r91PsIrlIEUIcmOBkUXdsDE5ixT+ClrbVqvtOFp
	waf0CfaEQqemwj4hpxQ+b4wVuQOlMG8Me40SSZopvBpr3mgPHLVw25kLeO6piQH5Nv2h3YmIfe/
	c0KNQkdCVa
X-Received: by 2002:a05:6a21:7706:b0:398:71b6:33aa with SMTP id adf61e73a8af0-398ecdf29ddmr2038616637.64.1773392577535;
        Fri, 13 Mar 2026 02:02:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:7706:b0:398:71b6:33aa with SMTP id adf61e73a8af0-398ecdf29ddmr2038581637.64.1773392577039;
        Fri, 13 Mar 2026 02:02:57 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:07 +0800
Subject: [PATCH v15 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-4-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=SHQCxyqhzOhDvbMmdapiBeYjKlWwzGTzuuL4qctEsok=;
 b=r51Dn3HQ6+cRTi9Bx+21pf6jblf+Slf/fo169jNssmIDb5fBcFkHf0XkqJIAVYEoIHrgjF6V7
 uWc4QNP8xkpCMCX65JnUKBnylEf39DUaaagbjqPQlEyMbdU3Jl1MLyG
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: k7XueSgG6MDkSha--sWg8gONjeuGkkTY
X-Proofpoint-GUID: k7XueSgG6MDkSha--sWg8gONjeuGkkTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfXwhIVjFq0kJEn
 WNTTb+4Ati8abORxscHykgnB+puxI6AYulcQti/jGmCSNW/PkAGUWyu/w2lWehlnUF0KcTMETql
 8CaZD6Ds92NicnIYiNuzlR3oQXeJrvXJ9Grj+Kyst/zHlNpecHfrhMxyhr3h4hQuz8V3bpMvrEq
 MYHSX4XyIJfCnZM7Q04M4ZmGukeonlfP8vdx/IhfHRTPYkCNA7gQy5nc4mIu6kRIRDE8Wano6HF
 hqtcylNQaQ7zea0FD+qkxJFhg5gcBpQICwDMndgI5Mn3/36XnboLJNLQoXzh30Tfw4JgujNswuE
 tecTcqmCjPaDmGvgPIRPfHbplHXUCfkX5+OSpYmU+CDmsotZJe45SOIaKovzmfQ/7Z0NzhSzmVx
 L4DAPVGRZY1Nfbq1shZL2geaN1h5YoIboJGk3j6DjzvsYUKeUcrK3p8XFBTNA9RInHVOftaWt1Z
 6JEI7hOu5XZUoujsScw==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b3d2c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_020258_844109_B859E148 
X-CRM114-Status: GOOD (  17.20  )
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

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index fdf23e1c932f..eebfe45b82b9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 4d80105d3fcf..00a0b3597348 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


