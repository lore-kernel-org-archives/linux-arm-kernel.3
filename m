Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9A6C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+vZ8FUC6EzJTLpIOuSsz/wpLgYkJ6eDVgEjXOFLrVc=; b=KMeqKeDAlL191fXWbRxi30ISIh
	bpUNvxJ9HPdBqDCyZSlybdL9/jJa/QszmX+xd+JBqJ3rZWXPqG6RZ46KReuiKrieiQrza+vc7xO0A
	gYSp0oY8lgnZj205HAm+a+D4VH81Lk1CVCAXEJpcOvZHbuKkVNequJZrpR+ftaPbDk55MwuJSzuCm
	/FqTa+bmhovnzDVqnKE+bwQWDGz8xceBhEVWe9gAJze3cWYjHwpG47vRsYM/Zb09fxNiJkGVcIxEs
	4Fl/0GRKz6E1ScQymBZnMxQxHOhXPQwgT1kYSpTlk/S3GE9rQWRwqdxo8shm/W25pmfLjIkVzMdjW
	VgRqRtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquW6-0000000HWMS-36Z3;
	Mon, 03 Aug 2026 15:23:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquW4-0000000HWL8-2cNB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+vZ8FUC6EzJTLpIOuSsz/wpLgYkJ6eDVgEjXOFLrVc=;
	b=Kzcqt4x9zXIMUNAY2nhWtibOA9JhqXKFP+eQyhnH74MHvYAXJogC7i8K3ZYM2GNLsHQeEN
	tHKQQJHwFzmAwO17G1LiABLc9HrWEfe1HEoGpndNP2v1mqv3GpOT5An/XVk8EzWuWHBbJH
	onBOGt3mA7RC97mCbJiGOo7XQuuY6ko=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-2mDNuuhrOMaAQFKlxyIPlw-1; Mon, 03 Aug 2026 11:23:44 -0400
X-MC-Unique: 2mDNuuhrOMaAQFKlxyIPlw-1
X-Mimecast-MFC-AGG-ID: 2mDNuuhrOMaAQFKlxyIPlw_1785770624
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e6bb29581so127384867b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770624; x=1786375424;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+vZ8FUC6EzJTLpIOuSsz/wpLgYkJ6eDVgEjXOFLrVc=;
        b=df3qe25Qd5Q4nu+wPJ7zddcZf8/qb8ynO1jc1xmw7ZgqXl9lixGWqzKKyoo5NAdMTK
         4SKWkKI9+q2EUoovMtPSszamdLmioIxSwLDPjHU1JdhuR9yslDOMfB0VtaQaxkhWNajx
         BENe+1hb3WpSH/Ci+PRQK0nmLoYhQZVYqCVEOqfyC6TWSJ2Gihyzp4KiwTT2PiK63+5t
         hGjoDMuZoSlPHGqMo7lp9MSQpEvGBgOg72bIj4RWiESsSEfbZPIsZ3zIADit+4HoN75p
         14I4Jtzbic15mvF/G+8TZqfGYEigb9ZuVSfMiUtb62Pfm9QA/EC77Bg9efJTlFNp6sQN
         rG2g==
X-Forwarded-Encrypted: i=1; AHgh+RoiIrqCw96i3dDMu1gAe8rilehWSkqMZSeJ1wDahAWCib1YYuxeGJ1jRJ0iT4gCEFqynmO5yWp9Baew0Z26uQtm@lists.infradead.org
X-Gm-Message-State: AOJu0YyEy8qOIu+oNBJBprk1eHMn/MAissq0KuKZtYX3wnhgrFsH7YdY
	VXHitEI0HAr9xdqQo8pwrrklNnfEXGuM2rc39NBS6Rig2kKeqf7Q8AncgSj/Nic100jVhHhfT4n
	KKEWW5UEnREYI0p8+ZaqOFT82vY7NuPQyOugzYnKDvZ2TECoouTWs+PiNbkMoVL+WzeSipIwMyw
	8d
X-Gm-Gg: AR+sD131xXjhpHXUSPaSdKFgek/Rgt8UNTsxj1asxwy7tDc9KsZRWKp/S5x1bF5XMsE
	b9B3K+QvU1Oj6k7LXi36wofZGxhm4i6zUtJ8ZhIhIuoyrsA0cm969VBPZQ2+JfYV9jxE/SSrSSq
	UDbF8HqDWoD0yE9ojPOaLOIPP+m7jMgsrwyBgx0vAIitLj5cyAJ0kaIw+poJEsVfS6IklyYFmLC
	KElSpSXrUGVAANzaZju+kg5hqRRl1CZQic52CfCos0yIdeodIDab1zw8TzZWdzeHg5bcorZXqYt
	bdSXF3J2d8CMc5ga1EQsA6Y30XM/vsY2OlcLvSBzh2ktLJK1l29/472jgwfyGUT3NgOB8S619ll
	UV/y5Sc9T6dqvpUl7s/SFD385Af7eB5yYflo=
X-Received: by 2002:a05:690c:3709:b0:80c:72a1:fca3 with SMTP id 00721157ae682-81fd4a8e63dmr141736257b3.16.1785770623692;
        Mon, 03 Aug 2026 08:23:43 -0700 (PDT)
X-Received: by 2002:a05:690c:3709:b0:80c:72a1:fca3 with SMTP id 00721157ae682-81fd4a8e63dmr141735747b3.16.1785770623266;
        Mon, 03 Aug 2026 08:23:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d5ec2sm56111587b3.23.2026.08.03.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:23:42 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:23:40 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v5 00/25] MT8189: Add support for system and base clock
 controllers
Message-ID: <anCyfAxujzRS3wf2@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sXyoiKQxgCA3TwyCI8Ft_OFPs-PevRoLOTXZBMHwEwA_1785770624
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_082348_731276_C4DEDECF 
X-CRM114-Status: GOOD (  15.54  )
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

On Sat, Aug 01, 2026 at 01:20:46PM +0200, Louis-Alexis Eyraud wrote:
>  .../bindings/clock/mediatek,mt8186-clock.yaml      |  128 ++-
>  .../bindings/clock/mediatek,mt8186-fhctl.yaml      |    1 +
>  .../bindings/clock/mediatek,mt8186-sys-clock.yaml  |   24 +-
>  .../bindings/clock/mediatek,mt8188-clock.yaml      |   93 --
>  .../bindings/clock/mediatek,mt8188-sys-clock.yaml  |   58 --
>  .../bindings/clock/mediatek,mt8192-clock.yaml      |  191 ----
>  .../bindings/clock/mediatek,mt8192-sys-clock.yaml  |   68 --
>  .../bindings/clock/mediatek,mt8195-clock.yaml      |  238 -----
>  .../bindings/clock/mediatek,mt8195-sys-clock.yaml  |   76 --
>  drivers/clk/mediatek/Kconfig                       |   79 ++
>  drivers/clk/mediatek/Makefile                      |    8 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c       |  203 ++++
>  drivers/clk/mediatek/clk-mt8189-bus.c              |  200 ++++
>  drivers/clk/mediatek/clk-mt8189-dbgao.c            |   98 ++
>  drivers/clk/mediatek/clk-mt8189-dvfsrc.c           |   58 ++
>  drivers/clk/mediatek/clk-mt8189-iic.c              |  122 +++
>  drivers/clk/mediatek/clk-mt8189-scp.c              |   77 ++
>  drivers/clk/mediatek/clk-mt8189-topckgen.c         | 1025 ++++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8189-ufs.c              |  133 +++
>  drivers/clk/mediatek/clk-mt8189-vlpcfg.c           |  116 +++
>  drivers/clk/mediatek/clk-mt8189-vlpckgen.c         |  285 ++++++
>  drivers/clk/mediatek/clk-mt8196-apmixedsys.c       |    2 +-
>  drivers/clk/mediatek/clk-mt8196-vlpckgen.c         |    2 +-
>  drivers/clk/mediatek/clk-pll.c                     |  130 ++-
>  drivers/clk/mediatek/clk-pll.h                     |   13 +-
>  drivers/clk/mediatek/clk-pllfh.c                   |   15 +-
>  drivers/clk/mediatek/clk-pllfh.h                   |    3 +
>  include/dt-bindings/clock/mediatek,mt8189-clk.h    |  433 +++++++++
>  include/dt-bindings/reset/mediatek,mt8189-resets.h |   17 +
>  29 files changed, 3136 insertions(+), 760 deletions(-)

I went through the rest of the series and didn't see anything new in the
last half dozen or so patches beyond some deprecated headers.

Just for completeness: There's still the maintainer issue that I brought up
in v4 that needs to be addressed. I saw the message from Angelo about
responding to that in mid September.

Brian


