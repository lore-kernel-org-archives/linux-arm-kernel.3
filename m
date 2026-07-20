Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E3DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqC1UMQqgc8CPLMgHXDTgheCDiJEX3V1C83nXvjGTf4=; b=Yf17FlzufjMxk76eXgr+PTHxKB
	CIGVsXoi8JyykFdL/aS4NDJ9y1IzQDECACJCww/kK8VQVn4oy0FR17CkYwtxNUIF6XvbhEz2GfzAH
	rNkIYCsGTBQvjE0S+vcq5jwoJyy9x2HmTsI+wrFd8t0PatE1gU47r4XgRoQ8jFtlIlZMSLYrvlsL+
	N9T6FhyEi8QLxDPbnMj83NztCebumO+amoIkCEZmbDpqbEZygtNIzfdE0qxGwGbYLsBh9SQXpP7Io
	Na+SXiFXON4gXQzKox3LiJJNK0Ao45p/Qje8b+ROp7fOqRNegbXTN2m19E+I+6JG2sitoBpL6JQtw
	rSZpQwcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltHH-00000007iDq-0UEf;
	Mon, 20 Jul 2026 19:03:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltHC-00000007iBi-28kP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:03:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KH6gKA3299081
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqC1UMQqgc8CPLMgHXDTgheCDiJEX3V1C83nXvjGTf4=; b=Ee9dd5UKiMh0diim
	DZLA45h9K5kuPbDDEtf+J51ane58QBP3HWL0/oz+n87oeSB/JCGVkTRM//6ZjVfS
	WiXIDGH6TO2ga0mV/jP9af2beUDMcy55YtHwlk2ZEEg/t6pIldW7Ll8hLtiLOchh
	CtkhvVmcg9Scd5nPo8QYyona0q1Qv7nlB5ylFz9n86PuAPeno+5MqVo9H4fAmwIm
	ggO/GNKlawhoj7VbkHs5vAm3DJUoQqCsN59naH8MTSO+GuTUGrP0isi9DmlOdMlS
	ZmqvMOuHd10wa76g52bq+5vqLOAmOtt6+mik6c3OS/lVVJ+x8P8Ip7/azmDafAa5
	x/nxTg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxjy5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:03:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so194005041cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784574221; x=1785179021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqC1UMQqgc8CPLMgHXDTgheCDiJEX3V1C83nXvjGTf4=;
        b=ieise4cPDplxTWz/GTY0ZCFK9bDp23EoI8cY/Mnekaip26MRZS5JwiAQf6sn7x2IsY
         qRkBH/Rbgbvk8ay9/EhMkV5kOLZCpmuqFOcdEpGLM8npuU14xa50Vij1rc+454yNDjAA
         Qenc5VX674V4mrhwHOeuOcnO8vg0SUqxEHJs+zl/hj1X3cBvOhIAhLmFTfCEqs4hDM2Y
         BtH3kIzdw4BjpQLHE8Fc86xRwXaNw46JrwjpmxObOmt988T53pxAIoNuWJRnhzwP7K4c
         4DZkEUSp4aNeWJWOfb+gU+xgopybZiIo57yHxWb1FJij3rJ0HwFo59lEFybuai6UNJRW
         J1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784574221; x=1785179021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqC1UMQqgc8CPLMgHXDTgheCDiJEX3V1C83nXvjGTf4=;
        b=NhQNHtIpHX7xWKmrZk7/2yCo8Ewh1VXT01XdJmoABotVAxzxgjIR99BC5WiJm476P/
         EGkPfYw+5lOzWS3hOnOSqv0SmugwpVfZ60+6cBHYp4Yz78NDMiKZjbBtvaHLk+Am6h7F
         5Tq9Dr7aeu/HlN4FczEUUTmMUj9DIzprtySN+B4gaPyBoI4yRgVDer8kAm3ihLWBgyIp
         HvURj0O+YWgb46CSNBl3whNTsdzrBtHoEsZ2k93e4oWL4trBEYfTDgAMXiovgQC0sllJ
         6oxj1WOaHe0gPm1t7I/yxHWR6OejgcG+rNRbvniTEZriOyYxIHB+3WJQbY9Af506Fub9
         YVOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzCpFgb4ZD9Er5HYIvs4SX7Hnx4V8GKGkN2s/Li+NXt9rDgnJ0ZhEkHjkr+rgVQW40ng6AIVL5vcxxDufMWkiA@lists.infradead.org
X-Gm-Message-State: AOJu0YwdKMcihWvuH06yP2yLpdxvO1WcGUZE0dCgH+lY+3ypg/12w5wY
	rNPh9997jhSC8UP82VRoQ0Gx3srrZgUKcnQiuEBTv9VAXojePQCoFQ1k9vnfCkRKO1XDohi0zeh
	lni1BG2Yhw/c1HpLvekqYoI41ZIq3vpHp8S3sAYjwpduOXnMTl5E5sTuYFui3ntKG3aoEOFsb3x
	ZELLODlF1+AQ==
X-Gm-Gg: AfdE7ckJquib4HzGPof0hf4E68jMhZ7HMpVVTG5IC3pYfDfOhTMon1/yC5pJ1EsCpt5
	W9T7F3bKR7dMh+AfnN3s3F6eexGwYFAvxQbUicvZHNHFppYKd7zYWnbnK3A37g1KAiLugeMoBYG
	G+DZgRH7vduRbl49012x8vIkybvpbqrhWKxfH3Yxymoq6AGUp980FKc9PBkfHyefiMTWuo20vs3
	bDTNbUJ2W9KEcubyp4Mwj8+xILKWofD/8GdW88zP+eLFg/jakwEsQxioFFLNQUcnUbalxaObD6k
	E82ONuqsEOI+9RW1vQbDZh/yK/MwRLbGlFrkSCdIzOKotNXIO2vamlptIgVzIcO1sDGx9PLScQk
	vjdA4kcngQ2GQNiUk/c6m48vU
X-Received: by 2002:a05:622a:1e93:b0:51c:c7:80a9 with SMTP id d75a77b69052e-5213e67fccbmr148137491cf.72.1784574221162;
        Mon, 20 Jul 2026 12:03:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1e93:b0:51c:c7:80a9 with SMTP id d75a77b69052e-5213e67fccbmr148135381cf.72.1784574220301;
        Mon, 20 Jul 2026 12:03:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954aa1a231sm181509845e9.1.2026.07.20.12.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:03:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:03:28 +0200
Subject: [PATCH v3 2/3] interconnect: qcom: Add missing depends to Hawi,
 Maili, Nord and Shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-interconnect-qcom-clean-arm64-v3-2-942e8ee7ebda@oss.qualcomm.com>
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JR4Ua1kfTiV8QNLHWvAaewWDC4h+Q/DLdnHAzgTqOfo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXnEEgrUOpRMy9halmAy6cWzO5c61ytP877DCz
 dFFWF6H9S+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal5xBAAKCRDBN2bmhouD
 16vbD/oDIiFjy/YVbi5bMN/w9FKQXVNTxdv7WkDt0g6ecjSOdiVJB1Q/u/hb80Y/+st/ZN94tht
 yu/YpdtDOG4+mp98S2EEgwW2RoXI89aPbQ15TywWiM391daJ8s+eFzdpU8VlOuhTOGkSLld5wtR
 uoDYCtD3ltFMZQdd6QjqkOMDCUslEm85Ld7mdRgyazzw8HF6SXDNFtm1qtYoJaFTEm/ZzWowk+a
 xP2cFso6cQDU7meApg2OG6DHbVgkIRblJiSsbbZX6ISBZgUOZmC8/PxWtjoSRsrnx9hBUMt3SSK
 hkM7+rCitFrS1MPL0FWOZXsZELw6yR0O3+UpeXP/tBYjtSjwhAlkfxYmbmxp3oazpo/iyq0gQAz
 tdfdeTaV8IwoMNenpNfUdxZb4Bo1mY5ew+fFwcWRgSQjbRRUYjJGaA4FWNryXJVuKJN6nOYRGfu
 1Z9Abj+BGE1+IhWj0D6NfJMRIaQV8aEKhDLjNy8xYcthJQqOH42mvUvOESsY8gM3MD7VVJvUsjO
 V6NeJfyEvcwzLL3nLUEhtgOSBPWnOnIrNj1K6pe8TS5O4A7kCk4zS3xea11QlIl9lfnxVC+1yP2
 YlAkK28cDTmhBamhny00xbykKyZ+kzGIces+YyZ1oA1TwcQUotmMYNiaUbpQEzj8qQcWGuCnIVs
 hnr/c755Q/Y8oWQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e710e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=H0ku5XqlSbOf5Hpt4WgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfXwoliYp/tjvvD
 tUIj471ZmdjACRicALRhj1MP6Z3sgV1vDhUkGaoJ8v38Jw8p7yyuM23j2v6fjNRE9rSwqOUvuFu
 w7N5SYA5vTDsf5qHmxwkHo/3txxDk7o=
X-Proofpoint-GUID: NJGKEHl8w7a3t63vU31mf1jBAxN9lQiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfX56UwJ60PLMUO
 KpiUFc49h8a4iFAeX7DhpHhbFdnROySTI4EyVbAK+ijNI3/zdVZ/B/T2JClefZUWZ0jWOC6nLAR
 2Y9s7QPx0nL84Pk0AdEUW1JE6FgqDh/f7YAcgxLv8C5aMYKQ93BxprLid0532jy8aUbNLhdyhuZ
 ue4dLwtPzWJ1H3ngc3eqo9/OYi2qPZNO2iJMuKYOmn8/MXgh674qE0OqGRoE0dKWGL0mw9eEcUQ
 +1/Ss9+4wyK+R44n/m1KXDXFn2F7aJorYnvjpJZJyd88soXTbPxh4L0T8wD8J/R750944DEL7IJ
 2v5goNsNSJy1fWiKLJ6IB92RGpnwMGHvCbgFE+FkZcvtj/8TNoP3uc4Y/fUEKkyh4JT7z7Ot4E2
 y/c51fW/cZHfK3fFtXNNrUD60Mh2AAK5HrHyz5LRgJ3EGbHCd2LOqiDjqHal2CZpZCzkggsaoh9
 ZTJC6KI7ZlhhhJaZNlQ==
X-Proofpoint-ORIG-GUID: NJGKEHl8w7a3t63vU31mf1jBAxN9lQiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_120342_562283_C2FB7349 
X-CRM114-Status: GOOD (  12.97  )
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

Hawi, Maili, Nord and Shikra were added in parallel or after
commit 5b696f065843 ("interconnect: qcom: Restrict drivers per
ARM/ARM64"), thus they missed the update restricting them per
architecture (with the same rationale).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index dd8774d84321..6bc2038de28a 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -34,6 +34,7 @@ config INTERCONNECT_QCOM_GLYMUR
 config INTERCONNECT_QCOM_HAWI
 	tristate "Qualcomm HAWI interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	default ARCH_QCOM
@@ -55,6 +56,7 @@ config INTERCONNECT_QCOM_KAANAPALI
 config INTERCONNECT_QCOM_MAILI
 	tristate "Qualcomm MAILI interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	default ARCH_QCOM
@@ -146,6 +148,7 @@ config INTERCONNECT_QCOM_MSM8996
 config INTERCONNECT_QCOM_NORD
 	tristate "Qualcomm Nord interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	default ARCH_QCOM
@@ -370,6 +373,7 @@ config INTERCONNECT_QCOM_SHIKRA
 	tristate "Qualcomm SHIKRA interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	select INTERCONNECT_QCOM_SMD_RPM
 	help

-- 
2.53.0


