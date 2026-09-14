Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D568C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w3I7ZHwa2TWLK0R1xsdo5aKYS9oayr/enWu2u1S/sog=; b=dnQHSYkbkJiXoioFxpcGxDyrSL
	2wjpiGQqptvZps1Np7OAEXqdJTu6gDeHBH5WsOSDIl64Npkdni9zaM6wqLT/ImulYm4dXr6KhQVfs
	gBBWZE+mim9siBii17OiJoYJx89fp+xCnShi+AYnXowMryC31bKq/DcpvBX+kGAnSqMroV9HcS+mz
	sYqm1silJRf5iQCp4foeTVFwp2q9DGQOk6qqwFXc9B8OMU17FBGlEt+xfSaCnuxzMNGucD4tXJR6Z
	x96ENSVnJwygY1+UvlNpNv0RenS0fJmcKHXhFjmHX0mGewSUot5DHJwgyTF/oFD439EuEeqbeTo1B
	ouJL1PGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68C7-0000000456i-0R2j;
	Mon, 14 Sep 2026 15:02:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68C0-0000000451z-2BUu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:02:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0X823588180
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w3I7ZHwa2TWLK0R1xsdo5aKYS9oayr/enWu
	2u1S/sog=; b=A7EQUVmNUSQvO7c9kHhQ32lTJyM+OhrsNh9fuDz8vWDQSfbQL9F
	WYkAZLJ8ezjtoROOdRJjI3PSM8yZzaD/YyvGZkzY6zdBAFRTbbryCFDlEzAy6mtE
	plSU5XQ+r8THL7ls8+yD+sJXVZLH2tqX5oqR0/FwSCIBX7y9bBo/MX0IPVj1SyCu
	fyrHopAk01RNQqiYWQH/rxxj3JrX1sdXMQrGI5fLoC3BbMVn95t/7vNFEUNhldV4
	nirmBVS8PtzKXoJ1g0bTEqTPVdgDqSIKPHiCLX+ZHMobDr7BLfn3POqT+Ca3JHZQ
	UOkrIxjO18qkMkns/A3mdz0eIrUxX0dqz6w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg97h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:01:55 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78d25a8ff32so939535137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398114; x=1790002914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w3I7ZHwa2TWLK0R1xsdo5aKYS9oayr/enWu2u1S/sog=;
        b=B1g0bpMeSTpGi3Vi1JB7RVCwogl2rW/c3LUhqG7zH16n+wLXlAJWXFi6Ccq8hJ5ElI
         5WXIhUlxeI5bLnb86pnRXMBM+jRJKJVaHVeacwLQG8f2MVhFhBDYIHROD4+mlaxz69ZY
         pErVJghkILxBi2bPmVZPR21ma1d8DKfmQfZnSjtxb9PkWbeNd30ClCkld15NMu0vI8V4
         dK5kFp2wZCNb3Z5P7/sK031wDaIQ83WFXgOF0EDe2t9O5y1qDU3e7cnYisaSQOYseTgU
         6+O4oTlySGfYUZH51YfNb5b8s5Hbn80COoGx9MhzlGgaNt7/HZplNpbO1B/SMX3FC9Va
         Th5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398114; x=1790002914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3I7ZHwa2TWLK0R1xsdo5aKYS9oayr/enWu2u1S/sog=;
        b=Wu5j6YKuzh5L0F83m0PjT5jWXQ7QBMO8JGjwwoE5JinCVBUIWU/QXgVuSvJSxhucy7
         A2fnClLge/pf9OeDrjuIWF1dw1yFR+k+IqsQBeFTg9+wdbOcTxkmKIn4rPa2aMqlE9zE
         D5KwnRuVqMPMIaOSydF8J1x6tRaLjClhTQv7eV44o0cYitRbfMf/IvYmJQYl9MjWjKuV
         PmYNKgZ5XpkwP3Xrep1BDR2h1dDRAApS86kbYUJNskWHxzPZePERgqIOpc/a7KMZi8pw
         Wr7Wvf4Z1v1s8vDhM3CrgdNUgC0ENgOyNYy8qlh4TAxCUT/giruPMYpnCXeED722BfdD
         OYlw==
X-Forwarded-Encrypted: i=1; AKwUvBziYjKgwMmOnWgFgTDpsqMYQGNuvqdO5KtUlSQuY+LfZhbOsURpVD2On+KCTFdpUtIidfOcwmWhixd31kmwi6Wf@lists.infradead.org
X-Gm-Message-State: AFuF++nirQJGyLrg/Xf/LUoGV3wGMWH7/b5qAa8yAU52msjBmrL/CfH2
	5/o3U6VevMDryosF9UdI9PumF31vVxLICgvqKvG2z+4ZEQgvlc0NTAVsN2NkmpjKLqBNuNSSSwx
	skLVj8HQJsaCtc9cDHuD0u5keafTOLanI3U7iOe4iuwvPuXVS1loq/QsdXzrYY92U4A0lRSWRyO
	kBnw==
X-Gm-Gg: AYBFou2FkkZxbBdOd5vICXAPw5cSxgTQekCsbSA6+WeGV2soAtmeNu6lmaxHfNeqgsz
	6DBqiXwxp/EzC2z0zjWJlded7jgB/MPgxgIZA0CGDD5iNQoxbOLxNMmR06NUHKWkuW/N9tg84qy
	UHmxJA/m4pxNusIdMOxtBv7sC1m06qf859o82IgXjVAppQ5aILOqnK3Pl2c7RlQi9tO1k/34yoq
	rQmH6sOOcvi7Zxo2YbxQXkSV5FpqWkDIDC4hmIMyjqNpsirT2M7xS/pB/FkknuCaaMzlB9jy6S2
	IHmhbePFsCCU74pX8552joiHraUiFvRc1bYRVRd+ja6xkHxLuuet8nKmPpwrIBKCtJSDaZcn4bv
	bfOeRhycQY9dt9HAiFK1oJ6/6uVCNQDDexjEiRhqM77UTQofZ7io8Wnu5xw==
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78dmr2828426137.7.1789398114077;
        Mon, 14 Sep 2026 08:01:54 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78dmr2828234137.7.1789398113208;
        Mon, 14 Sep 2026 08:01:53 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:52 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Subject: [PATCH v4 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM domains
Date: Mon, 14 Sep 2026 17:01:36 +0200
Message-ID: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa80c63 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yh3ps83G6N8KMOvRL6AA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: lC17iIkUuHxwWxu_ZLMOdFRA2GJyaiKn
X-Proofpoint-ORIG-GUID: lC17iIkUuHxwWxu_ZLMOdFRA2GJyaiKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfXxAw8In1abhRm
 0l5QFQfSSgoR0xQ6dpr+q1OSc/oVeFLtcmSJ+sec18XNggWyB1NMTqQvW/nMMoQTMuYGTNSf4X2
 aQxXhgLm9b2pL3hIPb4U/6LvCMKMCzIsrV9YD7L9ufMlyg+PpO1W7lsDttF+0QnTnH1pkqd5Ncl
 VrlqgkN33HjI+O0VQtyAkcSwNvtbYqOpCZvsJ9/tDdC/A2DiUpwRoLZCAYYyvbN+GHA55Voksbc
 Iir8TIaXF0U4rBkTRp/AhbtOmfT8Zda08zBQ19EITYF8W8ts5CTbjIgtNGWx1XCRaO/B9zUmHB8
 S4POURknORifejTN5699wNBJos49qhIAMcIsiY92GwcOmNzidff1/yDMQKBm64v8Ux3HBmtPTis
 PDlaoSd6NO4Mr7Zi0oWJqLnz4Sh79Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfXz0S1sAEMTBeT
 rC+aKpDpUEWGHdWkT51k2wQ0C/1GlkFW5ysAavQqIBtlQGKY7G4XUpW+6a9eeVGABV0S+AsqtZ3
 gsJBNMayM2dylxg+jxux62JEH6gLe8U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080200_572060_DAA03B1B 
X-CRM114-Status: GOOD (  16.06  )
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

From: Ulf Hansson <ulfh@kernel.org>

This series fixes a couple of different, but highly related problems, when
dealing with CPU PM domains. More details are available in the commit messages
for each patch.

Note that, this series is a follow up to fix problems that have been pointed
out in a series [1] from Yuanfang Zhang (Qcom), to add support for new
components for the arm coresight subsystem.

Changes in v4:
	- Updates to patch2 and patch4.
	- Added tested/reviewed-by tags.

Changes in v3:
	- Minor updates to patch1 and patch2.
	- Added tested/reviewed-by tags.

Changes in v2:
	- Dropped the RFC.
	- See updates in the changelog for each patch.

Kind regards
Uffe

[1]
[PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
https://lore.kernel.org/all/20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com/#r

Ulf Hansson (5):
  pmdomain: core: Rename genpd_status_on()
  pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power
    on
  pmdomain: core: Add a genpd config to support unknown initial status
  cpuidle: psci: Initialize the PM domains in powered off state for OSI
  cpuidle: psci: Move initialization a bit earlier in the boot sequence

 drivers/cpuidle/cpuidle-psci-domain.c |   7 +-
 drivers/cpuidle/cpuidle-psci.c        |   2 +-
 drivers/pmdomain/core.c               | 112 +++++++++++++++++++++-----
 include/linux/pm_domain.h             |   9 +++
 4 files changed, 106 insertions(+), 24 deletions(-)

-- 
2.43.0


