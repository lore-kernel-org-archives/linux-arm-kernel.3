Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DFBCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW1lFRhTfd1XvPXBZZ4fZBn5mUdcZRR29Siru0Ej7Fc=; b=y6GbgXM1Toeo5XFVNUiiP5CzNq
	wfyP+rv5gqzKwYH8sDH071C+NoC7M0jBqkJ2bWB2oogFp02mVEz8FyjT2SLTUxnx7EuCOy0Ok6l3/
	aQ6cYpYqpDt8O1E5V2Q4sbxcB+WOs216WL92j7+uUn+afJca4imQmMisc8fpYZAaLpQHJsNJQywo8
	Umy/hmYhNvkhM55z7lzxteRhBjEbERlbflY/9dnVI30bVJyf7S4CquPtx3PYODVh9thENOLx8U98U
	JMENaOn+H4q1pv8tQr/ZMTu1txhvHtO9P8o8h1xtUWWES7KfBGROwSo8Guy7JvvDPtjfGxYLAIc8o
	yNNMNOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCF1c-00000008doF-43LG;
	Thu, 01 Oct 2026 11:32:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCF1b-00000008do7-0U9l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:32:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7396E60A55;
	Thu,  1 Oct 2026 11:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870341F000FF;
	Thu,  1 Oct 2026 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854350;
	bh=hW1lFRhTfd1XvPXBZZ4fZBn5mUdcZRR29Siru0Ej7Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j8lQaessvpy0Sge3/FTK04t5fXsU9wMJx20b79fxBhSvAoPBddsGQ3hHEtwLIkT8m
	 u9z33Vn2IkVC0mgn8cYj87xL8LC57fITgnHCA3D2VPwiiqYBrWAfaxMHAWAeG1+xY3
	 /Izp8FJBIV0XXc9MYdrIBi3YZOQzPOAGaWL6lgpAJy7ei4msBLXrwu/9B9xcXEd/JS
	 8DO1mG6E2/IycQa7gfpzr3tjsv6S96JYLuLRhE0ENkMy5GiGp2G/zEqDNtPNYqQPTK
	 ZREKjyVJfzzhlxPKBKy31zJZL0gUd/rCtw06Zl9obkUbYK+z2o8iItqw2JBiO+uswr
	 oNzN1ZYO8yWrw==
Date: Thu, 1 Oct 2026 12:32:23 +0100
From: Will Deacon <will@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 19/21] arm64: entry: The great stack switcheroo
Message-ID: <ar5Ex6nNxmdgzbva@willie-the-truck>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-20-will@kernel.org>
 <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
 <ar4LWGJ_qfV71_Ia@willie-the-truck>
 <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Oct 01, 2026 at 10:38:22AM +0200, Linus Walleij wrote:
> On Thu, Oct 1, 2026 at 9:27 AM Will Deacon <will@kernel.org> wrote:
> > On Wed, Sep 30, 2026 at 11:36:35PM +0200, Linus Walleij wrote:
> > > On Fri, Sep 18, 2026 at 6:15 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > > With the kernel stack pointer in SP_EL1 and the overflow stack pointer
> > > > in SP_EL0, it is now straightforward to switch between the two on
> > > > exception entry from EL1 by writing to SPSel. However, since exception
> > > > entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> > > > repurposing the overflow stack as a more general kernel exception stack
> > > > would require writing to SPSel on every exception entry from the kernel.
> > > >
> > > > Switch things around so that the overflow stack resides in SP_EL1, with
> > > > the kernel stack residing in SP_EL0.
> > > >
> > > > Signed-off-by: Will Deacon <will@kernel.org>
> > >
> > > This patch gives me panic, and as can be seen from the review
> > > comments need some love...
> >
> > Please can you share the panic message? I'll definitely be reworking
> > this based on the review comments, but if there's a bug it would be
> > great to see the details now!
> 
> Haha. I was not referring to the kernel function but the emotion ;D

Oh! That kind of panic is easier to fix :) Are you going to LPC?

Will

