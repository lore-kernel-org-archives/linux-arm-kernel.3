Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9331EC55182
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bpGQewfH/5VOP1dpK7c+IdYYcLTd/PBzSyvsSInl2bw=; b=RlIKI+jzAJMQJ6ep4Db7qmF2n6
	PM7pOsZd9nF8iOZlAGMSUBuqz6+sT7YUTu73/kxTCrPfYvIWvR6mA2PkkhTMUrDX/ovqpEBAaGyPa
	zlrZqhBgzezt+xBteOaWmFpOZFlyAqheEgxSsVdoi9LhpxSDB1Skork1eli6nibzJTydPduqawkzq
	lwGJdw2vLmZgrSc8kvoWQJRg0kzh1WfT9YLKx/6d+Ku95uhe+QWif+rNEDZlwzcjkiUQYx00Do+p8
	vaPNlxSngWx30w/rLzXBtUW87ESHP6oIn4DiFtivxR5c3r/lPPrnT/umnNQVlbXXxHrMu3ZAUHQ9d
	B/2o9rDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWbh-00000003U0z-17hq;
	Wed, 05 Aug 2026 08:04:09 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWba-00000003TrH-1P40
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:04:07 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 94FC914000F5;
	Wed,  5 Aug 2026 04:03:57 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 05 Aug 2026 04:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1785917037; x=1786003437; bh=bp
	GQewfH/5VOP1dpK7c+IdYYcLTd/PBzSyvsSInl2bw=; b=LusLO7StkFnnzLjR51
	anaj07O4ert3vCbVSDtj5iun17rLwIfKIbS4XGE2T6mZy1RCPsQU5PGit4ES+7Rd
	ctS6QH5Du6EdOx2zINNnmGzPqiXTLeK69Qy8yh4WE7Ou36IAoMsRY7+aRrrQgDmy
	YryzqX5afX4YuegEEURwgsPJOIW8JEpqjYq4Lbvk6ZNYqiS+1aqdz5eY+LO3KpL4
	LRomDXtmYLw3k1RsFhmwMglqyyJLe0rQyka3i8U3Th5QoAzdYuvaGduHdIMsLrgJ
	+Mz18rn2qeLQ2EKeL1v+SqjXEMEKzLsDWqgovZldrUz8MWDWCrxhczLVqSIaOa7T
	YA4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1785917037; x=1786003437; bh=bpGQewfH/5VOP1dpK7c+IdYYcLTd
	/PBzSyvsSInl2bw=; b=BpVQJEoHu+jIP1+IG6TpuQui+gIWxEL2sRumL7/nhtlo
	ucVFZOURuKLzE4XdmOEuR08UUtXxoMzNW/bZJHIsI9FneiLW4IvTJFtugxzhg1Mc
	LUl0xtpER4ydsx1DAPjE+Dt+pgd8AnYtBjyYrGm6lRFy98GwKs9F1CQ2etjI5bRH
	vTgWJZuR2OQ1rcehcJBv/McVbOORe3Yu0VHTZVYAKaIPI/II5QjEwHawLPJmOA3I
	GBQdmI2lhLOMmzQ+G8y+9DxluCcBKlarfyTwT9rkJYjkhMZ2lIIGvzoWUQHLOvFS
	McvZxPj1HvKd2rchCGZlEmwK/MenJ4lf/oEm73rFDg==
X-ME-Sender: <xms:aO5yavqclWvCrE2nKnSyed2jAaiRps_IZtEpEUziYCD-K0jQP0siBw>
    <xme:aO5yakdGw5fHMObhVoUHQ--yYY1YFUAEQ2HgocpRdZ6EF-gmAnNoJXkJUOj7IoG3B
    gPQNKLLDJVBuayVCV1aifFgEpxHsSGeyF-zBSr4Zpgxb0DCLRmZwv5H>
X-ME-Proxy-Cause: dmFkZTGYK4GnyneiBCL6i9hymEFydjng/DNZGud69kzFMp76Xa96qLIiZCH1KX1t5Y1/XJ
    9b9zWQiXOL3C4s/kFfOsmzRCZiX5bn+Vd6J1r5QxkT8hc0zzEmRm32qr8SwG/PGEAW1jSq
    605FODjbZDsrRqHRZYx12CMZMVjYpYAzSQNsOuuEYc3BVfvRc+vziKSmZ6YW9zeyWeXqEd
    /JZmyHTDrALAteDuusBscg7Gp5JWDwxv26wUnLZSJKpmRm4Rg8XrQsMiuBKPXYKEJbWS+x
    f+QRrqIA00VTWqUcKe1liJ7ov8FjVAAGiPeVPvUe3BqFMsmHsiOKjUo/m/V67JseySnjM4
    St9AlDJfrDDSBzXpmncL3KPPU2wH+SBKnsNWk3NjpHNk5GzCuVxGAmbyyouf1qk5lugWSf
    hvBYNx0He8kkU2Fpkpmvqt3mu7IlaOOYWyHVv7jchedOpB5bqO0rrTIDRsvmEFVIPnDEY0
    qxbjcqv+VqfLWUvnnWb7TJnHsnHozHX5VZCUPJrzbJ9H5fi9klUftA3PIEcKUfMag4qshM
    KKE4uUJdxZ3R2vDOu3DN/TLzOKMOlzQay3I4F+sGvzBLW7y1NJRhTzHqkM8o5w3dOh146T
    ehKt11/zkFXSvb39AMwDDfA12/vRurtl4zE26Qfl01fifIZiyeDziKmNaZcQ
X-ME-Proxy: <xmx:au5yapW8YX1cYBW2fx6UN_Xc0ktnff2bYdXI4mj_JId9XsjmvYE9sQ>
    <xmx:au5yagcQlFwzv4zp4hyS8h8uoLGJC8qCy36k4H-gO9aI_hOblFshFQ>
    <xmx:au5yatuv9-yeGq7GsbhuaiVBMkbN4Hx9cr-qNcUfDUvQSZu1skIfgQ>
    <xmx:au5yan_M-fqw5MT1Kf8QRLczozP5MOHCB9CZbKgm9mHQvP6pIox-9w>
    <xmx:be5yarsMQijWfvWZhbqpgiEJGkExk8ohnE427ZSEGTcldx6Dy8XRFdcD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A561232A0066; Wed,  5 Aug 2026 04:03:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 05 Aug 2026 10:03:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <8dac10a8-ed0c-4ee6-8e72-3e6a71b01c9a@app.fastmail.com>
Subject: [GIT PULL] SoC fixes for 7.2, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010402_614953_0FD2669E 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:

  Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-2

for you to fetch changes up to c7a127371ce5dc3d073cc69ba70145c2c420d8e2:

  Merge tag 'aspeed-7.3-maintainers-0' of https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux into arm/fixes (2026-08-04 21:33:56 +0200)

----------------------------------------------------------------
SoC fixes for 7.2, part 2

The majority of the fixes this time is for Qualcomm devicetree files,
addressing various incorrect settings in chip specific dtsi files that
prevent some feature from working correctly.

Another three such issues are addressed on the Broadcom bcm5301x and
bcm2712 SoC platforms.

Two minor issues are addressed in nuvoton and aspeed specific SoC drivers,
and the MAINTAINERS file is updated to add Billy Tsai and Ryan Chen as
aspeed reviewers as well as clarify the NXP/Freescale entries.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: dts: qcom: purwa: Fix GPU IOMMU property

Alexander Koskovich (1):
      arm64: dts: qcom: sm8650: Fix IPA IMEM slice

Arnd Bergmann (7):
      Merge tag 'arm-soc/for-7.2/devicetree-arm64-fixes' of https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'imx-maintainers-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into arm/fixes
      Merge tag 'qcom-arm64-fixes-for-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'arm-soc/for-7.2/devicetree-fixes-v2' of https://github.com/Broadcom/stblinux into arm/fixes
      Merge tag 'aspeed-7.2-driver-fixes-0' of https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux into arm/fixes
      Merge tag 'nuvoton-7.2-arm-fixes-0' of https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux into arm/fixes
      Merge tag 'aspeed-7.3-maintainers-0' of https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux into arm/fixes

Billy Tsai (1):
      MAINTAINERS: add Ryan Chen and Billy Tsai as reviewer for ARM/ASPEED

Bjorn Andersson (2):
      arm64: dts: qcom: glymur: fix PCIe SMMU interrupts
      arm64: dts: qcom: glymur: fix QUP serial engine IRQs

Daniel Drake (1):
      arm64: dts: broadcom: bcm2712: Remove non-functional EL2 virtual timer

Dmitry Baryshkov (1):
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI cluster idle

Frank Li (1):
      MAINTAINERS: ARM/FREESCALE: merge Layerscape entry into i.MX entry

Karthikeyan KS (1):
      soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read

Krzysztof Kozlowski (2):
      arm64: dts: qcom: monaco: Add default GIC address cells
      arm64: dts: qcom: eliza: Fix DSI1 phy reference clock rate

Pengyu Luo (2):
      arm64: dts: qcom: sc8280xp: add several missing pdc map entries
      arm64: dts: qcom: sc8280xp: gaokun3: correct EC interrupt pin

Rosen Penev (2):
      ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
      ARM: dts: BCM5301X: EA9200: fix NVRAM size

Yuho Choi (1):
      ARM: npcm: Fix OF node refcount leaks in SMP setup

 MAINTAINERS                                        | 15 ++-------
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi             |  2 +-
 .../boot/dts/broadcom/bcm4709-linksys-ea9200.dts   |  2 +-
 arch/arm/mach-npcm/platsmp.c                       |  2 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  2 --
 arch/arm64/boot/dts/qcom/eliza.dtsi                |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 32 +++++++++---------
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  2 ++
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  4 +--
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  4 +++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  4 +--
 drivers/soc/aspeed/Makefile                        |  1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c              | 38 +++++++++++++++-------
 15 files changed, 63 insertions(+), 50 deletions(-)

