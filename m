Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C44C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJmWcK7VtygAI73hXpZCkgCwblOmQljwdFQvepVqOmU=; b=c369HPG2IZWKlKaExcfyvzEhEm
	rlAZL9madue4IIHJ5fYS0EQq1BiPeXihkAZd8nQmLaK4e+5JoHxTsiK9EIuMSARzKtxR4D+MdTsvj
	lh0pfBrGPIzFOeHZ/x1c3/yc+21NjYR/7F0bIVhOVBwkiuTzxARCOFJ3FP0NCnVnObr7MgVDSNi42
	+2Eq1XiJU49i4eSPxnz6piNWaafU68NuoEM/jqEFmACVJ6UPuG83aMMN/mXjTq5MzweQQJ5l0TnRe
	YFP0+SUJAg9L4irDZf8qOAIOnnglRJ2GVP9bEEbZXR3bEPmkg3BrJzlhz7oRdLR3f+LSPfrD1umU2
	cEEqn6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluHn-00000007pGS-35WP;
	Mon, 20 Jul 2026 20:08:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluHk-00000007pFz-3ug5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 20:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784578099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJmWcK7VtygAI73hXpZCkgCwblOmQljwdFQvepVqOmU=;
	b=MCwmIF6TRwos4cIB4wR68p1HPBfNURBWj/n7qd2FiM7vggNxZcrEZbXpRwHXU7UHc8Pdpp
	PvQw6UVEpazVKIiF+tXzdSIM7jSL/uoAoeUoXtv0aL453cS0Sow0fap5/XisMxP/KOe9jE
	cZ1TTtWTaEttxRwsjFLiz1U7awfo+AA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-hX1VkBo-M8iO_HePcjW3eg-1; Mon, 20 Jul 2026 16:08:17 -0400
X-MC-Unique: hX1VkBo-M8iO_HePcjW3eg-1
X-Mimecast-MFC-AGG-ID: hX1VkBo-M8iO_HePcjW3eg_1784578097
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b6bdcb4fso186286585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 13:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578097; x=1785182897;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tJmWcK7VtygAI73hXpZCkgCwblOmQljwdFQvepVqOmU=;
        b=GNDxZct94vovmO63l0022hDYV8R4QFVEoobjAM6+x1+zljyCfEyujq3qme2g8TsFzK
         vANXgPvzTSgib3uHX+aFgkJBLxVIFzkpdYT1/u0PnixmpNziqJc2X77gzWawp3j/Ax49
         q7eXXjgn7gaN9rAF7UaYX9RdG1fJkh163t+jtVBdZa4i2CuRQPlO1yiRLA8iGh4vZuKX
         fPqMPHpOvVP5jSYiCPhUXSQNSJhGVuDeiefQfTmo4wb4LtSKrRw221HBJWeLcwPdtvIl
         jItncpG/o8/juwB+UBg3RgZ8IKB36Tu5q1TiZGxh/fYQYt8rsf8Oz7g2lD3vwPS2Ra5O
         vXig==
X-Forwarded-Encrypted: i=1; AHgh+RquBddrZsJSFVUh2pC36s0XaNdvIQiK738Ycl7MTotE+ti+FUWN4eiw6LPqCu2/vZt+OxgckTRsTrxP9h0mUTE+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2svaoy1auoQ/5i5wZayd8yZKD2D04Jhva3ZYoxZp83QySTsOk
	AdFpT2sStj6kJrlRD5uEP9BX1tKL44n/Ds4Cr6KZphfKKjQyR5CBQPVrELLkw+dnOa7spJBwdp7
	NAoID4kDCp2uPxtdbSctYxqSk2mCrBVdZQDlDaI4sl/JC2L9jWDlKh2Wx1zyziQ0N0mpv6VEX30
	bt
X-Gm-Gg: AfdE7cnwqhR1cDed87GBWlJnjmW4GZD9d2tvfm0ru0Sz9Y8ffrxneN6xs0rowvjDhLp
	hqzkmPt0DN8q9GJlW3xn5Vcdz1mM2T/qs1wEdgfwHpQ2+PRmq4McVuOGKob/i6E+8+AQ7BqN+pr
	530lEsCJ0qaRcEzIM0s46PWDGJIqYsqU1XRr3a2UOlG5ZccF50wV3VftT13y2j54qDXWEtTYQ7M
	ex9wecD6IN+/Uk6iFVbFYqAkoTKLsL1bPfo9A7hRV2Zuwijj909xPrhQP70dBnzD5nymjTTgTXx
	fakwNNz29Ynj3asUYKpNiyOoZA+elEoSQlNrOBQ3BM2hlo60vmom2tEtH/ok2uwKQfWClA8pFdY
	QmDLSvW5jBhwed3lDnt5nlLiUqkmJEh6RyzY=
X-Received: by 2002:a05:620a:2985:b0:915:94f7:55df with SMTP id af79cd13be357-930b3ed9e37mr1488513885a.20.1784578097369;
        Mon, 20 Jul 2026 13:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:915:94f7:55df with SMTP id af79cd13be357-930b3ed9e37mr1488512285a.20.1784578096959;
        Mon, 20 Jul 2026 13:08:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52e02desm954762485a.10.2026.07.20.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:08:15 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:08:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Marvell PXA1908 SOC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
Message-ID: <al6ALM2eIWots1Zr@redhat.com>
References: <20260719214349.734351-1-rosenp@gmail.com>
 <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KcWqmyBtnM6irIujWD3KmjXd4-YRskKqNWJWkuLwHjI_1784578097
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_130821_049744_68F0F4B5 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Duje,

On Mon, Jul 20, 2026 at 04:46:40PM +0200, Duje Mihanović wrote:
> On Sunday, 19 July 2026 23:43:49 Central European Summer Time Rosen Penev 
> wrote:
> 
> [...]
> 
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 4b2c089f46a1..8383f9f1da51 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -130,7 +130,7 @@ obj-y					+= 
> mediatek/
> >  obj-$(CONFIG_ARCH_MESON)		+= meson/
> >  obj-y					+= microchip/
> >  ifeq ($(CONFIG_COMMON_CLK), y)
> > -obj-$(CONFIG_ARCH_MMP)			+= mmp/
> > +obj-$(CONFIG_COMMON_CLK_MMP)		+= mmp/
> 
> Could it be possible to select mmp unconditionally, like most of the other 
> subtrees are? AFAICT, that would also require creating new Kconfig symbols for 
> the PXA168, PXA910 and PXA1928 clocks, but I suspect it may be the more proper 
> choice in the long term.

Just by sheer numbers, the CONFIG_COMMON_CLK_XXX approach is the most
common use case right now.

    x1:~/src/linux/linux-next ((next-20260720) %)$ grep "CONFIG_COMMON_CLK" drivers/clk/Makefile | grep "+=" | wc -l
    68
    x1:~/src/linux/linux-next ((next-20260720) %)$ grep "obj-y" drivers/clk/Makefile | wc -l
    25

I have no strong opinions about this either way other than to drive
consistency across various drivers as much as possible.

Currently the mmp directory currently only has COMMON_CLK_PXA1908
defined. When the other PXA* drivers are introduced, will there be a
CONFIG_COMMON_CLK_MMA_COMMON that all of the drivers will use?

If so, we could put that MMA_COMMON in the toplevel clk Makefile.

If not, then yes I agree that obj-y will be fine.

Brian


