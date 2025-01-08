Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38584E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXSnLLVYUK030RfldFL8WTF5ObExafHj71Q25/dTBMo=; b=Jx0alv1jgF5AZfM4suLEdBOR8i
	Vg/Fy/ujp1O1kEDr/Qy3hzZMXkWnOKxa558//6pqi+XxzKKVJRiPapNEWN/8fl9gETCCT8Y0aD2lu
	CEAWPIL930Cj/eOPcevVH4U1S6i+g7IvQrCsgr1xLl/s8fbFX3FpNbdcVnjeF5h+zMxQaKBBptRuW
	O63JwdrFKlh7rv4eadqcei+ARfqKTuTDL7M+Wa9llpWYhefZ5Z82gdXTDGDVDY1Q8A90n3aq67+gv
	UJs4VAjkNyJvQVjlEBR8yAPdiIFueJ75gICUXlgFNBFqrHgQfACt5px61zy1DWx5dedN8aeoO6cYg
	XVciCHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYNf-000000093Yz-3vhh;
	Wed, 08 Jan 2025 15:54:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYLF-000000092wK-2zay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:51:35 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508FpRHP048297;
	Wed, 8 Jan 2025 09:51:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351487;
	bh=hXSnLLVYUK030RfldFL8WTF5ObExafHj71Q25/dTBMo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qUIYBp9cs5X0jvaqsO1yooYRoGNBOFZf7EnOSRudOpZrb30h680/5l0doAA5Gcz94
	 OOWKNtlcc+yrdmx54cqTHH5Qi8Z99MUHd0sfms4cfM2L5WL/rLTmqJ4ETkIPByLAo2
	 cJgLu0k9T74NJyMWs6AxJTT1RZWmbLH6pXd1kMUg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508FpRmC098543;
	Wed, 8 Jan 2025 09:51:27 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:51:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:51:26 -0600
Received: from localhost ([10.249.32.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508FpQ7F069921;
	Wed, 8 Jan 2025 09:51:26 -0600
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Josua
 Mayer <josua@solid-run.com>
CC: Nishanth Menon <nm@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-hummingboard-t: convert overlay to board dts
Date: Wed, 8 Jan 2025 09:51:25 -0600
Message-ID: <173635146906.1208341.13754676191717145508.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250101-am64-hb-fix-overlay-v2-1-78143f5da28c@solid-run.com>
References: <20250101-am64-hb-fix-overlay-v2-1-78143f5da28c@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_075133_843623_67EF44CA 
X-CRM114-Status: GOOD (  15.55  )
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

Hi Josua Mayer,

On Wed, 01 Jan 2025 13:30:22 +0100, Josua Mayer wrote:
> SolidRun HummingBoard-T has two options for M.2 connector, supporting
> either PCI-E or USB-3.1 Gen 1 - depending on configuration of a mux
> on the serdes lane.
> The required configurations in device-tree were modeled as overlays.
> 
> The USB-3.1 overlay uses /delete-property/ to unset a boolean property
> on the usb controller limiting it to USB-2.0 by default.
> Overlays can not delete a property from the base dtb, therefore this
> overlay is at this time useless.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am642-hummingboard-t: convert overlay to board dts
      commit: e2b69180431968250bf3c0c581155f1b37d057c1

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


