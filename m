Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8439FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vCOSzguE5smY7X3uU2S+cYXVmp6ep2y6ONwY7bkEaQw=; b=h0J/7M/OKW6zmZX/fDFK1u0GQf
	dP+djsu7d9CisOEfdzR1+Eolg5zXYyQgYRBausBE0xsPTb4ZSS78dO5TFLOsk0MRhBJwEe2m18cID
	kb1EOtievNj2ilaBT8Ony5Yrn161sEP+q4iC8KUgLajhygM9XGGyJIU/nSSInRP7s9q1gJXMWx8Jp
	3IuZ9GHbIhjQAMAr9mxPQM1eomfkmjVD/HcT5H/TQO8vvUx7WMEqnyfinZkz9QvBWfOf6qlz/30Kr
	U0O2lqDqFpYn9CCcTThBjth3puYphE+K89Ff69ql6KGm+d2+s4fPL/CiKqH9HvVD6KDzwvk5kISwN
	VmhAegHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKakm-00000007ERy-49hA;
	Mon, 09 Dec 2024 10:12:37 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaRC-000000079yD-3Nyq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733737942; x=1765273942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vCOSzguE5smY7X3uU2S+cYXVmp6ep2y6ONwY7bkEaQw=;
  b=Pmn9DblIdFUQMcQSUF2dmYT+DYBqBeXObTsdtdakDdYMRwz53bAp/wjm
   5Y92Jx2Mc+7tninKheigYR6oZqBKqtXFPqtDfeQ1yyvMZIInR4SiOhevE
   ixGerbew7unmJ3J5DiYwGXEY8T7Hf7jxsGPndKovV0rfwLCUrTD+NsYBo
   eBAdb7FZqu5buOvdlDNfHrC1/KfIjey7aN1es+60I2WWl4cG1y57Nya7g
   uxO172G+cPSxtLwiM3eeS6O5/TMRGLDw6eeDnf61HWeXMLSY778oufgRG
   2jJEmKzTaPXgYJK7Nq6riGszoxAdlvBrT06YwfNdeBSGfXJEkeTUQG5v+
   w==;
X-CSE-ConnectionGUID: v0l5HM21S0CnAgO0ZCZRJQ==
X-CSE-MsgGUID: OSL/ddO3TFOKicyZEhfkqw==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40481347"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 10:52:18 +0100
X-CheckPoint: {6756BDD2-E-90CD5875-E0265C0B}
X-MAIL-CPID: AFAF0358426999AB480C9A5F2119583B_3
X-Control-Analysis: str=0001.0A682F1E.6756BDD2.0099,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07F92166523;
	Mon,  9 Dec 2024 10:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733737933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vCOSzguE5smY7X3uU2S+cYXVmp6ep2y6ONwY7bkEaQw=;
	b=DnwjRk2wR1VQQqxBHqHzNiqUe/HKDqfUgY1FMWDuGH867ZxfognDBfaBja1wyfmp2I5aE8
	oN1rjIwFBUFM4EnhHfMc0gdCdb+zf+IfM+pgi12xz5d2VzJCNefLWjJOhbm92ESQeRkRvS
	KouPrHTSKfHRZCDIH6oJA0gPHkWeri1k+J4We6IWoyIFOuIxQhnOUR2NuM6E/cmhgbupJr
	kZ/e1adfUbe+Nt1MmyZwyOPLPROXJZFr0YkafnpUy62Y0CahM2ULN1euVQLkOKloee7v+6
	PzgHu7+2wRG5MRmwYvBpqaKTf/kycHvvaaLAd1YfUp90Pwn87ZeopqAhHbbckA==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 0/5] TQ-Systems TQMa62xx SoM and MBa62xx board
Date: Mon,  9 Dec 2024 10:51:31 +0100
Message-ID: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015223_336158_0A7347FC 
X-CRM114-Status: GOOD (  12.70  )
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

Two of the patches are adapted from the TI vendor repo ti-linux-kernel to
add RemoteProc/RPMsg support for the R5F core. A similar patch has been
submitted for mainline by TI themselves for the closely related AM62A SoC.

Not yet included are overlays to enable LVDS display output and MIPI-CSI
camera input.

Changes in v2:
- Collected acks and reviews
- Rebased onto v6.13-rc1


Devarsh Thakkar (1):
  arm64: dts: ti: k3-am62: Add DM R5 ranges in cbass

Hari Nagalla (1):
  arm64: dts: ti: k3-am62-wakeup: Add R5F device node

Matthias Schiffer (3):
  dt-bindings: usb: dwc3: Allow connector in USB controller node
  dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM
    family and carrier board
  arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board
    Device Trees

 .../devicetree/bindings/arm/ti/k3.yaml        |   7 +
 .../devicetree/bindings/usb/snps,dwc3.yaml    |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  24 +
 arch/arm64/boot/dts/ti/k3-am62.dtsi           |   8 +-
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 917 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi | 346 +++++++
 7 files changed, 1307 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


