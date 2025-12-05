Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9C5D339A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 18:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1S5D826pKTC2f39c+Yu26uzOlWyC5PDTxbAW+TMJ+ho=; b=Up/VmuQ0uo1XGdZVfa10wK2W1L
	0kVgTPvN1ttDgSuuSy7BHfjIaEacGQPqvyHj3CTRtVKsj5W6jgtX5sEJw3NtM24mAVTEe7sSAjiVX
	Kw7/ajpIlQs/KOwz/1jUGrek71Khnj7MRdZbZiS8Nsb1+KtNsM8aTnTOk8CRCrLs5UMFMiopvK/D8
	Edzgz3GO7QUagtrddLjz7kROyK5c5KSrxxb+eckDelLswdGDCcG63ymoq0nHoUdjpOT+mzks/JHkf
	SWx++4Fy4zopBFYEWF/yufaA+Awr4LecjdYMl3wVSe/NKRZvukZ6rL5Tz7WK6+Tq6H63TE0JmJLao
	bXRajwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaYp-00000009oJP-0mms;
	Fri, 05 Dec 2025 18:29:43 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaYm-00000009oIv-2eNl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 18:29:42 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id EFC4E1D00160;
	Fri,  5 Dec 2025 13:29:39 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 13:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764959379;
	 x=1765045779; bh=1S5D826pKTC2f39c+Yu26uzOlWyC5PDTxbAW+TMJ+ho=; b=
	YVT+2evpjW5NyFviQ+xF8TnBFeWAjSvXXPwra4uBYaib3mXmF4KiHKR8/q6w6laE
	B61faHQ7STnOfJrw9fN9OBplqHipSz6LK9zrrGH493PWQQEIO9pa2LTz8n9ACPXp
	KJDV3qEaD1ZdupXrXnvIruQxIQSQNM+2GSYQtN1AsM2SyKGj1yB5VpE5s6fKN9z3
	7slHShCjDWpCe0TGCrC/snAjRY6+5DxjZdDgASr8OUUNj3sYpqXEYUck9COhNQKQ
	cmiKM/jkJKQgCoFLZv27YHNeVi6uI8Q50F/ed2ZVr+iB6TksLaQWh2fLM//tO4wK
	0bdSDu25ftFJSK2mtI8QYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764959379; x=
	1765045779; bh=1S5D826pKTC2f39c+Yu26uzOlWyC5PDTxbAW+TMJ+ho=; b=s
	rkcCsFVsUmqEH0YQVSD69hq+I4B1TllrE5Vdsr1RlL+qzuyFM3H1SDKdlYgglJ2n
	2FdMNtVXnVtNaHWdisir7M8OPmVNUWGdsYzaaqJds+ke+G/fMkEJqAH7tee4+NEe
	E+s8YLqWOGxh9/ducRrV08fjugZYsgjjkVRVyEvw82EYBYo9X6072Mtf6T+QcDJR
	USECnUGQ5gf9DLPboKWGcvRc30MOufgDsbBl1N/B7S6o3YchisFxM6and8TuIzCT
	NKhwoYp3KUQeTNwVIVBT0sw9M5oPQbiXsNJ/Hxkt9oE8yRqpHerSZp0/mNXEHjl7
	nCXo7QwE7lZuF/S5EjVNA==
X-ME-Sender: <xms:kyQzaTv0Lfez-rDkVENEPEbRu9wS_SdajfOOZ9y948ba7yYmCJeu2Q>
    <xme:kyQzafTS8LMwQ23NwiJPg9HFmQ7lpeh7ftf4Xf_okkFm6aJ6FMKQE8a01X53vAe4N
    eri4HfV5aLyH41XuMGn7LktOp1a3zII-MZbNSQucceRTZPkpB0jWd8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeluddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epjeefhfeliefgvedukeelkeekueejuedtieeggfevkedtjeeiffdugedtjeeuleeunecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhpvghnghhuth
    hrohhnihigrdguvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:kyQzaVbII824su0cCISztIIY2f8xE-SrH2iD_BdIBZs22ry91Jmbtg>
    <xmx:kyQzaTR3rtxWR4wkWn-XSvoWPRZwBJVC4GIGHcKWggqdZTt3RUUUfg>
    <xmx:kyQzaQQMZFQZp8wdSzqaoAPCXuR_4tw447iZdURb1QuoXt0f6kvzBg>
    <xmx:kyQzafTfteLVChnW3cWU9OTNc4lPj-0J5qVldngmFo3ZgXg1YSZ9GA>
    <xmx:kyQzafjXvtw47scaX2q6HeOu4SwPPMrx9gBWi0Wc-z1sJ6m2MRlICH6q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 97742C4006B; Fri,  5 Dec 2025 13:29:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Am9m4lpOTbR7
Date: Fri, 05 Dec 2025 19:29:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <dceb9f99-cb69-498f-9717-34e3f28c8fc1@app.fastmail.com>
In-Reply-To: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
Subject: [GIT PULL 5/6] soc: driver updates for 6.19
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_102940_761402_277F677B 
X-CRM114-Status: GOOD (  14.47  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56=
787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
rivers-6.19

for you to fetch changes up to 4b1e81570144f03521482f7659fee060d8f63481:

  Merge tag 'mtk-soc-for-v6.19' of https://git.kernel.org/pub/scm/linux/=
kernel/git/mediatek/linux into soc/drivers (2025-11-25 14:52:14 +0100)

----------------------------------------------------------------
soc: driver updates for 6.19

This is the first half of the driver changes:

 - A treewide interface change to the "syscore" operations for
   power management, as a preparation for future Tegra specific
   changes.

 - Reset controller updates with added drivers for LAN969x, eic770
   and RZ/G3S SoCs.

 - Protection of system controller registers on Renesas and Google SoCs,
   to prevent trivially triggering a system crash from e.g. debugfs
   access.

 - soc_device identification updates on Nvidia, Exynos and Mediatek

 - debugfs support in the ST STM32 firewall driver

 - Minor updates for SoC drivers on AMD/Xilinx, Renesas,  Allwinner, TI

 - Cleanups for memory controller support on Nvidia and Renesas

----------------------------------------------------------------
Aaron Kling (2):
      soc/tegra: fuse: speedo-tegra210: Update speedo IDs
      soc/tegra: fuse: speedo-tegra210: Add SoC speedo 2

Abel Vesa (1):
      soc: qcom: ubwc: Add configuration Glymur platform

Akhil P Oommen (1):
      soc: qcom: ubwc: Add config for Kaanapali

Alexandru Chimac (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos9610 compati=
ble
      soc: samsung: exynos-chipid: Add exynos9610 SoC support

Andr=C3=A9 Draszik (4):
      soc: samsung: exynos-pmu: allow specifying read & write access tab=
les for secure regmap
      soc: samsung: exynos-pmu: move some gs101 related code into new fi=
le
      soc: samsung: gs101-pmu: implement access tables for read and write
      dt-bindings: soc: samsung: exynos-sysreg: add power-domains

Anjelique Melendez (1):
      soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels

Arnd Bergmann (17):
      Merge tag 'zynqmp-soc-for-6.18' of https://github.com/Xilinx/linux=
-xlnx into soc/drivers
      Merge tag 'renesas-drivers-for-v6.19-tag1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'memory-controller-drv-6.19-2' of https://git.kernel.org=
/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'samsung-drivers-6.19' of https://git.kernel.org/pub/scm=
/linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'renesas-drivers-for-v6.19-tag2' of git://git.kernel.org=
/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'tegra-for-6.19-core' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'tegra-for-6.19-syscore' of git://git.kernel.org/pub/scm=
/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'tegra-for-6.19-soc' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'sunxi-drivers-for-6.19' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/sunxi/linux into soc/drivers
      Merge tag 'imx-drivers-6.19' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/shawnguo/linux into soc/drivers
      Merge tag 'ti-driver-soc-for-v6.19' of https://git.kernel.org/pub/=
scm/linux/kernel/git/ti/linux into soc/drivers
      Merge tag 'omap-for-v6.19/drivers-signed' of git://git.kernel.org/=
pub/scm/linux/kernel/git/khilman/linux-omap into soc/drivers
      Merge tag 'qcom-drivers-for-6.19' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'v6.19-rockchip-drivers1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/mmind/linux-rockchip into soc/drivers
      Merge tag 'stm32-bus-firewall-for-v6.19-1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/atorgue/stm32 into soc/drivers
      Merge tag 'reset-for-v6.19' of https://git.pengutronix.de/git/pza/=
linux into soc/drivers
      Merge tag 'mtk-soc-for-v6.19' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/mediatek/linux into soc/drivers

Bartosz Golaszewski (2):
      clk: davinci: psc: drop unused reset lookup
      reset: remove legacy reset lookup code

Biju Das (1):
      memory: renesas-rpc-if: Add suspend/resume support

Bruno Sobreira Fran=C3=A7a (1):
      soc/tegra: Resolve a spelling error in the tegra194-cbb.c

Christian Marangi (2):
      err.h: add INIT_ERR_PTR() macro
      soc: qcom: smem: better track SMEM uninitialized state

Claudiu Beznea (5):
      soc: renesas: r9a09g056-sys: Populate max_register
      soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regm=
ap config
      dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S sup=
port
      reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
      reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC

Dan Carpenter (1):
      reset: rzg2l-usbphy-ctrl: Fix a NULL vs IS_ERR() bug in probe

Denzeel Oliva (1):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 c=
ompatibles

Encrow Thorne (1):
      reset: fix BIT macro reference

Gabor Juhos (2):
      soc: qcom: mdt_loader: merge __qcom_mdt_load() and qcom_mdt_load_n=
o_init()
      soc: qcom: mdt_loader: rename 'firmware' parameter of qcom_mdt_loa=
d()

Gatien Chevallier (2):
      dt-bindings: bus: add stm32mp21 RIFSC compatible
      bus: rifsc: add debugfs entry to dump the firewall configuration

Haotian Zhang (2):
      soc: qcom: gsbi: fix double disable caused by devm
      soc: qcom: smem: fix hwspinlock resource leak in probe error paths

Haotien Hsu (1):
      soc/tegra: pmc: Add USB wake events for Tegra234

Heiko Stuebner (1):
      soc: rockchip: grf: Add select correct PWM implementation on RK3368

Ivaylo Ivanov (3):
      dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid =
compatible
      soc: samsung: exynos-chipid: add exynos8890 SoC support

Jay Buddhabhatti (3):
      firmware: xilinx: Add Versal NET platform compatible string
      drivers: firmware: xilinx: Add unique family code for all platforms
      drivers: firmware: xilinx: Switch to new family code in zynqmp_pm_=
get_family_info()

Jingyi Wang (6):
      dt-bindings: cache: qcom,llcc: Document the Kaanapali LLCC
      soc: qcom: llcc-qcom: Add support for Kaanapali
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8850
      soc: qcom: socinfo: Add SM8850 SoC ID
      dt-bindings: soc: qcom,aoss-qmp: Document the Kaanapali AOSS chann=
el
      dt-bindings: firmware: qcom,scm: Document SCM on Kaanapali SOC

Johan Hovold (3):
      soc: qcom: ocmem: fix device leak on lookup
      soc: qcom: pbs: fix device leak on lookup
      amba: tegra-ahb: Fix device leak on SMMU enable

Jon Hunter (1):
      memory: tegra186-emc: Fix missing put_bpmp

Kartik Rajput (1):
      soc/tegra: fuse: Do not register SoC device on ACPI boot

Kathiravan Thirumoorthy (4):
      soc: qcom: socinfo: arrange the socinfo_image_names array in alpha=
betical order
      soc: qcom: socinfo: add the missing entries to the smem image table
      soc: qcom: smem: drop the WARN_ON() on SMEM item validation
      soc: qcom: socinfo: add support to extract more than 32 image vers=
ions

Kaustabh Chakraborty (2):
      dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for =
Exynos7870 PMU

Komal Bajaj (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for QCS6490
      soc: qcom: socinfo: Add SoC ID for QCS6490

Krzysztof Kozlowski (14):
      memory: tegra124-emc: Simplify return of emc_init()
      memory: tegra124-emc: Do not print error on icc_node_create() fail=
ure
      memory: tegra186-emc: Do not print error on icc_node_create() fail=
ure
      memory: tegra20-emc: Do not print error on icc_node_create() failu=
re
      memory: tegra30-emc: Do not print error on icc_node_create() failu=
re
      memory: tegra30-emc: Simplify and handle deferred probe with dev_e=
rr_probe()
      memory: tegra20-emc: Simplify and handle deferred probe with dev_e=
rr_probe()
      memory: tegra186-emc: Simplify and handle deferred probe with dev_=
err_probe()
      memory: tegra124-emc: Simplify and handle deferred probe with dev_=
err_probe()
      memory: tegra124-emc: Add the SoC model prefix to functions
      memory: tegra186-emc: Add the SoC model prefix to functions
      memory: tegra20-emc: Add the SoC model prefix to functions
      memory: tegra30-emc: Add the SoC model prefix to functions
      soc: samsung: exynos-pmu: Annotate online/offline functions with _=
_must_hold

Louis-Alexis Eyraud (2):
      soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA Genio 720
      dt-bindings: soc: mediatek: pwrap: Add compatible for MT8189 SoC

Madhav Bhatt (1):
      firmware: xilinx: Add debugfs support for PM_GET_NODE_STATUS

Markus Schneider-Pargmann (TI.com) (2):
      firmware: ti_sci: Support transfers without response
      firmware: ti_sci: Partial-IO support

Matthias Schiffer (1):
      ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx

Mukesh Ojha (2):
      soc: qcom: socinfo: Add support for new fields in revision 20
      soc: qcom: socinfo: Add reserve field to support future extension

Neeraj Soni (1):
      soc: qcom: ice: Add HWKM v1 support for wrapped keys

Pankaj Patil (1):
      dt-bindings: firmware: qcom,scm: Document Glymur scm

Peng Fan (8):
      firmware: imx: scu-irq: fix OF node leak in
      firmware: imx: scu-irq: Free mailbox client on failure at imx_scu_=
enable_general_irq_channel()
      firmware: imx: scu-irq: Init workqueue before request mbox channel
      firmware: imx: scu-irq: Set mu_resource_id before get handle
      firmware: imx: scu-irq: Remove unused export of imx_scu_enable_gen=
eral_irq_channel
      firmware: imx: scu: Update error code
      firmware: imx: scu: Suppress bind attrs
      firmware: imx: scu: Use devm_mutex_init

Peter Griffin (1):
      dt-bindings: soc: samsung: exynos-sysreg: add gs101 hsi0 and misc =
compatibles

Prasad Kumpatla (1):
      soc: qcom: pd-mapper: Add Kaanapali compatible

Prathamesh Shete (1):
      soc/tegra: pmc: Don't fail if "aotag" is not present

Randy Dunlap (1):
      firmware: qcom: tzmem: fix qcom_tzmem_policy kernel-doc

Robert Marko (2):
      dt-bindings: reset: microchip: Add LAN969x support
      reset: sparx5: add LAN969x support

Sakari Ailus (1):
      bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls

Sibi Sankar (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Glymur AOSS side cha=
nnel

Sirius Wang (1):
      soc: mediatek: mtk-socinfo: Add extra entry for MT8189

Thierry Reding (2):
      syscore: Pass context data to callbacks
      soc/tegra: pmc: Document tegra_pmc.syscore field

Thomas Richard (TI.com) (2):
      firmware: ti_sci: Replace ifdeffery by pm_sleep_ptr() macro
      firmware: ti_sci: Set IO Isolation only if the firmware is capable

Tudor Ambarus (1):
      soc: samsung: exynos-chipid: use a local dev variable

WeiHao Li (1):
      soc: rockchip: grf: Set pwm2/xin32k pad default to xin32k for rk33=
68

Wolfram Sang (1):
      soc: renesas: rcar-rst: Keep RESBAR2S in default state

Xuyang Dong (2):
      dt-bindings: reset: eswin: Documentation for eic7700 SoC
      reset: eswin: Add eic7700 reset driver

Yao Zi (4):
      dt-bindings: reset: thead,th1520-reset: Remove non-VO-subsystem re=
sets
      dt-bindings: reset: thead,th1520-reset: Add controllers for more s=
ubsys
      reset: th1520: Prepare for supporting multiple controllers
      reset: th1520: Support reset controllers in more subsystems

Yongxing Mou (1):
      soc: qcom: ubwc: Add QCS8300 UBWC cfg

Yue Haibing (1):
      Documentation: reset: Remove reset_controller_add_lookup()

 .../bindings/bus/st,stm32mp25-rifsc.yaml           |   8 +-
 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   3 +
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |   2 +
 .../bindings/reset/eswin,eic7700-reset.yaml        |  42 ++
 .../devicetree/bindings/reset/microchip,rst.yaml   |  11 +-
 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |  41 +-
 .../bindings/reset/thead,th1520-reset.yaml         |   8 +-
 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |   1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   2 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   2 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |  23 +
 Documentation/driver-api/reset.rst                 |   1 -
 MAINTAINERS                                        |   1 +
 arch/arm/mach-exynos/mcpm-exynos.c                 |  12 +-
 arch/arm/mach-exynos/suspend.c                     |  48 +-
 arch/arm/mach-pxa/generic.h                        |   6 +-
 arch/arm/mach-pxa/irq.c                            |  10 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                     |  10 +-
 arch/arm/mach-pxa/mfp-pxa3xx.c                     |  10 +-
 arch/arm/mach-pxa/pxa25x.c                         |   4 +-
 arch/arm/mach-pxa/pxa27x.c                         |   4 +-
 arch/arm/mach-pxa/pxa3xx.c                         |   4 +-
 arch/arm/mach-pxa/smemc.c                          |  12 +-
 arch/arm/mach-s3c/irq-pm-s3c64xx.c                 |  12 +-
 arch/arm/mach-s5pv210/pm.c                         |  10 +-
 arch/arm/mach-versatile/integrator_ap.c            |  12 +-
 arch/arm/mm/cache-b15-rac.c                        |  12 +-
 arch/loongarch/kernel/smp.c                        |  12 +-
 arch/mips/alchemy/common/dbdma.c                   |  12 +-
 arch/mips/alchemy/common/irq.c                     |  24 +-
 arch/mips/alchemy/common/usb.c                     |  12 +-
 arch/mips/pci/pci-alchemy.c                        |  16 +-
 arch/powerpc/platforms/cell/spu_base.c             |  10 +-
 arch/powerpc/platforms/powermac/pic.c              |  12 +-
 arch/powerpc/sysdev/fsl_lbc.c                      |  12 +-
 arch/powerpc/sysdev/fsl_pci.c                      |  12 +-
 arch/powerpc/sysdev/ipic.c                         |  12 +-
 arch/powerpc/sysdev/mpic.c                         |  14 +-
 arch/powerpc/sysdev/mpic_timer.c                   |  10 +-
 arch/sh/mm/pmb.c                                   |  10 +-
 arch/x86/events/amd/ibs.c                          |  12 +-
 arch/x86/hyperv/hv_init.c                          |  12 +-
 arch/x86/kernel/amd_gart_64.c                      |  10 +-
 arch/x86/kernel/apic/apic.c                        |  12 +-
 arch/x86/kernel/apic/io_apic.c                     |  17 +-
 arch/x86/kernel/cpu/aperfmperf.c                   |  20 +-
 arch/x86/kernel/cpu/intel_epb.c                    |  16 +-
 arch/x86/kernel/cpu/mce/core.c                     |  14 +-
 arch/x86/kernel/cpu/microcode/core.c               |  15 +-
 arch/x86/kernel/cpu/mtrr/legacy.c                  |  12 +-
 arch/x86/kernel/cpu/umwait.c                       |  10 +-
 arch/x86/kernel/i8237.c                            |  10 +-
 arch/x86/kernel/i8259.c                            |  14 +-
 arch/x86/kernel/kvm.c                              |  12 +-
 drivers/acpi/pci_link.c                            |  10 +-
 drivers/acpi/sleep.c                               |  12 +-
 drivers/amba/tegra-ahb.c                           |   1 +
 drivers/base/firmware_loader/main.c                |  12 +-
 drivers/base/syscore.c                             |  82 +-
 drivers/bus/mvebu-mbus.c                           |  16 +-
 drivers/bus/stm32_rifsc.c                          | 597 ++++++++++++++-
 drivers/bus/sunxi-rsb.c                            |   2 -
 drivers/bus/ti-sysc.c                              |  11 +-
 drivers/clk/at91/pmc.c                             |  12 +-
 drivers/clk/davinci/psc-da850.c                    |   7 -
 drivers/clk/imx/clk-vf610.c                        |  12 +-
 drivers/clk/ingenic/jz4725b-cgu.c                  |   2 +-
 drivers/clk/ingenic/jz4740-cgu.c                   |   2 +-
 drivers/clk/ingenic/jz4755-cgu.c                   |   2 +-
 drivers/clk/ingenic/jz4760-cgu.c                   |   2 +-
 drivers/clk/ingenic/jz4770-cgu.c                   |   2 +-
 drivers/clk/ingenic/jz4780-cgu.c                   |   2 +-
 drivers/clk/ingenic/pm.c                           |  14 +-
 drivers/clk/ingenic/pm.h                           |   2 +-
 drivers/clk/ingenic/tcu.c                          |  12 +-
 drivers/clk/ingenic/x1000-cgu.c                    |   2 +-
 drivers/clk/ingenic/x1830-cgu.c                    |   2 +-
 drivers/clk/mvebu/common.c                         |  12 +-
 drivers/clk/rockchip/clk-rk3288.c                  |  12 +-
 drivers/clk/samsung/clk-s5pv210-audss.c            |  12 +-
 drivers/clk/samsung/clk.c                          |  12 +-
 drivers/clk/tegra/clk-tegra210.c                   |  12 +-
 drivers/clocksource/timer-armada-370-xp.c          |  12 +-
 drivers/cpuidle/cpuidle-psci.c                     |  12 +-
 drivers/firmware/imx/imx-scu-irq.c                 |  32 +-
 drivers/firmware/imx/imx-scu.c                     |  11 +-
 drivers/firmware/ti_sci.c                          | 155 +++-
 drivers/firmware/ti_sci.h                          |   7 +
 drivers/firmware/xilinx/zynqmp-debug.c             |  13 +
 drivers/firmware/xilinx/zynqmp.c                   | 114 ++-
 drivers/gpio/gpio-mxc.c                            |  12 +-
 drivers/gpio/gpio-pxa.c                            |  12 +-
 drivers/gpio/gpio-sa1100.c                         |  12 +-
 drivers/hv/vmbus_drv.c                             |  14 +-
 drivers/iommu/amd/init.c                           |  16 +-
 drivers/iommu/intel/iommu.c                        |  12 +-
 drivers/irqchip/exynos-combiner.c                  |  14 +-
 drivers/irqchip/irq-armada-370-xp.c                |  12 +-
 drivers/irqchip/irq-bcm7038-l1.c                   |  12 +-
 drivers/irqchip/irq-gic-v3-its.c                   |  12 +-
 drivers/irqchip/irq-i8259.c                        |  12 +-
 drivers/irqchip/irq-imx-gpcv2.c                    |  16 +-
 drivers/irqchip/irq-loongson-eiointc.c             |  12 +-
 drivers/irqchip/irq-loongson-htpic.c               |  10 +-
 drivers/irqchip/irq-loongson-htvec.c               |  12 +-
 drivers/irqchip/irq-loongson-pch-lpc.c             |  12 +-
 drivers/irqchip/irq-loongson-pch-pic.c             |  12 +-
 drivers/irqchip/irq-mchp-eic.c                     |  12 +-
 drivers/irqchip/irq-mst-intc.c                     |  12 +-
 drivers/irqchip/irq-mtk-cirq.c                     |  12 +-
 drivers/irqchip/irq-renesas-rzg2l.c                |  12 +-
 drivers/irqchip/irq-sa11x0.c                       |  12 +-
 drivers/irqchip/irq-sifive-plic.c                  |  12 +-
 drivers/irqchip/irq-sun6i-r.c                      |  18 +-
 drivers/irqchip/irq-tegra.c                        |  12 +-
 drivers/irqchip/irq-vic.c                          |  12 +-
 drivers/leds/trigger/ledtrig-cpu.c                 |  14 +-
 drivers/macintosh/via-pmu.c                        |  12 +-
 drivers/memory/renesas-rpc-if.c                    |  58 +-
 drivers/memory/tegra/tegra124-emc.c                | 140 ++--
 drivers/memory/tegra/tegra186-emc.c                |  35 +-
 drivers/memory/tegra/tegra20-emc.c                 | 150 ++--
 drivers/memory/tegra/tegra30-emc.c                 | 119 ++-
 drivers/pinctrl/pinctrl-zynqmp.c                   |   7 +-
 drivers/power/reset/sc27xx-poweroff.c              |  10 +-
 drivers/reset/Kconfig                              |  13 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/core.c                               | 124 +--
 drivers/reset/reset-eic7700.c                      | 429 +++++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            |  60 ++
 drivers/reset/reset-th1520.c                       | 835 ++++++++++++++=
++++++-
 drivers/sh/clk/core.c                              |  10 +-
 drivers/sh/intc/core.c                             |  12 +-
 drivers/soc/bcm/brcmstb/biuctrl.c                  |  12 +-
 drivers/soc/mediatek/mtk-socinfo.c                 |   3 +
 drivers/soc/qcom/ice.c                             |  81 +-
 drivers/soc/qcom/llcc-qcom.c                       | 373 +++++++++
 drivers/soc/qcom/mdt_loader.c                      |  52 +-
 drivers/soc/qcom/ocmem.c                           |   2 +-
 drivers/soc/qcom/pmic_glink.c                      |   9 +-
 drivers/soc/qcom/qcom-pbs.c                        |   2 +
 drivers/soc/qcom/qcom_gsbi.c                       |   8 -
 drivers/soc/qcom/qcom_pd_mapper.c                  |  10 +
 drivers/soc/qcom/smem.c                            |  33 +-
 drivers/soc/qcom/socinfo.c                         | 102 ++-
 drivers/soc/qcom/ubwc_config.c                     |  24 +
 drivers/soc/renesas/r9a08g045-sysc.c               |  69 ++
 drivers/soc/renesas/r9a09g047-sys.c                |  79 ++
 drivers/soc/renesas/r9a09g056-sys.c                |  69 ++
 drivers/soc/renesas/r9a09g057-sys.c                | 101 +++
 drivers/soc/renesas/rcar-rst.c                     |   3 +-
 drivers/soc/renesas/rz-sysc.c                      |   2 +
 drivers/soc/renesas/rz-sysc.h                      |   4 +
 drivers/soc/rockchip/grf.c                         |  15 +
 drivers/soc/samsung/Makefile                       |   3 +-
 drivers/soc/samsung/exynos-chipid.c                |  18 +-
 drivers/soc/samsung/exynos-pmu.c                   | 138 +---
 drivers/soc/samsung/exynos-pmu.h                   |  37 +
 drivers/soc/samsung/gs101-pmu.c                    | 446 +++++++++++
 drivers/soc/tegra/cbb/tegra194-cbb.c               |   2 +-
 drivers/soc/tegra/fuse/fuse-tegra.c                |   2 -
 drivers/soc/tegra/fuse/speedo-tegra210.c           |  63 +-
 drivers/soc/tegra/pmc.c                            |  38 +-
 drivers/soc/xilinx/xlnx_event_manager.c            |   8 +-
 drivers/soc/xilinx/zynqmp_power.c                  |  10 +-
 drivers/thermal/intel/intel_hfi.c                  |  12 +-
 drivers/xen/xen-acpi-processor.c                   |  12 +-
 include/dt-bindings/arm/qcom,ids.h                 |   2 +
 include/dt-bindings/reset/eswin,eic7700-reset.h    | 298 ++++++++
 include/dt-bindings/reset/thead,th1520-reset.h     | 219 +++++-
 include/linux/err.h                                |   8 +
 include/linux/firmware/qcom/qcom_tzmem.h           |  15 +-
 include/linux/firmware/xlnx-zynqmp.h               |  30 +-
 include/linux/reset-controller.h                   |  33 -
 include/linux/reset.h                              |   1 +
 include/linux/soc/qcom/llcc-qcom.h                 |   7 +
 include/linux/soc/qcom/socinfo.h                   |   4 +
 include/linux/soc/qcom/ubwc.h                      |   1 +
 include/linux/soc/samsung/exynos-regs-pmu.h        | 343 ++++++++-
 include/linux/syscore_ops.h                        |  15 +-
 kernel/cpu_pm.c                                    |  12 +-
 kernel/irq/generic-chip.c                          |  14 +-
 kernel/irq/pm.c                                    |  11 +-
 kernel/printk/printk.c                             |  11 +-
 kernel/time/sched_clock.c                          |  22 +-
 kernel/time/timekeeping.c                          |  22 +-
 virt/kvm/kvm_main.c                                |  18 +-
 188 files changed, 5896 insertions(+), 1290 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic770=
0-reset.yaml
 create mode 100644 drivers/reset/reset-eic7700.c
 create mode 100644 drivers/soc/samsung/gs101-pmu.c
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h

