Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B52C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YH81zlJN3/rJuDofrliVkDipcnRN11lptQvHyY7qVzs=; b=sOEx2NgJwAAMIgrm7HcJAOFat4
	rCJ48tYsrS2n8+5GplvGArYWDvyR1IgRLybV2FY/vO9JXwpJVJV0iCDmmqRsjOmHUfyDXOXv0/QN6
	jlBG0BI3PTzZAdU3Tm1K8U/DY8RtMNYg+26k1S9+Yrrp558wn+OnYpvRqc49qTsGz1AXnNAEOY6OS
	Uj8pQnXxBktrlwE9QdFW9QBhJRJfH1565b6lzy1ZtTNvNgwWWhgW2ek+eLDcUZ/1mpnj899KF1q/g
	kOv62xDPbkPZg/Bz/FTdWKNiM3IorUT4uMP45GY3MT9arztvI+xUktosrf4xieeMcHAXn3jIaXnJP
	gjK8CqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpXw-0000000EX4k-25dt;
	Tue, 11 Aug 2026 16:41:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpXv-0000000EX3Y-0ltt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:41:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51113600BB;
	Tue, 11 Aug 2026 16:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BBD1F00A3A;
	Tue, 11 Aug 2026 16:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786466506;
	bh=YH81zlJN3/rJuDofrliVkDipcnRN11lptQvHyY7qVzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TynGOiim67HmflH0eOxafnmJOVZNOLxeyjxnM3yKIbwVAQiCL2ldUTyGyrP6hRTsT
	 11GIiYBGK9Ro0dTUAIn8kJ1Gz7iUvhKVs+awQOt7Kim4WQjsDjx9QqiUqsoT6Mh++T
	 bbYwjhQD/awEtNadgboMF8VUBiNeg2DbI6Xj2sTf+F31hWTuQl47Cwy9MuYGFw0FwP
	 wFY1X694/IoHh5H9WVkxu8icbS0CQ0FJDg3W7KxvRdlVg0Q1syHVeyuskTfOSfnwDT
	 rkqZuJtMIAzVmy8BS9MS0FgIqWYlgANCf8dAiiqm1ZUTnnKkvc6BbdspMP55szbUVD
	 jn4PuNe3OyuvA==
Date: Tue, 11 Aug 2026 09:41:43 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, Song Liu <song@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Message-ID: <buq25tpmdjlvskzfvlit6swc6tsjuzbdnjfix4w6af6247zads@ka44wuolomci>
References: <anmobvJXiBQqWn6S@willie-the-truck>
 <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com>
 <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck>
 <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
 <answWdRpVQLtIzIj@willie-the-truck>
 <CAKwvOdkrxJ_9qjaBNQS+o=+_m_f3e9k6jMEmXB-S3+nXGoLV7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdkrxJ_9qjaBNQS+o=+_m_f3e9k6jMEmXB-S3+nXGoLV7w@mail.gmail.com>
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

On Tue, Aug 11, 2026 at 09:27:28AM -0700, Nick Desaulniers wrote:
> On Tue, Aug 11, 2026 at 7:23 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Aug 11, 2026 at 03:18:17PM +0200, Ard Biesheuvel wrote:
> > >
> > > On Tue, 11 Aug 2026, at 14:02, Ard Biesheuvel wrote:
> > > > On Tue, 11 Aug 2026, at 11:44, Will Deacon wrote:
> > > >> On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers wrote:
> > > >
> > > >>> Sure, but let's replace this with a link to a bug report in llvm's
> > > >>> issue tracker?
> > > >>
> > > >> Yes, please! I can apply the patch once we have the bug number.
> > > >>
> > > >
> > > > I can look into that.
> > >
> > > https://github.com/llvm/llvm-project/issues/215547
> >
> > Thanks, Ard. I've ended up with the patch below.
> 
> What's the extent that HAVE_LIVEPATCH will be used?
> 
> Does this penalize kernels built with BTI in favor of HAVE_LIVEPATCH?
> 
> For example, with my Android hat on, if we have a kernel that's built
> with ARM64_BTI_KERNEL=y, and _dont_ use HAVE_LIVEPATCH, we're going to
> turn off BTI for a feature we're not using?  But maybe we _do_ intend
> to use HAVE_LIVEPATCH, and my assumption was wrong?

The problem isn't specific to livepatch, livepatch just makes it easier
to hit.

-- 
Josh

