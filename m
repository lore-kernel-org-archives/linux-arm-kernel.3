Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516E6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ok2pSFo9mjBytCFk9nb5U0sb/U1t+WEEb+M0pQ2ZHuY=; b=q2MgkUfpO4AeuQwj+bmw3hc89/
	9TpXHLfQB5xIcMktD4FhmoZ0Ta15Ry8baepzyAsfXo1TfeLfXttb3m+/qIM82gPrF3Vnd+cYq5nAc
	FWtjS2e+ShJIXxoc/8gakNO6/pEfiVJ2umt6y1JWPIFr11F/fy/qYqB6XImE8OgyRRre8budr9sWQ
	RyN0RWBspY5F2XvYRAlEyHM6iw1V9pzKi0Hf6MswhXjSh6TO2Woc8zWQAidOYFLaqC1xV5DgkuOEl
	R5/rVGNJcTsC+ls0h3jHiVzkOivyUQKikvCzpOcAOh+tZuEd+DMsTHTWIXKim4nm+S089Pn/RNSn/
	Ag+Wys2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt3H-00000005jgh-0wMP;
	Mon, 17 Aug 2026 08:50:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt3F-00000005jfn-0bYK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:50:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H8Zklw1323830
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ok2pSFo9mjBytCFk9nb5U0
	sb/U1t+WEEb+M0pQ2ZHuY=; b=GWdTCzgck7CPq+CsyyDXuPeMjWgX0uy9raHhK4
	9plx1SaQLFeAbwJ+sTccEPmn3Q0/1OkdDWenCCLkfhVRSQ1Zox5wPRYhTYX/ZwSL
	9NEph7uNbf5FDC1A7yhht7tf7e2e/l/8IRZm6hdiGuJzow0TS5eSuuEG6C3vB6Jc
	18WTCG8i0i/sTDlLJfMkkV0mim7vjg3I9v02W2pfYi2IzupGe91hI9+EbU63PCyX
	6GSMebHAQBS3xMzlZAUGfk1Bw4RcUkxSuGREpjsfUIdnL6lw4ibDa6Em5OJMZOen
	EjyI/5KDNOw1zMyBpkhHFcdoLfN0l6g2yWUStKEORXPRAcKg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7g1vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:50:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e6d253330so3396456a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786956636; x=1787561436; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ok2pSFo9mjBytCFk9nb5U0sb/U1t+WEEb+M0pQ2ZHuY=;
        b=jFKgpTE41yWPEQ+rhIKx263HJ3gXCH6BxL/5C/JbjQLQ1tLL6w4DLAXag8mj7LCQMS
         YtUYPkJUnjPShKsP/BaumB89j9y//aN89gw5aPxs3QJyLXxttakZEel2YQdVmMCMPnzg
         mU56bKipQO5FYFZgcnjTZ23xgZCpxXmCprzV/pX6iowLd4I3W9Z7JOhHo+9naeshbyun
         qeKMNNzZQQAeO+PkM33xFvcmAuY1dLFYuxB2q3qxSdekzZ/H+hJPQ+7jttOEoeQrVETK
         jetyTi6KZDJuvoTf6nzfxXvKCdMKXq2cy+lYlJm7xpKMVDrxvelBJkfgO6jveoJw4RtC
         /KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956636; x=1787561436;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ok2pSFo9mjBytCFk9nb5U0sb/U1t+WEEb+M0pQ2ZHuY=;
        b=WZ6b9xW+HvrnxvJk7e9sAuSp+OludHaGP9ZPdUx69STjTTzm0UsDpquwiTIT2tLjKT
         oEMYEDj4xaNl0/LFj4j4zeWzcRnJtB7AXho/d7g9QbEzgLU6MegvF+mJ3h2BtNJsIYBA
         0dBnrjaxhOvxfLhRR+yhdPUSx8/bbpbM+VAhvIvKcrdmVR52mU9R9Rbq1W7aZ+x/W2yd
         Ze6Yu9E9Vh1sxgF48+jhDkx7VTTq4JdlpwCjnNkRRnbMW+67jc+as7s1ZsQr9OQTC9Co
         ZUEl7uj1Up67Hx5tEeKGosjHa6LVjkIXUephp2d7YLoS/Ef8O14ul2mvCTS0tF5M8ZfH
         gCyQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+BOoQyRTlq7wJxyiOeLTz9V7E2hz27CaIz0YQHgInRBoyG6op14T8X0n3p1feIHlv+vbFZHtKVfjRWofXl1mU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2S49IQ0JDlGYatvXWDII5uSbbkTBYGBmJVzJV0t0eGVnX8eXM
	/L0cEyhGSPs+KedvubX1phfVOp01Q4EMxMNv/TaPyvHG+QZqjhUCRTpOIpqbiC3aoieiwyfZjah
	MBPGNavYKHafA4Nw666+5Z+1eKyoyZxHFr2NpHa9rHjNmjTHWRLCFuDXVkB/R1Os96A7p5X9g4O
	av1w==
X-Gm-Gg: AR+sD116gxlw76ySmn/rjC+x5GMY+K+fI3M/C/2rc8AvlBlCNLj3X80gAWxZSWOemso
	ZmrDknc8LJ3aZnpW8LgNpFZpFZZyPjuVbj/fRF9fi12H3ccLAq1ZxSU2vxLMskN/tPx8HfDxDjZ
	3+NKSu/gGA33h7v0bEzeSmxq/zadJi/wGD3dCsICqpeEpYTvGfXU/lM0nEz6mEw3Lt2ApaYo0Qd
	jBTkpxLkcJXRwT+Jz1IRKX7mLWqtxjBynEK3Nzc/p0nNBap440geoYvWIYXgZ0YHQkvbozUuPpZ
	U79Y5iC1pjh9HMLHRyWuyHXB7xEE2MNYNF7C6iORUxTlcDCdGic6HQakN1a84jmhryAGniCiVuj
	WAMwWvWRZnpRtPGPXY7upiF6LR5h5ysQJbFNroGm4/5l6b0d1oulzB0s7UYKLTTM=
X-Received: by 2002:a17:90b:574d:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-3933b1091eemr18012078a91.19.1786956635578;
        Mon, 17 Aug 2026 01:50:35 -0700 (PDT)
X-Received: by 2002:a17:90b:574d:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-3933b1091eemr18012033a91.19.1786956635111;
        Mon, 17 Aug 2026 01:50:35 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3953202e9ddsm4047281a91.17.2026.08.17.01.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:50:34 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:50:15 +0800
Subject: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEfLgmoC/x2MQQqAIBBFrxKzbkBdWHaVaCE61WwsnIpAunvW8
 vHffwWEMpPA0BTIdLHwlirotoGw+rQQcqwMRhmret3hzDce2YdvQC/CS0IWOQmjsY6cijpYA/W
 /Z6ry3x6n53kBmKVSI2sAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Richard Cheng <icheng@nvidia.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786956630; l=2131;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=KN33qKwL2lI5YfQnPfBNw1wyF5RZjLKT3iCdPNfTMiM=;
 b=Yj0vMaNEmHKClns0KiuULI4MPRVf0TD1/RQgrsno7JaEjIpAPMMn3IIZgaPao1vd1wvklo4AI
 NN06xZ4oArFB07yuLpA9QDJRt46F99Bon9dWGsK5gobplLLp8he312s
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2NSBTYWx0ZWRfXw+35vhaJqtT9
 HlzTdrotph9IIjZfr5yOSmZIVBr9hKtPpeWttvonigvQU5N6agZLzzBOHjvhbynVRBwXGtjv42h
 OJrjoUo0IVK6SaHmusp93yH9v4Cmyko=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a82cb5c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z2a3U2wxpuANWwaHzp8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: f8g_GL6H3UVU5duciG1KyDFBcahZmlc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2NSBTYWx0ZWRfX3UCwMqJ7orfq
 OuSJaSfso5Nka0eYT5/zyXf1oMIVIupsrwkNbxl/D5cCnt40IdciIZy4bjIEZOcS2OuBebCRZvl
 GQi+mWED6LA9gzGLXZTPwYNRf4xhHZjBGjK5NizhWZavj6AqM3QQgvAANKrJJJpuXxtQC8aEqnx
 yGVyoobv/tRLqXPdWLzZUnzJnUrJUpwK/sYuOMPyFzqB7/75EunkB8WGWRQ7YIKsgrRkFmfN+cE
 0OCwwt9+8mSodvHuvD+2IhoRLjRf7x+/Q2Pw40PST3TQJdWThMsxFtgpTsq8ckdN14ixoHGXLR2
 ntQ/xqhp4asvIlMf24WDTvIxnK1xoqAWSIuaeylpccwi7vtapCmnaJd7v3B4/JDE6pv75DZDBng
 sNbOvtjEleLgh7Vftq451sukVl7ep2+fI8LVGGihknaPPAzXXoT3Uq47OspI+I8PtLem0w/bOiU
 dtCg4Reo+RfSUj2OHSg==
X-Proofpoint-ORIG-GUID: f8g_GL6H3UVU5duciG1KyDFBcahZmlc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_015037_198186_5C806140 
X-CRM114-Status: GOOD (  17.45  )
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

coresight_path_assign_trace_id() only treats a trace_id of 0 as "this
device has no ID assignment, keep searching downstream". Pass-through
NoC links such as itnoc (qcom,coresight-itnoc) intentionally return
-EOPNOTSUPP from their .trace_id callback since they have no ATID
register to program, but that negative value falls through to the
IS_VALID_CS_TRACE_ID() check and is rejected, aborting the whole path
with -EINVAL before the real trace ID owner further downstream is
ever reached.

This breaks enabling any source whose path traverses an itnoc, e.g.
writing 1 to tpdm/enable_source for a TPDM fails with:

  sh: write error: Invalid argument

Skip devices that return -EOPNOTSUPP the same way as devices that
return 0, so the search continues to the next device on the path.

Fixes: f4526ffee6ff ("coresight: fix missing error code when trace ID is invalid")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d574f..949ee9f00097 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -953,8 +953,12 @@ int coresight_path_assign_trace_id(struct coresight_path *path,
 		/* Assign a trace ID to the path for the first device that wants to do it */
 		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
 
-		/* 0 means the device has no ID assignment, so keep searching */
-		if (trace_id == 0)
+		/*
+		 * 0 means the device has no ID assignment, and -EOPNOTSUPP
+		 * means the device explicitly declines to assign one (e.g. a
+		 * pass-through NoC) - in both cases keep searching downstream.
+		 */
+		if (trace_id == 0 || trace_id == -EOPNOTSUPP)
 			continue;
 
 		if (!IS_VALID_CS_TRACE_ID(trace_id))

---
base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
change-id: 20260817-fix-trace-id-assign-issue-d269e90d1c62

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


