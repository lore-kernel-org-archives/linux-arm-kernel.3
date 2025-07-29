Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FACC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 20:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yrwl1JZk+o4qzOe+FuqlI8k3TKIiGH8y5DLfOl2F1Nw=; b=bJvFZ19uiMymtMYbuxF6rqUC9F
	x6uMa9ND6JgiSBiTbhE5KVhi1jSkoz5qutdMRRtA3WTJUFRLv65VlKLXvN1IBN+nRzB9Dy9gMxAEh
	a7kJTwiUi7I1ZlZ4w3jS9aXmIdadr74SaTVkkdwxeGqUTLdOtQavtUjg2oBVGgWatBODsT4FPlXFw
	SwpR54e3W8KTtHnWWA/8uciOYrYt0TAP3zgpazOi+0FsUXf6vrXOMGCj4Kha0fxTK9jAgSbsDhlvD
	yMir9wAtDfbOQrgxmhwmX5dTHbJRQlbfqQcXCLCO13u/YlPVmuZzCt9yJKcwmfHHTlk0ocg5yX0Qh
	5pu+IKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrLp-00000000520-0fUh;
	Tue, 29 Jul 2025 20:55:09 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrJN-000000004sn-0g8p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 20:52:38 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E424FC0000DD;
	Tue, 29 Jul 2025 13:52:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E424FC0000DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753822353;
	bh=IKDUD/Kptz7+IbPpIAAK6wTe6FFm5ZQYQNDSXdWrdSE=;
	h=From:To:Cc:Subject:Date:From;
	b=kNenJpuuzuy1/PBLn0Wq6B2HVE34i9o8JJUOzR54Nf+FbyUS4hz4M9hQxf/KhGtgZ
	 ywESyr3CV+m6WGCK7w0WY0qc2NR11KGAsWoETkd785/YWyu5udcAE+kaUz/2jRd8+t
	 csnbhcl0EszoSxVKEjiaD3/BBiRynHejKuP3+AKU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B4EE6180004FC;
	Tue, 29 Jul 2025 13:52:33 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 0/2] brcmstb-memc-ddr binding updates for MIPS boards
Date: Tue, 29 Jul 2025 13:52:11 -0700
Message-ID: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_135237_220308_3081D8A3 
X-CRM114-Status: UNSURE (   8.36  )
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

This patch series updates the MIPS-based Broadcom STB chips to use a
proper compatible string for their memory controller node(s) after
501be7cecec9 ("dt-bindings: memory-controller: Define fallback
compatible").

Florian Fainelli (2):
  dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
  MIPS: BMIPS: Properly define memory controller compatible

 .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml  | 4 ++++
 arch/mips/boot/dts/brcm/bcm7346.dtsi                        | 3 ++-
 arch/mips/boot/dts/brcm/bcm7360.dtsi                        | 3 ++-
 arch/mips/boot/dts/brcm/bcm7362.dtsi                        | 3 ++-
 arch/mips/boot/dts/brcm/bcm7425.dtsi                        | 6 ++++--
 arch/mips/boot/dts/brcm/bcm7435.dtsi                        | 6 ++++--
 6 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.43.0


