Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFBDCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhYHhdpq3o9OaEYWMGamjRW3AE6EMxkRxl/8TQh1o2g=; b=p+k6eBXh/dXL3swL2kCz6b3+xV
	W2LFCMnQjY+ix1swhD67nUHKYMyCE9emJOY1hbNSauVgbxQDJV90QzuJ0XrgRg43biEzE3UcRGjff
	Oq678inyR9MxaTB4NV3fYTe7eTxxTfAYl/yeolRbAWCZRKPjlt6UteA7UvbYutp3SSpEW+Sm43h6z
	6fCIETK22pMXlCJlxjyVMlFXRG31ssBU7zq9Ko9LSy8LU4AOZb5kpSLvL2Mqq+4UObO9nd6csmxXZ
	Pok9aaeqRlQBpXS80R6rPEhhKm/mjcpOk6E1BGhxzDH7ZVn9s3dKGEgI0ZSklIWgYjZtA9zN5rNRK
	VBp+G7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPH-00000001bnz-1Xd6;
	Tue, 02 Sep 2025 19:11:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQzr-000000001Zi-1kno
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756819465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DhYHhdpq3o9OaEYWMGamjRW3AE6EMxkRxl/8TQh1o2g=;
	b=VJt/2IXJrJi+HPzkmC36rGmfXLdMxh5KQRDZw3ckznRg0zCpn9YsIifOPg+uEpA3vwvWhO
	3rinJIrP/oZ37w62qQr4cLHcBVfjZn6PwWdZjGIzde/x4oiag0n/UYxPATY5pM5xUZmHmY
	tBe/gOONzgaE+eUEB5MHORw6fQqfPx8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-XprOWJecNNm-QXRzar_6Lg-1; Tue, 02 Sep 2025 09:24:23 -0400
X-MC-Unique: XprOWJecNNm-QXRzar_6Lg-1
X-Mimecast-MFC-AGG-ID: XprOWJecNNm-QXRzar_6Lg_1756819463
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70de6f22487so96421926d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819457; x=1757424257;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhYHhdpq3o9OaEYWMGamjRW3AE6EMxkRxl/8TQh1o2g=;
        b=N6mhAfnk662rhw45WHYIUPE5QdQpPADPEX+YD+3ZtT4Y5grqg/MzvpRfemVUWFiraX
         17zmFGgeKUGgB6/rKXfWBpHMnenfYDYBWMg1lOVu7EEqQkCWjMbuu9R7hvkKECS4vYyD
         qmoCkjOMI76eHojOTU/jlxVAFFwdP+xP64BD7qYqHEt5PRUkMY1r2uDzni3YjBz4aCmi
         pwvBLD19uZP/xX+Ovv5SR5aaBuq7e6RXa3SGO38omX4LJtZJFpv5VrrP8s9abc55Wz6z
         txQVlo3vuC4GhDblw/OAwdTcGZ/AjXEMgLMSXgdq4kk1BfCnT2agWZm3XyOOzWZEQpU8
         Uh0w==
X-Forwarded-Encrypted: i=1; AJvYcCXCYUiaOWA+QJ9Id/cazW/ymJhVxioE/vZ9uVaZmkuT8cVMNptKzBFN8QEM0iR4j46EJwO9/EkEdHHc7Q/MC0FK@lists.infradead.org
X-Gm-Message-State: AOJu0YwC/nx1OK3c6i9CMYHUlH5gl3sa74aCAgHJGPijUVkjIO5YL49x
	FpfpLipmfazepxbzdewk1fowWWZjvpkaFxFYelF6sj18Snk4kkrLO4ZWzEVD1xkT+pnWmoMyXAl
	cpVnwRBe4xB6xiYkIQKn/3C0IGOlZlxxGrFFtMpmt8kxSAk5JnAeXrBrazsTFc+RsoZhN8UPX2y
	aK
X-Gm-Gg: ASbGncsCpAhAcOAW+K8xWKZUHotEA9fqQ4S76kjGn8k8dKNqx5JIduCcvkWml01crkG
	Xi41+d74fWlDjNxR06tNsdarbpH2wPsgACJ3u6A0NOQoq5amg6sNkFx4h2WUQYFbTgCtkc2S+gi
	jyjOk5EDQvVRToLdK9INEirWkxQnSphxRN2l5+8oMfQu/zZfNby0TtMY7V18VLFjNOC4qXsGaYu
	Fgqwnha4hAfCVMxDo5udjfIXJlP+1s7/5f3nY9LHGo7Zw68C65p4QmEhvU4GQYRlaMJIy/jDYWc
	XtcEaKnJNhKglo7ZPEMNbxb/bn5AGGP8hRmUjyr9KRznWlwdWC+hyJ+j0Ko=
X-Received: by 2002:ad4:5bcb:0:b0:71f:238c:1495 with SMTP id 6a1803df08f44-71f238c1812mr45372466d6.12.1756819456906;
        Tue, 02 Sep 2025 06:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2gpj5sDjHqMalc6nLErCXydSa307HuH4gEcNe0djbjrEuBMYzkPHUoJgDAmOWEyhdUzjogg==
X-Received: by 2002:ad4:5bcb:0:b0:71f:238c:1495 with SMTP id 6a1803df08f44-71f238c1812mr45371836d6.12.1756819456245;
        Tue, 02 Sep 2025 06:24:16 -0700 (PDT)
Received: from x1 ([2600:382:7727:a6e4:b49a:a295:b546:7faf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720acdff0dbsm11654266d6.18.2025.09.02.06.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:24:15 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:24:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com,
	sboyd@kernel.org, geert+renesas@glider.be, linux@armlinux.org.uk,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
Message-ID: <aLbv_FmJV8xV8hpR@x1>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1>
 <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
 <aK2gE0CysSWisFwB@x1>
 <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qNypoyAGMzC6eTtAq9wtSV-L4fA6y3bVbnaV0EJoQWo_1756819463
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062427_530316_1ABD9231 
X-CRM114-Status: GOOD (  41.53  )
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

Hi Geert,

On Mon, Sep 01, 2025 at 11:46:34AM +0200, Geert Uytterhoeven wrote:
> On Tue, 26 Aug 2025 at 13:52, Brian Masney <bmasney@redhat.com> wrote:
> > On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
> > > On 8/25/25 20:05, Brian Masney wrote:
> > > > On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> > > > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > This series disables clocks that remain unused after resume.
> > > > > This is necessary when the resume process is done with the help of the
> > > > > bootloader, as the bootloader enables various clocks when returning from
> > > > > resume.
> > > > >
> > > > > On the RZ/G3S SoC (where this series was tested), the bootloader enables
> > > > > the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> > > > > 1 is unused) and the clocks for a serial IP (unused by Linux).
> > > > >
> > > > > Testing was done on the RZ/G3S SMARC Carrier II board.
> > > >
> > > > Do you think that other boards would also benefit from this change? If
> > > > so, what do you think about putting the call to register_pm_notifier()
> > > > inside an __init block in clk.c so that this same change doesn't have to
> > > > be implemented across various clk drivers?
> > >
> > > Yes, that was my other approach I was thinking about. I wanted to see how
> > > other people consider this version.
> > >
> > > > Alternatively, if this is board specific, could this be fixed in the
> > > > boot loader so that the clock that's not used by Linus is properly shut
> > > > down on resume?
> > >
> > > As a result of your request I did some more investigations on my side, I can
> > > say that, yes, in theory that could be also handled by bootloader.
> > >
> > > I can drop this and try to do it in bootloader, if any. Please let me know
> > > if you still consider this (or the variant that implements it in a generic
> > > way) necessary.
> >
> > Personally I would go the route of fixing this in the bootloader for
> > this particular platform.
> >
> > If this issue affects other platforms, particularly across multiple
> > SoC vendors, then I think it would be worthwhile to have a discussion
> > about adding this functionality to the clk core.
> 
> How would the bootloader know which clocks are not used by Linux?
> And why to offload this to the bootloader for resume, but not for boot?

If the bootloader is involved with resume, then I assume that it's also
involved with suspend as well? If so, could the boot loader save the
state of the 3 clocks on suspend, and set them back to that same state
on resume?

How widespread is this issue? Does it just affect this board, or is it
common across other boards?

There are some longstanding issues with clk_disable_unused that Stephen
talked about at Linux Plumbers almost two years ago [1]. We'll have to
wait to hear back from him, however I suspect he may be reluctant to
expand the scope of clk_disable_unused even further given the existing
issues.

[1] https://www.youtube.com/watch?v=tXYzM8yLIQA

Brian


