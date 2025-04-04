Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52243C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wvx3/faxM+zrMKIUWbUE2IQpkaQceyUHFy7PAVRxfQ=; b=zJTI/cMDoO6FGzgClwb8/aNbD5
	URUq3ei7L8sMcFcdSLrklSZnZ5H3oFBKv0NWouVEWOFTYwoNbUO1Pw88GR0nT5Jt18pU3ewMI/sjL
	hNUxVbbkmieq7SzckAqyEkbhfvM25zvyi+9/vQjeqwF9RhFJgmLqFoUZx9nwSHXIKGNIAJO3QBuN7
	kxH0T4Z3HBdd97SyLn65BgdxrYC4WULqKln8b6kVbLCKN9yMHmELK/ingrnnAwbiKdDxLAnzJG7SW
	1uhJqLAV8uXSqTC00IilPxzi4x4JqQ4MYTfYzf4ufBXnYVw6Tt/euzdp147n3pZeA5nG8S5XrhL7T
	HnFjqwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hiS-0000000BwZf-074K;
	Fri, 04 Apr 2025 14:08:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hZQ-0000000Burr-0PXA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 13:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80F8AA474B9;
	Fri,  4 Apr 2025 13:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99C1C4CEDD;
	Fri,  4 Apr 2025 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743775135;
	bh=pjbR2oy4MEVD+Xk/Xm1QPe81N6K7y4Fo/TP5+T2tFHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMlFGb5GTBXgtAW1+GkgBPXDMXW6Dck/Dypw4CpaboAcsfiEI5FM0AcznQdmlIHhJ
	 IC2QusyqYAsZzokNDpneK0U9DytGOP5nfxxIXRkQ09tetjpl3afkQlWDzzfQwT8Y+E
	 K9HMjzHNHX831cy9o9cGssAxBwmYrSc6xnxPvkrHHLkGLo8suaCOKD4U4DKUr7JQ2T
	 ytveJh22O5hz00GEbTRU9OBUpRq55bVQ6AXDscGkihhAwUfwq1WGlR+v2DLFWMj7tv
	 P703owfrY2bxYbU14xLTNplE2R8RlAoDzYFgdI0npIpK465n1jYXL44CQZewG+We/g
	 Q7Ll5cURWccUg==
Date: Fri, 4 Apr 2025 14:58:50 +0100
From: Will Deacon <will@kernel.org>
To: Angelos Oikonomopoulos <angelos@igalia.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
Message-ID: <20250404135849.GA29860@willie-the-truck>
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
 <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
 <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
 <c5d835bc-883d-449f-afd3-16a09e418e1b@arm.com>
 <D8V6FN8TF5IK.DV6F5X5L61V@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8V6FN8TF5IK.DV6F5X5L61V@igalia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_065856_195655_5A1D9971 
X-CRM114-Status: GOOD (  11.87  )
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

On Tue, Apr 01, 2025 at 10:58:48AM +0200, Angelos Oikonomopoulos wrote:
> On Tue Apr 1, 2025 at 10:22 AM CEST, Anshuman Khandual wrote:
> > Makes sense. A small nit - just wondering if the following restructuring
> > here would make things bit more readable ? Regardless, your decision.
> >
> > 	if (handler)
> >         	type = handler(addr, instr, regs);
> >         else
> >                 return 1;
> 
> I went with the original formulation since -- to my mind at least -- an
> "early exit" idiom feels more appropriate for something we found we
> can't handle. Could work either way though.

What you have is fine.

Will

