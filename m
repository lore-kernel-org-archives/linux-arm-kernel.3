Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01108C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 01:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tQNRCYHU/5P2PfWYw9DTAN2O1KOVrz4anhz8ncma5w0=; b=dDibNiRr95HJ/VFypONV6tTN7L
	KI/Xfk246o2J9PwVQA0WPISfhKBe0EU5hOatOJFWwnSO+y+WQPCUQvbmaQPv/2flJAzyqE1U5sVnH
	/gHb+AdZGWIRKG6dXA1vVxG5ZPQoOo4cBlhpjnvcHXkgBZpSuR2+XQw0ElHBX+fetxGFNOaZ8kw/x
	gT06Dt+k1j3iEMaDMR5io8wavtFAOe0Kf1B0PKO3HZOEd9xswPbmgd022+brs9Q11dFJXJAxhx+Tj
	KKSoAg7/ojRYtHubaXbuskzzi+r9Aytav5tShAw/pyEAWPAbOdOWrRm40uLVKlx+FgFH+2ij06pwb
	oLUlCaXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzQfj-00000001jgf-12LN;
	Tue, 01 Apr 2025 01:44:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzQdw-00000001jaj-1s5T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 01:42:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCrW9014402
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Apr 2025 01:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tQNRCYHU/5P2PfWYw9DTAN2O1KOVrz4anhz
	8ncma5w0=; b=YX4Cet3JYUf2Ih40V3PneXIZvWvQlf6S7Bc7u2hJHvH0GWzp7xV
	u+qwDYCphHhDa++A+YDuzntCM8hIVncD0Lq9At3XrYcaKVKgiq1T0CuT8pmy8SES
	e/54+r8KQiXqLH+itC44KnS/kCtUwrh/ZKOwrx4dVtb3AZJVYu6XAANvfmXiDklU
	nnwuVRUlj04LgX1cV6Soa6IrJByJ//atKvpTdxouUe3nQd7HuYiaiBYiYSeU/9IO
	S1xZoKFoeYPpW2+GKrCq86e2E0+02fPHHDbbb5cvHqYOiLJk3svdBBwZr1JHp6D0
	1ZoyprqR1omSE0TdK8lVtvnezVb6vo1TZTA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tve5ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 01:42:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22410053005so152761145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 18:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743471738; x=1744076538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQNRCYHU/5P2PfWYw9DTAN2O1KOVrz4anhz8ncma5w0=;
        b=I3jQkukymTIvABkctPAjLrEeEngWpsPTeUnPVXDvbpLuKScdxyKlEV2fPikhuYyM+3
         eYyfj07vWpAtsb8ZqIxwN3POi/aqjBI7Z4wDq+yPthamiU/pcx4xZFsdhFVRVKJEruab
         sLKR6bJF0WThV4HaRB5ghT6JYlDd6zRhUKwk1TPFd38B6iA2/+9HCAuF4aDHQinXjUTo
         OzuyrL0JTvwTfkvkHLr8dvmN8J2ULU3/FRMAKuRssWTTUN7x4dP/T7Iqed+fkEBwJmAT
         +098hO6SajilRSlP5YmMUx1MaAjcV2Ek+G93mQKT1+6SYcI9s14+8vDUO+GXEHFs2+i+
         yATg==
X-Forwarded-Encrypted: i=1; AJvYcCU6nYZCgUf55BxnoeCaepsBWzeK5v1r0lukovydKtPD1H/V0qtij24t468FYi692XZZyleixI79V6r3d5dzCxXj@lists.infradead.org
X-Gm-Message-State: AOJu0YxekjMex9Ga3FV/sBkK1nytSsl9CYCwjnD6P2OIXEp8UiN/685s
	WxbEEVvPNEaU+3O4Vju0j6NFFZ3jN6AVaZ2A1/x8Z51FfpQU/KQ9+A163s2G/DK1ns81+O1F9k2
	TUsM7oVvFaUr4I7ryn/F421NCRpq+2513KBnsE+9AvzEdv4rPxb4p6WtZbof68g6X/OyPv31BZw
	==
X-Gm-Gg: ASbGncuaGXJOnwoETH964SL9fB1yIPRKj9vdwEwRcpyhT+8QRJZTjg6rBNhz8B9P5R0
	WA2C6w6jvbIYNDkaiIsK9RJ/h2Oa2riMOYwmu11xdbLmIp2LOx0yPbIISQCvOxjTY9bmT7hg+Nh
	4+tkmsfDw7RtbI3LvHwaWCAJsfXLWjKG1ePqyYz9EqvgettY6T1Q/cjlF3yDyewiol3dRD/uKyv
	Xzw9XKlIwNz+qJWbkTkrdxfA/paOo+CzPl9nbJagqwGo+qWKdocujAUBsHglNVxRzf6KlcuTV9f
	Mpj6ojbUpn3UoHLcJkNZVg+jYrTMxeonL1Z7TYOx4f5vAISt4QhlfEFLenWdDwfmWAIwqElbsQE
	=
X-Received: by 2002:a17:902:e74e:b0:224:376:7a21 with SMTP id d9443c01a7336-2292f9fa2d8mr186446215ad.42.1743471738156;
        Mon, 31 Mar 2025 18:42:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdZ08l4j9k8M+jkJjNmYyxstuXHNySWWgvJXMz8WalhCiWroBe3xTuvINkOu/d9tKSD1zceg==
X-Received: by 2002:a17:902:e74e:b0:224:376:7a21 with SMTP id d9443c01a7336-2292f9fa2d8mr186446005ad.42.1743471737836;
        Mon, 31 Mar 2025 18:42:17 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee03f5sm76911435ad.99.2025.03.31.18.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 18:42:17 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] coresight: fix the wrong type of the trace_id in coresight_path
Date: Tue,  1 Apr 2025 09:42:10 +0800
Message-Id: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67eb447b cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=h-QhH5eI3XViKx3wfOsA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: A3jaHdWFMm0YgXSd5-NBSA8nUIsm5XXi
X-Proofpoint-GUID: A3jaHdWFMm0YgXSd5-NBSA8nUIsm5XXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_184220_493208_C5668300 
X-CRM114-Status: GOOD (  16.48  )
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

The trace_id in coresight_path may contain an error number which means a
negative integer, but the current type of the trace_id is u8. Change the
type to int to fix it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 include/linux/coresight.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..c2bf10c43e7c 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {				\
  */
 struct coresight_path {
 	struct list_head	path_list;
-	u8			trace_id;
+	int			trace_id;
 };
 
 enum cs_mode {
-- 
2.34.1


