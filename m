Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F2E10BA434
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 23:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pudUxNmNHF6c2MfPxmIneGnnQ77yu+zSLu1gflW/mao=; b=MnTMbZtzBNB0/Yk+uyN/eeKjAr
	UgPY/JL1JwYxXBqG0l6W0pjg1eaxv19fuv7+H6jFaztIODzXQh+iWq5DRKrw50F/hjxltDGRa1ON1
	ylr768zEJagb/XZkLseidoAXK54em9GmM07jflCE+2adnlCirHGRXAcaMpuR8mJ0ALIXEpdmVMmsd
	l27rIFXQM0JR1LRhTT6Mb7jdyW0Wwhgz0FR/yuKMdAF5ABHSf/U8XiSXRFSUfEwN43lCKdHvTbtdM
	DswEFizFOw9eht07HsmrXrVEdAxfjPy43d2PvHKeKX/e74tDK8c3DdgA3euRMtcD5UziIeWQ7jhck
	HC+BdYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6GpT-00000008KRL-2ak5;
	Fri, 27 Mar 2026 23:43:03 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6GpR-00000008KQ3-0o3a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 23:43:02 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fjHJG1Qywz9tmr;
	Sat, 28 Mar 2026 00:42:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pudUxNmNHF6c2MfPxmIneGnnQ77yu+zSLu1gflW/mao=;
	b=OxtwlH1N83TKRN1hp7daxJLc5N9mm3Q6XvizptzlKnw5DTFOgDdJ81+m2flcUwDY7iZZ10
	pjIiGXJ/Frp+T9vfaC1iFUE4R/xq0L57mXHcLLKEzR2Vn8BJOchTyPAwFz4aeyn30TWwr6
	NcgBuKXxEnFo3itWzjRaE8k9ZJkG3u5/qeqB/n2Fhxp3mwkneNHgh+Ot+mJHZ9hegUEd5K
	WRAqKfGi7x0BbrRI3bJlB1MuQMYhyjSi4J+HNAAxttixq5BikSODUMfP5pehFknWHdWWod
	cJP0TT6igypy7HULMMt1X8MtVfjwlElkfqPFLFtmDSQZHpl4rGRWo6yCm378hQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pudUxNmNHF6c2MfPxmIneGnnQ77yu+zSLu1gflW/mao=;
	b=IIPcsmaU8ywWDiVs746b7eHICgWF4j9BvYuY3e2mEMlUQU60/jXNBcmWkL/K0lsBZt/Z2H
	eor5Pj+cgcFwC5dXAf2b3gQ9Xty9jcj2ukknrrQAcja+zFVxoaG9i4BERoMgdHB3dPy2nt
	3ams+Kw9Iqruf1mZ/qHGXCJo76ucP2wEgpf6kNRxh5zMGuzaoeAuaEViW/628lyMTY+4xB
	bp3SSef3chEyQnlW2gUbqQp49ouT2jdesIpC+sllVVrNy+lY96q+o59WRGywCE9kIlhh8T
	/sVRxXJIlcfQ0rI3IkV5ewSdZqTGQSuLnddHalMo0V0q6S1A+rcHgF9Kx31W/A==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/6] ARM: dts: renesas: Trivial DT fixes
Date: Sat, 28 Mar 2026 00:42:05 +0100
Message-ID: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b2b79677db91ea5b61a
X-MBO-RS-META: cfajky37wi7z98d6mdepyg85uwsguhst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_164301_381946_A017D47D 
X-CRM114-Status: UNSURE (   8.83  )
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

Add missing unit to bus node to fix the following type of DTC warning:
"
arch/arm/boot/dts/renesas/r8a7778.dtsi:43.12-48.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
"

Drop superfluous address-cells and size-cells to fix this type of DTC warning:
"
arch/arm/boot/dts/renesas/r7s72100-genmai.dts:28.17-55.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
"

Marek Vasut (6):
  ARM: dts: renesas: r8a7778: Add missing unit to bus node
  ARM: dts: renesas: r8a7779: Add missing unit to bus node
  ARM: dts: renesas: r8a7792: Add missing unit to bus node
  ARM: dts: renesas: r7s72100: Add missing unit to bus node
  ARM: dts: renesas: genmai: Drop superfluous cells
  ARM: dts: renesas: rskrza1: Drop superfluous cells

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts  | 3 ---
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts | 2 --
 arch/arm/boot/dts/renesas/r7s72100.dtsi        | 2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi         | 2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi         | 2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi         | 2 +-
 6 files changed, 4 insertions(+), 9 deletions(-)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


