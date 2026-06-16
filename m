Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3CDCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 02:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ynt5Rv/FX8cb2j96OmIo8MCXaTk9mcGzKiQ3nlHp39s=; b=LMJGGuBodfkQKgZmPR9vTGXvxU
	pYQt2NxgHsm1hD7i5BgTByiDnfNYm6PrIpYE+jMyNq/uCBCZ6MGFYlFz8Z6GMrPww2yA6TFigtmr7
	MgIWPtwNIfh+zkBLPUpQ+p+9bGYUF7yoJ3+d6Y1QrJe6p5nPRJ6sRsnMZAKgbQYrMcNCUJ5moDFen
	isROZdoW4L3IaUe/wuWKjzApIc3NnKhzfaUexooYAdibQWSrNxnvLy/uIdu4GMY5nciabQ8eU2oY0
	AvoPWijaqs15jCGs/2amxeIGNMo27qnIusJ7kQ15RRMrFndhavlxq10MemT3COPbNHKSki22z49dS
	JIm0aZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZJAP-0000000F5qb-2Sxh;
	Tue, 16 Jun 2026 02:04:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZJAM-0000000F5qI-1l0e;
	Tue, 16 Jun 2026 02:04:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDEAB4361A;
	Tue, 16 Jun 2026 02:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B5E1F000E9;
	Tue, 16 Jun 2026 02:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781575477;
	bh=Ynt5Rv/FX8cb2j96OmIo8MCXaTk9mcGzKiQ3nlHp39s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Y5mhYYkvansAIvT3Hva6QceMfiuFfZeDBYczpkQqd5K5mLQcgstTkkYXGMiZe1SbN
	 +9yzyG7ffYCbYvmYGSKCnPKwDLb8My++8BAflvI3NluL/L8WKo8iy7zwfVrIuP8xY8
	 0JN9ff0/mAGDquUVykk8Qs0ElBIGY5XXoaOB3tsfZ2pY2jDis/8Zj19SdohC++nakK
	 8yAz0ltok9dToMeczqsZp1dDHEmSpaEcZsuCk0hSImkURCeNa1ANzOhPxsOlqfkKXX
	 SvxqX0HuIbaFhxVXkpQHc1qEQeKeS2UzHV5+cBHVJfrWWA8w2ugHTyaipJQ+dHPL39
	 sFuAttQ4CEbAQ==
Date: Mon, 15 Jun 2026 19:04:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>, Andrew Lunn
 <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 0/8] net: dsa: mt7530: modernise register
 access and add two DSA ops
Message-ID: <20260615190436.4b87d50b@kernel.org>
In-Reply-To: <cover.1781500517.git.daniel@makrotopia.org>
References: <cover.1781500517.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 15 Jun 2026 06:20:55 +0100 Daniel Golle wrote:
> The mt7530 driver carries its own register accessors that predate the
> regmap conversion and now largely duplicate what regmap already
> provides, including locking. Most of this series removes that layer.
> 
> It first moves the MDIO bus locking into the switch regmap via
> .lock/.unlock callbacks, matching the PCS regmaps, so any path reaching
> the regmap is serialised automatically. With the wrappers no longer
> adding locking, the thin mt7530_mii_* indirection is folded away and the
> remaining accessors are replaced mechanically with the plain regmap API,
> using the coccinelle semantic patches included in the commit messages.
> Open-coded register fields are then converted to FIELD_GET/FIELD_PREP.
> None of this is intended to change behaviour.
> 
> The last two patches implement .port_fast_age, which flushes dynamically
> learned MAC entries on topology changes, and .port_change_conduit, which
> moves a user port's CPU-port affinity at runtime.

Oh, v3. I guess the kernel.org bot missed it.
Too late to apply this anyway, but also you put the zero init
in the wrong place AFAICT.
-- 
pw-bot: defer

