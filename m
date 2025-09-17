Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3752ACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MPp9mvjRQ3LKkWTe5ANeWphDNzNCcQyTak/yvHDjd4=; b=ENuH8tQngM4S3p
	6x0qzqUccqkw4xXqmpKCGALtEbAdOBEQ4GhjhtenGkduCU9pk1+jPKosTY9A/KojtPrijqIVf6CNj
	zaFC9eqhC8zqfwpDnfCm6mkURQrwGIfRL8P+B4PpVdUakYNxLZZcSVxjB/4uhQH1B/AsiOzCtqyHR
	J6TQIlmWXxitf0yHPG0snpFlw+a0jom+A7RKgC67lTVG7e7J5dlUEXpekowZYtCzeOXD0Z4gd5yqb
	mEYFSqgLdJ1S/DTxBbnlr1D0Tm+VqdtM1/G420/szv+rHkPBIi7xyFD1vmdE4b5qgWVP2NIK5lCrO
	v7Zb9DBw0h31T+iDWgmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyspe-0000000C3SL-2hlg;
	Wed, 17 Sep 2025 14:08:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyspc-0000000C3RV-23Bb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D730444DF8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 14:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C003C113D0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758118103;
	bh=lXCWglnUt90yI4aRsoMOta6ojCYjUYZrQfBXDrQOyNM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=KXrXHs/g1qw/613j5auhUt3GIPp/QsjHcbCOjwPwoByTRaQfe1HCwKpmUuEvRLM5P
	 ieAavHzuBLh5oRok+jpEDvm9ZuacjnuqhBa8cvZkI15sQsKj+m7VLNAXraT817uh3h
	 hKQZlNeEgDIhIMQbQ0+ezLdyb9KnqeC1GZrnxlYRZNTrP2NrXtihrDz0Q1Bu+tr9Y1
	 eMfCLYldKd/dveVkVrDggkTvfopSbs8uyofOjTe8UH9ftwYQMvOoDdEmxk2t0pQJ3U
	 AAejCD24iU+BEer8SCaDe5evgQp78RlAQ3LdRekoLNzURBMNRTvM6+d/TNxQMv1yn+
	 wuym0xuDm8ZSg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3601013024aso6922021fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:08:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXW1L5mzF0jqrfP6CPWkhpXfL6P0BpeWfKVkMDWyF0+PBv0gbyjSJdHff7nas722V/TvdacNYSj/IUj5NRJjUAi@lists.infradead.org
X-Gm-Message-State: AOJu0YwVqCNFTP3Xcny2RGGqfe85WLdS+WCLRr8ZLNoEH7Vpn4niVdpZ
	e7ZJy4XPejCuWR28glegBZ27OpRMN7+PlIZFG8WeTUiDUw4IUtWGVtIvHuGwm+JipZiaP2pjZxt
	JVnBDKtxKpmr8R5WcGNsZDWC0BA9y9vQ=
X-Google-Smtp-Source: AGHT+IGqdaQ8C9lVtjuyq3Lst//zIEIlnNEWTnnZW0oeQInZavtI2ovFzZs+fzDjBgh6Oll2QYo+R+KbyOIjgKRKfDM=
X-Received: by 2002:a2e:a484:0:b0:338:7f3:a740 with SMTP id
 38308e7fff4ca-35f6093b1aamr6295401fa.7.1758118101743; Wed, 17 Sep 2025
 07:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250913101349.3932677-3-wens@kernel.org> <20250917070020.728420-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250917070020.728420-1-amadeus@jmu.edu.cn>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 17 Sep 2025 22:08:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v640r+TwB7O+UAB9PehZ2FaXDjhVerK6j_CZ2+caJoJ9zA@mail.gmail.com>
X-Gm-Features: AS18NWACYa7boO8HaxahcwxNgufh9JCYIxjbMd7TaIvgTTRgZ9eVfnU6RZmksT8
Message-ID: <CAGb2v640r+TwB7O+UAB9PehZ2FaXDjhVerK6j_CZ2+caJoJ9zA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/6] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andre.przywara@arm.com, andrew+netdev@lunn.ch, conor+dt@kernel.org, 
	davem@davemloft.net, devicetree@vger.kernel.org, edumazet@google.com, 
	jernej@kernel.org, krzk+dt@kernel.org, kuba@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org, pabeni@redhat.com, 
	robh@kernel.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070824_548734_06A68907 
X-CRM114-Status: GOOD (  12.57  )
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

Hi,

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

I don't have 802.1q enabled so I didn't see this.

Can you provide the base commit you applied the patches to?


Thanks
ChenYu

