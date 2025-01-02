Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BFEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MFmIHhCk/rAx3hqXJ4Qkb9WRuDjk3r2C1qHxrU2TeY=; b=c5REPUb1qnEs6BqxD/pj5Akfk6
	WzJaoEvvjzveDRW0hVGTYk9Fe/ZjW+3MDiJlH5aFyJm9L5aBOvc8n5K3bTycHtbe0aL2ALH/RwFur
	ptftskk5nvfUxha0J94V/xw9foBHwglbBQb9yQ51M0gn9VQLr5KGT9/9wP4zCU5g4rB26scgVjxov
	tFVzM0NjNJmu4KMC11IBpDmcwMnJLGV+A6sOIlURU+mO3YDLJoKU3vfK+NndHHRoUvjHUsxZfrJ5V
	LffyyYdWM5IRibx7HIR27aYt+GZfFQyW396btU1C4GSOXhZSOCS3e2VyHDxWMPt9kbYKBBOkWCfur
	LehUCbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO6N-0000000Apt4-48G7;
	Thu, 02 Jan 2025 16:31:15 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO56-0000000Ape9-3ONf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:29:58 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502GTlXK2198793
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 10:29:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735835387;
	bh=+MFmIHhCk/rAx3hqXJ4Qkb9WRuDjk3r2C1qHxrU2TeY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nRMgclD7PBB+xyVgqdRY3ac9KIOTZML6G7orvdXDTrbI9/R0Nb6hpPYJWXlT4UQ4o
	 QCZQXa7KoEYBgUD8BuOPUGgSbh/5KvcGt9Rb0TlfsOQAAp17ToAQjoj0Kv+Y/d+oCl
	 P9mBVvRnX0cogDJNzhRsk1Web7ATnP3j6xaKAm48=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502GTlMr021924
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 10:29:47 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 10:29:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 10:29:47 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502GTkgx055171;
	Thu, 2 Jan 2025 10:29:46 -0600
From: Nishanth Menon <nm@ti.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bhavya
 Kapoor <b-kapoor@ti.com>
CC: Nishanth Menon <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>,
        <s-sinha@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable support for mcu_i2c0
Date: Thu, 2 Jan 2025 10:29:45 -0600
Message-ID: <173583532350.267426.8424602830328689601.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105091224.23453-1-b-kapoor@ti.com>
References: <20241105091224.23453-1-b-kapoor@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_082956_939024_62B50BE9 
X-CRM114-Status: GOOD (  13.54  )
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

Hi Bhavya Kapoor,

On Tue, 05 Nov 2024 14:42:24 +0530, Bhavya Kapoor wrote:
> Enable support for mcu_i2c0 and add pinmux required to bring out the
> mcu_i2c0 signals on 40-pin RPi expansion header on the J722S EVM.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

Side note: It would have been useful to state in the diff stat that
gpio_ranges handles the standard GPIO configuration.

[1/1] arm64: dts: ti: k3-j722s-evm: Enable support for mcu_i2c0
      commit: 9442f963098f1eb9d1565fdd694e506d0c2c6f45

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


