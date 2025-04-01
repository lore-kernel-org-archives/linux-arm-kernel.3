Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE31C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 02:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkxGjWUqTJOgqG7g3+8MzEadXEObhK4uaNG+f+mMpaA=; b=ugoUUdVgcCfyJtg2BCyLs41bch
	YlK/0PoxHdiazZ1GI/bPmmFVF8wvIrBYcLqbR/u/TlV70ska1Pm42enNJvzOZl0Tc+oVO/+tJYB9Y
	zaUXeXTWJc0QeQ4xGWR096Cgque12FMkQ8vVDr2lAQIcIhcSNr0LIA0O+/6VEUQSIMYfoIRiso8d8
	+axnVwyHDSZA9RzN2tIlw9kd/mRvg0/ktNbZK5/EDFttceZA61E4bxODqOFKRj70D0d86TGExpeoT
	nOvQMI1HaroOvhbIac1I37/JVX+ANu7nm3iVMWC0U/sQ7/RHB6ObVjD6dXiTjRQd1XzbmLPAPLVG+
	/Djha2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzRdg-00000001oEt-3U3w;
	Tue, 01 Apr 2025 02:46:08 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzRbu-00000001o63-38qg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 02:44:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-30384072398so6790719a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 19:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1743475458; x=1744080258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkxGjWUqTJOgqG7g3+8MzEadXEObhK4uaNG+f+mMpaA=;
        b=gvTZBctn6UeQb1fsDHOQB2myZyMTkFs7c01KfuHaH1n4bKJ4hLK5H5xZk56sH2fL0m
         usgG0gDePZf5CcbxogCfLK4PQtE55XRicDhfL+IjxC8bxLM/Fm2zzna2ld4iz/vvHJB4
         J42E2aC3H4n2YR6fV0G0aMLDnhDMtp5T+GsxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743475458; x=1744080258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkxGjWUqTJOgqG7g3+8MzEadXEObhK4uaNG+f+mMpaA=;
        b=cMJySDDTG8Jk6F4iawYTW+MRYLZYRMKpV64iZqrbo5PCAnYu19jl1n0Yio+RcRFyOq
         xWGG6RMP7RRqPrZL0z5hjmVLwnCJJmpESE53T3fqoBFLGONWR75w28Nfj7v7GOkZqrVM
         8obvjAulS447Z+KpRodqR5m8Q2SK6kUEFE+Y0dOtMMFhkR5XjbQ87UuD34OAMVJejR77
         THTEwAXcz0vFkkdqi0UupqlpsCQsaf9HyJynDRyFIU4X5LqXa/V3EsuKcWGrkQNxhVvx
         PgvgrQIm4yxaArHrbKHiB67+t/16uUuTxwev+7KTuy/xg3iIjB+Cvy0FK2VqjwtDy7r/
         Lpbw==
X-Forwarded-Encrypted: i=1; AJvYcCULoztQHS8VbPxnv0KnDzWhlmNmtCmAdOFOCMd2LVuFpLxeNAdwxDSCj6VxtrEjJr1ma8P1Eg4KrDMW+Qn+v4Yk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Hu5ErjdgcLnmpWe5BHHjCmVeoUsxGGPHjX7Viju0NsTKYOZ8
	hr7wyVeRMocfMtgKGcIf2ddHiHOlizdt7lqVg9hTpexumKfHlRSNF7dqEPY26Lb2ecrL1MTjyEH
	7bNR5VROXY4rXOuPY7yPLvIP7jxpNvdFige1QFw==
X-Gm-Gg: ASbGncuRJg9ihE0H38OgiMrGuKbb6oIqO88V4vNtvw85Fq7l2K/KleH3NyMPI1pLChl
	5ECCHOXUEv/TuNp958OAJUvLxSum91DJVyGFTZAMOnbfTHAfYMcFkle/NY/ARe/Zo6c99kw9VKJ
	8tgNpxLiV6W8g3dcvjMQd5KY4=
X-Google-Smtp-Source: AGHT+IEpFvhBi+lUM5E7CGqIh8SlOtzaJBvCk79aI8LiSy+0QDNR3/3AA4vdH3Sbx11mdSvsVtvYulswYGsuHxWrLD0=
X-Received: by 2002:a17:90b:1f91:b0:305:2d68:8d39 with SMTP id
 98e67ed59e1d1-30531f9475fmr21374158a91.12.1743475457642; Mon, 31 Mar 2025
 19:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch> <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
 <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com>
 <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk> <CACdvmAhvh-+-yiATTqnzJCLthtr8uNpJqUrXQGs5MFJSHafkSQ@mail.gmail.com>
 <Z-ssXdmRLYqKbyn6@shell.armlinux.org.uk>
In-Reply-To: <Z-ssXdmRLYqKbyn6@shell.armlinux.org.uk>
From: Da Xue <da@lessconfused.com>
Date: Mon, 31 Mar 2025 22:44:05 -0400
X-Gm-Features: AQ5f1JqL8hh66tVHnQp1H53_t8VYOq9ejOXVjyop1xdABti6QeP9kvlxkmw2sn8
Message-ID: <CACdvmAgP8iftcUumv9RrHBLLHFtQtPeRVgDVp7YkWuPsW6Ybmg@mail.gmail.com>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Da Xue <da@libre.computer>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-amlogic@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_194418_783310_9B6FFB00 
X-CRM114-Status: GOOD (  15.62  )
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

On Mon, Mar 31, 2025 at 7:59=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Mar 31, 2025 at 05:21:08PM -0400, Da Xue wrote:
> > I found this on the zircon kernel:
> >
> > #define REG2_ETH_REG2_REVERSED (1 << 28)
> >
> > pregs->Write32(REG2_ETH_REG2_REVERSED | REG2_INTERNAL_PHY_ID, PER_ETH_R=
EG2);
> >
> > I can respin and call it that.
>
> Which interface mode is being used, and what is the MAC connected to?
>
> "Reversed" seems to imply that _this_ end is acting as a PHY rather
> than the MAC in the link, so I think a bit more information (the above)
> is needed to ensure that this is the correct solution.

The SoC can be connected to an external PHY or use the internal PHY.
In this gxl_enable_internal_mdio case, we are using the internal PHY.

Sorry about leaving this out in the last email and causing another RT.
I'm not very familiar with ethernet underpinnings so I don't want to
use the wrong terms.


>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

