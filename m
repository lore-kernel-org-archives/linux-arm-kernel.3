Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4690D149F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpSLalUzNrmD4PotMuaGBUbYK1zZiH71ItNeVXW7vwg=; b=FBehKZCDImhBffaRO7+jbA/nV3
	Wt0p7v+RVOatE8LsKVB1zsYtu+w1uIKy4pGAw9IgpH/fXIH+JVFJbWbuBsL0hISJmDYyZZMzqjmSd
	prVFYoEd7O1Bl+cei8pgrmZ8su/Uq6/1uLDa6TnqH8dL8zwiQG9q+IuFUt9nqkEMABEC/L4qoYs1V
	n6bJMPF/r52sEcUg/Z73SqtYlGQI3ZJszc6fq48xg8Sk6OF1QexsZujJjQFDDPG6p3BlCL3b/JbaT
	uOIAIp/yyCVI4GqPrxffI1rlik8Q5eZjPkdHlxjviEcyd1FBjqmwbn92vKEOVy9VSnma+5GKbrS0r
	7gccF9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4RCW-00000005APh-2Kpf;
	Fri, 25 Oct 2024 20:46:28 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OaZ-00000004hnX-2XBm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:59:10 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49PHwxRh030612;
	Fri, 25 Oct 2024 12:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729879139;
	bh=GpSLalUzNrmD4PotMuaGBUbYK1zZiH71ItNeVXW7vwg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jiT6XWP3MtkUN8Fn8mLyH9gfqD+XVyV79JzdSj4FU+yIxhqjBbd67YizLn5m7CUK3
	 XqA+GOjm0tsfwzAiysVbeZyCN5LLxje/eUfSz0LUVl/kZ8V4osONphjWnp9crqRVRw
	 z8OrR1vSjtUXMQlfKGr1e9l6o9mdqdt79qkO0UJU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49PHwxN8078354
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Oct 2024 12:58:59 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Oct 2024 12:58:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Oct 2024 12:58:58 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49PHwwkI023370;
	Fri, 25 Oct 2024 12:58:58 -0500
From: Nishanth Menon <nm@ti.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Len
 Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Markus Schneider-Pargmann <msp@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
        Vishal Mahaveer <vishalm@ti.com>, Akashdeep Kaur
	<a-kaur@ti.com>
Subject: Re: [PATCH v13 0/5] firmware: ti_sci: Introduce system suspend support
Date: Fri, 25 Oct 2024 12:58:55 -0500
Message-ID: <172987909155.476920.13344501386526710095.b4-ty@ti.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007-tisci-syssuspendresume-v13-0-ed54cd659a49@baylibre.com>
References: <20241007-tisci-syssuspendresume-v13-0-ed54cd659a49@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_105907_759581_692C3DF5 
X-CRM114-Status: GOOD (  14.82  )
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

Hi Markus Schneider-Pargmann,

On Mon, 07 Oct 2024 08:08:53 +0200, Markus Schneider-Pargmann wrote:
> Abstract
> ********
> 
> This series introduces necessary ti_sci driver functionality to support
> various Suspend-to-RAM modes on TI AM62 family of devices. These Low
> Power Modes include Deep Sleep and MCU Only as described in section
> "6.2.4 Power Modes" of the AM62P Technical Reference Manual [0].
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

NOTE: I have picked up Ack from Rafael per [2] and applied the full series.

[1/5] PM: QoS: Export dev_pm_qos_read_value
      commit: 3e360703d0bff3bb5643b2a0bf9a670931ba8b71
[2/5] firmware: ti_sci: Add support for querying the firmware caps
      commit: 055b6cfb62f5a1ea811aa21b96f2e611329b12b8
[3/5] firmware: ti_sci: Add system suspend and resume call
      commit: ec24643bdd625971933451f22b8e33d364920f6e
[4/5] firmware: ti_sci: Introduce Power Management Ops
      commit: 60357991f6b9d4bd4dc442a368da3f468cfa4903
[5/5] firmware: ti_sci: add CPU latency constraint management
      commit: a7a15754c7f70a833ffeb9ad996b358924f10305

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
[2] https://lore.kernel.org/lkml/CAJZ5v0g1Ri_wKYppomE6RXqcZXRnX7bLOPMtsQaao0uchSfE9A@mail.gmail.com/
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


