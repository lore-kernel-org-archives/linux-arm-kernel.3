Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F803D7237C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2umcnwEupH/jiJ8gD8E4VSgSAY8v1C2B2I4eeqRnGkg=; b=3r45yjNUaKw4l4Zaiqgr2qPnz9
	GBGr5iigAXdFstcltBa7BKYHjIQBwMtH470lFHs0DnZpyhtEFnsOVgbo1kPG19Oy4F1LWXTyYfjON
	0RuYj4eGLnpGh395VY+otMzBlCtxUSY7FinQNfPS87RU05LCUy0fx3mi7kkFg4KMgfBtesfGwjmtb
	9+KPZmYHbBI612h7Oe0O/pW9A/WYiV1i+rfnhcq6bHnM4AGtSXKcPrGybZDQ+kf7YGmccAKqBdkZO
	8/n7RbkjujLOo0d0552y443jtWdoJYLvLsoeNzQAmV3fcGhNhhDpghmNX7S8e3Qtn2lMY6d5ZoHvv
	orB2mZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8kN-0000000Bahb-1Er8;
	Sun, 25 Jan 2026 22:38:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8kK-0000000BagV-0Dnc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:38:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47ee0291921so33075925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 14:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769380694; x=1769985494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2umcnwEupH/jiJ8gD8E4VSgSAY8v1C2B2I4eeqRnGkg=;
        b=SHEZPSWtJLgPBPiMhcMi1U8qwp3NhinU5FSBwU8gmOnBgCUfOqRxUHPLy7G5Dcbkdo
         zq91ukIlsHCFC4p+wPQwDMzgJIMaEkjI44+ZCTpoxGz366a3tydEEksu1qhVZfQedMpJ
         0pg1wAKEdJmej0OFDNFjNFjLUx5TPHX6P/3lzglbAdJRSiyfwCdPfgmHKF39vAI/pWhV
         huvf6UlvX9lVjOg5rSEnQwCw4k0BpXfG34LboknRUiT6WylH+3C0L/hAMVsvFVzuJE2W
         aP1oPjgkMoQGut6xxH9wmfJtluSCmsLO7y6GtLGRdEyXWWHApPlb0M0dVsW3CBL0F8Zf
         qMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769380694; x=1769985494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2umcnwEupH/jiJ8gD8E4VSgSAY8v1C2B2I4eeqRnGkg=;
        b=VighPUpJPXIY29XQgmv7D9I2N3Q+lzVsKZJM74nUmsXLQIEaKdgX0sF5qfa7ZpwmBN
         txCkr7+fvtz8+41VqqfTjRvza1CKJ50yPWvxzCkr6WGFCS6WaYVJtdiKA8Ib8slIwBQO
         L8R5/Y4CdcusxcfMZxLniZ+TB55CDeq3byMxZ7MRwsR2agtk5uLRbhEChLGYqkuJ3pEi
         0yS+MwaBwVJEu2edOIa5TasBihQvyjsEQWxlKDgaZHeZHgYc+Mna8QGXPUm6oBJavZKd
         jkpUrvYENuN3YItLRhwKTwFxnAPWIen/kScbhvhcau2VCOlj3jUemPV20KkTDU99ndsq
         guDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW9ll5bB89OZP4PrLC+yYEG+YeQtrrRceA0pe4TCTfMbtROuE34S6ysPcOWwQg7pYDICn5ZA3dq498xchKf6Mn@lists.infradead.org
X-Gm-Message-State: AOJu0YxOh2bK+nKOHRc03xAyF6IwyKzo8nTFYPKaDXkYVPlMFpyq0tw6
	KYfnr/68ElRCqt4hzl2EQGzxLWK0EneMu7ElW5JRQtMk6HfWOX1qnaIE
X-Gm-Gg: AZuq6aIwl4b4FGKyUQ+sDx2jAHmbLa8bWFSCDu3efeLySr2ndHA9jFlkichzVZJhi5D
	1e4PvrTbWzJrsQMj3u2oMagRDZ48BpqyaYbKZo3lHiK3llHUPF8u1d0u6ZEz6KBqGqptQleLSOA
	MN9LnsOl9nb4aZkyE6U/F5Q4Dn57w0N0B1JbU5gSxlhPArUL3jNiHwLo0Xt5vnY4Jkrl0qXXhh4
	jkJy4SG+F4ugI4xTYw8Ofcpzk9XtEEwqfnBeETJZSn48R9go879xy+g75IDBgcStSxw8km/EvT0
	pSC9JQ1OtIw51FC1z1FgwoRyJqZ8OoCsPs70zFvjNbC7aJjk6qdUEdLp5GdNv++UP7pGDH+CK+U
	H2tmKNuow60m2EERDYkCZssVF28kVqy1Z417kqrhfYn1FjnztaLI4o2MblPnutBvAih7mvSP2kD
	svG33H8s+1BqCFmk3MCT4d0WGfOD/RUVNf5iiaA3UO9AOzuJXqEvmu
X-Received: by 2002:a05:600c:4684:b0:47e:e20e:bba3 with SMTP id 5b1f17b1804b1-4805cd44c41mr49205745e9.7.1769380694028;
        Sun, 25 Jan 2026 14:38:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm24336005f8f.17.2026.01.25.14.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:38:13 -0800 (PST)
Date: Sun, 25 Jan 2026 22:38:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] u64_stats: Allow u64_stats_add() to
 accept s64
Message-ID: <20260125223812.3a2ae148@pumpkin>
In-Reply-To: <20260125220753.3984326-2-mmyangfl@gmail.com>
References: <20260125220753.3984326-1-mmyangfl@gmail.com>
	<20260125220753.3984326-2-mmyangfl@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_143816_160439_A8B1FC4B 
X-CRM114-Status: GOOD (  18.97  )
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

On Mon, 26 Jan 2026 06:07:49 +0800
David Yang <mmyangfl@gmail.com> wrote:

> The current u64_stats_add() accepts only unsigned long, which makes no
> sense as u64_stats_set() accepts u64 already, and causes unnecessary
> narrowing on 32-bit architectures.

Isn't is a chicken/egg?
A value over 2^31 could just be a very large value that needs to be added.
Where the add is being done 'just in time' so avoid overflow.

	David

> 
> Moreover, since there's no u64_stats_sub(), users may be tempted to
> reuse it for decrements, which already happened on nft_counter_reset()
> in net/netfilter/nft_counter.c .
> 
> Change to s64 to allow both positive and negative values.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  include/linux/u64_stats_sync.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/u64_stats_sync.h b/include/linux/u64_stats_sync.h
> index 457879938fc1..e77f2b30bac7 100644
> --- a/include/linux/u64_stats_sync.h
> +++ b/include/linux/u64_stats_sync.h
> @@ -84,7 +84,7 @@ static inline void u64_stats_set(u64_stats_t *p, u64 val)
>  	local64_set(&p->v, val);
>  }
>  
> -static inline void u64_stats_add(u64_stats_t *p, unsigned long val)
> +static inline void u64_stats_add(u64_stats_t *p, s64 val)
>  {
>  	local64_add(val, &p->v);
>  }
> @@ -125,7 +125,7 @@ static inline void u64_stats_set(u64_stats_t *p, u64 val)
>  	p->v = val;
>  }
>  
> -static inline void u64_stats_add(u64_stats_t *p, unsigned long val)
> +static inline void u64_stats_add(u64_stats_t *p, s64 val)
>  {
>  	p->v += val;
>  }


