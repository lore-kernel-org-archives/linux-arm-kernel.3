Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF21AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oK6wtvTaEd+SXRdZypndNe+C4kPnw1fsW71LVIJ2s+c=; b=iWeKCCSig2H6oH3++sRuqrKdwC
	/tCNSui11JTHR43NdZy2RXel4VNV/X73xJG+gzjZERYsrw4TadSyiYFB6wQ6upsTZ6tC12K3lVljh
	pkxXYsRSVIH+Xndk2J0FQ8l7yD0x2MX5PraxOpC89zwffOVh/0KYw/uQFo4N2o1o/G+5jpqUeOJ7O
	2KZHQVMFccqIFnXGTp2Kw4iViq0mJVCjmEIBBLdwEg/tyzulPdAcx+aX1l0UEUQuv/q7lgMaKM1yZ
	0g6tqE7N5Lky8e5zW01qKijHeSzrP9SusZf7GPgz/kYy/yaQ/ZVyaBBj/61f1F0AVXMRPCvosc7Sv
	gKAn9X1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thU6C-000000000rj-01wG;
	Mon, 10 Feb 2025 13:45:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTpb-0000000HY4a-3aEf;
	Mon, 10 Feb 2025 13:28:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-439490f5b7dso681425e9.2;
        Mon, 10 Feb 2025 05:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739194090; x=1739798890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oK6wtvTaEd+SXRdZypndNe+C4kPnw1fsW71LVIJ2s+c=;
        b=V/dY6y/O//O4nz9rk3+ta1Tq6tkGkGl4Nj3KkpIBfb3rUKKuL0+fyvsSppZZdHMGR3
         je3eL26LlVFf1LukwnSe3w0Tacr9XhRC7NY8tqR0gzxyv3QLeVq3YfjJ/CrFS7wycyUo
         ea+2bo58q7tCmTewcICT5ZktCX1LbghU8nxPFjGkP4u0UVKj9swfveQ6KR9YSsv9r9EM
         mykxdpuu463WemZLpCjVbqm87j/WngeiVmfbUxrbYL9ya+gpX6i3SIrAWY0wT4rGejb3
         AQUPLVzeJGHFbqvKb61HfF2i8uDiQ/L9qDZIqiRzSeh01WbkZ8jfonY80Lz8vBWXUY3z
         XHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739194090; x=1739798890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oK6wtvTaEd+SXRdZypndNe+C4kPnw1fsW71LVIJ2s+c=;
        b=YGb13hSn5ENpY92PE3PThDvCTvMb1U0Q4d0DhMTIZW8jWTaY8lXjx8Tn+tJxWRKTNA
         DDQkxldvMr7TKvJAVYllG+WSnj58wXhk2yAMXTp9QK26N34D+3zcNFUn64weLjogaBH7
         Qh86kKRihi7ovQLVBcISN0hbVDpfg/gIXfx6KDEJtZKDJ9pWcQFXxclCZtFPBuBzC7LO
         vwO4ngIK1NaP/L3biABNh3jsYEUk/9oMC/IGIJnHdlu8Y7/I6WQLxFC9o8JDIC/1bAmW
         c8417+5horFVzZu0zYqKsnbAiKxlhHRqRnhcJH0FmRtfacpA+zCtQ0dg36EEX0gJ697V
         zt3w==
X-Forwarded-Encrypted: i=1; AJvYcCUHrLMnVg9cJc/RoAA5uNBAzqk1xP/uplvnV2euDsLgvHUwUnPbB+8VJVoJTG59rQvo9i+im+21qU3ve7iUj0I=@lists.infradead.org, AJvYcCXXT5ZI4jDO929GmzUv/4GGpCsI/IHx4Ok9H3gbBF1IIfw1asFlN+vJqFd1JR1YMGU3fm6BkyTDsd8BOZaZJroB@lists.infradead.org
X-Gm-Message-State: AOJu0YyMKnAl8MG3kTSz4sv5sHcPVJIpfPf0mqoU2PL8ddezqfjFCK6p
	2XdAAICcIz0zPKJA5Dy3b0cN5kfCurmVd0ESMCDqMggUW32PfJ4G
X-Gm-Gg: ASbGnctElRBZbtpmzi89vKvgthipUgQ5Ot5QMsdusbX1hIjxRN+YHti0kpi9s+w/hu4
	/9pSocFHMMMJqJ8KKbdoCgwGW34h33ZnvJi3qlIn9OAG9FZdfg4wduu+Q7d9FCPsuZqJG1Mqo8U
	+ntnnJnwbh+wNKtDnpum2EuCf2LLNEHR6gozu7lAXILKNH5bxt3cefDsNd6nKGkMuo1iqRgH5vT
	e6jm6t43/adlxo8Fmpkogo+rbejpZzYGAQO6N+wLGFM33nPWYIRb2/ZsgHfSFBmrTyD4mDKJ+xJ
	LXM=
X-Google-Smtp-Source: AGHT+IHNhPhl11CHj4a45PNKxZKnynVbzux780L09zjRvHkFs6XNbonfvQMbHlQqT/H3bN4FlF9GoA==
X-Received: by 2002:a05:600c:46c7:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-43924b5dcdfmr45242695e9.5.1739194089779;
        Mon, 10 Feb 2025 05:28:09 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5839877sm10736992f8f.3.2025.02.10.05.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:28:09 -0800 (PST)
Date: Mon, 10 Feb 2025 15:28:06 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v3 0/3] net: dsa: add support for phylink
 managed EEE
Message-ID: <20250210132806.djzhqgemh4egiz2w@skbuf>
References: <Z6nWujbjxlkzK_3P@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6nWujbjxlkzK_3P@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_052811_919220_030FA922 
X-CRM114-Status: GOOD (  18.09  )
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

On Mon, Feb 10, 2025 at 10:36:42AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series adds support for phylink managed EEE to DSA, and converts
> mt753x to make use of this feature.
> 
> Patch 1 implements a helper to indicate whether the MAC LPI operations
> are populated (suggested by Vladimir)
> 
> Patch 2 makes the necessary changes to the core code - we retain calling
> set_mac_eee(), but this method now becomes a way to merely validate the
> arguments when using phylink managed EEE rather than performing any
> configuration.
> 
> Patch 3 converts the mt7530 driver to use phylink managed EEE.
> 
> v2: fix mt7530 build error
> v3: send correct patch 2
> 
>  drivers/net/dsa/mt7530.c  | 68 ++++++++++++++++++++++++++++++++---------------
>  drivers/net/phy/phylink.c |  3 +--
>  include/linux/phylink.h   | 12 +++++++++
>  net/dsa/user.c            | 21 +++++++++------
>  4 files changed, 73 insertions(+), 31 deletions(-)

Apart from the kernel-doc thing this looks fine to me. Please keep the
tags in patches if there is a need to resend.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

