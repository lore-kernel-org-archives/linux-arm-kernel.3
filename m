Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACE4C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wC7mKSrr4kiaf3UIcJvhXmaBddWPavsd+lLtVOh+oBA=; b=lPO3hi1qDFfClsDjuVmO5nOxGa
	UYF2cGSMQsYuxAr3o1n6qDcWp/9IXYzvRtHY/SqvC9yD8MrAaWO2/Uec2ALjn2iefaQYw14V3ybcd
	0h1L1Ocvjde5o8Vo5hetMXOyr2g164wu8FZMA3pKJqfQxUlPtkK2cCGjZka+U/q+eC89eH8wMuaTX
	s7mvuUlEtWwRIHayBrLGs1xVN2YK0eqlqYywwSWzvXMPiOJmfFyhqnX6mh9TqFSvShi2OrCewWHQW
	5WTs4beqUCYXk4WoXfSF8CzqA0XeIRbRIbL+A5ilNKv5J968IkiNw2AWWijMkFU7kgvlatXbegYed
	81yY6Xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpyg-0000000DgWS-0Yi9;
	Wed, 04 Jun 2025 15:24:30 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpvV-0000000DgGN-0uba
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 15:21:14 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e803de44766so5038292276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749050472; x=1749655272; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wC7mKSrr4kiaf3UIcJvhXmaBddWPavsd+lLtVOh+oBA=;
        b=cuq0MXdcNF6AqYH8Pp/Mza9H7HxCNC/oUFOJRpCBlOFNDdOlsjPo2y+I8fwbDN4yfL
         BvJR6+vIg6hcAmSGgJ474i41Pqc/QpbTcmMrV5XtWMgAzUapFdHmcEsO6I1WoYzUMz63
         fX4R1X21kcjj2rP0owuJUfNCTL8C74ZWeFEK2R0/jF+Eu5H24zXgzZpF1oXKwJO4+wX2
         FPTH+PWhtlc5XrQ8RR35u3IalUHjSwbA+sjZLFz2poIkjK8TfVbXPEi22lCLvM2g2sV7
         zFaHzv+sfd9Ev5B71Z6kVddeTnGyaY8Cm08paMR4HOGfhkCWhJm3HGpyug2XKEezCXH7
         iDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050472; x=1749655272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wC7mKSrr4kiaf3UIcJvhXmaBddWPavsd+lLtVOh+oBA=;
        b=s+3zO8nOUbntI27TSJLZltKPxnySokc1ZBiZXOKVlY5c9LdSoqeXVOzuZfwak/a9Gw
         0RNIYYdkaHPrRVj0tT0SsMuO8hgmP3Zqiyhs4vx53YbZiMRl6XxpUWQciib/LkiQ0ZUB
         lAakuFpDaZAc/m4+QrYowUdtvpbN5fndCmQPZAUDgEGIrefajxulmCm6jiFqlbQavVGN
         qxnN2HndaxnvKT3KTbG9qRi/lz9iWVRyW+1LPU058aZT0dURiafHr2iXjfM28DpjiGt4
         AmXpv0plO2DKcIgg24PWNY1HoocHPwmLrCQ961uW5cBe3BYrXhcFD2NFKLUCHXVrHKh+
         mkFg==
X-Forwarded-Encrypted: i=1; AJvYcCWCzfpwpJnPuBAlvJxOyiB3RqbUxnueUX2KJIzXwzSfD+5D1HS/JXKuhQ+C/n7UuuhzSgqAAC9Jwt3qCb4HZ6IC@lists.infradead.org
X-Gm-Message-State: AOJu0YxXCGVwVlVytwTcMd7svJl7TTCAc78KvBZW6zFqTIrc+nG6E9cr
	ViaGZhcVZOeOW1wDQeGAHnrTNLFYiVxtm7PKakvrVU4nG+ug10IRasViR9pDFgxaCujeaZCLaDF
	yif+DSEQvH8kWQPsFenemgjanbIFyc30=
X-Gm-Gg: ASbGnctZb0xWUjuJiXIzzzP0OMqs6GhE/O9NP1RZaz9SBBU38aTAjV0BavEldUm6Yh6
	fdzx+ZXDcEBE0QWJY/4JIks4ZNJlhiEZg/wB8ZTgphW8tQ7q/iNLD3U+43DXyuVgxmPIEeOK0s1
	oUrAKGisz6q3DYp8XlsiBcrL9PzCNlLvk=
X-Google-Smtp-Source: AGHT+IGREyE12fbHjJBCwDCkpDdLrlnY34Qx31wboQATvSL9xppWlFT+MzuRD7abZcfpqgHcsVZXAPbDl5OG9kjk1cs=
X-Received: by 2002:a05:6902:2102:b0:e7d:6d7c:c33e with SMTP id
 3f1490d57ef6-e8179da11c7mr3933634276.44.1749050472139; Wed, 04 Jun 2025
 08:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch> <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
 <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch> <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>
 <1d755cbf-4dee-4784-98b7-e72061219e3f@lunn.ch>
In-Reply-To: <1d755cbf-4dee-4784-98b7-e72061219e3f@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 17:20:56 +0200
X-Gm-Features: AX0GCFssVbXWXo-ClT4FiYIScIddnBW-kBko0Lugw34l6NVIDWlAS9mHkPVmzfg
Message-ID: <CAK+owog-Mipq2Oc0=gd8+LziHmVUrC5R7HidYYZWu9_AWu02TA@mail.gmail.com>
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_082113_259419_AD1E91B1 
X-CRM114-Status: GOOD (  22.28  )
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

Hi Andrew,

Absolutely, thanks again for pointing this out! I'm actually glad you asked,
because it pushed me to double-check internally with our hardware team
and confirm the exact implementation details.

I'll make sure to include a proper comment in the device tree right above the
'phy-mode = "rgmii";' line in v2, clearly stating that the RGMII delays are
handled via fixed passive components on the SOM's PCB itself, with no
software or strap-based configuration involved.

Thanks again,
Stefano

Il giorno mer 4 giu 2025 alle ore 17:13 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> On Wed, Jun 04, 2025 at 03:08:09PM +0200, Stefano Radaelli wrote:
> > Hi Andrew,
> >
> > To clarify more precisely: hw team told me that the required 2 ns
> > RGMII delays are
> > implemented directly in hardware inside the SOM itself, through passive delay
> > elements (filters) placed on the RX and TX lines. There is no reliance on PHY
> > strap settings or any kind of delay configuration via registers.
> >
> > This means:
> > - The delays are fixed and cannot be changed via software.
> > - From the point of view of any carrier board, the interface is
> > already timing-compliant.
>
> Great. Please add a comment in the DT explaining this. 99% of the time
> 'rgmii' is wrong, but this is the 1%. We should make it clear this is
> not just another cut/paste error, but very intentional and correct
> because of the PCB design.
>
> There is a patch to checkpatch.pl i want to introduce in the next
> development cycle which will look for 'rgmii', and if found, look on
> the line before for a comment including the word 'PCB'. If it finds
> 'rgmii' without such a comment it will issue a warning. So it would be
> nice to avoid that in your correct case.
>
>      Andrew

