Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480FEC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exgSZUy4mQ+gBayEGCoSCzUgfoiRVrcGM1wITQ8aelo=; b=0lZKyLD0Wa0Bgf1n4/lNQdq6Oa
	8VV09tTdYTxL+osmOwojAvqYzFD0rNTkMRuQtpmzIkvmg910bZ9SaDBjKYB59zJc+bR0srmcSSuXw
	u6yN3lMh29otLnbK9ZHSglglpG1BIkFKG6GlNTLm8Jq1+y5K02t97QqD10aoL7ZPzrndNXC0rfG/5
	dFT77doS658WL6T8k66MlYqltSWHRRVH6JXQZfNKqVXRhDHgr11nE1F/iFOAFi69kE0uob6ML8idQ
	Octr5hPIb/VuYh7sVd3pyq9GGBxkAzpkkxZLtq8QhtQtJu+LwZXhsKbckDIB+l5nQ+1CUXzUlvlpP
	Lcg3x6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloMc-00000006sKI-0nk5;
	Mon, 20 Jul 2026 13:48:58 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloMZ-00000006sJt-24BR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:48:56 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-848882fdb18so7329030b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784555334; x=1785160134; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=exgSZUy4mQ+gBayEGCoSCzUgfoiRVrcGM1wITQ8aelo=;
        b=kITQ0j0ckkfQhYz6xl9dRDQavV9DIfx7Z9y9bkY0KEqz6uO6IrTZb173BapRhF67/P
         0GJDsfxYvoQQXJ5ATtjKp+jhPuAevbP5heUdpySPVpiwlsk2ExnmX7MWEch8idZ3cM0C
         81xFel912EDX7GHmisfjj0DUwwW56vNSZOjkHFfeV1TydK52tS+5Tsrde9jNllBHForu
         wiNBqdBf1OXL+wTCz/HxKCQBMGHjoiCftzsC88ZFZb6I53SsPOPFGAb4anjS+7ErZ0kH
         h6oMpvFuKxceyFdl782Zn2ZQzZUQYdqJoxYKqbfUXQ3cr+94Lcs8q2ZvCpM4m5iv29HH
         gugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784555334; x=1785160134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=exgSZUy4mQ+gBayEGCoSCzUgfoiRVrcGM1wITQ8aelo=;
        b=FJGREYeJ/QvdkD18hh4Xql187THIJczc1+36H0PaxLw/wWJPXRqY3joFZL32ThgqJT
         yEspuQ3DrwXdqgzaofZosxuMhP5j20ZX3eFD2BAGVy2svJseXpzDavARllgHUuAdnMNZ
         9z6+SdTsmXh+6bzczGhe3KSyx3eH7U7T68/1Xrmbo4e3hTsWerIDzeA6MnS03MorwJI8
         UbVhzI9TKtUYAEfQQO5yOJJGAL9IwAOHTmfaG3eftXE52l0oTcVNp77i6+7+uKRghh9B
         Te2XxsyUd2e4J+x39MJ6225aj1TahFtKjtqDbAfyYJ7IBcUfwYGA7pKcU0A6HaWWanjy
         Itxw==
X-Forwarded-Encrypted: i=1; AHgh+RrNmBg0kEy8DYpmKK2QCJ/FFqkUywKBCLXcaA7h+LVYfv9gVtkmNs5XgPcgnNWEPiTvEpxTQxYNQP0cIB8oMXPU@lists.infradead.org
X-Gm-Message-State: AOJu0YwozFsKrByPlBZZoD1jmghMqXmtAGLxrMRA6odRApCOYe8X/MtE
	726XK/NhUqqiI9tNzyY34TbxjZKHP9oO9z+aLYuUT6iZJfq0QkgYf9MDSFdB5A0Raq4=
X-Gm-Gg: AfdE7clKKEOHccm+uJdlJ/70YFyn5/pJlfxZQbfaWnn77TQGj8HGyJjZHGF1J63C3Q0
	rhIdhbaacn9Kejrp6obgu3FSQ3XDeh5CvrwZ+IaoUpjffDnC6gGhrUVPQPQ6YFn39VugpypYEs4
	PDeOA8NP/C5Apgy0caQZrAWi1shLseV8vbUlUjXjFhqS9Trj9at5agob78GS7dWuufgZZShHfZp
	hbk/GYIUxlAfDOndXSf8ivHjvHdI9RABg21ZG+chAMk1IxrbI+E50rzXSeVpbZB+GmnrIfOBpro
	JgVsmLQzzmqb4/eBR4z+w7Dh+zkZ92BYmAdBdJJMsaItWeITnb9FZhxNU7FrstFlHqNsmTWsXCE
	VhcqlyNwKcZY//HDMogh61pl8dzzoK+xj+OAR7neqpcvRmXgyaEJ2YjI=
X-Received: by 2002:a05:6a00:998:b0:845:eb73:411c with SMTP id d2e1a72fcca58-84c2946f027mr14586475b3a.45.1784555334640;
        Mon, 20 Jul 2026 06:48:54 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm5844378b3a.15.2026.07.20.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:48:53 -0700 (PDT)
Date: Mon, 20 Jul 2026 06:48:53 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 14/14] net: enetc: use kzalloc_flex()
 for enetc_psfp_gate allocation
Message-ID: <al4nRS6hB8siUx3f@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-15-wei.fang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-15-wei.fang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_064855_556985_871654E6 
X-CRM114-Status: GOOD (  17.74  )
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

On Mon, Jul 20, 2026 at 09:43:16AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> Replace the open-coded struct_size() + kzalloc() pattern with the
> kzalloc_flex() helper when allocating struct enetc_psfp_gate. This
> removes the intermediate entries_size local variable and makes the
> allocation site more concise.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc_qos.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_qos.c b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> index 7b17bca24f26..2aa0fcaafcd2 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> @@ -1135,7 +1135,6 @@ static int enetc_psfp_parse_clsflower(struct enetc_ndev_priv *priv,
>  	struct flow_action_entry *entry;
>  	struct action_gate_entry *e;
>  	u8 sfi_overwrite = 0;
> -	int entries_size;
>  	int i, err;
>  
>  	if (f->common.chain_index >= priv->psfp_cap.max_streamid) {
> @@ -1242,8 +1241,7 @@ static int enetc_psfp_parse_clsflower(struct enetc_ndev_priv *priv,
>  		goto free_filter;
>  	}
>  
> -	entries_size = struct_size(sgi, entries, entryg->gate.num_entries);
> -	sgi = kzalloc(entries_size, GFP_KERNEL);
> +	sgi = kzalloc_flex(*sgi, entries, entryg->gate.num_entries);
>  	if (!sgi) {
>  		err = -ENOMEM;
>  		goto free_filter;

Reviewed-by: Joe Damato <joe@dama.to>

