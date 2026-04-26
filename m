Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9996FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=krihnreZL0xJWgTHL29szPETUPjlX28ddNP5O5+d8Y8=; b=PkP0yL8+1suFnlU0tgi0RQiJMI
	yFChiOh91PrJ4Zndkf+9EEr+/L0Eh9GEFDvuIxIttYdUPq7/Tok31kcfJhXcFBu+ydOGBBH1pdvrH
	aaialJNRz6ZRmNhOxt0GDyNMEmCZEn7cDHYqllEHelHkZJimlWtdHOeHDUnO78QKUnv1C9cJuhiaa
	V9qez8XiD+bN7n3XJC/rskDL5CvgmiW9+fjG4cOukQGeqqsTwAKRm+2rhXQSsN83m6HJ0mZds8/v3
	jvOOtw/P/XlIk3nW3lXrQT6Xe+8ehVz5z5C0t3zyOWvSK6x2oVOYo1vp9NoyA3PudlEXzD63jizAE
	W4+eM0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwHF-0000000FQU7-3x3f;
	Sun, 26 Apr 2026 09:59:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwHE-0000000FQTk-0ZdR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 09:59:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q5oUbc403993
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=krihnreZL0xJWgTHL29szP
	ETUPjlX28ddNP5O5+d8Y8=; b=UO77lhIohoHMerJN1xGiAQ47meH+EBPmsas/aG
	WhaoZSVYCcIxQnYvh7S2/oi/DihAzhtFXJ6w4ZwTKiLAlfunqC7cdMLpYWNgJkAz
	Rlo8exVopeXoOOfXxGqzt8at6KRqLb3MUjW+g3JkGEW9rCMvQnVa0uPurrYeDvlG
	r+pLeFv5pADulGeMEHOLEKfDEhZPKW3IkuFTz0ZJjfnIHxc19XjIkzDFiutrU8QX
	fq0ZG6TQLs6dKVnbakZNIat3R/7N6kvyr947WUgr2gKuK/ag0ko9zw4JR6gC34I5
	b7SEkGPucAeMLgonkLZskTr3DKisvAPoGom+MHm+SJ+kvdTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgtg17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:59:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bce224720d8so5240794a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777197587; x=1777802387; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krihnreZL0xJWgTHL29szPETUPjlX28ddNP5O5+d8Y8=;
        b=XmD6pDZDfJbSAoAE2xDKE74cQKQiYayA8fIrHUsny+UBgs/ZEPbWZckAS4pEryzGl+
         aZtG0h5Uke4psnK8u+/To8mFTExNELygz5wZg1B7wzekaeQYhwl5A0AtGa1U/zCicWnO
         5ZfWtPBysba2k6pGTNFT2TzLiTm4IFcS6+trbsgLy2gxsbd4fLdFurkOOFd0ArSOC94O
         Xeup/d0Z2iy0lLNGig3Drr1A9R/AzHCld+tyI2SZgFyGIWhJfHeky9Nac/PZTEfrcRgX
         3jEX/B74ilmRo+BtygUrSn61X3a2ZBTcc5LNn/Tkk9uVWo9hCU0pPvVh0e9sr6OC49A+
         ILcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777197587; x=1777802387;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krihnreZL0xJWgTHL29szPETUPjlX28ddNP5O5+d8Y8=;
        b=r5r6oGBjhTuA1xXMowhy+SmflTs8QpKbFp/mPHuYqTCA0MCbwTysLBnYBXfOYVKtVU
         MTQ2X9e9kciC6S8Nyz4W/GqeZBunMDi9RIsmYA0Ss8elcxIH8CrPMictX3HxtI6MRO7N
         KxyYlVKMrSzN380PCx6Y7YF6rqK6a5HFLSNENhmBApsMK/5HKpxru806J+pH1cNN13CN
         a6lJxfChk9+dQwqRJl2Tlu8Sc4nem+M7kAFYd7JFdAMrayIJzfQR22+UBkZM/sNnai6/
         LMEUzS6rL+Y9ONMeCxwmat65o3QevwkHd7jim4ZjIKa3efg0SWbzZKRYCrmsd2JpeMv+
         Zing==
X-Forwarded-Encrypted: i=1; AFNElJ9JK+kTPpfSFeSBnpRw6ytcZdk64iFchlqbK7iIkEkwlGILQjRMfQ2u0hRlLUa7rW2bKgIoBJmk7ULuZqJci8ff@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9wrm9aNXg54dIJM68sAUu9IjxUblnvIrrU+VNxKBMEIAOHczb
	uyZiW62UN4jcktJ5FfF2g8XIM4xGC4vRrFc3DaeRB0L0xjsloRLuI4cdHVpxxWEIn3t4jl7nWBI
	b+riqYwzz9E4HuDZEn2CZI4cl2y3LXqQFju4h13PHpyzOPM4guaMf/ZhCUTH7oB1qYbfCxpDc/3
	TG0A==
X-Gm-Gg: AeBDieuLTxR3Rsvsk6bhAvoagNSrovZzLoeDsx+YkpcHOQPqZeqZRZlL0B96nuAZyxO
	TeDH+l04qH9W5IasUQ8plS4c3aR921kcGfU4cJCfZWTZekmSgHsPFnt7MrWkE7w1koQ/pbgrHVk
	jKWcypnYiMHA8XnAYK/2fNLIP4SsdQaGGavLEaxIUjTpSgo9GIIUmgSUMDmSOp+TvNuAq2C/Wq9
	AdRgi1G03uDUJ6IKxUZQA1OAz3RamrN5bHN/CQQELOgTUQJarLPfsuskhyPAsArkm98IilLXSav
	44XUkixbyjjV5tMkdjK199xwX1vIgL8aOvLYvf2+hrqXDcXiYk0Np9H8Bi6b+MUcfOm4vwpqVMF
	XaS/5cbZmtOtRdd2cZW36UIXc13c+WKKMNOBWobh8v03QGPFWDE/b+ax2ZgFwn4gt/05vZmxM9l
	iwHRWFpfv6eN+x1LK2yGF2sc7g
X-Received: by 2002:a05:6a00:3cca:b0:82f:120:fd6f with SMTP id d2e1a72fcca58-82f8c40ae88mr39403989b3a.0.1777197586849;
        Sun, 26 Apr 2026 02:59:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cca:b0:82f:120:fd6f with SMTP id d2e1a72fcca58-82f8c40ae88mr39403963b3a.0.1777197586342;
        Sun, 26 Apr 2026 02:59:46 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm33173655b3a.58.2026.04.26.02.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:59:46 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Sun, 26 Apr 2026 17:59:34 +0800
Subject: [PATCH] coresight: cti: Fix DT filter signals silently ignored
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-nr_sigs-v1-1-3b9df99dab97@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAXi7WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMz3byi+OLM9GJdIzOLxJQUyxQDy6REJaDqgqLUtMwKsEnRsbW1ACB
 7pYZZAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777197582; l=1459;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=lrlVAl4C9ixfL43ABwEt6iWq42AK8F/Dlk0PYw6KDCk=;
 b=Cfq1xFHRPH+Mzgcz9BYnhcEZW3BBnwiX6yeRvMwi7M6By+QRcip76DyhOiF1M5KzAuFUiuHAl
 jguZlQ8BOAzBl29ck+ML1Nilj35QdV0OtSTeiusKzGnYULsiradrDKp
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Proofpoint-GUID: DaDNJzugp_YWktbVj28xth5NW4iBwgz1
X-Proofpoint-ORIG-GUID: DaDNJzugp_YWktbVj28xth5NW4iBwgz1
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ede213 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4Hfm4KLuBlQu0LOkly8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwNiBTYWx0ZWRfX/6ULpBN6Wl1X
 IqzmJEuBDFXceLgO64TWMN0XLy+8xqGlYY9sOQ8xghHqx6lSjAs8jRxTs4EpeET7+dM5dD+0t/v
 Z4C7w1VsHPLc/7Fs9nC78IREluP3fGgK7zvQI9hZYIrmI4MqIfuKY/+wHNsOFKGZY8E6n9Dmq9f
 AxU9gAVnoV5PII6eohLpkP8qe0FCa3GnVamlakSXLtx28/kfNlkB/YSDdftCuyXybfaz2bwb0cQ
 GGJHWxcU6rwkuXOvjjeOkUytGYZUTbEOAlBMQr9CNkX/ciA71gsdBp/CITcGWDe62c6VJYEbfpT
 JWQD/+G8hgIzrBdfOjBns7y/d4C4XD6Nnyu9MYXLW3bXcFck0lxhVcDNp0YzfFxq6EtTsAPRO+W
 qz4xavHm2OHizG96rfTxD8EZUpovVqW7YY691UYl8H6qOKFDzIR4nkKPBQ/E1qcXGKV4oqeXudx
 N3H67FtWIiCA5DIlRmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604260106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_025948_209046_BA92CE33 
X-CRM114-Status: GOOD (  11.72  )
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

In cti_plat_process_filter_sigs(), after allocating a temporary
cti_trig_grp struct via kzalloc_obj(), the code never assigns tg->nr_sigs
= nr_filter_sigs. Since kzalloc zero-initialises the struct, tg->nr_sigs
remains 0. cti_plat_read_trig_group() guards with:
    if (!tgrp->nr_sigs)
        return 0;

so it returns immediately without reading any signal indices from DT.

Fix by assigning tg->nr_sigs before calling cti_plat_read_trig_group().

Fixes: a5614770ab97 ("coresight: cti: Add device tree support for custom CTI")

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index 4eff96f48594..d6d5388705c3 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -329,6 +329,7 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
 	if (!tg)
 		return -ENOMEM;
 
+	tg->nr_sigs = nr_filter_sigs;
 	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
 	if (!err)
 		drvdata->config.trig_out_filter |= tg->used_mask;

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260426-nr_sigs-268add9d09ba

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


