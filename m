Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973C4C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=; b=43RGGAo3+F2WEIljTgjptsF/Lg
	GNzZfN1fjwMXz5HdhUhysVLR9SePNZxnDoRYsPQwmZ24w6D+Bx763DWcMHT3BTAvBEtPB6pyd4QRi
	eSy97VpPGvJQaOw8phpdNBYl0FHwjpkmRWNT2fu2Y+cJpLahPLTVv+BCofIvVdyexeFOlCTGIhIfX
	T9NTgrGH07dekkzAhbPQrgX+ujtEM8rYJKRNM3LbuLeSkJ0t9h4H5TL+p1sPG8UzuZFCzLK3+qMCk
	EIQAPB14v+sKswbobQFGn0IQgYTDTaP/5BDQR117TP8sbkkB17e+XjdeNOJBkuHkAj5m3m7MxAVjj
	gdRIgYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvUB-0000000Gp9F-32a8;
	Sun, 27 Sep 2026 20:28:35 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvU9-0000000Gp8Z-31v2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 20:28:34 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so4299025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540911; x=1791145711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=;
        b=cCqrNprCTBnqCWuLMHr3dPX8L23iqta/+r0n6eHnfBAGnm4EKHGY3BvjUgXEVV242m
         +GWdVVvjwyJY6FuJfptavHlhepj4bEvj89YyWIksHawaDizLXCk8qrgqyuqsqwSjXbj8
         c5pEjCvBjzSOrEKgL8U5vqJbB79I9W7+Gsu1rfiVf/pUQMVAjSgaKn3VZHO4vq99isU/
         yTNdU5Q5aH/QJG6pCof/LXQBxRl9EGGuKNOExm/KBz0EYUs6p1UI5eVQnmF8wkPHRFnX
         O/Gz0T8vefxJulSHJM334MA8PJtu1E20UPImRBztOsWiAQq+b3Aa4lge5a0a8WqdZ8Du
         fnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540911; x=1791145711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=;
        b=i7hI6Am/g3xaukO6CL5lrx3AELDAKc5OYfShJXdwgrxakhY+NuIx+mx5je2B+23zhK
         0kBJR0VAMVJqE7wWW+AjXwHgLf1vPQI9IbznaXQtWD8/JFrdatkrMdOKRxSqFX51/QZ8
         TmjWvfHUdiiORSqcCClyH+l7aC9dHJRAorDWYKELgXagAxILC7zoVwTjSDHgnFeHvmQ8
         v8Mcsk9+TyHFEm/VTWfRj8ZbQEEqDrdpV/b8+NGbq1SK1XUU3EENy+Jy4PZqCEXOtAk4
         rZOpN60apgj6mMmp1ko5zZZ6W+IwqIshpuwR4RZ2RlH6+iBoEX2QkHI8XwZiPlqiVs/C
         mCSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg/fd2GZa1merx/neqo49JQp5xt1IDG5rVqkmQJN+Hk9r8aMUkU4EmeZ115MIGF56BLhstF6VicvALX+3uR228@lists.infradead.org
X-Gm-Message-State: AFuF++k8Wd7GyDiUnlcMsymLW+Ew+6zJAwhOx6TELbPosbU4TETTIGm7
	cygNJLmcdMeFsyJNur8/DaVrL8q5OoL4hwJhAX0iTt8rohlZ6BlppHDi
X-Gm-Gg: AYBFou1MzO99EFHKFoQk0XUTI1xEWnDQ1bA8tdoeRES03CbvI2XdFU2C2lJy1mEoc83
	lzvEG4HreM9zk//mtwcnEzYf3K4QLS/HAvXL1twFwANjPRjy954Sc4qd2w2ZMD/5eu5ALaSLzK8
	/y1zDv7u2Y9yj4kIov2R1LC1GiVkiDOLw0odKM+wFnrk9QvkE7bl0l+0/nVmRzQ6QLG9tuLo8ze
	/ayxdozpFhRTPc3xrK5drEen8PgwMjFu4UGVa6OUEvFfTfOXcQ/RIHNO4lDWMxco3CzVpn5XGRW
	H6MvqJkWuzrFcyBJs1k57SM9Nr8eviUNS5wquy9AamMBFQPQ63hpnsOQU1moyk/3lu2cLUQ2WUW
	xBsuJSgMTx6h9zMKzAb4xSbPBMXRiEFi3PFaPyW+n5jzbgD4m/bDRVMbq4tjYHrKZEKREnxCnxD
	l0GSc/ItpGiBaQWpZanyZis/gU8dKbrYegQ/RyUL1/fUVnoKa0vRXK2/locbNPrSvoiyRR6afWU
	Ir28KAaEwJReLSfc0ZfSADchl2TVqeDTeh/HdVSKMVGeNE=
X-Received: by 2002:a05:600c:1f83:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fe66c8087mr198495325e9.3.1790540911202;
        Sun, 27 Sep 2026 13:28:31 -0700 (PDT)
Received: from Ansuel-XPS. (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00571744csm17037495e9.13.2026.09.27.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:28:30 -0700 (PDT)
Message-ID: <6ab97c6e.f5ac67e6.37e70.11e5@mx.google.com>
X-Google-Original-Message-ID: <arl8aT34M7MBL89n@Ansuel-XPS.>
Date: Sun, 27 Sep 2026 22:28:25 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v23 8/9] net: dsa: mt7530: generalize and move
 common function to lib module
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-9-ansuelsmth@gmail.com>
 <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_132833_772085_173538C0 
X-CRM114-Status: GOOD (  25.30  )
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

On Sun, Sep 27, 2026 at 09:02:09PM +0200, Andrew Lunn wrote:
> On Fri, Sep 25, 2026 at 08:24:30PM +0200, Christian Marangi wrote:
> > In preparation of support of DSA Switch from Airoha, create a mt7530
> > library module and move there all the common function.
> > 
> > Function are generalized to use the reg_field regmap API but still apply
> > the same exact logic. Every function is renamed to mt7530_lib prefix to
> > better identify it.
> > 
> > Minimum modification are needed to the register header and common enum and
> > macro are moved to the mt7530 library header to permit reuse.
> > 
> > A library struct is introduced with everything required for the common
> > functions.
> > 
> > The generalization and the introduction of reg_field regmap API have the
> > side effect of permitting to clean the mirror functions that required
> > special handling for MT7530 and MT7531 based switch that had different
> > registers. This is done by declaring a common MT7530 reg_field and a
> > specific one in the Switch match table.
> > 
> > No behaviour change is expected by this change as it's just a code move and
> > reimplementation.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/dsa/Kconfig       |    4 +
> >  drivers/net/dsa/Makefile      |    1 +
> >  drivers/net/dsa/mt7530-lib.c  | 1128 +++++++++++++++++++++++++++
> >  drivers/net/dsa/mt7530-lib.h  |  391 ++++++++++
> >  drivers/net/dsa/mt7530-mdio.c |    4 +
> >  drivers/net/dsa/mt7530-mmio.c |    4 +
> >  drivers/net/dsa/mt7530.c      | 1368 ++++++++-------------------------
> >  drivers/net/dsa/mt7530.h      |  256 ++----
> 
> The number of mt* file keep going up. Is it time to move it into a
> subdirectory?

The problem as always is that mediatek directory will also contain airoha
stuff...

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

I would like to fix some trivial things pointed out by sashiko. Can I apply
those and keep the review tag? For this patch for example it's just the
typo for the multicast MIB.

For the other patch is also very trivial stuff. 

-- 
	Ansuel

