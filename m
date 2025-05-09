Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B12C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mQhNQN15AWPoSxZ/UW96naO8N0jhNAwPL8W34KjnmI=; b=zsS5E8dvVBFHaMDYe8cd3aUo9H
	1ZzDg52zpUgDP8vSTInaPtKY/0de1WmYRgChYnHLVJsAjU11v0FxM1ajw7a+7DYvjw5JiNGVpHzV1
	WaWWRf6Yr1KpHTbav1xBLGDpl5XaaiCHnrXPndAOgXVxWzcnklh66ENwMuaNnlVyw5TzLGG4CEgON
	WN5Z5ibEJyNjcKjgHz/rBFpAprH+0+oxMdy469cVjVgESuiKD6nuXZ4aZE+u/Nnzea/dX9FCbG00j
	1v8ua5tQgTvRuF0ftGfyNGWLSyq2oqIIfuWD0+XVRTVTj3fl0Wi+MByMnKMlf7ubVYrFNsVYpBXhW
	nhQ6xvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNQ2-00000003hIc-0QXb;
	Fri, 09 May 2025 13:05:38 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMiK-00000003Ywz-1Jq3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:20:29 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 549CKOow2172425
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 07:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746793224;
	bh=+mQhNQN15AWPoSxZ/UW96naO8N0jhNAwPL8W34KjnmI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ruil6K+bU9qcMNno0uaEo96wcmGTT/kQZTJQB3CauvilAMSPMBWBfd3CunIaQfcbk
	 3N7VVWfaPnJR0VI+qr0SR7PG5xlljJQXMbgC0SLRC8wExIaduHVPFDjEvXB+AEZmWE
	 X3zAmt2k0rJXPznyuO4VMmRf//mI4mzo058Aiums=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 549CKOZ9099455
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 07:20:24 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 07:20:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 07:20:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549CKNDF014862;
	Fri, 9 May 2025 07:20:23 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Daniel Schultz <d.schultz@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <upstream@lists.phytec.de>
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am62a: Enable CPU freq throttling on thermal alert
Date: Fri, 9 May 2025 07:20:05 -0500
Message-ID: <174679319970.1568651.6289988251494879815.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250506114134.3514899-1-d.schultz@phytec.de>
References: <20250506114134.3514899-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_052028_440322_D4672BA9 
X-CRM114-Status: GOOD (  13.79  )
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

Hi Daniel Schultz,

On Tue, 06 May 2025 04:41:33 -0700, Daniel Schultz wrote:
> Enable throttling down the CPU frequency when an alert temperature
> threshold (lower than the critical threshold) is reached.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62a: Enable CPU freq throttling on thermal alert
      commit: 8785b579d431b2a76a64f105328434d3c543debf
[2/2] arm64: dts: ti: k3-am62x-phyboard-lyra-gpio-fan: Update cooling maps
      commit: 625e540cee2cfa0e514e0c8fb929fe2893e6d3bf

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


