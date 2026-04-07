Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BE4EDB7DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7O1tGSn16rF+cgNylrwNR4YR9bgxfhy4/q1KWy/S2Q=; b=S75RZPx2vKVfEp/t4L56gpbnlB
	sWm0exu9di5G4zObucWmAghnrH8aOTDlm4fqzbLkHVCMu3B2iixXoyYcyGRiJgqsx50rPGDm+6mty
	+ZUwpHSuVLNBUdnmoIvcKpZKiINdRm3u40G+pqnPLSX8bU4W4eEWzq5JqpbEulLRjM2xxxhv9heNX
	9mTWkRp2wbwSNglOPptHfKzMkCCdHfu7I64Iwz+dICML0kJqckm0kWehqHmn64aD2yi+rrWCFvUFs
	vKCIxiWBq1LZRSouBEab2UV0gtAamjAsCJhOF5xIOM+367X4CUxYYFRu1ozhZTSjSYV1oD/mEBt/h
	rEdBYmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2wm-00000006ErD-3c7z;
	Tue, 07 Apr 2026 09:42:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2wk-00000006Eqs-1YxK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:42:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2DCC1AED;
	Tue,  7 Apr 2026 02:42:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 343DD3F7D8;
	Tue,  7 Apr 2026 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775554928; bh=QVk2QexSDpe+HZEkpL5txOUhT8aKVmwKMv7KrU8GZYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeitlxxqEEoi85H89/Tmtj+HglpzvFQbeg676fzYA2REer9MbUo2rw03SiyfWhKDG
	 5lJlvZvIcBdZoAZfgEzfclew8VklDpARacR/KV5jdVPRUNUAZmanmXdQD32keuWyVn
	 khMGOW4mOujv7+8+GoDRwxy5Yl7QutLWQ0sMktms=
Date: Tue, 7 Apr 2026 10:42:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] arm64: clear_page[s] using memset
Message-ID: <adTRaKB4zqxEUkEE@arm.com>
References: <20260306-aarch64-clear-pages-c-v1-1-77c1bb0f1c21@kernel.org>
 <ac7YJPo4Np2zxxEp@arm.com>
 <CAD++jL=G81=ueo7djqUETToE459kpFGniWvBwnYbJtmXrm8MFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=G81=ueo7djqUETToE459kpFGniWvBwnYbJtmXrm8MFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_024210_452981_83EF31DF 
X-CRM114-Status: GOOD (  23.62  )
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

On Tue, Apr 07, 2026 at 11:25:55AM +0200, Linus Walleij wrote:
> On Thu, Apr 2, 2026 at 10:57 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Fri, Mar 06, 2026 at 09:57:50AM +0100, Linus Walleij wrote:
> > > There is no need to try to second-guess the compiler when
> > > clearing memory. Just call memset() like everyone else.
> >
> > Hmm, that "like everyone else" made me think - why not move this to
> > generic code and only the 1-2 platforms that need their own should
> > override it? Could we do the same with copy_page()?
> >
> > Sorry, more work all of a sudden ;).
> 
> I actually had that planned, I just wanted to know if this would
> be fine for arm64 first so that there is a user.
> 
> It seems you are on board so I will send a 2-patch series
> next.

We might as well merge the arm64 patch first and do the cross-arch
cleanup separately, queued via akpm's tree.

> > > While at it, implement the shorthand for directly calling
> > > the new prototype clear_pages() for larger page chunks.
> > >
> > > No performance regressions can be seen, the fastpath
> > > benchmarks differences are in the noise.
> >
> > I assume the benchmarks ran on real hardware (had to ask, last time you
> > mentioned qemu ;)).
> 
> Quoting my own commit message hehe:
> 
> > No performance regressions can be seen, the fastpath
> > benchmarks differences are in the noise.
> 
> This was tested on hardware with Ryan Robert's fastpath tool.

It wasn't clear to me where the fastpath tool ran ;).

Thanks.

-- 
Catalin

