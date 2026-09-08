Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1974CC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 20:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0mtaTtQYz4wQ5P5X6eMd5pS4o/Mqyck5LWsd7xeYwc=; b=or4XGCZ+5U8fWH
	JGjHiFyi5jUh6Qtla++3JhGVeK5k34ZFX46h9EW2A9h/RPrpALEu0QlE8Hgvm04sETPpW6R1LUBuO
	y+W7BBuZE8je9AUkrcIds4x03EL8tx02yhud5QwyAgsZ30G7a51qZlkPUAPF7QMB8tacHgby0vZig
	ZgX9Y8q6OIFFsaKC617fP7k1dqXEI8C5O3LN69IZb/CkTl1qVArRAMaddzTEgns1luWrnvn+z9v6n
	c4EOpgzViyuFGXvM5KnM0rAOmSKNA8z26K+lCCY42i+jp611kNvyH3bF85Htkse9S88pZEFV2QJrX
	tSNz4efbLbyShizLUweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42nm-0000000AEI8-0ACb;
	Tue, 08 Sep 2026 20:52:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42ni-0000000AEH3-3rrY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 20:52:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so48126245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 13:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788900737; x=1789505537; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A0mtaTtQYz4wQ5P5X6eMd5pS4o/Mqyck5LWsd7xeYwc=;
        b=pdVer0lB9kSBR7sJfiudwYwEB6qsPvFNAYIa4ucl7bgaV9EuxzzdxXEYTampvHRePd
         0+KIoOVxF7VPgIIQBKx+PpU5jdthy19CMMM0x0VdXWMJqyYRx7FEMhyyoXZhajr6XW85
         wRH4xbmqtrVgOikTJGGqj+wEw7BCrd2VrepMjZj9EaYwJmktH2S/GGRmKHDn2xD48pjU
         PFG8YRusEgmhTvlvT3fzhds7BNs45qOrtF35CRekFlu+h2E/F8qchtOJUheq4V3ce/A3
         HqscuVLqJfyw371Ii4moywJjvzX6GJmRgu5Kt3WbGvmSQ8Dj49OjNHstBkFFli2B4JMW
         wQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788900737; x=1789505537;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0mtaTtQYz4wQ5P5X6eMd5pS4o/Mqyck5LWsd7xeYwc=;
        b=EvGmuUT3SuM0kQIfrLjDFdU/jbCR4+SM0g1RzV+QdiSTzvwP2DBXSO79doWp3ApV4H
         4B6x8v3n40JCMWf+YF7ikfGR6ZYLV1zEkt9DS/B7MRGMtcxLpztj5LZo39aB8MMSl812
         KDdbt316JcF7VJpoo8mymzmoELCsEfB6LcxNhh9C/QXSLIljhyRmh1e6ToqtbT6IyYYf
         7YZJXEmctG3iB7CUkCQnkkEkILlZ3HnzXO3aEvQWTfKd9B92mQ05YZI6W0dcteRxN2i8
         vn3lNDEA0i1Ty7ojya6QbI2VWwVMMyd3amj+zkOXqluTbrEOZwZXzlp3eQL2qnKmN45d
         j9ew==
X-Gm-Message-State: AFuF++kw8FhatQln6QciT0EOzKif847dZPM4O9LyMJJOlnEMfV/52RLL
	sZKS9Yzm5LjqUn9Onalf6ud52p/UQVmR6VvF/oc9pfnvNHVhj62yLMsmmMUNZocK
X-Gm-Gg: AYBFou34UHT3Q27iCJr+3EUAtwXkpPY5XXyXYwmQn7UE23aq4FypPmQhqvxUIn+AxWU
	nCdDwc50S7NVp5vLO2HlCfviHPweoyGqBB5Rj9ROJttmsrhMRNkJCyWU0ZbSxkXbem5BROwOzLn
	Q+GpDbsO3kiGdqmUAvQVNOX+X1ZFsZcoHNQlnPJ6rwcibVLnWlNUy5Z8aOcB56NR34QamcyMI1R
	i0hJdwyHBvOWN8n4qw7PCu0Pbs920814K753iUEpztX1/eWwXowjfjA7uJ9CfFB0kXPn7qicUtq
	+t91azkIOKwq/wLG4XxiOeA7kQDeXwtZJqBGDj7nKUvJ1NKXnkHD4DENuK5N756WOMmenWOFPDQ
	aRLO7WcIfi7eBloEYgFsSLkmlz/ypPYDtE2lpXpa0jypOgCkwLo1J8wuMqijaErw7wGhg5tVST8
	WxDo8H3bV2am9PdOC5cNio2b1Nxd9O9njfnyEoMHWx7zK0pklWSXY2JDTG3OOiwvtAipXk+LJjZ
	HZBtsIlNaz5UQw5cXYU5grM1w==
X-Received: by 2002:a05:600c:3e0a:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cf8267a36mr411374975e9.12.1788900736223;
        Tue, 08 Sep 2026 13:52:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm368295445e9.14.2026.09.08.13.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:52:14 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:52:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 16/21] arm64: percpu: Implement preemptible void RMW
 ops
Message-ID: <20260908215209.01f64b82@pumpkin>
In-Reply-To: <aqAkvK6zylxwq5J2@J2N7QTR9R3>
References: <20260904161758.376504-1-mark.rutland@arm.com>
	<20260904161758.376504-17-mark.rutland@arm.com>
	<20260905100319.0a50c17f@pumpkin>
	<aqAkvK6zylxwq5J2@J2N7QTR9R3>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_135218_979922_CB736862 
X-CRM114-Status: GOOD (  22.83  )
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
Cc: vladimir.murzin@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 8 Sep 2026 16:07:40 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> On Sat, Sep 05, 2026 at 10:03:19AM +0100, David Laight wrote:
> > On Fri,  4 Sep 2026 17:17:53 +0100
> > Mark Rutland <mark.rutland@arm.com> wrote:
> >   
> > > Use the PCPU GPR infrastructure to implement all of the RMW ops which do
> > > not return a value.  
> > ...  
> > >  #define __PERCPU_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\  
> > 
> > Isn't this definition exactly the same as __PERCPU_RET_OP_CASE() except
> > for s/tmp/ret/ and the 'return ret'?  
> 
> Not exactly the same; the __PERCPU_RET_OP_CASE() assembly also performs
> an additional instruction at the end in order to generate the RETURN
> value.

I had missed that - it is only in the LSE atomics alternative.
However it also replaces a nop so wouldn't affect code size or
execution speed.

David

> 
> > Since the compiler will just ignore the unwanted return value
> > there is not point replicating the definition.  
> 
> We could consider sharing the assembly, but it's not quite that simple,
> so I'm going to leave this as-is for now.
> 
> Mark.
> 


