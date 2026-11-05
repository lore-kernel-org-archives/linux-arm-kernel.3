Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542DB606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DVdZ6kgI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AV5U+7nJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vhaMFCmITRvdlEmOVhab1Mlft/tMQfl2s1RAannTexY=; b=DVdZ6kgIKEq6bT43puLoStDO07
	cSbWC/43Skms2CEJCJZPOcHtaVvBbQChuipVw/oJv8qLfQ7YCqX1gxmiTuMHaTdvCi/fOPUf5WjUm
	Y8wZeP3KhCjI21HmfwUkN+OjwRHARb9vn/tkE4ec7GI8itaDHEJlhO211qRN2AD96nqXkVbrHODth
	5LUTJmgRRvfQKi95GqrRfngDMrOCDsOHCsaGRifZiw0IkIfDfkgsNTqUojYk/xECB1HHmK4t0Izt8
	bUC4+L5aa3jffbV2mXplzVYT6MJKDJLUbhn1U9cPQm8/b7PjwUy0VMaQXKx7qEdg0OOPVY8n01rXf
	ciwF/QNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyDP-00000009DrH-0Get;
	Thu, 05 Nov 2026 14:13:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyDN-00000009DrA-2ztD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:13:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 765A640E42;
	Thu,  5 Nov 2026 14:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9051D1F00919;
	Thu,  5 Nov 2026 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887997;
	bh=vhaMFCmITRvdlEmOVhab1Mlft/tMQfl2s1RAannTexY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AV5U+7nJyY2hDS2LZLnNqkvzwtaZN9HFjMh+dqmA2Mn+hXgWQ5u7YfNttOsb+ku8F
	 yJe6d7FRUgxuwXotQ32bNxyonWdscEaZnLyWpTAgqdFxt+ZWsV/3QX2oJe9Jt8IxoX
	 PW0e0ndTIhwh5xG/SIdJmfKj4ioos6ViPcc+MAy4wHQunAWaghYQE9aolrOKEJl2GA
	 wArS2mKgHYmxczgrSDCLEdOHWr8E6f2CK/RfSPQxHchVWtpIUkeLGTJ7DGYGGWSae3
	 I1nu9+qeijUjVhvxpSWQ8aIJbzjfeKklb1wamfJiBVqySUQqkhu/izowr5cGY1CpqQ
	 mhelaRKYT4eGg==
Date: Thu, 5 Nov 2026 14:13:12 +0000
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <20261105141312.GL1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auyK50dqvwxIGIar@opensource.cirrus.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auyK50dqvwxIGIar@opensource.cirrus.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026, Charles Keepax wrote:

> On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> > On Thu, Nov 5, 2026, at 09:53, Lee Jones wrote:
> > > On Wed, 04 Nov 2026, Dmitry Torokhov wrote:
> > >> On Wed, Nov 04, 2026 at 06:14:29PM +0000, Lee Jones wrote:
> > >> > On Sat, 24 Oct 2026, Dmitry Torokhov wrote:
> > - if there is a reason to expect any future user of the driver,
> >   extend the wlf,arizona.yaml binding to cover wm831x as well,
> >   replace all the platform data with swnode properties according
> >   to that binding and have the drivers use those.
> 
> I really don't like adding wm831x to the Arizona binding. Fine if
> we want to create a new binding in a similar style but Arizona is
> a binding for a specific series of audio parts, wm831x predates
> those and is a pmic. Trying to combine them feels likely to cause
> problems.

I don't personally mind how this gets resolved, as long as we avoid the
monstrosity suggested in the original submission.  =:-]

-- 
Lee Jones

