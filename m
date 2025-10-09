Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74157CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73VHJPHIbh12PnyxfeCzN+eZOdvnFxFQRvkYUUFjG6M=; b=U9q/f8gac8o9mr7McYhzo7sc3r
	pfEOLvms4AOOaDAsop7SpCoHtHaMVMXUgF7YsDAnRhj3phI6p6ihDL895jjXrBb04kT9WreDELRZw
	/05w+zZsSIibLSOTk3s6UdBYm9FQZ6yjfdF3yZysm6NOIEUiP87kqtizFIPWg3Z9nOqGXV7okruOe
	2+tBObLaQLURw26G1Z/ehYLiPGeAqrPB/+mC4k619SU+LokkrEpQBuE25kMl5EM1JQ9MZ201su6Rl
	AJdbEJW3v8bv0Eb9y7wPI5TwJPei6BM6ysg6NmOUVLFmdnBe9NrlGmcg0rUCUSQQ0Aub0zuSPZR+m
	aIvz4+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6voK-00000006xCn-2h7r;
	Thu, 09 Oct 2025 18:56:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6voH-00000006xCR-04EF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 18:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760036175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73VHJPHIbh12PnyxfeCzN+eZOdvnFxFQRvkYUUFjG6M=;
	b=IinhdPH8Tazv+mxUKMAWYZmuw/aFfoO4o6MVU/4HB3XAiOfQnenv46Iy3qdcV48jKnW3tP
	lVYjp2CkqSXS2iG8zJzseuyHFZFG/p96BihQHTNhgL6RORU63Tkhf2c7K+CNilbwUooutq
	n2TuEGeKYZAUFT1UG3iOdvrttfNYm+Q=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-88YPRVaxN7eWe4h0ZEY-6g-1; Thu, 09 Oct 2025 14:56:14 -0400
X-MC-Unique: 88YPRVaxN7eWe4h0ZEY-6g-1
X-Mimecast-MFC-AGG-ID: 88YPRVaxN7eWe4h0ZEY-6g_1760036174
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dfe8dafd18so72317081cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 11:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760036173; x=1760640973;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73VHJPHIbh12PnyxfeCzN+eZOdvnFxFQRvkYUUFjG6M=;
        b=CtN0w2uZEKZT9cHZEJze5h9q1nRqEWwhj9FffweFwV6gongEnlrqAV7mfM69wKcSTw
         LETaWncEMe39IKpVqlq7n3qURKuaPDmy0ziMpjMLtwFGszbwVp+NzqCXP9VS6WadvYzQ
         Rgn+kO5Mrx5Guh0vMauG1fOh7sGcUGmRif3elgyfbxgWjJ4QlI/y/xqfW4FRwlomUHsm
         NdiGcWQmqi57/vlUlhKZC/VBgz4Tqy8rV3W7ocjPbBJzAqheVn71hNXsgraMrFoygd+0
         odrmv3vqBCszDRQNEPafhJhRRTqX9uIhwCIxvlbI8Lz9zxpAspQcUl3hW6HYwfIKgi1y
         UJUA==
X-Forwarded-Encrypted: i=1; AJvYcCV4z6e9gJnHuUR87OuLrv7w4wfB8YEdRkXbd8KOFtpiNTC8vGR81D6sv/XLwtuxYWlsiezZTz4IjZVeyv/G1dhn@lists.infradead.org
X-Gm-Message-State: AOJu0YxwhALxTTg/rphydnDY5XF6vug63Wb9PY3NB1GTYsxGiW0m7vMD
	SLi46xuplMbLwRJWQVjhGMviE2JfzVRHyspmFNAVitlvEaz5zA483If0n53cQf93xhRj9/vWPSB
	D08H453IDc2d9qamCidRK0bylO/1hAwPD5yrzmULkUFYdaI5bRIhxKYhTV0TJUljRStIER+vFaL
	AljuVz/O8B
X-Gm-Gg: ASbGncuY0giy4zsW45yZg5m+k2gEI6r+dgLyzjfC/nesRDVUYsmSYgdn/NJ9A6oNeS7
	efoKNk3tK9AX+8KwUm91GvsBx9LPc4zyyZ/4GK0qLzBnJXKadMcqm0kIPvSsDfEkL+XWWSwwXE9
	hB81ymMfQ1E58uNizDysj9Z5Vg8oW+4RnjkHP+8TIu0iXnmLJMnyUeXkJMZEI07mQnZrXp8A60B
	z58DFUgCTO0G9SHsbzUaSoVcxFUnOGLmIAQbmyI2G1FVpSjrp7kx7GCAKhmwG78UZn8ugUw/4LJ
	nmXIavUPlNUQS1VnSJfPDvV8k99hCLniGHsmbZmxKQk5p7xaRwMdyBoJ50N9n002/cimn3Vz8pU
	oU3+oGTnUwNlUkJc+6ZaaeAWoiil+h4TancDo
X-Received: by 2002:ac8:584c:0:b0:4e5:7bd4:1beb with SMTP id d75a77b69052e-4e6ead65549mr104456771cf.68.1760036173463;
        Thu, 09 Oct 2025 11:56:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2AD5ZZcXckeSU9b450Mt8BqD9SOhoclS7nRF67Cec3FIHzgTkgVAjC1MmE6pVFS6HrvZ8kA==
X-Received: by 2002:ac8:584c:0:b0:4e5:7bd4:1beb with SMTP id d75a77b69052e-4e6ead65549mr104456441cf.68.1760036172855;
        Thu, 09 Oct 2025 11:56:12 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706dd1ceesm3026011cf.41.2025.10.09.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:56:12 -0700 (PDT)
Date: Thu, 9 Oct 2025 14:56:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tests: Add tests for clk lookup by name
Message-ID: <aOgFSi_h95tfD8x2@redhat.com>
References: <20251002092036.2504858-1-wenst@chromium.org>
 <aOb6iNR9T4R9Hp3R@redhat.com>
 <CAGXv+5HPjEnYh+zUi67+Y=nmFfdRFw0xd=rT7L_-GNxouga4Ow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGXv+5HPjEnYh+zUi67+Y=nmFfdRFw0xd=rT7L_-GNxouga4Ow@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bDeIzsMl3V72oBXCfF_YoyXXxE4OAWhUmXXvzkxmVRM_1760036174
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_115617_125932_AC490E4B 
X-CRM114-Status: GOOD (  29.11  )
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

On Thu, Oct 09, 2025 at 11:24:22AM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 9, 2025 at 7:58 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > On Thu, Oct 02, 2025 at 05:20:35PM +0800, Chen-Yu Tsai wrote:
> > > Clk lookup (by name) recently gained some performance improvements at
> > > the expense of more complexity within the lookup code.
> > >
> > > To make sure that this works as intended and doesn't break, add some
> > > basic tests for this part of the CCF.
> > >
> > > A new "clk_hw_lookup()" function is added purely for running kunit
> > > tests.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  drivers/clk/clk.c      | 11 +++++++
> > >  drivers/clk/clk.h      |  4 +++
> > >  drivers/clk/clk_test.c | 66 +++++++++++++++++++++++++++++++++++++++++-
> > >  3 files changed, 80 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 85d2f2481acf..a17d0070d11f 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -778,6 +778,17 @@ struct clk *__clk_lookup(const char *name)
> > >       return !core ? NULL : core->hw->clk;
> > >  }
> > >
> > > +#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
> > > +/* This is only provided for kunit tests to test the core lookup functions. */
> > > +struct clk_hw *clk_hw_lookup(const char *name)
> > > +{
> > > +     struct clk_core *core = clk_core_lookup(name);
> > > +
> > > +     return !core ? NULL : core->hw;
> > > +}
> > > +EXPORT_SYMBOL_GPL(clk_hw_lookup);
> > > +#endif
> >
> > Use EXPORT_SYMBOL_IF_KUNIT instead for consistency with the rest of the
> > kernel. In clk_test.c, you'll also need to add:
> >
> > MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> 
> Didn't know about this one. Thanks!
> 
> > Since clk_hw_lookup() is only used by kunit, why not just put this new
> > function in clk-test.c, and use EXPORT_SYMBOL_IF_KUNIT on
> > clk_core_lookup?
> 
> Then we end up sort of exposing clk_core_lookup as well?
> 
> I believe Stephen wants to keep things contained as much as possible.

I agree about keeping things contained as much as possible as well.
clk_core_lookup() would only be exposed to the kunit tests if you used
EXPORT_SYMBOL_IF_KUNIT. Definitely go with whatever approach you think
Stephen will prefer.

Brian


