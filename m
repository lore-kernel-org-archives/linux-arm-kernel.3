Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CB1105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4luknZWpfA2fRN5iCgs0CNtqFETEofYRi/mcBuPd8kw=; b=wamkTvhGQ7MSb0PYX1B29+Me/E
	jMtY8Efof8yVhCSbEs8UfQmVDcD0F+EjDSzsfgUb9xf21y4THjvl3ix07SIwapSXwb0p8mYV12zRq
	x9+EmbxrJeqLqFcELBwP9nBtxiNM1BZ/XSG3wIABBTkmPeYDdd/bhaD3IAAf+4ykya0n33VKP3hW4
	mjB5BEO36BgTiHw7qny+jHAzFz8bj8wuzXgnXXPCd0duIbezUsOCphRImNcHoVzDm+lKQQlpFLpA3
	hchSCKL+1BfjdzX6Xj+ce9XzBmmIUaL+g8zi0ykUj2H7gO9OdI9IFVR5FuzBrISLtjYHzZxS2wwkz
	WH9hCshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13lV-00000000QBG-2Qiw;
	Fri, 13 Mar 2026 14:45:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13lR-00000000QAr-37xU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:45:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 978991CC4;
	Fri, 13 Mar 2026 07:45:14 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F0063F7BD;
	Fri, 13 Mar 2026 07:45:20 -0700 (PDT)
Date: Fri, 13 Mar 2026 14:45:18 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
	acme@kernel.org, leo.yan@linaro.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@redhat.com,
	namhyung@kernel.org
Subject: Re: [PATCH 2/2] perf: tools: cs-etm: Enhance raw Coresight trace
 debug display
Message-ID: <20260313144518.GN4153946@e132581.arm.com>
References: <20260313132129.2743468-1-mike.leach@arm.com>
 <20260313132129.2743468-3-mike.leach@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313132129.2743468-3-mike.leach@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_074521_823962_6FA0D3BE 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 13, 2026 at 01:21:29PM +0000, Coresight ML wrote:

[...]

> ETE trace output changes from:
> 
> Idx:0; ID:14; I_ASYNC : Alignment Synchronisation.
> Idx:12; ID:14; I_TRACE_INFO : Trace Info.; INFO=0x0 { CC.0, TSTATE.0 };
>                Decoder Sync point TINFO
> Idx:15; ID:14; I_ADDR_L_64IS0 : Address, Long, 64 bit, IS0.;
>                Addr=0xFFFF80007CF7F56C;
> becoming:
> 
> Idx:0; ID:14;[0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x80];
>               I_ASYNC : Alignment Synchronisation.
> Idx:12; ID:14; [0x01 0x01 0x00 ]; I_TRACE_INFO : Trace Info.; INFO=0x0
>                { CC.0, TSTATE.0 }; Decoder Sync point TINFO
> Idx:15; ID:14; [0x9d 0x5b 0x7a 0xf7 0x7c 0x00 0x80 0xff 0xff ];
>                I_ADDR_L_64IS0 : Address, Long, 64 bit, IS0.;
> 	       Addr=0xFFFF80007CF7F56C;
> 
> Signed-off-by: Mike Leach <mike.leach@arm.com>

LGTM and I tested it:

Tested-by: Leo Yan <leo.yan@arm.com>

