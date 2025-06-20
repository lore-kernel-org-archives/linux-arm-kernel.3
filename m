Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C61C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 06:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEssu/NXd3Hla7QRE6d+TVGXP6/YrFjxNAC/07Z4Nvk=; b=2TSS4eaZTHVwtN1PNwtLtS6Gle
	F7sD+bPtnYiqho1V2rL5/y49IztVH/GqkhwML4In4PsAS88d8A+OSYG/leGMbsPShXO6TgUO+mHts
	KyLstklxn5+AUyC260vXQ1W7PfYrBu1euXIYYpP0BR0WeDPp/hBoFadlKQ+abcTzvz/CR+nVbJvoT
	ctYqMMO+7Ad8iMSalzXldnZ9kW4YazZ7sM2FG02tJM2Kpvz4Pj6rLefbx1Opk2tPsP2AUWLwJ4f9C
	i8DFpdcmEjcHsDwpLvMqKa5XYkdHAylDaYFiTa6nc8z0B7r4vEsek0CVYCGIuzxJRNOvsi6l7ofgS
	WhphsV5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVdr-0000000Etl6-2MMX;
	Fri, 20 Jun 2025 06:54:27 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVbd-0000000EtXh-1bFO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 06:52:11 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-531466622beso450890e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 23:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402326; x=1751007126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEssu/NXd3Hla7QRE6d+TVGXP6/YrFjxNAC/07Z4Nvk=;
        b=iLC71aG5kne/82zor1bixSSDyzmz8TkZSY0GiUp533Ie3bhRSH6sa9i8yWCBO8B/Mm
         9s0okqVgHcQz3/EAbcKFA06ApS8p4V4vv0ysdiDVni2+RjPtf7W2paRAtpq94BgwDpEj
         1GZ33gdhhpvP+BAuh6YaKPOh/eDeMRzV4d9P5fwIAFSZXU6iyrCr3ykJvWvR6g2yxt+x
         oNP6/7I403x6B2AQutHqj31t/aMN47DxLSRBjhCjmGsRNJK69SaWohQ8vCyECxbDvPZl
         2e2NBoNv6QcUs1Dy5mvGUdHgz9YdTQu6gxN0Bfj2NsH2IQpjvJE5Fo1CMGTRLX7lXZU0
         Rqlw==
X-Forwarded-Encrypted: i=1; AJvYcCUtzZTtsJhCfeaBO+amMoHM7bC88SVckwkenY3Via3+rq4hTQFtu6o1Ke6NChzVVOybWcznJSqC0tM49fp7nIGS@lists.infradead.org
X-Gm-Message-State: AOJu0YwVHjGMut6WTc5qP6bQrR+49FlG7mJqaurzK74HRDy3ijiliFNQ
	jUIZPXkOaIAVsKfk0QusKwCmk6K3fDH3G1bpVY+tg2CH053RrLQqg9ofNpLuuhO5
X-Gm-Gg: ASbGnctV7ck1ahhQawatW0fD23sPj2AlCXZHKK+wnsSk1pWQMs6+5WVT1esJIYchs63
	cFuzx3xrs6EW1O46vQb7ZBcM8SzHiAjV2SnZcpW/Ek7uJZdxTS/1Q/j2xqAnqt63vIEmf9iyHrh
	6Xs2T6iifHne06obEPKo+hSz0vFMJBDSpo8Om+4xzc39fs7f5fdHBrHYwqpiCqx6uaPl28KruwH
	AslqEoChQPn/qnwlbASbbP6xUNO4sUjOhDvNSJFgg+qohP4ehghHuyS5nbKY9aeVvAZofRf7s94
	rXC7hKx5m88QlfjdUlmJcnnN2UgCHCJ+2FJrKd2oNv/19AXI73s4M4QuDkvuMeevwGIUuBq5HeI
	lPNlDZM40kICJ7stCsp1BKZpA
X-Google-Smtp-Source: AGHT+IEjNHmB0oVZQk6wZKVwCGY4DqiDU2D5LF1Rm3oNjDY9+AOM63kglSnQZKH4R4scc/pzpZxF4A==
X-Received: by 2002:a05:6122:390d:b0:530:6538:cb12 with SMTP id 71dfb90a1353d-531ad6430fdmr746590e0c.11.1750402325869;
        Thu, 19 Jun 2025 23:52:05 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab3a5c9bsm264040e0c.45.2025.06.19.23.52.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 23:52:04 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87f0ac304f0so387493241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 23:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvf39cLVfv3w5tS1xgEtIENGPU4qazv27k+ymjNO+l2aj7ldQKIqJWQQ1DsnQfy1SLZBhhD9caMe8VygBHPgp7@lists.infradead.org
X-Received: by 2002:a05:6102:c4f:b0:4df:8259:eab with SMTP id
 ada2fe7eead31-4e9c2a018f3mr788689137.19.1750402324049; Thu, 19 Jun 2025
 23:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
 <20250618-add-support-for-meta-clemente-bmc-v1-1-e5ca669ee47b@fii-foxconn.com>
 <93c91bda-9c2a-4a23-bc35-a46587077621@kernel.org>
In-Reply-To: <93c91bda-9c2a-4a23-bc35-a46587077621@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jun 2025 08:51:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDbp+d=o8F4o7Bw+0am7hBFcKsFNjithgZtHx2bvpMHQ@mail.gmail.com>
X-Gm-Features: Ac12FXzy1twp29mefSPbzAxxpzkqUQya2cqJCrjgKLlCdSDLERYoEPvlqbB8GoA
Message-ID: <CAMuHMdWDbp+d=o8F4o7Bw+0am7hBFcKsFNjithgZtHx2bvpMHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	Leo Wang <leo.jt.wang@fii-foxconn.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_235209_417111_A2F38716 
X-CRM114-Status: GOOD (  16.64  )
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

On Fri, 20 Jun 2025 at 08:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 18/06/2025 11:40, Leo Wang wrote:
> > Document the new compatibles used on Meta Clemente.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> How v1 with such subject could have been acked?

The "real" v1 looked better ;-)

> Please provide lore links.

https://lore.kernel.org/all/68240d47.170a0220.ba589.0feb@mx.google.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

