Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3FCC79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FWi4UMmKWtBKBjWiuhONQOF6ehNZanQAGIzU2PCLHY=; b=qb9fHMvDO6C1RFatTBabcsEEun
	D6Fxl5A6WNb4utp4H9OEahOnEvbOiIoaivlxe+ki7wUsLj7lUGSzCyzkSonpP/qp91FqeOPuqigz1
	QOMRFxfl9UpFVEkaayZidRMw+UlEKyvVdoHcwDHcUZY0SFNgfvF60ZChSAp1TeF28iqJJxOWvM16O
	zvKO0chCn1SULq6RkWRZ82KkVceF15ZksV8dv3vr76AxS5Sm/Ox3euNdiBYBKY2vBKn2PL/aHpGUm
	TXRt8iwdE6GP6gP3T5LjGs9jChH0mJPR32V1wC5zsepT9SJwwRrYeh7fB/VomN/4COvT+XJaejafR
	r4YHhUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjv4-0000000BJqS-2n66;
	Mon, 05 Jan 2026 12:42:46 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjv2-0000000BJpD-02pF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:42:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so141778525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 04:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767616962; x=1768221762; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6FWi4UMmKWtBKBjWiuhONQOF6ehNZanQAGIzU2PCLHY=;
        b=V6I78D1PINvDCABQBHembED8DkvlEOeqNrx86kNsUB0phNXcOu+A6p/z/eWr4F6fik
         xQ/7dEGJd220srai7bRJc3rX6ICbqXFXkBUlWCJvuJ8umDRfkCZAuV0iFTyydG/T/MGE
         9CZi51qe+Pte26x/lVNvmCbOdLXIWmOtuXuL3rbA5cmP9DXY2k5AyRbaiFaUYnr7ZIxE
         SU1QTy2yslgv9VgOMb64MBSu2DVVt87pMCVXnJCpGq3Tq+ttb8gStktGjJsqHf1Guvd8
         D9xHxGcVcsrSBhlpfbNXMBXHyHhSZgH9gw4RFMxLypmzLzg8BSBT3XgquS0/v0WDxAjM
         Wqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616962; x=1768221762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FWi4UMmKWtBKBjWiuhONQOF6ehNZanQAGIzU2PCLHY=;
        b=OrdLD71ygm4ScXwMdxvJuOmhMvAh7dsz0U+HIkgCEX2odznATAy/GnD77AVxdhAwfi
         ohLXDPqLXHou0k9SSCZoW4b40ePkE6vNWx6cGOZYPQ3vbwUDfKFXrY+IC7PRf9NlDa5v
         tnksgOCcizosNQq0rJRI0RRQ3LCTv1yKX13PMhODbfB2gfJEy1DUPIOvqBU/l9ET2eWC
         LqzTwF8Hx98RBlcEV0u+JnV7KXNBqo52DVTKe8vNFcPJ3FG3VufWp06OLXLkm4jrTGHW
         US3DEjsBwwDFrBbq03JiVxOIhoaRrmE+r30QVj2OvpRtJVXqi9yMupKpZnEH01qrEjqr
         CGKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMoPA+MLH2W4TCa/pI/hW6SmBx44L7t1rNT9XsrShCzl7/XNvKNcxAaCrAShy7m+41CLBN2KD0238RlDmM+S/E@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9pPrgSIXdTDxBzUq2INWt5jq0JajLFk+wex47c9RuEm+ruHei
	UY3OpZAIDtwN2/1Tj7ndh9EPo+EDkW81pK4AIDvfqblUMysm4uYfzi0l
X-Gm-Gg: AY/fxX7TGUYYkHls5rPgvXZVFb9pVrQIWznDcui3XQ4D4FGIT9bmIzOfpMzDP1+Egkr
	b7tEMpmy8u7PmZs96+Jyw6i9SlXAkPFxzeON7xWwC9vqBV7AyNbt/1MfwMHY65k5qF07ax1HtbE
	6AgYJJYuS2yZUvC0Zm18gaceIMeO4r9cYp5JEZRvZ7MRWHfpphrluyE0CBSWHGmdJysKo2hMhx5
	Z9lfjYgbWxE6vT1n6PG/uuMzlD+fQ9dgqj3lPUqU5IpzgcUBITSABiKK1SFeJTJTYXgGAgJLjQx
	nOII+iKEI2MhZTG4ZaxoldX82jDFN380iYlhNIIePRFNAHCZVs7RHUyptfflURUgd8CysxHy7qi
	xeN4gBQiMw5quPNf4yPjbeil3+ye0NgRmYR+5RhdfAQQBsmz9PwUt8H3aUHHQtaNZcX0zRU9y4W
	yHLgfkQB8o61k=
X-Google-Smtp-Source: AGHT+IHtGtvg4uT3cboCMh8iga2sewapNAHrP9JvUocRuk9xAXBp5Q/b/VJsN4JJTeNeQfvMRiCunw==
X-Received: by 2002:a05:600c:8287:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47d1955578bmr717393225e9.16.1767616961956;
        Mon, 05 Jan 2026 04:42:41 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:20bb:19ed:fbb2:7e2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2721sm100277452f8f.39.2026.01.05.04.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:42:41 -0800 (PST)
Date: Mon, 5 Jan 2026 13:42:39 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aVuxv3Pox-y5Dzln@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_044244_086896_9ED6E507 
X-CRM114-Status: GOOD (  29.98  )
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

Hi Maxime,

On Mon, Jan 05, 2026 at 01:23:46PM +0100, Maxime Chevallier wrote:
> Hi Stefan,
> 
> On 05/01/2026 11:02, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Add a fixup to the stmmac driver to keep the preamble before the SFD
> > (Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
> > used on an NXP i.MX8MP SoC.
> > 
> > This allows to workaround errata ERR050694 of the NXP i.MX8MP that
> > states:
> > ENET_QOS: MAC incorrectly discards the received packets when Preamble
> > Byte does not precede SFD or SMD.
> > 
> > The bit which disables this feature is not documented in the datasheet
> > from Micrel, but has been found by NXP and Micrel following this
> > discussion:
> > https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> > 
> > It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
> > 10MBit. Without bit 2 being set in the remote loopback register, no
> > packets are received. With the bit set, reception works fine.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> I've also faced this issue, however I'm wondering wether this is the
> correct approach to fix this. It seems that all Micrel / Microchip PHYs
> have this behaviour of discaring the preamble at 10Mbps.
> 
> Some of these phys have accessible control registers to re-enable it,
> however this register/bit changes depending on the PHY model. For
> example, on KSZ8041, this is register 0x14 bit 6.
> 
> We may end-up with many many more fixups for this, basically for every
> micrel/microchip PHY.
> 
> Wouldn't it be safer to just always enable preamble at 10M for these
> PHYs, regardless of the MAC that's connected to it ? Is there any risk
> always having the preamble there ?

This is what Rob also suggested:
https://lore.kernel.org/all/20251215140330.GA2360845-robh@kernel.org/

Unfortunately, I'm afraid of breaking something on the platforms that
are already working, as this is an Ethernet controller issue. As I
understand it, the PHY works according to the standard. Since the bit is
undocumented, it seemed safer to only apply it to the i.MX8MP.

However, if this is preferred, I am also happy to always enable the
preamble. In theory, I don't see any reason why it should break
anything.

Regards,
Stefan

