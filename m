Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D7FCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Elhh+Em9NnvOSVsDt7zbpLza4b/6zrwnAqOm1QlEHSA=; b=JdgQG8JGvJipqFDc4M0EsygKfM
	ThHWkuME/G9QSNnKvt5jXz1lKoRnIs7dM4buREk1PFnDaLgy6OojWA+yi1cSJB9clcFnNxrx9h+FP
	muT5EtWa2HM5U1bkkbj45wXrAN4xqNebGeicNV+Mv2YRqGoWt+mbaYkooAMx9jt1tKI7K6W3VtPsQ
	jnXO1OcfSCWOm0+tMkYH3YzdWPGLVlSCIDgyNq1MG3eV/RiKEA+vtXyw8AOxCPMwx7YUo7gjUe6BM
	jZEfXfh4KkxGjgaiDyNR71soOHXhd7xGZXAUOp+pIoGHAqftXRDwFwORfvfmWRepIuo+nRQQr8Mmh
	RphtjesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB803-0000000GKu4-3V6i;
	Tue, 21 Oct 2025 08:45:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB800-0000000GKst-3q2b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:45:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8NN1C024667
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Elhh+Em9NnvOSVsDt7zbpL
	za4b/6zrwnAqOm1QlEHSA=; b=YRwpxmaYCmY4Dzc2B7MSRRIeNjGn0+oipPBvt6
	cD51REKwRoGgWo4Oc1/e/w/XYVSbKXSGiMSt/Fv9MlkXV2077iN0Ju1k9trXaSqU
	I3CYBZQTSJSv8mS6u6heoulaTKGxOKtjAYrWEPJrFtwd0UuBBJQyltXiKij/ExMu
	+f2P/xB7gkSVshpRNgziOoaAQaQBzHJ1IFwR1hsbw3a9Hn6jbB1b0sYh3EP9A+eY
	piBlV8xAYNYM+VEBu08vy2cpsOgeNtz2hNfY01+gadvtQYGeUaZf1vHzYMxnzBPr
	TNYvMo8T45S/5zloZ+L27IwAYV0X1dDj4xHEhZs6xAqTyh3w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws2af3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:45:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28c58e009d1so119794165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 01:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761036343; x=1761641143;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Elhh+Em9NnvOSVsDt7zbpLza4b/6zrwnAqOm1QlEHSA=;
        b=CwRgGYKkk4fMuBU32FUvbrD9oPMeIO+RzelZlBaAFT9bFy9qEzMA2OdSxcjIPocvdp
         l1lj95PMfxs7u0juzhDze3XsNGwHvLF1xDNKw7aEXax/2CzdC8ndR5O8n8RSZ532YbUP
         KEJebxzd8o3P0ozQMPQ8j89xbzOx+6GbdCSJpPigIaUA8xKYL1qO+Qe1J7QYzNoY9InG
         5q54GYYeovxhCTM8kHymmVMm2ZWxw+3FnrJltZ7exiF0hIbP9nJTDYhssddUGA9EWkZg
         voMljYk+d00J8IsFxReSBWmEgJXdQaRnkE71vqq2BYP1GbYl0Rr8YhO6riIbqERJV77q
         UoQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl/rMLnDUJoYbVjBk7lX03Aih03ywrbms9ixuXW+ZEZeKYwiOStCbpTE+VHGiIUpX4VBoIxQ06RFGr6AWouCR7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7vIdQmuHmsxVJ3uSk4TGgdnRUebmBZSlgajGf2T0IXlyslg5a
	5wd4I2zUKw1WU5LGjjEF24WbTmwlz8PFhIAy6TchH6zc6IEJ1FdI3q+C+lzeHPEhPcnYBTZ/mTy
	7Sqk3VQdlFAleZ/aEKbdaVYDrjVETbz5LqexIQapgh1IbTSPgf1jqmjEhGcEaWEM7Ym13NY0t98
	FFfw==
X-Gm-Gg: ASbGncuaAhKFBVbWAVhLo7zAfqeuncgXea0JCum/TilrVEFtardB0+ssK7Crd/TNiMj
	l1C5eAOhLshutH+T8SG/yvOIcHON5Ghq0uWnZWGlJcE082t0fPAYmgPOk4mh2NYdV0SJlJu6Put
	n8avncxBDZHzDKhgit6PKHs4niXy4OTZlBLWhvI5mj8ixkOcU3LU7XvghvNFbAH/fpN98pjV0m+
	sHO3kRy64ZPXhiSh9EZ/WoqksRLUm1M7l4YFK5uFFjQBLeWX9/m5J4TmT0fh33zCsyh3UogaEd9
	BUzrNqo1+9f09kHKnXuyCKfRukX8ctufAbcx2InjuPNFzXllwuC58kNIwXMhs9/B7KbA8S7889C
	+Wjk+fKcGcP3QSQQcFzUIrjjHSOJiaY3Tk+RaoTsnZlKcMkG/tqaVr/0sQwP0B2zRMaJL6n/b
X-Received: by 2002:a17:903:1a70:b0:267:9c2f:4655 with SMTP id d9443c01a7336-290cbb49970mr225048635ad.41.1761036342674;
        Tue, 21 Oct 2025 01:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeDozYIzXs+r4izATtwH8K7/YDy4VBNwxTHm2BbitvyzgRq84sjpyhEpzvedomP6vHq4zULw==
X-Received: by 2002:a17:903:1a70:b0:267:9c2f:4655 with SMTP id d9443c01a7336-290cbb49970mr225048285ad.41.1761036342226;
        Tue, 21 Oct 2025 01:45:42 -0700 (PDT)
Received: from xiaozhua-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5868sm102080565ad.60.2025.10.21.01.45.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Oct 2025 01:45:41 -0700 (PDT)
From: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 16:45:25 +0800
Subject: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACVI92gC/3XMwQ6CMAyA4VchOzvSTRDGyfcwhowyZYkwXWHRE
 N7dwckYvTT5m/abGRlvDbEqmZk3wZJ1Q4z9LmHY6eFquG1jMwkyFyCBX+yzNqOvLdFkOEgs4NA
 2WCrF4s/dm3iweadz7M7S6Pxr44NYt/+kILjgCqRuclEU0GRHR5Q+Jn1D1/dpHGwFg/xExDciI
 1ICZoAKNZb4A1mW5Q2ept5h9gAAAA==
X-Change-ID: 20251020-fix_etr_issue-02c706dbc899
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linu Cherian <lcherian@marvell.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761036338; l=2039;
 i=xiaoqi.zhuang@oss.qualcomm.com; s=20251020; h=from:subject:message-id;
 bh=e8OIztMbIriYuc5EqoSW+bjrlPbXrjnNXj6AVSTUj6E=;
 b=CT4tBWJtsym3+buKoCXEL1VaPVn2qIEfnKDDcw+xbFgf4Cjd/HGjUjiQIXLmXeALYT5lZTIEC
 okfiW67jkeiDEiZE+7hTO57vbWDSIBB1DUtoq//7Vm8sQbfv9MBFpVZ
X-Developer-Key: i=xiaoqi.zhuang@oss.qualcomm.com; a=ed25519;
 pk=zuq+lkjngHYEDk6qmD41kiqDaQuURxgU/sjQuARnCrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX9pWXH/ZuZqD7
 ZUXNqR/iJxG4YRNtx9aTy3ACZMpEF7OyhZTmzu+RB6WL6kvRhADqX17gb/O0fU3h4gp7UJljpAu
 /aA8HsGKw2Oo5b1KtG3oaT46nCPjmwIcutx+/7RqzdkSuly77cr0GENJJpMYFrfcgJQciiJo8ax
 SCuw16fKvm6AaYSNN7PyFy7BvKKJ0cEVjUd3td5UWVS62gwsu665lKt+ks/w1j1XeOJ5zkcG/H7
 0cl4P9y0WhL6cc+ma02vArPe+cCSAIB/b1Sv+oQVXJtsqdOVl1xozT39ZxvggAhbj6v1nCLuj6S
 mMRusCowl5F6iJatmfjiGv9WxEPjVhcNXNV45aHhRowFXCxAqexKChKY/Z0zgSUT+f9QDezSbEQ
 q3pDl55e1beez5KHnv+DYJyM1U/40Q==
X-Proofpoint-GUID: rVcHRKaZleOoAi5yyPKQ0ivNxrXNFS2y
X-Proofpoint-ORIG-GUID: rVcHRKaZleOoAi5yyPKQ0ivNxrXNFS2y
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f74838 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oKJ9ntOD2-YCvPZDK-EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_014545_078170_984B05DF 
X-CRM114-Status: GOOD (  18.72  )
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

Fixes: bd2767ec3df2 ("coresight: Fix run time warnings while reusing ETR buffer")
Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
---
Changes in v3:
- Add a fix tag for the fix patch.
- Link to v2: https://lore.kernel.org/r/20251021-fix_etr_issue-v2-1-80c40c9cac8c@oss.qualcomm.com

Changes in v2:
- Exit earlier to avoid allocating memory unnecessarily.
- Link to v1: https://lore.kernel.org/r/20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..800be06598c1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1250,6 +1250,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	 * with the lock released.
 	 */
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	/*
+	 * If the ETR is already enabled, continue with the existing buffer.
+	 */
+	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
+		goto out;
+
 	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
 	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
 		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);

---
base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
change-id: 20251020-fix_etr_issue-02c706dbc899

Best regards,
-- 
Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>


