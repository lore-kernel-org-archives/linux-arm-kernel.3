Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB24CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ntjK0000JxML8T0CJ9N/J2iPUwrgd3ulvER+ZPDg9A=; b=jqdGDAKwRVACG6UbV6DvS8V+Bk
	o5j4zpiUEtEnrTUETIm4vRTq0zpERNpOcX8WyS2chdNNAcmQZlFmf39zSTlgkfGWUOV7jnayC4iVo
	QrgbLdZzo8zL6jBgCz8GAnqivdbaRLwk9ooML4T6N7LPwfur3LoxUR7zk+HsptnLb81nlpL9R+Hxf
	k+cMA76FM/hGQVNJkvJQ1Veu8KPYd6j/Ng2jG5kJAOkX27cRmgu3fMXP3TaNCn4MsqtFvyrJvphxi
	3vdlpQdjdO+cgiDrMK2u0G/mDXqmJmyxTRRc83oD5bXmI7BouIWX7x48q0FRXpzdBBOyuQwXKHhAe
	gTGP5bzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZm-00000005Z1j-1Rve;
	Sat, 06 Sep 2025 00:14:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugFH-00000005NAL-3IEl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 23:53:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585HkN2Z014923
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Sep 2025 23:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9ntjK0000JxML8T0CJ9N/J
	2iPUwrgd3ulvER+ZPDg9A=; b=MIj6edrGuFKiPnFwSdcROUHqHFrXNBnPyFZcUJ
	YYU8zEaaT1PVFQn3YfwtAo5v7y9NVv1QbW2Ug68vl/Fdqz055Fj+P+NVX8F1wK9f
	uJyDhcOMEfuDuac7D/6hMWcr7Mfs6awxT/GdlwNat91fQ/D2DMpWhY7FV+zlkSOX
	0rzujJmoHH7pNwbIhBqfEE7QaqdEu8CLC1c92XUrQvrjrknTrrWm/u7Cnhd894tT
	yZetz38p8dQ6479snc9BBIBmthyXfg7lya/IIQWzxeeMMqFP1IeDfgdu53pZrOBe
	KmNiKcuMU9cfBB8GiBM5CHGzM0cB+U0pxwZ/lkIybRl2IVqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush3cpfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 23:53:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581953b8so29908355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 16:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757116409; x=1757721209;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ntjK0000JxML8T0CJ9N/J2iPUwrgd3ulvER+ZPDg9A=;
        b=VEk4J/fGAphUNMLi4lA+SE2hHJW1xRXUeBa51P9AZ+vupoLQ5nr5pBpj6XaopR90Zp
         EWJa5eb4x8a+/f3NMYCC+aMge7WmLu4DF7Ip1qotrwyFKOl/PHCKBLAsTbs9JfXYSE28
         vSUOsO0SrRROTVCBfkc9NxYSm8LZ+KktbZ7EI+wWv9P6c566nJbiqIh6cYXGgwjVHfOD
         6brqDr4+iQ7WRY5VwvX0kevbsKjHyBwdpD40Nh/Ql4UrDv7/XQKuxxgzZsXyYaiWqQxy
         NEdL5VxIdKjGqt88mEMQSwU5Pyrr/Qr+8cH+NAUZseSrSjKbe8Es44JmcWcJdQP8AoPK
         d9yg==
X-Forwarded-Encrypted: i=1; AJvYcCXAW8ZjsMg7986Od1sQKrsWQwntjEBVTqeQ0joY7oRxSTel8liIuMhaXVNKEXxOYznf+9Njnmlvvkggw34iCMeB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2yqYw6d0ikFQXZBXwwAUMsAIGt0s7hb5QfDNz4gGzcWk9iGuy
	DGxnbM9MDauyQVm+h2D+/iRdtqm0i0a7Lv3SqvLT4DD/e+6QiEIHh0PAQt5Ps38qvIZZ9RK8JJa
	PPV03qnWGncsUv4dn2gwbI8x24g4c0cZMKSXsaMKrOTPwOvmq/5/wFxRLCytHhjzBLKP2yemgwn
	+S9Q==
X-Gm-Gg: ASbGnctVMzz5zQJ9oiM8mOYBPQZbB16aP+ddL3k8/yXTTyYneFzTTMacVS5dFmNFerM
	48Z1wxoniNyOwNYznMtKh6GDbqWZ75dyYQRS8TppcWH/5gX9jujw+1c3QQjUbOfQ0ny5UPD1ygP
	b3VwYJWGdh2m25VHi6kG19D5FLQR1geSw1AEBUWogdRurQysC0Vzf6izs2/qJJjYyr/aUcOogNy
	sXsWCibwZ6WS8K6/j4w4ZZn6eZtRxIFUiV8I7cdpes4bDV4U2k7SZ0vVFq8Tmuew7zOJ/j6+Fu1
	Aexy8suE5IW1kWncmLU8Bk7+cPLykf5eTOqyzqjtzvBfkHgyg3rk7U6c1CeyrS9gTrMXtmy94Tl
	sESQbbmxnjknBeIYjKhxGMrIBUoY=
X-Received: by 2002:a17:903:22c7:b0:24e:47ea:951e with SMTP id d9443c01a7336-2516fdc9797mr5867025ad.19.1757116409282;
        Fri, 05 Sep 2025 16:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8QUpGniq1OUMLLIgaeWGxmpKOQZNOr5ydhxok8F8J8LWqbW8BLwCURfP79S7LrHEK9DsS9w==
X-Received: by 2002:a17:903:22c7:b0:24e:47ea:951e with SMTP id d9443c01a7336-2516fdc9797mr5866655ad.19.1757116408785;
        Fri, 05 Sep 2025 16:53:28 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b2570cfc8sm102015245ad.76.2025.09.05.16.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 16:53:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Sat, 06 Sep 2025 07:53:04 +0800
Subject: [PATCH v2] coresight: tpda: fix the logic to setup the element
 size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-fix_element_size_issue-v2-1-dbb0ac2541a9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOB3u2gC/x2MXQqDMBAGryL7bGAN/tReRSSIfupCTUtWRRTv3
 uDjwMxcpAgCpXdyUcAuKl8fwaYJ9XPnJxgZIpNlW3DNpRnlcPhggV+dygknqhsMqpz5Vdo6Gzu
 K8S8gms+4ae/7D0GOwF9oAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757116405; l=1920;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=QqdQLIajWoiM08KJ43uCFk6GXl5SlPD6hgGGW00Hh34=;
 b=5Ad5QfoQp2FDsdLvjG/YA5o8B8oW2b70yf175ycH3GNbzdR5c/Gmgz442CiNcw0KfK6Mlhg5a
 amBabxrvU3BBE1OG5yVI9LqInzQUDK3CXL8qPxh5aQK0/LSwcdBACJq
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXwTjSaJw+rycP
 p7gogh9wkqb23PVpCqlZom67boZKaYoU18/lTw9IvI3iNYw9lLuyrPxqTAaih4k5SbB3os/trCr
 LZiIsM8bczjs37yd6lO54hYOeS5KxFsGa2ZKyDoQbrSss0HRxUwwGX7uk6AGkkeAkfYTwOEaovq
 jB3TCuiXnCH6j1O1ewJORSpYDyG499+tSR9oylY56zCs0tjsCiORGMwGPg2/HzDna7cUkPU1n9I
 zeVIXucbrklIsQypdJ1PkO6WHEcQc1K+UGRGZ8GPuBl8tL+ghXzVG1Bl9er8I4VB3HqROEXMHG/
 ieVScsacNmyowcCdT3YNH/VArVK9m5AWFgCJuFur1lYXJb2p2CJONieozuG4OqrFIRp5xaH8usX
 IAkayZLs
X-Proofpoint-ORIG-GUID: faybUmARUX0Le7aQSDkaTiBlupJUGfX7
X-Proofpoint-GUID: faybUmARUX0Le7aQSDkaTiBlupJUGfX7
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68bb77fa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=eYArMgjR2MFx1z2CNlUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_165331_845963_04D91C5E 
X-CRM114-Status: GOOD (  15.69  )
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

Some TPDM devices support both CMB and DSB datasets, requiring
the system to enable the port with both corresponding element sizes.

Currently, the logic treats tpdm_read_element_size as successful if
the CMB element size is retrieved correctly, regardless of whether
the DSB element size is obtained. This behavior causes issues
when parsing data from TPDM devices that depend on both element sizes.

To address this, the function should explicitly fail if the DSB
element size cannot be read correctly.

Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB element")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in V2:
1. rebased the patch.
2. Add James's reviewed-by tag.
Link to V1 - https://lore.kernel.org/all/20250806080931.14322-1-jie.gan@oss.qualcomm.com/
---
 drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 0633f04beb24..333b3cb23685 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 	if (tpdm_data->dsb) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,dsb-element-bits", &drvdata->dsb_esize);
+		if (rc)
+			goto out;
 	}
 
 	if (tpdm_data->cmb) {
@@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 				"qcom,cmb-element-bits", &drvdata->cmb_esize);
 	}
 
+out:
 	if (rc)
 		dev_warn_once(&csdev->dev,
 			"Failed to read TPDM Element size: %d\n", rc);

---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250906-fix_element_size_issue-e740086291fa

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


