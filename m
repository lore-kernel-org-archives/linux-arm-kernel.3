Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525DECA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SzRokkMKHyGOyZyYSr2/sLuIjvPVIIRRofT3eBfPO4=; b=pHwnMcdLFB8BqB0sNssGHbBZW1
	Jjut1ggfyH1fZYoOGwNv6lNrGdGYnsuOHpyDmWLfu8GSMnqBWCSvPNDT4bCyQWT+2YrBF4ljEMhIp
	Qg0MbpaNikE9LLsmZ2SQ49wcayzVnIYNo60XkjJ8Vps9B7uMh3Ja9ywsBUo7CIpUmGqJUQVGTK34o
	/1P0t+OX3xnr1ptiCJU31jqzejELmeckie+U2KltilO47CAwZC1Sl74MzgtTZIkxqifwqFC3hmjkF
	GSvxlTTv0H8y4nMBKjzf2KMfohlbhsAhPRsbyh+ftEzyK1yZkeZJvm2EKs7nWc505RbKU7cXPC6dn
	gwaTqhuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTR-00000004Kgx-0vEH;
	Sat, 23 Aug 2025 08:19:41 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXhA-00000003OiC-3Hib
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:45:06 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MJj1oB319076;
	Fri, 22 Aug 2025 14:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755891901;
	bh=7SzRokkMKHyGOyZyYSr2/sLuIjvPVIIRRofT3eBfPO4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nlqkzU9FL/1vR1sY6j6uiHNO+Vk2bbucBnVQnSr/jE73gUXPJ9SJeJJ09VThDvETO
	 ZcbCNvV28vLskiUBfqGRs76YEIJmkrIyd/WHPLx0XM7pGbJ4Tp46tKkclzuUAqzX4X
	 q7jJWp4F174h7Z2j/s2LVb1eE98DQBTsSrJ3uqYQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MJj1Ig3502370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 14:45:01 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 14:45:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 14:45:00 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MJj0V3123482;
	Fri, 22 Aug 2025 14:45:00 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2: Add default PCI interrup controller address cells
Date: Fri, 22 Aug 2025 14:44:59 -0500
Message-ID: <175589187470.649734.635057180914460439.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250822133309.312189-2-krzysztof.kozlowski@linaro.org>
References: <20250822133309.312189-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_124504_911870_9415D540 
X-CRM114-Status: GOOD (  16.68  )
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

Hi Krzysztof Kozlowski,

On Fri, 22 Aug 2025 15:33:10 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to the PCI interrupt node to silence W=1
> warning:
> 
>   k3-j721s2-main.dtsi:1431.3-1434.29: Warning (interrupt_map): /bus@100000/pcie@2910000:interrupt-map:
>     Missing property '#address-cells' in node /bus@100000/pcie@2910000/interrupt-controller, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0)
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1] with a
minor subject line fixup. Thank you!

[1/1] arm64: dts: ti: k3-j721s2: Add default PCI interrup controller address cells
      commit: 04f1c432b7ae38415a1cf374f39954d5a612c23a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


