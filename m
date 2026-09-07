Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503C8C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hx30CqPRS946wiUAi8sDP3gBPvcgRjJiuebcFUrh2Xk=; b=Gqek1lFjBdT7ZjMxoMV23HNU4Q
	2OxDpqP7GY8mjU4C19jcSHgvT5Y2HKxI+R0gV4mSClyGWlXL7UdjmMY6X+WC1QwFYml/wFcxIsDyp
	eejsDYu/4q16NizSnPc6ZNzWvGYfaEZhVs1GAoq8tMql9M8cM0ESrBvFk+8RSXUzrJcJiI7VfI/fB
	Y/GHyIelsMBfRMaEKOeLvP8uitatI61cE3Gwf2SyYzJ1rIHex8UMkD4TaGsBTzMcvFohyR+3XlfED
	2Ej+jHpIDhFRjYGVfPSpAKHGsl1cWU222DlZz9jxJ8V+nAMlQkSx0jclkNfeldK7XZbHVyxn8c3nL
	ZaSu7fdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLl-00000006cWx-0Jvc;
	Mon, 07 Sep 2026 11:17:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLg-00000006cUp-45z1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:17:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmrCC2652038
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 11:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hx30CqPRS946wiUAi8sDP3gBPvcgRjJiueb
	cFUrh2Xk=; b=Y5AytUk0zlXvDOnmVDBUjWK0AJOcnJN+7rP8AAkv7byebXjamK7
	E0vQJX0sBX3iZ7uzYlBxHBhG4nUv/TUDG9x3ae6lYJZF5Jvcd2xHcoIhEPUdfZzi
	xUXOr2oc2PP+hdvWMijmpfZenKRDSMd5xATKeqXWNNlA4sPv+T3PFGWV2/V271Km
	je0Q9S7hABWgd28A+9pY0PT95fBQ3ML3+2H3s/dWlouI95zS4NiP9t+g2eeFOz8e
	oZLjgshPA4TeEqXdo7aXlKLK5PxiIlco3oico71PbFtJrdeduMHjbyhAw0v6o+bl
	JJqTKgZ2Gb9RNxCkgNreeU21ml7p26qtc/g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0ca5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:17:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c79915791eso747142e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779835; x=1789384635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hx30CqPRS946wiUAi8sDP3gBPvcgRjJiuebcFUrh2Xk=;
        b=GNcqVS1KOjfoUMosjW7MZ7VzJkc1QsFh2Jz15gIWD2E5YuvpJX+vq8PU+0deeMY0d1
         vNkT9foWhl+kF1ETODd4fo4wZrLZcqNK3dUXwncjYz/qz/TiL4F0H6DmQ3q4XmQdVlEW
         P/MHPULQwonDSQEpZYWKJN6DyKyM/hMbPDL4P7fiLe4MzN6ndSyEztQMp6dtI1+h4k9n
         H4w7Kks1mA2VFy3fY4q8K/6ciKiRomQUY9x+TBN4ow2Sq263J9wZwAFkhu8nVmItQXe1
         Bmd7fFWD9ZsqJ2J4w2+SDvJ9OMMhGGDgBSFLJln94R63J2TwdOaMIbNEJ94qzGKHFJ7s
         lURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779835; x=1789384635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hx30CqPRS946wiUAi8sDP3gBPvcgRjJiuebcFUrh2Xk=;
        b=g6R6NHfUJhubv1B1ofDpiLLjBm4WAzfhmserEIJ+9Ves9seGZOqpyDrRxss53t96NS
         jg3DAbaHeXnwwAStt13T8hCSxtDI/PBwhLdsdueu9YdloVJ6lBLsGn5jB3YFF7ne9gCl
         KZWF0SeB9cPD1ywcM51RfBN/kiHLjMzjU5tJAjcKKIrdfWxQH+fUm8NnOn6lKau0chNY
         R57Hu9VaFrl+X71oPscDuJtQiA7PoIrFhDTBGX34kYE1ZeUXiJ5C12S8xfJQZIQCEfvs
         OIPkh56xY9y0VgBkkR/O3HOeBsivU2zO9NWmD8Ssrt9S22B+H9+pBN9/+5JpCPikhdb6
         rlsA==
X-Forwarded-Encrypted: i=1; AKwUvBxoovnBuj15t5eRYMb9PhpS/oASiofSI3LKFzCKGNgMZzHKwGGLdAeiWKtK3/gxYVLFg/6FdPai8aKo5bbCQVgZ@lists.infradead.org
X-Gm-Message-State: AFuF++mMQh0klpDztEmA//dSK44yt8TBH3RQLvnukL9tviV8WeDz3ltD
	4urgcH5MmT6KYp+Jg7rDI2bIJU++qLDEHcrez5LyRCTmOycM0yD5Ll+xcOXct1BcNRmiB6ostsB
	W+khwHOV5DcI9oNd5bWqSIcSXejXomZDzzBpltTfsktcP6YdEJFIDVWPjQx2zTKs3gH0tJxu17b
	GD7g==
X-Gm-Gg: AYBFou3pD6cnMrk4+/vVaN3oJzqRnANFGipH4wL2DhSEMqs4YDE67SmmPrHwh7u1MUF
	74FR2uiTI4d23MrbhpchqcQ89CRLQ/MubiAqxI/MLtm+sWVERdZgiuDhEK7vWPe/pBbU4yLundp
	6iU4TMBPjbiJ9L4f9TjcMP8jEuF1AG08iAo4GBhznHrTskAkyBK0Yb1Qtlb8tMvrQTfC4qbDM5u
	oDnX6966gIB/1L7OlXHQvrYhzXaNvsuNCMM2CrUXsXRphis7Nqi4QWjTBeBG5fQ8/ehquPTIt0j
	loRgSRUI5dKHY5fVSVR27cNmbqlWNffhst5MXJJsBMSGgjbz+ycPeY0j2RpcOG6Eoep6Eort+KQ
	KA70sTbdQtTco+03V/vIVOQ5fHJDvKElGUw/S1pem+GrDbXvNklpW6DMhdA==
X-Received: by 2002:a05:6102:943:b0:77a:d089:3dd8 with SMTP id ada2fe7eead31-78a4aa5a199mr6766450137.12.1788779830425;
        Mon, 07 Sep 2026 04:17:10 -0700 (PDT)
X-Received: by 2002:a05:6102:943:b0:77a:d089:3dd8 with SMTP id ada2fe7eead31-78a4aa5a199mr6766432137.12.1788779829944;
        Mon, 07 Sep 2026 04:17:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:08 -0700 (PDT)
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
Subject: [PATCH v3 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM domains
Date: Mon,  7 Sep 2026 13:16:50 +0200
Message-ID: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9e9d3c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yh3ps83G6N8KMOvRL6AA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: IMWjdmIeGbfFWs21_iF8IW9RmXJdU8sy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfXxAZRsPk5lmyh
 bVZ0VS8lQV5zTrN+cYC96uk3VujGyTqD543Ry8Fa2sYwPojBkaFfy3GbxAAIgOuaBLSx5Vfrr/L
 ui2JK2dAOvFWf9mf9Tn4xhmZUtK7X3E=
X-Proofpoint-GUID: IMWjdmIeGbfFWs21_iF8IW9RmXJdU8sy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX18mZAzlU0/jS
 unVaCrIB7wW4W4W4Ay3NVb8J4hA58L9WNcZgCKCnyuGEYsCdEyE5zPOHkHUQrFeBSchxkAC+X/T
 sC+5cn4lyQYS8URarOc5WR4tn/cdnnclNeQMeIUe+hdYqwp8Z66+2t/bwoYaQ7yZJG5waBmW9nG
 H4uRJuyRNiURw0jNwVn0VHgpvwVl0A3rZm1fKr7LxHQbUHRjniy+4wZwGu0zrCDVlFhqID5DiMk
 VxFjDZHXpABIqvjGvUHuBV/fbnF5XYMdBnkbya9ZnYJPzim6qsqLly+CNlrt5nB4r1qcsLftHsh
 B+jiPuQIXfw4tuCteTdG3HVWaErmvyNJEwBuDQSjQ6dBy1B1J5KCtm3HUChZfB20qHI32CpIwFR
 GHqCO8uLXlta5cfsZ7BYTzUnCP2iHd3nh2VveViGpq7p2QPgLv/AN9xE4qEIMnULOThz3XXBn2D
 LZuDuDxT8i1y/2+654w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_041717_021962_D425401D 
X-CRM114-Status: GOOD (  15.45  )
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

 drivers/cpuidle/cpuidle-psci-domain.c |   5 +-
 drivers/cpuidle/cpuidle-psci.c        |   2 +-
 drivers/pmdomain/core.c               | 112 +++++++++++++++++++++-----
 include/linux/pm_domain.h             |   9 +++
 4 files changed, 106 insertions(+), 22 deletions(-)

-- 
2.43.0


