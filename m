Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B93C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzgVwTTJK2svobTX4brbWl/uGVdn2tvHC3F54nAitLo=; b=btZFBoA0pTba3yjrvt6dxvK9Ra
	egz5/tJRPepd5aRWOjt7ssWEfIKQuQSempdgBwF81quT+RCbegnaQCnRNPYAqo0JasgWGlwR1psYI
	zs4RwooMkQobOFYGofatHI52n2Ko9Jm1O+WJ/Ys+eA8zPEjLV9pxbjphl6N8LDkobejPdehByqN+x
	uopskXFZjfPHB3BERNrFAzpQCUXtVIgFn3FJXLkncCOpJE2Or6DzrYY3bwDk//8KiOZh7jS5W23gD
	6vaxUnlOeEnvmelcH3X59EVkMIueT7sOz0+ulGqjtsdQE1XjOJqUiDzX3MG1JjBuDpdhwIYlQy7xa
	HKYJk0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsObJ-00000008yw6-3Eeo;
	Wed, 12 Mar 2025 16:06:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOTT-00000008xOL-2nhl;
	Wed, 12 Mar 2025 15:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F4D95C58AC;
	Wed, 12 Mar 2025 15:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC9DC4CEEA;
	Wed, 12 Mar 2025 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741795107;
	bh=mGzsdd4n+9rU4Flpsz/PjxM975tzpYkjRrs7VBzcZe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iO4wMvjL0n81mulDSPGIErIKgPIp6w59ocSwCvEGoq/9FpMk0oxmTMQWXeh3Iwl5T
	 TnsVPLWlyKWINjm9up9Zwzy6n2LvScMvheCrUCm9zekxE5geGWZO+hrbULpausCcGE
	 oxFWbPD/wxbpMyvD5UXUReu7+8Coo0pe0mmNa/7lDriH3Voc0p5jNdGjhf5Nrb0I/+
	 FuuQTk2J4fsrMdfV8FwMFcmP9+5LkeD1NoZmw/BdvGr5YNr8fa0DnO6hhiyjJWhQ2a
	 kWCOwvA1l0Debo898AkxMush2eRf2rX9k7iAgM+09cCiYjGb1wrTl380TCNyWqQ6TL
	 Gc/TvUEkdmVpw==
From: Vinod Koul <vkoul@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, frank.wang@rock-chips.com, 
 sebastian.reichel@collabora.com, yubing.zhang@rock-chips.com, 
 Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250302115257.188774-1-andyshrk@163.com>
References: <20250302115257.188774-1-andyshrk@163.com>
Subject: Re: [PATCH] phy: rockchip: usbdp: Avoid call hpd_event_trigger in
 dp_phy_init
Message-Id: <174179510386.536552.5606148469623251433.b4-ty@kernel.org>
Date: Wed, 12 Mar 2025 16:58:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_085827_756541_C2BD810F 
X-CRM114-Status: UNSURE (   5.39  )
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


On Sun, 02 Mar 2025 19:52:25 +0800, Andy Yan wrote:
> Function rk_udphy_dp_hpd_event_trigger will set vogrf let it
> trigger HPD interrupt to DP by Type-C. This configuration is only
> required when the DP work in Alternate Mode, and called by
> typec_mux_set. In standard DP mode, such settings will prevent
> the DP from receiving HPD interrupts.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: usbdp: Avoid call hpd_event_trigger in dp_phy_init
      commit: 28dc672a1a877c77b000c896abd8f15afcdc1b0c

Best regards,
-- 
~Vinod



