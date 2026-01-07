Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B9BCF6BF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qugGupbuLuQZHC/ObrVWEf0IOnY90j2BdMV7Fr/z0ho=; b=AYM4SKub2Q4niIk57JphvWAynT
	hHYwWJKH9JBKxJxzqilckM+VHIBKP0oblOtALYQh309uTS/GEW2PzpukeWFNioOHSyHhV5A0GKCqa
	Y9EzQiDLlIzoicAZcDKbfqcr6hJKcLFz7tpmCWr3vman3HLk8UBKwbYUgGAMxcc4b57EXmZIhFRTJ
	2w6m1VsTbjzsR/wgMbxsa9NTJqkwEr0118VSIozGGrWhqNiVPQlq672g4DPdMb6XZDDMA9VDSSH1f
	nKdBoTbNJVo8Spdemf6ob9rhdB7AAJvJ8ejUk/rEvQiK6dVz7jCcBWgtPRiT/9dN8S0NdCFu94Icl
	n9YzUH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOh0-0000000ENF5-1acQ;
	Wed, 07 Jan 2026 08:14:58 +0000
Received: from mx-relay60-hz1.antispameurope.com ([94.100.133.230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOgu-0000000ENCx-1D0y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:14:55 +0000
ARC-Authentication-Results: i=1; mx-gate60-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qugGupbuLuQZHC/ObrVWEf0IOnY90j2BdMV7Fr/z0ho=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1767773676;
 b=iET0XR07iH/jMBb+5XXMRaKptdIJQkjkF9VWB4jRIFDS2YUVR32oQ/vHV5RZjRBUVxsyZLrJ
 RNl4zUySkbWHZNREdZPSQt6rlTYkJmBjgkY906j4KX+iBvTpu8YEeUWfBbfC7vbae+I2ziDyLgm
 B5k4UQ0XvDJGOQSwa06F8xurmshod7o4w4sGqEXAuAByOEUDuss40BagKV95cf6wubsDEL7239C
 KNFZClxydTGq5+EYtR+ToztrQtefDc46YllU7GXRPSxEBLFxGnuwlcRCPrgTvBUIDuxAWEDRUyo
 gs++7i8mxSaOdJoXi2Y3wk5dZlb2Qy1WMmDKMIy7/+4Vw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1767773676;
 b=Rbdv2LJQdg8XPRSlcklA+KGYfCDJuDI9X8OeFuKHl1PiHL7MznnoMc3aOdMwUKntSkscaDkL
 K1wwpEIkIWkXM5CxnxhLXKcQcapMaPJjKo/ZZVnsOKp0ca/Ka2OmRisw3fhMhLUSYCBb8LcNVdo
 v/1nK8oPkG86lU60Pd68Bqag7VsqO4RaqxmttyrlnjHSoXtmd23ocpZiUO651A6/9d7YDz5RGQp
 RvSPeak46iBiGmausLPvX1yOTtghp/FS18wcMELDKEkapWlQiLuVIAOc01ubljcwRtPASRCwgnx
 ot8TsC8LzYrNMO16ydil60WWD1qiJFW5QbSt6h5JJe0dA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay60-hz1.antispameurope.com;
 Wed, 07 Jan 2026 09:14:36 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B030C220D37;
	Wed,  7 Jan 2026 09:14:21 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v5 0/2] TQ-Systems TQMa62xx SoM and MBa62xx board
Date: Wed,  7 Jan 2026 09:14:00 +0100
Message-ID: <cover.1767627010.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay60-hz1.antispameurope.com with 4dmLRL38j6z28w5w
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 772d89e85c1e185e9e888a8d7af96ee7
X-cloud-security: scantime:1.844
DKIM-Signature: a=rsa-sha256;
 bh=qugGupbuLuQZHC/ObrVWEf0IOnY90j2BdMV7Fr/z0ho=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1767773675; v=1;
 b=A6RToKOWouKes5qmvwx4uTjWXVYm11mKGsrlS/KqyMwfCpxLAIJkKJiqeHpPEoGX8AWvbCBA
 c+C8Dng/OftHaw7/uCD3B93KmYXrQYvpkGaI24GekGkT7jXx2fNBgmBnjNG9IYgdPqd5BXChtQw
 UniKjHfHGQWUGW0LiKKipEzfDhW/KRHj7AxtcOnQeNZ4hBWIRL32RTWWluWuGCrQvHBz03a+oZs
 Henc8hGjV1V/nbXPcEglUQBqO+SKIU7scx5SZ1XKiBZomNbgW5iOHU0WmTNWowo8DWtVd8yYoCG
 0r8BAxZzig7cJpTpofyIKzhPa7d7nrGF2We8iucs+XQKQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_001452_602095_238BF927 
X-CRM114-Status: GOOD (  15.00  )
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

This adds Device Trees for our AM62x-based SoM TQMa62xx and its
reference carrier board MBa62xx.

Not yet included are overlays to enable LVDS display output and MIPI-CSI
camera input.

Changes in v5:
- Rebase onto latest ti-k3-dts-next

Changes in v4:
- Rebase onto latest ti-k3-dts-next
- Reorder boot phase tags after other standard DT properties
- Add missing supply regulators in SPI-NOR flash and USB hub
- Set status = "okay" in &cpsw3g, as it is disabled in k3-am62-main.dtsi
  now
- Add disabled 1400MHz OPP entry (will be enabled by bootloader if
  supported by PMIC configuration)
- Update copyright years in new files

Changes in v3:
- Rebased onto ti-k3-dt-for-v6.18
- 3 of the 5 patches in v2 have been applied already and are dropped
- Include k3-am62-ti-ipc-firmware.dtsi, drop now redundant configuration
- Change node name for MCU reserved memory to 'memory'
- Use rgmii-id PHY mode
- Drop now redundant ti,rx-internal-delay
- Update simple-audio-card,name to match other TQ SOMs with compatible
  configuration
- Reference dss_pins in dss node (actual display support will be added
  in a follow-up patch series)
- Consistently use GPIO_ACTIVE_HIGH define
- Drop unneeded usb0 quirk flags
- Add boot phase tags

Changes in v2:
- Collected acks and reviews
- Rebased onto v6.13-rc1

Matthias Schiffer (2):
  dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM
    family and carrier board
  arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board
    Device Trees

 .../devicetree/bindings/arm/ti/k3.yaml        |   7 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 930 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi | 331 +++++++
 4 files changed, 1269 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

