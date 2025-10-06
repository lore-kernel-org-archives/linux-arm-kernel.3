Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C68CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 11:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nwv2x3AV2URX4eDt226Z25gIAY13bxvGxt/6sHiSWCk=; b=XjCpSj3MwHa+1QPFhrDsuPq4z+
	S7ppGqcoooCse4bX80nULOG12WN44texrJ1+zIIWalcJjWsAWB6gLlEPcOYt5qTvWPO5f71UeeBtz
	FSkIFcXUrju0uhZZgYgHP2c7qAPeI9qPRvdOMxp/2N+U4SMMUdKOLljXvSlpKhfiZQvO+gVBnNGcN
	Mfsu3n2cSpHBeuIXPc/m1tCF09f85fQxpOEa3NzA2pIHxx6xlM1GUGHXIcLkc5suz0cRTMwGPzYKf
	Cnj4woXvtguqyQ7mVMlvsjJRwV3Z6NdyD2BPFAIcbC/M+6w0BLfbCJ4pQvE2hGJ0Xo3DxcQAq4ix8
	z9Ytg6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jij-0000000HW95-2nvu;
	Mon, 06 Oct 2025 11:49:37 +0000
Received: from mx-relay76-hz1.antispameurope.com ([94.100.133.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jie-0000000HW8O-42li
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 11:49:36 +0000
ARC-Authentication-Results: i=1; mx-gate76-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Nwv2x3AV2URX4eDt226Z25gIAY13bxvGxt/6sHiSWCk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1759751358;
 b=YVo7AX2B95o5WbMdvEuGyvB0wneCbVfBjoCbenB/rWRDQqqypLeIOeMJ/tKvNEiwBHQnQ7iu
 f5fSdSZ8uDhKP5olalc6G5RDPMGmWlEea+s5MdKle7P+VzClAuJ8habnj+qvUWtZWnBSHcKEW05
 nPMij9yFwbNm1ew9RO3jcRrqia/t+mEygl+/sKDK+B5Z+i/mAlPb0LW8ix2Z/aSLmS/31p9fLzK
 hYa8IH+93zmOqSUljVH4WadSA7KHO1gFFyop554zTBssO+OArxi1PH8vn+JpiKyWhhjPn+rnJ/f
 93o6y4vdKPVknvzz4MfSCuZYlhLbjOU3ktH7XtTz0KzHg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1759751358;
 b=Hkt6uW6Xxsf0W0lgxfgUcdQKQrxbsGg2Z3AtDU9Bd7SoX8FTG7fTKwucdMp+Gi49KyHhsTCx
 r/OxCBHaOd/7osFVETTxSgJOI4CvYq0H5CM6espMriyhcgC4yeKZbAApPUPHbb58t98TXfD0qlS
 1/XdVo9ThcIuKvZa8s2+LAD3qnTgdleA9OKoJUqp18itpTqjArGfzntdqYdHHMvcKEuwzJXORGN
 h5WzsKsAIHk/yY/ER9TQKKN1T+mcVIa9Yib/kMeicadUn1ma15/9+Xj7/OiHKY8+SdDyu0kpATf
 vpeJhF19FUOVlTl/QKhXcprkzvKUOP4YOpiTzHrhcX13g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay76-hz1.antispameurope.com;
 Mon, 06 Oct 2025 13:49:18 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 67843220CBE;
	Mon,  6 Oct 2025 13:49:02 +0200 (CEST)
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
Subject: [PATCH v3 0/2] TQ-Systems TQMa62xx SoM and MBa62xx board
Date: Mon,  6 Oct 2025 13:47:46 +0200
Message-ID: <cover.1759749553.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay76-hz1.antispameurope.com with 4cgHbz2JRWz4LZB9
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 48afd15d2880b31a25c63c7ab36f7410
X-cloud-security: scantime:2.103
DKIM-Signature: a=rsa-sha256;
 bh=Nwv2x3AV2URX4eDt226Z25gIAY13bxvGxt/6sHiSWCk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1759751357; v=1;
 b=OvfZ2s0RdnUltWY6EPFoI8CLnYFyy+Xcr/CLnhXwPjBgLrlZxCItdXasOOXh4EWoQF7Tzhnt
 RDrboCH2gktQcRPuz8SK/gHN21+0YItPbwjTfh/8e/+6m8u42DLcnzGo+bUfnf0Mc1Wa2puSkGJ
 1gG1yOUEtUo/jMj6J+E09MC6NMltGlxiQNW9Rh7dqzPgOR8FqTNwgeaZxGPrwZrEq63hJRCKYB2
 OSiAG1hUMB8GQvol0AWHm0BdBpho4rKD0Kf73jpWxpybCoy/0Nrbn3S1VjezsJhvtIE7bQlz8UO
 AkjSJbARFzCj9Kvll+vWsriqug43P2ND5PSxsTseDy3kA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_044933_254115_B3C2C2A9 
X-CRM114-Status: GOOD (  13.41  )
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

This adds Device Trees for out AM62x-based SoM TQMa62xx and its
reference carrier board MBa62xx.

Not yet included are overlays to enable LVDS display output and MIPI-CSI
camera input.

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
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 928 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi | 319 ++++++
 4 files changed, 1255 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


