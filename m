Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2446CC6B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqjFtcMUiykXxYPVsn6NLogUDEnJnLN8ZRQiWX6Puok=; b=5D5ecdAn6K4o8z6NaBtF+Rx9Jy
	qCDLy2T7fiEg8X4YOtFCVnXX33PZIj+SUZRtp00Noo8vrKE2pkFklVT0aEUJWwVvhoZ4yDMxaD3Fk
	4JEF/s0N6E27KU+ltoStzS5OQ3lKHhBIQ6nu+/Nqq4ZAkZmPB/MNTPnRnG2/GPYauGHMmxPHsNWgU
	+soVRRUQUGAI6law2DU42DAZM28TGhQXCG1wUhrqjTnlj/ZmNbCk/nAw+oUo6hBLeQGl8XxnZPRQH
	dR7RSnnPNWXL/rIpj1ZJjAL3X6cSpzrPYMP9z8nKngEyoPH6fjS1dIbRqZXspy7V6lZjZnY99GzkZ
	BvuasAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH681-0000000GJNP-0wKS;
	Wed, 14 Oct 2026 21:03:13 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH67v-0000000GJMk-3zLt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:03:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5F15A158F;
	Wed, 14 Oct 2026 23:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792011778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SqjFtcMUiykXxYPVsn6NLogUDEnJnLN8ZRQiWX6Puok=;
	b=yIkCqM8VXYULT4KSbksQvh0J7Tj15J46cr34YtosYI+MjN0Qk5769F9P5w48F1OB0hO8NY
	pNbnddSbAdW7N+NXrJnwhCD1yKwuI+R8VW88csJuiShpMYw7uFaeel2BUQH4vPdQOhYD28
	yvTpcN52JWnyPulsJ+WwN9zZAtkZ4w+5OowTW6E+7A/S8UYV7yxAvT4LXOAh/L6aB8Vzl4
	lbDcYE+Hmrw2M7T2zY3ZPtju8277v6m3C2XptLTMAwxS7uQIctI1WXhjCDTxrY+RhrjIPU
	yXH7MMdMrWrRib0sHpB8eTrNmO9wF+K5NQMpemE2L8DPo7STohPRaJl25S8bOA==
Date: Wed, 14 Oct 2026 23:02:52 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Dragos Tatulea <dtatulea@nvidia.com>,
 Alexei Lazar <alazar@nvidia.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_0/3=5D_net=3A_use_skb=5Fs?=
 =?US-ASCII?Q?hare=5Fcheck=28=29_in_loopback_selftest_hooks?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261014130618.4c50f817@kernel.org>
References: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de> <20261014130618.4c50f817@kernel.org>
Message-ID: <BBC0F4F4-AE37-423C-9BC8-4C288D316DA9@tipi-net.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_140308_802100_4C8464FA 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi Jakub

On October 14, 2026 10:06:18 PM GMT+02:00, Jakub Kicinski <kuba@kernel=2Eo=
rg> wrote:
>On Wed, 07 Oct 2026 20:29:21 +0200 Nicolai Buchwitz wrote:
>> The loopback selftest hooks can get a shared skb when another handler
>> is bound to the device=2E Linearizing a non-linear frame then hits
>> BUG_ON(skb_shared()) in pskb_expand_head()=2E
>>=20
>> Stumbled over this on RPi CM4 (bcmgenet, with jumbo series applied +
>> WIP selftest patches) with a packet socket open at the same time as
>> running ethtool -t=2E
>>=20
>> stmmac and mlx5 seem to have the same pattern, xgbe already handles
>> shared skbs=2E Patches 2 and 3 are compile tested only=2E
>>=20
>> As the impact is pretty limited and doesn't seem to bother anyone in
>> the wild, I've chosen net-next, but kept the Fixes tags=2E That matches
>> what Paolo suggested during the LPC track=2E
>
>Wonder if we should follow up and rename skb_unshare to skb_unclone_full
>or some such? The "share" in the name is quite confusing for people who
>haven't been around for 10+ years=2E=2E

Makes sense=2E _unclone_full still sounds a bit clonky, but I can't think =
of a better name right now=2E I will give it a thought and send a follow up=
 :)

Regards,
Nicolai

