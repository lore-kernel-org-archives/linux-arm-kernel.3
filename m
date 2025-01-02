Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004F5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kagO0k/oqGBpNLaSabOH+1r0G13QU3LhaSmnXl3qhrA=; b=SG7Bv67q2xNCX9snxB4TUfxxv1
	rI8H90EFe8B4SzTIOgQLh6cYkyB2GkVXuViQXryQfsmDI9Y0/pR8lNAHwuoB4X5gsjLA02GUN0hOl
	hwgclEaZci8I8a6yaeJikZ3nJ9/GCYLoZC0nKBAcX3tlkCH/j9diyuc6+SyP7L2JroEaD9i4QFvXD
	hBE4ZP2BXUJ6MeA3GOMSaEt/LXMD5ljR2fgI7PZUKr8mGnWZAl6iqkOkNOafHfWbhq2IcMZdoZR9M
	5CnlT5UyfCPyrjglKGYDi5JXtOFyoi0vXzEGaWgGXzgZgoDmsbgzDt1PrES+BsjjR90ilSZkI5JTE
	iI9Ivckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO7Z-0000000Aq4V-2f0m;
	Thu, 02 Jan 2025 16:32:29 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO6A-0000000Appd-1hrd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:31:03 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502GUvOT2199253
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 10:30:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735835458;
	bh=kagO0k/oqGBpNLaSabOH+1r0G13QU3LhaSmnXl3qhrA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HG1SBr02p8m7F74CkIiV6lKQ+T/LXm4M12/JgHYLcp1Vju5zpGhXeAPKY+T/IOoCn
	 1NIurZ6X4a2B88/cV1UVpRvGuc24x21VYjlEWmIyart879B5jqXKshv605nE3zufrB
	 l5JBgDHcacbaF3cg0TF22kXDtrWMhSS7sMIVtGxs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502GUv1L023615
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 10:30:57 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 10:30:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 10:30:57 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502GUv9i075516;
	Thu, 2 Jan 2025 10:30:57 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk: Remove M4 mailbox node redefinition
Date: Thu, 2 Jan 2025 10:30:56 -0600
Message-ID: <173583539528.267639.11532686969673222752.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203164031.20211-1-afd@ti.com>
References: <20241203164031.20211-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_083102_539477_56C5C0A0 
X-CRM114-Status: GOOD (  13.62  )
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

Hi Andrew Davis,

On Tue, 03 Dec 2024 10:40:31 -0600, Andrew Davis wrote:
> This node is already defined in the included k3-am62x-sk-common.dtsi.
> Remove this redefinition.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

I have assumed the fixup is trivial (since there is no functional diff in the
final dtb) that "fixes" tag is not important to backport.

[1/1] arm64: dts: ti: k3-am625-sk: Remove M4 mailbox node redefinition
      commit: 17d0723c6cf841ebaf510eaf9bb1ebf4991d6e9d

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


