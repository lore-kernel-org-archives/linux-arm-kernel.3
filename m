Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E06C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W3q7tfKJsiKeauJNfR3vMrN+xsb14GxldWmwVaAbL3w=; b=Jlu63IIRgxRVyxuIcXzAsig6rk
	vOd0ZeQ6flMjWd6d3cbnDByxfxei7qycTkTCSgY7G00tIxuRbadZXd1twKPbEweyP1LEJy/1OdiIq
	fgHr8H439LUkq5EZOVO84dvuKPHj8LRKsPvOe2wBcDLsWrdp8a2SuKMVWjxOSck1ZlW1VCngt13Mc
	qZ1U9P1NT4kXp2dDS5W4x52Gps3uvcOGfjMVqWmbYupqpIqXJOx3Sle+pqRSUTxPf58ibYSnZ9LhJ
	NaO77NYZ8oQoKxMb2Yy1DAHAU2rcXF92ulKHTalQ9fE08sA+uEUon968EpL8QqSpGC0JO2SV46v7f
	an0U9AQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwi0c-0000000A3Xq-2eEm;
	Wed, 19 Aug 2026 15:15:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwi0a-0000000A3Ww-0VVS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 15:15:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2ZfA1173980
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W3q7tfKJsiKeauJNfR3vMrN+xsb14GxldWm
	wVaAbL3w=; b=LL8TthI91jtL0NnlqqIXq6SsBuXq35cGwwey3QUn7MjSyfyI2bF
	kF7AO4pJD/WNmImaPP4ItE4tJefrBLsZQgwcVZy8BcVi/VwkyA5PG1pUvR2KtEnb
	czYed+1rUWWz1PcfmXcaRI8gmnX9tj69Ge0wOQ07k5FUuG5mNCz3O19kPCTxAuxF
	91x9vcOTFFmATyTHuZ403Zpu/xKaiBZtQmJ/kBmNguiM9VnJDR1kqyImAn9T17Zd
	t4Iqy0B2ItO2Uw2Fr5VwV57yHmYx3N88Lm4I99xr9jdCWXdR1hDtQJP7BS/7vTHX
	QOlDiTB4WbglCv4sU53DYDXF8hjW6S1F0+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj01xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:15:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso137991585a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152514; x=1787757314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3q7tfKJsiKeauJNfR3vMrN+xsb14GxldWmwVaAbL3w=;
        b=ktO56PwrFw3k1wvoxzBO8pLF0oegOst/0n6zxrUusW01YsTwN1GyqmuvpbyuyBRCwv
         9CflhaaUIIsw4vEQnWT2AnF6/92rxR8snt701GSHNbH/YJL6xzzGhKRBfjGs4uOfzGo2
         m2geQEqW3aYxIFPB5fqcB8DIp2IAKZsuQamth9BvhsO+vl+L8JxlSHsxu6Qg+uCmQTwv
         pQuHy83OlHqnKQhlKp+1wpZM2ijmAzKI2f6ImrWGHIln62oXi3swpmNNfMZ1P2yAk4Q/
         1ooIz7uP0pZRQy74u7l5USxGemgsnJ2kSyYf14GNnouiDl0Qrweod4ZS5jo0v6E+FTUs
         Kfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152514; x=1787757314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3q7tfKJsiKeauJNfR3vMrN+xsb14GxldWmwVaAbL3w=;
        b=dHJ0Szmai72ytbzXxo3RGCmt0D0nwfWmWtIpSYP4dra3qdyQyFvzUcAdBMbpa92Wkw
         BtLCmsPdPCobuLyl8zefGFA/gXf295pALeZVSunaa3R9P5XpbLeetnnOGDWmr43Q9283
         eaWkvRV0AGnA8CcoJhVxi9+GDPHP8rinY9a1foddR6S9vrM7PnmxUmgaleaOovEmFE2H
         K8JcIkD58pm8fGq0LOn978IPV22ugPOjaNvuKfm6pCpV+iOQo+CyseOiL/+P1WjZ4Bhf
         2/V+e5SZ3yFBnsrn7YTtB3ilBz4QsFgPhZQnmP8GsRordtwOKKX+sRFVeO4E2a0ZuuSQ
         Nawg==
X-Forwarded-Encrypted: i=1; AHgh+RpLh8kw4Ll/Ca8d7jrHr6WyHt6n7DYjgLxCwcBnCF2PVayOjkjPtMI5cMqWKq6tigsGvhh0vlT31UpL5pXvFZCa@lists.infradead.org
X-Gm-Message-State: AOJu0YzRlsHsYlYd4ZlIazAnYdXoa3e4ZYkF4m92be4FyMmgUqAX+3Vm
	wmMeXtfrHvJmtZ+7n4VMiiApDH954DHY0h4Rv0p2pN4PeE+xV/f5IlE9hjjYzd1CCgD7DilsWlW
	vMxuKgxSP1oYcegoOsk5T95/fBx8l1FfXW5cbOJDnQJdeERCHkVfDYIDJW58KqBWh3goREUVVNu
	mXGw==
X-Gm-Gg: AR+sD13NTuR4gkmEikAxC7n5LDqyR7XY3z0OTiVnicazP7xMJyP0iKFtL0PlHQyD9H2
	pQgQK6llAobxjt7W/6mCXH2DpXChTr6wrufHC4C5vyc3BaWmWLROuMZ1C3hd1n66UQcror3XZo3
	lr6b6S4+lxi3p0+Cbp1YogF5LWnp3OJm9EsH5Tgm1fATsOdcUM2GrKAuh26ALMvcKTvIXw1CLZC
	lBqCH13+SMiCx0A7KReb4P5HdUsuAg443Q0Juk3tXS63kE3JBjaXV6XaM5BvZiDfkhwUleTzvHq
	so2UvJEpcoOEN7lTo8u3g+qQKe1cPe/hapXCJ6DAdoZzDM55SKRK1lViNiDezCzw6ZGq5qBblDN
	QpVT+kAOlGW4RUJIV8kZfWnyi/qaGsDDq/nBzIPdqhWyH8m7auDhc3UrxxA==
X-Received: by 2002:a05:620a:319b:b0:92e:e3eb:de54 with SMTP id af79cd13be357-9371e21caf9mr551848185a.11.1787152514021;
        Wed, 19 Aug 2026 08:15:14 -0700 (PDT)
X-Received: by 2002:a05:620a:319b:b0:92e:e3eb:de54 with SMTP id af79cd13be357-9371e21caf9mr551834885a.11.1787152513400;
        Wed, 19 Aug 2026 08:15:13 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c4ac06asm94124666b.33.2026.08.19.08.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:15:11 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>
Subject: [RFC PATCH 0/3] pmdomain/cpuidle-psci: Fix behaviours for CPU PM domains
Date: Wed, 19 Aug 2026 17:14:50 +0200
Message-ID: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3h_Bysn64mRhYW2RaZLFGh0oFr1Qoshf
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a85c883 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yh3ps83G6N8KMOvRL6AA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXyCXGZ+4cjMRC
 3kJ5ZCTaQADAz5+ObE5LTvE2QpHJVHDTlE33dM8aXw3vNIWz4YUHT/eyMw9t34EP9dX1AdcGzOj
 xHwS7vqpYOTAkl7+KoBIOPJ2B334GpTaIlLKUIy2s76ImHYrSTjBP95KAJJ7VFJ+PTLrRbBedNF
 MPpux25FfCogNUEbBNMyE3FPDfNPdoBqp3kutrgBe90SZ7R2w8usBBIGfwURb122wVbYhkigBSM
 jW8f+y3IXbbPKT/x5mWBlcnyQTzNUFTLIKjdCByift1PKfJKoqRlK9LJPTBI5XdPhE0IogWfmm1
 BtcOm1KxplviePFUjrUJk8QupvGoYgUr6g/KhXHuvsgjdNpP2NMpBfPftpIeTDJfhC+XGhf6n1w
 TvjFgix+O8wV4R/QmTAh2iJ8y3YWs9Q0FFdQENt+edw2ED03WLRKl0HxCv/7oHCppJYwv1J5T9d
 YP6UYWUAYhA5bONotgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX3GG/p2kzUC8+
 Z5Ei78vWCf13Yw7m99wuetrM1OfSTe7d/PXmxSkbPPD1LZr+hPFvJDZ3kdZtdI98+yyWJP7mu0M
 aeJq0HqOdI5D56jQo3XovqDyHYjLJsM=
X-Proofpoint-ORIG-GUID: 3h_Bysn64mRhYW2RaZLFGh0oFr1Qoshf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_081516_167992_B7F86DEE 
X-CRM114-Status: GOOD (  15.08  )
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

Note also that it's RFC, as I expect that it needs some more testing/tuning
before it's ready.

Kind regards
Uffe

[1]
[PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
https://lore.kernel.org/all/20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com/#r

Ulf Hansson (3):
  pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power
    on
  pmdomain: core: Add a genpd config to support unknown initial status
  cpuidle: psci: Initialize the PM domains in powered off state for OSI

 drivers/cpuidle/cpuidle-psci-domain.c |  5 +-
 drivers/pmdomain/core.c               | 86 +++++++++++++++++++++++++--
 include/linux/pm_domain.h             |  9 +++
 3 files changed, 92 insertions(+), 8 deletions(-)

-- 
2.43.0


