Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0094BC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2Wg7ipOHS9h/7vXcm6WYoPVNqc1Nl/RvVeuF5UGJks=; b=ttvQAZFHAS+wOk
	mBuZga0CrukfHZWnc+xCf1twTNrlv3TC1FK94BlRnNUz6670FVhx65988p/o+dNwAkTp4Bn0nyATl
	41Hc9lGj3Kphatxnz67PqwK1AOPHkP92G//0zu1BVO97mwx0uOFPR3XtnAPRSouaxswX4RdDKBg/4
	eGC3Zy9iDRwrSPkNeb6eJFk8iMnMdlqv6feV7VuJeiImzVnIzCvZkwfXnN1/z23PKcBJXdFhWddYA
	xv+NWWItP6K8JoNtmdtxFDgCFbqkLkPlwNs74e12IAQoIX7cIeP5ye9Be1iqUCROh++TsdUTVsSMk
	CyH5xd4ntrRBveW4yiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjVF-00000004962-2l34;
	Wed, 05 Feb 2025 17:47:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjOA-000000047xG-2LU1;
	Wed, 05 Feb 2025 17:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=x2Wg7ipOHS9h/7vXcm6WYoPVNqc1Nl/RvVeuF5UGJks=; b=Hwr+Jud91SBpjSFPeLtAlXKcsH
	itlRjm9i6fvYd+bRbHiX8muLvxtZM9pHH0XXd2y4jWBo5qFkq/37PIiPCLm3fjsnR/qC8l+GC5T2j
	/nVuwS6ZeBiqPSYBbTFN/m18fmdMX/KB2irqp3Q2N0577gRvUHLtV6AJjVIjWP/iq7LNezseqrK/q
	D4Ax0/sfQhXGBoG3FvP3YR8s02dVbQQl8ks6+iptwNvx8BUZGanYYXEDVDAikVAbocjUfHYpNUmZe
	FjCi2HFPAx3lKSx38jG5dB6IEFXoSicgIQihKTATjkdw+2e3yJuxUlMb9K3aXb7nJ6NmwmbgNNM1+
	TKE4TBQg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjO7-0000000GjaP-2yWU;
	Wed, 05 Feb 2025 17:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDEBD5C6D7F;
	Wed,  5 Feb 2025 17:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F578C4CEDD;
	Wed,  5 Feb 2025 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738777232;
	bh=I4jW9o/4B+Z8UC6sywEnjRYy1f2QJpfv+cAZ+qa4pnw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=M+DXVKsqzuEqwi8PgguM2uouwIcSnsgTqEJs/U/Ab4o/wHhEsrjT3DkDeTfRsLxKF
	 UKf+bY9qowD5PyJTJakWcXUQNxDljxBAF0iSYLe21Y+d+0ZAqcPJix4TT/6hWvloMm
	 KQeZ4MpJai34ciLaaMamAn1Y8Kgg02hgH3DIlZdyxaP1EmXnisBBOGNpDHQJcRW3W5
	 uGXV0xZTbILmebKO+XcZXeW7G5hRbHDsNsdgMpu+M8N3qiTeztV9hI4I/GqsL+HBjH
	 tpKbyYHTdMD5GqZwtf3bp/bUy2fcmaTs4T5x90Pp4HsxkLRIFe4qLACrQghtHCDAHK
	 xOTA1hogj174Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-540201cfedbso1274e87.3;
        Wed, 05 Feb 2025 09:40:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaKZyqiM1eI1BiU6TVTQ/xtw9PExePMTVtPPPC88oH+EZ0/qwd6FYQ1SlznC3m8yNh+s49tTLq2CwKqsQTZfw=@lists.infradead.org, AJvYcCXUHfujXfXSNpn+9sYh7HhaWTB6cTYQxeuUh9tMtmQ+aqwXrwR0CEIzz7LgIuzjZXDlkP0S2Nh88b/ZAdc85h8L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+qC/zYNsTKyQgI3U/9csG/VE9iAkrIzm+/6349VzyanpQ3gt6
	h3CRTdg/7s3XWtWfHZdDPfEXKVlY8QTWqe+XvqxaXK6Hb1I0S8/ff3uw/8/ebU0yPSH0FD2ugYW
	pRm1LCRQW2ka4mkOIHxT1jvKBz9M=
X-Google-Smtp-Source: AGHT+IG8lhakou025la5Jappucv8WLtdehhFKE96djLZ79QU2Y1TtjR/MkLvLzNVVS5NW5nvfFdoY99dvlkSP3I4BEQ=
X-Received: by 2002:a05:6512:3e03:b0:543:e3e2:879e with SMTP id
 2adb3069b0e04-54405a7b6c1mr1242587e87.51.1738777230659; Wed, 05 Feb 2025
 09:40:30 -0800 (PST)
MIME-Version: 1.0
References: <20250204161359.3335241-1-wens@kernel.org> <20250204134331.270d5c4e@kernel.org>
 <CAGb2v641vvtVKv8QbiEfHnMWngcKYTJZAgfH5k+G_nOvZcbC9g@mail.gmail.com> <20250205173824.GJ554665@kernel.org>
In-Reply-To: <20250205173824.GJ554665@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 6 Feb 2025 01:40:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v64CZWZwC7T9NNN7Re8pkCLQZEh3bcraYjcQRyVxtJgS5w@mail.gmail.com>
X-Gm-Features: AWEUYZksuSbRuZZAzWd77ituAitD1pgvI4pAn_LVLBqoUUFzO5mWdzzigczPLts
Message-ID: <CAGb2v64CZWZwC7T9NNN7Re8pkCLQZEh3bcraYjcQRyVxtJgS5w@mail.gmail.com>
Subject: Re: [PATCH netdev] net: stmmac: dwmac-rk: Provide FIFO sizes for
 DWMAC 1000
To: Simon Horman <horms@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Heiko Stuebner <heiko@sntech.de>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Steven Price <steven.price@arm.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_174036_000755_AB53CC71 
X-CRM114-Status: GOOD (  14.84  )
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

On Thu, Feb 6, 2025 at 1:38=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Wed, Feb 05, 2025 at 11:45:17AM +0800, Chen-Yu Tsai wrote:
> > On Wed, Feb 5, 2025 at 5:43=E2=80=AFAM Jakub Kicinski <kuba@kernel.org>=
 wrote:
> > >
> > > On Wed,  5 Feb 2025 00:13:59 +0800 Chen-Yu Tsai wrote:
> > > > Since a fix for stmmac in general has already been sent [1] and a r=
evert
> > > > was also proposed [2], I'll refrain from sending mine.
> > >
> > > No, no, please do. You need to _submit_ the revert like a normal patc=
h.
> > > With all the usual details in the commit message.
> >
> > Mine isn't a revert, but simply downgrading the error to a warning.
> > So... yet another workaround approach.
>
> I think the point is that someone needs to formally
> submit the revert. And I assume it should target the net tree.

Russell sent one a couple hours ago, so I think we're covered.

