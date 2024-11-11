Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CAED3ABF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FJxCy9nRJVtXfCTsU3KXy5JjuHCmavURmafpMWip8Y=; b=rV7U5pDW3TJPN1HXJcHZpLoz1D
	BV0u6h+OZWHX//413GKD+LeouZ2Gg2cfkjdT824NuhKSKzbrJkZGwgrJ/0fhi0zZgdUzY9s4sBPpw
	wWmgfldjR4xL1lRJHrEIVGuiw/jbRZudQ2nZKscxQ//xdtKNqXgTQcCwVGkCF3EPcOTmXZx6OKmGs
	298fHQ6tLtSIl0JzN6okDDx62TP8nOfEe8A2VnwhHRdskk3oPiVQJdlZvUBMWKZyIFLMVNj6+ys/2
	WhSnXXlKQJvq8dWu7xIzyGjCiTiHrNc0CI4+MsjXm7ncFIDXGptX0NBjsLxM/1+RcU29HgVEcAPG2
	h0XIm+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbZz-00000001ITm-41A0;
	Mon, 11 Nov 2024 21:04:11 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbJu-00000001Er3-002I;
	Mon, 11 Nov 2024 20:47:35 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so62350235e9.2;
        Mon, 11 Nov 2024 12:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358051; x=1731962851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FJxCy9nRJVtXfCTsU3KXy5JjuHCmavURmafpMWip8Y=;
        b=h4sTlXFeX1847MPqU0Q2LatRi4ZyDnso5SVPsakHtdqa3gV7ZcBo+baZYnsavPF4FC
         1bl2AO669MjcI9+zgLWNzXs+qxACeSsh4xtv0t887seI5nqWJj1eFTFEs0zviHd70KmT
         pEE98ELUUvV5b+NGtPLvy4Qno9/XohKsok1S/+FKwMpg0CQgKxMBbK3B/f3C7xgLVM00
         uP4gbekc/CjXtcXhsT1azYCnrRViIp54I5C6NOhc8uUi2PA9g9ouMd0CAD26kFBuw77N
         BkcSUpHvd85JmPCJXqZsqzicmpKG7Ar91v/Jzq72lcnKz+VqQq5/OPjIU6sUHh5ws1Xv
         Lu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYZReK26O2BDWllUeXwqTTee0kIvtr0IoZ9uNFnVehMB6nnVk0nkL++rwikjOpt2owDXqyDLpK+kZDRAzAgYJm@lists.infradead.org, AJvYcCWI1tb2SzT0bsMMV9nVUsgwTvEQaWNQ+RBzqMCB0wPaoPL3Yz74nMyTXCCbmo4DTfM3aDFCTEqm2HdCmYLaJ74=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHNujCn1KS6Ff6P7b0TNeazhS3RctQbFnxeOfaO/vqOwCIXAv8
	ZC++3EQBAF9GPqajvSvHvS9TJ6++z2BLOA8CfsKRbsxdeMlX9Lj3
X-Google-Smtp-Source: AGHT+IFI2E55Rc3mQG84xqyhIN5Toyfc2naC+drFE80OuMZoOLBtHsrsaeYFSq9y+fXhLMa9XRR2xg==
X-Received: by 2002:a5d:6c6b:0:b0:382:5af:e996 with SMTP id ffacd0b85a97d-38205afeae9mr2197479f8f.46.1731358051094;
        Mon, 11 Nov 2024 12:47:31 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed987d33sm13946207f8f.43.2024.11.11.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:47:30 -0800 (PST)
Date: Tue, 12 Nov 2024 05:47:26 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	"fshao@chromium.org" <fshao@chromium.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>
Subject: Re: [PATCH v4 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
Message-ID: <20241111204726.GA2193665@rocinante>
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
 <20241104114935.172908-2-angelogioacchino.delregno@collabora.com>
 <D5DF0QIO2UZQ.29U999LYCC05M@rocinante>
 <f8ca0f82-2851-40d9-983b-2a143b44263a@collabora.com>
 <20241104132512.GC2504924@rocinante>
 <c5385db34878763ba7df3711a514e4332418cbbd.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5385db34878763ba7df3711a514e4332418cbbd.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_124734_063101_35CCDF67 
X-CRM114-Status: GOOD (  11.11  )
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

[...]
> This patch may need more discussion. I have replied in the previous
> version:
> 
> https://lore.kernel.org/linux-pci/7e220693f076c84cc1bc3d91e797580b320b4598.camel@mediatek.com/T/#m1b9f2d26a228712b6b9d02eba11d8063862772c1
> 
> Should we wait longer before applying this patch?

We can drop the series, and it's not yet too lat to do so, if you believe
this would break devices like the one you tested the changes on.

> Do you have any suggestions? I can provide more logs or test results if
> needed. Sorry for the inconvenience.

AngeloGioacchino, have you seen the reply (see the link above) from Jianjun?

	Krzysztof

