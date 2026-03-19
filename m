Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B41090237
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyGuqsLiHr94UkB4qhqgG/5xZ+KFlONUdCnW/dGUudA=; b=FejCkyPWRetsh6Dko07+xTFJOM
	f4Xi4Hst/T2OeCOIM3ZMqoh8PizoL+DJqQJV6FRR4rku5daUxlGxEY504mWk06i34DG1PI0YE1ii6
	E9vVEA//10qxmi+AwoJYfVa8hXnOrwf0GYebfSskCppy7AYDCaT5MZuy6Dlp5rqqkqVEbT1Z2+E6q
	2xWXlozhXrQGc5ORHJBq66APC1dMP/VwyTHvvtHHQHIfcmYZEHvQMrS03kDksOu0pWDHGg1KUc5zP
	0/l5AIKDQAb8/4ulmcS9fxllwTf8TtYf6N2i+RASXU2huJTOgUvfHsDUnk/k0vv24LAOmkdL9p/lT
	jhMi5IJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ErK-0000000ArKm-3rX9;
	Thu, 19 Mar 2026 15:00:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ErC-0000000ArFX-2iLz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFEAC6011F;
	Thu, 19 Mar 2026 15:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55284C19424;
	Thu, 19 Mar 2026 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773932417;
	bh=CsP+MUt4iPBk3K+rHr/Zku37K/FzDX5EqoYMT/6dn4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RvfmUv0fP1ZP2Re77fPUb/GXQjzo8D7jWEIc38AyaSZdJpxJQHg8kogIFo4y9Qr2F
	 ry2VLD6lNedLrUc15JjWWxxxAB+/LHfy5ZJay3lhJZ3QWnUREpd+5SFtJYK01SW6hQ
	 QkVpClLQdGbXoxFp7NEwtLfQh+xwDYxa79wazz1OAfI4vExg/DhOz9fESUEANouNyS
	 xwnKg7PMBjSkN9ZxuHFg6FgnA8stOY8ah2fUZlLKpPHmW8OkqaYqjWCQzP5nBkSMRv
	 yf+2DjIY8brPjHQMUaryO/pwKjpC5/GfFz8qE67Kqm7afes+i1Rb/SIMjWukmRY3bx
	 afXeZjFrQMFMg==
Date: Thu, 19 Mar 2026 15:00:10 +0000
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, wei.fang@nxp.com,
	netdev@vger.kernel.org, xiaoning.wang@nxp.com,
	vladimir.oltean@nxp.com, davem@davemloft.net,
	linuxppc-dev@lists.ozlabs.org, krzk+dt@kernel.org, frank.li@nxp.com,
	claudiu.manoil@nxp.com, chleroy@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, imx@lists.linux.dev, pabeni@redhat.com,
	f.fainelli@gmail.com, linux@armlinux.org.uk, edumazet@google.com,
	conor+dt@kernel.org, andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next,13/14] net: dsa: netc: initialize buffer bool table
 and implement flow-control
Message-ID: <20260319150010.GG1753385@horms.kernel.org>
References: <20260316094152.1558671-14-wei.fang@nxp.com>
 <20260318145452.1898637-2-horms@kernel.org>
 <3dab3f5b-fb94-4c63-bcfd-aad4268e2ac3@kernel.org>
 <20260318152408.002d1bd6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318152408.002d1bd6@kernel.org>
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

On Wed, Mar 18, 2026 at 03:24:08PM -0700, Jakub Kicinski wrote:
> On Wed, 18 Mar 2026 15:56:39 +0100 Krzysztof Kozlowski wrote:
> > On 18/03/2026 15:54, Simon Horman wrote:
> > > This is an AI-generated review of your patch. The human sending this
> > > email has considered the AI review valid, or at least plausible.
> > 
> > Why are you removing the "PATCH" part in the email subject?
> > 
> > This completely messes up with the filters and causes this email to pop
> > up in places it should not.
> 
> Sorry about that :/ We pull patch info form patchwork and for some
> reason patchwork uses this notation for the "name" of the patch
> when showing the list of patches in series info.
> 
> I'll hack up the scripts to fetch real thing from lore.

Thanks!

