Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D37CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0/Q0xmSUCTADgPSgL0BMVb1QDXKchPzhQ5xIhvRRlhM=; b=SEct4Z/3Vj9SZ+EdRtA/ZXKWAs
	nwK0hxgy9YWfikc+YiZU2axVDzkAC+PQF9TWd3mYiZt09sbzL6XPcHpQWN8xo2MvU4BLfyz9IqLur
	66C2xbGeQCf0HI/lpD2M2otK/S8ymwtGwX5PRVO/wAZ+UXnonvwwDVeFDGy+SZF2G51nCbmw3grdS
	kT1YTarKcA1Bl6kf09DEct1JT+TM5MecFD4TnB5mJEAvF1ptdA9pCqovwbQyTC0sY7zAhXjbseSwT
	fjHnHGeGy0paxCEoF4k3fiJKQr5s5P3dnU3Y2g8YsDh+s6Jg0XwzRMUwUdhtXKFRSy4hn3JUFohSj
	u2wuLHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInKB-00000007VET-2cFX;
	Mon, 19 Oct 2026 13:22:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInK9-00000007VDh-0fHx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:22:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JCsWbl2483456
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 13:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0/Q0xmSUCTADgPSgL0BMVb1QDXKchPzhQ5x
	IhvRRlhM=; b=X80xj8FpnJWFucRBJ/6hZQS/FT7Y0PkiV8cbqIVcJUu4ZhSWI1k
	S02S8T3p1YvZQ6uTf6EdkHzwF77f3sGUKgtl5LPcC8DPQb2LPsHy1x3O7eJkMt1O
	93Gw8SKDg08dzXbcBvtB2x3rsBo0Lc3W1vwmbUyykONFf/VOFpxfAwmhpDaUzELk
	MFGbmO7VQK26JTlM3i1u7RJumrwgTsHeAMgJEZHS7/thMb4jkvuxJN6PYqaDBjyg
	9f9wdbZJJFXXevU6FDxWB0At51UCveKgrqE7xeDFb3AunzZH/LPMOxfLl+sG2juJ
	M+lwB5rhABLMkywN+6EgZRDZlzEsZV11NJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfg433-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 13:22:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so363829285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792416161; x=1793020961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/Q0xmSUCTADgPSgL0BMVb1QDXKchPzhQ5xIhvRRlhM=;
        b=Rx9C15cNLBvlZy+JEg9fPpPK3CX97Pc4OUL7S4phCn6oa41t6aznTQ+iQzoGkZX6mj
         sOjF6UNUn9TaFbu8CHrMa5859T9e9i7j521gwDTIiyQ2GNgvFBh/gaaOm97YIYDyBrTb
         8xVu9ZHdBw8L2xrc2aISH5DC+IbVrES9tpJljAyRMafDusameagHxC4uu9DMBXyNjBj1
         2B6Rn9PVMFNes2Tsjz4sS08Av0Q1CSzdQomTtdj6UX1/UhXhz/6nvJmwyrGdYV97+JOV
         OJmpy2keVtT28Aj2mSMiF871M/ARSVGL7tKqWiDdjGC/hBfDTjRZ+HiPnZmwEU4d58AJ
         5WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416161; x=1793020961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/Q0xmSUCTADgPSgL0BMVb1QDXKchPzhQ5xIhvRRlhM=;
        b=aNLWbqYtuWMdvqnpPTYuP9AsF4V1RFLGv9Q83qnhzvdlom/ZRBhWkZyGbFvdJ8YUis
         pScsqUIVWDjm34Zsuc2nNjZZc/iGAfQArSwI2inJerR8mGuSLn+CfrtV2iC38HbAYm3P
         4uZPmlljhhIgyRVmcP3OvTDTVOHws9l2zZXtsfTCmYFxTi6k0e2Rec2Ba3f4EOQs1xAY
         pAdjNM0sdpf5v/IFU7UYOJZuqFtnl/V9H9GW1+YmaD3lEb0XZ2v7lffeO2/VDFasGWrn
         eS+h966HFGq8zhAgVSB+wJqwviSpfC6QazXF16UTH1ftO3G3OujwW1nwGO8JjEv+O13z
         qOuA==
X-Forwarded-Encrypted: i=1; AKwUvBwHGog/Cth/pigFO9DD0reG/YUVdjjNva9Joi7C3l9NbAwKp4WeTStXiPjWZvvewtvVLab5Ui87GGdZBqhkNeK4@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+rwyZ5JdnF+2YpieuP+ek09zhkCy9dnUW21fzwEEF8T0VH9zl
	Id4SYuJnao2TWdi88lw0RN92w7iDmlRVns8dHFfkuf7xqHUK/zfeOxBj4IEs4vSE148uOBUHyAa
	W6OQPK9Np4b4ufhtF4uizvzzslzxGAwthKZRRnsFF5I39aY9ItSk8HYKAIIdxFwm89/RKSS40Bl
	Ib/g==
X-Gm-Gg: AYBFou220GdtI8Z5l3dToy3+GX+Oidbhr5RxV4buvGtBUGoi+4DF1CbaMOrUED5SzoA
	N8YoERvhSqonSoHFpAxv6qxglP76XbbGzd/Ea25PvAwI0Y6GKpRxWm9l4XHGhXuDQlqkF/EVcln
	FkAbS3XF+bxwcg7ABX64I+b6P0Kl5CYNdVfsS7RFT0ge5bDoBogHpqYLqghSXeUhuP/Or/yU/Vj
	i/isSA/3+aG7B4l7xfPdg2O1DdAVVP3m2Z+124oGg+vWjGxMIpafAM4U3NCcF3gDtiWdMvrIMdU
	cjQEaxypEr7BdgKBjjUSywGtuTgHkJKsOilqiEfNurMGW127C2ggjyifN+B99W6Get7UN08AMMP
	hVjKQVmKH8zOe+k0wIkPHXopAWFu+QGnmEmPcKT/j6ppCK0XPFePSqM/KaQ==
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr1103390885a.72.1792416161038;
        Mon, 19 Oct 2026 06:22:41 -0700 (PDT)
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr1103385785a.72.1792416160450;
        Mon, 19 Oct 2026 06:22:40 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4806sm365767366b.44.2026.10.19.06.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:22:39 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle-psci/pm_qos updates for v7.4
Date: Mon, 19 Oct 2026 15:22:37 +0200
Message-ID: <20261019132237.29631-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7OFn7K81WA9YJ6HDGhVukkyEztbRmMuJ
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad619a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=rMlJiCOZsNZ2U4sv3q8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfX8VD6b2zq59XD
 wIoXu8bqliffHr1kQI0Dwq7C9aSkayLk3RHU3BZAv7jhN/olP6kHx8uUbYweOHEOtHMh4h72ela
 EFcdiLJvE/a4KI3Uzcd55pl0yfu0m7x++7n2nqDzHOEHaghhyqOqSH4IX6wowbthrYrQkeaJXNU
 hm61maMKVQStzL7dhGt8uYOzoxMqyKUK4SsUPhyRu3rNl0zyIZ9JpZGDc/yLKJ/mxmj0LNlU+u6
 zGlJsecL/evMBrWUkMLztRG0QG+NscHFvLOElGaBwaB+kzN4ucNBqJ87Km94QGo0R7kxU8MS6wj
 zQTXu+JhPxw47ZD2X0sHUZfcgYH9ObJta1slgr6aOeghXmzHZJtTB0fLNDhgyKHr+whEVaGSpmY
 4DFLlRU/M9HvxvIL4kylbdiy5nOUkUKG+PUaujsE1pD9er3OLYtpJumIU8r25Bnfkek9sI5ZO/F
 vYlRHjDHWHaZEv9K+QQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfXxEyaXlzJgsZw
 bZqSeInaeh9xiQ99vKpaJqRQs2A2t3/yqZJSoblxXhm6OZwfmJgfVv/assvogYnzcKdPDRiqbiy
 /N/BRpyp/fWw28FUUaQbCLSUeLI2/7Q=
X-Proofpoint-ORIG-GUID: 7OFn7K81WA9YJ6HDGhVukkyEztbRmMuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_062245_316642_54ACA8B5 
X-CRM114-Status: GOOD (  21.16  )
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

Hi Linus,

Here's the pull-request with pmdomain and cpuidle-psci updates for v7.4.
Note that, this time there are a couple updates for pm qos included as well.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 4c66c423593e26273ea0d644906ed007630c6f6d:

  pmdomain: rockchip: don't ignore clock lookup errors on attach (2026-09-28 15:36:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.4

for you to fetch changes up to 6d318db9ffcb611f9b3b6b3201c963690541a943:

  pmdomain: Merge branch dt into next (2026-10-09 16:31:42 +0200)

----------------------------------------------------------------
pmdomain core:
 - Add a genpd config to support unknown initial status
 - Add support system wide resume latency constraints
 - Enable a non-CPU device in a CPU PM domain to do power on
 - Fall back to use device node name for domain idle states

pmdomain providers:
 - cpuidle-psci: Initialize the PM domains in powered off state for OSI
 - cpuidle-psci: Move initialization a bit earlier in the boot sequence
 - qcom: Add NMXC power domain for Nord
 - qcom: Add support for SM7250, Kuno and MSM8952 power domains
 - renesas: Add support for r8a774a3 SYSC power domains
 - renesas: Fix lockdep false positive for r8a78000
 - riscv: Add RPMI device power service
 - st: Add the actual power domains on U8500
 - st: Convert Ux500 PM domains to schema

pm qos:
 - Add a flag for system wide latency constraints
 - Add lockless read for flags

----------------------------------------------------------------
Anurag Pateriya (2):
      dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
      pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord

Ayman Chaudhry (4):
      pmdomain: renesas: rcar-sysc: Update description of chan_offs, chan_bit, isr_bit
      dt-bindings: power: renesas,rcar-sysc: Document vendor-prefixed header paths
      dt-bindings: power: Add r8a774a3 SYSC power domain definitions
      pmdomain: renesas: rcar-sys: Add r8a774a3 support

Geert Uytterhoeven (2):
      pmdomain: renesas: rcar: Make area arrays const
      pmdomain: renesas: r8a78000: Fix lockdep false positive

Hardeep Sharma (2):
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains
      pmdomain: qcom: rpmhpd: Add power domains for Kuno

Hemanth Selam (1):
      pmdomain: fix typo "releated" in comment

Joshua Yeong (3):
      dt-bindings: power: Add RPMI device power service
      pmdomain: riscv: Add RPMI device power service
      MAINTAINERS: Add RISC-V RPMI device power driver

Kevin Hilman (TI) (4):
      PM / QoS: add flag to indicate latency applies system-wide
      PM / QoS: add lockless read for flags
      pmdomain: core: add genpd_for_each_child() helper
      pmdomain: core: add support system-wide resume latency constraints

Linus Walleij (3):
      dt-bindings: power: Convert Ux500 PM domains to schema
      dt-bindings: arm: ux500: Drop NR_DOMAINS
      dt-bindings: arm: Add the actual power domains on U8500

Maulik Shah (1):
      pmdomain: core: Fall back to node name for idle states

Muzaffer Kadir (1):
      dt-bindings: power: rpmpd: Add MSM8952 power domains

Pengpeng Hou (1):
      pmdomain: imx: Propagate SCU provider registration failures

Sergey Shtylyov (1):
      pmdomain: rockchip: Fix domain check in rockchip_pm_add_one_domain()

Shawn Lin (1):
      pmdomain: rockchip: drop duplicated errno from supply failure message

Sreeshankar K (2):
      dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
      pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250

Ulf Hansson (12):
      pmdomain: Merge branch dt into next
      pmdomain: core: Rename genpd_status_on()
      pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power on
      pmdomain: core: Add a genpd config to support unknown initial status
      cpuidle: psci: Initialize the PM domains in powered off state for OSI
      cpuidle: psci: Move initialization a bit earlier in the boot sequence
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next

bui duc phuc (3):
      pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
      pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
      pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()

 .../devicetree/bindings/arm/ux500/power_domain.txt |  35 --
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   3 +
 .../bindings/power/renesas,rcar-sysc.yaml          |   7 +-
 .../bindings/power/riscv,rpmi-device-power.yaml    |  65 +++
 .../power/riscv,rpmi-mpxy-device-power.yaml        |  65 +++
 .../power/stericsson,ux500-pm-domains.yaml         |  41 ++
 MAINTAINERS                                        |   9 +
 drivers/cpuidle/cpuidle-psci-domain.c              |   7 +-
 drivers/cpuidle/cpuidle-psci.c                     |   2 +-
 drivers/pmdomain/Kconfig                           |   1 +
 drivers/pmdomain/Makefile                          |   1 +
 drivers/pmdomain/core.c                            | 163 ++++++-
 drivers/pmdomain/core.h                            |  18 +
 drivers/pmdomain/governor.c                        |  45 ++
 drivers/pmdomain/imx/gpcv2.c                       |  16 +-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c              |  15 +-
 drivers/pmdomain/imx/imx93-blk-ctrl.c              |   3 +-
 drivers/pmdomain/imx/scu-pd.c                      |  10 +-
 drivers/pmdomain/qcom/rpmhpd.c                     |  41 ++
 drivers/pmdomain/renesas/Kconfig                   |   4 +
 drivers/pmdomain/renesas/Makefile                  |   1 +
 drivers/pmdomain/renesas/r8a774a3-sysc.c           |  45 ++
 drivers/pmdomain/renesas/r8a7795-sysc.c            |   2 +-
 drivers/pmdomain/renesas/r8a779a0-sysc.c           |   2 +-
 drivers/pmdomain/renesas/r8a779f0-sysc.c           |   2 +-
 drivers/pmdomain/renesas/r8a779g0-sysc.c           |   2 +-
 drivers/pmdomain/renesas/r8a779h0-sysc.c           |   2 +-
 drivers/pmdomain/renesas/r8a78000-mdlc.c           |   6 +-
 drivers/pmdomain/renesas/rcar-sysc.c               |   3 +
 drivers/pmdomain/renesas/rcar-sysc.h               |  13 +-
 drivers/pmdomain/riscv/Kconfig                     |  15 +
 drivers/pmdomain/riscv/Makefile                    |   3 +
 drivers/pmdomain/riscv/riscv-rpmi-device-power.c   | 485 +++++++++++++++++++++
 drivers/pmdomain/rockchip/pm-domains.c             |   4 +-
 drivers/pmdomain/st/ste-ux500-pm-domain.c          |   2 +
 include/dt-bindings/arm/ux500_pm_domains.h         |  17 +-
 include/dt-bindings/power/qcom,rpmhpd.h            |   1 +
 include/dt-bindings/power/renesas,r8a774a3-sysc.h  |  30 ++
 include/linux/mailbox/riscv-rpmi-message.h         |  11 +
 include/linux/pm_domain.h                          |   9 +
 include/linux/pm_qos.h                             |   9 +
 kernel/power/qos.c                                 |   4 +-
 42 files changed, 1113 insertions(+), 106 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/ux500/power_domain.txt
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
 create mode 100644 Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.yaml
 create mode 100644 drivers/pmdomain/core.h
 create mode 100644 drivers/pmdomain/renesas/r8a774a3-sysc.c
 create mode 100644 drivers/pmdomain/riscv/Kconfig
 create mode 100644 drivers/pmdomain/riscv/Makefile
 create mode 100644 drivers/pmdomain/riscv/riscv-rpmi-device-power.c
 create mode 100644 include/dt-bindings/power/renesas,r8a774a3-sysc.h

