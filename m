Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19A7CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GR/46E3t8O4BoEnYL7GKIwU/6ad7LoZ6u0anUZpRyoE=; b=jguoN5I2UQ7NdO6Y+3MuXV2AOs
	t3QYWH/jpaVE44FbZkPmb7nfSbtKoH2ypuV1h4765xBxT10PyTBa2VCFruZhEmFIZ0WviiPBTNSCH
	FPjE8EX5X81clWGJQD+DNk/XJVDXbRI4eD6p5UjZcZrQnuP+/wvB85r9B4EHSwF/PvHtODzOrFTMP
	NpbJckE8f8xnIR7Jly/5m3aBPZp9XZIFUvfd2pBXB2OYNDGHFHpZa6O7X5qcNGlxWcPc7HOw22rCU
	Y52MFOr2yz75OcbFYB5JyoAmiBXke01b4GrHBIP2d84Z6NlzPT8cgpNKbVy9yRvU19piOqlrQJjVx
	DmoNSVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9e9L-00000006op0-3xt3;
	Fri, 17 Oct 2025 06:41:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9e9J-00000006ooQ-1Wtj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:41:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 043E545B06;
	Fri, 17 Oct 2025 06:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B59AC4CEE7;
	Fri, 17 Oct 2025 06:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760683272;
	bh=boNVW1ZqVyp6QPqYXslzFhQnM4rFlkUnf9eUPHMVPYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjBxTQvrAfuLPNC2keww1Wt8vFoF+J+E8ZZ0BZQWAaPazcqvI4z2lHr1qsXFDTv/E
	 HZDrhFWcgHNRAyJYhFFQ+UUaT8nUdAvkG0GMPYwg4QEnDODqyjrWgO3lvvqAvTRwdR
	 /JfiPXvXBFFDP7HmxhTJoqTqyxScFrArfwBCKeH0=
Date: Fri, 17 Oct 2025 08:41:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Brian Masney <bmasney@redhat.com>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>, Maxime Ripard <mripard@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <2025101759-runner-landing-374b@gregkh>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
 <aMatZAX6eFI1RmDH@redhat.com>
 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
 <aPEZSY6RC-UVclxN@redhat.com>
 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_234113_420021_46AA0F98 
X-CRM114-Status: GOOD (  23.78  )
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

On Fri, Oct 17, 2025 at 04:52:37PM +1030, Andrew Jeffery wrote:
> Hi Greg,
> 
> On Thu, 2025-10-16 at 12:11 -0400, Brian Masney wrote:
> > Hi Andrew and Iwona,
> > 
> > On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> > > Hi Brian,
> > > 
> > > On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > > > Hi Iwona, Joel, and Andrew,
> > > > 
> > > > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > > > appended to the "under-the-cut" portion of the patch.
> > > > > 
> > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > 
> > > > Would it be possible to get this picked up for v6.18? I'd like to remove
> > > > this API from drivers/clk in v6.19.
> > > 
> > > My (strong) preference is that Iwona applies it, but I'll keep an eye
> > > out for any unusual delays.
> > 
> > This patch wasn't picked up for v6.18. Any chance this can get picked up
> > now for v6.19?
> > 
> > I'm hoping to get this merged so that we can remove the round_rate() clk
> > op from the clk core. The clk maintainer (Stephen) mentioned this work
> > in his last pull to Linus.
> > 
> > https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/
> 
> Are you happy to pick this up directly in Iwona's absence?

Why me?

confused,

greg k-h

