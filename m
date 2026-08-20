Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA38BC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhC4gcMj6qZbqU/PjOfQzYKyx+7NDJFZ4HXjtdF8h8k=; b=KCB5j4igr/oczPk5io+qpaOFQm
	2Iu0hMUwGz1uFVv06IsEgIUjjcGL+ue2XIsHgAj+ssBN8EFxyqYOSSvQLiXtyu5ES/YJYIJtWaGOH
	MqLGlashpScpEtXuI6yDUK8omgXmtnpskIZ75lROZ7/OZ1RkQVl7zlSW+nz92f1qW3k0sP2e+cDD/
	r0p1keoIxU1xa8VbLsQ51OwvheD3icXrjkSAQqjs/WGz+vdaXGVufUtfm62IcljAM4db7IcITZ6Kp
	EhbK0tnwBuPz/3pD707flIkOaUo1cMH1LtmdKEM53Jzvb5TkXABpfVB92V5+e5nouGaqIOdScykOY
	ZrFEvywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6rh-0000000BzSi-1l3u;
	Thu, 20 Aug 2026 17:47:45 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6re-0000000BzSO-1ely
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:47:43 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-92e50a650a0so3763885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787248061; x=1787852861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nhC4gcMj6qZbqU/PjOfQzYKyx+7NDJFZ4HXjtdF8h8k=;
        b=mjXPvUQuux8x0HKZssW57tbUbiiTfivSxzRzmL6IZw7rdMrU9NVqbEOkhVtCBj0bu/
         zhY/fpdfAfxvZI+12k7xB5+SNStIciTmMc4Buj7BKMbIsrPINY9hp/N7Cnk5UitWxXXw
         D+j+4FRihF93Z2oqiTBol9XEzGUWOZdRp3tLOqPZ8qz1mEc48deVDPSA/esKHfxNNz16
         p7rjE8mbbFdRm5BjvwQEofZZ2edlWXTzjy6HQC+4mc9qHIsxOhTOuwOkTzj0I2kjfGe6
         xn9ZSGlriXV9gAccc9x4zQPC/WuGCZB487KVwoeviw7r16MT0xgDnIQlNZsPBwN4DKqU
         IRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248061; x=1787852861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhC4gcMj6qZbqU/PjOfQzYKyx+7NDJFZ4HXjtdF8h8k=;
        b=HgxrRINuNcbL/WlgtgzWqwf8Tmq5aLM66WpsALeB1BTsl9shLjhBjUYni9NimKf0i/
         NDCUFlGPJ0/bjnw/8S4iqvgVyr1ZmfR95J/ASCKJLzzs5j52+MUwybj0wgB1J7ZzF9YD
         9j/Og+YjpCKpxlFJIVez+rTDfwbtydhUNxyZkw20mCaw8B9jEZ9DWVrwlqMId5zft8dd
         WHJPP+ipzi4svMC81RDHSTCK2XpwZFWkkxI51caXanPmeVzIarnMAmwYDlXa8bQMSQEr
         OFHvJrywyEajnyJZCFWYzvxxG3hC65kel69igvmrvKSwqH3f+b6WXAHA2MK4+P9Eeg7h
         UB8g==
X-Forwarded-Encrypted: i=1; AHgh+Roz/Zp78ww2BpM/wVj1gbAOBsDk5k0t4JZN2c+1bLQnZqmSoCybgGaJidKJ923rp8oCF7/WfqduFMJrfEuWxUzK@lists.infradead.org
X-Gm-Message-State: AOJu0YzvqMIBXlyg8vFKfuR6a3BRLM16Pn3ja/UCbcvUQLiRyNcJ0ac9
	lDSf/xirbjf8auQNhWGKD0eyrJBZ8O355HW4teBScje8/T7cKr4/vBOMuPx6vOtlEsA=
X-Gm-Gg: AR+sD10tYJNIUbJ26HizsLTjhqe2B+UN5I2g4xIKq3GfAAP0LV/9ieAmxxbA6OBSCQ8
	fzWGqO2bvDXx1YMKJ0T5u5jLp4viV5WezZ8Ki2PEXtmMP/PfCTMJNxSbfbwFAEhrtG6cqBFBeme
	xfqSDJEdoje7I806CbRvCz6JlKRPxk52qjNvMmQwVvPDITSQj5bRVMUZWWnRWRq9UGO2xpvxA9D
	7GBz5tVDVN8Umcj0yCLlXMW8fBkjm0jm+kUO21c6pLDFafDjUxBKkBemqHHp6yyoWlt67NME8vj
	Jmu/b8dTuTt1eKAMyKyWhw3/4DsW41JN6JkoJHaTdQYx6J6Hzc1fIL5bhVnDEqEL0RLJ5hTL0NO
	U3XO3qY2IaWn3paggQ1YuFoMvDsrzxLQRfJ3w+MdQJ20CdB6H5dP88sY7s7r7bJk6yvHnM1cPD7
	Y+1PukBH1B69FxlBJ64OJTQMgo2njklQ3LzACcnldAvIEcjav4jdZPqXklK7vzzyZNfntpgaDrJ
	Ri5o7v7bNubVxUzdFjNgtpj+B/QMT78TaNNFyCmbl+VzA==
X-Received: by 2002:a05:620a:3712:b0:936:9f47:e908 with SMTP id af79cd13be357-9371e259c99mr1294064585a.19.1787248060787;
        Thu, 20 Aug 2026 10:47:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720493f40sm418053785a.1.2026.08.20.10.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:47:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wx6rb-00000004ADY-1Cil;
	Thu, 20 Aug 2026 14:47:39 -0300
Date: Thu, 20 Aug 2026 14:47:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Steven Price <steven.price@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 1/4] irqchip/gic-v3-its: Zero shared pages after
 conversion
Message-ID: <20260820174739.GA981928@ziepe.ca>
References: <20260820150034.88729-1-steven.price@arm.com>
 <20260820150034.88729-2-steven.price@arm.com>
 <aoc9CyxGPHPKFH1N@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoc9CyxGPHPKFH1N@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_104742_508913_B18861D9 
X-CRM114-Status: GOOD (  15.55  )
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

On Thu, Aug 20, 2026 at 06:44:43PM +0100, Catalin Marinas wrote:
> On Thu, Aug 20, 2026 at 04:00:30PM +0100, Steven Price wrote:
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> > index 6f5811aae59c..a055837832bc 100644
> > --- a/drivers/irqchip/irq-gic-v3-its.c
> > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > @@ -213,16 +213,18 @@ static gfp_t gfp_flags_quirk;
> >  static struct page *its_alloc_pages_node(int node, gfp_t gfp,
> >  					 unsigned int order)
> >  {
> > +	bool want_zero = gfp & __GFP_ZERO;
> >  	struct page *page;
> >  	int ret = 0;
> >  
> > -	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
> > +	page = alloc_pages_node(node, (gfp & ~__GFP_ZERO) | gfp_flags_quirk,
> > +				order);
> 
> I don't think pKVM does any scrubbing on set_memory_decrypted(), so it
> potentially exposes confidential guest data before it reaches
> clear_pages() below.

IMHO that has got to be handled in the arch code implementing set
memory decrypted.

Further pointing that maybe we should have an alloc decrypted so we
can at least try to minimize the number of times we write to this
memory. :(

Jason

