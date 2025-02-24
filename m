Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722F4C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgBgqyu4tKatdMND7+/18VtL/05cP3jlzOPJySx+wMI=; b=kF8PtCzeeAZtwbNsFrjDBaygEv
	Hh9d8ZKHd1QGfq0EDzNaLtS6ENphKHIN7ca1BVqTcgNAhd0UT2gQXMxJ5j0KqyZlyKgS9yWZDqkY6
	zXnpI9W1m+TLkoVz0erRQR7W8AntpFRHmLm2UI1OIM1I3/nCupCmi7a4mIVggf1xbsDXhc8Y2Arc8
	WJuwxp33NuH/mYpfDdqejkzR3d1nEVVBho0h5reKf6EsSvYahiok8INzI6LJIO3DRCrv4Quk7cf6D
	KLrTAR2yyYaXyaJielQPidpw621pLTEamQI9q8IIciCykRe58C28PPPIea4mBbPXgVe73FoKIl5a4
	FG5hwpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf3H-0000000F5Vt-16ks;
	Mon, 24 Feb 2025 20:27:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf1m-0000000F5EB-1Dcu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:26:11 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22113560c57so13515635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 12:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1740428769; x=1741033569; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgBgqyu4tKatdMND7+/18VtL/05cP3jlzOPJySx+wMI=;
        b=t/83BnntH4Qnx0mg7Bq32IU3KP2xbJA4LIcvN/ZAt+cXBhuwdoQgcgClAi4dSkYFna
         KAM944/l1HuBqrisdbJ0OzbX8+BgjhC77lLNQyWtErZhDipTXmTOZSDZMLiWMTQIT1HG
         ljzU5TTIUZHCs09sOFlYRcPBIUHsuVZAhA3srTj8IGEtiP241YF04jNarECyb5yusokG
         wzm+NNQBJUFI5fifvI1aXzYRE4Uh/+YFwz7ExtW97ARufkY5f/j/bW6+ZHty2rjOli9R
         E2VgzZUYMQ+buKQ+9MjvIZBXGI0TGWyOWx3XrDLCKhAi9fL2x95QS5DBHaBixVKPaK7/
         qKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740428769; x=1741033569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgBgqyu4tKatdMND7+/18VtL/05cP3jlzOPJySx+wMI=;
        b=VUndo6xtCb83epcEBV/TxTDk1B3CZtrtll5Fv9GCCR/MNZ9kp+q4+7YcOWV5TYF3Jk
         Ahtj+3fPTlVdFgntSGRFg9Dwx1k3OwNLFWeIqlIBFNGGEVRMc2sX/kotZmRH66LpeQB5
         U3TqEWPkXaHAb/N8sEO/98FuwiSHQk6KIApNZ5qO0l9awHqQmw0QRVJqUCQG/76gDZgV
         Lrvtyzn84HVK7ffzdt+zrBLPoquTVPO0fcQtLNKa/4TVbqBn3tUO7yCn4qDB1a/JSulx
         zv1WcCJfbS6EvsEBxOn3xyu3H2CB7IpFc3z/A4+t4Ai+iSlTp/MAl4T/Mrm9c4L0Z0Qk
         whrA==
X-Forwarded-Encrypted: i=1; AJvYcCU4EKchFU7Q2MP9bRTF8yVoLd15STPydP38a8tWFBFvZr27wgQvUfPPnwObkzD1i4WXBNoozY6uGeSNCj8RSfRW@lists.infradead.org
X-Gm-Message-State: AOJu0YxwmgvnrTgEB3QzaOQmr8fWp1jvEn6Q2xJXQjaUbw++gRU1yfOs
	9fxdAQfhsy9xW5xfJY4nPoYNiDh23OY9/XMdEGdUtna7XDpJMXKDZxhhaFvsMSY=
X-Gm-Gg: ASbGncuoKCfY+kQf5iA64wGfBrsKlZ5cRtxP2zqWT4Zly4fRzbWG8UFprlk0OMfjDl4
	eukAjVkCbF87HG5Kvwk3lpM9KBQJmtGBTneIE8LLmSVDHHHvSyfejm9zIaDUx0X0jTGuTm+XE1g
	bDdgNDtnIX1M7SRd6qUWBLOhWMZMDsKlWjRnCshoQ+yt5tXERZagDZrhZecGVhfzB6CncDHGJ0b
	gxVhiacMkFXMowwhsjLLj88ihXHz5EzKQrRG/hEa1efk7sUJU0VpEP4QN9biatph+yytYgtGR+d
	kxszmGw=
X-Google-Smtp-Source: AGHT+IGji8X4JW99D82J1gNUv4VGOe8Di1Z0iUYkFrnt5DobfIi0K1SZsszK6YCNFA/kxOX0YVJuVQ==
X-Received: by 2002:a17:902:e80d:b0:220:f069:eab4 with SMTP id d9443c01a7336-221a0ed87cdmr259370375ad.22.1740428768763;
        Mon, 24 Feb 2025 12:26:08 -0800 (PST)
Received: from x1 ([97.115.231.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb12e4casm7009510a91.48.2025.02.24.12.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 12:26:08 -0800 (PST)
Date: Mon, 24 Feb 2025 12:26:05 -0800
From: Drew Fustini <drew@pdp7.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: thead: clean up clock rate
 setting
Message-ID: <Z7zV3Z8L6PQCLKnC@x1>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_122610_579904_599C0EF0 
X-CRM114-Status: GOOD (  14.43  )
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

On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series cleans up the thead clock rate setting to use the
> rgmii_clock() helper function added to phylib.
> 
> The first patch switches over to using the rgmii_clock() helper,
> and the second patch cleans up the verification that the desired
> clock rate is achievable, allowing the private clock rate
> definitions to be removed.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 28 ++++++++---------------
>  1 file changed, 9 insertions(+), 19 deletions(-)

Thanks for improving the dwmac-thead driver. I've applied it on top of
next-20250221 and booted on the LPi4a board. Ethernet networking is
still working correctly.

Tested-by: Drew Fustini <drew@pdp7.com>

