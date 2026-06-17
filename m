Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CD0CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pI4CGEA+hKFhDAO95+0zHDrli6x/L2VFho8GH0qHdYc=; b=OuolP8Yy+XpZ4hZPPepaH7Piyp
	n9DLY/BHTUPDtv5y8L09J33wYKoA9saNSCgclbZXS+/aZOfigrcZkMeeyW3G7e8XeklhFj2cdQh+B
	zdSTtYhoVkWvq78JVCwj7bBPwJBGA6YvbmYBHq24VXQ33/LVGegfADTijG/+J5ptvOmiQdvoxn8nE
	fWwowJBsKSboID6NdUDpkf8S5PuOISbOTWyIy+P69gWom8aeLXVeVHv0peYlWA/+/bR9CK3nIZLXo
	zJzQsTVWrv1Y4LA2G8tEXOG+ighxya5ng6KcufERuQUZFsHGN29QkvHgNtuVoRw0kKeXCoDV94izq
	Y4e/ljdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmDZ-0000000Gw1A-46I5;
	Wed, 17 Jun 2026 09:05:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmDX-0000000Gw0e-3Jj2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 09:05:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UPps1703224
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 09:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pI4CGEA+hKFhDAO95+0zHDrli6x/L2VFho8
	GH0qHdYc=; b=YZUo0ucUklMHOw+nFSfwsm1uQEWPgbK1lU5YUM5PobMIxtgLggE
	mzIwaYfClJCg0lOzalMEPdnltFbiSoZesPO00T8cpvDIjmhRYlIHxrsuVDTna8fa
	DdmHtjMm1CrWkzNqCR1vA8lV7lpwFV9nGrmT+dvUaUuXxdYsWCZq7vb2wHfEA4k1
	254226aWsQFu1EbOhEwqKtsodfbvyVU7dCKmjSJHGkw+DtC6mZixNOu0mdpAZSgQ
	bvRJRZ1MQ3kNNKRgB7wFKqfT1Nd0SeIA/Im8gzXA/nAec56pN0sbNZUN1wxd4vg2
	Pry6AKV/vhFTj3a++rfbnGAO7PyQgM4pJSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet28us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 09:05:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158f2c4b55so869468185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 02:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781687149; x=1782291949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pI4CGEA+hKFhDAO95+0zHDrli6x/L2VFho8GH0qHdYc=;
        b=b9dtsO+6UeQ8eVu8o+XTBMKpbLxxu5dEZ6EFwSdhaBj8tjjLEA534PNWomHJXCW6dk
         jBW5x1pyWD1vxiMViKW37rdhObO+Ra2o3l+J1J95ex6H2GrAUHIlWrRmORbHaH0cpSGY
         BaH/swh5RZq6ho/LE3x0ojngMnozRWb0aTkMcuqm7pR+EXvxgjwf4AzbbYO6RUSouucV
         eHNX4/wGlUi5UHsZPyMSnv8oMB0Q5E3n6uGUFtt7vO6v6Inmg2lMn32UgCeQQiUNh66n
         rWNF/Dbtv/0szcIZVXItJDxo+BlSoaTcyCllhfU5bsZAGekveO3K3gV8EWY/WTb0r0Xo
         ix7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781687149; x=1782291949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pI4CGEA+hKFhDAO95+0zHDrli6x/L2VFho8GH0qHdYc=;
        b=ermk/K5JYYblf6zbwdq3DQrCLrVOQkW0BIeSouGP8A2a8vdYjHB/oJ6D3tHkVgx05n
         hLqBRAhm+Q6r/Sr5bxG3K2C0nCOrG0ZZMxB0HRZEB6JKtVgBSLvca7L07oZ2/1ewAZhH
         T8s/troqNqKoTvFO76Ok8M7DfVcR3B+Lw0mYSZ8Fxcc3sbR/mJvYWCdND8PcLKtgnFsS
         O7tFa2MSd7ph9r0WWN1pbmwH2UTGqT4HPNwyLEyqZk7PIVpm69gF6QqbbPfGZHMgWghd
         X/EQsR+QXdhuPLxF7//OP1PDfof08zxqLO4FunOCGFtYKot+OWUWQna3PC3WoUk8bV9B
         cVxA==
X-Forwarded-Encrypted: i=1; AFNElJ/cKkdLYlV/4WawSqN6np2B1iT/EWjA3ghelNj1fyF9PRR2Oin/50I+WJOT1kdXvaDxbVEnhq9l/gF2zUY+eDs0@lists.infradead.org
X-Gm-Message-State: AOJu0YzrdaFMCp1k1ZNLrG1ScVAQRO0nWbkmMEi3gU7vLZ10DFu5nZsv
	aWQ3/1DexCBVas9y+rp1b/rw3yBgdEzA6L3v/HXJ3Pioe/3ju7BA659mkaXQ4DfCLanR0vgZN98
	fgm98O2kMtQ40vFzbOSAmNta1PCaJWyhJ93aKzWbK4rmxA3qM8jUoWIfpYLVqrosWzbIe5yDpJE
	FXUg==
X-Gm-Gg: Acq92OG0qxEsWWQRUx8IwTNcoHQCqhZwQvfZgxqVXS/DdCtx0hKkw4MZix7btNQ0R72
	xKb1AYCmKa2qiZZobtAy8ubxpdS1hwPLuCjgnMAFmR+hA5zSeXzTjtc8t+Ni2X5smZh2xoA41um
	MBpbJrK/yogmjRufC41VpjAQn9mWFmUNITC1wKslI+qQxZXAW3lWfmEI0idd6zvKxi3gBjKavBc
	v4njmUyKr29Sst1SBnz1iS1ENT1JQvVw4C2355EXXGiveUNDuW+ya3jSpSIk/8j4C5yBz7ynvYF
	TBztKvSPEvzP4h5niAsgnQvuscTGQkimDA63dl0v3zW7/qNnSrMI4lD7MaGaI1BpvTuap365VCj
	Qm0VkMyC+5OiQtnfLR5OpsWO3ljJgSKUrBj4Ko25Qeo5ri3EmZJM9uw0AhkJie3XF5UZY
X-Received: by 2002:a05:620a:1a18:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-91d88b5043dmr572728285a.10.1781687149584;
        Wed, 17 Jun 2026 02:05:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:8cd:b2e9:b964 with SMTP id af79cd13be357-91d88b5043dmr572723985a.10.1781687149075;
        Wed, 17 Jun 2026 02:05:49 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f69sm4338451e87.4.2026.06.17.02.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:05:47 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain updates for v7.2
Date: Wed, 17 Jun 2026 11:05:46 +0200
Message-ID: <20260617090546.18688-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pDACw0lo1XzBgUJV6vMQUChPYcEUfjhW
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a32636e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=JbgBzRNRWi2L1-RP8WYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: pDACw0lo1XzBgUJV6vMQUChPYcEUfjhW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4NCBTYWx0ZWRfX20hmYkUumuiP
 cLgybGuiRBZdUYfpEvSNLTVFTBcthiirGyxGNVG4Og3Q98nTq4y15IZ2Om8iHHwj+rc+tH5kwgK
 zlm+7Fow3s2LeGpLmby+oQ4587m7iLiTbrT2HZAMlvXdLAzRL+dZjC7iNVUzQgp/IN5cWhSPZXL
 /TjExld9JG608+opdNZiMxvgF3SgqiIF3l9jI/0GPKloKNXkG8DMCl0Dk4VZbf3P0ekC1/MU8H7
 7cwTnArQOinGTjyDx4NUBxuyW5gR2RCD8ZTspN5i9F0ggVJRSGd0vzomVTDvVOB7428yR7vJ0Lm
 /8Sy7RpE1MRhJVLuJP0lzF0FVcDvGNy+JQRuHWpUyl+scT3SKdMOc8C4NuiF9IQPUGl76T3Rb0R
 rNKZ3kJrGlLuTmDzTCDVUgR0L8nWvU9RvGxBR7XAvvKpuilmoYrYPBf7McrYpWRgprUWIX+GsZm
 j3I7oDUfCZ78Df60uxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4NCBTYWx0ZWRfX1a8tmwsYVzrl
 jsyZp8/nUcFxM4WS6FDOiUC8v0p6UpFCMbuyyDprMWgeAeXiLyesxUUPokbHKu3GA2PfzxM4nWr
 5ri6YxcT9GlKdjkuNRz2cadBOrY0DaI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_020551_831750_A04F1F8D 
X-CRM114-Status: GOOD (  13.20  )
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

Here's the pull-request with pmdomain updates for v7.2. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit fba0510cd62666951dcc0221527edc0c47ae6599:

  pmdomain: imx: fix OF node refcount (2026-06-03 11:49:37 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.2

for you to fetch changes up to 528ad521a433cf873724893bda339df95d8ac1e0:

  pmdomain: core: fix unused variable warning with !PM_GENERIC_DOMAINS_OF (2026-06-15 21:12:35 +0200)

----------------------------------------------------------------
pmdomain core:
 - Add OF helpers for parsing the power-domains-child-ids property
 - Extend the power domain DT binding with power-domains-child-ids
 - Switch to use the dynamic root device

pmdomain providers:
 - arm: Add support for domain hierarchies to SCMI power domains
 - qcom: Add power domains for the Shikra and Nord SoCs
 - sunxi: Fix GPU support on Radxa Cubie A7Z by keeping power domain on

----------------------------------------------------------------
Johan Hovold (3):
      pmdomain: core: switch to dynamic root device
      pmdomain: core: fix early domain registration
      pmdomain: core: fix unused variable warning with !PM_GENERIC_DOMAINS_OF

Kamal Wadhwa (2):
      dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Nord SoC
      pmdomain: qcom: rpmhpd: Add power domains for Nord SoC

Kevin Hilman (TI) (3):
      dt-bindings: power: Add power-domains-child-ids property
      pmdomain: core: add support for power-domains-child-ids
      pmdomain: arm_scmi: add support for domain hierarchies

Krzysztof Kozlowski (1):
      pmdomain: qcom: Unify user-visible "Qualcomm" name

Rakesh Kota (2):
      dt-bindings: power: qcom,rpmpd: document the Shikra RPM Power Domains
      pmdomain: qcom: rpmpd: Add Shikra RPM Power Domains

Rosen Penev (1):
      pmdomain: mediatek: mfg: move __packed after struct name to fix kernel-doc

Shawn Guo (1):
      dt-bindings: power: qcom,rpmhpd: Fix whitespace in RPMHPD defines

Ulf Hansson (2):
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next

Yuanshen Cao (1):
      pmdomain: sunxi: support power domain flags for pck600

 .../devicetree/bindings/power/power-domain.yaml    |  34 ++++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   2 +
 drivers/pmdomain/arm/scmi_pm_domain.c              |  15 +-
 drivers/pmdomain/core.c                            | 189 +++++++++++++++++++--
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       |   4 +-
 drivers/pmdomain/qcom/Kconfig                      |   2 +-
 drivers/pmdomain/qcom/rpmhpd.c                     |  35 ++++
 drivers/pmdomain/qcom/rpmpd.c                      |   7 +
 drivers/pmdomain/sunxi/sun55i-pck600.c             |  31 ++--
 include/dt-bindings/power/qcom,rpmhpd.h            |  18 +-
 include/linux/pm_domain.h                          |  16 ++
 11 files changed, 318 insertions(+), 35 deletions(-)

