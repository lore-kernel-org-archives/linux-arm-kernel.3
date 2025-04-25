Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8C0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wFWw+HTux9+C80z7DbPt+Y55zU1bWr9sqxdd1W7QKA=; b=bTsf86963GcwW49cg2mLYPJBnW
	vt4VClJgyGEJD0yO9xe3kikAE4kk9z8jw6RKNpXzHIE1ew59XEJJHynKoC+n9hgKIaA7crI6IPHKC
	A+ykI8EgUbXtgipPu6V8l/cL+y3wVQxptFn1vX1rY+yzvhTAmHWLWyV6uUAL9U1m36QMu9Vt9ckfw
	sGM1f4x+9UJ+G0/kjfnmBQXdy7NEgQ59snV94wNSILHE+xD8YpYn39UfY1kZz2RXvpfxN3hwpvPMh
	zeMb8SMAZQj2qKb46rPPROrClqN5ZhgAKJX4LgrDCngW7cTAAP+c1XzsMsxDrkA0NJ3Lk+sg/kjqy
	yqx0y8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Qbs-00000000vSH-3WEo;
	Fri, 25 Apr 2025 21:29:24 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QKC-00000000tbA-0IB2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:11:09 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLB4dk2258212
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615464;
	bh=+wFWw+HTux9+C80z7DbPt+Y55zU1bWr9sqxdd1W7QKA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ppIXjbIdExPfF0+Pq4GRofkMRiVkvlTWX5mQJ880nWYEy/AkGh5GH0WfWwrB56Qod
	 bxDrfwhsq50MqUkiYxSN1e8gE96uEF3/U/5v6b1qmYrrq+cSpOFcjI1X+KZONS4Vht
	 qxjgtM2lSuKL2X8TVRWPY7e5JrVOxXHr4zvH2h8s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLB4TE123718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:11:04 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:11:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:11:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PLB40A095369;
	Fri, 25 Apr 2025 16:11:04 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Enable PWMs
Date: Fri, 25 Apr 2025 16:11:02 -0500
Message-ID: <174561544737.210439.8040371358617840114.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250422000851.4118545-1-jm@ti.com>
References: <20250422000851.4118545-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_141108_193331_15408CFC 
X-CRM114-Status: GOOD (  14.11  )
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

Hi Judith Mendez,

On Mon, 21 Apr 2025 19:08:48 -0500, Judith Mendez wrote:
> This patch series enables PWM signal outputs on am625 SK,
> am62 lp SK, am62a7 SK, and am62p5 SK boards.
> 
> For am625 SK and am62 lp SK, add pinmux, eCAP, and eHRPWM
> nodes in the k3-am62x-sk-common.dtsi so as to not duplicate
> nodes in the board files.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am62p5-sk: Enable PWM
      commit: b2fd55f906ff70a39e67d5ad770774622164bef1
[2/3] arm64: dts: ti: k3-am62a7-sk: Enable PWM
      commit: 5aec1169b53969d07cc288814f7eebd2ef01f9a0
[3/3] arm64: dts: ti: k3-am625-sk: Enable PWM
      commit: d864bb528a6725e775d564fd4430762acbb9dd0d

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


