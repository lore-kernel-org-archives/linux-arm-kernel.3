Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46F1C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ffI7ELCJU7nRGshcHwyrN09W4Ca8x2m7UfWZqlGMYM=; b=wxC7VCztVZ/ONvoKp6iiRMXSSl
	C9gEpSFTX9fSN+qAWix2IhyoUbMAh2fxANyl97Gwrffxc9soDmXZLBHCrWliSul89XTXadbuDkgs9
	7HJAAlvp8w9CLVLTJzii/LlGZhKk4uPwclrdX92vulbwV7ecoMdf5Nei03jfGXdFINp3QTHt34nVl
	YQOoyE9sAVHHjYWYCBnzzpfISM6VqWdPcHN7MGbkG1GDvv/A54R6AHaxCie6t/dRJCBM/SFOtWzZf
	rNywEy1kw/9GQJxt5i4aYKJnQAMkkMi2MYPYLfBoFSRjRRm67yj4lsN6h/+Uu/DwYXwpqtu/5p/1B
	NVqOlvgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnI87-0000000Gkp3-2FcB;
	Fri, 24 Jul 2026 15:48:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnI84-0000000Gko0-0KAT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784908081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ffI7ELCJU7nRGshcHwyrN09W4Ca8x2m7UfWZqlGMYM=;
	b=YLbDWYdx+cHL6smdObAIFrxkUx4C753z+rtWyccWosDkR9RsqqNT1zuU1JTSmnyt2/Q9wN
	h/7wIz1+2mYrTAQv6x7ni1Ku4NxVV9nZdQ0fngISoutp0tF06ukMus4dyU35TwS+M+r1nD
	IAvIPJ2UznKEoQtb/SxkXija7eVuHiU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-imru31GeO5qESO3SiT2EOA-1; Fri, 24 Jul 2026 11:48:00 -0400
X-MC-Unique: imru31GeO5qESO3SiT2EOA-1
X-Mimecast-MFC-AGG-ID: imru31GeO5qESO3SiT2EOA_1784908079
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e53b8a302so84030685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908079; x=1785512879;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ffI7ELCJU7nRGshcHwyrN09W4Ca8x2m7UfWZqlGMYM=;
        b=giQ1TXsVNQRbaGncVrjcFyMGoOXvvWiMZsw+zVYm9i6zv6TPHAqeYyDIM6jKraOTzQ
         yPHGrtjGHqRJzSv99lRhXZfDrRZHBwgVFXxY/AZfIk11CzP2Q1NfsELMXrdKUocvovlI
         wy9Hn6EsUGtNZcf1vjZ+S4+Tvdq8xMxBK3cJjHDNRpgydf/B/DNn9ZxVafZ+IGoHxBLm
         Vx+H7IcRwuTNfiPj+yui8EanUjhT2b/9SY+Nj2K9OLOpIWw3NF3X8e5qZLMjiyYR05d5
         8mtRU+4STjQIBnLYjpaGfXniYSLOQtgpQi4BnFNOqEmBgd+S+3f219itYmrGolNC/XII
         FCqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrn2AwMg9+Lh7ft/x+FWcudtr97wGDlr5LsOurD4d8u5JJrotwugyXsPAfAQps67GPFDYYhXYiXlUS3XHbVdNQp@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ/qab8oCUJg60IrutJliR6zKtOvXNSYe+ZxbPzy8euYZPeJCa
	tNHMAu2ZDg3brcArSxKpQLo3dSqE2k/q4zOVHSDQ6+j2S/sqJWOjoi4zhgW/JCvgTt2eQ/HTg6u
	VyfxIx2Jby8UDgr+9SRDPpgbCbQoYvV4NdqfSuoc8BwN/NE07Irw2MYBuO2hFGpaWt4zqVjqtHX
	hF
X-Gm-Gg: AR+sD12+ZcGCv7M93BgyOKXH/yBi5p5ybXYg2ca03zU1BVd2OWWLIjAJbALNUC7kkNB
	RTyCNfyrhuHIhloAJOrYCXa/XXAi9+2Sn2O7VBW6/ySj/t9C1dPCdQt8kDLHKlN6AQttwfQ1v5N
	iAiwBUx1j+CTyXQ+G+elMTmtShcp78NpCyHuF4TJwYhirHN6mFA66vAAusIfBNi1Cd8Qy32VBXF
	z69qAyJdUHy1Y+80HOkrdELYTTRAgxCbnVYPOmzhGOxl9H3YB26dkE4NUje0s0UPaakHzTd9XMt
	04m5kJpNmPp+ByV0ueN2FCJiSzKX9dhzuSc12NEwhzvoz49N3yl42fAG4tlQromuCbV7asMI3/a
	p7cP0uOK8nfqawy8DCEc8Mmu9GvXjkgzdwPE=
X-Received: by 2002:a05:620a:4690:b0:930:b4f9:f327 with SMTP id af79cd13be357-931038a7d95mr809455185a.33.1784908079159;
        Fri, 24 Jul 2026 08:47:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4690:b0:930:b4f9:f327 with SMTP id af79cd13be357-931038a7d95mr809449885a.33.1784908078506;
        Fri, 24 Jul 2026 08:47:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6ac3e5esm670750585a.47.2026.07.24.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:47:57 -0700 (PDT)
Date: Fri, 24 Jul 2026 11:47:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
Message-ID: <amOJK32FN5sNIGlA@redhat.com>
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
 <amIn3DO_65uyItS_@redhat.com>
 <1jbjbxd4fk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jbjbxd4fk.fsf@starbuckisacylon.baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3G0gUQy2gOqt7MqbIkaSpARyFRM9qCRQOcI0pHUFPw4_1784908079
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_084804_214639_668C017D 
X-CRM114-Status: GOOD (  43.59  )
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

On Thu, Jul 23, 2026 at 07:03:11PM +0200, Jerome Brunet wrote:
> On jeu. 23 juil. 2026 at 10:40, Brian Masney <bmasney@redhat.com> wrote:
> 
> > Hi Jerome,
> >
> > On Thu, Jul 23, 2026 at 03:00:51PM +0200, Jerome Brunet wrote:
> >> clk_hw_get_clk() lets a provider get a struct clk for one of its own
> >> struct clk_hw.
> >> 
> >> When a struct clk is created, the module usage count of the provider
> >> is unconditionally increased. For a self-consuming provider, this means
> >> it pins itself and the module can never be unloaded.
> >> 
> >> Increasing the module usage count should only be done when the consumer
> >> lives in a different module from the provider. Use THIS_MODULE to
> >> capture caller's module and increase the module usage count accordingly.
> >> 
> >> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
> >> pass a NULL owner. As a result, any provider module will get pinned,
> >> same as before.
> >> 
> >> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >> This issue has been present for a while. Virtually all users of
> >> clk_hw_get_clk() are affected. The majority are compiled as builtins
> >> according to the defconfigs. It is not problem in this case but it is
> >> if the configuration is changed to module.
> >> 
> >> The following modules are using clk_hw_get_clk() and are compiled as
> >> module with some shipped defconfigs:
> >> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> >> * drivers/phy/cadence/phy-cadence-sierra.c
> >> * drivers/pwm/pwm-meson.c
> >> * sound/soc/codecs/lpass-va-macro.c
> >> 
> >> Currently those module cannot be unloaded once they have been loaded.
> >> 
> >> """
> >> rmmod: ERROR: Module blabla-module is in use
> >> """
> >> 
> >> With this applied, we can get back to removing the direct usage
> >> of the struct clk in struct clk_hw and eventually remove this
> >> struct member entirely.
> >> ---
> >> Changes in v2:
> >> - Update comment in __clk_register()
> >> - Add missing documention for the new parameter of clk_hw_create_clk()
> >> - No functional change
> >> - Link to v1: https://patch.msgid.link/20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com
> >
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> >
> > This looks good to me. I'm planning to send Stephen a pull next week for
> > content that I think is ready during this development cycle, however I'm
> > not going to include this. I suspect he's going to want a kunit test for
> > this and I know it's going to be complicated. My suggestion is to post
> > some kind of rough test scenario for this, even if it's initially not in
> > kunit. As I get some spare time at work, I can help you to see if we can
> > get a kunit test together for this.
> >
> > Brian
> 
> I understand but I'm not adding an new API, I'm fixing a real problem in
> an existing one in the kernel now. The related API is already used in
> some kunit, so there is some coverage already.
> 
> The problem was known (as the comment in __clk_register() was showing) and
> there was no kunit then ... so it is a bit strange to delay fixing the
> problem because there is not kunit associated with it now.
> 
> That said, I'll check was I can do. acutally loading and unloading
> module in kunit does not really feasible. Maybe poking the owner
> field with __clk_hw_get_clk(). This is not really supposed to used
> directly (which is why I did not add the documentation around it)
> and it's bit fake but I do not really a way around it.

I agree that it's fixing a real problem, and also agree that a kunit
test for this is likely going to be nasty and overly complicated. Let's
wait and see what Stephen says.

Personally I think we merge this right after -rc1 is released to give
time for additional testing in -next.

Brian


