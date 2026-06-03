Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EBECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 03:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0j4rLmtzrhLWc3rpCVeyKxG9qf7kIHCbWejuItKZMM=; b=1JROujr34DdhsBQcDpQzONKEeA
	D5cPcprQSvJBIfUIIWTJ3QfRKpJdz6c+aA92scnh/Y0gQNH/eGPREXglYg/65alHPuYDI3hTznjlV
	p/04nRASwdQpsddMDPCRplDjsgC199+wZrLenS6gcpb9W6pufkQnt+YVgtpcOpBJ6U2B+XNvvm8uk
	IN/9I9jIqwbucXteAajKuuaWaE7vpCvyVr6QOxGGhya3BJHNLqbXye78DiuV3lFku6oKwgLbX/Neg
	ipOyZ6IsgYgkRrZqUGPItlRzu5soFlBuUgxwp/9egv7JRfOd7mWxKVZngemo/fE0tZqBR4b+QpUuO
	TUTyev2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbzG-0000000E9k3-2Cpf;
	Wed, 03 Jun 2026 03:09:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbzD-0000000E9jg-3PMR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 03:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=x0j4rLmtzrhLWc3rpCVeyKxG9qf7kIHCbWejuItKZMM=; b=fz
	WpKg7bQu8hQh1vAlENI5v0u5giorXinp8ibvnHTbE7sm1XkVVxiLvJqTocI0ARJuIUGzDb3NE84sT
	+RMLdVX17rRvgdjpNSh7nNR49ElW+pH8FaUz6Vg6iQWtaZ9ynnoATGZBv5X0GYqVuB2sL86+teP7z
	YHXzeoxzeX68SMA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wUbzB-005oYg-LU; Wed, 03 Jun 2026 05:09:41 +0200
Date: Wed, 3 Jun 2026 05:09:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: devtree: Fix /cpus node reference leak
Message-ID: <b6764a7b-d288-486a-9feb-a7c6fa41d777@lunn.ch>
References: <20260513205720.638900-1-dbgh9129@gmail.com>
 <CACrCO_WA27igaDzS5N_Vi3oxjSe3dvv8iLG3OLS_ZJ+NxTw4YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACrCO_WA27igaDzS5N_Vi3oxjSe3dvv8iLG3OLS_ZJ+NxTw4YQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_200943_852723_D2BCA673 
X-CRM114-Status: GOOD (  12.48  )
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

On Tue, Jun 02, 2026 at 10:54:26PM -0400, 최유호 wrote:
> Hi,
> 
> Just a gentle reminder regarding this patch.
> 
> I would appreciate any feedback when you have a chance to review it.

You are more likely to get comments if you repost the patch.

But please think about what you are fixing. Is it theoretical? Is it
old code which has been running perfectly well for 10 years? Is it
something really early in the boot that if it fails, the machine is
dead anyway, so who cares about a minor resource leak?

Are these patches actual worth while?

      Andrew

