Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177F7C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UhySC20aaKpea70C2ITeoegyCZL/GiY9pXOTngPg0iA=; b=WD/fT2GfiB98BHS0xZwHQG9FGI
	4puL4RbzBAdtAqCf7IFlYlY6kws8ZDc2nvDoQNpXrB2FEhySdrvTNImKbHNkfSzuSaNL3s/Xfl+Wg
	h6t8a08AeVgu9sEh7g3RzWPg1shUbBeIWIfLPbJLS4omj3nk35pE52aREo2iGQ+46q0e794pv6es3
	2SCrCo/qLcsGfZ2oqhDUeb6VvrnRfNkLQGRPTTMoNaBihdtvX8/76pLRNJKqR/F4ZpnpOELabem4J
	ZMO0N1xTxEEjPlYguWUtnb95MFR+6gkKLueY7RjKZ/SykzCuxEQLliddQ2aIb3N2VZi3UEPRVlKeS
	kaztW1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hTm-0000000EFQl-40BE;
	Wed, 02 Sep 2026 09:42:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hTk-0000000EFQ4-1J4E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 09:42:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NC73974990
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 09:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UhySC20aaKpea70C2ITeoe
	gyCZL/GiY9pXOTngPg0iA=; b=O9j24EWOVYLlHwfBNUJlJ0ibOCvuU5sPy0Erti
	IZ1u/9YY4nmDwMn4nY0+njwBuVDV9v5cXdZICobEWQe5ik37o51WUkBTeqixifF3
	W0q7VNj+Et9TcFaAf79ZSgao1won5VpQ4eu0uVVpjLQyA59lJO9aUuB1VWpOo2JE
	DU9pKCa0OErkIgrAi2j2le6ERnD10Pf1O57PNz7M+iYHNllII7pYRebqZZoZxPnh
	X2fVi34ZkrUlfRccO6k1aSCZaa4PPi4ozHg1zOWdtSoHeCKXY5s6Es4tnZAp9al4
	WrXG7TqXQdjlDtKv7eH8I+zIfVqeM8P+Fcq3fv/LgZG6NE9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435tyd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:41:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1207886a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 02:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788342118; x=1788946918; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UhySC20aaKpea70C2ITeoegyCZL/GiY9pXOTngPg0iA=;
        b=UbhJ9Ght50uaQRhGgiUtA795dt1+VWd9bZiwl1PzkG/q9HGHiGNyVkI2/y4Xft33I0
         OGjF1uw6asW5IYJ/uten5ZLmqpHZ6BKJ9LwRWwhtADZt1ruNf5vQdVyKCUeI+L+KKhbb
         fVunCOFvsSkrS6Yc62MFNWbUXAwr/D3r9q/BC2VeR1jZKZB9x6dj28dOEhbppvAVgPTN
         sORuYV3pcL3JDQR45yZIJD+GoLG4Z58J3GITFIGpRopgUqt68aDEQZou+R4sEqrXK8Z+
         /kydJ0wTGG/NitJ6DqsWkY0cJeSqK4Skd6HEjWuuvRruSVO2x3TmkOd61jWrAVVvlVGI
         Fkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788342118; x=1788946918;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UhySC20aaKpea70C2ITeoegyCZL/GiY9pXOTngPg0iA=;
        b=fq9FhPkbo3JLZ5swclyTZ920MhjKy07QsCNAy+5ZYdPV+D+jlEduNOvVfvWsSJjwvj
         ynlqZ9EgtQn+fGsTaX4tQsN4NjFgZK2c1ZRNJndqJif872pag6fZusns5lvFL1O+xQ4T
         rIheAq2xphxzD5EMPC2EyrbB90hc2a3lPUToFFoznMTLr0GdfiVRqVNv+ZzuYa6EfC4j
         5Z9uEV3GqTK+4+WF99R2KIl6oWzvbOQyEsUXrgyYM9kB4HKprkbIBTobs/ccRghgx+dM
         nPHXpb13jlHif2YA9fA0xdm3Dsf62fpOKWsspT1DbLwkcPuR3DtsblKx2d+rkvijirKM
         rBhw==
X-Forwarded-Encrypted: i=1; AKwUvBwx2oTDgf878FgHffvbGvSAi5NvY7Am20NzMPyCs5YA70buf9UxotSW0VvKeTeoFKNin6UbF01voaq5Qi6Hn57q@lists.infradead.org
X-Gm-Message-State: AFuF++lIVqM8qGovJILUaw8lKMTB6NHc7/AjFdGx611tZoN1kWwHbFsw
	QRxieHW9PmyVwBCRwz15LMTI7qToN+Y9CsSM9jV6v9XUEAJ2/0hRZG/QYGOCNED56c038yV8DRB
	pf/MlIDW4E9CXQp1t8znYKhMNpBBamqeWkHFZXjlUVeabbIhKyAu2sjpk0K1jC+4dqhULDdS216
	XgXA==
X-Gm-Gg: AYBFou1vhMbDDEZEhn9xwFOrgeQbyUwBLq3//M3B0JS08YC8g9G2asbT2FGLzLTI3J4
	aplvW5/ySM9a6KSJ7+IYyQq6Qo5iKHlR8Zypp/wE3xMCeqxj9XWLO9Y+mUc2YvEMt1WNuxcjKtX
	VzDy9NuHvZnXEzvdEbcqpsdjevdHWVsAdHOpBa1eD1DgnTdl2Zl3+2Xlvx9i/rhwMA0hAD3u10q
	Q+NAQ0lTHwfX+wXyHlxAlSa6o95nsRwqUrU5EGp8GJ48MTNW7pGxEWG5eZUwHqC+FQSjnN1LwQ/
	yqHvIM84e14e70oqdmbsbRHSxwjBGYEzf0NBsGtjxInhDaxcLwGs356niaBEjqxl9GuG7ftUy35
	JREiDhdroPSUwg+XwmIoOOw8KbQOquAEc5YWbfMB4xioAVaJMrsPk22q9a7VdDOw=
X-Received: by 2002:a17:90b:52c8:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39aee125891mr4691892a91.20.1788342118229;
        Wed, 02 Sep 2026 02:41:58 -0700 (PDT)
X-Received: by 2002:a17:90b:52c8:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39aee125891mr4691836a91.20.1788342117774;
        Wed, 02 Sep 2026 02:41:57 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d802787sm12536944a91.16.2026.09.02.02.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:41:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 17:41:43 +0800
Subject: [PATCH v2] coresight: tnoc: fix trace ID path assignment failure
 on non-AMBA tnoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFfvl2oC/x2NwQrCMBBEf6Xs2YWwQqj+ingIydjuJZFJKULpv
 xs9PoY375AOOrrcp0OI3bu3OsAuk+Q11QXqZbBYsBhuwfTlH92Y8m9QkI3qVbfashb6DipKmme
 ka4jRZPy8iSH9G4/neX4BFTNmAHMAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788342114; l=2527;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=8T1unBlwrMViH0pWbrFKcGsFOZw03mrL6OQHmaqAzSU=;
 b=VhxAgktyaW1KIW5s0SnePcqNAoV3emSqk9S8gHeanO7UITnzBhl3UnklcH7X8JzN9DkaR14S4
 K4lAy5yrI9yDae3YL/YT4HNaS1hP5syGGxFwqs0lqKoPhWakkv3yOjM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfX2OmHN8YWJ9tK
 9STVDKCZg87CqD4FLvaxb++gIfSq6XW5/tl3sGh+1jU29Vn+3wuRst3zouuAPgaTxLhrt/tXa9A
 Unes+DlswhH+JHlPLRNaGbI/8SbmN14Tb0cDgOxjm0jeHh5OlEBdlqq/jRmSQjFnDeCTZWv3oo1
 BN8UtmLqH2w3pZ1d79CZ+vjxHg+gL4G4oqaHGhsfZ9A+UsctINP23SPV+sAAnca84ZS4+Eb5U/3
 xc1fLn2dbJOd5It2nCxhpN2pz6G2IPExwpQLBYU68Qg983izx8yK8mMjA7Yzi952APo5vGd+ow+
 fwZ82H9Lb3MKz0dJjZbip3E6uF6VdrBAGSLsuevnpdDr3kA0KaF/VFuOlZ0y+3qFqriU1L5M+aM
 8C+584HRwCbPQD+NBaJ8E4Fej2pGI6J4fvjH8TuGdkGnbrFhfJoxLk8vPlpiDZN+lMWHHX2aI6M
 YYmFM0+nUD7/SO4J+kA==
X-Proofpoint-GUID: 8tTVYmlMvVr6_Fd0CSAbQCo_ycBxH0GY
X-Proofpoint-ORIG-GUID: 8tTVYmlMvVr6_Fd0CSAbQCo_ycBxH0GY
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97ef67 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AaQHQxIyCImLPoTtUlcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4NSBTYWx0ZWRfX8Saf/yzli67X
 Xd7O0T8mgOtlHqlVAlu83N1nhvjxtLftO2uSMgFU8XWcB2UH16Uv8Rxj1Rdz91mVoAHD0ZxIeFc
 mBsf/GqT3ZYCVmhw8N5IT8qVNK4QJ/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_024200_471286_F8D0DAD6 
X-CRM114-Status: GOOD (  23.16  )
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

For a tnoc device not on the AMBA bus, atid was set to -EOPNOTSUPP.
trace_noc_id() returns this value directly to
coresight_path_assign_trace_id(), which only treats a literal 0
return as "this device has no ID, keep searching the path" -
any other value is checked against IS_VALID_CS_TRACE_ID() and
rejected. A negative atid therefore made path assignment fail with
-EINVAL instead of falling through to the next device in the path
that could supply a valid trace ID.

Use 0, the same sentinel coresight_path_assign_trace_id() already
recognizes as "not allocated", instead of -EOPNOTSUPP.

Fixes: 5799dee92dc2 ("coresight-tnoc: add platform driver to support Interconnect TNOC")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- fixes the issue in TNOC driver instead of in generic framework.
Link to v1 - https://lore.kernel.org/all/20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com/
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..8924b61ad076 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -51,8 +51,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
 	u32 val;
 
-	/* No valid ATID, simply enable the unit */
-	if (drvdata->atid == -EOPNOTSUPP) {
+	/* 0 means no ID assignment, simply enable the unit */
+	if (drvdata->atid == 0) {
 		writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
 		return;
 	}
@@ -130,10 +130,8 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
-		drvdata->atid = -EOPNOTSUPP;
+	if (!dev_is_amba(drvdata->dev))
 		return 0;
-	}
 
 	atid = coresight_trace_id_get_system_id();
 	if (atid < 0)
@@ -166,7 +164,7 @@ static umode_t trace_id_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	if (attr == &dev_attr_traceid.attr && drvdata->atid < 0)
+	if (attr == &dev_attr_traceid.attr && drvdata->atid == 0)
 		return 0;
 
 	return attr->mode;

---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260902-fix-trace-id-error-in-tnoc-driver-eda88ea30662

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


