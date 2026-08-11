Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DDBC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 05:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zlCU+1Hoxq1rQXyfHtQVCx21WrqoA84d1mAPvKqjLm0=; b=pQRVxYYtcqCfAK
	RzNH6GotVlWh3QYEvOWReElK0XhMoxh+k8oAUSNk/vUD1DitV6uNVtEJ0Iua6aevnm38cFvpk7Yam
	BS3LAYP+8QeZvfbLL+d27uGWOe5cKURCH86b7400jLKQLQ+9WEjpJgGOZgrhkuimPKUcyqCOwCCEe
	CZTUIxgf0LVhd7j5zeeoeyFFK7XSdRnx2E97TvdViHeC2y4G+51pqLgxJiEKNLRW+1w7c+VxUmSqw
	prqYod96+MvNi9nEAkYoJkwbI5maNNLxo1zdE3qeq5vyB6BVj1LoGWe+BmH4yxKkE4IPwtWOUDu31
	SxAWNhmTLIbMR+QNKSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfNb-0000000DLEp-2XsT;
	Tue, 11 Aug 2026 05:50:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfNW-0000000DLE8-3ewu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 05:50:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpwJb2705441
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zlCU+1Hoxq1rQXyfHtQVCx
	21WrqoA84d1mAPvKqjLm0=; b=edyXknsu7Ac2Lf5UgRXVSbuPpaXr7ciSk3O+XC
	Tz35O8rSIDzaRsBI6jgoJ9eiBaL5wjpFGAm/84bPkMVSUS0SVLRyMpuZN6o1k+fH
	DMz4M0h2fNTI8BbAmNOR21FdTfeJyHMxUoFA+aitAmsiAJINu4qiOnhYnhW4sLAA
	U6WUj6hSHVwkZZBFa4lFDReufwyCg08tRlqByLBYY2VBE1Cl8smE47RHwcY+KEDU
	ecICVq8gN9zsWiuCkk0dd9Oj44aY4z64IoLUglwJBzEMKg+xSp+7tg7jzuuAZAZ0
	pHBEYIDAhZvn+0N4mOs6I+VVL3+YIrgkCnenvK7kANeSAEvA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk62hvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:50:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so8858445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 22:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786427419; x=1787032219; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zlCU+1Hoxq1rQXyfHtQVCx21WrqoA84d1mAPvKqjLm0=;
        b=MVs5GtCoDGtp+I3b0noXpMuh2rgCjeu9POv0PpRzUMHo2qE/+ZD8rf4g8g3bSqhD4Y
         VieoQ1wjPN2+zA34xBTTUeDeMhGUize/5fOYL8n9PAXhPIgOcgXuxRoKHOvDQRgjn/G+
         cIprkWX8vTpjEVHHgxR9SE7hqqwv4MWx+bXY46DluOebFvHCjmjaadoEejzkoyRptZZY
         K27vuiMTgFMiNleWzy7If3TIlo2UZiHSUdoMlxJ0nMKNwHWFjUyOliMocwkpEtQOtkc0
         wqVNGDmQq1QyNpflPa6hbJ9RrbpYtoP7YOJykM6hVV+AoSMfmgQvrEYH7JD/9sS1f8EL
         26wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786427419; x=1787032219;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zlCU+1Hoxq1rQXyfHtQVCx21WrqoA84d1mAPvKqjLm0=;
        b=r4/VWncWT28gZeyaTuLouMB9gop2oKW6Qbj+Oia72aDnoHSK0030pDe68PPYvdpDPD
         eaQ6SxyqapdwKu+BuFcvXHh+qSSO5LavsosaKEinBHaxIX85YuymuyX6zZfJUU8WvG0R
         kNTgzm79OxObARTGoMH4OllabD1m9/KIVRxyNLxVOTJ+Oq5g7685cFrZGOh/obK1AV1B
         D/PJWNyHx6aYWvyXUVyhEzUMy0aOFlQBhyA87NcZ1VphkIhuGuzm9AKyhndtmY7rVuLK
         L5b+A4Dq9yBjpx80vXXQafJ+jCRoGtvKZWctRZS/Ru8nCzGobEXActQfpz3kIs42u8jX
         rm8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFT2obtSKchN5KKmj71MEr3d/IaUO8HamqWx7/CdrVMU1YrZDzvh5fRpGB1ib+uAIcsUZ3iVo7xUpG4Ce574pP@lists.infradead.org
X-Gm-Message-State: AOJu0YwaL1+QRLqsTeSq8yzYMbJEh8QicGTvqM9ukueb9H9RWv56b3uU
	En+XU8gP882JVypnBE8qOvOXK/Ktj56FwfM0vV7DtR+y2/XRNfSrjVIld1r9jPF7xjkHPWPIwpC
	qXcCaNXMbbaB0yakZZ3CYJHAMHRSWcRDhtipv5ffsoQFS3lvXt7DIVPvITZpF9PIrJtQCUzRu10
	OVPQ==
X-Gm-Gg: AR+sD12mkGdwT9eNeyKgBNn+LxA1M/bUuhS28jX76YgKCgJYIZ29BUBgbDew4iXdkHQ
	gX2M8K6F+aMwGB6JudQpYpOWtP2xv9l1xv5T9Bi7yDqdG6OLzdHPtlKz9fgrXpb+c2+nzC7QVd+
	4THRbmf12ifpczXDlK/omy6KDjnCKM/mc9mrXQNhjJ6HXTusqZj1+yc8AegFdwb8seVevrB7NUn
	LFByLJ5ZugO1QLKO7kqrV5LIl876SmjaVfvojJtr4Ghv7GZ8Qqw0CULh0CQWV/391QSb0z+OXKU
	aUkt2yb9d2XoKDg3l8PpwIn1LipnCXgJ9HgyO4yHpTdLhv/qp0r+kgJloBdfsQKFp6WDufJWHyB
	maaFcPA2IBbgltJ/ZH/4677Be0ozR
X-Received: by 2002:a17:90b:274b:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-392ec71cae0mr893339a91.21.1786427419512;
        Mon, 10 Aug 2026 22:50:19 -0700 (PDT)
X-Received: by 2002:a17:90b:274b:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-392ec71cae0mr893298a91.21.1786427419032;
        Mon, 10 Aug 2026 22:50:19 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d534ab78sm2062289a91.12.2026.08.10.22.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:50:18 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/2] cpuidle/pmdomain: Correctly track state of excluded
 CPU clusters
Date: Tue, 11 Aug 2026 11:20:00 +0530
Message-Id: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAi4emoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0ND3ZT83MTMvPj8tLT44mJj3eRUM1NDc8NkQxNDMyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgAd7Bs8cgAAAA==
X-Change-ID: 20260811-domain_off_ss3-ce65171c1416
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786427414; l=2479;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=YxRmzsXwL69qEXZhxMu1pjQ0toXga7vJW3wqY1JbwA8=;
 b=9ZpJsh5hzZn3fUVFYXRZSERpLh4cMMRBFjL4WlJuVSsfwTk6lKhZFtRrDgvrTe/CEzzVvYLdW
 z3jyM5yNswhCeEgvyVIM7qj0PgYMJB4uTzzNHqEBrDgY+FomgR2ZDh5
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7ab81c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=D9W73uoA5fEuy_YkFGwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _mOLD8FAHT7cYAqOUWUaM_UZYmCeHagp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfX2Y41wro8mMTH
 7Sx9mgcKgWZjecB7chgYFtdUtmnIU2qzsqUrrITekdAA4b0pO7aB1nfyD6wc6/EoiMDt/7PXUcn
 1PjJ3uqJbfoW8zk1ZsvNidKKWgwgg9o=
X-Proofpoint-GUID: _mOLD8FAHT7cYAqOUWUaM_UZYmCeHagp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfX2CzneAUR/BUS
 dAwx3dHPyu+8JIOQhejqPE+KmqZ64OAcY48+Y2gJWstk2G09nuaphR425NDHpAWAtVbYt9b1cen
 bM4HBXC+t0MlMahrB60FYuQmpkvTgfyg0zL7HTDYCx8awNZCUTaI0kF46E3Sgm70hVTLi8M0Px4
 OvrIbbd8bOh3pSMsmyuBoEAbTH1RcWBQRnIjOsah/dO9WIRElsXMptnx0/vOOcD8cnx4XYBs72k
 smuuVTj0gMUySWgqp9H+Gv/PaInteIdbqfBFZxniR5rknLrQcYWh8r7RxMa1hbH+DqsMPTSjlCD
 5+Mtt/aUhYlriqVxj+p31qD3uXjTXS1kQmogLXwJIt+L9q36VJSA6535wyWPPZtuS0s98qgbzDa
 u4SrgafIGaDHxIB/13uepfQihi4q59jeHQ8x/UZurNvlw9wYaCAruWbe42SCquSEwUWj2FG+JHe
 I5upX4CLzO+LX9lKYwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_225023_035896_31287FF3 
X-CRM114-Status: GOOD (  15.24  )
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

When CPUs in a cluster are excluded at boot (e.g. via maxcpus=N), their
CPU-cluster genpd is never really powered off, and its reported
idle-state index never reflects the deepest state either. Both issues
independently prevent the parent domain from ever powering off, even
though the excluded clusters never ran any CPU.

Patch 1 addresses the domain status: psci_pd_init() always calls
pm_genpd_init() with is_off=false, so a CPU-cluster genpd is marked ON
at creation regardless of whether any CPU in it has actually powered it
on. For clusters whose CPUs never come online, nothing ever transitions
the domain to OFF afterwards, so it is stuck reporting ON forever. This
patch starts the domain OFF at creation when OSI is in use, since
dt_idle_attach_cpu() and the cpuhp callbacks already power it on
correctly for any CPU that is or becomes online.

Patch 2 addresses the idle-state index for domains that start OFF: even
after patch 1, a domain that starts OFF without ever going through an
actual power-off sequence is left with state_idx=0 (its kzalloc'd
value), i.e. reported as parked at its shallowest idle state instead of
its deepest one. genpd_power_off()/genpd_sync_power_off() gate parent
power-off on every child being at its deepest state index, so these
domains still block the parent from powering off, even though they are
genuinely off. This patch sets state_idx to the deepest state whenever
a domain is initialised OFF, addressing the root cause for every
is_off=true caller of pm_genpd_init(), not just PSCI CPU clusters.

Together, these two patches let the parent domain power off normally
on systems such as hamoa when booted with maxcpus=N, allowing the
deepest system-level low-power mode (SS3) to be entered.

The two patches address independent gaps and have no hard dependency
on each other; either can be merged on its own or in either order.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (2):
      cpuidle: psci: Start CPU-cluster pmdomain OFF when OSI is used
      pmdomain: core: Initialize state_idx to deepest state for OFF domains

 drivers/cpuidle/cpuidle-psci-domain.c | 14 +++++++++++++-
 drivers/pmdomain/core.c               |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260811-domain_off_ss3-ce65171c1416

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>


