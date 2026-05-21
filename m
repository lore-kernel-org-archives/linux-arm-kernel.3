Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96351CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 02:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QYDmQZgu+zRH2usZBZBS/kI58ltTicc35yoYOEKlT5M=; b=gInSF2eU5S4DNvw+V25URgTiKE
	lJWwO4NjEo3iI65/gee6K/uvFIrxxK8WTJ+MVoM5xhPuu771kYkl+J18hxpo6VZYLoLROMBg6sMBl
	oJ3Ahpw5Oc2HMvLfPNV8C3V+6tNcbG9Itfj/wnfVGIECShM212KCaaVVUAoO3fiqJpdijD+H+4VR1
	rpcveAn79LC+woTvGrGtUAeMAPr4vFlvfjUnhFLy0y2Z1IjPU6x1EqoaxJvQZqi0AlagoIwf84HkQ
	hzdTgKOOQCLXz6YaIsnnxR1G1ciipvQVk8ElvUmi0nAVspCVOwvrVg4qVsJjZnzD1hbnFQZNkrp9J
	UESKWH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPtbf-00000006VKb-25Xw;
	Thu, 21 May 2026 02:57:55 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPtbc-00000006VK5-45CN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 02:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779332273; x=1810868273;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PQNOucA4IrdzF2Kpmq1ZYmsr9iLUWIkqKDiWOq+Oe4w=;
  b=Pjht/Bkbys4nSse92hSzrsBfI4gY15QQX+e1/ArklTikCgMumV5KcSoQ
   KPbX7t2WgJkq8Kn08+KEF24pjy4n0GWSZykcwtA20eAp5uEbx0NebG0sa
   JpPdSC+z6vZ4qRCDGNx4ykNah1nDHDkb52fHcFyXqRb7QzVn+dfKNFqt7
   x6bZHPhJc6TEd6xPsoz9EPzj5/dIS7SlRLJx8/7eFf+qMQAUQHUquK11c
   I6LrfMFCZqzSKNDZs2jKDWisE8p44r72laHEV5oS/jlGGMsXFzqflCGr3
   IS/uFEPpK1WjIIEC18mxRvReMRJPn3/Sfs/gix5F6aV+ToSJaLH3UVumX
   w==;
X-CSE-ConnectionGUID: eKhFuwWVQLquVnjXvGCePg==
X-CSE-MsgGUID: l6NH245nT1CTLDKBmTFVXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="102919722"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="102919722"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 19:57:53 -0700
X-CSE-ConnectionGUID: NDcowklKSluXoNKM79oPng==
X-CSE-MsgGUID: 7FeJcWbwReCxTvnMsFr1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="270754669"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2026 19:57:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPtbX-00000000AkH-0pLH;
	Thu, 21 May 2026 02:57:47 +0000
Date: Thu, 21 May 2026 04:57:02 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-doc@vger.kernel.org
Subject: [soc:zx/soc 1/1] htmldocs:
 Documentation/arch/arm/zte/zx297520v3.rst:66: WARNING: Title underline too
 short.
Message-ID: <202605210401.8D6jRbz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_195753_092697_C7C260C9 
X-CRM114-Status: GOOD (  24.87  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git zx/soc
head:   220ae5d36dba278003d265aabd080ffa78553f5a
commit: 220ae5d36dba278003d265aabd080ffa78553f5a [1/1] ARM: zte: Add zx2975=
20v3 platform support
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260521/202605210401.8=
D6jRbz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210401.8D6jRbz8-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:=
36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface =
num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: D=
ocumentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/=
testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface =
num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 ti=
mes: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentatio=
n/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface =
num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2=
 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documenta=
tion/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface =
num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is def=
ined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Doc=
umentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/arch/arm/zte/zx297520v3.rst:66: WARNING: Title underline t=
oo short.
--
   3. Building for built-in U-Boot
   --------------------------- [docutils]
>> Documentation/arch/arm/zte/zx297520v3.rst:90: WARNING: Enumerated list e=
nds without a blank line; unexpected unindent. [docutils]
>> Documentation/arch/arm/zte/zx297520v3.rst:116: WARNING: Inline literal s=
tart-string without end-string. [docutils]
   Documentation/arch/arm/zte/zx297520v3.rst:137: ERROR: Unexpected indenta=
tion. [docutils]
>> Documentation/arch/arm/zte/zx297520v3.rst:138: WARNING: Block quote ends=
 without a blank line; unexpected unindent. [docutils]
   Documentation/arch/arm/zte/zx297520v3.rst:164: WARNING: Inline literal s=
tart-string without end-string. [docutils]
>> Documentation/arch/arm/zte/zx297520v3.rst:164: WARNING: Inline interpret=
ed text or phrase reference start-string without end-string. [docutils]
>> Documentation/arch/arm/zte/zx297520v3.rst:7: WARNING: Document or sectio=
n may not begin with a transition. [docutils]
   Documentation/arch/riscv/zicfilp.rst:79: WARNING: Inline literal start-s=
tring without end-string. [docutils]
   Documentation/core-api/kref:328: ./include/linux/kref.h:72: WARNING: Inv=
alid C declaration: Expected end of definition. [error at 96]
   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref=
), struct mutex *mutex) __cond_acquires(true# mutex)
   ------------------------------------------------------------------------=
------------------------^
   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Inv=
alid C declaration: Expected end of definition. [error at 92]


vim +66 Documentation/arch/arm/zte/zx297520v3.rst

     6=09
   > 7	....................................................................=
...........
     8=09
     9	Author:	Stefan D=C3=B6singer
    10=09
    11	Date  : 27 Jan 2026
    12=09
    13	1. Hardware description
    14	---------------------------
    15	Zx297520v3 SoCs use a 64 bit capable Cortex-A53 CPU and GICv3, altho=
ugh they
    16	run in arm32 mode only. The CPU has support EL3, but no hypervisor (=
EL2) and
    17	it seems to lack VFP and NEON.
    18=09
    19	The SoC is used in a number of cheap LTE to WiFi routers, both batte=
ry powered
    20	MiFis and stationary CPEs. In addition to the CPU these devices usua=
lly have
    21	64 MB Ram (although some is shared with the LTE chip), 128 MB NAND f=
lash, an
    22	SDIO connected RTL8192-type Wifi chip limited to 2.4 ghz operation, =
USB 2,
    23	and buttons. Devices with as low as 32 MB or as high as 128 MB ram e=
xist, as
    24	do devices with 8 or 16 MB of NOR flash.
    25=09
    26	Some devices, especially the stationary ones, have 100 mbit Ethernet=
 and an
    27	Ethernet switch.
    28=09
    29	Usually the devices have LEDs for status indication, although some h=
ave SPI or
    30	I2C connected displays
    31=09
    32	Some have an SD card slot. If it exists, it is a better choice for t=
he root
    33	file system because it easily outperforms the built-in NAND.
    34=09
    35	The LTE interface runs on a separate DSP called ZSP880. It is probab=
ly derived
    36	from LSI ZSPs and has an undocumented instruction set. The ZSP commu=
nicates
    37	with the main CPU via SRAM and DRAM and a mailbox hardware that can =
generate
    38	IRQs on either ends.
    39=09
    40	There is also a Cortex M0 CPU, which is responsible for early HW ini=
tialization
    41	and starting the Cortex A53 CPU. It does not have any essential purp=
ose once
    42	U-Boot is started. A SRAM-Based handover protocol exists to run cust=
om code on
    43	this CPU.
    44=09
    45	2. Booting via USB
    46	---------------------------
    47=09
    48	The Boot ROM has support for booting custom code via USB. This mode =
can be
    49	entered by connecting a Boot PIN to GND or by modifying the third by=
te on NAND
    50	(set it to anything other than 0x5A aka 'Z'). A free software tool t=
o start
    51	custom U-Boot and kernels can be found here:
    52=09
    53	https://github.com/zx297520v3-mainline/zx297520v3-loader
    54=09
    55	If USB download mode is entered but no boot commands are sent throug=
h USB, the
    56	device will proceed to boot normally after a few seconds. It is ther=
efore
    57	possible to enable USB boot permanently and still leave the default =
boot files
    58	in place.
    59=09
    60	https://github.com/zx297520v3-mainline/u-boot-mainline
    61=09
    62	Contains an U-Boot version that can be used with the USB loader and =
sets up the
    63	CPU and interrupt controller to comply with Linux's booting requirem=
ents.
    64=09
    65	3. Building for built-in U-Boot
  > 66	---------------------------
    67	The devices come with an ancient U-Boot that loads legacy uImages fr=
om NAND and
    68	boots them without a chance for the user to interrupt. The images ar=
e stored in
    69	files ap_cpuap.bin and ap_recovery.bin on a jffs2 partition named im=
agefs,
    70	usually mtd4. A file named "fotaflag" switches between the two modes.
    71=09
    72	In addition to the uImage header, those files have a 384 byte signat=
ure header,
    73	which is used for authenticating the images on some devices. Most de=
vices have
    74	this authentication disabled and it is enough to pad the uImage file=
s with 384
    75	zero bytes.
    76=09
    77	Builtin U-Boot also poorly sets up the CPU. Read the next section fo=
r details
    78	on this. It has no support for loading DTBs, so CONFIG_ARM_APPENDED_=
DTB is
    79	needed.
    80=09
    81	So to build an image that boots from NAND the following steps are ne=
cessary:
    82=09
    83	1) Patch the assembly code from section 3 into arch/arm/kernel/head.=
S.
    84	2) make zx29_defconfig
    85	3) make [-j x]
    86	4) cat arch/arm/boot/zImage arch/arm/boot/dts/zte/[device].dtb > ker=
nel+dtb
    87	5) mkimage -A arm -O linux -T kernel -C none -a 0x20008000 -d kernel=
+dtb uimg
    88	6) dd if=3D/dev/zero bs=3D1 count=3D384 of=3Dap_recovery.bin
    89	7) cat uimg >> ap_recovery.bin
  > 90	8) Place this file onto imagefs on the device. Delete ap_cpuap.bin i=
f the
    91	free space is not enough.
    92	9) Create the file fotaflag: echo -n FOTA-RECOVERY > fotaflag
    93=09
    94	For development, booting ap_recovery.bin is recommended because the =
normal boot
    95	mode arms the watchdog before starting the kernel.
    96=09
    97	4. CPU and GIC Setup
    98	---------------------------
    99=09
   100	Generally CPU and GICv3 need to be set up according to the requireme=
nts spelled
   101	out in Documentation/arch/arm64/booting.rst. For zx297520v3 this mea=
ns:
   102=09
   103	1. GICD_CTLR.DS=3D1 to disable GIC security
   104	2. Enable access to ICC_SRE
   105	3. Disable trapping IRQs into monitor mode
   106	4. Configure EL2 and below to run in insecure mode.
   107	5. Configure timer PPIs to active-low.
   108=09
   109	The kernel sources provided by ZTE do not boot either (interrupts do=
 not work
   110	at all). They are incomplete in other aspects too, so it is assumed =
that there
   111	is some workaround similar to the one described in this document som=
ewhere in
   112	the binary blobs.
   113=09
   114	The assembly code below is given as an example of how to achieve thi=
s:
   115=09
 > 116	```
   117	#include <linux/irqchip/arm-gic-v3.h>
   118	#include <asm/assembler.h>
   119	#include <asm/cp15.h>
   120=09
   121	@ Detect sane bootloaders and skip the hack
   122	ldr	r3, =3D0xf2000000
   123	ldr	r3, [r3]
   124	ldr	r4, =3D(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
   125	cmp	r3, r4
   126	beq	skip_zx_hack
   127	@ This allows EL1 to handle ints hat are normally handled by EL2/3.
   128	ldr	r3, =3D0xf2000000
   129	str     r4, [r3]
   130=09
   131	cps     #MON_MODE
   132=09
   133	@ Work in non-secure physical address space: SCR_EL3.NS =3D 1. At le=
ast the UART
   134	@ seems to respond only to non-secure addresses. I have taken insipi=
ration from
   135	@ Raspberry pi's armstub7.S here.
   136	mov	r3, #0x131			@ non-secure, Make F, A bits in CPSR writeable
   137						@ Allow hypervisor call.
 > 138	mcr     p15, 0, r3, c1, c1, 0
   139=09
   140	@ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-l=
ow.
   141	ldr	r3, =3D0xF22020a8
   142	ldr	r4, =3D0x50
   143	str	r4, [r3]
   144	ldr	r3, =3D0xF22020ac
   145	ldr	r4, =3D0x14
   146	str	r4, [r3]
   147=09
   148	@ Enable EL2 access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable s=
ystem reg
   149	@ access to GICv3 registers (bit 0, ICC_SRE_EL3.SRE) for EL1 and EL3.
   150	mrc	p15, 6, r3, c12, c12, 5         @ ICC_SRE_EL3
   151	orr	r3, #0x9                        @ FIXME: No defines for SRE_EL3 =
values?
   152	mcr	p15, 6, r3, c12, c12, 5
   153	mrc	p15, 0, r3, c12, c12, 5         @ ICC_SRE_EL1
   154	orr	r3, #(ICC_SRE_EL1_SRE)
   155	mcr	p15, 0, r3, c12, c12, 5
   156=09
   157	@ Like ICC_SRE_EL3, enable EL1 access to ICC_SRE and system register=
 access
   158	@ for EL2.
   159	mrc	p15, 4, r3, c12, c9, 5          @ ICC_SRE_EL2 aka ICC_HSRE
   160	orr	r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
   161	mcr	p15, 4, r3, c12, c9, 5
   162	isb
   163=09
 > 164	@ Back to SVC mode

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

