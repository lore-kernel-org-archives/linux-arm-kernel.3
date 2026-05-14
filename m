Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD68CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tn+kRpZYLlHdZnmOB4ZkCJyUpahGya+rIPp6GXc/Puk=; b=wJ+jmk35IyZMBbMiQx9lXMorg/
	caX6Oo3yaEuhglgNXMSUO6OgaDvWhTbcyQlta6PxXds0GSQIKRdYZuIguraKFHlOTYbq192uQecHR
	wp3IJfh5PHFv2QfpTj8FW0SI0qQMhdeSrkdHl6e1GsIGGe7dCuKmORZT+hP7q3PODDOQccY9ETi8v
	0mjSCWwMm41ij5k1Tu1VerWpKvKWeNpNmTZuFaIAVLizZjawbjmUrC/Qdd5irv0NXIReRqJzTuEAU
	Ch1OEfA3v/vNSTMk02tlW+JtzGnFMtFXTRimsGdgGVCnQGrCxvmuywXQ4GUVYdoAemJ33/UsUs21o
	fJbK/FhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVI2-00000005THL-2XGs;
	Thu, 14 May 2026 12:35:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVI1-00000005TH7-3x04
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:35:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 669EF6012B;
	Thu, 14 May 2026 12:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC77EC2BCB3;
	Thu, 14 May 2026 12:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778762145;
	bh=01wIi3Eg793RqUdLUINzl55/L7rDJ6f1+4go/N9Ni18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HrwDRyN4AgqVMXw3KuRwBzAfJrIIdCTNDKXfRSCN6uhnF33xjn34VsUf7eNO4Shxl
	 b+Ou5xTdyoy0zTU61cH0ynbhKtJcN/EbydBiqtxVQiW5nIjF5bpkEatXawTVeOKkxD
	 RDD/WkQXgkASg5dr4bMeY88Z8/YASSmHImiuM18MPlZYuQqNDgcdsVz7Xcblqeu01D
	 0aL4k7nYGt0bbnrZRb/pTQrlb2A8c2OwH9zlUbcq7euoUYwkuatDdWx3E3T7mWEimE
	 u+6xSXVSTzk7vEIlNuyVsRVAQuo6FWy4khY/43DXdl9+TbZVxOT64MsJff+ViLVjZF
	 SznMZ9roUQULg==
Date: Thu, 14 May 2026 21:35:39 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian Schrrefl <chrisi.schrefl@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
Message-ID: <20260514123539.GA1781775@ax162>
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
 <agGRnHVTLiwobb9W@google.com>
 <20260511090943.GA1029560@ax162>
 <CANiq72nm_3KM4gMnb0x34oJk1+_8XrUz-43zwW58Mr1UHG8qtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nm_3KM4gMnb0x34oJk1+_8XrUz-43zwW58Mr1UHG8qtQ@mail.gmail.com>
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

On Mon, May 11, 2026 at 11:58:42AM +0200, Miguel Ojeda wrote:
> On Mon, May 11, 2026 at 11:09 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Sure, I kept it simple for backporting purposes but I don't mind
> > breaking out the dependencies into their own symbol, even though it
> > feels like that could be done when support for the sanitizer is
> > re-enabled, which would truly mirror what you did. No strong opinion
> > though, so I will send a v2 after giving some time for other comments.
> 
> I think it is fine either way, especially for a fix, but up to the
> KASAN/arm maintainers of course.
> 
> Thanks for the patch!
> 
> If KASAN or arm maintainers want to pick it up:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Otherwise I can send it in a fixes PR I will likely need to send later
> this cycle, so please let me know!

FWIW, I think Russell has been away dealing with personal stuff
recently:

  https://lore.kernel.org/aeDSTIS9-TDSihbX@shell.armlinux.org.uk/

So I doubt he would fight you taking it, given that it is Rust related.
I am rather selfishly motivated to have it picked up and merged because
I have to remember to pass KCONFIG_ALLCONFIG=<(echo CONFIG_RUST=n) every
time that I have to test arm allmodconfig. But don't feel rushed to pick
it up if you want to wait for a formal agreement on the path forward.

-- 
Cheers,
Nathan

