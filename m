Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F91C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 18:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flr87GOP6v2WQOdZJxIo/dajQx8oKeJRQgHa/YZy8Ls=; b=20AaKcamT/OZTbLyoKgYVoi2wT
	yg3cWJRHTu8YTSbneH3z7mzao/p3bS/W06BSc1pLwWwtxvms7mEQFs6CgDgsNEf3yAjX9oWQTOsuo
	e+4M/CEzlLFLsi/xwNlIqpM1IkedMYhL1TDU6UZjKoI167LTVyo74SXZFyN/QVXpUNp350vhPkn5O
	Re/oKK/A38VhpiqylypL/jCPbwEuQyVvuk0rlFMlWmfhxUfzMT/7zR5Ab5Uggx2ZKZ3FvpN1BIetN
	DA7BrzK12Azw18g9NxvdiZzqHrhVK8h2wx55KKWvWJD2VwN7Eusx5cP5TsW6Gz1aYSNHJ2zbozOOU
	pjuQ9qsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueHLg-00000003D7O-3YQE;
	Tue, 22 Jul 2025 18:04:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFvY-000000032N7-3myu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 16:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=flr87GOP6v2WQOdZJxIo/dajQx8oKeJRQgHa/YZy8Ls=; b=RdOqZVtidkf6vIRThm1yIuhaY7
	npzEUQPbTu0pZJ4mycl7OpdiI2LbIYraTc0KayXtfAdVUjtNDO9b5CKkb0+kfv4mCO9HJQ/N3kMGA
	PX+7NNdRmQ2qFZ39KTCsy2loXKlm7267uTHYlcckquOCNp/PmTFw8sQQF19b6xrwxUPTBzu2naMA1
	r3rF/Gh+RLKMBbHeENGkGpFDFhb+asVquEiLz8AX/l8xkaAc14iAFoJ16L3KmCNXvLfLPzPowT8Vs
	Y+judFX2ziNtFBpwxdC33dBeeYnesqmSQQOCw2mWx/tlhBQLqq3RTmJbmzj2S0/fIUovR9NqaYK6e
	PLKH0G1Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFvV-0000000BJUC-03CB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 16:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32B4E5C5E40
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 16:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BACEC4CEF1;
	Tue, 22 Jul 2025 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753201990;
	bh=w2/ci76DUFL6xmng0J7+GpGfL1XTqIZLE6fWvpruW3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bUyjQbFBa25rFaLtI4a0MJ5dF3CtVjOjO1VnuRONqZFsfylOqgw9EWCznMyAtut+n
	 HmGR4XlEeSKSarrlab1rJP6884OW0moewIKrS7/wMe6SMWv44dBSMhr9+RWE+nM3EY
	 O408prv1drYa44V5ouupdWBZyPyQhVmX1IrBzBF2ZsAParjPo91irK663P7fxEcohq
	 UtuZhd48iUXNpfM7MiAPKKZ4CqhHXiR9L8tpws4Vh4dHWSMvuWsEdjN9tYPd47HjeH
	 iC04WAlYI1fgpuIG80ZVlSDmq5YgVFX5Kx8gDh29Om5rnaOIQ5DPLI7EhbE879fXCD
	 us4qRREgbyG+w==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL 2/2] Apple SoC device tree changes for v6.17
Date: Tue, 22 Jul 2025 18:32:58 +0200
Message-Id: <20250722163258.62424-2-sven@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250722163258.62424-1-sven@kernel.org>
References: <20250722163258.62424-1-sven@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_173313_505548_B4CADD2E 
X-CRM114-Status: GOOD (  10.73  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git apple-soc-dt-6.17

for you to fetch changes up to 76f3ffeb41d8700c22005211521bf692f2551668:

  arm64: dts: apple: Add Apple SoC GPU (2025-07-21 15:22:10 +0000)

----------------------------------------------------------------
Apple SoC device tree changes for v6.17

- Added the bindings and nodes for Apple SoC GPU. The driver itself
  isn't ready for upstreaming yet due to rust dependencies but we're
  confident that the bindings are stable at this point.
- Added a missing node for the touchbar framebuffer to Apple T2 device
  trees, which is the BMC for some x86 Macs
- Fixed a W=1 warning by adding bit offsets to NVMEM node names. This
  required a change to the generic NVMEM cell binding which will be part
  of 6.17 through the NVMEM tree.

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Nick Chan (1):
      arm64: dts: apple: t8012-j132: Include touchbar framebuffer node

Sasha Finkelstein (2):
      dt-bindings: gpu: Add Apple SoC GPU
      arm64: dts: apple: Add Apple SoC GPU

Sven Peter (1):
      arm64: dts: apple: Add bit offset to PMIC NVMEM node names

 .../devicetree/bindings/gpu/apple,agx.yaml         | 94 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/apple/t6000.dtsi               |  4 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |  4 +
 arch/arm64/boot/dts/apple/t6002.dtsi               |  4 +
 arch/arm64/boot/dts/apple/t600x-common.dtsi        | 34 ++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          | 34 +++++++-
 arch/arm64/boot/dts/apple/t8012-j132.dts           |  1 +
 arch/arm64/boot/dts/apple/t8103.dtsi               | 68 +++++++++++++++-
 arch/arm64/boot/dts/apple/t8112.dtsi               | 68 +++++++++++++++-
 10 files changed, 303 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/apple,agx.yaml

