Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F492D132C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogMhvqORaTIS8b73g96qmwe2RrdnQeAUHycFc2Jb3Ok=; b=yYCH5RpBOTYfBk9WYmCK4zTwu+
	6dR5TTDYAQYxd+hUoXvlaCXVg0hrHMau+SEdTLH+wE36ezan0VVAKI8YqAj2isPEfSBs/XSpxd+vz
	YW4XOtnAv9TDWGCE1aphp1Opn1j1TCGrp8V9YkVDwUB0pTH9rC+/zfpvYsWxXs7Ld/lNbwQJngrk+
	OWKVm0rJ2+1Hyk1R8PFRrvtO6c+5sPKqwumM/avFEUR6h71WwTfpib5sHHIihRnsq0EmS2g/OOmra
	cwVIlE5n/twDmEXVt5II1bZwipgtUKzYi9NJZyVJpcBAxm+LLWVqM53QMWukveNC7YvJDD8XM0N8T
	jyE7v7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x9V-0000000Drqx-0Fyy;
	Mon, 04 Nov 2024 13:29:53 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x51-0000000DqYv-2hvR;
	Mon, 04 Nov 2024 13:25:16 +0000
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2cc47f1d7so2936779a91.0;
        Mon, 04 Nov 2024 05:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730726714; x=1731331514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogMhvqORaTIS8b73g96qmwe2RrdnQeAUHycFc2Jb3Ok=;
        b=iCuj/Pfm5viUf9XD5pjRLafcS5NBf7EY6pSX9DHb6U/DmZx6uXetm2Cwnu9So6Lc5n
         /opzck9RyNZjolRGBr6reWHfD7+djJ3enZNaCfDPot8EAbEnDITNJxg1Mz+xsgZU6fTY
         yY+j2MEEzg3nTH42VDvuXKeIUpPQKDrYtXhDhDzkyHYi1Tzw0XFDjv6bdh1dME8oi7hZ
         JPsf4Co5mlt4nueCIhKrsKxXWEItsCmVsw36tBb4EVOE00zpnrsbNthmEksZ/m2OQhLT
         Gicu5vxMpYjKvo8Nap1rUEhotfZqSZnTIZFi4PDLxS1MsQsIsVL6MSPy+ZWeLP5+1mkl
         Yaaw==
X-Forwarded-Encrypted: i=1; AJvYcCVgAvbGLF57D7bZBCvbObdg0UzJm1pvZk2YYB7VbhFFMAvAZaUztFa/mIm7yVWHSlUSryZ4jpmkDod7rQxr6+3P@lists.infradead.org, AJvYcCXcQYcHbLea7gYRD8aysxcGvY3rC+VB82vn1V3S9Byxadu8C9vUK8GLp49XrbmGI7jFoJqCiGzs3Ngb0BCOeZQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8mgE0gDzlRIaYGb1jEJbWB8paUllEgDjc3A8VBtOx4Ttr4Fww
	g3Osos/89YTkFgOcGqbg6Fb5juJVNqL3tOFkx9fBNlWflxbePUSRuwos6swZ
X-Google-Smtp-Source: AGHT+IEqHvQAsYUPGy9siYTWfU1O6jle+f0vsrJdgHDRINQIgi6G1CiPymMKxPiB4GdjdkvcxWZqCQ==
X-Received: by 2002:a17:90b:278c:b0:2e3:bc3e:feef with SMTP id 98e67ed59e1d1-2e93e0589dcmr22435187a91.3.1730726714356;
        Mon, 04 Nov 2024 05:25:14 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa2576dsm9473273a91.16.2024.11.04.05.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 05:25:14 -0800 (PST)
Date: Mon, 4 Nov 2024 22:25:12 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, robh@kernel.org,
	bhelgaas@google.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	fshao@chromium.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
Message-ID: <20241104132512.GC2504924@rocinante>
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
 <20241104114935.172908-2-angelogioacchino.delregno@collabora.com>
 <D5DF0QIO2UZQ.29U999LYCC05M@rocinante>
 <f8ca0f82-2851-40d9-983b-2a143b44263a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ca0f82-2851-40d9-983b-2a143b44263a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_052515_706578_B343D9FF 
X-CRM114-Status: GOOD (  15.20  )
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

Hello,

> > I wonder if this debug message would be better served as a warning to let
> > the user know that the speed has been overridden due to the platform
> > limitation.  Thoughts?
> > 
> > Also, there is no need to sent a new series if you fine with the
> > suggestions.  I will mend the code on the branch when applying.
> > 
> 
> A warning seems to be a bit too much and would appear like something to worry
> about (or something unintended)...
> 
> Perhaps a dev_info() would work better here?

Sounds good!  Thank you!

Will handle the necessary changes while applying the series.

	Krzysztof

