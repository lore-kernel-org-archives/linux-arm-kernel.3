Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030E5C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+hizvcdqGonufv2DpcVufMd01dDompVLkD4kRlhkmw=; b=bWQt7gPuAjXgfhfGUxIHogqv7s
	y0qKZQZfNf0HRacxDLYomiUJhsK7PSnWGw0Lkka8mV2EErKkCSck8pOy+E5vZY/QHYeWgzI9xnjDC
	wUMz2DXdzuV7IpCjagR+UDfQ8WcNtZEupod89OawcRDsCf9hhiReIc0ndanBote7uM/Y5jefh1Khr
	1jiy/2HAbUL7kvrItopWIjE24obyCUMlSucbc2A3Dzv1VbZMWh3nb4gYOIXDCuwHagAvgfuUJ41nt
	2lTQ+nEJgicxJi1hA6aoAKuYCxfc4POvzL7xu31xohKB47Wvy8RfF8k6FnoIvQXnvHiAN6tGL0S2U
	PhLnNpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOVE-0000000DLKo-0rYG;
	Fri, 21 Aug 2026 12:37:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOVC-0000000DLKi-3tC3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:37:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B7B143BE8
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 12:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806E81F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787315861;
	bh=8+hizvcdqGonufv2DpcVufMd01dDompVLkD4kRlhkmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nXLJAeWUTKD79L+pbwJbn+9CpAZES2OLZcIdizQnTfVGc7TE5nSca7PXL/pw9PKf/
	 LGq4mmubFlDIVBeL8eMU7UP1U7FlEn8maKIBwxfELo8naNUDEczA+lmMYVK2RN1KGc
	 fk6SJmlxqmlWEphZ7J9geKJGaNuhl/aELbXMNGqPwM03kCQPX2lpyJhZ45nl8Ywmj7
	 cW2f4usgidgSOdwF08/Dfaza6tqjkz6iUncz9jpF89eKDMX9BC2cQae3BCIxxUxQm7
	 58IEFHenUsHZS+V0LwgN/n7ckKq2dzAK+91kJnV/MHKymRRCE25OPquEdcnZ/5Q7Uy
	 RRcifVFuUbOEA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso992992e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:37:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpP4H7vx9sLd7sYWQLf/55alZRzxp623C12QWp4YZa7yYBTH0Ukccc217LOLfq9tjV8nByV4pkOLPHwoY3maGP6@lists.infradead.org
X-Gm-Message-State: AFuF++l3EXspCXjEiAAFlTuuanPIJEhU97GIIilq40iubTgxcckfwn45
	ZG86PcTGGCsrtwDaAz/nxTw13nh8VPEoxH9PFdFYb/WpdQNVJU4wQQOPN6SK8erSFIRE+G7xv6v
	DhyJDikEgw0TPpuJcow0e1GQWapsniQM=
X-Received: by 2002:a05:6512:3c94:b0:5b2:e5b7:2419 with SMTP id
 2adb3069b0e04-5b4841e99d8mr2026186e87.5.1787315860266; Fri, 21 Aug 2026
 05:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787239869.git.geert+renesas@glider.be> <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>
In-Reply-To: <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 21 Aug 2026 14:37:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLmNWGOLdo4apkCf39Au+N=9Gjn0Uwa1xHdYU49_-x2FfA@mail.gmail.com>
X-Gm-Features: AcwNN1X-YF9gwMXQysAFmBNyelij8BztSmG4GmXtlxed1V2wjsfBBNI0pYxaxjQ
Message-ID: <CAD++jLmNWGOLdo4apkCf39Au+N=9Gjn0Uwa1xHdYU49_-x2FfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: clock: Make sure clk_init_data is
 fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 21, 2026 at 10:52=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks right to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

