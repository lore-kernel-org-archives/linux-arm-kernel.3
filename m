Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1AFC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuXIpVw3AN6OrQv2W7CHs0jNP+fGDDMEi5KNGQbu3zY=; b=aKFPZVHdzK5TGziU3Ego+uyLST
	BmBeMbEx9PEbKizUGfsnXuK57QCWpnkcmPJbRndfzUx83F9tkRiuyZxa9EPH8HpPL8cg8m5KA9WDW
	Vw5IOI/kzSw60yQEelhHNASnQw1vOsB4eluunLEC2vHBwST6clsR+04X1h072/BztlKidjgKDz7Ap
	ofaG2mZiZEiYDMBHiwskZOLmRsm4xBRALSDGXR6zZHqBdK+LRr6SWqSI7cMlTUc1L9eultU6dgAij
	FoSaQmgvk668q1vBw0/wmcEwk9Sjt0GwAENNsZ4bQ+yJ68OG5AqowuUmXsQMEsFnO0DZ6FSU+KXRk
	w9yzWewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxIX-00000005G5K-0Jp7;
	Tue, 11 Feb 2025 20:56:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwAG-000000054ks-3KcA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49A505C54B8;
	Tue, 11 Feb 2025 19:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55ED1C4CEDD;
	Tue, 11 Feb 2025 19:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739303003;
	bh=4XexGdXOFontIM3mZHXhRS5GhmgTqewPXUiq3Nnpcv8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nc45PBjvGQuGiQdegIj/KYY+yjskkhFbpH0To6q7d5/f+ptYUkoC8PP0Iy+jr0a8Q
	 /CZAR1B/5zdN0GbXuhriso1RVenKrD4zrKtAuNw5odKzhKdkFZY7PtscbyOYMiqACn
	 QLFbHf4KQmfbxRbmerlFZ1wKiG964H+y+IpD2ovHgPel/W5aX3QsID3LiWjhJHR1MP
	 eK2xKahGlO95MsKGc0kamhS7drzJ/kxK1whZ0gdQd0eFt9LiwRVX6gV0H39aVkvsHn
	 luMcrVz1P55xcjif7VDKYZe4ltCyd+1vrOyyq1ZcJLNuBAnnOoigHGpdfLMqYZAM7I
	 db76zwJNX/Eeg==
Date: Tue, 11 Feb 2025 19:43:11 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aren Moynihan <aren@peacevolution.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Kaustabh Chakraborty <kauschluss@disroot.org>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, Julien Stephan
 <jstephan@baylibre.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Ondrej
 Jirman <megi@xff.cz>, Dragan Simic <dsimic@manjaro.org>,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <20250211194311.5255f25b@jic23-huawei>
In-Reply-To: <Z6jAEEU2dqn_FJVp@smile.fi.intel.com>
References: <20250208211325.992280-2-aren@peacevolution.org>
	<20250208211325.992280-8-aren@peacevolution.org>
	<Z6jAEEU2dqn_FJVp@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_114324_923076_E526A71F 
X-CRM114-Status: GOOD (  24.74  )
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

On Sun, 9 Feb 2025 16:47:44 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Sat, Feb 08, 2025 at 04:13:24PM -0500, Aren Moynihan wrote:
> > Using dev_err_probe instead of dev_err and return makes the errors  
> 
> Use dev_err_probe()
> dev_err()
> 
> > easier to understand by including the error name, and saves a little
> > code.  
> 
> I believe this patch will make more sense before switching to local 'dev'
> variable. Then the previous one will have an additional justification as
> the "struct device *dev = ...;" lines in some cases will be added already
> by this patch.

I'm not sure I follow this one comment.
The only line that has struct device *dev =  added in this patch is
replacing an existing client->dev lookup that could have been pushed
to previous patch if this patch ordering was maintained.

For dev_err() to dev_err_probe() the number of references to dev
is the same after all. The only additional justification this patch
makes is some longer lines that using a local dev pointer shortens
again.

> 
> ...
> 
> >  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> > -	if (!indio_dev) {
> > -		dev_err(&client->dev, "iio allocation failed!\n");
> > -		return -ENOMEM;
> > -	}
> > +	if (!indio_dev)
> > +		return dev_err_probe(dev, -ENOMEM, "iio allocation failed!\n");  
> 
> We don't issue the messages for -ENOMEM.
> 
> If it's in the current code, add a new patch to drop this message and return an
> error code directly.
I'd be fine with that dev_err() dropped in this patch as long as the
description mentions it.
> 
> ...
> 
> > +	if (ret < 0)  
> 
> Perhaps, while at it, drop these ' < 0' parts where they are not hinting about
> anything.

That would be a separate patch and indeed makes sense to me as well.

Jonathan

> 
> > +		return dev_err_probe(dev, ret, "device_register failed\n");  
> 


