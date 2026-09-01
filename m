Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238AEC624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkXEEyAJ+Z4=; b=VQeWs0bSjjmAceTOeS8jn0A/hO
	EBEotSmv6Ab6u+7W+WVUSELTDXuDmDrK/3HB+00Si3CBTGUfRu3U9WvUzrZq6zJ4/2ZEWqS0AUHyM
	RyzokUbYVPrtsn7a6nnMt9FF720qveEBEXDO7Bb5V69+IrCjmcQF3U7CtP7tV7yI82GxjLX6rFwG5
	j1l6GnXix32mRjQi8j50YQ7PBCFLGRH2muszELLU/7kBOSdLUOdzReHhUBoGSTmYy3yglWaEhwO/R
	1mhSmg4lk6sO4d3BOUnkn4ZyMgvPlJ9sKQWQ7nQyKw/x0F7kLKBzN4Amb3E5Uq1Pi1AMa/xx853I9
	a4433URA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MS5-0000000BfNn-3dXg;
	Tue, 01 Sep 2026 11:14:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MS3-0000000BfN4-0K6i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:14:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJexJ2141678
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 11:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkX
	EEyAJ+Z4=; b=WvUjuT5j9O9In+1uCfnTxeQXglqvDe2asBOYuOSCjov7R7k2fyH
	EjiDrCgdbBmgMu7ZhI50tOl3EPNlxyGKbz0pHbVAjBPfbSCV+83BBk4BDDzw4fGp
	ql4XRmadbi3Wo7W/nPe5ywg1aq6ZImMTfMxiW2VTjFY3Cqf345jDhCvOLpEEk49l
	yOLE/WWeu0W88kaxpNt0GzCbaqa9rZB744DzKzZa7MpE50PoywUAkbdgaRzejVVG
	P9TmIrjr241ldmzE/rzf3TInHL3uCBFj2GZOnWjILyMb4RAPFD2Oh5v8xpah6hue
	NuVJAFAdJRn5WhFDglQYozsRNXqBRd1OQEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsy12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 11:14:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93915f50a5cso193141285a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261289; x=1788866089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkXEEyAJ+Z4=;
        b=D8c84Y80DNyvrquoPy56fTbNWPxIGA35qiJOvjsNogjvRptH0I+69ClD2YCBjOzrCJ
         4bt5rzKKZIo0lDaHZWqPSHxdq4qXFzDrlghc9/zU4Qo8agp7WkTU5ouE97aGtB1KVANJ
         /uDDKTAQhc659b7lL1IaQFu6c348FTkDXwSMFOoXE9pvsJvFmvpt0uyuQKfwmXpXnK7t
         5Y/v1qjASJ9v8qVOIg/1SyZh1mpifyZ241W+qKC5Oawwam08/QeTTVuV1zAUA+Muz0ZR
         XGk7sFmKg5PEMFfC4epbVj1dgUXhvvFwQA3uo8DpTKExLxy+NKoMe6JKkVQ1QS1+K1xC
         LzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261289; x=1788866089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkXEEyAJ+Z4=;
        b=FBKUgKo5xQw0h+zwZhtb/DqsB265OvAP+A/f8/Ady3DaqQ97FeeEWyucZHjpD1ceLy
         7ELDkBY7M4LS175QFley1IOwiDhBsCaFarur0P0S4S15IGRTcCJpr18nzYrDxvNteVfm
         qpqYmr3G9jDNJnBQQu8sWW2YG9rbjgY1fGUu8amTxy2n+UOTy+QavVfoLC/8qycwpWo6
         UYuwG++vjBxbLoarcQznS30mpUp4rZKJm9+bUGfGlITJ1sI61oyoP51gs6hPLZHx3INr
         a772elGMKnDLJHxGPuiIW1OGc/WOEHXVwOMmGM7svDfd3iFANxLvCJH9Amh2SySq9raH
         mzAw==
X-Forwarded-Encrypted: i=1; AHgh+RpohWXLcDJUbjxicfA/4nl9XgDYNw3/6Q4gzXn5MnpK52mT50j/31FlCtgaHCzL2PqmnyHD0Qjk9ldxUFT/I3wX@lists.infradead.org
X-Gm-Message-State: AFuF++nkYsdeunpiTDBZKa2sWpVR+9o14fl7v/zMa4B1Ue6YSI7ecMZ9
	7yreMvvIfPSL5mH8B69sUyyPJBO4ljf6o8lmC//Xb4HE9ebnG30PVXrXi53vXzMvVpdcHkSyRz+
	bIpbZqjUOciHVXI2A0OJoe8zEOYWYw0crY3jcWasIY8VgBQVaxILHqBuIIy8RmKVKBXBF98hifH
	3Cig==
X-Gm-Gg: AR+sD13L3wK5b0IxJcX5NTuswPcD8lzmLJrZkDhmdI9r3MEWs/EKoF9UUfXB2TmULx2
	DeNG++aABMpPjJw8AeeUN8Y+fe90JO3D89wXyH1+3P5ok9aKhqR5ULbkLSZ0tf4nTsRrab+BxUK
	HYjdnwdK6Ou73i2K7syieacNlcOxGaOq99zFThRF3Lmyag1AYwg7CdhA0Jw+Z27Ex/lAoMca1HU
	pNO3TUgWWMdgrUuleCt/FXf547tx1hCcnsmcWOo0xKIfilFYUR8LA+ewR/9K1Din994mIqxKPeL
	gPhD0b7ujWBcCacBjkz/5hhXMw0iC+fgtXFgTEdYY23j4cge41k3o8svp8GThSdwwj/wBOJBc1z
	S8uyNmVrmFtkoRxieCowyta+0I0fOuGOLBPm+FHPy0OdG2ocko2tAjFN4SA==
X-Received: by 2002:a05:620a:bc5:b0:939:28b6:86dc with SMTP id af79cd13be357-9394bcff0f4mr452462585a.17.1788261289188;
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:bc5:b0:939:28b6:86dc with SMTP id af79cd13be357-9394bcff0f4mr452456685a.17.1788261288648;
        Tue, 01 Sep 2026 04:14:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:47 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Subject: [PATCH v2 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM domains
Date: Tue,  1 Sep 2026 13:14:03 +0200
Message-ID: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 09kFKauqhL-SvbL6WY0uDzxJjgK8y-TR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX1S05O31C37Hl
 u51s/u48Lh8JCPaBsfvODzUZp8avoKpft2Gn9CGO/g5BcuxktURetvtVnrexZ7kAjrPf8OOWfFw
 u14tAJGtikGkb49F/P5g5/a44qNEJk0=
X-Proofpoint-ORIG-GUID: 09kFKauqhL-SvbL6WY0uDzxJjgK8y-TR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX/SsAa8eYjJsk
 GwFQTXYX8b0ljmBxKa5aEUHPEoUfEMDMUOmxGLZdyBB6VrVP1mzLQq4LAK6f2J9QYvQFQ8axQVh
 sP3UFXekU4ISC71u1ZADC/GuQ/5bAgjAoKdeE4Q398qEGWeHyQMdeKOozqoH8pWVCI04OOMT9v3
 RNY41uM6zbALLSLdi+VoymGVdxM7EY4OvcaBpgewsx9jKE78P0ZfZdBoC+KDhEIcT4BAP+j47A6
 CvgjrcuEGWNZU43kPyMW9QXl7VLhjjnaH3m8yZnuKcwClxVqvrAQk3tmOzc+/Cywpiuf8XHI08G
 edu6BUWSWte4HhVmYIPNebiHUTCQLAihpOkla8voTcJoWS9ifodD5h97eWTEjL4zZILJsxN4x0G
 pGSF1CgWsG5OFQYlCiLCtypj6FIk+Jkib+MDtipUD5pMyMzUcsemr9271Ww/++gpIHginHj3rOP
 GJEy1wozAgQwgzCFenA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96b3a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yh3ps83G6N8KMOvRL6AA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_041451_256800_5834F077 
X-CRM114-Status: GOOD (  16.52  )
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

 drivers/cpuidle/cpuidle-psci-domain.c |   5 +-
 drivers/cpuidle/cpuidle-psci.c        |   2 +-
 drivers/pmdomain/core.c               | 111 +++++++++++++++++++++-----
 include/linux/pm_domain.h             |   9 +++
 4 files changed, 106 insertions(+), 21 deletions(-)

-- 
2.43.0


