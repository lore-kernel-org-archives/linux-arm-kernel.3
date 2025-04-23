Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED95C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29MUPuaXMT6Tqv+/lrZv/DGF2Pg/peh1bsAa5912u9w=; b=DWHunjDMfckIPwnJPYUHq6UoFI
	MsG2Pl3M0Y6/WyPYXA5PNEYyfFfeTs5f0GWOjHiJVN3DYNZOejThW9ttf0hobMvxeZkdXSXAxOZIq
	Ja3MROtcMydKOmYhdorLuJApUPN+oi3RBUiT6ctq+5u5Afg9PsgeU2paFpH6eRLOAHAtbCzB7nsYf
	TtTCFptO6zrHl09HxM2bqy44vJuloCx/Q7UgXnHsMvh/QOGBMx0pD2mvtIzKQMTMRgDDhfVXnHU/7
	J/ZJp/Oeo0XLWqq+tiXMINPkze8E5vNio4tzp0TlveA0MWzsEoyQTbFcjC8uqXtCyh9hnPPeSvPiP
	6maRwN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YAe-0000000AKeX-3s8D;
	Wed, 23 Apr 2025 11:21:40 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VcY-00000009ma2-1x9I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 08:38:20 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZjCDM5KWTz9t61;
	Wed, 23 Apr 2025 10:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745397491; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29MUPuaXMT6Tqv+/lrZv/DGF2Pg/peh1bsAa5912u9w=;
	b=RlU4yuU56O0LRMnUN2PpwS/AKdPHjyzMyVQDVRnQcDtYtbdkvosmsd2k/sPqifJMPDAf12
	suz+7Z1/p8QsctvIHKlD6nio8UHxyuWCXt6h4+JF9F/IPG7ZE3RBOux98Fnm2+FRGRV3GI
	6/XUr+ibOMcIhOg0KpdsYgxnZyKJpKOyeWVCmYRZ/7fQQruE8EM3uPeabmN/33FAh5W7f/
	HIrLYVCo2Z2xxy9+54X1UQG8ZM/0O1MAeEJctkSakv9jw8T41u8QkM7wMbP7iej+SyCYNH
	9387k3vUd91bseLerDIFahzSCHBsesIbIGNE/V6dHpoZm6V/PaPLckyDh/KcCA==
Message-ID: <00189e0a036e1bc7af8f78cc9fa934f1ad23efba.camel@mailbox.org>
Subject: Re: [PATCH 2/8] net: octeontx2: Use pure PCI devres API
From: Philipp Stanner <phasta@mailbox.org>
To: phasta@kernel.org, Jakub Kicinski <kuba@kernel.org>
Cc: Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Geetha
 sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 hariprasad <hkelam@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Taras Chornyi <taras.chornyi@plvision.eu>, Daniele Venzano
 <venza@brownhat.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Helge Deller
 <deller@gmx.de>, Ingo Molnar <mingo@kernel.org>,  Simon Horman
 <horms@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Sabrina Dubroca
 <sd@queasysnail.net>,  Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Date: Wed, 23 Apr 2025 10:38:01 +0200
In-Reply-To: <5e20b320cbbe492769c87ed60b591b22d5e8e264.camel@mailbox.org>
References: <20250416164407.127261-2-phasta@kernel.org>
	 <20250416164407.127261-4-phasta@kernel.org>
	 <20250422174914.43329f7f@kernel.org>
	 <5e20b320cbbe492769c87ed60b591b22d5e8e264.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: b70643c1cde3701dc6e
X-MBO-RS-META: fdbqh1cy43nu4nexnz7w4uphsy83ech3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_013818_702468_BD22DC27 
X-CRM114-Status: GOOD (  12.46  )
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
Reply-To: phasta@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 2025-04-23 at 08:28 +0200, Philipp Stanner wrote:
> On Tue, 2025-04-22 at 17:49 -0700, Jakub Kicinski wrote:
> > On Wed, 16 Apr 2025 18:44:02 +0200 Philipp Stanner wrote:
> > > =C2=A0err_release_regions:
> > > =C2=A0	pci_set_drvdata(pdev, NULL);
> > > -	pci_release_regions(pdev);
> >=20
> > This error path should be renamed. Could you also apply your
> > conversion
> > to drivers/net/ethernet/marvell/octeontx2/af/ ?
>=20
> Hm, those must have slipped me for some reason. Will reiterate with
> them and the error path.

Wait, false alarm. I actually did look at them and those in af/ don't
seem to use the combination of pcim_enable_device() + pci_request_*

Only users of that combination have to be ported. Users of
pci_enable_device() + pcim_* functions and pcim_enable_device() +
pcim_* functions are fine.

Correct me if I missed the first mentioned combination up there.

P.

>=20
> P.
>=20


