Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80911D5CCAE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O7DRUlTOQ1uVBZyn2qb6McuWmIQQJwh05TiRUoOhj0=; b=33y7kUY4asqEVO98r8Mybr4HCm
	0Ut6uw3QP1GioVHLh46FQxJ5n8sV9xcLFxbNtA4cbjnn2wfl5oSrruGqOuf1c8ujjGe8bwZ5zVsBY
	MS1HHsHxdKiBBL0TYDzQZoPAy8v1bBj2+DGHHlVUAPS+WbOibId1x7Gg4kHEmqjxlX9Di/PrMzjdX
	GkcoUFnAlo/NXJEe53IogxeZcJxuY34cdmTnRydLrBOPdGWHjAVhf5l1h9sc86GeP2Rlf3gwUfrZ4
	/t71hyr7AG4L/rfoHFY9Yk1ywQyLVYoqnYYw4no/IpKH8+OktKV3iu/JOA9nZrCeJPHf3wmnnbThW
	bWbipwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68k9-00000000TKE-38rO;
	Wed, 30 Oct 2024 13:28:13 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68KN-00000000P6Q-2zEi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:01:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49UD1Uvi086261;
	Wed, 30 Oct 2024 08:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730293290;
	bh=6O7DRUlTOQ1uVBZyn2qb6McuWmIQQJwh05TiRUoOhj0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yO8XwNtwScSRXieQQ2kgpH00CwE3gHz7yY0MVpb7WBsoZaF10+m8u9ciqQ061Jyl+
	 UjNAZsgPBK4a6165zvxcAPJ18T1ruSTyLCauMcI6OA0dVkvvD1/4heFq0zLeghHmgI
	 v+LPTD6ipkiMNwmnBoemRsQciy7MoB8AZgLCAR7s=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49UD1UMe023548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Oct 2024 08:01:30 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Oct 2024 08:01:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Oct 2024 08:01:29 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49UD1T4a079000;
	Wed, 30 Oct 2024 08:01:29 -0500
From: Nishanth Menon <nm@ti.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, <linux-pm@vger.kernel.org>,
        Kevin
 Hilman <khilman@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, Vibhore Vardhan <vibhore@ti.com>,
        Dhruva Gole
	<d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
        Sebin Francis
	<sebin.francis@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] pmdomain: ti_sci: collect and send low-power mode constraints
Date: Wed, 30 Oct 2024 08:01:27 -0500
Message-ID: <173029317079.2440963.17313738472826934777.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
References: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_060135_868936_06E56F13 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Kevin Hilman,

On Fri, 06 Sep 2024 09:14:48 -0700, Kevin Hilman wrote:
> The latest (10.x) version of the firmware for the PM co-processor (aka
> device manager, or DM) adds support for a "managed" mode, where the DM
> firmware will select the specific low power state which is entered
> when Linux requests a system-wide suspend.
> 
> In this mode, the DM will always attempt the deepest low-power state
> available for the SoC.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

Ulf, based on your ack[2], I have assumed that you want me to pick
this series up. Let me know if that is not the case and I can drop the
series.

[1/3] pmdomain: ti_sci: add per-device latency constraint management
      commit: 7c2c8d2651b5ffaffb2d5f723bd5b0493bd66f36
[2/3] pmdomain: ti_sci: add wakeup constraint management
      commit: 5a2d997b1bf8b05379309270063d7b9bd3767dd2
[3/3] pmdomain: ti_sci: handle wake IRQs for IO daisy chain wakeups
      commit: e8f35dc8de8c3216d28dab51b962bb31f20934c8

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
[2] https://lore.kernel.org/all/CAPDyKFr9isnz66B+n5y3=QO-ndB05JKZN3kgXO+kXBn7ofcwMw@mail.gmail.com/
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


