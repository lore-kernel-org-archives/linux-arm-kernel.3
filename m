Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78CFC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wzHy4GGgwjSgAzR89bESu8LY+9ZKD6G/mWgi+mdvLw=; b=Zy+jbGQYI70FVk12EXZFW1vP1e
	MNPEHTesbFgsdz5LPcKBOVwPqBChqa+nHRH3NPop3WvYeId5FSLDIfTHyKG+ZVE3p+YaMKMaNMzzf
	ghN4Ax4iro+fZFKBCK8nBLsZtN+nR74CzBJS8cGYHsOF3umhyNgj9z4IZi4oU9IFK1+z7VS0Y5bcg
	kt8NJuYKvN2rCow2zlME57ABERKC2cdBETQSVnSX9bu5d/Wx32AjGEmtPOnx7JQCvbWmLM9NpnBw8
	nH4EC8YgWk+7gGFuy89RqAiXaBBIbRJHop1d7n32PwXyJnq8nN3wOBH7MtANDAH3watv2639pCUuw
	sr5a1DcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkk-00000008aWB-1iZb;
	Thu, 27 Feb 2025 19:41:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhTU-00000008Bp8-2ZUU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB5B15C4901;
	Thu, 27 Feb 2025 17:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078C9C4CEDD;
	Thu, 27 Feb 2025 17:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740676503;
	bh=mk/mubO5LSKwfY0cYtZcfLEJxgXni56oyX5lS8pUi5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gC6bXiBWzvbGXtelMxi86GmfaIgANbAHdg/8mTwHMDZWCxoMJP3mPx9HVVqnEEnU7
	 8/h0ftM+uiHUfhiduzNc23uueBB752KaJaOncgeGUOj0UG1jQw+4xV/KirDZh2uYaR
	 WMP/eqy5mVejKIETlUvXpp9+QZEq44T8QfkMdBGBwPQ0aYjediN+N7Vn6ZlXce9C27
	 Rggxtba/vDc+W4+v/VBvNPmOgm5QeL4TOMRGlM8/jC1Sgy1oOXsf5ljznsOMPhgf6v
	 rx5EJ16so8a8ra2agwKc4Jk/V8EVWn1YE3h4A7URXcGWZu7tc1VHR7J+Db+6JUjdNm
	 KLuRFjyWU/AqA==
Date: Thu, 27 Feb 2025 17:14:57 +0000
From: Will Deacon <will@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v7 06/10] perf: arm_pmuv3: Add support for ARM Rainier PMU
Message-ID: <20250227171456.GA25617@willie-the-truck>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <20250221180349.1413089-7-vincenzo.frascino@arm.com>
 <Z8A6FttvudR6rjzk@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8A6FttvudR6rjzk@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_091504_718593_0020A492 
X-CRM114-Status: GOOD (  15.30  )
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

On Thu, Feb 27, 2025 at 10:10:30AM +0000, Sudeep Holla wrote:
> 
> On Fri, Feb 21, 2025 at 06:03:45PM +0000, Vincenzo Frascino wrote:
> > Add support for the ARM Rainier CPU core PMU.
> >
> 
> I can't take this through Arm SoC as the DTS and dt-bindings changes
> are kept separate from the driver changes in their pull request to Linus.
> 
> I need to keep the bindings(05/10) and the DTS(07/10) together to avoid
> DTC warnings.
> 
> So the 2 options I see are:
> Defer this driver change until the bindings last upstream.
> OR
> Just take the perf driver change without the binding via perf tree
> 
> For now, I will take all other patches except this.

Works for me. I'll pick up the driver patch.

Will

