Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33858CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQaG9cgnpD4jxSGMkxdZRu0RaG5eLQZzGG2BmDtUbIE=; b=w2zcjdjOxpeXkL
	9/CBVHI1KMdxxQo/VrvCW1CtSA1sjsmZfkbt4Kt/MrDla9aE/HTjcqWc8KtaOhHt711phDK7xs7YM
	1NZCr04YGLZvcgrFnMZVzUqrDl/pEhiCd88LM9ug3mGMfNDdqR5WXPQSRFPNcuER0/YjFRRt4bWrQ
	tOFJnAjF65X1LE720z2eZPkusIaYWhoBOptKbVmKvbte38RBuAKzbLpFtFyCyLChRuy5lDKiCpWca
	1iKpOJGEnJGtn4q+61gZivM2AMil7QCoUNad2+VE2rhvCLBYIvhCq6Vh1q+uxKpbWyIy4mQhzjjhz
	JgMyeBOjLNDAhEpZFYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyv1V-0000000DAI1-2ZvO;
	Wed, 17 Sep 2025 16:28:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyv1V-0000000DAHR-0C7Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FF6F60248
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 16:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20409C4CEFF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758126528;
	bh=8WYWD+Yg3r5DNPBLtc+iIfIV8PKCZAmtTgmqbUSnjcw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=nLaotlWDzcMTfulQNPk3qQwpCoGdwW9Kcqa5cYlubED+oDPVCoj0ub+tq7QnX8XHc
	 Y1NfN2TiQphOkNi7+H9rT+5hbipIwghPNVqKexaaeAURhRdjhT/5rq1VCAIK2kDuS4
	 zlTbPQzdha+c/T8TkRDx6Kz/Op92ojdw9W5ZLOSugg+FK5l6X+E20U96G0jTl+bfMx
	 V0n6AsJsRDWwMJNn32OSP0DlDARr3uOIf9vxPBOfSS1cO4o/XTZimCwgIKbNLE7yJ7
	 AT+GenebK92wJErPQ89tXCyhNQwGdW0xDkkd4G7N3qsf1qYUZwjxgkr2cx5k4wuCtU
	 UKS1Xq0+hjztw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336dc57f562so71061fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 09:28:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOBSRmzmImO/FqEuI6SUxOkpmKOwZuDvLuVywUWHQH3boAo5vE3mmEa88PsPr029jk/WjbSEO7dxR9cbn8596j@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/fvDbdQ0jg1vD6u+uHKey9nP95Dwc7mnbqPGMVXvToVD8l1bB
	2jfZ4KiC1MPzI4s95W7uJ/5iNstBw6qGqszTz7Eg3Ui1UJ3nfWGljpPFLB7Ul7XrfgJSAuQyt4X
	SHx1g2H+xdwnV/xWtcwfbHQKCAHjgFA4=
X-Google-Smtp-Source: AGHT+IHoBsplIvCjqYj/yd32eJ5y7UncFKdYSr9f2zWqIlD/MP5kkZiUcMymkpPWIbDco8wmroHbHHYIHkrfiSTkdT8=
X-Received: by 2002:a05:651c:31ca:10b0:336:e22d:804a with SMTP id
 38308e7fff4ca-3617d39f44cmr216041fa.17.1758126526406; Wed, 17 Sep 2025
 09:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250913101349.3932677-3-wens@kernel.org> <20250917070020.728420-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250917070020.728420-1-amadeus@jmu.edu.cn>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 18 Sep 2025 00:28:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v64E+CEjnGmnnSyGhkFm=qHrpMeR+sLv_54qkmnKc1AvdQ@mail.gmail.com>
X-Gm-Features: AS18NWCQ3OVkCviedj6oOCUdjxysf8UgGXGPw_nPV7UJfZIHedYkcadQwVeRPl4
Message-ID: <CAGb2v64E+CEjnGmnnSyGhkFm=qHrpMeR+sLv_54qkmnKc1AvdQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/6] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andre.przywara@arm.com, andrew+netdev@lunn.ch, conor+dt@kernel.org, 
	davem@davemloft.net, devicetree@vger.kernel.org, edumazet@google.com, 
	jernej@kernel.org, krzk+dt@kernel.org, kuba@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org, pabeni@redhat.com, 
	robh@kernel.org, samuel@sholland.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 17, 2025 at 3:00=E2=80=AFPM Chukun Pan <amadeus@jmu.edu.cn> wro=
te:
>
> Hi,
>
> I tested this on Radxa Cubie A5E and there seems to be a small issue:
>
> When VLAN_8021Q is enabled (CONFIG_VLAN_8021Q=3Dy), down the eth1 interfa=
ce:
>
> ~ # ifconfig eth1 down
> [   96.695463] dwmac-sun55i 4510000.ethernet eth1: Timeout accessing MAC_=
VLAN_Tag_Filter
> [   96.703356] dwmac-sun55i 4510000.ethernet eth1: failed to kill vid 008=
1/0
>
> Is this a known issue?

There's a comment above stmmac_vlan_rx_kill_vid:

/* FIXME: This may need RXC to be running, but it may be called with BH
 * disabled, which means we can't call phylink_rx_clk_stop*().
 */

So maybe this is a known issue? Looks like the comment was left by Russell.


ChenYu

