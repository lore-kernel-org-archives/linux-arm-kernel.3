Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C61ECD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKLPNhbMJUK/p7PD2Estkpj7uFBVbHPhaCT82Mgh5bE=; b=gDCaJYwZMGb8CaJGKrIcu4nnFc
	RQK9NKj3dF/3DnSj8fWb9yAm0m1HbjvkmEV3eU9SaN8irjI9Wvszz1kPGz/SES9Qilh+tMoLH0teN
	kuO2suDFGGKXVQftTyzYSuo6YYNcfmSvN9WQ9MphfaW5EBNK99h2HMJ2CaLCyn5Zc2AAkAnK5FQqz
	lh6WngHWPpo2uVvMTjYAuVx+FSA59ZgrvnlFPKNQBdPl4vwqTex15pMiwi/Y8xySu6yWqw7x2jgco
	lOesyxpQqLmaFUgC3ykwA8pMJ1P+6mpvRpN7wG9oKQTszyuWrTFot1Dzqz5jj9t4x/gGZ7lTJWRLW
	ytMCKusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtJ-0000000EwwE-3Wmp;
	Mon, 15 Jun 2026 23:38:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtH-0000000EwvL-1p6i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:38:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E03FE600AB;
	Mon, 15 Jun 2026 23:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD11C1F000E9;
	Mon, 15 Jun 2026 23:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781566730;
	bh=jKLPNhbMJUK/p7PD2Estkpj7uFBVbHPhaCT82Mgh5bE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KsUHbuUgh0Kico7Kh7y5uUGusBEckK7HauGoXM5Ld6Mco7t6ktGtVsUz/m+Il296p
	 C69u0TJf6frkVdV3q20JWhopLZ3tUbhvSmQWB6Z9r23wmwGGWpfmG3xQQYzOqQlITI
	 mv+UW6JrgwJgR3LqdboSeM3zz98mvRRANDDwzd0q8jYMlGMPRP8xLDxVFgznxowvTW
	 l1WRxv/fjuJZnnIo1VqoTe+Cgr7BPWLbNpgOZLWPyi2RgLsUpuF6oHoPckycEvev5p
	 /aYyP/GFvxS4QOvB9H+QEU2KlfaBmAwWl9MCb3eoUve95+QHaxqt4MUi5ZSrjMVBxY
	 V0bm8qbBvhO/Q==
From: Jakub Kicinski <kuba@kernel.org>
To: jensemil.schulzostergaard@microchip.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	horatiu.vultur@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	daniel.machon@microchip.com,
	Steen.Hegelund@microchip.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next 6/9] net: sparx5: vcap: add lpm vcap implementation
Date: Mon, 15 Jun 2026 16:38:49 -0700
Message-ID: <20260615233849.1042290-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612-sparx5_l3_routing-v1-6-fc3c10160f49@microchip.com>
References: <20260612-sparx5_l3_routing-v1-6-fc3c10160f49@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: sparx5: vcap: add lpm vcap implementation

Add the implementation for the LPM VCAP for lan969x and sparx5. The LPM
VCAP has a static keyset configuration, and a single lookup dedicated to
LPM, so this is straight forward, and many functions can use existing
functionality.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
> index 95b93e46a41dc..e25e759c24f60 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
> @@ -1083,6 +1146,46 @@ static void sparx5_vcap_es2_cache_write(struct sparx5 *sparx5,
>  	}
>  }
>  
> +static void sparx5_vcap_lpm_cache_write(struct sparx5 *sparx5,
> +					struct vcap_admin *admin,
> +					enum vcap_selection sel,
> +					u32 start,
> +					u32 count)
> +{
> +	u32 *keystr, *mskstr, *actstr;
> +	int idx;
> +
> +	keystr = &admin->cache.keystream[start];
> +	mskstr = &admin->cache.maskstream[start];
> +	actstr = &admin->cache.actionstream[start];
> +
> +	switch (sel) {
> +	case VCAP_SEL_ENTRY:
> +		for (idx = 0; idx < count; ++idx) {
> +			/* Avoid 'match-off' by setting value & mask */
> +			spx5_wr(keystr[idx] & mskstr[idx], sparx5,
> +				VCAP_SUPER_VCAP_ENTRY_DAT(idx));

[Severity: High]
Are concurrent writes to the shared VCAP_SUPER_VCAP_ENTRY_DAT registers
safe here without a global hardware lock across the different VCAP types?

It looks like IS0 and IS2 rules are updated via vcap_add_rule() under the
rtnl_lock(). However, the LPM rules are updated under the
sparx5->router->lock inside a workqueue.

Since both execution paths share the Super VCAP hardware block, could
concurrent updates from TC (IS0/IS2) and routing (LPM) race on these shared
cache registers, and also on VCAP_SUPER_CTRL in sparx5_vcap_super_update(),
garbling the hardware command and corrupting the cache memory?

> +			spx5_wr(~mskstr[idx], sparx5,
> +				VCAP_SUPER_VCAP_MASK_DAT(idx));
> +		}
> +		break;

[ ... ]

> @@ -1379,6 +1523,7 @@ static void sparx5_vcap_update(struct net_device *ndev,
>  	struct sparx5 *sparx5 = port->sparx5;
>  
>  	switch (admin->vtype) {
> +	case VCAP_TYPE_LPM:
>  	case VCAP_TYPE_IS0:
>  	case VCAP_TYPE_IS2:
>  		sparx5_vcap_super_update(sparx5, cmd, sel, addr);

