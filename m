Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB53D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+Lv0cqccltbLrN2cRosIlLw7fZjxncTIQzMOXjL94g=; b=DBDCgwQD562TLSjRRbq5Ex3Tts
	uVBIxPeIbPAqsQdzoU+vrS29uBfSghofSj6KRV4yLCk9VTofe75ppMU4x8u22Gh7dYHCLuKxqQQDJ
	sl96yEMvT1L7qNHHag5tuuIzEpKu7dWisvmG7VAcaTL2GK1I/qAWf/ygWtPAlveZ8mAjQndC/chJW
	W3FlXKevvhgTy3Lkp26GD1JjBZtgIZhRRZVtJn3Pa6aG97rUK977bgQKUuLED8BrKVUNJX0qu0SKT
	JrCwdh+oJk7rZxDCpRXr6b4J4NCR9lBV2HEpoTg+/65RANd1WcPfctRmNXT8yurV88SyZLLbs/0mn
	hh7KJOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K1k-00000009qED-3pa1;
	Mon, 28 Oct 2024 07:19:01 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K08-00000009pfj-32uV;
	Mon, 28 Oct 2024 07:17:22 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2c6bc4840so2918997a91.2;
        Mon, 28 Oct 2024 00:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730099840; x=1730704640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l+Lv0cqccltbLrN2cRosIlLw7fZjxncTIQzMOXjL94g=;
        b=GO6TKvUih74ZkzGqt+G2BFTRKPxDwdcVkR4xkILInx6J0E6xqG/cf5eUkKMgcHydQ0
         8HOt80H73Znz3fPD0Zk8a6Q4rzf6iYQbonr/V4in6mOAm6X+iPQqVdn1b4vGxsHqxLwt
         4jG+ogEd0nGp6il7PNipAIWSDj1D/QA73bFCeKDRSDs/lWWosUelylNppei2oE4p7QmH
         3eQTbAuMSO9+E3Q1DtYmLfz53+RKGIdD06oxdzKwGrkNOLg1S0v+kOfzt0A5hx6U6X+Z
         7olDg6TeicCK5eiDZ0VdcvSNJRx4aOmq0xkZzIj3OJfxQdSPw75V51U6mWus6egJCcbC
         PPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730099840; x=1730704640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+Lv0cqccltbLrN2cRosIlLw7fZjxncTIQzMOXjL94g=;
        b=GvKwwQhW8PhI9zO0Bsj1htatYlqxinF7NQ/GdAUgfTI9Ur7RzxVxbhcxFhQXhocHwT
         9MUBQajIbT+5PcX8B+NOir8Ly2XKrdovriBIGSDuwtGrBNKVNLYDvIbXjYejO9iOnYd8
         Yy9li9GjXpmLizqWJeM++kk9Te+same6UnMDC6h5wRaxwOnDb9Q6cRHku98CKoLe1XiE
         8+bbyJMS73ssRgW4diq6ruGlS97ISOPHuYTGTMpJ/BIVa7hqs37/ekL15oKaAYUc2Jwo
         kJjd3aG+GQzaLBsWczQsM6IeJm6SYvSLJyeLGnHv7oUUDN4dAjpir55Us5fkwgD3eN8K
         TkwA==
X-Forwarded-Encrypted: i=1; AJvYcCV+4gzOeeWKyGQ2qRr6kAwanv/4XlwUEcdG9c0wcVuDgW0WbefU6II/v3sAuGTPl2DwdhfIX7eJnSzdLEyJhCYC@lists.infradead.org, AJvYcCWWm1ByNq/xLzc47m58pFNavUEsVxhdfpWmXLc725z0CUNU3wTH3KfxhP1sR2C7nHMBhcS92WHtniOvZJ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDMcE+Ha0vS/pYE/MsY8vmzf/XkI9NTFPQb+TDTgAaBWUMzE+e
	AqLaeQy4wV5FVVoH+Ct7dx5uv2TvL1FfvWb2YvEstQUeCOTOc2cH
X-Google-Smtp-Source: AGHT+IHzWBoCJf/unr9JRCs10+RBX8U2VlT071YJUNmeAJD/FQLj2WyaOuVYdAuzuRY5sIOEG1ACqQ==
X-Received: by 2002:a17:90a:bcf:b0:2e2:effb:618b with SMTP id 98e67ed59e1d1-2e8f106f63cmr9468469a91.13.1730099839533;
        Mon, 28 Oct 2024 00:17:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e36a4860sm6374761a91.32.2024.10.28.00.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 00:17:19 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:16:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/4] dt-bindings: net: Add support for Sophgo SG2044
 dwmac
Message-ID: <gcur4pgotkwp6nd557ftkvlzh5xv3shxvvl3ofictlie2hlxua@f4zxljrgzvke>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-3-inochiama@gmail.com>
 <4avwff7m4puralnaoh6pat62nzpovre2usqkmp3q4r4bk5ujjf@j3jzr4p74v4a>
 <mwlbdxw7yh5cqqi5mnbhelf4ihqihup4zkzppkxm7ggsb5itbb@mcbyevoat76d>
 <8eeb1f7c-3198-45ac-be9a-c3d4e5174f1f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eeb1f7c-3198-45ac-be9a-c3d4e5174f1f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_001720_792141_0E48F3B1 
X-CRM114-Status: GOOD (  21.37  )
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

On Mon, Oct 28, 2024 at 08:06:25AM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2024 00:32, Inochi Amaoto wrote:
> > On Sun, Oct 27, 2024 at 09:38:00PM +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Oct 25, 2024 at 09:09:58AM +0800, Inochi Amaoto wrote:
> >>> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> >>> with some extra clock.
> >>>
> >>> Add necessary compatible string for this device.
> >>>
> >>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >>> ---
> >>
> >> This should be squashed with a corrected previous patch 
> > 
> > Good, I will.
> > 
> >> (why do you need to select snps,dwmac-5.30a?), 
> > 
> > The is because the driver use the fallback versioned compatible 
> > string to set up some common arguments. (This is what the patch
> 
> Nope. Driver never relies on schema doing select. That's just incorrect.
> 

Yeah, I make a mistake on understanding you. For me, I just followed
what others do. But there is a comment before this select.

"""
Select every compatible, including the deprecated ones. This way, we
will be able to report a warning when we have that compatible, since
we will validate the node thanks to the select, but won't report it
as a valid value in the compatible property description
"""

By reading this, I think there may be some historical reason? Maybe
someone can explain this.

Regards,
Inochi

