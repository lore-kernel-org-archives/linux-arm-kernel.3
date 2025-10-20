Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CB6CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RgZkL/O5r39Ejg7wxsPlka6AUERHa48vlx4Rj2dD/t4=; b=4dzZYh6IXt1jKG5cVdHOOzbPEQ
	hR9ib5VX6Q4oleRVCMnYk40K82iL6om+WCmXRovw5DBIjPZ9gP98E35OW00i5M1CjbqTs12zRCMol
	4C5GQNaWiExz3pfH0cZH0jIVD8auB5EQIQUD8/3/ufH7i340i3JkyTA605L6ZEGq9h5KwtK8jxAtx
	1ZyBgcp30Q5vI1BgtHbh2gcsVA/mER8n7Xawoc4HvvNCohQ3bZCOkFrkAL2/DLMMDo4dgWjTEqgta
	T07VkjsociQZQVgXGzL5j/87sekwYLaJ0cmm/QL2L/y7u++68zgS56mD32Y4ZNrmsCKKSVOCbpZKs
	I0m1NLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlrh-0000000CVyD-2dV3;
	Mon, 20 Oct 2025 09:07:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlre-0000000CVxi-29MG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:07:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JLeASO023057
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 09:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RgZkL/O5r39Ejg7wxsPlka
	6AUERHa48vlx4Rj2dD/t4=; b=n0bJxmuG5yQ348/N0RTNO0DItkZ9528dA1D4ny
	pi5nh4DNyHr0v/YuCVL6aro/1AaCj0JzJjDa9LZNuucL6kOG+bTvqEkyVW76EdCI
	AkM7gvAlnYI6UPFi+4gji3I+mWtoBayqF85WBSIZXL1vPCEb5fjsmydmPGKzIAei
	EqdGme0U+GwPlIHQ0EWY3DRiSuvajxUV9EC/QksUkEGAfR1swt2uyx/NNmkRUgDX
	/M52TJ8Cx9Jvz7VtdoehLdsid/hqsC1vlX9JX1JNSob4o356LUKIiTHmc8TvEjUY
	C1AifiwWo8cGx/imizBYR7UqVl6fjs2/yQq0a2EZoT2xuygQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hva5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 09:07:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781253de15aso9853014b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 02:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760951256; x=1761556056;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgZkL/O5r39Ejg7wxsPlka6AUERHa48vlx4Rj2dD/t4=;
        b=mL1Kk9lI1PbADt1Rg013vwpk5aVJGi2VwJYHEJUoF3vd8xGTGqCvVI24hXOlCs/i7q
         FST0YiMvX+ABR1JHixHi2SmcySW2WuckXjXLnHJF8p9DYok4UzEP1MVCEjamSKLmcM5F
         7d4ARmO34o5zXbU6ZHYuiri3SlCOdAUbKX7mqnVDTemcyqw6qhwCblhbwoxjywd+RJ84
         EkE5bqmmqtbLcl4BI4WNQV1wQA0inoNFBf0KEwXMhS3dX6sNDrhYstTwAHgg1Aar2J3b
         Wi0E1Lw3XuMYFXfwqmtYHlquqxb7y4TWS8OIDDT6LmvDqjSEg/Vw+w4CphshDf3+58MY
         6LMA==
X-Forwarded-Encrypted: i=1; AJvYcCUXMAKCPbPylJ6bhM63Ln/FnviK4pC64Ezr112Wfw7gAyUX9nrjH/Cu/Ix2YT0iM8FH91VDlNdbPrijq9fZ+J4P@lists.infradead.org
X-Gm-Message-State: AOJu0YzdjBZkubftbjLBq5XkXUUGu8o8TWo5UW0DtsmA8tY8nH/nNNVO
	Lws8heEyV3MUAQBvOxAdj4Ww01da0BfiwHPzqiNh/pn9OAfVVSqpEBoe9uSOsgFIV6QINtNuefr
	P143xjNz8zT7lEIfrd2IhTmIxw8e7BvdBeJJGL4oXg1DqQxQrISu2+dJREdxtPVZ246jUjANnZs
	PQsg==
X-Gm-Gg: ASbGncsUz3w9gVTw0fY7z8HIVRPLsMNUYYe7cw4U7tBdRvL8RmXge7qlBa9Jk/Cy/5W
	uGHxjndNdEQoNguZti6wg2xDm80WwSTqI166MJnICK5GC7926Xq4bSc2OG/ALNKwbs2sAAq/oz1
	lM/H0Wq8BN+K65iZ7VsGcm+XMwu7PiSuz1r4HodC9dR7/5xxebxNu5W11k/NQBySy2vBs5narnW
	ghBs7iUDq4fOVZYz4k/v0aH7Z3PB3aOAXktX8GUlNWAtkOxi/7miujWXdRGJq64oTQfEP9SdW/j
	MUBDExy5dtLQeqwyW5jpzFBXxLJwvY3wJoFcVHiByCvitStYFdHU0SlQ5yMyikOmWYAP7utR1te
	DleHXqLFrJN/c9lhTCU82Ho3qXIK8OTUjPb9QprDkbLUfQGPm84W5W1E3dZb7HWbJQNr95Qix
X-Received: by 2002:a05:6a00:929f:b0:77f:620f:45ac with SMTP id d2e1a72fcca58-7a220a43630mr15859214b3a.2.1760951255594;
        Mon, 20 Oct 2025 02:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRpK7inrjbHzeDY+riy4KtgH1OnfykJvAHgUiLsEci+dm+CxA5GBz2hSl8e007SY4h4SVHyA==
X-Received: by 2002:a05:6a00:929f:b0:77f:620f:45ac with SMTP id d2e1a72fcca58-7a220a43630mr15859186b3a.2.1760951255199;
        Mon, 20 Oct 2025 02:07:35 -0700 (PDT)
Received: from xiaozhua-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f25b0sm7742999b3a.49.2025.10.20.02.07.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Oct 2025 02:07:34 -0700 (PDT)
From: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 17:06:46 +0800
Subject: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKb79WgC/x2MWwqAIBAArxL7nbAJPewqEVK61f5YuBWBdPekz
 4GZSSAUmQT6IkGkm4X3kKEqC3DbFFZS7DODRl1XqFEt/Fg6o2WRixRq12LjZ9cZA7k5ImXh/w3
 j+37Q5yEPXwAAAA==
X-Change-ID: 20251020-fix_etr_issue-02c706dbc899
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760951252; l=1599;
 i=xiaoqi.zhuang@oss.qualcomm.com; s=20251020; h=from:subject:message-id;
 bh=hVm1R7ia9T20tyT/Jyi2XcWRljw8bltMueR2LDH2CBs=;
 b=c8mtVKvbPgSvvbkWfaxGoLkGyv4LzvBRAZR8R4pm59YaQ/8wH+igbBq5YqHGTcBsosR1fbi+p
 oqIflqpxmHPA09itaBiXyWa9znBvCi4SvqEf1ktMCIQeGiMcheY+qlE
X-Developer-Key: i=xiaoqi.zhuang@oss.qualcomm.com; a=ed25519;
 pk=zuq+lkjngHYEDk6qmD41kiqDaQuURxgU/sjQuARnCrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX/3OSFd0tv+us
 UJy9xwNHXC8MRn9nBmMLBZFPVc/Ur5kM3B9MNNqm/4Lb177Mmtsu4AZ+o9wlR2WHdvEFrOkT/hQ
 mGhT3FuszAKfvtVh1HXgJcFqtXNUhChAhTYOZPCrg5YiZiJOwJqg1ybex82s0Vy2Ha/ZMfFvzpQ
 t/8pEB/IJ4a17y/XCs/LlPdYkuYJWeyztsNrGztlzCPLIn0kKwL8qEl5szDD6XOZv/SjYfckIYS
 EQRlyACx2dmDI7W3U2TkC4MQgaalT7vVYUqewuClDFleMGv0qZ3svnkY4E1FFH3jX7Xv6wJExCv
 pmYVtZ+PkjekoecFN+0PpB+alOBaEaHT31LlNg5gWl2cJTfeLCcyLrkfXQrbbImWknr2aB7cGR4
 A8H1iBGLEZIpn8RFrHvTlJUXyjGgbg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f5fbd8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oKJ9ntOD2-YCvPZDK-EA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: hgHgh7DQdbZnTo0bvKEX7ouOOvULpsQj
X-Proofpoint-ORIG-GUID: hgHgh7DQdbZnTo0bvKEX7ouOOvULpsQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_020738_693923_9A683EDE 
X-CRM114-Status: GOOD (  18.31  )
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

When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
and enabled again, currently sysfs_buf will point to the newly
allocated memory(buf_new) and free the old memory(buf_old). But the
etr_buf that is being used by the ETR remains pointed to buf_old, not
updated to buf_new. In this case, it will result in a memory
use-after-free issue.

Fix this by checking ETR's mode before updating and releasing buf_old,
if the mode is CS_MODE_SYSFS, then skip updating and releasing it.

Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..3e73cf2c38a3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1268,6 +1268,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		goto out;
 	}
 
+	/*
+	 * Since this sink is already enabled, the existing buffer should not
+	 * be released even if the buffer size has changed.
+	 */
+	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
+		goto out;
+
 	/*
 	 * If we don't have a buffer or it doesn't match the requested size,
 	 * use the buffer allocated above. Otherwise reuse the existing buffer.

---
base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
change-id: 20251020-fix_etr_issue-02c706dbc899

Best regards,
-- 
Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>


