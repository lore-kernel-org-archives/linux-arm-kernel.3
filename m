Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F1DCD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO9BjXvsvwoj60HhMSn3f2FPCBF40vkRLV5iTxNSvcU=; b=qGPQHg2q8++Nr+1F0moXQxbZMw
	Ls9x9dkzCCitYsW2taMEpR2fpLZ4W3Se+aWZuguYPoHR5IVhpjfAtOihlPa2/QxpfTiU8ehR31ldz
	z1eIwX287pasESUPN4EeM3UH7zb6vFiPk2V4gR709PgV97KFtoujeTjZuRJSrpWxWaJFNJScsQnI4
	yIKjEdzMKWaTMGIXLt/RVYYtNh4XdVZAx7CSgzJSEPCrL0aPuDd1JBJrwCOPd1KB8ve0S/E8zVyJS
	whFjQ+nnA+VHwn6P2Cy3y7b3Jn4bgyWaGZKq1wvaeEEAUM7EfMZzZP4uQA8AtJV9pJgyfMfCDjRQ0
	Qbsd/L2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSywA-00000007eKA-0GsF;
	Fri, 29 May 2026 15:15:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyw7-00000007eJW-26LP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:15:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11937237B;
	Fri, 29 May 2026 08:15:41 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D6BF3F632;
	Fri, 29 May 2026 08:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780067746; bh=fWFAdV+JOyH12J5qJODzNqZnI6jDhwXChZlfdA7v5UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulQ1ZLSkMPkrB5QdlIIxzjsjRL/856PTT171Di/imlqfT6z47bwj81HeytSTjyrkH
	 Tv/1S+UD2KVsIbccpaBYIcE2XndYnNbJ88KGSkdqnDTQweyGm0BBiSQatF/KXty/wX
	 6Y+5HCL5EM+r/czqLAPAVIUWOMgvP7weju94qQJs=
Date: Fri, 29 May 2026 16:15:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Will Deacon <will@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
	stable@kernel.org, Bo Ye <bo.ye@mediatek.com>,
	Isaac Manjarres <isaacmanjarres@google.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for
 CONFIG_UNWIND_TABLES
Message-ID: <ahmtnD9hD1uc9FFU@arm.com>
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
 <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
 <ahkzD01e14wOTNBk@google.com>
 <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_081547_575513_F4FF4096 
X-CRM114-Status: GOOD (  11.75  )
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

On Fri, May 29, 2026 at 04:29:26PM +0200, Miguel Ojeda wrote:
> On Fri, May 29, 2026 at 8:32 AM Alice Ryhl <aliceryhl@google.com> wrote:
> > Hrm, is there a way to perform the version check in the Makefile, or do
> > I need a Kconfig for whether the fix is needed?
> 
> We shouldn't need a Kconfig -- we can do e.g.
> 
>   KBUILD_RUSTFLAGS += $(if $(call
> rustc-min-version,109800),,-Zllvm_module_flag=uwtable:u32:2:max)
> 
> I tested with 1.96 and nightly -- I can apply it to the Rust tree if
> arm64 prefers.

Please do.

-- 
Catalin

