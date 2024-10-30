Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F94D74963
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 05:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXEoGVVRa6LoOYXk0lcO2dzLAjAUxRyL2GF3k7zGkoQ=; b=2n4IFw7mM3ZPX7N+abaBrMY33n
	2GLocG1CWKYOTrB2LrqcsWqYgr+xyGj/K6R4EQkF41+I9ecrD/bm7rBLFK8jTQLiFXp8oneHCiqaH
	1ENjWjlnbzMY6pjTTEXk6qA3nwhpJa2KUjPaEOzgAsEfSByLVdagHXq0Ff1v6nKIKT7KOmVlxMUQD
	33pU7t4yneXSikwnywvpP2Gw62IQpz8ScQ40hloBl1SKG0+ZlRAzFBXsd1RV0AJ7A+/f4RiXERdce
	LjmwE1OJtlqUWBm4KfuNzfpZXM4a2G6DdApHhBkBh18xL7lnoh/0FTAHQgkwdxlBc5JxSsTe8wmaH
	9Myn5UbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60oj-0000000GjaF-0PS0;
	Wed, 30 Oct 2024 05:00:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60h9-0000000Gia4-2wRg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:52:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49U4qUv3046209;
	Tue, 29 Oct 2024 23:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730263951;
	bh=EXEoGVVRa6LoOYXk0lcO2dzLAjAUxRyL2GF3k7zGkoQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gAs5ZwHToPW8AeNDMhTuGwmpNlf6Jp4bsklHQUA4qeo2tbNdKuPX4mM2T6o0AW408
	 YAYNBRm+/VJR/UvvuzZ7u/PbQQ0iqecwdUqZ/WduEhRNiSaZVzpw3QoJWx7WmsfiYz
	 sXlplvZVAWq8sMvWacgQ9Uuz7qQkfNH3rBcTUe64=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49U4qU7C014376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 23:52:30 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 23:52:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 23:52:30 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4qQV0005184;
	Tue, 29 Oct 2024 23:52:26 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <mranostay@ti.com>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <nm@ti.com>, Aniket Limaye <a-limaye@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>,
        Jared McArthur
	<j-mcarthur@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j7200: Fix register map for main domain pmx
Date: Wed, 30 Oct 2024 10:22:24 +0530
Message-ID: <173021674662.3859929.17306406309658098523.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240926102533.398139-1-a-limaye@ti.com>
References: <20240926102533.398139-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_215235_857324_2D60527C 
X-CRM114-Status: GOOD (  14.53  )
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

Hi Aniket Limaye,

On Thu, 26 Sep 2024 15:55:33 +0530, Aniket Limaye wrote:
> Commit 0d0a0b441346 ("arm64: dts: ti: k3-j7200: fix main pinmux
> range") split the main_pmx0 into two nodes: main_pmx0 and main_pmx1
> due to a non-addressable region, but incorrectly represented the
> ranges. As a result, the memory map for the pinctrl is incorrect. Fix
> this by introducing the correct ranges.
> 
> The ranges are taken from the J7200 TRM [1] (Table 5-695. CTRL_MMR0
> Registers).
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j7200: Fix register map for main domain pmx
      commit: b7af8b4acb3e08c710cd48f098ce8cd07cf43a1e

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
Vignesh


