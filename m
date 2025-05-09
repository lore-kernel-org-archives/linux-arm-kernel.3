Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B372CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=49BBpcmTylyp6P75ckv+hBDCrLqZhnavTvSWvBtKazo=; b=XgBm1U+mv4rJ1zoCLxxDWsORSg
	JB6GCyrBAU9t987vBW134huSqFEO/KQsP8JO/EOdkb3VUA1fEW45lvtx29csevl1HAwghnUTivcrH
	0AIkTkSNe2sGcNh1xy/ei9eDQPdrtR9x6kAynVnnS3ENCKlJLWHZosg+dEDJuXZpWkWGOz1qeixfO
	Dm2GAURZ11jGXnH4UY6IHcghoDGGa2OyIq5rQKdjCWMpHZGfnkkF2qYkxlv3LHt3SUIF9TwXiJHwq
	l/BhhG4B8EGSQXxQ96aS+edVgCbLRnpzkOo4ozEPQ1WsTIYDJgL0HQn1Sy5JveWUMX/DcgAeDzGg2
	taMvgWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPOI-000000042iH-466m;
	Fri, 09 May 2025 15:11:58 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDO6F-00000003pjG-1WCK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:49:16 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5fab81d6677so4030119a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746798553; x=1747403353; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49BBpcmTylyp6P75ckv+hBDCrLqZhnavTvSWvBtKazo=;
        b=XOgnuOw8Fw3HBP8DrqxDcL75FltuPRiWuo+VYM5RBiQM1RwlJZ3qWFtjT75ycjmSqE
         xRINNlV5e9eKmWvmOcMw7fIHap4O8fTs86NkLx0LWR/2yALUTFmTrJxOTnr5YM6f9azZ
         /P35ceoF7URYuUBN5qmeqDuKlPzkm7mq5+r4qmKsFVhQFkZrKJSbml6RKqarydoTveqN
         r+cqlUGThecw44KVYQIw+Wb7eb5L2AA4Oats6Ao2RKIwDHI7gSsxazV5/MU7ik/LsWHp
         RBBvYTzu44hUrqPe4ReMj6w+BW+AKtcQH5MnrJ1HRHTxxHuZS8KnVtgbPjTGyHITfyJV
         iA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798553; x=1747403353;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49BBpcmTylyp6P75ckv+hBDCrLqZhnavTvSWvBtKazo=;
        b=soz+AhguXuq08DiNzKF7liJjxBTy+B9x0eFZGXTd7ZXofS8/tbJDsxye+1ZpAZ/qIb
         z2oQBruJ5lVX6Jbb5mgcw/uQ6Iscx6lZpUZN10lheIgxq9S0G2kwjHvC0z2g/TmyyE7c
         OuaE31LeSKTwzGOVA9PVtPLMeXwGceTqzDkKfVCaWXpuqRyDLbmQJ+BZS93+mFpa9Z72
         gpXFQLgjXSX5ZuSpQf1IGLYwXpOZwjfzOQn5PqubwK3C9hqI2J0TmTJ/Kme5gniRTw2a
         GbJnbqdTt0aavkwYsLlJhD6I6knwEPxTpJu14XYVg69MEVmeRYD7W3FIfuf3/y+3CC2L
         R9Ag==
X-Gm-Message-State: AOJu0Yw+bE6yaqnxNfB9EXv6H+WPDNwwZFdAJL549aIT895Gd30vlyoE
	/ESj+rKtCFPXXZqiANISiRzEHyVf/sCiGoxCtUSALWq+Vgiv+pWM
X-Gm-Gg: ASbGnctaj/YlvqfqFdeyqvYdjA3AZwQ1yqWNt0bRLLTxmsygRWP1BPIxteh03ZFe596
	OyoR69EBw3WQDYS1ZEjRzbtOgKJmO6kY3QLGOySHmrH/NL6MZWOg0k/2+9pLe8kvDW2YfGDJh1m
	7y5neD2NQ9fGUAIEwvRWvDYWtiwufer+TEEnvljTs1qYkI9nLuusWLpxOQ0Kbw66cHwMzqWGxLe
	XM0h7CLnkvYMBl9X11ZSp8CL8sDncaT8Ihtfk2hwMyGqzCNWni5ayNu5RkSN1KIF2SJfOvVLhTE
	YNq4DNBdoCXjcoBefNLOArZAJpjYGY6ziktWYBbZPte+EeNCjN0J6rpafDNUkE164LqMsg==
X-Google-Smtp-Source: AGHT+IHaZWCHw8xsDTdBKvhjLjajsoWqZ8PJ57hG4DRckRcOgU+5g1YHglpVlj4XEBe99tmHM/8k4A==
X-Received: by 2002:a17:907:1808:b0:ad2:2dc9:e3d3 with SMTP id a640c23a62f3a-ad22dc9e61cmr32726566b.57.1746798553081;
        Fri, 09 May 2025 06:49:13 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm154111066b.141.2025.05.09.06.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:49:12 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 09 May 2025 15:48:52 +0200
Subject: [PATCH] arm64: dts: marvell: uDPU: define pinctrl state for alarm
 LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-udpu-alarm-led-fix-v1-1-4ede407714cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMQHHmgC/x2MWwqAIBAAryL73YIK9rpK9GG51kIPUYwgunvS5
 wzMPJAoMiXoxQORLk58HgVUJWBe7bEQsisMWmojjewwu5DRbjbuuJFDzzfWutWtb0gpmqCEIVL
 R/3QY3/cDXUiOnWQAAAA=
X-Change-ID: 20250509-udpu-alarm-led-fix-62828f7e11eb
To: Robert Marko <robert.marko@sartura.hr>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Vid <vladimir.vid@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_064915_430902_D2C90CE2 
X-CRM114-Status: GOOD (  18.37  )
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

The two alarm LEDs of on the uDPU board are stopped working since
commit 78efa53e715e ("leds: Init leds class earlier").

The LEDs are driven by the GPIO{15,16} pins of the North Bridge
GPIO controller. These pins are part of the 'spi_quad' pin group
for which the 'spi' function is selected via the default pinctrl
state of the 'spi' node. This is wrong however, since in order to
allow controlling the LEDs, the pins should use the 'gpio' function.

Before the commit mentined above, the 'spi' function is selected
first by the pinctrl core before probing the spi driver, but then
it gets overridden to 'gpio' implicitly via the
devm_gpiod_get_index_optional() call from the 'leds-gpio' driver.

After the commit, the LED subsystem gets initialized before the
SPI subsystem, so the function of the pin group remains 'spi'
which in turn prevents controlling of the LEDs.

Despite the change of the initialization order, the root cause is
that the pinctrl state definition is wrong since its initial commit
0d45062cfc89 ("arm64: dts: marvell: Add device tree for uDPU board"),

To fix the problem, override the function in the 'spi_quad_pins'
node to 'gpio' and move the pinctrl state definition from the
'spi' node into the 'leds' node.

Cc: stable@vger.kernel.org # needs adjustment for < 6.1
Fixes: 0d45062cfc89 ("arm64: dts: marvell: Add device tree for uDPU board")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
Notes:

1. DTB check shows a bunch of warnings, but none of those are new:

    DTC [C] arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
  <...>/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: pinctrl@13800: reg: [[79872, 256], [80896, 32]] is too long
  	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/phy@18300: failed to match any schema with compatible: ['marvell,comphy-a3700']
  <...>/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: pinctrl@18800: reg: [[100352, 256], [101376, 32]] is too long
  	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
  <...>/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: usb@58000: Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
  	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
  <...>/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: usb@5e000: phy-names:0: 'usb' was expected
  	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/xor@60900: failed to match any schema with compatible: ['marvell,armada-3700-xor']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/pcie@d0070000: failed to match any schema with compatible: ['marvell,armada-3700-pcie']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']

2. Just for the record, here is the bisect log:
  git bisect start
  # status: waiting for both good and bad commits
  # bad: [7cdabafc001202de9984f22c973305f424e0a8b7] Merge tag 'trace-v6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
  git bisect bad 7cdabafc001202de9984f22c973305f424e0a8b7
  # status: waiting for good commit(s), bad commit known
  # good: [0c3836482481200ead7b416ca80c68a29cfdaabd] Linux 6.10
  git bisect good 0c3836482481200ead7b416ca80c68a29cfdaabd
  # bad: [fcc79e1714e8c2b8e216dc3149812edd37884eef] Merge tag 'net-next-6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
  git bisect bad fcc79e1714e8c2b8e216dc3149812edd37884eef
  # good: [26bb0d3f38a764b743a3ad5c8b6e5b5044d7ceb4] Merge tag 'for-6.12/block-20240913' of git://git.kernel.dk/linux
  git bisect good 26bb0d3f38a764b743a3ad5c8b6e5b5044d7ceb4
  # bad: [5e5466433d266046790c0af40a15af0a6be139a1] Merge tag 'char-misc-6.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
  git bisect bad 5e5466433d266046790c0af40a15af0a6be139a1
  # good: [de848da12f752170c2ebe114804a985314fd5a6a] Merge tag 'drm-next-2024-09-19' of https://gitlab.freedesktop.org/drm/kernel
  git bisect good de848da12f752170c2ebe114804a985314fd5a6a
  # bad: [962ad08780a5bfb3240bc793e565181eacfceafb] Merge tag 'pinctrl-v6.12-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
  git bisect bad 962ad08780a5bfb3240bc793e565181eacfceafb
  # good: [440b65232829fad69947b8de983c13a525cc8871] Merge tag 'bpf-next-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
  git bisect good 440b65232829fad69947b8de983c13a525cc8871
  # good: [f8ffbc365f703d74ecca8ca787318d05bbee2bf7] Merge tag 'pull-stable-struct_fd' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
  git bisect good f8ffbc365f703d74ecca8ca787318d05bbee2bf7
  # good: [18ba6034468e7949a9e2c2cf28e2e123b4fe7a50] Merge tag 'nfsd-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
  git bisect good 18ba6034468e7949a9e2c2cf28e2e123b4fe7a50
  # bad: [bb78146c18ac67f22cabb2448b501bcac30f8801] Merge branch 'pci/controller/xilinx'
  git bisect bad bb78146c18ac67f22cabb2448b501bcac30f8801
  # bad: [b893f8ea38c530c2c8a337c3429f9f37e6bf65e8] Merge branch 'pci/controller/brcmstb'
  git bisect bad b893f8ea38c530c2c8a337c3429f9f37e6bf65e8
  # bad: [207bcb73fb08841e242fa1d66e1d0381836da562] Merge branch 'pci/dt-bindings'
  git bisect bad 207bcb73fb08841e242fa1d66e1d0381836da562
  # good: [e642aa6b38762a2af3a7e0c5e6dac5841c15dea0] Merge branch 'pci/iommu'
  git bisect good e642aa6b38762a2af3a7e0c5e6dac5841c15dea0
  # good: [f500a2f1282750fb344ce535d78071cf1493efd1] dt-bindings: PCI: imx6q-pcie: Add reg-name "dbi2" and "atu" for i.MX8M PCIe Endpoint
  git bisect good f500a2f1282750fb344ce535d78071cf1493efd1
  # bad: [d774674f3492740503a3cd3f5da131d088202f1b] Merge branch 'pci/pwrctl'
  git bisect bad d774674f3492740503a3cd3f5da131d088202f1b
  # bad: [759ec28242894f2006a1606c1d6e9aca48cecfcf] PCI/NPEM: Add _DSM PCIe SSD status LED management
  git bisect bad 759ec28242894f2006a1606c1d6e9aca48cecfcf
  # bad: [4e893545ef8712d25f3176790ebb95beb073637e] PCI/NPEM: Add Native PCIe Enclosure Management support
  git bisect bad 4e893545ef8712d25f3176790ebb95beb073637e
  # bad: [78efa53e715e21a97c722dba20f8437a0860521e] leds: Init leds class earlier
  git bisect bad 78efa53e715e21a97c722dba20f8437a0860521e
  # first bad commit: [78efa53e715e21a97c722dba20f8437a0860521e] leds: Init leds class earlier
---
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
index 3a9b6907185d0363dff41178543a0210ce99dbf7..24282084570787630cb0beeab3997b943bdf45dc 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
@@ -26,6 +26,8 @@ memory@0 {
 
 	leds {
 		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&spi_quad_pins>;
 
 		led-power1 {
 			label = "udpu:green:power";
@@ -82,8 +84,6 @@ &sdhci0 {
 
 &spi0 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi_quad_pins>;
 
 	flash@0 {
 		compatible = "jedec,spi-nor";
@@ -108,6 +108,10 @@ partition@180000 {
 	};
 };
 
+&spi_quad_pins {
+	function = "gpio";
+};
+
 &pinctrl_nb {
 	i2c2_recovery_pins: i2c2-recovery-pins {
 		groups = "i2c2";

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250509-udpu-alarm-led-fix-62828f7e11eb

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


