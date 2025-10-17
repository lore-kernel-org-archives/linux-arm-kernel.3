Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1876BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECOUsH1noeAgZRtyf60EKc9L4f4Ba1khmYrgNO6yCKI=; b=NJPcy3YAJKJlACiHWIEItnkVDf
	7SdrjpD8s+HKJ7AkAsONPWL1dzlymAc9XksC/7+H72r1dHM4GSKXEWGYcQJwig37MrJYPTCAwY1SX
	f5Q0xVCvPPzZMqvlGG0h5WQkYwhr2r4sV/HpPBCQVOGikOAyJf+aYHD9Ca4WDZF7T3m7znQsUZ1e4
	u625QwdFjpMLepV3k6pgjqBhxYRWd8SpGnHI+0F4naSUObibxMmwcZMEBsI2Wa7nzEhtLuuidOGXw
	r1GyJ/AU70uL4H6pxNXaWEUMb20Luz3PD6ECFrz+zr3WAs26QIzo9klYCBj6HMbd6/8GW1KXxaBcP
	oKJ4+yfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9drQ-00000006lK1-0OjZ;
	Fri, 17 Oct 2025 06:22:44 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9drN-00000006lIj-2Cqd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760682159;
	bh=ECOUsH1noeAgZRtyf60EKc9L4f4Ba1khmYrgNO6yCKI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hvLneN0/Px7YzZp8b/zEB/xqh4Q/3+FDAw7zlSsc4TeURYycGuPdfKTZ3AnO7n/e0
	 dhUJwk5jSVHBT5GDP00eYJSTeCx1s03MhFSu8gi1YqapD10A3v9X4qqLrAAjfvRAuy
	 BA/l/adLjPGmTQp/adoDUvyk1LN2XrKbc9KwnxIpsExPKG+Iq5DN16jA3jB6Rp1NiO
	 18K5D1Ukc3IIEOUsC8W8YSr78oGfK8XoDXz7eJKZiyv3iS8KveEisQFKdE+bXfCKZE
	 2WNy9vSuS+0oONiu+wxcoFIxwrwQyxJfVavPLlBbEFpoS5zT5TEKTvrIFQfIWZUPXo
	 /VJuozz3Mh/ug==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 73D1B6477A;
	Fri, 17 Oct 2025 14:22:38 +0800 (AWST)
Message-ID: <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from
 round_rate() to determine_rate()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Brian Masney <bmasney@redhat.com>, Iwona Winiarska
	 <iwona.winiarska@intel.com>, Joel Stanley <joel@jms.id.au>, Maxime Ripard
	 <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 17 Oct 2025 16:52:37 +1030
In-Reply-To: <aPEZSY6RC-UVclxN@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
	 <aMatZAX6eFI1RmDH@redhat.com>
	 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
	 <aPEZSY6RC-UVclxN@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_232241_757497_C76E9945 
X-CRM114-Status: GOOD (  19.62  )
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

Hi Greg,

On Thu, 2025-10-16 at 12:11 -0400, Brian Masney wrote:
> Hi Andrew and Iwona,
>=20
> On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> > Hi Brian,
> >=20
> > On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > > Hi Iwona, Joel, and Andrew,
> > >=20
> > > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > > round_rate() to determine_rate() using the Coccinelle semantic patc=
h
> > > > appended to the "under-the-cut" portion of the patch.
> > > >=20
> > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > >=20
> > > Would it be possible to get this picked up for v6.18? I'd like to rem=
ove
> > > this API from drivers/clk in v6.19.
> >=20
> > My (strong) preference is that Iwona applies it, but I'll keep an eye
> > out for any unusual delays.
>=20
> This patch wasn't picked up for v6.18. Any chance this can get picked up
> now for v6.19?
>=20
> I'm hoping to get this merged so that we can remove the round_rate() clk
> op from the clk core. The clk maintainer (Stephen) mentioned this work
> in his last pull to Linus.
>=20
> https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org=
/

Are you happy to pick this up directly in Iwona's absence?

Andrew

