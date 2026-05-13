Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF5CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 01:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6KRwB08wa5LSCOrHplBli913U01qsOZ1SqPoeDdqIUU=; b=rJAWayXOiqboLTgsofNy2DMxT8
	MSRhTf7KOqnAS9wqnPSwE3PT4UTeoPRdgJQKE+/njHXonGA+96slNzSOem7f/5Jkjew9IKWZ2LZH6
	3Z/HZSDynZn01XFZtD1tEvwrC3dMhW401I4/99K1t090UxqweAgsnRSLoiqWEhZQglTX1TddXoqny
	2+iGP86Gn8Z2mSPPnilYwN3Wvp/o/fzOG/+pX2y4tW0ch6YXwguRtDLs3/vbsO/GggfgM2etX4Lsd
	WwMU487iAdt4r840s+EKCW5aUWLLn71OAuhmIWRjLRxj5IgO7z564gRlfHfnG2V4BXFbTALDtum6Y
	K+j6Mp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMyTD-00000000rn3-0FDv;
	Wed, 13 May 2026 01:33:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMyT9-00000000rmP-3wYn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 01:33:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D08j692912273
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 01:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6KRwB08wa5LSCOrHplBli9
	13U01qsOZ1SqPoeDdqIUU=; b=DdLE/04vl++QTQmxFZnHQQnpgEiEHiXQTgaJRy
	yR71UhjSrVdyGKwNiFsQcP9kSkvAYFk0bW6Q/NjyzXoGM1Ak6nX9dswGwtBQ+kq6
	88fb7jiA6RVko8jTn9li8pz8V5fghJ76SAW14zZr7wSdK8MHbBWjn0j2bj1We5cD
	QD/rfge6eNgv82lXufESBzTzqZZ1XiXo6RJaTapSh5zQzl6JUqCzyKzem6k9nKPw
	1Q+4/r++LuGIeuQUm+BtD+ukdHWYycsTSECFcpleRVUoaeHCWYzSv57MOw4m3m11
	OLQYIHmv6MN2pSzRsf+xTgU+cIpMlhsv+hYIybwLE+iNC5aw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f32jk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 01:33:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa860e71eso3401203b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 18:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778635981; x=1779240781; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6KRwB08wa5LSCOrHplBli913U01qsOZ1SqPoeDdqIUU=;
        b=Y/qCoL/MuW1NTImY7vr+BO5v1u5JK8C3fFTJZ87tsYtPRu/pjSdro7Hb9PoxvZkO9d
         nr/S063yUi4keI2iQ2dTf+Snt2mpKYgmP7y9RbENPSxskQlVhzWU1sgRCAhQSacXWgeV
         VO57+TfVzGGxzCsMg86KGjsVe74Wcj52EfvensinJ58Wz02iWOWDeevygopyrsysvv5A
         A1ydfgjYLOOKYvwDPxttu0Sy500566eFL054YZa3e/VKa3PHn0TXVJyNXz26L8aaQMDK
         J1VIEK5ulb6hHYAu6f8XB3GvA/u2z+Ht/cQHlmNBuZLtg8ZRmXABvS7ov1JzqDHRSWoL
         n9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778635981; x=1779240781;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KRwB08wa5LSCOrHplBli913U01qsOZ1SqPoeDdqIUU=;
        b=gQzYGSbbGYJkm3phTJYEstIDh+5w7CLRcEkK4GdGZCqVbzVRkneWPwlc3N1jTQ+tEt
         V1ii9MnMkpbIur+Nx4m4Zn8NGbjUc50k+S4IIivZv04Jf6KIDH60uYbYi84Fmzi8XibF
         9WoiY08rRH3ZXZdkaBvhgvgX3QV3cU9+/0xvxbYE+X7zfOuvJ+pDMHSSS6ca9B9OZUFi
         65yvnC/osV4ne8F7uJVWku6f9BIMMf+oO1yS86geVEtlSmvi9CeGddyMZ/SavBn3zibq
         +nh0TYRDwXDD6pUh4JjfeDpgxVSapdzNPqFMqehyieDRG9BsAiV5iVjc8MRAE3fVbPg3
         xgyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Em8k+3xo1yvnYT7nUNu5DckhxCx96BUyTSgQGS0Z4Ggw1bDp4rhZ97ikce3QIKZ6cQvyTtYif447Hwg8XZBDs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+kWICU9zNwjO4Iy2/tPewiVpcXQTj/5IlnR3ZOqiMe/tYngXB
	s8yviZjx4Vws4YqiFdOes4l0U9S6+W5LmIQp9o4hscq1ALy8oCJP95PYVhrJMm3Ub3k5XMDN/L2
	KYdppFSqk5BIaaFefk1TNCFFMzgF0sV6AZi1mKCTs33Q+ooCzmiXoXkiz28KWsBZ9FXdUIzV9EG
	D7hTl209M4FxVG
X-Gm-Gg: Acq92OHBUxRPm4cTwaY+H9zxsyL6bRLfZVyvaDBd3CxoHIy3MuBUwbU4hmhoN4GK7tV
	6yqhMDCJiioQSWQQGkN0P6RxeIaUytDa2keiNvvTgBp/5naqjiY8QNT/ckGnRl2IVd35l5Sbk6q
	hPXBfylff8MeE3k2TAX5/PI6XX0J/3eOCIRMQcss3TQwA7nAAGJrHRUoN6goFegbeC7odl4gfxt
	G5EFlKtJBUP7HfWw+/FCmKZIdNcSMTnMCVXgmPwBhON0r/tXqyZ1EOuQYAJzsBgpk8BR8ZOXHs/
	PXc9fb0QQFqXh9g8jpGX6Rlaz6qjPtohBTEaBUg2QZB6UHxWLvOegy/voupfw4akbx0unqkheZa
	kUlvI89qD+iLvfEjZdlwUS/IdZ2abydAkJllgNCUvLO9ooh6Li+lttApiNm+DFJDzTt6z6bHSEG
	eD5vKxsJBY
X-Received: by 2002:a05:6a00:420c:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-83f041e9eddmr1109650b3a.21.1778635981475;
        Tue, 12 May 2026 18:33:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:420c:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-83f041e9eddmr1109626b3a.21.1778635980998;
        Tue, 12 May 2026 18:33:00 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a088fsm24755895b3a.58.2026.05.12.18.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 18:33:00 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:32:43 +0800
Subject: [PATCH] coresight: fix resource leaks on path build failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALvUA2oC/x2MSwqDQBAFryK9TsM4HxdeRbKY6Ets/DKNIUHm7
 g4uC6rqJEUSKLXVSQlfUdnWAvWjon6M6wcsQ2GyxjYm1I7f8uMFy5b+PCNOLKoH2Dj/8tEH2wR
 QafeEIt7f7pnzBUgjC/pnAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778635977; l=2366;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=eyAUz1s3eo4gcawWBadiNGT5QH1Paem+sgDmcWO3pn0=;
 b=S43pJJWKnshVyblz4uBIzxJEY37DHzyhcNQdEubzZFyUjTbySJF0sQshDClqkaa2p699hC8d9
 vPhsrptMnhcB9SvNm7m/mo7Q5Z9v7Tt98jFrM+M9M8dPO+CTONPRdjd
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: JQVPF-C5JIjRnVW5QvQqRVvywTgiB79W
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a03d4ce cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JWgtPBJkhr62ReCL0bsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAxMiBTYWx0ZWRfX4QNF3893AN0e
 TjREfPhrt+xFiPDMXrbzohaGc+36ydeNHkoEdqs+34/Q0ZemVYeCkXyZMxgbP0yo2X1XhunwKfb
 /8RQ/ZE+mPSyBuR4c2RwVm0iSFSJb7WDmNtb4mMFqQoMSWSFOvaYoGUIqxFtArP4YH4jUINDNeC
 U++m56jHQFAK/Q9ZtezRLqMxNbfNNGIeuHt9iD2w86B8UeP+bLqFWWdd2swXYY0UOmzRVi+bn9f
 E8zV5Lw4I0zE2MYHbpBZahkyQ02sA8VOyECv4WHr6tn7XP8JCelS8OPofCbvOqLSF3aaooV74zk
 mLsJBjruTWqE5DTrHLmHHY/Rmjtr8REwnqkEntgK7B8eGEPLe5qB6F89csxfEIHRZo8l/tSfKL4
 1M22JicsT0v7krFtr7aJfG+UOrftbi0Xu5uDiQcIOccqEFeVql7UdTgXE7QGb0q9/CI7wqkNE5J
 fOvI1wvUwXC4MvrbXcg==
X-Proofpoint-GUID: JQVPF-C5JIjRnVW5QvQqRVvywTgiB79W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_183303_994165_F23870CA 
X-CRM114-Status: GOOD (  16.43  )
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

Two related leaks when _coresight_build_path() encounters an error after
coresight_grab_device() has already incremented the pm_runtime, module,
and device references for a node:

1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
   after coresight_grab_device() succeeds, coresight_drop_device() was
   never called, permanently leaking all three references.

2. In coresight_build_path(), on failure the partial path was freed with
   kfree(path) instead of coresight_release_path(path).  kfree() only
   frees the coresight_path struct itself; it does not iterate path_list
   to call coresight_drop_device() and kfree() for each coresight_node
   already added by deeper recursive calls, leaking both the pm_runtime,
   module, and device references and the node memory for every element
   on the partial path.

Fix both by adding coresight_drop_device() in the OOM unwind of
_coresight_build_path(), and replacing kfree(path) with
coresight_release_path(path) in coresight_build_path().

Fixes: 32b0707a4182 ("coresight: Add try_get_module() in coresight_grab_device()")
Fixes: b3e94405941e ("coresight: associating path with session rather than tracer")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..c1354ea8e11d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -825,8 +825,10 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		return ret;
 
 	node = kzalloc_obj(struct coresight_node);
-	if (!node)
+	if (!node) {
+		coresight_drop_device(csdev);
 		return -ENOMEM;
+	}
 
 	node->csdev = csdev;
 	list_add(&node->link, &path->path_list);
@@ -851,7 +853,7 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 
 	rc = _coresight_build_path(source, source, sink, path);
 	if (rc) {
-		kfree(path);
+		coresight_release_path(path);
 		return ERR_PTR(rc);
 	}
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-fix-memory-leak-issue-034b4a45265e

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


