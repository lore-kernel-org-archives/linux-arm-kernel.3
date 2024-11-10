Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AA3D12D59
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxdzehp9E1yxMOm96JOXj/7tzWysSA5vOI9pS4TNxug=; b=YdzEcRhQ0JJ10I4Sw7mnso49Ub
	q0tksjwAP6Au5V2D3RCXwRetd1njb14pSjPF2Smh+FDlR3hn9COEcx6CYJJ2k1qTgizIjPTaUkw5Y
	F0ezZlIdtqnDsQ9G3dkhiARxrK4jdE1QUtFJdJRPHUX3SczPDRT0CvqPKSPYDvn3yiF3TIsIl2Gye
	5v2bEF4TV/12gZ9H8ucPw5OOMFpmPG0wLk/YPdoksgGE5aWvRSqS6FnUUoQV0ww+kudnzvQkFSwO7
	fNt3gt8lVR8IOoYW0oNELcr5IkrvroIKoyGAbidEbeuBdswiajYaUmuKpEeN2d1WpaCg+FkGlITMt
	DHgcm67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAGb4-0000000FkV8-1EEb;
	Sun, 10 Nov 2024 22:39:54 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAGZH-0000000Fjza-3vz9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 22:38:05 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 9861E4C954;
	Sun, 10 Nov 2024 22:37:58 +0000 (UTC)
Date: Sun, 10 Nov 2024 17:37:56 -0500
From: Aren <aren@peacevolution.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] iio: light: stk3310: handle all remove logic with
 devm callbacks
Message-ID: <qqk4rbx6wxr7vofepk63yvuimavafbiy2srkqx2zvl2kxttlrk@axpphmdxffis>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-7-aren@peacevolution.org>
 <ZyiGiK6bSd_d0VQ6@smile.fi.intel.com>
 <mlvzaskgxqjfu6yiib2u7m3pczsifsluc4mqnzy6w3xzxblvm6@xrxvvruzftn2>
 <ZzEOqC9dAHCRX5a9@surfacebook.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzEOqC9dAHCRX5a9@surfacebook.localdomain>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1731278280;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=mxdzehp9E1yxMOm96JOXj/7tzWysSA5vOI9pS4TNxug=;
	b=JCoGsG4KLKcpc4jAcywobkNkrZK3tdmgMdqJpCz10h79Xv0fvSFkWe2uMcpRrIr5S59UOn
	urWG6uJB44+OePGrN6eLIyXkcUYf0Rn4MFnQgtS54HNmEivIPX/8PQdkOXzs6ZsbAS6b7n
	RMuK70nMMwGFCx88FZJ9flsKH8Cvf88=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_143804_191524_8CFE46ED 
X-CRM114-Status: GOOD (  15.72  )
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

On Sun, Nov 10, 2024 at 09:51:04PM +0200, Andy Shevchenko wrote:
> Sun, Nov 10, 2024 at 01:38:39PM -0500, Aren kirjoitti:
> > On Mon, Nov 04, 2024 at 10:32:08AM +0200, Andy Shevchenko wrote:
> > > On Sat, Nov 02, 2024 at 03:50:37PM -0400, Aren Moynihan wrote:
> 
> ...
> 
> > > > +	ret = devm_add_action_or_reset(&client->dev, stk3310_set_state_disable, data);
> > > 
> > > Why not simply 'dev' as in below call?
> > 
> > I was trying to avoid refactoring the entire function to replace
> > &client->dev with dev, I'll add a patch for that to the next revision.
> 
> I'm not talking about refactoring, I'm talking only about the lines that you
> have touched / added.

Ah right, this one makes sense, my comment should have been on the next
patch in this series which is a little more complex. For that patch it
seemed inconsistent to use dev only in new code and mix it with calls
using &client->dev.

 - Aren

