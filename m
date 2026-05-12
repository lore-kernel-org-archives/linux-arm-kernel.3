Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55236CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 01:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FLFEbWglY2WDrr12wcGTwfFaQNrhQJ4BOMYAFEd6ezM=; b=2bbx7eTVk6IKHa1zWhqDiOnRk0
	IwBn5RmpiEoqMBlbblXGp2Clmw1alAbVVa+de+GqbCdU2utP6nb1j8EEvUsKZRPt0r8o8zLt8rRac
	tLWQlSpqYcVRSaCnCgqVkcS0KHU4rYqzIhF9IhC98aT2Fuzntx4Nc4An75K9pIu5ps5a4K9d36w78
	nz4XsNnABxYb0B2EVJu8zQcfmQp0zuy98FeoIgCw+oTuZmOSwe48PZ5cInhbgzPqAIvxCEdkNWLX6
	XThHDyFplfIgQ/wkZcX3F8hhaSzb9ImV4/eUba6tPEd3tgAkXhwYl+rMAn86hiqqtXI7y82R2O8FG
	8igmtDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcMJ-0000000FDSB-2ueK;
	Tue, 12 May 2026 01:56:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcMG-0000000FDRj-25jx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 01:56:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6hxc2186310
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FLFEbWglY2WDrr12wcGTwf
	FaQNrhQJ4BOMYAFEd6ezM=; b=Qxkfj3YXbGIOp5rd0rjzeADqKiOiAVIrgDtOTN
	ICU/CsSyZYjBbZA8YmGt01yh8oCMsT3XyRNIDQiGJQa8qYuiOqn0nW/U+pTKJ0v9
	xkfAV2FXr3Ju/ZE40bFIe/TvZShz74UyJOPScnB7NnU3j4gCPPkkquNdJLFa7lbG
	5w8RE4GyYhYOzUDYWzaVmbXjLyz5+P3sLAT2+uGAo8MH/KQcbgC8GojC4mOTfvMT
	L+Qmqs6G+yTcM3Y0eRtzn8XRgyarJ9XbcgD+fr2vkPPk0amx+abWaip0Ce447uI8
	wVpvPItgskd60/488gtJRCgDj8iskUcKQTXLmLMpU7uyqkWg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28yvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:56:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so5263862b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 18:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778550986; x=1779155786; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FLFEbWglY2WDrr12wcGTwfFaQNrhQJ4BOMYAFEd6ezM=;
        b=JOugg4VejEBgGXAxEUPkp/wei27emaDXCgU3x+IrfEDQAhU5+22SYtCD3ZSCGUxAZ+
         SiN2vCMI6zL/x48daFmBtuGpQ8KA+ZtNtl4lPGC1S/AUZ5PW7lPgGUZa4o+O5O6jEkzJ
         1waZKr++38YR46a5UsAX+v20z8cX/95FsHZEiNiAxdXwinQw3nwrGTmgy2RULj7ONccw
         83wyF4Y2sBQV7VDBUUhgY/kwb88HpzFdX+CRGuAHNFt5Hcf2+VZroTthJVCWze9Y2cr3
         YdfdZwc4O9m9HsJFf1DXYkegSjPDa/mDjvIyOXVg6Uib01yOiK55nCcjmkjS1ONu5xTH
         vWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550986; x=1779155786;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLFEbWglY2WDrr12wcGTwfFaQNrhQJ4BOMYAFEd6ezM=;
        b=MrVUk2wv/Lx9VocUFwvREf0IXyBCb39FdO8IxnMu3h/NC5QSROyIxR7uKKPn+mRS/O
         fde3P2E4XXafrdLWskfO3asvblcz69l0jyl32X01p6ymF/WOwnwTEJ9aXOJi1QU5dDtP
         JXy7QIRhLQmQ62mgg8QdrDbRPCCnJyq+DE9fxwACoNg2QJGuSeXxN1qWomWLhZRTGJDN
         pnvfFTcM5/gzllTV17HLQmIFQW80dgRoIRoeqS37FFNvxaWSxYWBWRTjSU/ocXS7XBLI
         hIi1GpiSQYkeKWkRYEuKRE/1kZ5w0ijNgmdWOEW84kFN19EgIgBpS4p9mUVg0GjSVCVo
         C2GA==
X-Forwarded-Encrypted: i=1; AFNElJ8Gwl4phIOe3atc5L+Z3WN+LPYPZl5PLxyV6QAhbqBPlOPhpy5pLikLkCoHAuodXsIN4zLzQ9ww2EbXpoUv89D9@lists.infradead.org
X-Gm-Message-State: AOJu0YxBo3wOAhWFTnYc3gjNVq7Wn2MiUYAwBgDL4immmrYu2/J1L9ac
	/q87mO3jS6o1ZSpeCh0AfQegvs82VpSkyxnO2NoxQR3zHDKko2M3f0DEdTfd2izq4aP3vrF8zA8
	j4u2joDPRxxBpzVhKrGQjI/+a7qm+jfj1p7hkUiuyRKnb59OkgAzYBvgH+K3oC4lcl7ZLi1RxOm
	4s9rMZSgQQBCo4
X-Gm-Gg: Acq92OG0ncHOUbEMARbu5+Z64yzAhvikTpiLJZewISYCd2y5FfZpll7r4IvS8TGOit9
	y1H0qUeHS2F/uORH/bfzrUJDgHycbh5aqHYEGFhCTc+omgoccq/3T4HtRCTLXGhNyq4lec4He2c
	yRXZS6PAvxvnvQkhp7DVJDb6Xy3WZWdLQLRUCp3tHF8KSLn+14GHplouCWZgfcgEUI+tGPKJLNd
	VWWHTgjnesEYODfEapiWk3X9KduBWRLISLbGkiJ7i4uQRdyGA/TU31hJwhGHwfZSPf3//hS0Hf/
	hSg217Qbr+sJ73CYSetQsXZb/ZNJxpw/vjYAf52OPR8+R5JrW+v2Bu2XGtXg0XCywxF7E3Cf/ki
	R+l5Zna00IHK6TGuXYwd5DGHTes/Frw/eSNymi1kxx4P2d4SVP1wldClvVY2CGn/Lbb3jX12QvU
	B7VAbxsojC
X-Received: by 2002:a05:6a00:398b:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-83eebc3cbb2mr912677b3a.27.1778550985542;
        Mon, 11 May 2026 18:56:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:398b:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-83eebc3cbb2mr912641b3a.27.1778550985013;
        Mon, 11 May 2026 18:56:25 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c00sm20323843b3a.32.2026.05.11.18.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:56:24 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 12 May 2026 09:56:07 +0800
Subject: [PATCH v4] coresight: fix missing error code when trace ID is
 invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-fix-trace-id-error-v4-1-eb3de789767a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALeIAmoC/33OyQ6CMBAG4FchPVvSlYAn38N46DKVJmK1xUZDe
 HcLJw7opck/yzedUILoIaFjNaEI2Scf7iWIQ4VMr+5XwN6WjBhhDZGkxc6/8RiVWRoYYgwRW+2
 sFbZ1zFJUFh8RytSKni8l9z6NIX7WG5ku1b9cpphi6ShVUsjGWXcKKdXPl7qZMAx1edCiZraVu
 l2JFcl0hGijlebQ/ZD4RqJ0V+JFUkaYlssGnNv70zzPX2aS64xPAQAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Richard Cheng <icheng@nvidia.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778550981; l=5569;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nJVF0sX7RLGyJiFu2EGqmdVuEIL7zbKJqEChpGUS7pY=;
 b=cFbznhJvdLrM2IyGL+sRewCTVZmmi2W+JBFVCqGGqYO7NKpKbxyc0/owl1dbiZpguE2vEDIes
 e9LOqvOMbBWBPaA98i8Wsp1uFVr4ALjqeY5HSGcWfo2b589P5CG/miR
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: h7dgK6alfBZ52lFkrFqF7McDfd1b2tz-
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a0288ca cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=rHRpchrnBNVC9zy6ZvAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAxNiBTYWx0ZWRfX/2iM4/8E7rjJ
 4E3GRXJJ0CNCghtoMrA0iPC/eW6F4vw6HpR/C+fE6XNOjWAl9nx3AVgM9lH9M4QM01FZh6SU+Dh
 C/57ALh5lub9qr7roMtotKqWGl6cVdisHtR+DsD3X9VNAcIkhbl9kk/kY+x/NNBFRnRh2u6Iqoy
 zS1sKQG8RxVaOyqGOaonxtj+2pMJ7qAllbuk7zGh2mSIq1VarX9PNX78O3DkehJ3otx0rmxzEUf
 yWWHW1tOSBuehVK+MbQgBMC3lBq1ozOzv3mbA2rf4CR7GxSAt0YpxOa63icYR1MXKw5PquyNuy0
 fPd1J1GARdHaILr2E1itgu565CmJNq59mTfSgAm36vQ1L61flXzr0CelCItrwqt1jVdXR8sx6rh
 fmg+cTy9/PiTOj99+LojMVPdfFurb+epaETdOVqtnJPi36Fb7zuYWhwoJlL9q+3TGxq7PuR0xaZ
 Aon3tDQtgFavXlSGy6w==
X-Proofpoint-GUID: h7dgK6alfBZ52lFkrFqF7McDfd1b2tz-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_185628_688209_35C4F236 
X-CRM114-Status: GOOD (  24.87  )
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

When coresight_path_assign_trace_id() cannot assign a valid trace ID,
coresight_enable_sysfs() takes the err_path goto with ret still 0,
returning success to the caller despite no trace session being started.

Change coresight_path_assign_trace_id() to return int, moving the
IS_VALID_CS_TRACE_ID() check inside it so it returns -EINVAL on failure
and 0 on success. Update both callers to propagate this return value
directly instead of inspecting path->trace_id after the call.

Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the path")
Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v4:
- Refactor the coresight_path_assign_trace_id according to Leo's suggestion.
- Link to v3: https://lore.kernel.org/r/20260511-fix-trace-id-error-v3-1-ac4c8356efff@oss.qualcomm.com

Changes in v3:
- directly return the value for clear expression.
- Link to v2: https://lore.kernel.org/r/20260509-fix-trace-id-error-v2-1-c900bcbab3e9@oss.qualcomm.com

Changes in v2:
- Refactor the coresight_path_assign_trace_id function.
- Link to v1: https://lore.kernel.org/r/20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-core.c     | 23 +++++++++++++----------
 drivers/hwtracing/coresight/coresight-etm-perf.c |  5 +++--
 drivers/hwtracing/coresight/coresight-priv.h     |  2 +-
 drivers/hwtracing/coresight/coresight-sysfs.c    |  4 ++--
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..2105bb813940 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -739,8 +739,8 @@ static int coresight_get_trace_id(struct coresight_device *csdev,
  * Call this after creating the path and before enabling it. This leaves
  * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
  */
-void coresight_path_assign_trace_id(struct coresight_path *path,
-				    enum cs_mode mode)
+int coresight_path_assign_trace_id(struct coresight_path *path,
+				   enum cs_mode mode)
 {
 	struct coresight_device *sink = coresight_get_sink(path);
 	struct coresight_node *nd;
@@ -750,15 +750,18 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 		/* Assign a trace ID to the path for the first device that wants to do it */
 		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
 
-		/*
-		 * 0 in this context is that it didn't want to assign so keep searching.
-		 * Non 0 is either success or fail.
-		 */
-		if (trace_id != 0) {
-			path->trace_id = trace_id;
-			return;
-		}
+		/* 0 means the device has no ID assignment, so keep searching */
+		if (trace_id == 0)
+			continue;
+
+		if (!IS_VALID_CS_TRACE_ID(trace_id))
+			return -EINVAL;
+
+		path->trace_id = trace_id;
+		return 0;
 	}
+
+	return -EINVAL;
 }
 
 /**
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f85dedf89a3f..89ba7c9a6613 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -324,6 +324,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	struct coresight_device *sink = NULL;
 	struct coresight_device *user_sink = NULL, *last_sink = NULL;
 	struct etm_event_data *event_data = NULL;
+	int ret;
 
 	event_data = alloc_event_data(cpu);
 	if (!event_data)
@@ -420,8 +421,8 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		}
 
 		/* ensure we can allocate a trace ID for this CPU */
-		coresight_path_assign_trace_id(path, CS_MODE_PERF);
-		if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
+		ret = coresight_path_assign_trace_id(path, CS_MODE_PERF);
+		if (ret) {
 			cpumask_clear_cpu(cpu, mask);
 			coresight_release_path(path);
 			continue;
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..34c7e792adbd 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -153,7 +153,7 @@ int coresight_make_links(struct coresight_device *orig,
 void coresight_remove_links(struct coresight_device *orig,
 			    struct coresight_connection *conn);
 u32 coresight_get_sink_id(struct coresight_device *csdev);
-void coresight_path_assign_trace_id(struct coresight_path *path,
+int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index d2a6ed8bcc74..b6a870399e83 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -211,8 +211,8 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
-	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
-	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
+	ret = coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
+	if (ret)
 		goto err_path;
 
 	ret = coresight_enable_path(path, CS_MODE_SYSFS);

---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260508-fix-trace-id-error-dbfdd4d8f2d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


