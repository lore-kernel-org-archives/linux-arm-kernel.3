Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CB9E67803
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXo0XmPhzaeXOxCnEx9hH+u3QjRF1RyUWpvNBcumJRc=; b=b0ZoKd75B+kP7NnjPvGRHh++Em
	TmOJvBfQ+Nwpa4bk4vxbEqyjvVi3vgiivX4i3nnX2/W0Ks/7pFNLwleZmL3BohBGkEfD5vbgrXj4o
	7nyqMuiewBFlGH1+s666L1jdLjaW9Q9i3MB8atZ1ERYF6WGTP49x+L6hkjpq5cggpq42OOUJF0hAW
	jHtYCdb/lkhZ552cQqDWjK0pk7+f9uldI6E1i7DCHsin39yxR4Rcpg+elrkMj045pPjkd954nJXBz
	h0iWYOo/Chqs4wBRG6v7kMLLptvBlCgwIKaDgkyFtALaMZ3EqFeXMutr927wcajEdPLbTvY0uYKIC
	PriIuyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkDD-0000000E2XB-1JJA;
	Mon, 22 Dec 2025 18:00:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkD8-0000000E2Wd-2ITo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 18:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766426445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dXo0XmPhzaeXOxCnEx9hH+u3QjRF1RyUWpvNBcumJRc=;
	b=d2zqirgDXWeuoAjPhvSahdwo60SNotfrfpdabPQvpFQs6IFBiDOEg1DgpICSDg9zGhZoyV
	3CPOG5QyUlz2dA92E/aWbi+iHPbTpkPFYnlc+7HfQZWe3LlkFYmjUDWyWuY8HxZWr4oKMq
	Ct5zekcA+DL1H4wrTejxFx5jsuMl3/o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-C9DwPvjZNNKZmAKKhzdUvQ-1; Mon, 22 Dec 2025 13:00:41 -0500
X-MC-Unique: C9DwPvjZNNKZmAKKhzdUvQ-1
X-Mimecast-MFC-AGG-ID: C9DwPvjZNNKZmAKKhzdUvQ_1766426441
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8887c0d3074so113713026d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 10:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766426441; x=1767031241;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXo0XmPhzaeXOxCnEx9hH+u3QjRF1RyUWpvNBcumJRc=;
        b=wI3+iU8lvldbvicBY6Q2sX8a9sD198oxdqUOhU3eZ9LRo8x183vwhb0lgqsDAyxxaF
         LnVmPkw8++z7PJBneMIa1stxzZUnlYrip3hROOVF/DqjK1i92n0tzUQ+TV5KdasKM460
         1VzmkWWI/gEFwYHDc6IvJBObgjpbKsglhBCpK2IhOS3cvk9gAJAsJ9umisetnvHNsRDI
         w/pV0YKVmvW5FZLCKxD87cBB16FrDboivL3TaYvFXwtvuOwhW4UC9DLBSmgsCJ0VOXjQ
         8Cx+4WueIyByjBCBbhbgg21xRmEpt2xWeUcvoX0fE32lzon8ErhuVaalxJiHlg47q+lv
         jDtA==
X-Forwarded-Encrypted: i=1; AJvYcCUAEWqeH8bSurcVgmG+PCO3sjUuj1dH+pBBouqqwbU8V+lT+vLIEhDlFXyKpVlP2qt7zmTiQfOJ0JxGkcZqFWSN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsa9H9w2KWHYbmih31FmaF0SaiwFOr7rYWgPHXu5kpQOlhk8Q5
	bfr9SJUZRTNqeSwqPFYLb9gKISIvrs1C2ojrLX6vWSCNuhJxoTrMitQFHgNNwpFuj+3DxJMc9Gs
	zmeNjYuoKap/omnhvBpE2InRBzFwvnOG2/WScxgoVv2aJH/TLvaZTLFvbAt910qc2l7YHImWDyf
	UJ
X-Gm-Gg: AY/fxX5Q0G+nkVuiZGEFS9xqzMEQ4lfYqV24/J/VpjDcGxDaG4wI56NP8R64XG9BP2h
	JkPbwGxO6Qx1zBa3xh2zm9a8M6ABBmhRKSOkE41EdG+dGGQ9VrpGeMSckOJSZXBc8CgS+a0yeOW
	Rb6bY258l1J9IU2H7ULRGAn1dcluMebZpiIl11omzUNPVY7Z92ffFSWdN1vdkTAXofFXYaWusK/
	XaMon3SIdJRQ0O/UchLnqHi+wcjOh2S1IuGDM4SwDgY9dpYdFk+CguM1qV+Tb98TyYXjf/8ATg0
	LBSzmlD8oYBCqGOJR1g6sg9er7uNs4bQO7yz6I/Anly93FKd5btt3/g7sd7M4vTG1T48iO30hvr
	sXdbaaCb8Njqa6+UQSX5rVhLqAsoV495yhvhx7jlPRpz3
X-Received: by 2002:a05:6214:27c6:b0:88a:306b:820b with SMTP id 6a1803df08f44-88d83d670e7mr209995456d6.57.1766426440671;
        Mon, 22 Dec 2025 10:00:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFShBd6/ILCtyh9OhdnIzWfY3dp9JmiO74dGqZBOXDUCJ4lowAybkSiEsS44d+2GsPo84wwMA==
X-Received: by 2002:a05:6214:27c6:b0:88a:306b:820b with SMTP id 6a1803df08f44-88d83d670e7mr209994116d6.57.1766426440046;
        Mon, 22 Dec 2025 10:00:40 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a63e296sm86625536d6.52.2025.12.22.10.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 10:00:39 -0800 (PST)
Date: Mon, 22 Dec 2025 13:00:36 -0500
From: Brian Masney <bmasney@redhat.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Qiqi Wang <qiqi.wang@mediatek.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	netdev@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v4 04/21] clk: mediatek: Add MT8189 apmixedsys clock
 support
Message-ID: <aUmHRCXNy45PrVLG@redhat.com>
References: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
 <20251215034944.2973003-5-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20251215034944.2973003-5-irving-ch.lin@mediatek.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UazX__idVS5luf8_h5iV_-_8sjDMW1l8A4z4No5LZHQ_1766426441
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_100048_272357_E5A486A5 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, Dec 15, 2025 at 11:49:13AM +0800, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add support for the MT8189 apmixedsys clock controller, which provides
> PLLs generated from SoC 26m.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig                 |  13 ++
>  drivers/clk/mediatek/Makefile                |   1 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c | 192 +++++++++++++++++++
                        ^^^^^^^^^^^^^^^^^^^^^^^

This file, along with others in this series, is not listed in
MAINTAINERS. This is the current entry:

MEDIATEK MT6735 CLOCK & RESET DRIVERS
M:      Yassine Oudjana <y.oudjana@protonmail.com>
L:      linux-clk@vger.kernel.org
L:      linux-mediatek@lists.infradead.org (moderated for non-subscribers)
S:      Maintained
F:      drivers/clk/mediatek/clk-mt6735-apmixedsys.c
F:      drivers/clk/mediatek/clk-mt6735-imgsys.c
F:      drivers/clk/mediatek/clk-mt6735-infracfg.c
F:      drivers/clk/mediatek/clk-mt6735-mfgcfg.c
F:      drivers/clk/mediatek/clk-mt6735-pericfg.c
F:      drivers/clk/mediatek/clk-mt6735-topckgen.c
F:      drivers/clk/mediatek/clk-mt6735-vdecsys.c
F:      drivers/clk/mediatek/clk-mt6735-vencsys.c
F:      include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
F:      include/dt-bindings/clock/mediatek,mt6735-imgsys.h
F:      include/dt-bindings/clock/mediatek,mt6735-infracfg.h
F:      include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
F:      include/dt-bindings/clock/mediatek,mt6735-pericfg.h
F:      include/dt-bindings/clock/mediatek,mt6735-topckgen.h
F:      include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
F:      include/dt-bindings/clock/mediatek,mt6735-vencsys.h
F:      include/dt-bindings/reset/mediatek,mt6735-infracfg.h
F:      include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
F:      include/dt-bindings/reset/mediatek,mt6735-pericfg.h
F:      include/dt-bindings/reset/mediatek,mt6735-vdecsys.h

Should the entries to MAINTAINERS be simplified to the following?

F:      drivers/clk/mediatek/
F:      include/dt-bindings/clock/mediatek,*

Brian


