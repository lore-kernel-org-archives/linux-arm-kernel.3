Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082CFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BC1xt3U6mv0ThZ0HpbTY/TM5EPeMYpFZHKvVhnEdkt0=; b=xkP+8ZxxsjZXQoUibiRsr0H4xG
	4GoCnVQ4O8o1XBzSEUUh/ma83oqLL1kTWVq5ITefyA1+fPcRzkTkHmyjeYtXuH7f72lj+U7AdAPBs
	gydBm3je4GdOZ6FzKpaaDQ2xQ3kH7w3aeqJIrWhvrzdGFmno5VtmZzDaTxnNG/TgL/BoUrqJfnS4k
	J37JwMcEAStfkGXqaVfZZABAvnm074aHfWMMzJ+epK/9+cVLrjEnlvfwcqrzkfZdu7RrqrrGChowI
	svewMKtoYWEXhHbyC1NKAAM/5LT5bCikjfT7Ev+v8UpxkhebdgKaKJFajFldUkRMu+LvqntFBzHL8
	11FaTWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaFL-00000000TnB-1BAh;
	Wed, 08 Jul 2026 21:55:59 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaFG-00000000Tkp-1U5h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:55:55 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gwX3C6zbmzMlH6;
	Wed, 08 Jul 2026 23:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BC1xt3U6mv0ThZ0HpbTY/TM5EPeMYpFZHKvVhnEdkt0=;
	b=iJMDKEbY61gAoZ14a5iYqseNegQINPiC0SHMANNzvWz97euF0D5KWV7RDzPR68wZNobLgy
	PyledHyVnq5nj9qhjCS4t0zp3/8iWREWd1afnseaxmrC/yPOWGTC1zzLtO1bSaRRlAqRwp
	ocqjXhb6T8gra0Juwc+lDlPaJlss08B/w6ua5dT3pNHk2mUWvCokPNYostj53mK3futKXd
	yuPSGuHa9gKGSqOz6dW5timDiLf1IH4t4Hy4GLqdwmzkSzhgkxmyibOtQF/iZHOludJIxQ
	/CJNWxTcEchdCHTrIQfgT81+valKzAkMbzUFzitT0YwIWHfZdPolxdwPlBmzdA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vAinF9H8;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <80a31a21-9876-48a7-a9ed-baac4f87bc11@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BC1xt3U6mv0ThZ0HpbTY/TM5EPeMYpFZHKvVhnEdkt0=;
	b=vAinF9H8piMFbSnVT7eoVjPaZOCwOyUyA+dvZgqr7pbw6EF/AS1S+qWfA6hSn7mHtR5P9u
	M9x+pr4fIplkrqDIO/SovotBZAp5Np1j//ykEpvzKcVEq1/b89KNMn/k8Pmx/T1NQUgHRW
	/CckA4hwZXJhQkw9/6Vj01O+WdZ0usajWempmFdsDlmn6F/D4OrUTSkE5mZKz4xeYrQHUS
	4kDKqfKhr1tETdjB4e9XdulrtMmKRM33+r1231OBJnuRL/HKMJiBSaK/B0CRO83BqiBLvf
	27G1sMfKjgjs8FzTuYE/fD1DXUcTxZ03haENO0D8gRV8cyoLdxhxPgAzVt2NDg==
Date: Wed, 8 Jul 2026 14:40:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1783505142.git.geert+renesas@glider.be>
 <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: ef0b45d8a788b902f24
X-MBO-RS-META: jobrrtndyqmfohyy1rg3juf185ahus75
X-Rspamd-Queue-Id: 4gwX3C6zbmzMlH6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_145554_546112_DF22BE9C 
X-CRM114-Status: GOOD (  12.31  )
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

On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:

[...]

> +static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> +{
> +	struct device *dev = priv->dev;
> +	unsigned long rate;
> +	struct clk_hw *hw;
> +	const char *name;
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> +		rate = fixed_clk_rates[i];
> +		name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> +		if (!name)
> +			return -ENOMEM;
> +
> +		hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);

Would it be viable to use devm_clk_hw_register_fixed_rate() here ?

> +		if (IS_ERR(hw)) {
> +			while (i-- > 0)
> +				clk_hw_unregister_fixed_rate(priv->fixed_hws[i]);
> +			return PTR_ERR(hw);
> +		}
> +
> +		priv->fixed_hws[i] = hw;
> +	}
> +
> +	return devm_add_action_or_reset(dev, unregister_fixed_clks, priv);
> +}
[...]

