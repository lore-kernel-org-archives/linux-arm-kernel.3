Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19002C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyXnd1QeVCFR0UPHxNUE8dIZREv7JdUyyVgv52l4qOU=; b=mZ17BVKZ3+QrObOK92hzxmoLMp
	dCcrM+inj7NANycwpiE0w635a2ENbkUuxa32be1uR54mx7fgMU9BMcX5OpImnUEOFEPyFBYSk5R66
	l+QLcP+QeyYdeyWv+wVWOLM2Oh0njEgEq7T3LwzYZiduWPFryevHI+rFihouxxt7BrnE7HLGOPR7f
	wzMr89NzOptlnn3veIjfi9CIx894vZqBdi7pdf12ONifo0eFUvlb6K9qMY7KhsLfwbavIvYo+pqJq
	oidWU8mIxciYV7NNGqP977q4eMqyqtS5JbWGWlEuzuVSzNAXYmLev55R5icoA8xfxfftnqh8yxHzm
	et+uG66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwf9-0000000AMYi-3jxP;
	Fri, 28 Feb 2025 09:28:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwdb-0000000AMBL-19AA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740734788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyXnd1QeVCFR0UPHxNUE8dIZREv7JdUyyVgv52l4qOU=;
	b=BavGDj5/i86PhS/FOnIADA2YgCqonFhRr4ReaM5Qqxn36Fa99XWaTHVyrQXLuEmE9R/OeB
	0kkRVY4KHIuPXA8gVrop7tJc5CGjzOp9KRxbTDX92ukd5oA7vJmZDVW4h+YT8tqi3xvbTE
	4TiRlEJjLL70pb9Yv103EWIUvoC7mRs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-F4g8_WxqMD-3asCHXMBH3w-1; Fri, 28 Feb 2025 04:26:27 -0500
X-MC-Unique: F4g8_WxqMD-3asCHXMBH3w-1
X-Mimecast-MFC-AGG-ID: F4g8_WxqMD-3asCHXMBH3w_1740734786
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43943bd1409so13717475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 01:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740734786; x=1741339586;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qyXnd1QeVCFR0UPHxNUE8dIZREv7JdUyyVgv52l4qOU=;
        b=HZmOVVTaOlwReUU0LoiwwL+APqd63KiZA8+Z7fyCbJsol/NZRBS7UY/Thgo7x2Mvl2
         o48NUf7JYPnHlHSDYb3Kcyn25+7I3qsVsojzWo/g8hqUEQc6VB/rwZAs6FPLc2UXW3Qs
         Ej4T+AZoixhpdJhfAdvibykV80ybdzQxqujj+0j7WK/aVu5D+tyb4K1WeTfvvvAJPqQj
         kByVdFlacrdWmkmK004K/Ke4AaEI+Qqwr4HBxYxizHggLjPqUIxWzqkLnwspLbFKYOQc
         4yq65vDIOYDs9zztBPpOvuLoPZuN4CPq4A9uUtuICpyzOsJ2E+2rq7gHROJpbkwNyuPX
         R7UA==
X-Forwarded-Encrypted: i=1; AJvYcCXfyfv1lHoARtqAU815Nj9gfrp67iFzfkbT7CebvYQvcqjZvYnbLlaiN2my+EGaly/H22VN0hKBLPudIJHOLanV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Yr/76B2oKstIxhQYmzNmf2K/sfGP+oLHVBNTMBs8oI3rhB9b
	fpOy28mcNJxcYmbkgX9N3YKmwb75eNMIx4opNKNmRxpL9PwYh3q+y3EZNlBdkFbsNwfL+5qZRUl
	wBTJglvIH2NzRpHt56cq4ijKIdjoEhqTkxWJWYv3F/RQ1gZfbKomzTBduxd+vT82DRefSiIbp
X-Gm-Gg: ASbGnct7IlW68KRhXT3Af0wCro4DI2tN36Ouz1G6PraFZqOzooWrQjGWjvQglMpB0pr
	RlnkSwSoE6x7a2o46SD9f/B5FEgnh/jBHFJQfVekwGGAzy3XZ2EiG+L+RsFhXLLckVAXBHI4FFm
	RYkw+dQH2FHcsxrerhzT/lD4E/84ClsWR9pajILEn8Y0SgGHURXcg0GaW/b0OfOMmKS6GhNLgew
	fTFGJfLsLXB9HSKOXlLl9uYeHd1gT5dyUpOkLV/DToyvN7jI4jcydsbYKRhow5Nza3ez/sqMhZc
	Na1Xld16yTrjlTsOzLzOBNywMQxNP6yjepwHdFCNfth6EYY0qGJsATF+DVfI0uXfCg==
X-Received: by 2002:a05:600c:1c85:b0:439:89d1:30ec with SMTP id 5b1f17b1804b1-43ba6747587mr20161805e9.29.1740734785955;
        Fri, 28 Feb 2025 01:26:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrk8HCJDFMTsz7xCP+NNdsyxhZ1X9lB/qPY5M9JGAe9E6mxJhigejXtxTR6plCVUKRLft8mw==
X-Received: by 2002:a05:600c:1c85:b0:439:89d1:30ec with SMTP id 5b1f17b1804b1-43ba6747587mr20161455e9.29.1740734785589;
        Fri, 28 Feb 2025 01:26:25 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d09:ac00:a782:635e:5e55:166d? ([2001:16b8:3d09:ac00:a782:635e:5e55:166d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a27b27bsm49277385e9.31.2025.02.28.01.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 01:26:25 -0800 (PST)
Message-ID: <a7720a091ea02a6bbaa88c7311d7a642f9c7fdff.camel@redhat.com>
Subject: Re: [PATCH net-next v4 1/4] stmmac: loongson: Pass correct arg to
 PCI function
From: Philipp Stanner <pstanner@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>,  Huacai Chen
 <chenhuacai@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Yinggang Gu
 <guyinggang@loongson.cn>,  Feiyang Chen <chenfeiyang@loongson.cn>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>,
 netdev@vger.kernel.org,  linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,  Henry Chen
 <chenx97@aosc.io>
Date: Fri, 28 Feb 2025 10:26:24 +0100
In-Reply-To: <20250227183545.0848dd61@kernel.org>
References: <20250226085208.97891-1-phasta@kernel.org>
	 <20250226085208.97891-2-phasta@kernel.org>
	 <20250227183545.0848dd61@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zktZCxjP6b_y_0EAiqpI2qmkYYkdQ79mMBaFqdILpVM_1740734786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_012631_378364_7D83C535 
X-CRM114-Status: GOOD (  17.22  )
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

On Thu, 2025-02-27 at 18:35 -0800, Jakub Kicinski wrote:
> On Wed, 26 Feb 2025 09:52:05 +0100 Philipp Stanner wrote:
> > pcim_iomap_regions() should receive the driver's name as its third
> > parameter, not the PCI device's name.
> >=20
> > Define the driver name with a macro and use it at the appropriate
> > places, including pcim_iomap_regions().
> >=20
> > Cc: stable@vger.kernel.org=C2=A0# v5.14+
> > Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")
>=20
> Since you sent this as a fix (which.. yea.. I guess.. why not..)
> I'll apply it to the fixes tree. But then the other patches have=20
> to wait and be reposted next Thu. The fixes are merged with net-next
> every Thu, but since this series was tagged as net-next I missed
> it in today's cross merge :(
>=20

Oh OK, I see =E2=80=93 I'm not very familiar with the net subsystem process=
. So
far I always had it like this: fire everything into Linus's master and
Greg & Sasha then pick those with Fixes tags into the stable trees
automatically :)

Anyways, I interpret your message so that this series is done and I
don't have to do anything about it anymore. Correct me if I'm wrong.


Thanks
P.


