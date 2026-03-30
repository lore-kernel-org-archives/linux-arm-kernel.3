Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3B410D14AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ai+5B1JDs4Yx5japT2S+wEeUd585BH1Ippqlg9P+9rE=; b=sVw/6HE38bKbuSkxYZpUOlrPKm
	HJ3xQ7nNLf1TDyImBfkXpKCW7lcVeZ0OjYX7UEDwiFAU98jpGIMcnpoChoMA9sRxsISNYU7XH1y4N
	fEE1RLV+l5XPYDXUy9cN6IE9nCGOFWRRTeuX7vh/vu1/+JmYyRiiuMTxAb27pjI2223ncdU1MBGVd
	2PKv47xmGKFd+LX7igwjxV/pi9D7GSNUlZ32dXTquo6SRs7YAA5eRv4CxNy3Mu0cViYtY/Y89qpdz
	r9SZ90kioe4Y7xFYjMV/XKcWnPHTb+of/zT5QJ+2GY/BvONHY/ag4ZLT2ck3iaksmkL3kcVkwAnZ8
	YNB9VdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CLU-0000000BJix-19mc;
	Mon, 30 Mar 2026 13:07:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CLR-0000000BJiZ-46kt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774876071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ai+5B1JDs4Yx5japT2S+wEeUd585BH1Ippqlg9P+9rE=;
	b=A1QuRAWm5G25WdVL+E7rgcL4n2trpJONtGmI2Qj4gOUwC90BV9ieOzdCEVmUCTHzuPyynP
	nghQkYXyOMQhmeREQ/G8u30ZK/bi+jIJ9o20KgkGkMws3KpKNds8vAXpUvnG4tZeY83icJ
	dcFp1JCIyxJT2QvXtKGOdlcVPyn/rpU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-RlZZXHaLP5ytrr5kZw_BIg-1; Mon, 30 Mar 2026 09:07:49 -0400
X-MC-Unique: RlZZXHaLP5ytrr5kZw_BIg-1
X-Mimecast-MFC-AGG-ID: RlZZXHaLP5ytrr5kZw_BIg_1774876069
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89f670976acso73293656d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 06:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876069; x=1775480869;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ai+5B1JDs4Yx5japT2S+wEeUd585BH1Ippqlg9P+9rE=;
        b=ctEZ+8/47zSmAnCTqsY7BDxXRCzIvlEnhN0e5lA6yE2nE1D5qArEz9ETPw0LG3o9cH
         5qGJrQo22GoGLIBCcJfMkD3flFywu99eK72gHcUdtR8qvZqWVqnUIH0rvgtwEG6+x/bK
         7QyKFJqHZ/pRFtZKV/m2JSYMfpvMLDn0SGUKpj/9ZjS4LJxKaJBAlmQZ3xvAa2ZAFR+W
         K9E1yfCNtnjj3gNPVNBHlVEVAHZGbbGPXZEaPJbIw2nJjHa2yjvi7wP+H6ScAWrFBN9l
         INkqckBFAALdfzFVGx8u28psrRKrM2OPzeeAKCmIeXwQYF5AgLhdeTZV6U4fAvEX7uuz
         qyrw==
X-Forwarded-Encrypted: i=1; AJvYcCXgnYtvyHztv9qkFKp1lFa4TgSx+veSIb5lsiL1knXD0OchCrZ5ifTdCeQ1X0qkHFqYEinMa4mlUjHoRAUahx1Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxq+YiXIX+OpVl4BadJ5bQknScNkDjIa3uaKt+ff4HWWAICnWz
	EsfpaxTKW7JJinfuZwknEohCjjxppJDHhSPeBosaPpqMM7hWthKnXsy42SEnIrgbU1Axj3w/BzQ
	B1GBx8r1HSmFx5uEYuSr+ae6yNZ18vq0ZgNCyqUWOtMQrxvNBy9u0VONENAv04wi3DUHf9SskZf
	Ue
X-Gm-Gg: ATEYQzwgqlNWem3Y50pi1j30VXw8A/ODTwLkqb9CgXwLbj3qbiVKRoOl3MVUuoUjis5
	9KaWWw32fYjM4h7jLwDLO4Y12ordT7RWv0ze0XuiDWHQmPQBDne1M1SWt8/lEhwr9Yoq60kFd0q
	wHs72A3qb0P777rM/wE7G+baiuxX5AnYLpiNC2VCkdW84qom5jxLYlJIC62FbJ+8vKlTmLpNopx
	MYn+cEVlpATBBP0F/xYzpusSnIWYNBJBYFX2Q/i6R+7YA6LBVfQZLWHM5wZvE3f/pmWF3VeZyb9
	sjGLucSfq0rySZ0fk4WmdGrMXqEN4kp1GThdOrKhPlTxS80XDOM8Sfh4wlZwk7AaXKjH5JhQFlU
	suvwD6PgO73mg1k4fwgmkoCTWBlqJaA3miUAmHizpCLL9LHWuxBFhg5K5
X-Received: by 2002:a05:6214:4292:b0:89e:a170:6b13 with SMTP id 6a1803df08f44-89ea1707210mr136977736d6.20.1774876069042;
        Mon, 30 Mar 2026 06:07:49 -0700 (PDT)
X-Received: by 2002:a05:6214:4292:b0:89e:a170:6b13 with SMTP id 6a1803df08f44-89ea1707210mr136976846d6.20.1774876068418;
        Mon, 30 Mar 2026 06:07:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf867c24sm63010316d6.36.2026.03.30.06.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:07:47 -0700 (PDT)
Date: Mon, 30 Mar 2026 09:07:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/TOSHIBA VISCONTI ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] clk: visconti: pll: use kzalloc_flex
Message-ID: <acp1of8UeIrtYAqx@redhat.com>
References: <20260326042317.122536-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260326042317.122536-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dh91BJ-wQhUfb0bNxGNRtmI6-k3J9QPGFQbu6QABZr4_1774876069
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_060754_090172_B78CF593 
X-CRM114-Status: GOOD (  10.53  )
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

On Wed, Mar 25, 2026 at 09:23:17PM -0700, Rosen Penev wrote:
> Simplify allocation by using a flexible array member and kzalloc_flex.
> 
> Add __counted_by for extra runtime analysis. Assign after allocation as
> required by __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Note: Sashiko reported a separate issue related to the struct clk_init_data
not fully initialized to zero, and parent_data and parent_hws fields are
left containing stack garbage.

https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gmail.com

I'll post a fix for this.

Brian


