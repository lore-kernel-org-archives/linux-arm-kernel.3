Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83035C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 19:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XndM4SUJuOZNaJGKM3Nluez+j/ai04AIsmdbMK/OdgU=; b=xPeyMe+TVEc4ewBE2ZGGsGZG7r
	B6HMECk6Li+qpgTTJZcfCLhGYUBos8kfPWKb0Ov+pEdn/r081IuMTxuh/XQxJ2q2HeSZt0uuorDkz
	fcSkw1cZvXznabrgeier4zNVHF/A6MQD/aNMYU4/vxy6C3jYMstpmUF8ZM9tQoYIP+SCIVWIiHb4l
	K+TBuzw07YpkUMq6YMuOKgE6wv5xR7/frcpZLjw85JpTE9Z5IwvWTb6TEIANrQupFpURCFsHjEHVn
	zyW1eLVJFMbna6LHJXsks0tAKzTxFNHj7o3ycau7cxc8cCS29tYQD2QV46ic24gI2UL4ZAANYaiSQ
	e6e2uJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teIyN-0000000D2mg-2eJg;
	Sat, 01 Feb 2025 19:16:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teIx2-0000000D2dh-3hnk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 19:14:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21634338cfdso74422505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 11:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738437283; x=1739042083; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XndM4SUJuOZNaJGKM3Nluez+j/ai04AIsmdbMK/OdgU=;
        b=mDw2di0I/pd45Cbiz2w76WxJCTQODwR+8hRMBUc8Ou5nVsonEB5zmcWOlOyVtTbmtJ
         F/fqDfOTHGjC0F5nrJtMC2z7MVKltHYJWjCGmg7FPot69xUZ09kW90pK/LEVXLVUef5j
         qbNfzPtHntsj6xM8cuZ/u8jvO80t8XQ0vzhBT17If+UO+k5OS2/B5HS3FECa0ChvmNEZ
         S+T72h2Dlb8THK6VcLK1+KR3zE/Po1BLYz2ObaQ3T3ZDxZ7v9ugf7Ieza6joOzET3B+f
         V8iQe2JR/mSU920h/y9s9kPICn4mfKF2AtqWplQrsoRU1jZqvvfkI9fCXRJzxTnZpDGg
         xjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738437283; x=1739042083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XndM4SUJuOZNaJGKM3Nluez+j/ai04AIsmdbMK/OdgU=;
        b=OZrqF7QSQ38xUvX61uog2EZiriP5Y/mK9QFkhKU+VByU79qKNbSPxomy9aUz1sOpc8
         +ywYLNB+4TLSpQdL4bYM+L2X5fZ+j7PfkkH7GXHEJrU0pcOgTS6fmbGm7TtKQxVHQyQW
         NVjGvLAeetfo6GzJ4TnG586p25LRRlApWi5lYdS6SHXpaRMRiOBbVjiewggThEgQ4gtB
         jYQir08EDxamABCOOGruERiiLuwQGBRsrYOReTShkF9aB5HdRXUHU2lZVQ6I73r5BITo
         nc8M6RsaPRE+a8rN5L5UK7W8jENMKGU2nt2RU8r3wMtQyAKoR3NUFgPI2KCaGcUZrw+O
         1A/w==
X-Forwarded-Encrypted: i=1; AJvYcCXrLgKQfNyKF4JZq1fS3e/IFUkYSidon8SFGY8eN4KTgvqI/Z+M7MyX/71L8+wvHCNPPSLe5Kkcc0eymwAAR21m@lists.infradead.org
X-Gm-Message-State: AOJu0YwGJAdW4OLS+59S0Dt+OQXzmL5vXryqlL/XYX3BghUSSngH8xA9
	joys97Zqm0uHx91ZspmUy0OS8vtnWXNoSK2CW2wrE3ZRi8aWR1Uu
X-Gm-Gg: ASbGnctnGT4MvduV8ReXfcpz2ha1gZ8FqG8xLn9u3DduzF5DY4Xcd5TynlBJ6kKIsC/
	5xTkPn+cUVEiTInp7kAyaHeTby8XRxHmmZcZU/obfk5/7uDdWap9SgkCuf3FqdL6RhBPiNaOC1l
	3qDTpHRJPQB8WRUMWl5HpOCaG3snFOy36tt+/1k9I+3+0SqBjRJRN3vLKPVmqC0wwPjQMCsnrJq
	HFVtiKZwd/4uyXvfxag/Qe3J88HF8UvJMbVhO04k2bz9plYvWr6tupKD1H2lezzSC/YJ+2KhOJp
	r7Vh8fMw+SyQ2Wfx/Cw4nksTeL2I
X-Google-Smtp-Source: AGHT+IFB0fHVUPGOn0Y4YLnpgsNItVWNfXE3cnoduXNVQ8LV8KKiNZ0+PqrNHM/p1fOyunreivhv4Q==
X-Received: by 2002:a17:902:ccc2:b0:21a:8d8c:450d with SMTP id d9443c01a7336-21dd7df960cmr277991815ad.53.1738437283444;
        Sat, 01 Feb 2025 11:14:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf93c23sm8240833a91.39.2025.02.01.11.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 11:14:42 -0800 (PST)
Date: Sat, 1 Feb 2025 11:14:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanteng Si <si.yanteng@linux.dev>, Furong Xu <0x1207@gmail.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability
 value when FIFO size isn't specified
Message-ID: <4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net>
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_111444_927107_7D8823A8 
X-CRM114-Status: GOOD (  17.60  )
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

Hi,

On Mon, Jan 27, 2025 at 10:38:20AM +0900, Kunihiko Hayashi wrote:
> When Tx/Rx FIFO size is not specified in advance, the driver checks if
> the value is zero and sets the hardware capability value in functions
> where that value is used.
> 
> Consolidate the check and settings into function stmmac_hw_init() and
> remove redundant other statements.
> 
> If FIFO size is zero and the hardware capability also doesn't have upper
> limit values, return with an error message.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

This patch breaks qemu's stmmac emulation, for example for
npcm750-evb. The error message is:
	stmmaceth f0804000.eth: Can't specify Rx FIFO size

The setup function called for the emulated hardware is dwmac1000_setup().
That function does not set the DMA rx or tx fifo size.

At the same time, the rx and tx fifo size is not provided in the
devicetree file (nuvoton-npcm750.dtsi), so the failure is obvious.

I understand that the real hardware may be based on a more recent
version of the DWMAC IP which provides the DMA tx/rx fifo size, but
I do wonder: Are the benefits of this patch so substantial that it
warrants breaking the qemu emulation of this network interface ?

Thanks,
Guenter

