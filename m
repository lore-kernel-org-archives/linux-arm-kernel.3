Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C01C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7Ug76I8PBqsVyX7451rWvT3DCckR1pFD90rVI4kapk=; b=u4Kmvc+GSNxMXgIOUtBBtgqNGD
	m8WakUN2jLAeV/gz1VhJyO6PkAsR5jn4OCO3SwpJxNJxwlcWepMscWANdTWzNGXrZBJOR35V5TKQ8
	3MEoaopBw6TG07t9IQH7miFr7M9MtluFKRoMgnssdkzXTUArPo8BXBLZSgLVYJHzkbiTGVO27mo/7
	Nv8wmNK3OtWPToJvXhe8EtRSe4CGC4vYCW7AuSIfPzlsybRnKmtp/c9X+2i/PytH5v3vLm0gbhjwr
	oeUgif8qubfBShEz+lCuOLH5Mr8FhcNrKTZqOP5a2ONtz1MbOActfyXhBknl83Q0qiTV0tgs70iUv
	NNUDdJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gwi-000000062Yp-3Wz5;
	Tue, 15 Apr 2025 14:07:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gln-0000000605c-1f8b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:56:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso7276386f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 06:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744725370; x=1745330170; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f7Ug76I8PBqsVyX7451rWvT3DCckR1pFD90rVI4kapk=;
        b=aaULxJ+s7nttEBLwhnVM/GaXPwueeR1lRHl2FZ1dIMNxcShy0rJuV2WOE1DIPUoXDc
         m4MSNKCXAFqjf4ESk+aGOC2ohJkY/oBU+2p2n10mYuktjqIw3kpBsWNn5kEBvZ/xMidh
         KmVQsFavMNvc1JEMgt/D/w4hhceMCURulYgCd4WUwLdbzo2UOquLDNkgDgwbXx0n0X1x
         orKEUQY+UFLifr+C9FfQptIMGIOlxIEGGX9sR5K8A4y0H7eE6X5CYFlCT6T+OS6t/fak
         2u9Df7FXGWHOekpoLs1+0KQGzvzJg6DTZQBv1ahIHUwcP3EEchGuez3I/E+N3SIBx9Sc
         nrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725370; x=1745330170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7Ug76I8PBqsVyX7451rWvT3DCckR1pFD90rVI4kapk=;
        b=dN/mtXCKhEdcx0jNES0RCLefauAE3TCSxJHv4Zl+j9EKeDbSEQplywqroyEfj9/lrd
         S9YwAlHf0DggGOEhogg/AhpfX3UEwTrNs9dPzbcz/eoaLQ7419e42DdvIWN+2Ab2Oydd
         wiEcQt3d4Umrte3qPY7rPEnSOopdF+el5xw4zAufX2gRSw6gGibEcoFzJo8Ek/3woh/M
         8EvcgU52pDWyRv3e0FYvz4r/xmEOvOXnblSlinK3qoC/P+6ZtvBbt8NW3PDQ3+fSFAbI
         b+8+gJCQHtxQ/D8IpAT7DZ+ZoQEIdtlvA6j2uuLxt9zofU5iZnGBErjHbQ8tO9seTON+
         eKEA==
X-Forwarded-Encrypted: i=1; AJvYcCV6EnzZdCOmQe56nMLsr2r9tuMJdB7PX4X6bvJ+WufxDIng02v+fAzgQ0NvnMovp14Aw/k8+0BRrnzhuDP9+ar4@lists.infradead.org
X-Gm-Message-State: AOJu0YxpA8qUacyOCjzJtzuGgzPZQngmBf/Npdj39vsZGV51/M6Wp6GP
	/8UvSjUmxBVHWBOEWUhyw+yDKmwUi0dwyFtvzDk3YISEOKI6wNqZ
X-Gm-Gg: ASbGncttbETHlm463xBkrNPaAFzTwCs//NZvWfH9kUE1FVri12SXzxtxmHO3W2gzP5P
	TeSv20thUPmm/OpU7/wWDDI8n7UpR3rEZ1rCeQ2V63wRFjXYgOprUUQkxRLAc0CgO2ObppW+4Y5
	LPq5tOJ5CTwncXTNdusw0zU8eCT40tLX1lMvo2tiKo0qSkSmbE10yh/K9rvtVpFjMkaTBjDr1Hd
	EfJBnbxNarKrS6w/EBkmL9w5Ri0LPaCEFpkylSGNofcto8p5hEZwMFT8y/9muET8GesfpA87Q+1
	bCfDWOfqjjBYsp/Tsnr+lpssXT1bSnFP9xBL+YQhNg==
X-Google-Smtp-Source: AGHT+IEUc51u2H2A2sXDUuHdbW0oUHYeFA2HCqNohoAXTGQXycwn5Mca0dijghzNDofByf9HiAEEYQ==
X-Received: by 2002:a05:6000:381:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39ea521206bmr13186409f8f.31.1744725369575;
        Tue, 15 Apr 2025 06:56:09 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eaf445515sm13993745f8f.89.2025.04.15.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:56:09 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:56:07 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH net-next] net: stmmac: sun8i: use stmmac_pltfr_probe()
Message-ID: <Z_5ld6D1Yyo7Ysur@Red>
References: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_065611_433575_C3A40D12 
X-CRM114-Status: GOOD (  12.36  )
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

Le Tue, Apr 15, 2025 at 11:15:53AM +0100, Russell King (Oracle) a écrit :
> Using stmmac_pltfr_probe() simplifies the probe function. This will not
> only call plat_dat->init (sun8i_dwmac_init), but also plat_dat->exit
> (sun8i_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
> results in an overall simplification of the glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-on: sun50i-h6-pine-h64
Tested-on: sun8i-a83t-bananapi-m3

Thanks

