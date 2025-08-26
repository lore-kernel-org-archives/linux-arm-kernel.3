Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC99CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e53lcb42G3RVNhjNWPFwju1PJTH1cjj9lH1MqnWkPUw=; b=A3/lNH1d0jKCJSMfFg2A5SJnbm
	kkiH3nBI/y9VSy2MBz0cC9SUEL8krSE4MpJxXZdqflfGUxwJMpMW82m/qwqgNmRzxUkbG3WsvgOXg
	oFV2TBjxhHBamB0M6rNxkTNwGHQB6h1GBwgDVER5A2iimdcl80dESUp8+PcGAVaQAidnrUdrlmT5e
	vXyQmmMqylitYwe24XNknolZVWOwXMakEm2Jl+bINv1uv0UzPWqtEvD1QlAGKpgh3fsxPnrO857mm
	ABIkLM/aPbZHCkCncbre7KwjiiTQiZ2dC7mzICa6e7FtA4ffVY7gPmatRsqUH3IlvVFGgL7Xop5vA
	eVFUDMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsUA-0000000Btuw-1PR4;
	Tue, 26 Aug 2025 12:09:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqsEU-0000000BrW2-1Nrk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 11:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756209177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e53lcb42G3RVNhjNWPFwju1PJTH1cjj9lH1MqnWkPUw=;
	b=Qy1EjXNH4oKZCtttOpgcAx7Y2QqQcZAX9LsT4ImZG7JkSxjxj3BExoXg6TOw14H4hIL16g
	pbThSRFTlrAhFMW1GYIpG4CH1gd8Pn0Fq0C1YsmmcJIebtZ0UvLOX+1PDgl5AGjTY4GzCO
	4Ky7c3IrCVcV3Zj64VGF3SzAXS3tGIw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-YMk0MiCZM4-9giISTEywAA-1; Tue, 26 Aug 2025 07:52:56 -0400
X-MC-Unique: YMk0MiCZM4-9giISTEywAA-1
X-Mimecast-MFC-AGG-ID: YMk0MiCZM4-9giISTEywAA_1756209175
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e870614b86so1878520885a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 04:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756209175; x=1756813975;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e53lcb42G3RVNhjNWPFwju1PJTH1cjj9lH1MqnWkPUw=;
        b=nhX1qrwpCWloTXH01kysPfr1TTkiA15aK08poC5npQBBKrsHNl14MCUsoqs9M06H0p
         apAXyIFtqLfYYER6GUsu/Q4an/bi6gegNB0Bd3+Ibcxbl62Bll2aqhazAII9M/jUEzN4
         +kByMCZ4SAUxm+E7gerMtKPfiN8xzjn5YUGcjqg6Ed9maWVbDxa6BmuNJAj3E5VqCyyU
         Vs9LcyvMtMcytdrnvtSeimotKSzZTCf9k710Mik7V0fvaM8nUHeEGv73FW4vMjuihsv2
         ftXOdOqThgCyKQvCyHuGO19JqoHfck3y1qWUB/0Ax+x3KONKepJf0r7rPtVYkn7yE5hE
         vMkA==
X-Forwarded-Encrypted: i=1; AJvYcCX33y8Jg+dcPbyI04e1kixbLmfugzrlusTpA1lqMv7JWc2TWUomvJIrUBUSbXtne8CvoGPWmWGEuYypzuD8Oofj@lists.infradead.org
X-Gm-Message-State: AOJu0YxFlT3nmBedM/yCqu6lTRPbSzGLB1qyn881KgRLHmhKL7WXs/zq
	I8F0XG2BX7Oh04M9/TPeHWil4Km3LI5HcDL/J0L5LsT+xLanDFWzaDYw/fMlm3iDTWDMJAbdeiF
	ITpMGTbqSXULmnGhMx21FoNvOlDnJJp5eoYXmIRhxJAEWfHcvArNl7Q7abUVdfnpM/72WSAC7SE
	dienjpS7Zu
X-Gm-Gg: ASbGncuTjkba+77VGTC7DZ8bA9jm3VWBN4A1rwzsav7ChRB+pbB5DIoNf8Jr3qmpxET
	pWossDbPIR05CxxOQh3oTEVZWxgoAo7ZkhWq3ruzqAfKJjlBKU4U/GO0ZpvwSZfA78eCst85tLt
	FG2j714Ri/ul0Wa+wmMuIuY+Cv45nOF5dkEirUYpNU0qE2+AD1Fpuwo5/3BQYGnbIuqEtGY3y7C
	u4Kgnda684dPir2xG0X+02j8/Wi8/diDK3FFJu5qtOPAf1hmjRto/WzKAkpIzZ9uVvGnLjhpt1r
	1rtIe6BBuI6tanxLnXNAYr0mdgpE/hjHJq/rMZQUWK2tml3fRRmpTrZiIBWUCf5kwTJY9C3RgoD
	kgIk5WeUYHfoOO4BbDDA=
X-Received: by 2002:a05:620a:a903:b0:7e9:f81f:ce91 with SMTP id af79cd13be357-7ea110a5fc6mr1545014385a.83.1756209174545;
        Tue, 26 Aug 2025 04:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEES/HvFR76larcT3Nn6nir0QLpsUJq2+C9kWe3HGsFZh8ETnB9k+QXuGo4sEteZ1xDZAs8Sg==
X-Received: by 2002:a05:620a:a903:b0:7e9:f81f:ce91 with SMTP id af79cd13be357-7ea110a5fc6mr1545012785a.83.1756209174056;
        Tue, 26 Aug 2025 04:52:54 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebecb1825bsm661572385a.10.2025.08.26.04.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 04:52:53 -0700 (PDT)
Date: Tue, 26 Aug 2025 07:52:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
	linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
Message-ID: <aK2gE0CysSWisFwB@x1>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1>
 <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
MIME-Version: 1.0
In-Reply-To: <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CwLArRjvI3blReLLtUPhOm5lY2J6K9ENAdcOE4t3tlw_1756209175
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_045258_442918_633347AB 
X-CRM114-Status: GOOD (  31.21  )
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

Hi Claudiu,

On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
> On 8/25/25 20:05, Brian Masney wrote:
> > On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > This series disables clocks that remain unused after resume.
> > > This is necessary when the resume process is done with the help of the
> > > bootloader, as the bootloader enables various clocks when returning from
> > > resume.
> > > 
> > > On the RZ/G3S SoC (where this series was tested), the bootloader enables
> > > the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> > > 1 is unused) and the clocks for a serial IP (unused by Linux).
> > > 
> > > Testing was done on the RZ/G3S SMARC Carrier II board.
> > 
> > Do you think that other boards would also benefit from this change? If
> > so, what do you think about putting the call to register_pm_notifier()
> > inside an __init block in clk.c so that this same change doesn't have to
> > be implemented across various clk drivers?
> 
> Yes, that was my other approach I was thinking about. I wanted to see how
> other people consider this version.
> 
> > 
> > Alternatively, if this is board specific, could this be fixed in the
> > boot loader so that the clock that's not used by Linus is properly shut
> > down on resume?
> 
> As a result of your request I did some more investigations on my side, I can
> say that, yes, in theory that could be also handled by bootloader.
> 
> I can drop this and try to do it in bootloader, if any. Please let me know
> if you still consider this (or the variant that implements it in a generic
> way) necessary.

Personally I would go the route of fixing this in the bootloader for
this particular platform.

If this issue affects other platforms, particularly across multiple
SoC vendors, then I think it would be worthwhile to have a discussion
about adding this functionality to the clk core.

Brian


