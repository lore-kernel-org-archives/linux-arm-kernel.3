Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF9FCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeYmHe2krBmRJ6wb9noy1AZ7ZcEqcmhOzbisZa/Zn0g=; b=MAhxSuA8BmPA4FIEwjHDGGKvQp
	2UE8lNS4vobIXGKNnsb/LR1+EzFY07/CTqmIxuGxulKa5cyByXznSVrbpyvjWRTU96zycl4illFKF
	s4Y8PRGBGihEQ8SG3T6VeyKU6Kw7xgKgLfDlsx0qilroOoFyQh1QFCQr1S/Sh209sNstUiMzJn+5K
	l49gBqhc5nhHEyRADFnIReGlm8TBLyyubnLqjToAuaFo7MMZOVBpUSgC6pyoZta9hB4r9xL0IASQs
	TCSbsmyYdYlkYWtnNAh4/sgAhVndNEImPKLZc820K57lIFCBNoQRPvFUzoheEM8kxIJgvq6ZSCZlm
	XBlH6dfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9esb-00000006xfb-15b4;
	Fri, 17 Oct 2025 07:28:01 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9esY-00000006xfG-07WS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 07:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760686074;
	bh=CeYmHe2krBmRJ6wb9noy1AZ7ZcEqcmhOzbisZa/Zn0g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VIz76RX4NyL2/lwkpiHUBHlniXsm88NzdohT42OCC6jZRkVCnmCAm4q1QezGJxiQF
	 nqGCL0odsbY+KGW4RrQLUsHZucGbEgWn81mOIQ/51ojlQU5SXVg+kQiD4MYH9tfuBw
	 V4VNH3h6CNDZ7QAhpn8X1sYr2VmvG6QJZ/YbGgj4tBgNwhz/PEqHcPFJ/QHfFNE5T2
	 tUTed0LwGCB5RDYXq6Rukc9vgK+nLeSoCbzkVvzlDQKXStokEeve3blocwxA6qE7Fk
	 wUscGyg7liKXOBf/W1insVDfobbK/YdlbH13XkV5IuebXQoQONRTSrDd+mkDQfdWsc
	 x18V1qULiQjWw==
Received: from [IPv6:2405:6e00:242d:9743:e1f6:2067:ab3d:5861] (unknown [120.20.206.235])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 651866477A;
	Fri, 17 Oct 2025 15:27:51 +0800 (AWST)
Message-ID: <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
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
Date: Fri, 17 Oct 2025 17:57:44 +1030
In-Reply-To: <2025101759-runner-landing-374b@gregkh>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
	 <aMatZAX6eFI1RmDH@redhat.com>
	 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
	 <aPEZSY6RC-UVclxN@redhat.com>
	 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
	 <2025101759-runner-landing-374b@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_002758_587051_7F2DD6B2 
X-CRM114-Status: GOOD (  25.26  )
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

On Fri, 2025-10-17 at 08:41 +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 17, 2025 at 04:52:37PM +1030, Andrew Jeffery wrote:
> > Hi Greg,
> >=20
> > On Thu, 2025-10-16 at 12:11 -0400, Brian Masney wrote:
> > > Hi Andrew and Iwona,
> > >=20
> > > On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> > > > Hi Brian,
> > > >=20
> > > > On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > > > > Hi Iwona, Joel, and Andrew,
> > > > >=20
> > > > > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > > > > The round_rate() clk ops is deprecated, so migrate this
> > > > > > driver from
> > > > > > round_rate() to determine_rate() using the Coccinelle
> > > > > > semantic patch
> > > > > > appended to the "under-the-cut" portion of the patch.
> > > > > >=20
> > > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > >=20
> > > > > Would it be possible to get this picked up for v6.18? I'd
> > > > > like to remove
> > > > > this API from drivers/clk in v6.19.
> > > >=20
> > > > My (strong) preference is that Iwona applies it, but I'll keep
> > > > an eye
> > > > out for any unusual delays.
> > >=20
> > > This patch wasn't picked up for v6.18. Any chance this can get
> > > picked up
> > > now for v6.19?
> > >=20
> > > I'm hoping to get this merged so that we can remove the
> > > round_rate() clk
> > > op from the clk core. The clk maintainer (Stephen) mentioned this
> > > work
> > > in his last pull to Linus.
> > >=20
> > > https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel=
.org/
> >=20
> > Are you happy to pick this up directly in Iwona's absence?
>=20
> Why me?

I figured that would be sensible since Iwona historically sent you PRs
for the PECI subsystem.

I'm open to other approaches though.

Andrew

