Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C368C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdyMVZL/XoIjJIfSF6odz91zKn6v5csFVreIdNGqfRc=; b=ojwQhJDs9ebVG3dcgmwLj1+vEK
	QyF30+FzIvqxfoNgV84MDThuT20us+oIf6o6V4U5Vcy9MmBpaD/Te++os1XnepfTKTFcym1eZbyUy
	idB3RRyo8kPfRA36K0HEB4lBv1NQ6Lc6KnkdlZXXrrJHUKLJ+3USiNCw8B5bSwF4udCcLh9ldCarQ
	7pfebsNQA6jl30XPLOGaRlR0Nt3QfRlfEsmmDCJ43nzLfHtn1ZHGpxRU1EZ/dDrm8agPr9r0TEugO
	aKJKCBWPP5wF0jL1FvOrK0CgVz/SexRupTCmOzlPYRhIKqdnSULMeIXP5nc7kWoXQCdXZHHqG2Kc6
	YDwYqn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvyqL-0000000HRQ1-40NH;
	Sat, 22 Mar 2025 13:24:53 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvyog-0000000HRHi-0fUc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 13:23:11 +0000
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id c7ad57d1-0720-11f0-95fc-005056bdd08f;
	Sat, 22 Mar 2025 15:23:04 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 22 Mar 2025 15:23:01 +0200
To: Andi Shyti <andi.shyti@kernel.org>
Cc: sven@svenpeter.dev, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Message-ID: <Z965tVhC5jxy1kqZ@surfacebook.localdomain>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
 <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_062310_348665_553C3599 
X-CRM114-Status: GOOD (  10.42  )
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

Thu, Mar 20, 2025 at 01:23:25AM +0100, Andi Shyti kirjoitti:
> Hi Sven,
> 
> On Sat, Feb 22, 2025 at 01:38:33PM +0000, Sven Peter via B4 Relay wrote:
> > From: Sven Peter <sven@svenpeter.dev>
> > 
> > Add the missing register bits to the defines and also switch
> > those to use the BIT macro which is much more readable than
> > using hardcoded masks
> > 
> > Co-developed-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Sven Peter <sven@svenpeter.dev>
> 
> Just this patch merged to i2c/i2c-host.

This needs an update as well. The proper header for BIT() et al. is bits.h.
bitfield.h is for FIELD_*() et al.

-- 
With Best Regards,
Andy Shevchenko



