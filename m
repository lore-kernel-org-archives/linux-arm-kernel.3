Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5E5CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YG9WjUJbD5swPb1xxJphH03w07XnwcgfExEp30NwV30=; b=KYZxId7xCgc2r800eqAwW+Q1un
	DDJTSDSGLwInCqBiWgbJw+zNz8bB9XWWZvFNfH5o5QKErcdlJpm+psHPIEiYSPvVwZPmGcIhf61Md
	mYwoge15HqMM72be5om0LXsu7rAbnYu+FuG0/OsB+uW2XanEoM38fVhXS7He+vU0ezcLIllH25Sk/
	gXo7Cxwtce33xRxsUn48X83O0hhAgz9c0OAGcnBo+GGkkRcHKgOxQ35NLtrRfX3ZrhY15FEhzrKLD
	GdixWBq9Y46ynYrCXLAEMJgk5mWT1aGYOuuSYA+BgTFVBg4Z0SrS9l7Z43HdEpnzObMIW1IhEFoxP
	5n51etJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4RU-0000000BN4b-053w;
	Mon, 01 Jun 2026 15:20:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4RS-0000000BN3i-0Myf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780327235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YG9WjUJbD5swPb1xxJphH03w07XnwcgfExEp30NwV30=;
	b=XaEkn9CH68qO8XuLU1lca9XUZp2GCa2iZDS7zCNXmItCPP8Hy4MumNzcIRxpZ44nbw/OOr
	TL9L0aS8Yv2l7xjwIGc0L4GIWLAi2SgDUxTI4YvGnZII+Jch746kpMyxIaNwfLlAZyfXh1
	TD1tFKlhG+sU+koSIQ8wo/Scaq4V180=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-ABQSejBuMgqZc1Eb-8BvGA-1; Mon, 01 Jun 2026 11:20:34 -0400
X-MC-Unique: ABQSejBuMgqZc1Eb-8BvGA-1
X-Mimecast-MFC-AGG-ID: ABQSejBuMgqZc1Eb-8BvGA_1780327234
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175bb9d47fso15468421cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 08:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327234; x=1780932034;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YG9WjUJbD5swPb1xxJphH03w07XnwcgfExEp30NwV30=;
        b=Br42OhNcD6b//0JWg2JOipfYagIkbu5yyGRFEMQ6FeX/yfM2Zaj00jyI1FONJT8neX
         9P5SnXbFVKZCMq2eRsf2yfeWs+KzmmlFgdDSjf775xLfTZ/2Q3yZEsxzK+LZu4z1rOx9
         HnhvgfT6l1+A8Vxexx3DfA+kKZxJe/1CCCYrdhG8lkAdyv8muuso1no9zxPtFoIPt2r5
         dUyzrs5qhT9b/YOltf3LedNxxasML9TXuvMYRQEA19vWs1ICVsQSIXeG7RyuCEKVXLob
         MyaG1ZY3RqtgwwnXmljhgEiNeIEF/XxErXACcAoGOORVDsGEtQYNjEk2Put97gF2Jt8p
         XHFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ILrZQcZeP5ROCFEWeLWiEITpFryNsIiUGLCmnxei4/TAmhoNISg7IzDOzBOyDm2wWlWSTA0IDtYqSC1sxQyb8@lists.infradead.org
X-Gm-Message-State: AOJu0YzMF1LpC++J1DQph+Knv3HoYDgRCiNoR9c5ol9/M2lJKOfIiNtA
	F2FRPI1rAn11ZyJHcPskJXvGqynSc/LThVEgIi3/7XSvoMrmygdFQdOQn1fgVsicyrbsuR0r2gB
	xAR3NWJIEbCzqYjGYov9sHzvzLvREM5TY/XPFn+Nij78dK5qPSCYJM1mb30rWafChbr4FC0nfAs
	ZMq+Sv7wOH
X-Gm-Gg: Acq92OEn5RCwH2i0UCcRDKVOzJOJDpgXnXji2b6zP8MCv6wacHeQwnOEI0wncrjSQTE
	ZsoMhkrVlyf3IcxMX11GEdkix1/h0r14z2/1AtkD1h20QjF5NOdxB6hH2eQEF42NIo9x0aptYoI
	dwqnKqM2usD2DuvIt+pRTlY/IDJqIhPaX/sTbDcs2JEVy1mjkFSrrM6Q8BoakRcxXaZYUsq7Daa
	7TRK87vSZD3KOyNq1jy8aHR0zhWv8hA/eabOLbJcZg6UupSp5CDZiUh3hbnzjAQxMbU3EYS07dx
	eXwdFEssSsM+AJpoEWRLqb45+3TKJHjzgHr40kWpFH1K29K8sf9y2255dUmPA7Bl+9opjfqqg9B
	I3nMKDfqS81XisDsOBWxLr+9vZ/83HUFcE1LgIQxv+nWA5VP3Q2rmFNtkVaJjTAXWXYQ=
X-Received: by 2002:a05:622a:d0e:b0:516:e517:6dd3 with SMTP id d75a77b69052e-5173a851999mr140710041cf.40.1780327232794;
        Mon, 01 Jun 2026 08:20:32 -0700 (PDT)
X-Received: by 2002:a05:622a:d0e:b0:516:e517:6dd3 with SMTP id d75a77b69052e-5173a851999mr140709551cf.40.1780327232413;
        Mon, 01 Jun 2026 08:20:32 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b2df92sm58039471cf.9.2026.06.01.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:20:31 -0700 (PDT)
Date: Mon, 1 Jun 2026 11:20:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: at91: keep securam node alive while mapping it
Message-ID: <ah2jPV0IvbV6yQ6x@redhat.com>
References: <20260529042051.1626978-1-dbgh9129@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260529042051.1626978-1-dbgh9129@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ru3bXdI2mDGroTB4fhwbx7GYZMEip9DirUqk5GA05Ts_1780327234
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_082038_306399_8A3FD5B9 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, May 29, 2026 at 12:20:51AM -0400, Yuho Choi wrote:
> pmc_register_ops() gets an owned reference to the
> "atmel,sama5d2-securam" node with of_find_compatible_node().  The
> success path dropped that reference before passing the node to
> of_iomap(), leaving of_iomap() to consume a node pointer after the caller
> had released its reference.
> 
> Move of_node_put() after of_iomap() so the node remains referenced for
> the mapping operation.  The unavailable-node error path already releases
> the reference.
> 
> Fixes: 4d21be864092 ("clk: at91: pmc: execute suspend/resume only for backup mode")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


