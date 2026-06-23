Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1177FCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feC1Xc95vHwpugGrGXRgs1T9zUXNoDWuuL7V/419NWM=; b=Y2dikw9SWGi9nnCeojUa40yLnq
	kLUjelPNuhR1saF/qwCcImpOySgnyugR1F+/gSky2sSNDl3Mf384rBB9kcGOOKnI04xEjlcCD7mSe
	7LYlfgwoYVnPRneG6B27WJfIhtMXugj6MSRwKNnTgs6UGMDI3eI5KzOwJ4vjcVll+3ztwpv+V3aAK
	fc5Lte6JWo9LROVc52xkzer9eLTAbz7j+L8nELKZQ7mukPQB5qsXf5MuJmDDon76i8wDuUXex2RYv
	1T5LfgQEfXUm5ojOrHkdEHaBZLUUyg5LgQE3wizoJz0K+jgJUZvVlfjko9xnAmwkkDZm5GakiMZBA
	K18xjcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1N1-00000006M4c-2wOt;
	Tue, 23 Jun 2026 13:40:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1My-00000006M33-31N6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782222051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=feC1Xc95vHwpugGrGXRgs1T9zUXNoDWuuL7V/419NWM=;
	b=MKK5PlhpxEPi4h8p3fs8DebNOFXIfSi+CjgjOLvlAHZj8dmRqrMRDKBtCl7prwTBvh7Mf7
	aiyx6mREvI6Rw8lavmw2uBEtvGS04/WhGdXPd7fKLl6YUOI+LpyabudB64ysnOsYFaZ7/+
	lnGDs/bj2e5NnFBNyo28Vq6PWIOHWl4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-F9YDGKPbNYS3eX7-pRNEzA-1; Tue, 23 Jun 2026 09:40:47 -0400
X-MC-Unique: F9YDGKPbNYS3eX7-pRNEzA-1
X-Mimecast-MFC-AGG-ID: F9YDGKPbNYS3eX7-pRNEzA_1782222046
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-922ff615c39so277739685a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 06:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782222046; x=1782826846;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feC1Xc95vHwpugGrGXRgs1T9zUXNoDWuuL7V/419NWM=;
        b=ioh6Or/gqp8zVvTuIhw+YPiw16Zbwdfn8hQ0fxwWF2KeKSHGy920GCpVuZkI5RJfBd
         ebOOwBYum/PJEjc3Nka6sxEnK8OgyXEZWQwQ+1hEOgvltPUOdviM9YvMUNlBjL7mJt84
         Eqw2Pdim2fPmpX1fywyuGuuXyvr1ewBTO+W3ZlYsJJfHPzlOMYh7Yiz2n6Fhpj9Tp6Ld
         EHxLxOKtl7FyfRdlFpkFajGTQ5wWt/OzNZgh+mpaetZvrwJACg7+8Co4EhHZwakgJKCM
         Zi9C+DH6JxtFCOQ/bmBymFT+7gBYFDQ8NRBKd/JAXXruEdJNHjUvqxqJc0F6te5+z2iy
         dwEg==
X-Forwarded-Encrypted: i=1; AFNElJ9/PkwImHiZ2U0uyEGRtLLDEtWCDljYiHd4XPps+PAJ3wFKHOd4C9FZ7u8RxCegKLgTZ9YoJ8juzyrYy/kGxcNp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4EYfNOtVXtcM3asDRyas00pYxhWPAUGISfR8LFyeAyEgKKRO2
	w/BhGmAD6fXqPug2zK3WDytAQCUV9srbY+eB2FOiUW5MS3oJ1QlirSnQODyX7LrkzHoZNnO45Km
	zPrYdAwm6et1xyY807bvPAKiOebTqofvRgFCCz2gsm9KsOQHnWGynHVsGrqngFzp5/1tc27AnE0
	rK
X-Gm-Gg: AfdE7ckJfmcd28JaVP0ncw/GhZ5CqKqSTXzCPJYS0vVG4laWaWIwK53WUcSHniuaaOS
	1zTg3v5cXZurJQm7GwwIaebHgOjyoGkSu6YTSVK4Xz9jRZz4lp5189diNtL9TSy8HdCWZgcC/iN
	UQLC0946wcvYPrfqgSzRgMeBuCOuQX7lPoccA6ulxUM93uZ83BHu36Ltc87oyLrL6TmglE6dP77
	0Dzhuus3gzrKMq+RocIKvyHUb+dd2kPQf5vqbG5b+z2frgg6YwPMNoqbnqkq5er0MvJLuumnGo/
	ZnSIemYD1XKsKU5mQO1Xylw7U2APGDWyW6LcIiuf5Rw/nDt583baeBVr/+YR3gu43vOA2B6e4ln
	VQcTPc5UfMxpkeAYNkm1p8pG0TfjPfVK4mdW3PZz5mjyBVw==
X-Received: by 2002:a05:620a:4044:b0:915:92f3:54e3 with SMTP id af79cd13be357-925ffbdfd56mr628783285a.4.1782222046081;
        Tue, 23 Jun 2026 06:40:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:915:92f3:54e3 with SMTP id af79cd13be357-925ffbdfd56mr628779685a.4.1782222045634;
        Tue, 23 Jun 2026 06:40:45 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018898sm125887546d6.7.2026.06.23.06.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:40:44 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:40:42 -0400
From: Brian Masney <bmasney@redhat.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: "Datta, Shubhrajyoti" <shubhraj@amd.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v1 0/3] clock-wizard fixups
Message-ID: <ajqM2m1d7-YnI5rZ@redhat.com>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
 <65e8c879-fec5-4be9-8211-8e92cf1a0833@amd.com>
 <ajqEMXmTnpOA7tVs@colin-ia-desktop>
MIME-Version: 1.0
In-Reply-To: <ajqEMXmTnpOA7tVs@colin-ia-desktop>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UebKEOW5AF1787f_MucevtFnla9ZPKmFSDjwL2pGCOw_1782222046
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_064052_825696_B538648D 
X-CRM114-Status: GOOD (  19.97  )
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

Hi Colin,

On Tue, Jun 23, 2026 at 08:03:45AM -0500, Colin Foster wrote:
> On Thu, May 07, 2026 at 05:29:41PM +0530, Datta, Shubhrajyoti wrote:
> > [You don't often get email from shubhraj@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On 5/7/2026 1:35 AM, Colin Foster wrote:
> > > The clock-wizard driver had a hard-coded 20KHz minimum accuracy. This
> > > led to out-of-tree drivers silently failing to set clock rates instead
> > > of dealing with the best-effort.
> > > 
> > > Remove this 20KHz restriction to match the Versal clock wizard driver.
> > > There also was a bug in the difference calculation that is addressed in
> > > the first patch.
> > > 
> > > The second patch optimizes the search if an exact match is found.
> > > 
> > > The third removes the restriction.
> > 
> > LGTM
> > 
> > 
> > Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> 
> Are there any actions required from me? Hoping this doesn't slip through
> the cracks.

No there is nothing else that you need to do. Stephen hasn't made the
clk pull to Linus yet. He should assemble it this week.

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>


