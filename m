Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A60CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NakMRS46W1oL9mqbKvNepb8mTvQx3uQdatcK6E5xQD8=; b=NabhOfcAFVCR8YX8QsXeqxIujf
	9SEL2Oh+X3awPM9B3CRSCFuZkeP96qHcfO8iWju+zRY5xc0sS5sK9AKeyYijFnRdge1KI1SwxObXv
	wSGQBz2JkPVXuIYIV50wrEh50ZE0843+sbRsySjVoqN4iDdELPxtXxG4urRlGT6JIvEc3xX05Q0Tv
	Zi2asArK2DBh3egjppbsBATNMmdHv5V+dzgfGkGtar9oimZGA1IqfgP/TNmIOQX1teOuAiWkJtAo2
	1X3CH+djUW85COHwJHh3vpjAImICLFcfIVPnrSC73PyffeEpVHTb7tMaY4RuM/1mAZD/iFDf0m1jc
	13A3MXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzaa-00000009Ql8-00f8;
	Fri, 15 May 2026 20:56:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzaX-00000009QkU-15C1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1681B41AD4;
	Fri, 15 May 2026 20:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E107C2BCB0;
	Fri, 15 May 2026 20:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778878612;
	bh=NakMRS46W1oL9mqbKvNepb8mTvQx3uQdatcK6E5xQD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dt5TkGt39ZtVjDyH9NqztBlMdcQ9g678kION37ACp00mHIhB5JTmHFXdL4Uhiq/6C
	 msqNy3bCtbyVcKP5oClpR7TqvTflTd4F8DSkn93XSMYyMrzWn44QGL1CJUveu3UE68
	 58aMCQeSrXUrdsZUTIjdWo8pCYUYlJdMic7yXEBRGLLFbq00QGVVTnnON6/IDK0Dbt
	 K6xg8bC7174Upc6+q79jqCJSORlFiibUbv5Bs6GECqchO/MVP9lhKs2sxoaRJZ9SFy
	 So/+HDZXkueSsqvlhQBYGQYMXqvvD3VJyUZhFoDed+xuLQkSFVivEd++Ho+Ox7IsuG
	 Ed4fR9Nof9gvw==
From: Thomas Gleixner <tglx@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>, Joerg
 Roedel <joro@8bytes.org>, Miguel Ojeda <ojeda@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 stable@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Kees Cook
 <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section
 mismatch warnings
In-Reply-To: <20260513145425.1579430-1-arnd@kernel.org>
References: <20260513145425.1579430-1-arnd@kernel.org>
Date: Fri, 15 May 2026 22:56:47 +0200
Message-ID: <87mry0xugg.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_135653_314624_737F8C03 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 13 2026 at 16:53, Arnd Bergmann wrote:
> Link: https://lore.kernel.org/all/abRB6g-48ZX6Yl2r@willie-the-truck/
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: I merged both patches into one, to simplify the dependency
> on the new compiler_attributes.h macro.

Which you could have split into 'provide macro', fix A, fix B ..., but
that's just pedantry :)

But seriously, this is way more palatable than the other hacks!

Acked-by: Thomas Gleixner <tglx@kernel.org>

