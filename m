Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A76E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KbDpu+5dgXCRMaHlMudK/PfUogFA3io0WjXBUI+vpI=; b=mSxsg+ZV7/A2ZY1/nLovI2iFtF
	8EZqmyybFTVofktonwBbuCEbg9GmsaoQ54u0TbXn8zmPhnrbXoF8ZOvGSCXcgMSfwv/MZP6kKPt6Y
	3wV7UoXewJrGRDT5P237TiGvg/rysWAUpfEYx2Abhkm3btfrpbI0LTutHExLiPJ5STQ6zBAwD3n9z
	nXJIYjcxnDZQbjOocPYHRrnQTt9HbF0TgCj9Yb0BPnRyBozJG4wOfQLmrgv7gqCZV3r2aFMcTg6PY
	yLHG4gL6YwCspvUsFvlaT4STkTczxqFwP/VYpys7EWaxxd8L1kcNyNMDULHc7agGNangmsVavH3q3
	GRB3nkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWBR-0000000DJf4-2zY1;
	Tue, 17 Dec 2024 11:56:13 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWAM-0000000DJVU-30Cr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:55:07 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f1459b6f84so3528598a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734436506; x=1735041306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KbDpu+5dgXCRMaHlMudK/PfUogFA3io0WjXBUI+vpI=;
        b=cSW2G9a0rnWQKpSzmXjXMP9cF2VOvAxxe2W7cbedZizahQw/1C7USx0o9WwDS7s2rr
         NWw5f4rG8v5sChpDdIYWfyRKm+f/iKOfpHMFPg5zTsPeNI6qH6AsTno9MacbiB09pIX1
         LTUekqyY8+eKmg24XTHAs7IJNWQgHLTsjewG51cFXCAbRgl9z1cu3Qnqkd54AXHiq4+q
         JRAGOmilwtxXFZsmQS0Kc0UOtHFaWlJjMed+1nXymdn2/49Z992ogR2BLt31PpKpFewN
         bqsBB8etcbWKasb1GLI/MhTKKOgoI6WEnyJvsxm4p0VGbMu3bkKmIqS2DNhCeiTXvHQ1
         Z0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436506; x=1735041306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KbDpu+5dgXCRMaHlMudK/PfUogFA3io0WjXBUI+vpI=;
        b=p0bl0ONwqlfp/WI/kge0/Vf1o7RDjm8UUU3lk4p75jpPJ3ukF7zD5YzvV+qh1/YsFc
         SyYZ+Fg/aahQaoPsdZX9cacTUBjokkAcOTS5P3Ym2hSjIBlPGK8o2inCIutojn9jWH1l
         D8N8jodM1/lDOywwwSyY2/9C/S3/YtXwWCq6SnHc5SI3PcTYs3vckAQmiyrm9mfUi0pP
         p+GBj70vulbETn7edfnaHIX7W7IuzdZxdyB3Bg7jZxHaAIokHE37wgC1qa+WjL8ptEPm
         wTltjZlUe1s2+ReUpPdu+fZAued/oH2nJtgpt/2JW1mLKB8JGAaX348h5RUs6OhWMr3e
         Wprw==
X-Forwarded-Encrypted: i=1; AJvYcCWCJjjirlVQ0xKBhai9z7y7pHTUBoHAuoasCH31SuDGZyuDej2rS69WwWTmqgQRu70303C0VgSn3BM8IHbQbKuH@lists.infradead.org
X-Gm-Message-State: AOJu0YwmIbKACVO56m4XMs6Mg//et5afYkgpwEpZUkJOrfdSdzhd4nnN
	u/60dfO1BBjcDTsEwVNcBhgIsPnB9yput5hFRsObhrpJFRg3jFIn
X-Gm-Gg: ASbGncss2+3gHz36vtzlYC2ByiWUVBWCYBX4FaWrRdlany5cBUsjZNAAKJYgZBk3Vo+
	Fh/3j0rdWWRovQV4W5Rp6BVFL/hTvxdQrw0D5QSIpvMzYIVrGBviZ+7is+yo0+T7xXKin/oMPnc
	oGgLGXKN7vGB/G6stF8dMUHfzuZxPVYBa//kay7nvnq3H0+pU98CwxxvQhvKFhqI/gPqSW9lOC0
	5EqSvoWYIp3w7TUeEe0Q6pBvv+ZpwX+Sey96wrz3uMNWUBbcqJebA==
X-Google-Smtp-Source: AGHT+IHngxmcUWV4lDNQlA0QXiov5JsCMkpOQ73Ck+LNIruRGkRdnCgPCkMNUjWYyHkKOes0d7ocDQ==
X-Received: by 2002:a17:90b:1810:b0:2ee:94d1:7a9d with SMTP id 98e67ed59e1d1-2f2901b3bb3mr21024098a91.32.1734436505718;
        Tue, 17 Dec 2024 03:55:05 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2a1ebba00sm7161517a91.26.2024.12.17.03.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:55:05 -0800 (PST)
Date: Tue, 17 Dec 2024 19:54:54 +0800
From: Furong Xu <0x1207@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com
Subject: Re: [PATCH net-next v1] net: stmmac: TSO: Simplify the code flow of
 DMA descriptor allocations
Message-ID: <20241217195454.000016ce@gmail.com>
In-Reply-To: <9d0722fe-1547-4b44-8a4a-69a8756bdb39@redhat.com>
References: <20241213030006.337695-1-0x1207@gmail.com>
	<9d0722fe-1547-4b44-8a4a-69a8756bdb39@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_035506_778031_08662026 
X-CRM114-Status: GOOD (  22.81  )
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

On Tue, 17 Dec 2024 10:30:24 +0100, Paolo Abeni <pabeni@redhat.com> wrote:

> On 12/13/24 04:00, Furong Xu wrote:
> > The DMA AXI address width of DWMAC cores can be configured to
> > 32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
> > get a little different between 32-bit and 40-bit/48-bit.
> > Current driver code checks priv->dma_cap.addr64 to use certain format
> > with certain configuration.
> > 
> > This patch converts the format of DMA transmit descriptors on platforms
> > that the DMA AXI address width is configured to 32-bit (as described by
> > function comments of stmmac_tso_xmit() in current code) to a more generic
> > format (see the updated function comments after this patch) which is
> > actually already used on 40-bit/48-bit platforms to provide better
> > compatibility and make code flow cleaner.
> > 
> > Tested and verified on:
> > DWMAC CORE 5.10a with 32-bit DMA AXI address width
> > DWXGMAC CORE 3.20a with 40-bit DMA AXI address width
> > 
> > Signed-off-by: Furong Xu <0x1207@gmail.com>  
> 
> Makes sense to me.
> 
> Since this could potentially impact multiple versions, it would be great
> if we could have a little more 3rd parties testing.

Totally agree.

Multiple devices with multiple versions of DWMAC core which is
configured to 32-bit DMA AXI address width seem to very hard to find
and test this patch :(

Jon Hunter @ NVIDIA has two versions of DWMAC cores different from mine,
Tegra186 Jetson TX2 (DWMAC CORE 4.10) and
Tegra194 Jetson AGX Xavier (DWMAC CORE 5.00),
but both of them are configured to 40-bit DMA AXI address width, this does
not match the case that this patch tries to convert. So I decided not to
request him to provide help.

