Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA02EB26ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCrBezqLvu33yMrRkg/P5ZF1Mv+zbvsmIjtlzusdLeo=; b=4IunCpE4C8RZFDmvjG0Dq2C/oW
	R+UJXZw5LYcS2rTxOOGR1cB0cX2h947aNQRd5FeAEQ65LVoK1KrTFa0E3YfaTu1E5v4D+DBVGiWzS
	LPyjKo4yEKnJrtDD4Ow/lUuWVpIEvUtZuTwjMS3kXiEiYPOW82AY1S7Nec8bsaDMtAc69TrH1PyQd
	ZZZkX/Zy6drwXB2Cvx3NQ6RGi8+qxpk4i0V1XqO65i46F09LNEJ5NWefQUQdXPH8B/4J4XiwZA+Ro
	YRh4RdJuZ5iftrVy2gTOCbOnpuUFRkaXdO2oTJyp19PO9HEmKfa1YNXa9UqpdzMlfklnIdFyiniNH
	h8PkWmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprDM-0000000HJPk-1e2m;
	Tue, 10 Feb 2026 17:07:52 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprDJ-0000000HJPI-2gYy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 17:07:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BC56D7A00D9;
	Tue, 10 Feb 2026 12:07:48 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 10 Feb 2026 12:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770743268;
	 x=1770829668; bh=wCrBezqLvu33yMrRkg/P5ZF1Mv+zbvsmIjtlzusdLeo=; b=
	Un4xGzCN53aojPY1YqtY886KdLEN8OnqdEw6uhynObazdOKb6D+gFvwkp9gInqK8
	uggmnIszMS1/BBpzexeoNZr2iqzs8iy5r7RbuIOYn8Af3VMqN6sFknEgEqr4S3Xd
	92E9WLy+OCyG2KQZdZFg0QkiamEoPWhLziS83SyDXkGj3a8zTqlm5upEwrjzE+rP
	SaIf0ekooMYHF3JvzXP0iRQQjR3qH3qxCn1R1Du+GgyTNfRRBqS57Ntel5Gjb5bG
	HScmZh5GyopKQQRPIyAMcdYti6+mO5dE0pcnNE/Qi+u/1xRqI6xqzhmvs+lukilm
	FRAlCoOIOOddDboNcruLcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770743268; x=
	1770829668; bh=wCrBezqLvu33yMrRkg/P5ZF1Mv+zbvsmIjtlzusdLeo=; b=k
	U5TpRNFRnEiPXUxkaMi8pdX1rqaqV0ik3oibL9A4BWrRIoUz7nak+nyVJ+2o5zTQ
	brxIRd+4l8QsvJGZaNcXJir7HulV/DJ2I7eHo4wJOUqTxrfhqEWQyc5nkUfsfkZk
	kDPPB4oZywf3L9a/s8BmnjAnOM8OUIIg+6nQOcHLcVBgU1tT9FolpY3Efv5YAG8a
	uDvWbEaqQQZcQyHj1KJVf6PTrEoatl/cTdeQdi0M6RbxXM0eEiiq+r7vQ94tdsnw
	KQqEavbs0aKhlclBmEkZvcsT2OUJjJt8+ctx7nK1fMHxczvND6d5dlUiStbpssPS
	bRJcwe0g9UsFNYNxyHyHA==
X-ME-Sender: <xms:5GWLaVby06xRQwiBisPqcyAvIZgZMp86hNBBtCyDY5-mo5AsBusfuA>
    <xme:5GWLaXNGzth2neaCKYpJ2izvikFGspGAklxrOy1y4N-CAz3y8YLmplxuQAPKPvbZz
    VYw7nYfTeTPdsPkq9d53fWUSvU_6qWtpPKNpUlIgwQr0PtVgDdiajwk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddtvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepjeefhfeliefgvedukeelkeekueejuedtieeggfevkedtjeeiffdugedtjeeuleeu
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhpvghngh
    huthhrohhnihigrdguvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhho
    uhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhi
    shhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5GWLafHvodq5l4H-fT0f4Pclp_9ujfUi7eM8vJv63lqIQwrOvEqfUQ>
    <xmx:5GWLaTOW3t9kG3JO297pbWck5534i_pkzCHqCc0nlpIQcmQDx2Rj9w>
    <xmx:5GWLaZdYzqBgX2WJNqnrbygWOTR0e1-xmfGmhyBZ-lZGoHwF8nizOA>
    <xmx:5GWLaYuMSP772_iA5VJYR6beSx1hOw6BQjErbohI9b-luMFKIBahtA>
    <xmx:5GWLaacoOJHe0ByKT2PBIm-VOU7Y6DyYnZzOWyCIdYn0ZoYBAYNfJA85>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 62A77700065; Tue, 10 Feb 2026 12:07:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYfK9ZjhzOaF
Date: Tue, 10 Feb 2026 18:07:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <0f7a14cd-de06-4b7c-b29b-cd827f688cb4@app.fastmail.com>
In-Reply-To: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com>
Subject: [GIT PULL 2/4] soc: driver updates for 7.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_090749_777947_578CCCC7 
X-CRM114-Status: GOOD (  15.64  )
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

The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f=
1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
rivers-7.0

for you to fetch changes up to cfd00b7e26c8331e3bb0f03ca770888866c15ff4:

  Merge tag 'soc_fsl-6.20-1' of https://git.kernel.org/pub/scm/linux/ker=
nel/git/chleroy/linux into soc/drivers (2026-02-04 08:41:49 +0100)

----------------------------------------------------------------
soc: driver updates for 7.0

There are are a number of to firmware drivers, in particular the TEE
subsystem:

  - a bus callback for TEE firmware that device drivers can register to
  - sysfs support for tee firmware information
  - minor updates to platform specific TEE drivers for AMD, NXP, Qualcomm
    and the generic optee driver
  - ARM SCMI firmware refactoring to improve the protocol discover
    among other fixes and cleanups
  - ARM FF-A firmware interoperability improvements

The reset controller and memory controller subsystems gain support for
additional hardware platforms from Mediatek, Renesas, NXP, Canaan and
SpacemiT.

Most of the other changes are for random drivers/soc code. Among
a number of cleanups and newly added hardware support, including:

 - Mediatek MT8196 DVFS power management and mailbox support

 - Qualcomm SCM firmware and MDT loader refactoring, as part of
   the new Glymur platform support.

 - NXP i.MX9 System Manager firmware support for accessing the
   syslog

 - Minor updates for TI, Renesas, Samsung, Apple, Marvell and AMD
   SoCs.

----------------------------------------------------------------
Alexander Wilhelm (3):
      soc: qcom: check QMI basic element error codes
      soc: qcom: fix QMI encoding/decoding for basic elements
      soc: qcom: preserve CPU endianness for QMI_DATA_LEN

Ally Heev (1):
      firmware: arm_scmi: Fix uninitialized pointers with __free attr

AngeloGioacchino Del Regno (5):
      soc: mediatek: mtk-dvfsrc: Change error check for DVFSRCv4 START c=
md
      soc: mediatek: mtk-dvfsrc: Add and propagate DVFSRC bandwidth type
      soc: mediatek: mtk-dvfsrc: Add a new callback for calc_dram_bw
      soc: mediatek: mtk-dvfsrc: Write bandwidth to EMI DDR if present
      soc: mediatek: mtk-dvfsrc: Add support for DVFSRCv4 and MT8196

Aristo Chen (2):
      tee: add revision sysfs attribute
      tee: optee: store OS revision for TEE core

Arnd Bergmann (24):
      Merge tag 'renesas-drivers-for-v6.20-tag1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'ffa-updates-7.0' of git://git.kernel.org/pub/scm/linux/=
kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'scmi-updates-7.0' of git://git.kernel.org/pub/scm/linux=
/kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'renesas-drivers-for-v6.20-tag2' of git://git.kernel.org=
/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'qcomtee-fixes-for-6.20' of git://git.kernel.org/pub/scm=
/linux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'optee-update-for-6.20' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'tee-bus-callback-for-6.20' of git://git.kernel.org/pub/=
scm/linux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'amdtee-update-for-6.20' of git://git.kernel.org/pub/scm=
/linux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'tee-sysfs-for-6.20' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'samsung-drivers-6.20' of https://git.kernel.org/pub/scm=
/linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'tegra-for-6.20-soc' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'zynqmp-soc-for-6.20' of https://github.com/Xilinx/linux=
-xlnx into soc/drivers
      Merge tag 'imx-drivers-6.20' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/shawnguo/linux into soc/drivers
      Merge tag 'ti-driver-soc-for-v6.20' of https://git.kernel.org/pub/=
scm/linux/kernel/git/ti/linux into soc/drivers
      Merge tag 'qcom-drivers-for-6.20' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'apple-soc-drivers-6.20' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/sven/linux into soc/drivers
      Merge tag 'mtk-soc-for-v6.20' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/mediatek/linux into soc/drivers
      Merge tag 'omap-for-v6.20/drivers-signed' of git://git.kernel.org/=
pub/scm/linux/kernel/git/khilman/linux-omap into soc/drivers
      Merge tag 'amlogic-drivers-for-v6.20' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/amlogic/linux into soc/drivers
      Merge tag 'memory-controller-drv-6.20' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'reset-for-v6.20' of https://git.pengutronix.de/git/pza/=
linux into soc/drivers
      Merge tag 'mvebu-arm-6.20-1' of git://git.kernel.org/pub/scm/linux=
/kernel/git/gclement/mvebu into soc/drivers
      Merge tag 'v6.20-rockchip-drivers1' of https://git.kernel.org/pub/=
scm/linux/kernel/git/mmind/linux-rockchip into soc/drivers
      Merge tag 'soc_fsl-6.20-1' of https://git.kernel.org/pub/scm/linux=
/kernel/git/chleroy/linux into soc/drivers

Artem Shimko (1):
      firmware: arm_scmi: Refactor reset domain handling

Bartosz Golaszewski (3):
      reset: gpio: add the "compatible" property
      reset: gpio: suppress bind attributes in sysfs
      reset: gpio: check the return value of gpiod_set_value_cansleep()

Bjorn Andersson (1):
      Merge branch '20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm=
.com' into drivers-for-6.20

Chen Ni (1):
      soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ handler install=
/remove

Christophe Leroy (CS GROUP) (2):
      soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
      dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC E=
ngine Ports

Claudiu Beznea (2):
      reset: rzg2l-usbphy-ctrl: Propagate the return value of regmap_fie=
ld_update_bits()
      reset: rzg2l-usbphy-ctrl: Add suspend/resume support

Cl=C3=A9ment Le Goffic (5):
      dt-bindings: memory: factorise LPDDR props into SDRAM props
      dt-bindings: memory: introduce DDR4
      dt-bindings: memory: factorise LPDDR channel binding into SDRAM ch=
annel
      dt-bindings: memory: add DDR4 channel compatible
      dt-bindings: memory: SDRAM channel: standardise node name

Colin Ian King (1):
      optee: make read-only array attr static const

Cosmin Tanislav (1):
      soc: renesas: Enable ICU support on RZ/N2H

Cristian Marussi (2):
      firmware: arm_scmi: Rework protocol version negotiation logic
      firmware: arm_scmi: Remove legacy protocol versioning logic

Dale Whinham (1):
      firmware: qcom: scm: allow QSEECOM on Surface Pro 11

Dan Carpenter (1):
      firmware: arm_scmi: Move boiler plate code into the get info funct=
ions

Dmitry Baryshkov (1):
      soc: qcom: ubwc: add missing include

Geert Uytterhoeven (1):
      MAINTAINERS: Mark the OP-TEE mailing list moderated

Gui-Dong Han (1):
      bus: fsl-mc: fix use-after-free in driver_override_show()

Guodong Xu (4):
      dt-bindings: soc: spacemit: Add K3 reset support and IDs
      reset: Create subdirectory for SpacemiT drivers
      reset: spacemit: Extract common K1 reset code
      reset: spacemit: Add SpacemiT K3 reset driver

Haotian Zhang (3):
      clk: qcom: Return correct error code in qcom_cc_probe_by_index()
      soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_d=
b_dev_probe
      hwspinlock: omap: Handle devm_pm_runtime_enable() errors

Haoxiang Li (2):
      firmware: arm_ffa: Unmap Rx/Tx buffers on init failure
      bus: fsl-mc: fix an error handling in fsl_mc_device_add()

Herve Codina (Schneider Electric) (5):
      of/irq: Introduce for_each_of_imap_item
      of: unittest: Add a test case for for_each_of_imap_item iterator
      irqchip/ls-extirq: Use for_each_of_imap_item iterator
      irqchip/renesas-rza1: Use for_each_of_imap_item iterator
      soc: renesas: Add support for RZ/N1 GPIO Interrupt Multiplexer

Jason-JH Lin (8):
      mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generatin=
g instruction
      mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
      mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM trans=
action
      mailbox: mtk-cmdq: Add driver data to support for MT8196
      soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_crea=
te()
      soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without =
subsys ID support
      soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write API for SoCs withou=
t subsys ID
      soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM ad=
dresses

Jingyi Wang (2):
      dt-bindings: interrupt-controller: qcom,pdc: Document Kaanapali Po=
wer Domain Controller
      dt-bindings: sram: Document qcom,kaanapali-imem and its child node

Johan Hovold (7):
      memory: mtk-smi: fix device leaks on common probe
      memory: mtk-smi: fix device leak on larb probe
      memory: mtk-smi: clean up device link creation
      soc: ti: k3-socinfo: Fix compile testing
      soc: ti: k3-socinfo: Fix regmap leak on probe failure
      bus: omap-ocp2scp: fix OF populate on driver rebind
      bus: omap-ocp2scp: enable compile testing

Jorge Ramirez-Ortiz (1):
      soc: qcom: smem: handle ENOMEM error during probe

Julia Lawall (1):
      optee: update outdated comment

Junhui Liu (1):
      reset: canaan: k230: drop OF dependency and enable by default

Konrad Dybcio (1):
      soc: qcom: pmic_glink_altmode: Consume TBT3/USB4 mode notifications

Krzysztof Kozlowski (11):
      bus: qcom-ebi2: Simplify with scoped for each OF child loop
      tee: qcomtee: call: Fix confusing cleanup.h syntax
      tee: qcomtee: mem: Fix confusing cleanup.h syntax
      tee: qcomtee: user: Fix confusing cleanup.h syntax
      soc: dove: pmu: Simplify with scoped for each OF child loop
      soc: ti: knav_qmss: Remove ENOMEM printks
      soc: ti: knav_dma: Remove ENOMEM printks
      soc: ti: knav_dma: Simplify error messages in probe
      soc: ti: knav: Simplify with scoped for each OF child loop
      soc: ti: knav_dma: Simplify with scoped for each OF child loop
      soc: fsl: qe: Simplify with scoped for each OF child loop

Laurentiu Mihalcea (4):
      reset: imx8mp-audiomix: Drop unneeded macros
      reset: imx8mp-audiomix: Switch to using regmap API
      reset: imx8mp-audiomix: Extend the driver usage
      reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV

Louis-Alexis Eyraud (1):
      soc: mediatek: mtk-socinfo: Add entry for MT8371AV/AZA Genio 520

Luca Weiss (2):
      dt-bindings: crypto: qcom,prng: document Milos
      dt-bindings: qcom,pdc: document the Milos Power Domain Controller

Marco Crivellari (1):
      soc/xilinx: replace use of system_unbound_wq with system_dfl_wq

Michal Simek (1):
      cpuidle: zynq: Switch Michal Simek's email to new one

Mukesh Ojha (13):
      dt-bindings: remoteproc: qcom,pas: Add iommus property
      firmware: qcom_scm: Remove redundant piece of code
      firmware: qcom_scm: Rename peripheral as pas_id
      firmware: qcom_scm: Introduce PAS context allocator helper function
      remoteproc: pas: Replace metadata context with PAS context structu=
re
      soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() fu=
nction
      soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported sym=
bols
      firmware: qcom_scm: Add a prep version of auth_and_reset function
      firmware: qcom_scm: Refactor qcom_scm_pas_init_image()
      firmware: qcom_scm: Add SHM bridge handling for PAS when running w=
ithout QHEE
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resour=
ce table
      remoteproc: pas: Extend parse_fw callback to fetch resources via S=
MC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU manage=
d by Linux

Nick Xie (1):
      soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4

Nicolas Frattaroli (3):
      dt-bindings: soc: mediatek: dvfsrc: Document clock
      soc: mediatek: mtk-dvfsrc: Get and Enable DVFSRC clock
      soc: mediatek: mtk-dvfsrc: Rework bandwidth calculations

Pankaj Patil (3):
      dt-bindings: cache: qcom,llcc: Document Glymur LLCC block
      soc: qcom: llcc-qcom: Add support for Glymur
      dt-bindings: cache: qcom,llcc: Remove duplicate llcc7_base for Gly=
mur

Peng Fan (6):
      firmware: arm_scmi: imx: Support getting syslog of MISC protocol
      firmware: imx: sm-misc: Dump syslog info
      soc: imx: Use device-managed APIs for i.MX9
      soc: imx: Use dev_err_probe() for i.MX9
      soc: imx: Spport i.MX9[4,52]
      soc: imx8m: Fix error handling for clk_prepare_enable()

Philipp Zabel (1):
      Merge tag 'spacemit-clkrst-v6.20-3' into reset/next

Prathamesh Shete (1):
      soc/tegra: pmc: Fix unsafe generic_handle_irq() call

Randy Dunlap (1):
      firmware: ti_sci.h: fix all kernel-doc warnings

Rob Herring (Arm) (1):
      dt-bindings: soc: samsung: exynos-pmu: Drop unnecessary select sch=
ema

Shawn Lin (2):
      soc: rockchip: grf: Fix wrong RK3576_IOCGRF_MISC_CON definition
      soc: rockchip: grf: Support multiple grf to be handled

Sudeep Holla (2):
      firmware: arm_ffa: Tie FF-A version checks to specific features
      firmware: arm_ffa: Correct 32-bit response handling in NOTIFICATIO=
N_INFO_GET

SungMin Park (1):
      dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC

Sven Peter (1):
      soc: apple: rtkit: Add function to poweroff

Thierry Reding (10):
      soc/tegra: pmc: Use contextual data instead of global variable
      soc/tegra: pmc: Pass struct tegra_pmc to tegra_powergate_state()
      soc/tegra: pmc: Store PMC context in clocks
      soc/tegra: pmc: Embed reboot notifier in PMC context
      soc/tegra: pmc: Pass PMC context via sys-off callback data
      soc/tegra: pmc: Pass PMC context as debugfs data
      soc/tegra: pmc: Use PMC context embedded in powergates
      soc/tegra: pmc: Use driver-private data
      soc/tegra: pmc: Do not rely on global variable
      soc/tegra: pmc: Add PMC contextual functions

Thorsten Blum (1):
      tee: amdtee: Remove unused return variables

Tudor Ambarus (6):
      soc: samsung: exynos-chipid: use devm action to unregister soc dev=
ice
      soc: samsung: exynos-chipid: use dev_err_probe where appropiate
      dt-bindings: nvmem: add google,gs101-otp
      soc: samsung: exynos-chipid: rename method
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc=
 info
      soc: samsung: exynos-chipid: add google,gs101-otp support

Unnathi Chalicheemala (3):
      firmware: qcom_scm: Add API to get waitqueue IRQ info
      firmware: qcom_scm: Support multiple waitq contexts
      firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()

Uwe Kleine-K=C3=B6nig (20):
      bus: fsl-mc: Drop error message in probe function
      bus: fsl-mc: Convert to bus callbacks
      tee: Add some helpers to reduce boilerplate for tee client drivers
      tee: Add probe, remove and shutdown bus callbacks to tee_client_dr=
iver
      tee: Adapt documentation to cover recent additions
      rtc: optee: Migrate to use tee specific driver registration functi=
on
      rtc: optee: Make use of tee bus methods
      hwrng: optee - Make use of module_tee_client_driver()
      hwrng: optee - Make use of tee bus methods
      efi: stmm: Make use of module_tee_client_driver()
      efi: stmm: Make use of tee bus methods
      firmware: arm_scmi: optee: Make use of module_tee_client_driver()
      firmware: arm_scmi: Make use of tee bus methods
      firmware: tee_bnxt: Make use of module_tee_client_driver()
      firmware: tee_bnxt: Make use of tee bus methods
      KEYS: trusted: Migrate to use tee specific driver registration fun=
ction
      KEYS: trusted: Make use of tee bus methods
      tpm/tpm_ftpm_tee: Make use of tee specific driver registration
      tpm/tpm_ftpm_tee: Make use of tee bus methods
      tpm/tpm_ftpm_tee: Fix kdoc after function renames

Vivek Aknurwar (1):
      firmware: arm_scmi: Increase performance MAX_OPPS limit to 64

Vladimir Zapolskiy (1):
      ARM: s3c: remove a leftover hwmon-s3c.h header file

Wentao Liang (1):
      soc: ti: pruss: Fix double free in pruss_clk_mux_setup()

Yixun Lan (4):
      clk: spacemit: prepare common ccu header
      reset: spacemit: fix auxiliary device id
      Merge tags 'spacemit-clkrst-v6.20-1' and 'spacemit-clkrst-v6.20-2'=
 into spacemit-clkrst-v6.20
      clk: spacemit: k3: extract common header

Zilin Guan (1):
      soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()

 Documentation/ABI/testing/sysfs-class-tee          |  10 +
 .../devicetree/bindings/cache/qcom,llcc.yaml       |  46 +-
 .../devicetree/bindings/crypto/qcom,prng.yaml      |   1 +
 .../interrupt-controller/fsl,qe-ports-ic.yaml      |  51 +++
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   2 +
 .../memory-controllers/ddr/jedec,ddr4.yaml         |  34 ++
 .../memory-controllers/ddr/jedec,lpddr-props.yaml  |  74 ---
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |   2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |   2 +-
 .../memory-controllers/ddr/jedec,lpddr4.yaml       |   2 +-
 .../memory-controllers/ddr/jedec,lpddr5.yaml       |   2 +-
 ...lpddr-channel.yaml =3D> jedec,sdram-channel.yaml} |  40 +-
 .../memory-controllers/ddr/jedec,sdram-props.yaml  |  94 ++++
 .../bindings/nvmem/google,gs101-otp.yaml           |  61 +++
 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml       |   6 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |  23 +-
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
 Documentation/devicetree/bindings/sram/sram.yaml   |   2 +
 Documentation/driver-api/tee.rst                   |  18 +-
 MAINTAINERS                                        |   6 +-
 drivers/bus/Kconfig                                |   2 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c                    |  89 ++--
 drivers/bus/omap-ocp2scp.c                         |  13 +-
 drivers/bus/qcom-ebi2.c                            |   7 +-
 drivers/char/hw_random/optee-rng.c                 |  26 +-
 drivers/char/tpm/tpm_ftpm_tee.c                    |  35 +-
 drivers/clk/qcom/common.c                          |   2 +-
 drivers/cpuidle/cpuidle-zynq.c                     |   2 +-
 drivers/firmware/arm_ffa/driver.c                  |  48 +-
 drivers/firmware/arm_scmi/base.c                   |  11 +-
 drivers/firmware/arm_scmi/clock.c                  |  24 +-
 drivers/firmware/arm_scmi/driver.c                 |  98 +++-
 drivers/firmware/arm_scmi/perf.c                   |  59 +--
 drivers/firmware/arm_scmi/pinctrl.c                | 120 ++---
 drivers/firmware/arm_scmi/power.c                  |  18 +-
 drivers/firmware/arm_scmi/powercap.c               |  21 +-
 drivers/firmware/arm_scmi/protocols.h              |   9 +-
 drivers/firmware/arm_scmi/reset.c                  |  68 +--
 drivers/firmware/arm_scmi/sensors.c                |  22 +-
 drivers/firmware/arm_scmi/shmem.c                  |   5 +-
 drivers/firmware/arm_scmi/system.c                 |  14 +-
 drivers/firmware/arm_scmi/transports/optee.c       |  32 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c |  10 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c |   9 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c |   9 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  93 +++-
 drivers/firmware/arm_scmi/voltage.c                |  13 +-
 drivers/firmware/broadcom/tee_bnxt_fw.c            |  30 +-
 drivers/firmware/efi/stmm/tee_stmm_efi.c           |  25 +-
 drivers/firmware/imx/sm-misc.c                     |  37 +-
 drivers/firmware/qcom/qcom_scm.c                   | 507 ++++++++++++++=
++++---
 drivers/firmware/qcom/qcom_scm.h                   |   2 +
 drivers/firmware/ti_sci.h                          |  29 +-
 drivers/hwspinlock/omap_hwspinlock.c               |   4 +-
 drivers/irqchip/irq-ls-extirq.c                    |  47 +-
 drivers/irqchip/irq-renesas-rza1.c                 |  43 +-
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  74 ++-
 drivers/memory/mtk-smi.c                           |  38 +-
 drivers/of/irq.c                                   |  70 +++
 drivers/of/unittest-data/tests-interrupts.dtsi     |   9 +
 drivers/of/unittest.c                              | 116 +++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 165 +++++--
 drivers/reset/Kconfig                              |  14 +-
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/core.c                               |   7 +-
 drivers/reset/reset-gpio.c                         |   9 +-
 drivers/reset/reset-imx8mp-audiomix.c              | 169 +++++--
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            | 110 ++++-
 drivers/reset/spacemit/Kconfig                     |  36 ++
 drivers/reset/spacemit/Makefile                    |   5 +
 drivers/reset/spacemit/reset-spacemit-common.c     |  77 ++++
 drivers/reset/spacemit/reset-spacemit-common.h     |  42 ++
 .../reset-spacemit-k1.c}                           | 109 +----
 drivers/reset/spacemit/reset-spacemit-k3.c         | 233 ++++++++++
 drivers/rtc/rtc-optee.c                            |  27 +-
 drivers/soc/amlogic/meson-gx-socinfo.c             |   1 +
 drivers/soc/apple/rtkit.c                          |  16 +
 drivers/soc/dove/pmu.c                             |   9 +-
 drivers/soc/fsl/qe/Makefile                        |   2 +-
 drivers/soc/fsl/qe/qe_ports_ic.c                   | 141 ++++++
 drivers/soc/fsl/qe/qmc.c                           |  13 +-
 drivers/soc/imx/soc-imx8m.c                        |   6 +-
 drivers/soc/imx/soc-imx9.c                         |  46 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c             |  77 +++-
 drivers/soc/mediatek/mtk-dvfsrc.c                  | 364 +++++++++++++--
 drivers/soc/mediatek/mtk-socinfo.c                 |   1 +
 drivers/soc/mediatek/mtk-svs.c                     |   5 +-
 drivers/soc/qcom/cmd-db.c                          |   7 +-
 drivers/soc/qcom/llcc-qcom.c                       | 207 +++++++++
 drivers/soc/qcom/mdt_loader.c                      |  51 ++-
 drivers/soc/qcom/pmic_glink_altmode.c              | 188 +++++++-
 drivers/soc/qcom/qmi_encdec.c                      | 137 +++++-
 drivers/soc/qcom/smem.c                            |   4 +-
 drivers/soc/renesas/Kconfig                        |   5 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/rzn1_irqmux.c                  | 127 ++++++
 drivers/soc/rockchip/grf.c                         |  57 ++-
 drivers/soc/samsung/exynos-chipid.c                | 133 ++++--
 drivers/soc/tegra/pmc.c                            | 425 +++++++++++++-=
---
 drivers/soc/ti/Kconfig                             |   2 +-
 drivers/soc/ti/k3-socinfo.c                        |   2 +-
 drivers/soc/ti/knav_dma.c                          |  21 +-
 drivers/soc/ti/knav_qmss_queue.c                   |  25 +-
 drivers/soc/ti/pruss.c                             |   6 +-
 drivers/soc/xilinx/zynqmp_power.c                  |   6 +-
 drivers/tee/amdtee/call.c                          |   8 +-
 drivers/tee/optee/core.c                           |  23 +
 drivers/tee/optee/ffa_abi.c                        |  54 ++-
 drivers/tee/optee/optee_private.h                  |  19 +
 drivers/tee/optee/rpc.c                            |   6 +-
 drivers/tee/optee/smc_abi.c                        |  15 +-
 drivers/tee/qcomtee/call.c                         |  17 +-
 drivers/tee/qcomtee/mem_obj.c                      |   4 +-
 drivers/tee/qcomtee/user_obj.c                     |   8 +-
 drivers/tee/tee_core.c                             | 135 +++++-
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++
 include/linux/firmware/qcom/qcom_scm.h             |  30 +-
 include/linux/mailbox/mtk-cmdq-mailbox.h           |  19 +
 include/linux/of_irq.h                             |  41 +-
 include/linux/platform_data/hwmon-s3c.h            |  36 --
 include/linux/scmi_imx_protocol.h                  |   2 +
 include/linux/soc/apple/rtkit.h                    |   7 +
 include/linux/soc/mediatek/mtk-cmdq.h              |  93 ++++
 include/linux/soc/qcom/llcc-qcom.h                 |   4 +
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 include/linux/soc/qcom/ubwc.h                      |   1 +
 include/linux/tee_core.h                           |   9 +
 include/linux/tee_drv.h                            |  12 +
 include/soc/spacemit/ccu.h                         |  21 +
 include/soc/spacemit/k1-syscon.h                   |  12 +-
 include/soc/spacemit/k3-syscon.h                   | 273 +++++++++++
 include/soc/tegra/pmc.h                            |  60 ++-
 security/keys/trusted-keys/trusted_tee.c           |  17 +-
 134 files changed, 5124 insertions(+), 1462 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controll=
er/fsl,qe-ports-ic.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers=
/ddr/jedec,ddr4.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers=
/ddr/jedec,lpddr-props.yaml
 rename Documentation/devicetree/bindings/memory-controllers/ddr/{jedec,=
lpddr-channel.yaml =3D> jedec,sdram-channel.yaml} (76%)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers=
/ddr/jedec,sdram-props.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/google,gs101=
-otp.yaml
 create mode 100644 drivers/reset/spacemit/Kconfig
 create mode 100644 drivers/reset/spacemit/Makefile
 create mode 100644 drivers/reset/spacemit/reset-spacemit-common.c
 create mode 100644 drivers/reset/spacemit/reset-spacemit-common.h
 rename drivers/reset/{reset-spacemit.c =3D> spacemit/reset-spacemit-k1.=
c} (78%)
 create mode 100644 drivers/reset/spacemit/reset-spacemit-k3.c
 create mode 100644 drivers/soc/fsl/qe/qe_ports_ic.c
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c
 create mode 100644 include/dt-bindings/reset/spacemit,k3-resets.h
 delete mode 100644 include/linux/platform_data/hwmon-s3c.h
 create mode 100644 include/soc/spacemit/ccu.h
 create mode 100644 include/soc/spacemit/k3-syscon.h

