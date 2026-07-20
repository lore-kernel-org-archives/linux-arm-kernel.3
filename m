Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EFDC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wv9fvaxLH49NpPefXP+gfDcvYRMVVGve36jTQRR2YNo=; b=tZiykctzDc9R8BagUrMLqnPiWl
	zFWo9uUgMzY5wVIawIQL6sVg3GTpmUKStXx1uJ3T+gjIVmsgDVqnMVnj/J9bAsRkE9tLEKftEGWdW
	7gfrxgGbYCIjYDs7hMGLzwuIml9+k8Puj/tykVzmifDIm39LZGqSMHaKYzzlKO0GC0NYl8X+wfhei
	k6Asvld1SQc+X3C2gGL/p6DIjFBZMBqxMs+X/TN93zKB8oxu0fnyRWWP8aiVNfxqF4eM07Ft2oUwr
	+U6iR75mXHkOiDXTwbppWWka7e0UitmP49xMGMCtrFQvAoGhnxkQoWoEHrQJH71URPZmnd4cfRwPF
	k0ejTljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluBd-00000007otK-0foP;
	Mon, 20 Jul 2026 20:02:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluBZ-00000007ose-0VNV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 20:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784577716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wv9fvaxLH49NpPefXP+gfDcvYRMVVGve36jTQRR2YNo=;
	b=YJrUscfSAmSi/dwbiZ5Jpdtds8psCT0rKZVFGwktTg3tIqTcMg1EFE7Er2V2a/3TZHc+yK
	sVrpaCNqE8ov+ojcc/dXje+CMJY6birrQCDSnr+6iC4yTalN93bANxIiD/vTqJ0eSJ7VW8
	yh/4rsqzS/SDC28BXz+AQZuvLd9gwbw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-9A8OfPC2NealjpjOL37bqA-1; Mon, 20 Jul 2026 16:01:54 -0400
X-MC-Unique: 9A8OfPC2NealjpjOL37bqA-1
X-Mimecast-MFC-AGG-ID: 9A8OfPC2NealjpjOL37bqA_1784577714
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so209581861cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 13:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784577714; x=1785182514;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv9fvaxLH49NpPefXP+gfDcvYRMVVGve36jTQRR2YNo=;
        b=sJ2it9NoMArccG1Vhc4M8DJF+w87Vh1P8lOfM+cYrBYZCivgk7bgl/XYChVKv6iumi
         fWNOF2Tco3lWqbJzU38dxDp+y3vFIN4R22Sfeg8/ffkKoks5h6rG6GRmpYxkyy8CW2Ns
         SrurduDMa+U++lX7VYYcqUGHKYt0gzRjEs+bfo9IEP0UFkWbkwwvkR5KET7HwtKlxQSP
         5dfGmz63Onwx9LvR7UHW5lB8gkjK1WgT1djCuH+gM6gPjBaGWLH9Hm1ZaBXBu9T8CeZC
         RgsGKyBZRSnUeL5UglgWWWNDmf7TzIGMsjp/L4b2jJq3L1JuRh4OF3RpKUszbA6QOSV9
         E68g==
X-Forwarded-Encrypted: i=1; AHgh+RoDXisbhhAZ73bLmKw9Yc8Mw2VFeoc5+N9q+bljZf/P2K0mIvQqiH11o/44+TxLhO7jMJnIkdFY08SVKhpiXCr6@lists.infradead.org
X-Gm-Message-State: AOJu0YxWXYYd3AiXfhAn7pJlqdooT/xmX6mfOUBwnLWUvtdRuk4Hssje
	papPF8u/zCnhnmm4LmBewvXRqYoI44LbPWlkGxDjusvcWB1KDV0i72uY+wu8FT2jfkqYrItNcx5
	IuCOLdY6m9aFME9u864/AyDXOp8Q2njL014xos80bwKMd/u0wf8EqIebcFNsOOfhsu7ZotSqYr9
	Gw
X-Gm-Gg: AfdE7cnFyLcxWjAl7HmmcIhiomdTA0W+RCDSaQJwWdHGDahhAMSK12xI9HMmLbNKhH/
	BH3YRyc8E+kITYE7CgWe9AIEnEzmJP9yKAWM20kA5By0DXcTkcrn9r4kZdVWKtoyYyMzRDwu/14
	Un7AMBvG5qnJgw9RC1MB6UYWM36zR22zO+Ln67cJCcTNK2J6tpOV593HqvdA85edRlOVUxuNmev
	5UwGVVReraHn9xbnN9eGG28awCBMxJEl8JuXUw1SCiwtdYntgkMKnYoUo7sYvqjtEySz7oXDj4c
	ve+zJJsQor1p2qTvr7ccSHDlppEE4BjkuoUyNNbzRdhmh92pQgil6uQ4P3ZgGAifud9hV7JqrAV
	wrbfuBLfeowWGiNGrbGIuIGLD87tVbJ5k/AY=
X-Received: by 2002:ac8:5f93:0:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-5213cad91d7mr153344951cf.43.1784577713770;
        Mon, 20 Jul 2026 13:01:53 -0700 (PDT)
X-Received: by 2002:ac8:5f93:0:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-5213cad91d7mr153344631cf.43.1784577713349;
        Mon, 20 Jul 2026 13:01:53 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214d095ed4sm79193511cf.10.2026.07.20.13.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:01:52 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:01:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2 2/2] clk: stm32: allow STM32MP COMPILE_TEST builds
Message-ID: <al5-rbTqpaZ8EeHf@redhat.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
 <20260719215040.767232-3-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260719215040.767232-3-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZrPzBKAsl18srwJINy95PfJ9VBS6P0iThscWaHCfzYE_1784577714
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_130157_233814_CB9BED53 
X-CRM114-Status: UNSURE (   8.65  )
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

On Sun, Jul 19, 2026 at 02:50:40PM -0700, Rosen Penev wrote:
> COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
> Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
> STM32MP clock symbol for that directory gate instead.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/stm32/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


