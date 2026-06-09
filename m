Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5138CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6543jtmJUE4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=; b=NlJPgLHDZMIHa7twZHSDI/IIM8
	iC5sals/V1JgoqGuD5/3jbtIag93RHdt8P/7Y4SXwJhPUHzlAv+uyz6rkfI/o5scfS469yVgGF/HD
	IcOob/8AmYZVv5IcDXhc5oeIrrbXigC1LqpPymKme/WfGIyHWYB+2oFtJg5hKhdV+0WRkiBOnQ0Ud
	2nvAO786MrjA2Sf6lJw6j7c347d4jk+G1i2l1sDIDe/daOpL4CwZMZWc+dSJDnP3sq9u38ZuJbgp0
	70nNb9iyI+EBXBRDsmlk6LMNFFGQm17JKOvVFvaR0eFUNIoWdbj6AEj6pT44Jh8fyRNDg2U/TCmWp
	v8qe4clw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtc5-00000005LRO-34t8;
	Tue, 09 Jun 2026 10:23:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtc0-00000005LO4-0Uvz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:23:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vgVx1868192
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 10:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e6543jtmJUE
	4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=; b=XJxaiRNTSqd5roaNqNiPS/EZIgK
	VJf1nzyeNjzj6k9/oSLDrjylCqGas0knhhYoN7jc60SCm/240dYUnQE7Wf9TNmw8
	s3N119IvtVzw4GTDzgDru2+CFBJejd2MDbI6mRcIXK9GTS7mjtxbW3m63kM7KJhF
	Y79Y6Y0A0xftorUVp0+LU8j0cVkIOHRkwA40g3JQW2Aq6TXBY8F5aeS5JnHuPfaf
	YITLG8+CeV8jOApDzkayCjrrZtfudZD2K3FT2bzaLiJkBhAcgdfUXhxvZ/Kc7GVi
	iF+ZtNY24EgC7etkf0Rppw55RwkYtzYhkpDciNtLikijD/VHZMan++4Xz9w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdees0bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:23:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf11699875so55576025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000591; x=1781605391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6543jtmJUE4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=;
        b=kdH/th6dIJ+R+/Lfrj5MTUreyXEdsmBRnd9aGPQe6AKFezbN4HCqBLTGQkYVl33m+R
         a7q2J8if8Y+pEX4n3mVV+EcnlxQZjPP57lo+2F9vfVuT8SF9VNfzh5ylsMMvnyf7704Y
         rlV7vNLcUynwSih/Tl1dSX78uQsNhQZ+wQA1KUrmOxpnZg0XxWEBx/QBVaygOL9gJlM5
         nPjFXj9bPoWWiwNyBJZbWyRsvAcxqeFYYe0Y6MS9FRqbBKWtcBX9emSRjmmEGvYmtUMT
         X2241P/ha/Pgk2lY+XLHPrG3ndowb1R+BX2tYLA9aeb8U3CsDhNt412FvtpaIS29EpmJ
         9/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000591; x=1781605391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6543jtmJUE4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=;
        b=myWI+cNVu6isUvrMnDQBf/7nG/dmsMXH8ms6aeaiO0h93qx9zDArI6V9IPoYg+QjKD
         0AQk5iXkNIdnuBkFL2we0gbfY/dOZMPvHNczN2WTiR34tNKj0Jrv0Hv1H2/1YrIRi0yv
         OOZoOpAI1eDGmzqQ6dznfwzO/TDOal4B0L5NmGwNSsV9FclvW6QNf+E1OquxRcpAtJ26
         pJn/FO8yTCSkrk00BguwlCH5d2RHQDNBNBOVBFORpDb6FXjkcgkoX7wfYCLjnlKMWBRs
         6wpwYN9+aaf+BD9K6/W0gYUdRJV62+ROduYpg1+vLGkcnvmNm8Qy+pBYAuIKkfXUKTtq
         PRWg==
X-Forwarded-Encrypted: i=1; AFNElJ9ISJkYIqeXt1zgprVF/Rl2bNsZzBB0rRkO8QNT08DJvy8KWh/kPBS9US2KyLr9H+SREsXbd9m+bltzbKzwTt6l@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpj27YdVYny10eSJl/TPJvGKoXuHrsSooSgoN2809b8GOXYfs2
	znk+j6DMbweAI3xDXGzPp12FS4WYY8EHFwTH1XKgvdEwVyiOWoBNSa0V/qkdX74gaKDu0W1WUoJ
	Ch9z1hmaUhlio2LQVq4r2zX7frxAtPQ21hTO8LqmN7J+R6Z8aAVzaRix1Gs71f8ErgQXV1osxsE
	0TyA==
X-Gm-Gg: Acq92OGafRbIhMU1pL6fwbwzgelXUVzp6Bj/FDX+LiyxuTqy47wkDVNcJZEMJ2EXCjm
	8yvWD4UAsJ1yFrCuaMnJEFETCnYOTbYVqcbXSVW5BhZQzmGD479ynFMjjoNvF6hKJUaLEOyrvkC
	PFYlqN3D7DSR8fCZdVIgKM0TPAD5UJk9vMn/zMVTWQpWCuDm3MyMzPwxF6dV3341rVTqe6r9CYE
	L1ulVdreT4aXp6xp1dAClt4OUPMME+UVNS9jN/T1PCpwcbZ9v7NspUeutnCFX02qKcWjugR7npT
	t+KvjaaLX7gImSeEccz9I2YMULZdBJPJDBPgTTpX33iuRUMXY5PsB7uh3/yclM6FFL5GX0HXfBR
	YWQEHmlJH0OsN4VesteLkdqKS75fPdS5//TCdFKGqe/8nZFyNjn3jAjQ75/Q=
X-Received: by 2002:a17:902:c403:b0:2c0:c262:b924 with SMTP id d9443c01a7336-2c1ec920ec1mr171681635ad.13.1781000590916;
        Tue, 09 Jun 2026 03:23:10 -0700 (PDT)
X-Received: by 2002:a17:902:c403:b0:2c0:c262:b924 with SMTP id d9443c01a7336-2c1ec920ec1mr171681235ad.13.1781000590335;
        Tue, 09 Jun 2026 03:23:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/3] remoteproc: abort subdev stop sequence on first failure
Date: Tue,  9 Jun 2026 15:52:52 +0530
Message-ID: <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27e98f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BqsRjhFJy6yuMY8SxUQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX0P6lPZwQTC8u
 dl67ybInsXg33EGq9RpCWyEAl0LpneJeIULqMm3VJp90a88IMmjb7of+NnzLo3+p1z1lklDoY+K
 xXcojsNFfVYbpRvJddVmovfs+a/cXJt2TOz/UKGycwjyd3BpO9VMpZ/Wi8rkU/vN0NFNXe1p64h
 G3ils6eN9maCiiR0RlS3kHX1ID6fGFddG++sossj8y9TyiORqoxKgEVCTKNSDu3sJDQj4IjI+l9
 z33xtyWuvil5CcfNqJQNZxOazOzr4v40K5azaXUiytTaXycPStkSianhfJEAYcC4uqYC/04NTAG
 DIjmTvb8OwowSKeYiVXzQn45WT2km7rGu1LKqt0E6pOhgfHWhoDtjsAdKpk7Xfac8M68G3r294S
 5MfttHhKWC7bQN5PnLEOObjHkHdOpjx0utHU2urcxnOb10oBH/Vy3tG6s0jLC7XtWpJelDSZWLT
 SqtXuup7f+3Y4sXSbxg==
X-Proofpoint-ORIG-GUID: FmxVrSQwrJ2DRlUOgzYA5PCsO9pMizD6
X-Proofpoint-GUID: FmxVrSQwrJ2DRlUOgzYA5PCsO9pMizD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_032312_192451_E65FC9EC 
X-CRM114-Status: GOOD (  17.21  )
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

If a subdevice fails to stop, it indicates broken communication with the
DSP. Continuing to stop further subdevices against an unresponsive
remote processor could close rpmsg devices that could remove the memory
mapping from HLOS and in case if remote processor touches those memory
can result in SMMU fault.

Change rproc_stop_subdevices() to return int and abort on the first
failing subdev. Propagate the error through rproc_stop() and
__rproc_detach() so callers are aware the teardown did not complete
cleanly.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 21127d972bff..77c4f09c7604 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1110,7 +1110,7 @@ static int rproc_start_subdevices(struct rproc *rproc)
 	return ret;
 }
 
-static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
+static int rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
 	int ret;
@@ -1118,10 +1118,14 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
 		if (subdev->stop) {
 			ret = subdev->stop(subdev, crashed);
-			if (ret)
-				dev_warn(&rproc->dev, "subdev stop failed: %d\n", ret);
+			if (ret) {
+				dev_err(&rproc->dev, "subdev stop failed: %d\n", ret);
+				return ret;
+			}
 		}
 	}
+
+	return 0;
 }
 
 static void rproc_unprepare_subdevices(struct rproc *rproc)
@@ -1712,7 +1716,12 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 		return -EINVAL;
 
 	/* Stop any subdevices for the remote processor */
-	rproc_stop_subdevices(rproc, crashed);
+	ret = rproc_stop_subdevices(rproc, crashed);
+	if (ret) {
+		dev_err(dev, "failed to stop subdevices for %s: %d\n",
+			rproc->name, ret);
+		return ret;
+	}
 
 	/* the installed resource table is no longer accessible */
 	ret = rproc_reset_rsc_table_on_stop(rproc);
@@ -1751,7 +1760,12 @@ static int __rproc_detach(struct rproc *rproc)
 		return -EINVAL;
 
 	/* Stop any subdevices for the remote processor */
-	rproc_stop_subdevices(rproc, false);
+	ret = rproc_stop_subdevices(rproc, false);
+	if (ret) {
+		dev_err(dev, "failed to stop subdevices for %s: %d\n",
+			rproc->name, ret);
+		return ret;
+	}
 
 	/* the installed resource table is no longer accessible */
 	ret = rproc_reset_rsc_table_on_detach(rproc);
-- 
2.53.0


