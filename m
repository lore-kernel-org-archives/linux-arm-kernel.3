Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F0510BA426
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 06:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4WmFLueZYS0a3wB4nczo3aWMb2IWa+xZtBDLx0JA+O4=; b=lWqjO/wjcORc1pS8OAnIP6w6Sl
	HpnW87L698ICHeckGvwst/qufhqy2VoQOvgif4s6zc83cIbInmuICfxT8uD2v8mrQz4B3sYf15BoT
	XB/JyfjJ2Nox4bsT0uAzaN7iIJQ/lBt4LSNrta/Cg5nmwlUyMN9Rn1RwzjlqxXQtDL52LsZOzmv17
	22KIdNvbtiwYgL7NRX2YapS3RGZ3J9eJ5boYVTPJ0eOkZd7liGDGWwT+yTGx0n4eOBOGTqR6uCwGQ
	lf8GqtlmACFUoQ9XceA2zi8kF+GAYA103VzEAr5re5Qen5k//JNbDKt0pJHnsEolOZyIz+kLAnbjJ
	+X9QV+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60ce-00000006ouH-3odw;
	Fri, 27 Mar 2026 06:24:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60cb-00000006otO-3ksb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 06:24:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R2egD33142288
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 06:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4WmFLueZYS0a3wB4nczo3a
	WMb2IWa+xZtBDLx0JA+O4=; b=oGXPYfRWHq4MZiFOg8ODVArFxSTAlV7B+UcoCJ
	6JxkPo6AecwumTkMgYYRL7tgJeBL2Y6+ICxz5qUKGzg3GuCUDk+dtl29HPxh9+3m
	011tzU1cBCUSXLoUixSbSaKWw6sMrlp8cW3r3VxBYvwjI9+03lpsozGcZsnYewnf
	1Kg4wdXKXY2+E6w2cbNfRwpRi5flOlUdGFxvQSlv3AxL++zmNqziVEvEFyWN/tP3
	J7ajc83FR/91qon6YQWVWRTvxL+v3mP2xZpfSuPzYvs0XHvBABWgrqYbZbkkPALN
	GWR9mpvDx2RRF382hnsiKaN6vZ+AplPaNSKynPzZTFVHFY2w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5haprr5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 06:24:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso2523463a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 23:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774592681; x=1775197481; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4WmFLueZYS0a3wB4nczo3aWMb2IWa+xZtBDLx0JA+O4=;
        b=i9hvLR2u/rrVgb5PUFSPZB9WVDqiyBO6k0NTh8gp/KsUrsiJPddW6Lp4TlN4r1r4HU
         YVHi8v4nozdo7axGPzHTNNnikGVTNJzZQg0jhcTM4R8vbq6dT30OESYjNSZKmfpP1U0b
         p6KnP/ZEZvmlVDoiLfw1QWjjp/5vkzwgcI9ohXl+KwFTKWQSgG4ZYYNPrxMl5+KTtFlV
         7BJNx4cnalJnNfqn5gsgKvkvor4WcTqiykJvHBvht5+C3uF5BlKzBrabDQmhCtC3293A
         MgG+IAx8VhLZ3ILIPoFj0VpDX8CZT/KN7fOraX/uf/uapsnxxuF7Wd7YL6mBvZ+w4XuU
         eVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774592681; x=1775197481;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WmFLueZYS0a3wB4nczo3aWMb2IWa+xZtBDLx0JA+O4=;
        b=C61uM22MMtOCgDLry6p2tNDomBXWG4fuqj9Nx0u/jx+/s7hNZJUtvXQX8xAOyjQY50
         Hk6vf6t7pLg+UvI4TRabuQIb3Gg0Ud3BXubCzEktKyUPWYQgFjbOi/EXfqsdPREox0Qx
         qgR4UeVyDPigiax0Pfq/lw4cTFoMPL0HHV8DYz9UU9/MLwlBlvCipKBatT/v139neizY
         upkzUI75g67jPN1TlepNoIrZ709Q0KU4siErW77dzFbCDCn4LpFnw5BI+zt8TUvjWu9q
         2YzVabfLugByOZQN/A8CRqBBXi8+0vcRknppDrymLZiBIEEbW1QghS/vGY/B9Z71x0q8
         jCAw==
X-Forwarded-Encrypted: i=1; AJvYcCUlJ1+JFVh4ll1quHv0D3b15EJFByK8yTdl11SPYFJsnXiZ+7Zb6nE9bMxjxuK4nXLC7xDrfRpdDxGKbba0bmJM@lists.infradead.org
X-Gm-Message-State: AOJu0YyW/ECt0TZiWe5S0z8y/Q+yds323kuCu+FKyQUon69M0wq9Ya/E
	aPvw4Ao5gPW6wNHwn/MEM8Gh9s7RhKMiCjuWRK8YbSKirAfdOJdf0lEhZqGU5ApsGwhVAT/Pxs0
	o5Gketcv0eZMW9TBl6tHcRuoMNR0mcD2Vx+4jjsIsyLXp38pwAmEF/FBfiwKjrfH2j4C/3nW0ka
	AoLg==
X-Gm-Gg: ATEYQzxTZkyaYz3B2UvDAfswk8VkIKw7woxPkp7d6PU6BDE6DH6UkuLrXgU/nMM0GG1
	PHQjMpmk9fRsQx8+wiAEu9nGRe+WF2HW/nZ1KfWHN33ZwKdLTGKws1krd2xfIZZMfKfEpUCuQjU
	xI1z3119WTZqGacIB9kdZ4+oMyFBaDfahwqK2JngFxUifFnUSo5IWXOntTaVJBJMJyzUqHUOkXq
	JZ+BsnJa/bn8dH5JGLY//SsF+iWuCqYQbN/0K6j5pA/eBx1Q9JHRIQ1heLs8SCfoP0KNPwadtZx
	Qf+bxlXrF5LgMAzKcm4BO5DbWcioYqxwterkPiLtM5gUD8qe/wXb+z215AFbY2eHamu5CAaZiFA
	Y12Tk3q0V0oQlHiZyS2WUKJSraV6scqu6WSWFDC7DENXljSIaQptMmLXYgntqIAAjnQYS86K60E
	6UqYa71+76
X-Received: by 2002:a17:90b:3dcf:b0:359:1821:b4d5 with SMTP id 98e67ed59e1d1-35c2ffafff3mr1434436a91.5.1774592680661;
        Thu, 26 Mar 2026 23:24:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3dcf:b0:359:1821:b4d5 with SMTP id 98e67ed59e1d1-35c2ffafff3mr1434380a91.5.1774592679698;
        Thu, 26 Mar 2026 23:24:39 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a81744sm3722286a91.5.2026.03.26.23.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 23:24:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:24:14 +0800
Subject: [PATCH] coresight: cti: fix the check condition in inout_sel_store
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-fix-cti-issue-v1-1-2c8921e21fc8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI4ixmkC/x2MQQqAIBAAvyJ7bsG0FPpKdJDcai8WbkUQ/j3pO
 DAzLwhlJoFBvZDpZuE9VWgbBfMW0krIsTIYbZy2xuPCD84nI4tchDbG0FPnrFs81ObIVIX/N06
 lfA9OaO1fAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774592676; l=1343;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PHLgFLCWkaQZgK2oamDHEceLvZuYDINcKa5e6t1/okI=;
 b=RfkCfonJCGjf541GPmnu3znQaLRzKPdcsp1Q8oKE7wGMlvLKWPqembbAfpTme3oZFPi9aSJKG
 Pljv/N5YcciAdW9o1ANQvNnBriac0NyZTcXSnMsV50dZoebBwDGRend
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c622a9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Wt3R2UjphL3Wk0r5Cq0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA0NiBTYWx0ZWRfX9Zx9woMMjpJo
 nNEjCR1MHzqeHCus2XtLsiXdTczKxz0URs8VbElshJgE9iNsI9N/40NMbW3QKm53F3Y3wowVcjb
 h2lWEn+AnEIWuHyXPQcKmUzD4L8cCmJNziSrvR/qNJj2InSudJepCCRqMaw1dD4+hM93EfBMaoA
 6xui79KzqtL3ribciGrRRFMtV2nXQVbSF0z+zBNaniFNmygqjXje9cUdPI5At9YREIE58xj/asF
 RcdsMEt1cl87/g770nz792XxDN8lSLs3/ovh18dj0P1P5lmQgLRRZkpCPizl0vbBkWSEULUP6wc
 qlg/VTB8W1ANCmWdt7L6sTkN9mTrUgksgHaafmIbgJjE6rTVh2dzG08crpP/qn7YbUC7LEbOEQH
 cQPee0+2i2vigME5zc/9sE3mHvqgZOmi98PPC3k0bgGQF9UpHiUnrmqZOniXTmki7pfilvQKt3n
 2Hg+JFeO1nViyjhngGQ==
X-Proofpoint-GUID: ACspJ7NAjJm-ZGv_cOLwGEY4Iu3d2rEV
X-Proofpoint-ORIG-GUID: ACspJ7NAjJm-ZGv_cOLwGEY4Iu3d2rEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_232442_000899_44A9AEFD 
X-CRM114-Status: GOOD (  14.27  )
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

Correct the upper bound from CTIINOUTEN_MAX to config->nr_trig_max,
since nr_trig_max varies across CTI devices. An out-of-bounds issue
occurs when a value greater than config->nr_trig_max is provided,
leading to unexpected errors.

Fixes: b5213376c240 ("coresight: cti: Add sysfs access to program function registers")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 4c0a60840efb..bf3c73607c1c 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -337,10 +337,11 @@ static ssize_t inout_sel_store(struct device *dev,
 {
 	unsigned long val;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_config *config = &drvdata->config;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
-	if (val > (CTIINOUTEN_MAX - 1))
+	if (val >= config->nr_trig_max)
 		return -EINVAL;
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-fix-cti-issue-3dda5e4636f7

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


