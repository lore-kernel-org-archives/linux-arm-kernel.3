Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C491BCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yn+BNDD3uVIMrlfbHqtIvEfB4qrTW1vWxSV7SfUpzfM=; b=sFXHa7qNShBLJefv/Eb+xbdn/i
	Whxt/69Q6XEDs69/dtema9+AMm92asz3w0sFKNUGo0O/tqbjxSjaQaqtgNENBc4rdUXj2xkotk+Xc
	jVU+4UBUUuo79n6BZVdUixDLH9Yc7uYzM2+iDu24q44GaUOyG3RBZheqwdBTlb/Tq02gK44gSJk4G
	I0+QqmgWLkGCcZ3X1p6zFJ6GOp7uBjG+SFdDOCp3WTK/qda1nNF1j8Q4jyrOylhvQmC6j2hYhcMAW
	YPPfKyYrYwxADL2Q9fA0VMOKGEkSNXmx+ZUIhFWljkYsy4MJ47JrguDobyeDqp3EHb0uD82+94AQE
	jcnNAxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBCT-00000007zgk-0F3i;
	Thu, 01 Oct 2026 07:27:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBCR-00000007zgQ-1veX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:27:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70DC7601FE;
	Thu,  1 Oct 2026 07:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832F41F000FF;
	Thu,  1 Oct 2026 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790839646;
	bh=Yn+BNDD3uVIMrlfbHqtIvEfB4qrTW1vWxSV7SfUpzfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2/aphZqkksPSqU/+moRoc+UVy5ITbdkRSYXR5ZLi7chDLk5ojqaffNC1+Nqb/ufg
	 wK0phOBnoqb6kh0AY/49lpEGUnfmoIkmt/PcRo+dN0l9md6pAqftJuAItzVJREdjVA
	 Uvf8uLD7XdycfIQumf51oZf7XgvgQbuDBTwUJc3LFO33Wm6IRxKUyz3Uk/EQb1IUfT
	 OZ2qtE/9XfwYoiohbcGL8TmnWJXszOmhtmZ/QNrkaDnJUkSv9NgOBRIPphSqR9NMMl
	 nIh9aGL9lGEGNXzIc8LOqx1c+HZZm6Nyf4KN4EcbxetPjXj5xwq6ZlNf5GsVpHn+nl
	 5kLi7X75MKkTw==
Date: Thu, 1 Oct 2026 08:27:20 +0100
From: Will Deacon <will@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 19/21] arm64: entry: The great stack switcheroo
Message-ID: <ar4LWGJ_qfV71_Ia@willie-the-truck>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-20-will@kernel.org>
 <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
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

On Wed, Sep 30, 2026 at 11:36:35PM +0200, Linus Walleij wrote:
> On Fri, Sep 18, 2026 at 6:15 PM Will Deacon <will@kernel.org> wrote:
> 
> > With the kernel stack pointer in SP_EL1 and the overflow stack pointer
> > in SP_EL0, it is now straightforward to switch between the two on
> > exception entry from EL1 by writing to SPSel. However, since exception
> > entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> > repurposing the overflow stack as a more general kernel exception stack
> > would require writing to SPSel on every exception entry from the kernel.
> >
> > Switch things around so that the overflow stack resides in SP_EL1, with
> > the kernel stack residing in SP_EL0.
> >
> > Signed-off-by: Will Deacon <will@kernel.org>
> 
> This patch gives me panic, and as can be seen from the review
> comments need some love...

Please can you share the panic message? I'll definitely be reworking
this based on the review comments, but if there's a bug it would be
great to see the details now!

Thanks,

Will

