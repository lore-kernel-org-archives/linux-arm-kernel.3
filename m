Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D997FCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvfYaRBOsqgg9T3AWRsCKLpVkMgeI8wkL7WYk9/VCmQ=; b=dIbC8JGfX5YCbe2xFKoX7sybUu
	LwvFaoxvKDrBWg6HcviCPA8d3qB4CT27U2YGgnzDYVDGvVW+llZrB8HmvKg/yRVtouWme8/9d0NBm
	TfUbbekLOq3GClRp5HKYTomfnrJAhOidM59zp25mz4xyoAlGJPC+6dQLVeOBWbsT+2J0abm8AqB4t
	O4JOuxpkMNH6Q1FIqZkCBpCsw7v+tJ/sGT4rngt0Q2FqJeURE6mcgx0TZgtlvvS4s49CLmrD8inGW
	q1YsXk8/y105EK86Tz7r2/vtMb9I3HglvbuP7dDVji4dVsJtirA4bkXrjmHMLb/5YUVFTmiJYc/v6
	hWGwsG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYJ-00000009AyG-1l9w;
	Mon, 25 Aug 2025 19:08:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqade-00000008mgr-01gd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 17:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756141543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvfYaRBOsqgg9T3AWRsCKLpVkMgeI8wkL7WYk9/VCmQ=;
	b=cYazCprx42BX0fEeZkwW84GGNgUABkLY1mDCwnmi253D9t9OhCu+kgPea/SbLVCWXht3+G
	+B/ERt/f/80P1uDYefXYkaaCWETy33DrQDqrZ717K/vx8xXomOzEPBwgudPgU+a3Y+eYj2
	CC5+Vb1Lr/VtSJbgImMNn09aCvC7MIc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-Imj-0ne6PyWvZA658Mozmg-1; Mon, 25 Aug 2025 13:05:42 -0400
X-MC-Unique: Imj-0ne6PyWvZA658Mozmg-1
X-Mimecast-MFC-AGG-ID: Imj-0ne6PyWvZA658Mozmg_1756141541
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9a65c18fso96241596d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 10:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141541; x=1756746341;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvfYaRBOsqgg9T3AWRsCKLpVkMgeI8wkL7WYk9/VCmQ=;
        b=hO2+BRUJYDHaOZP99wM+ahktPQpxS3oG0Sbag6Ru7ujsn8mcWZeAJuCmNwvdSu09SC
         OCbW64N5H/2MSifMOHjWr+Tnem/YxwHUOphNHN/CNk4o34nQsmlXDyqpk9ygGbX4SSSP
         b1CzfDv5HjIxugWaMGE0RW8PSh4WxRP20CkXFfNPuXtJd+EOki4ulHrHybVt1p3sR7lj
         0zlQjkXYa3llRnLUFerFYtZhvi69nJeJXnAO1O6MTbX1vYZAhx97kikfw8801iF3QooJ
         AsxGhsNZqsmytfJ/6tbYsD/lGVj09oQQPEJjoxeV5zhevy6kvF+v77+BhP4s35iL7HAV
         2tbw==
X-Forwarded-Encrypted: i=1; AJvYcCWoDVZyQL1xcsNBSk87o7qLNXSr2+JPfoKfmTR6WT2cgnjhnuiJwKRFUUKPFRbngHdQ/t+y1gxpoo/UHQyfevu7@lists.infradead.org
X-Gm-Message-State: AOJu0YxE8s3GLZLlm0YzeL9ugMm3Tj/x1eKCunt/xNFOOeuF67HLWl7A
	G7AY8NBKWMUDBxZy955FfZ8szZxkjdb9M/JOvTIn2kd7kxh85tyw47RBJ1Fq+vu3v7b04Tw0Fbf
	JLv2ZFqggW8x5mHnNBdU3EC6ZRuCOKMFY19gwX3V7fAlLOTMlgP+yJIkVPPSeoZqEDucAwsTLrr
	Hd
X-Gm-Gg: ASbGncvgwydhbKOb6ZlQbHcoOEZS0GI7f9xECBy1Lpt/TB6G7Mu7zc4DSq2nn/MSXSg
	CiFsYluOp37ZggwtpO5GFhon95AG/VcIXwf4RoL/Z8SEsHXZqxDM3yYdsYqxAU49jOnK621fVwL
	fQzgmdLd9joeOyJFB7+Ouo1MWKEIvXJ8vJQoaGCDdOwX//R/RYkFev2nYhVzpcHUN2f0n+sNGEv
	5/lYLG/OADmXJLoJNBehVkOceMg8hzd+ChCAiNH5UC01w4ppDlBbmE6EqyqNABVQLTL8jqpkXfX
	Ks4qcKie/O8n4HU5tlBzaAbkDcPPcT/Oy8/Aa4P3QQ/a5wJiHecc6aNH6ivxxEtDYu2V4yH0e8l
	sNQ/5bdd1esGeuVgV1vQ=
X-Received: by 2002:ad4:5ec5:0:b0:70d:ad2e:cedb with SMTP id 6a1803df08f44-70dad2ed081mr83964516d6.43.1756141541400;
        Mon, 25 Aug 2025 10:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnj7pgLgYj0gnzZFl+kk2EVSGRa08xMAzv363arIwLdssNid6xlYMbYTH85va++EtXnTmBAA==
X-Received: by 2002:ad4:5ec5:0:b0:70d:ad2e:cedb with SMTP id 6a1803df08f44-70dad2ed081mr83963686d6.43.1756141540665;
        Mon, 25 Aug 2025 10:05:40 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da714727csm48194826d6.13.2025.08.25.10.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:05:39 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:05:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
	linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
Message-ID: <aKyX4YJswZLuqA6Y@x1>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KXrR6SCrZD94RFgDvT2ioCQgrywXkm6EGezZgukKqzk_1756141541
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_100546_112856_5E83FC89 
X-CRM114-Status: GOOD (  18.70  )
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

On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series disables clocks that remain unused after resume.
> This is necessary when the resume process is done with the help of the
> bootloader, as the bootloader enables various clocks when returning from
> resume.
> 
> On the RZ/G3S SoC (where this series was tested), the bootloader enables
> the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> 1 is unused) and the clocks for a serial IP (unused by Linux).
> 
> Testing was done on the RZ/G3S SMARC Carrier II board.

Do you think that other boards would also benefit from this change? If
so, what do you think about putting the call to register_pm_notifier()
inside an __init block in clk.c so that this same change doesn't have to
be implemented across various clk drivers?

Alternatively, if this is board specific, could this be fixed in the
boot loader so that the clock that's not used by Linus is properly shut
down on resume?

I'm not the subsystem maintainer, so I'm not asking you to make any of
these changes.

Brian


