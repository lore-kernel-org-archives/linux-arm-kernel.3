Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEA9C531CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hf5S9lvXyZ5IRcXTsEUe0HYbHbPXQdrPP0ADxgNdqf8=; b=BjDn5m33TDJW+cC2wTgbPM357W
	zNywcYEKxDb3hQJr5YOu02JPWZq8J8evPZjUfQnnv26+W3Zcn0xn2I6bk2A/T3jEg8RpwX2Anx+zF
	AQW3b1b8YyndoCbwGGq/86LxLTAgWGtFndou6CNLeeZmL1Z4tg5d+PeFq02yILqnuCFJg7Y1AnlgB
	rXbrhaQeT3jKFavygBQ6RGOF0rkr40nz1xIlRUDWdpMApI0JkoI8TRP8zTAJIWxM1HppBjT7qVHdr
	4olvfKdSDy6E/X8itgbsJserZTM+aJk4e1a3IPsiv/vfb7b6vM+Ex1YNBEPJN930OFaLcAtyEfGym
	ST2UQkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrFW-0000000E7IH-2C3o;
	Thu, 23 Jul 2026 11:05:58 +0000
Received: from mail.lysator.liu.se ([130.236.254.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrFT-0000000E7Fx-2v07
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 11:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804753;
	bh=5EnBNbL8mJ2vOm/XrE/Iei5zExtp+PyyvXixlb5GfSU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=AflWnyveCUI2eH3BvuWzu2yjJnDBoCWpKMHsOdraVI+SvIw3z+qTy9ijBhC4NVz7m
	 4q19XxdCDSb3sBHyTr3BtBfcvcDPMdtyEY7N5WuD3MbzUX4bc4G4iivHo7w/aGLrjg
	 7SNwYNe7Bc2FObB7dC9lfTlmLvjftvfabbLqiMMvyZ8flJiymqXPX59sK2KU5qDUdk
	 9TKMNL4qZKZOiLjR9dpBqF+F0djrtMjgcseG3txDAvoaOrINfICyfNqBq2tvT99zYw
	 aoc0jZGdDXNHOosoMoIeykB25xzp6oSo1Vi9pEGA3ZDSIZBEhN+xulcOixQK33Gwac
	 C/jo399UWZlAQ==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id B93331BABB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:05:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804753;
	bh=5EnBNbL8mJ2vOm/XrE/Iei5zExtp+PyyvXixlb5GfSU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=AflWnyveCUI2eH3BvuWzu2yjJnDBoCWpKMHsOdraVI+SvIw3z+qTy9ijBhC4NVz7m
	 4q19XxdCDSb3sBHyTr3BtBfcvcDPMdtyEY7N5WuD3MbzUX4bc4G4iivHo7w/aGLrjg
	 7SNwYNe7Bc2FObB7dC9lfTlmLvjftvfabbLqiMMvyZ8flJiymqXPX59sK2KU5qDUdk
	 9TKMNL4qZKZOiLjR9dpBqF+F0djrtMjgcseG3txDAvoaOrINfICyfNqBq2tvT99zYw
	 aoc0jZGdDXNHOosoMoIeykB25xzp6oSo1Vi9pEGA3ZDSIZBEhN+xulcOixQK33Gwac
	 C/jo399UWZlAQ==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id 9DFA31B9EC; Thu, 23 Jul 2026 13:05:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804749;
	bh=5EnBNbL8mJ2vOm/XrE/Iei5zExtp+PyyvXixlb5GfSU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=hknXcs48OmPqWhVaBE5JXEumNfeQqa5pBU4ezW7JN/y7VZonPtZCPH/oj3BNITaIy
	 tQDdXg502Bri7TSTCF32zGN5wkRiQpAAZfL1gW10FYy9UGKT0HADtw7eASly3pSlua
	 8p1dzORq0I7dE5VVlTbsXKe43sFMYMwc8uPlYEHtBjA/nTRws9+g5LwdxhNYpXqOXs
	 vQJUPfkw0bs0lDbIkjKD142GWGUzx33y811zCDIhsPJZ6e5eqZf7zne+TiTg/Hu97N
	 sj7S2+qTLL4WFyFbeEB6jprRh8AuSF70Dx7rgdtsw++5t0DCeXgxmy7TlN+SVqvZgy
	 q91FbnzhxOa3w==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id B904D1B9E7;
	Thu, 23 Jul 2026 13:05:49 +0200 (CEST)
Message-ID: <74d0929f-1f51-4b57-a23d-ebb059dc8328@lysator.liu.se>
Date: Thu, 23 Jul 2026 13:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Rosin <peda@lysator.liu.se>
Subject: Re: [PATCH v12 6/7] i2c: mux: ltc4306: set correct idle_state in
 i2c_mux_core
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
 <20260719-i2c-mux-v12-6-a5010d623a57@gmail.com>
Content-Language: en-US, sv-SE
In-Reply-To: <20260719-i2c-mux-v12-6-a5010d623a57@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_040555_901776_529C78F6 
X-CRM114-Status: GOOD (  13.58  )
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

Hi!

On 2026-07-19 16:59, Marcus Folkesson wrote:
> Inform the core if we intend to disconnect channels during idle.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   drivers/i2c/muxes/i2c-mux-ltc4306.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> index 18228f5b80e8..df7136b7b042 100644
> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -232,6 +232,9 @@ static int ltc4306_probe(struct i2c_client *client)
>   	data = i2c_mux_priv(muxc);
>   	data->chip = chip;
>   
> +	if (idle_disc)
> +		i2c_mux_set_idle_state(muxc, I2C_MUX_IDLE_DISCONNECT);

Perhaps augment with

	else
		i2c_mux_set_idle_state(muxc, I2C_MUX_IDLE_AS_IS);

now that the default is IDLE_UNKNOWN.

Cheers,
Peter

> +
>   	i2c_set_clientdata(client, muxc);
>   
>   	data->regmap = devm_regmap_init_i2c(client, &ltc4306_regmap_config);
> 


