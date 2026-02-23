Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7B3E98DEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=; b=W/hTw7E7GCpBLHz575dMIdddbs
	p0zrp2okzEMB9IZh5x7QHZluHz9kPUSl0EmKGUoOrZYYVDCXovNjYg0cq/GiWsJalxmesgfSxJu0i
	NoZ5UnQUe19vViWo8cUwKzeqTXlK0My7ssxptgiDGv9X7CToWuAIg9CFkw0q3MD0xubAaQgawKar/
	6aRELyZvl2AzQ9iFjZPNHD/LxVsZ2xyW9bi49EW9kBhKWRr1sP2Rx/BOQy+cyjohWTue8Cf28zr+V
	mXQZ4o2wOyqduskMpmhfMs6Vqeuv4aq7ZuROrAOjT7D5oS5QQiVpDDytgscqHxBuiVyg9oC3PYWyE
	jMZ49bQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPry-0000000HKYf-1a8z;
	Mon, 23 Feb 2026 06:56:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPrw-0000000HKWv-0v2x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:56:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ME1IU31745021
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=; b=MLpeCV0GwkkbqCzg
	/9uMJU9UKAWnfRDFLHKSrYMO/+s3o3Bf53wfhRYBT/wgrCp43LkAxb1Opk4vofyF
	kBMYVvq+nOaNxQvmuVbB4H8T2nTrAVNPUv66wEgivBxu+GtQ/xYjBewLKQ81VT32
	zjsUCMpE8DFG6m7EPwlCvfVXfG/MDuMFzCgplaOtQD+nNPmubelvKBLFWRgAq/X5
	ba/LrM38ZMN2R7kd/xmeUgUre2UfVF7enGOugwgBhqx5ScCV4q8mQ6GxjeTkEg9m
	sLPCdzdMnvpU23JF8julwpuUwdB7/I06IF5H9brm5hDVm0iYHlW772OFdnY6jL7m
	uvSEaA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vguqb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a77040ede0so48482605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829795; x=1772434595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=;
        b=A4jDNEz1fX3r5ujx7GO3CC2Li6qZrCsIosuRTu7FZOfw8m6AM5+93lIdNpNPQCO1Gr
         LEDMza2iY7f6W6FA0zmbhyYgm+1NUR1zBi3O9CjWPMkiINZl3kuZanZifODbl68SFpPG
         +DWrUqF2Dv5BaiOf1tTOPoLwywR384T723sFar97Og9cV9UvWsEqYpstSPvWfXTmgvFL
         Wiy8u9dnP+4rv7oJjcGbf98vZnGGy94KgOcdspeQoeuz5JWxXsq3wSHUe59IJTTbAPXy
         Vwm63a3wQvQcnBmRHqrzNewXmLdVPexnwnM1fJAfk1Zf2GqJFwXuCj223FXPBHb1FYgg
         3EgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829795; x=1772434595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=;
        b=Eovow3/Z3vbKttbpbVxmqAxyHq0mkxw931AiTjYPKdQ74JA2FRiLS8bfaJZUSyZQlh
         p4jOa6/KEnlhQYDdFwKwGwmbcELefbCVXUtwD+L2pc5HBYZXOXMhAHNHq8jhg6HrI4Pk
         KlG7B5m7hUjvItmwXvk01Xb3MpNqug/FMN64dcOOU79DrtNXbQNsf2RKa3EizBF7ZMsu
         terdWeOdlbNgCIhTXS+jmk3oYtmclfiw9yv4cpvsqYuipTCvzSBKCA3DNMVmzYMrNa6i
         mdAGrE5J7NceWy7/R7WKfpZBU3le2nza0lpPRXxGD3Ly6uziC1fchkrOY0HgIBltW6uH
         +guw==
X-Forwarded-Encrypted: i=1; AJvYcCWkLTXVyeb7Tn44zrDqUlAYvVrHXMARxnPOfi5OJRQKIb8gTyGECYYh/PV4B4fZ+epFCVzQ6IAdlq1pt6GYgcGL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7ElwS6pyeP2QLDdzvMgCcVGedEAStE2Q7air2yTAJIzf28JYp
	jCIOoSo+0vnYQei6wGnHtNc5Y0L9uzHjhWzxoRH303UNRTPA9L/Ke3VSZ9F5pkrAGRftfwi9mE3
	8rLItYrYkJKIoiH3zRkx3utsXVxj+PNpymFL5onrZVcQo1SBovWpzmdMP3A15VwAwgnBoF4HrmK
	pUlg==
X-Gm-Gg: ATEYQzwyZc7hIIzj/uuflZb3wFVvSpIde29Q+ccHMyb5VQACP19dJ7f8v8jM0kSHfaC
	t3HFMldVTY9xSWhF3TpBpwo5ObZdmjZuN35qPFz3iS6wFT1szXnsOPR9lz+XrMxMC3G0O1gP3jv
	ccHVo2j3Cn5L5t5M2UCvfnOlSax7kSm1OgYAhunw9Kyr7yMJ2gW7Q4ikrn3/HCNqcK1Mr/7bI/W
	XyR2Np8qLWaI4yKqkmcky7qt9vBhiKo/CPGsD93cJ0Jteq03/g0EKq3fZQriMcvpMw3KD+y2IXQ
	uxmjwTbqjvhOb2R2vINzDw3Ia1zoT5+T1YoieZ6EJLFaVjeQtwxqHiSFoMpltr0+y7hzvyvFe3+
	bPIGte9L0/F4viaNhjLhbMP/3ZymUK66UCnKn5X2O+2nF/XxpzDHHnIiTwhEPLRGVVm9jDi5ac4
	tR/oN9iDSU3iXu
X-Received: by 2002:a17:902:ea04:b0:2aa:d5e5:b12d with SMTP id d9443c01a7336-2ad744eec7bmr54010915ad.27.1771829794986;
        Sun, 22 Feb 2026 22:56:34 -0800 (PST)
X-Received: by 2002:a17:902:ea04:b0:2aa:d5e5:b12d with SMTP id d9443c01a7336-2ad744eec7bmr54010735ad.27.1771829794512;
        Sun, 22 Feb 2026 22:56:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:33 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:44 +0800
Subject: [PATCH v13 4/8] coresight: etr: add a new function to retrieve the
 CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-4-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829766; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=XbEF7lfm+dBjOkALDpKb/LLjuMBdmQi6ikgLxJ96uLY=;
 b=QJIHdDQoxMLI/29FPVLu0wdWv1rJIOmKOHjVUElhbthI9G7PX5B7KPuwGLB5111xzHa2ft75Y
 TyCCmRN9yxDAGDLW+yMFfP00U/IFyqq2+LFPAEf2aYHWye/yebQipbE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfXxYVjPasnZhJ1
 xq5wNjDzZ+MXfecwV75VM44no1l25AWel+oI8cPiwNL/mVj6yc4zzsomt3XwtAwAw/NuPsFDb1d
 JOOzdZaPSTavZlaWau8Lves1sliNatLTHkpkB+O8wiRfUO3eZDUhSsdXEM1Kv8Tg9ISpc0Hep/5
 /zpaLksqwgRkLAbAft0CF1L51WTciR/zPyUiFfElbffv8hJUPc4GnQdAaBi+EeSJ93JM+pC+S9s
 dOaEzOKbylZWvEnsS5c0ZZ+UyZXrsc0lwDohabS0NrWlFS2vNBjJmWtLOREUK/xzYqShDqiMizi
 4LqnQ21oYD2okarR5iGhSvZ+YZJ08nscNpUgAPuUCvs7pfuU5rHV07j40poCwunkw3XBVp49qnT
 N77p3mL4XuRjFa6RPhoRNJv6UF5dG649XnMWCaBBg3Wwjh5jWq6gQFJ198Sj5Tr+2FTMHy5yJ9b
 AejB3p3XoRfCf6vgSFw==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699bfa23 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vYM8zietDC1JzG5CYid29Uz_coZqPpHS
X-Proofpoint-ORIG-GUID: vYM8zietDC1JzG5CYid29Uz_coZqPpHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_225636_278019_DCDC0BFB 
X-CRM114-Status: GOOD (  16.94  )
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


