Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6373CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 22:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHHZZiQsfame7Zg/4A4jt9+9wiuoOherVRDLu4XWaqo=; b=rwUX2AnGEx+lsED+IrgAQWJmS3
	DiTjxDbBkvFkzuq0bm2k3ByQL52TasvaFhofwl6ytOgqppiVx2oEPr9DxTXjrARB+xCVcQIu/OHJF
	8d5IAwHu+vDKE8PmK0m6x/VH3TZJEMePU51MPTp1nttY+7C1plWQihHTLOmpm2tbkCZsbfluExmj9
	VhWqz10wKoOqBjVnNUo0aTz8QwCng9dXDsoPCzs1SP656D6c6P54pLISoU4GrNtfgFtsP988z8QLo
	NLlaG/JYt64NBDgSWHdHLiOZXJH1qR/Qun7GL/8Q33j0tH/F5zAixINQW3JkEAUufMJqMEAVmBgdt
	lX4K2jjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0Sn-00000003241-3yuw;
	Tue, 26 May 2026 22:41:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS0Sm-0000000323f-165W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 22:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779835287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHHZZiQsfame7Zg/4A4jt9+9wiuoOherVRDLu4XWaqo=;
	b=T2AydUyE8FSw35teU9wfT28qSeQqHAcKSq1QJH90IDu9+Dn/Rm2HUawvYmbsxYA6iKlzb7
	4//iw6PEzwFY75YfsUcGzQAgRrHldKc4fdnzkSnSlGSsNZ++ahVBkvO3aN075NJCuyltF7
	9llDHTeJyICv9yPOTa0JqCcMgKtOgzI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-_dF5vP46MfmqlMbXTc5zkg-1; Tue, 26 May 2026 18:41:23 -0400
X-MC-Unique: _dF5vP46MfmqlMbXTc5zkg-1
X-Mimecast-MFC-AGG-ID: _dF5vP46MfmqlMbXTc5zkg_1779835283
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-910b2b92741so2051153785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 15:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779835283; x=1780440083;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FHHZZiQsfame7Zg/4A4jt9+9wiuoOherVRDLu4XWaqo=;
        b=Xzof3SrZN0NvyG7TcdeEaft/56xNzLt5TiYbMVsqMQVif3iaOBdk4Q3WhT+aM72+wT
         PkdnRMga9ZiZrtpzbY9/TW2FTBSAfncik2/yZymdaPt4z2vJa6EhsnOUZ5UeZZyKtYLP
         rRrvkZk2lw1pRQUtMj+EQsL52BkxZZpX3BKqv0hmTs27dHYp7HU6PKlUJ2Oz1HAHqq/J
         kLfsl9r2n+IRh4H/rXaVnC9bly7sLTMnaxzIQAKy6BgeYcacTHmAky4v/yC9QFLS+99N
         3gOtn7E4pUJP7rzBXj5GI2yPgloojEqmyicgG9Qi8gMRkt07cZaBky0iMD3ua+eQVisw
         eqTg==
X-Forwarded-Encrypted: i=1; AFNElJ/gAYBEfyURRySthvKs3WQBHSuITB6i0GFvZb8K/zoGyb1WqE4btPePYwCOcY424YLZzfCdqAsPPflkTIWuCzX2@lists.infradead.org
X-Gm-Message-State: AOJu0YyXsjQfE468pOo9e/H3ZVpVrgumVj3xPv6sMfS0CQezzowW4p9Z
	UzUWN95GthisB2Fmv2nxGsU4uIczDzeJcMASNd94DUmdOC6yEPBftHSZf5Q9lpmZohUysjN/qSH
	xGqQGHTce4DfdCjdoePrufK73egAhAylyoq8c4m5ammLrS7GILyNf2x5seM9I8hdX4hqOaF+I0h
	kI
X-Gm-Gg: Acq92OHFk56fsDtf6DM+VjNSNCgYhlXFI9BfT/p3KWhPkxavsvE34D3eGkYSqndewUC
	VwYKW+3B6+KcesxyM8BXTWMpck3Uc1DjCy52btJJoVkggCgBSSj+jcLrU7sAyRD/9nFO+JQKgVt
	yrAI/J3Lv0Q4+echdRwLemOlJ6izHS8HZO6bKEQSKyiEfA3jgbOqeKiLI6XZB08gkqDLVY1C1MK
	bZV8A+9h+YyUp/QZ9Ga+UZhn8CHE/1/4QzuP0h0x5fB6a7owkW1RBpvi4UTW9vNFo9m0OCIhCkp
	KobYQCgpN7pg7Ixv+9/SBr7H9Ij/8hXtyjngP+dQmOim100p+Op66MDpVIYGAvCLSrqbAwBiBqC
	sPFjtBJXRqR2pxV+YlUZdC1hhe8FtNykfxyhMT4Yzg79P+TZOGEWepBfGhqMydXkOI+g=
X-Received: by 2002:a05:620a:4408:b0:912:671b:d0b1 with SMTP id af79cd13be357-914b5029320mr2353467885a.2.1779835282994;
        Tue, 26 May 2026 15:41:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:912:671b:d0b1 with SMTP id af79cd13be357-914b5029320mr2353465585a.2.1779835282596;
        Tue, 26 May 2026 15:41:22 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87d1cc0sm362316785a.26.2026.05.26.15.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 15:41:22 -0700 (PDT)
Date: Tue, 26 May 2026 18:41:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: mvebu: ap-cpu-clk: fix refcount leak
Message-ID: <ahYhkK3LhHMCu3L7@redhat.com>
References: <20260526184105.18962-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
In-Reply-To: <20260526184105.18962-1-grandmaster@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WemsLvwoPxr3CEmN_uyvBM8BX_Ny1EfwJVVwoTTF5wg_1779835283
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_154128_370102_E0C250C5 
X-CRM114-Status: GOOD (  10.56  )
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

On Tue, May 26, 2026 at 08:40:56PM +0200, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
> 
> Fixes: f756e362d938 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Brian Masney <bmasney@redhat.com>


