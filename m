Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75A2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGHIfZZg9vCV7ObhM8p6DUd8A+06EAeVw0cw3XCBIHA=; b=2TcfzK4eeA5oDQFXaIofDsXcLY
	OvvIV1MZjsECN5vskcvzqvYlrS3sUFbUl3nqURtBgFrjTxQlDZH8NpvBpYcIgDGxrXxM+Wa9qxOip
	mfAP5DsuGK2RcEhanVpC6t6majrCHxcCEHj8bpzJlnWh9EyKKocz8pfLM5YbPUJy04XrankvDy26j
	Sqtrsjkk1KEVpT9o7ze4Fz9itfOW3wXRU/lhReDcTjT1AOFG4j1cW6ERlW84c7te9IxogRJshdMu8
	shTEi3GJkNV7QydbpRNFBgME0wtnlnEhTD9xd3Ezu/3rjYTvvd4v8Zj9x9/id54MwZ/2UuM+PhzCl
	PfayO7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEyW-00000002sgn-1n9E;
	Tue, 22 Jul 2025 15:32:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDn6-00000002fZY-1O1S;
	Tue, 22 Jul 2025 14:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 795766112A;
	Tue, 22 Jul 2025 14:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B386DC4CEEB;
	Tue, 22 Jul 2025 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753193783;
	bh=lvlIsTL0552lQuywV3G4MsYNUlFAfmcSfSeYBIIh/yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ei5JrRZTyN4C5B/4kFm4mwRhz+yqyweq7Xu0VMe2JC6B36JyEJjvIhc0YpT2ob8/3
	 uIgaSeOb/sndGFzmsiBkJyC+aljVAtzdyWS/X4+aylan5gA6gM89fmmOlI1Hv+6l5T
	 FMUDpu5MUXtgb06TpotvnTRYwnOAeo49xyDNAkks=
Date: Tue, 22 Jul 2025 16:08:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <2025072218-decipher-spree-327d@gregkh>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
 <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh>
 <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
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

On Tue, Jul 22, 2025 at 03:56:40PM +0200, Thierry Reding wrote:
> On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> [...]
> > > 	struct syscore;
> > > 
> > > 	struct syscore_ops {
> > > 		int (*suspend)(struct syscore *syscore);
> > > 		void (*resume)(struct syscore *syscore);
> > > 		void (*shutdown)(struct syscore *syscore);
> > > 	};
> > > 
> > > 	struct syscore {
> > > 		const struct syscore_ops *ops;
> > > 		struct list_head node;
> > > 	};
> > > 
> > > Is that what you had in mind?
> > 
> > I missed the list_head, so yes, this would be better, but don't pass
> > back the syscore structure, how about just a void * instead, making the
> > whole container_of() stuff go away?
> 
> Yeah, that's a possibility. I personally don't like passing the void *
> around because it's easier to make mistakes that way. I also find it
> unintuitive because it doesn't immediately show you what the functions
> expect.
> 
> My understanding is that the container_of() should get optimized away
> most of the time, so there aren't any obvious downsides that I can see.

container_of() is just pointer math, but a cast is even faster :)

> But I don't feel very strongly, so if you have a strong preference for
> void pointers, I can do that.

That's what you really want to have here, it's a syscore data type
thing, that the callback wants to reference.  Just like a irqrequest_t
function passes back a void * that the handler "knows" how to deal with
properly.

thanks,

greg k-h

