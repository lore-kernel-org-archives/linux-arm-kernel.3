Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D88E98DEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=; b=PN3BgNJsQWFz5y9teePMQi3v7f
	eAB66R5Z1cx2grE3ydzLMPwur/yeyJ1+YusfewGdZk8Xz2CktuhgrjsVMjM9w9kjLMbQyMqMxtmHl
	3v6BfA39hPOalsv5lR5afsC1GQGOelQQsQ0MUzkUUEmlJVdA7bxEzL7CmOFNkNb8i6DQMsR0MpwMU
	2HGA+UeGCDVV31ME1YcFgEV7H7Ws/o1oVhoHWfWrDJWFaQeTKnzxfKJ5+NhA68JLWzKKQF80b7JZN
	0W7335eB7xrsMhzDTVZmTulwIgqyh6w6qChTXc+L83txcQEgQswVU5PAGE3YhbOydL8XrTfTunxnA
	CkMkgkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPh6-0000000HJE5-3dJj;
	Mon, 23 Feb 2026 06:45:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPh4-0000000HJCq-3JuG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:45:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MFQjA7331517
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=; b=RLjqLK1b6P+q9cVI
	aTsxfOg9QjnjKauIsXAgHXXl5ZnbsMtCFVaRb0jguBtSzanNdw4JsO7xoWQv4LzJ
	NrWSP7mZUFWZl68w57siwDjCHO63eOkvBChnn+F6vsFRBhOwXi8D1djqjOAnU3ve
	/23d6A5yfiDE2QA6KXg+boFoNlNXWFvpbB/dPPjVBqGMwq1QQK434RHXnW+Qo+gu
	PRVYeFsyS5ygzpTb+UNVP6wpaeQsVRPOwK8j9EBeo8DO0CLdtBioCptANI5xHze2
	zejVmqsiF6d0yDqn0EExMvvXvYNPDgCEbsqqZVFW2GfS7gXmJlL+MOdC4wUzn3Ql
	PeV2XQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603kp3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aaeafeadbcso47838655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829121; x=1772433921; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=;
        b=Bdcg9KbGrGi1JMXEgn3l56wrkKtZDeprNFwPogZhaGJ3pHfBH7JuskVVi4IS2GUkUz
         gyE2jgTtY7U56B+QYUOtzVE2epyf0IiIlv0lJJ9vqEaSnfL6SUG/Th6XMZG3nC986CO+
         KZIV17eiCirUhq4LBL4VbzrC3GgMpWy2Lhvu5pKsE39dfPKWAP5BOeLJUAI1VD9nE6rJ
         6+PTUKDYC8tm4Xpf3uPw/z25qeVb4Cc5qvWASG8dhX5EDH9EycYzA2R23O80BDIm8XJe
         yUUPZnsEkRsWITdjEslVxxZ4w+QapWqxluh+Oautgy70tsKESPE9TT9TdeG/O0vP9RaH
         aYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829121; x=1772433921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=;
        b=S3AnxOYsv5Qd8JL9qMuk4tZ1/woIvbewUJI0oBNx7Kx0oQAm4GvP85CeDAmxMVNBz9
         br6gZT6J8GgId/szlq9yuA7Ge/Tms/MDyYU3ntGlRYT0tWdhyUQUynwEl+GzVdJEjv4r
         8Z8kanrLJFxFm6VT3okznYzKLx07P2uzNrsvKUPSTWlnPOQ5Q6HmCvIkGkw0D/hZKEER
         kAc9ZEErqGEkq3GEAUgwWt4vznpvqjKy1OG1ZCH4c7S05a0Zk32ebFDffkzILxq09tAm
         32UTIAmDYmsfBYk8bFfsuwBTNogayb/thSem/zybu7aCFofpZzn0ld7pse1wEugrGkvi
         yiLg==
X-Forwarded-Encrypted: i=1; AJvYcCVqDssFyyvMLcugIW4QW/TKI6yBEFe1wtt9FinLpQYhNARc+NDLs9F88b/U5Wn6YQePxOnpWxINMA4J7mGvlwVt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8vmnHcj1DEysQ4yzVSxEuqTiJbQzdRdTs3KAd/dli/BzSB48Y
	jA1JnDNn/hkoMBif3xKNPpq8xoG9uJscyXEh0RgHifNmci2Hc5opoqaUAnZaRNlk4sL8ua32/Qq
	UkD7054AHPp/08/b88gw4EHkenLbc6Ijur4VAWVxBqViwjC30Nyu298xcZ7jf/mFNgN8AdZ1CWT
	YCGclwN6MvCD6P
X-Gm-Gg: AZuq6aKQXzNlKH4eLKIUKKKxzQmBO/VucY/KwNVKF7QCwMHtceHdw8drlek2yocj67X
	x083uTWVyjDdIR/eID0lWfEau9MAYVBfqq+WdFuvxSd9xeogGx9yepUT0sEL8u1Pu9v6z6FVqCL
	+gKn7Xd1zNMy7DMsWlxJqJMEyk2RZsQjhLt86iwW6Vz1sC5XuSH665EiiBHWU1Uvu2wvbZLbss7
	OlI5oXq/9S/SYL5Iz0SKOTBccfVnY8gsMNBhQa/wZ+cDYMYyKEnso2jZfo8DXC2t+YOtTINe1QT
	gXpGm/7DKsDCZm3Vf9cDqa/He0LQurkdva6oJ8g8ljnODklK4T+ZB4jO6u5hDt8FgOPtn3DbdGB
	jzRhFtU2hiip/0amm8Ewb7acyzd3mocRv184v2epQHXDTIrIlpp2bIXlYvJ9f1BfVXzN3X+nViT
	mBnnJ0lAYEA2WR
X-Received: by 2002:a05:6a21:a34b:b0:364:33f7:7338 with SMTP id adf61e73a8af0-39545e549f1mr5199014637.8.1771829121496;
        Sun, 22 Feb 2026 22:45:21 -0800 (PST)
X-Received: by 2002:a05:6a21:a34b:b0:364:33f7:7338 with SMTP id adf61e73a8af0-39545e549f1mr5198991637.8.1771829120967;
        Sun, 22 Feb 2026 22:45:20 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:20 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:40 +0800
Subject: [PATCH 4/8] coresight: etr: add a new function to retrieve the
 CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-4-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829096; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=XbEF7lfm+dBjOkALDpKb/LLjuMBdmQi6ikgLxJ96uLY=;
 b=78YAd59lTYgK/tbuk4c/MCEBFv3Qi22W8s2kk+5gInZxrUZ5yMqCCGi8XGwxyb0DJMjyylj4P
 9MW/hrvOYgJARBc0EPCuuyhP5TvWAoEwTmX6QCFeolBXLkqpz9JPvJ9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699bf782 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfXwrg6FkgKIyIg
 h6sLExGRfk6lNOcOvaBweM+J7uZDH4tQj7QcvbRmGzoAmYuZ/HpXbPcHswfsJwWZIBtrSmftAbH
 E1EXYnjUn661O1R+yle/nsIt6PuZAw9iQycX9JkrrH4ktqB0HEpUA00hWyqOoTnWRap0br1pSQk
 0jjiBXglpnsg+T/nibpMVNhCRk3cO7zau9evP2ESZEC7KDKkbRn8SV6hrxGV0JXsTxblUqzRmnv
 ng5zZsdsGRU11WP/JrmlrfUg0BF30/MvVAgxow5RlOv6uObACd80lOTlGtafSsqHJmL6WVnH9uc
 9/i00p9Ig9wh+JmyAtKq3GKFbnneFYZaUze18IBz0p5afPiVtfT/XJdVLiBDLz3kFMJ0Mi2cw9p
 qWysdIyLAUQR1fTkN68WdR2xKLAEvyIfQinxww1miKyawbCSunUfBLpqiSntiMk3Cc3vOgXoeU3
 uvwFugdaJE+2mKXI77A==
X-Proofpoint-ORIG-GUID: XtDgX6fjJByUeUQHWzpuYRfueJ00I5k3
X-Proofpoint-GUID: XtDgX6fjJByUeUQHWzpuYRfueJ00I5k3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_224522_840350_835856C0 
X-CRM114-Status: GOOD (  17.10  )
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
index 081498162011..32353980964a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -867,6 +867,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Retruns	: coresight_device ptr for the CTCU device if a CTCU is found.
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
index 92ffaf771fea..27dd72065c60 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -472,6 +472,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


