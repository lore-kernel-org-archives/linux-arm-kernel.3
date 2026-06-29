Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FCCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 20:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRLe+V4vhd+rp9mv7dWMWv7QlRgt7F0xMaqSp5zX+2Y=; b=wnmPI9oo1XH03tR7KzS1ojFeE0
	hVNX9ueH0MXNRKFihm3vCqbR4e4l0HHXnsDykHtTbFN+fMaYfjujCm/krsYa4IybPTb10RfRvnm43
	Q7ca6YW2zSp+S66SL2mATI3NFT41/qFPrgftmgatQRuaW0tCyZIH73yKHkmY/NgQmBe6pIP+UyO1V
	wXCAR9ewwHFJwApJjRnLQem6r5DVPu1Oyh8a7zheZnFssdmZ3Zqse3zr4J/uYHbolB/jmGo4d2xH4
	9gpCdx0UTyCZRbt3cG2mAG+qKaH688KuUtl6HPm+2+/qU8HDUxlpDnxwYD7p1WY5FEnKi1lpHlO13
	dLPxuImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weILm-0000000FQPA-25Pp;
	Mon, 29 Jun 2026 20:13:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weILi-0000000FQOl-3J7M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 20:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782763977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRLe+V4vhd+rp9mv7dWMWv7QlRgt7F0xMaqSp5zX+2Y=;
	b=EfCrCmE7IIXNIWxqSIxPlwQrnYuZKwwg2oK2YgLWTpnLSvfuQx+INiFeepvOr6y9XMlHiK
	rYUYrz+42UxIPFiN9GCCnHaBsYqtDvlzpLy1y9xlnEny09vBh0XgQ2e07fdgCNf5AkdGGV
	L61W36JkOKpmE1UCFnTbCjT9CtBYpMA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-IH6uxz0_Oq2CmVJCQnjZYA-1; Mon, 29 Jun 2026 16:12:55 -0400
X-MC-Unique: IH6uxz0_Oq2CmVJCQnjZYA-1
X-Mimecast-MFC-AGG-ID: IH6uxz0_Oq2CmVJCQnjZYA_1782763975
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9d585d046so2713132a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 13:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782763975; x=1783368775;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRLe+V4vhd+rp9mv7dWMWv7QlRgt7F0xMaqSp5zX+2Y=;
        b=ZPAh4LryG9rvyE1pCKFpozMi/QH1dVTaIuJlZcQYoHm/Sjd2RuY3OSn559TT0aSM6X
         O0oL5fTWk8uVaYXnhwvZtCUFK13RipFHS8O49B+4OsVlNLPPc5tBzTMKYmPkN97EZm/s
         IK8/qUZ/u7XtGRUHf4F+Kw0+uWqpBuRglrlQRZHaf/OFX52MwxSKszI42vgOABRJ16M5
         Yvnq1VSGTLkgLhKQp7EU7XcmpulUzCaE1WNp0wdJaoJcpAOnJm/dw1KtPc2enD7JRQfQ
         GcuHLfkfAAHksGE7TkfCYwUQkunwUjb+d48ZWNQygipSZQ1ygRMIvywPGIaeB/XAuVjM
         UWUg==
X-Forwarded-Encrypted: i=1; AFNElJ/iJFIRs9HG577NCvYglA1AVbn0em1f8y5ohe3nnT6rK10E9tN4EidV7NrOp40YSF9Hi5icgsASYa4G1eI0/lTo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv9Jph9fyaitv5q66BTJV6pK5/2BV1t6su6AznnniW1iOFEaD+
	BF4R9c6cgMaLN5UT8MoN/E/Frcsn8X+r5HoPd3OLNTT1I9n0nwqG60QGwn552XH/ZfOfri13VtI
	1tUg1+dKdmiciV5Yx2CHvCQUYAIBdNOMfJNkfNTe7lHXALnVyTV1Up6tIPJWR/HTXsfPlhcYslJ
	nM
X-Gm-Gg: AfdE7cnv/GCXvaGAQSANTUxDYhxOpTdP43VrEDzcACBweH5iqu45I9HWVQxEIVUlOuc
	KGu2lAXuL/CyiThbYaFmr+tOfl64G2cqDt7uuoGFQsbsCOAptUtpey944DBcz/25t4CKL/XyZmH
	u5S8jqq3UfnaaGnyKGuM037hiqqo4oYIa0C1/hBeUzuCfoINiCuM4M3vSfSAA0N4lv0foPgcEj9
	pUFgfcJyKRyJQ+SSY4Inb/7AULLTqgz950cdfOfv2L2CZ4QmnxHks7nE4f+QD5YzyNXpxQZmboo
	TGH2J9kx65P1OMzsnWsN97WGB/5msxbLaSDCSveowfWLfSxpjP192AVbFZEKREs9SobDM4LlhF6
	uIQ5NXiamkw==
X-Received: by 2002:a05:6830:1b6d:b0:7e9:e9bc:ae84 with SMTP id 46e09a7af769-7e9ecb902e8mr408280a34.12.1782763975165;
        Mon, 29 Jun 2026 13:12:55 -0700 (PDT)
X-Received: by 2002:a05:6830:1b6d:b0:7e9:e9bc:ae84 with SMTP id 46e09a7af769-7e9ecb902e8mr408259a34.12.1782763974655;
        Mon, 29 Jun 2026 13:12:54 -0700 (PDT)
Received: from redhat.com ([2600:382:8127:f62c:d44b:25b0:6b89:f501])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec307edesm585857a34.21.2026.06.29.13.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:12:53 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:12:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v1 1/3] clk: clocking-wizard: fix clock difference
 detection
Message-ID: <akLRwsEQEd3JGcvz@redhat.com>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
 <20260506200555.2558434-2-colin.foster@in-advantage.com>
MIME-Version: 1.0
In-Reply-To: <20260506200555.2558434-2-colin.foster@in-advantage.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rqMyZxvsxgZEEk4MZVoe9TVvTzE-yXRuu4YRJ-Bxs5c_1782763975
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_131258_925991_51B79700 
X-CRM114-Status: GOOD (  19.42  )
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

Hi Colin,

On Wed, May 06, 2026 at 03:05:53PM -0500, Colin Foster wrote:
> The diff calculation didn't take into account rollover. As such, a
> target clock frequency below the requested rate would not be considered.
> 
> Before this change, bogus diffs would be used to determine the closest
> possible clock:
> 
> 8<--------
> clk-wizard-test: requesting 133312500 Hz on output 0 (clock NOT enabled)
> *** Clock wizard - Matching for rate 133312500 parent rate 99999000
> m = 33, d = 1, o = 25, freq = 131998680, diff = 18446744073708237796
> m = 34, d = 1, o = 26, freq = 130767923, diff = 18446744073707007039
> m = 35, d = 1, o = 26, freq = 134614038, diff = 1301538
> m = 36, d = 1, o = 27, freq = 133332000, diff = 19500
> 8<--------
> 
> After this change:
> 
> 8<--------
> clk-wizard-test: requesting 133312500 Hz on output 0 (clock NOT enabled)
> *** Clock wizard - Matching for rate 133312500 parent rate 99999000
> m = 33, d = 1, o = 25, freq = 131998680, diff = 1313820
> m = 35, d = 1, o = 26, freq = 134614038, diff = 1301538
> m = 36, d = 1, o = 27, freq = 133332000, diff = 19500
> 8<--------
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index 032a688840d8..88b47b8cc387 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -408,7 +408,7 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
>  			if (o < omin || o > omax)
>  				continue;
>  			freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
> -			diff = freq - rate;
> +			diff = abs(freq - rate);
>  
>  			if (diff < best_diff) {
>  				printk("m = %d, d = %d, o = %d, freq = %llu, diff = %llu", m, d, o, freq, diff);

Stephen didn't pick this up last development cycle and I'm assembling a
pull for him. This doesn't apply to upstream.  Please post a new
version that applies cleanly.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/xilinx/clk-xlnx-clock-wizard.c#n341

Brian


