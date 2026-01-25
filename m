Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A45E63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5wfJAo9SBLVU6wNmnYh+V5LIeGoq+TArwEbDi1cTkk=; b=n7TkLbpNYfLEVsUqdH61oGOSdB
	beNBhLNVdKI/2Ztar/YHJ8q+Tyv49TUYXJXppVxSoYy6zp7b6NKCMzX9OxYGo9Uk5iHBBOh16+Hbv
	6TUz6l8sMiS3CrFADMQCCLMcB3rhBvlAoJHVHGqX5kepXe6hxRTZkA47bjE24yhJs9K5IuncSmze2
	Sp478pG6Kxg1r1VZYvLoJKjMCb4J3jKk9BOKAkW2Luw/tSmTTVQzaTaBZWM3pJKaMt41rE/JhG2pD
	UyIvQVTENH1U5XTYk6XACsuVbq8dEijJka5B9smqbhxE0oJH63nzsAiHAvZ93Xk7Xb9mSBCJnczoJ
	+A/JeI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8hE-0000000BaX6-2J2v;
	Sun, 25 Jan 2026 22:35:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8hC-0000000BaWH-3p0S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:35:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4801bc32725so30386085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 14:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769380500; x=1769985300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5wfJAo9SBLVU6wNmnYh+V5LIeGoq+TArwEbDi1cTkk=;
        b=JXwOwYZgNt5JAht6kTKg6ZM05mf+YuGuFH4Lkn8x92DB2duFShE1u+a2K2U0AtNfEm
         hxmJIjMNH1t36WmEz2/7iWjBwX8VQVvtILQ8p4htibG/0ND9Jj5yVYqjPoee8ct8jRsl
         jIS6uAKil4h6tKb8EemdlyfEABh5i77ZQfWSEwL4u2nK4iPXS4nZcXUDvxKqinKmObYX
         iucccX/ezJaARLCEbWmwF57nhXhA9njAXziFyi4BOe0CUIA4V3TH6p8tMgh8SKgr0VmH
         ayBUpnTwJrk/mbDxJK7+xFLXzxWi2kOxgTKkRWMYYfKasCchxNCzSdHcwCIHyGzn/sch
         ug6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769380500; x=1769985300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5wfJAo9SBLVU6wNmnYh+V5LIeGoq+TArwEbDi1cTkk=;
        b=JYlinxoZ4TMHw2+T5b+tr7lpLojK1KomXoty69Ne7CfkPy/Q8hrGvetGWukol1UCiA
         WhmR5/k3doL4bKOqmucH5bRe1sxJcIe8uLMYb+NdqGdXS3gJ/cbjtyiR9t9KM+mND0q6
         Ac5MyfouThnsonLaEAXo3B7io88hvEJsawCEx6+QBuyXwuIamRWPQLoU8krGhn+ITf4X
         fDuTtgO4KMMnx2m6zN54PDMWdSY5V7cZ1/Ywutne47OyLwlk8uc0DCLfhO+FBPuVgrcg
         Fs9O7m5G/WtBtdjVhCPkEpwTU88eIaFdHslzu7yLJB9TM6DobvFEjumCSl5I9gwl9ifH
         Jy1w==
X-Forwarded-Encrypted: i=1; AJvYcCWZUv2ZGnRT/uyH4fgeavUxvyG7D8bGuK37Y/UVk3l1rLXDbZW6u/TL0leLGVTI+HA2Wz+AoUBaw9juZVfkLqNh@lists.infradead.org
X-Gm-Message-State: AOJu0YyurN8LDa/kQIBQYjes7pWR3itkhNXzwJis+0OeV2XMhEH9Ua2S
	dWF/jd787wZwkaIGuc3Wf3KcXvrPqfE9TMVkHctLRKbOjKGiUvVPL7wq
X-Gm-Gg: AZuq6aIGIxbQf8ve9jv2LRXrECU/h1AGAV3dadjtd2WLZAZUKyOnfZD2T0w2vIiGXaH
	VpQL07d3FRXTHIIa1MdL4Vo2+DclFpU/9wXqVppiHXvTt8ooX2bewxgHufN4iB+6xz/rvhWfjQE
	gKOH8gsqSL/6GJEt6UY/hq+WffoFYGxBe2UGVsFCMqaEwf0Gnj+jwam17zkLQB6AxGJt2ocVmLr
	55vSNigBXVoqylSpeLKFZJW/clo2Tv+JJk48zIZu1ovkauV7N80Ry8yqYCtpA9qDgLFRje0C3vr
	uxEIysbRc4c+uaXSdR7nNCcgBncs8o18BMSJxWH2ykhw+UPS8CvG9O+Iw3CDUkiqzU9JWsThtLD
	8vjzh8E/jh1PDKruA5MgdNN7TdpDIBszpS822sQgA5MNtVRKQLD/FFWuidAGarOfZn8L8BsS5hb
	pLa6yY/gF7SsTV5G/W3J1NkS3UGu2WpEz7Y6RdRNCLtG5+Ja/8I/sA
X-Received: by 2002:a05:600c:4e4a:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-4805cd40fcfmr49219325e9.6.1769380500182;
        Sun, 25 Jan 2026 14:35:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm277706295e9.11.2026.01.25.14.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:34:59 -0800 (PST)
Date: Sun, 25 Jan 2026 22:34:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Use u64_stats_t with
 u64_stats_sync properly
Message-ID: <20260125223455.31fd7a93@pumpkin>
In-Reply-To: <20260122185255.2761568-1-mmyangfl@gmail.com>
References: <20260122185255.2761568-1-mmyangfl@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_143503_005021_997905C4 
X-CRM114-Status: GOOD (  17.80  )
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

On Fri, 23 Jan 2026 02:52:51 +0800
David Yang <mmyangfl@gmail.com> wrote:

> On 64bit arches, struct u64_stats_sync is empty and provides no help
> against load/store tearing. Convert to u64_stats_t to ensure atomic
> operations.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 136 +++++++++++------------
>  drivers/net/ethernet/airoha/airoha_eth.h |  34 +++---
>  2 files changed, 85 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 62bcbbbe2a95..6ed220e5a094 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1472,131 +1472,131 @@ static void airoha_update_hw_stats(struct airoha_gdm_port *port)
>  
>  	/* TX */
>  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> -	port->stats.tx_ok_pkts += ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_ok_pkts, (u64)val << 32);
>  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> -	port->stats.tx_ok_pkts += val;
> +	u64_stats_add(&port->stats.tx_ok_pkts, val);

Wouldn't that be better written as:
	u64 val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
	val = val << 32 + airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
	port->stats.tx_ok_pkts += val;
(Assuming there something has stopped the hardware increment the register
between the two accesses, and there is an associated atomic zero.)

Otherwise you are generating 'tearing' on 64bit systems by adding the high
and low halves separately - regardless of how the stats are read.
I think that works for 32bit as well.

Making the code completely unreadable with 'special' types and 'special'
copy routines really doesn't seem worth while.
The compiler won't generate code that does 'data tearing' for aligned word
accesses, and even if it did nothing would really break.
The most you want is a memcpy_in_words() function that guarantees to use
'word' size tranfsers for aligned buffers - and is probably an alias for
normal memcpy() on all current systems.

OTOH data tearing can be seen for 64 bit adds on 32bit systems.

It is worth nothing that on 32bits the 'packet count' and 'byte count'
increments get seen as a pair, this doesn't happen on 64bit - one happens
before the other.

	David




