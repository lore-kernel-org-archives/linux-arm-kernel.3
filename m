Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C152CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=; b=qa4xGIfXPAiq42tnbUwoi2wrQy
	Wa+S2e9TED5WPgdbkv28m+2athB6V5ijdO8mnTO8M0ahUryUZvYG0mIaqPYxe/jrsci9ohBSJhWoq
	dlFfuhX+qaGvqUMAc6fc8D0iGuYJHH0xGnCYPXC08LtdQ8evfEYF9CyUS9/+MYh3EJVWP5InM45xz
	LnafBbCiDYQbnGF/fN9Ri3IDTQU3ZbWea/cG4dM1Xrk9hH7snIsa1MK70YcD+xQiEdZ+bQa04pebq
	BQqAYahEWqflfn7tHmoUm32ffgkGUlAqWqMsIbzZG+rm6yRADFKLPGo3bd/jdD4TFGGMwBakJuitL
	b5kMDT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtbw-00000005LKn-1epZ;
	Tue, 09 Jun 2026 10:23:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtbt-00000005LJd-1jLN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:23:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xTMN2287646
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 10:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oGapPqde/L8XcWbgwW8R8f
	ZSYz2OachDKg2LbyV/LTA=; b=oK1vEgCwMRWmWTdRU+YtNKprw5kl2WGsT2ZTwe
	5ysNuCmaARcWHlq04CnAsMhVuqEuScYuJIgau+RL6AS6T1/SNrn/O/UyGAMfOJDR
	li+aozatQnJUL1PC6/geZtl5VcqjrevGJgGaHFSP/4oWmJuOS8J/RZ9LcLmx0gBi
	153WJkDPROS5loJgNSnGBWA0pg14sY4Wm9XWcG3DkG/RTRFfRGewubj8wakRuAOd
	EGskiursJ4hUYqAFDAh7LYn5LAdx8OtLJld36oiQXlmXBBg5mRUv6nqxrdAAgoMA
	Za/KXn36Oai48YwPHXJ2oShYa9iZwIVkHNj/C6YI/WbFVrng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rtq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:23:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c272e532so55708785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000583; x=1781605383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=;
        b=Txb+Lgn+U5wHhrjNLQx79qNDlOyyOKzC6U6aMZGSWbP0dLArHqQRCdAZjQoc/xxyW5
         ad2qi9NvACaOnyiPUTcrXOd6HXlR9FZSfYPQXwFdm54hJcDHYl5QHhls1/PtY7JnLP0u
         ONamuaPj1lKPiwvPBI6qXa8+NUikzCAMySEt8MPsBBedN742NLW/JW2pfJtzYFPUq/hJ
         02iRI+ABcfO/iH9ZSzBqiB5bWInbiNiiNqNp/L+vpatrv+MA4at8eZsR4OFA7Diu9rR+
         C49+bT2b986OQ8q9Vdt+yuogm9hpgEVbcdLMWYXHMhkvGOi06zddMGDJe+mQTy5ESz8v
         Qpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000583; x=1781605383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGapPqde/L8XcWbgwW8R8fZSYz2OachDKg2LbyV/LTA=;
        b=QyOOynfAiM9OfokWlELueRe18XHtUcXNYWv/8qKeuBd1igwwwsqi6b2EzkCZSWoO/2
         7+htsv4wl/PNlFcs/+JCZHNUi96k1UlUHoDxVg6aX6OJ7h3FbPSSNrJZ0p6RfeDWSgJT
         94wWp9bg8E9l2UgFShd7lw3i2acvHB2XjihGV0SBmqc1DZL2i/r2MfIRXmgJlq9EOR4T
         fAFqJEXPM7lh1J8KWJ/bt6BctLpcKsCZZYZslNZg6PyvPZod4VMx9AAHRhev+PhIMVdt
         GMQ/QAvlg5hiPmrFJk4cZk5AaFMUvcuJJp4KDz3XEIQtLDKfV1N9m8I/SDjoYFhbidD9
         NK5w==
X-Forwarded-Encrypted: i=1; AFNElJ9v7dt0ir8xTCtb8r9c4TGE2ZZ1xEdpXnQP87jNH7053rSIO2EnyMH4DUA91hMCppwU9DAbNksiLm3dW5SAbBDp@lists.infradead.org
X-Gm-Message-State: AOJu0YwMSzwbi2TWMUzE/j4RoG7zpmmJTt1PS16o6BarcZFSeZ7elOYW
	Hn0UXVZQpRzCECsk+kC1kYNpgdNIQeKSpl0sftQ76ZS9ljmD5SUn1FZUjweNaxZ0zWLxMgvCpTa
	oknEDM2GdqTUiWTVaXZ0b8TL56y8/Wipd6A7yXSiZMeRlM2/1uucRCAGX9iUXzUj60amOvl+Q2X
	4V8fErlB7g9A==
X-Gm-Gg: Acq92OFxOPzD/5MBKiSMqFs1Nmv9R4vmleq+nJfaPLUTZxBbxFmdhGHOcSP6PZgQYJk
	OY/s0nemFMwiIg0I6uHX2S02DRlFjcfa5YwzoVFnWQi+ZNhJVfoHITMIIZEILaALHq708fJ0AjR
	b8tMX/T7mRtDvMbWrqJW3V4jWkzU49rFOjYKbzhLbEGFKHoXmhuFtmWKaQqV6KPctuDZqYYOv5k
	MKnV1sgzr8Q76kJNIcO+cekhKxQfz72r5I84D6ltyHTXKmB5EfcLj4VZLT7jcxlmyw3lKB/bnuE
	f6+2eM1VEBvl4+JJU17LfGTn6dSy6vE2WDKw5VYhyD0L+cROwZB2sVPz8Cf5kvkaNhVtoKszR8+
	6UZB4kUJjeaUEq19p4iXfqtSRj+HNwir9VjcPOSBA+a7UBjAPjRyN5XWCGzE=
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr207447045ad.6.1781000582760;
        Tue, 09 Jun 2026 03:23:02 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr207446785ad.6.1781000582247;
        Tue, 09 Jun 2026 03:23:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/3] remoteproc: fix silent teardown failures and prevent SMMU faults on hung DSP
Date: Tue,  9 Jun 2026 15:52:50 +0530
Message-ID: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JqSj18dXjk5OKZ6D2BHLYHa0AujqsSo2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NiBTYWx0ZWRfX26mRuxp9xrAG
 Je0V3hjfrnsYGclCOrKaS38xh1zJpkqRK6lg30HhSjSQ1A1teoZe/yQi43W27SUT49y8pubbWi7
 iYaT/mVp47xU09T0emJgQHKAl3lZBsACAQxJ63xSFJEDVUur5ByG1k1CLxri5vPcN9La/1H2jQY
 53i2oxHcsb7k187tmxgKNyPkx2FN/VJzDwt6tNiICIH5WgFz553oyCWBJwZG6hJhRWnF4d8aoGf
 bj2J5hKP5eFA0FpM/BoZB1QSXkAoZ+ICV0RQ5WKZB6Sa3pakyKks4Sg0ppc72IiO3cvgpzejZRn
 8YHBPafw+elhbvFQsHisWNtr5REg/qP1GSrSSzVSL82irQq8wOVOgGZXaYLFG30oFY4ySEfKAL7
 hBGSAeEeVWah6+JY7lK4YNsdT0qK2PAecYWSfynlhzReQYqJJz/+VsmCVKKeZ+MSPcVJN3REHii
 0iH3wu+kpgbJejGx97g==
X-Proofpoint-GUID: JqSj18dXjk5OKZ6D2BHLYHa0AujqsSo2
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27e987 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=oORZlF2qDzti3-ymW0gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_032305_573543_A701AE53 
X-CRM114-Status: GOOD (  13.83  )
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

When a DSP hangs without triggering its own crash handler, a graceful
shutdown via sysmon times out.  Before this series, two things went
wrong:

  1. The stop() and unprepare() callbacks in struct rproc_subdev were
     void.  Implementations had no way to surface failures, and callers
     discarded any internal error state silently.

  2. Even if an error had been detectable, rproc_stop_subdevices() kept
     iterating after a failed stop.  This meant glink and ssr subdevices
     were torn down regardless, causing HLOS to unregister and unmap the
     shared memory regions.  If the remote still had DMA in flight
     against those regions — as is often the case with a hung DSP — the
     result was an SMMU fault.

This series fixes both problems in three steps.

Patch 1 changes stop() and unprepare() from void to int, matching
prepare() and start().  Most implementations gain a trivial return 0;
rproc_vdev_do_stop() now surfaces the error it was already computing.
Callers warn on failure but continue iterating (best-effort).

Patch 2 changes rproc_stop_subdevices() to abort and return error on the
first failing subdev, propagating through rproc_stop() and
__rproc_detach().

Patch 3 makes sysmon_stop() return -ETIMEDOUT when the remote does not
acknowledge a graceful shutdown request.  Combined with patch 2, this
prevents glink and ssr from unmapping shared memory against a hung DSP.

Mukesh Ojha (3):
  remoteproc: check return value of subdev stop and unprepare callbacks
  remoteproc: abort subdev stop sequence on first failure
  remoteproc: qcom_sysmon: abort stop on unacknowledged shutdown

 drivers/remoteproc/qcom_common.c       | 26 ++++++++++++++-----
 drivers/remoteproc/qcom_sysmon.c       | 15 ++++++++---
 drivers/remoteproc/remoteproc_core.c   | 36 +++++++++++++++++++++-----
 drivers/remoteproc/remoteproc_virtio.c |  4 ++-
 drivers/rpmsg/mtk_rpmsg.c              |  8 ++++--
 include/linux/remoteproc.h             |  4 +--
 6 files changed, 71 insertions(+), 22 deletions(-)

-- 
2.53.0


