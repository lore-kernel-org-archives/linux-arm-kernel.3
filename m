Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A24C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7KOe4fXvEXQqN8/V+KAdSe8B7B97gn17ICn6JpXGEw=; b=oSqNIGc5XXYsHc+B6WYJpIQUb3
	RVmYxL0n5NOPHaJsn3h6LvH8wK154IQZhELX7z4fJgyj5uq1G3EWsVz93fi/1yP6j4MlM/2psl7fp
	0vhG6Ik8BKKjTgUBZGE/TcdT4f0iPf8OTWGcyOAtjINRxCp/neb0HCOH3haemqE5Bt9gfiozn8NQX
	CvVDB1DFLBq/Rq+kUzrtEip4RDLuCv9RFsTL3WWjkvzHZDChvkMWgBu8UbhCsidpOiZfnOAc6ozNc
	DpEBNSphg0dxkonL+0S2lUtM6+zy53tthpn61t4YIOF2NlSvQU0a9HBZ/Jgayb5ae7z8D5vCyR/Rb
	ervdGhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkHFc-00000006zzV-3rAV;
	Tue, 18 Feb 2025 06:38:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkHEA-00000006zqV-0r6Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 06:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79BEBA41D0D;
	Tue, 18 Feb 2025 06:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798D1C4CEE2;
	Tue, 18 Feb 2025 06:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739860625;
	bh=2fzRHHC2KgFRx5omBTKDd3nCc7JnwkHdxnqOzs25YKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFt5gITJ3Rhhkz5w5yO6yIJbChhiyry2bgre9WlaPoIGDwpQj9qk7bgDVpTA3uhst
	 Rri//lhNZbhWud7lH0X1D1SsJ2LHpbSLQzscqXcLJKaTsEJQIe3ucD1XJs8jdQiQ84
	 kcsKJZ8XIK1JXXLz6ZfBVHaCL5yFofD5snq540y79a22Cw9QwGFQOvK0OX4Gc7Nfab
	 5xBbBjbKfP12JWZx1nU/e1Uu6BKH+A8iAa6ialCLVnUV14tHdkqmuJqaJx0mvoU7vU
	 pWzBHFEZp1lX32rjMeV7klHMSLWd/7ezMDtcNeua5WFN7xapJ0kqKdp6iuEdUkelGI
	 a81k4R7aETMIQ==
Date: Mon, 17 Feb 2025 22:37:02 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>, Weinan Liu <wnliu@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Indu Bhagat <indu.bhagat@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250218063702.e2qrpjk4ylhnk5s7@jpoimboe>
References: <20250213024507.mvjkalvyqsxihp54@jpoimboe>
 <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <mb61py0yaz3qq.fsf@kernel.org>
 <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
 <20250214080848.5xpi2y2omk4vxyoj@jpoimboe>
 <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe>
 <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
 <20250214232342.5m3hveygqb2qafpp@jpoimboe>
 <CAPhsuW48h11yLuU7uHuPgYNCzwaxVKG+TaGOZeT7fR60+brTwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW48h11yLuU7uHuPgYNCzwaxVKG+TaGOZeT7fR60+brTwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_223706_304103_EB65EB74 
X-CRM114-Status: GOOD (  14.82  )
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

On Mon, Feb 17, 2025 at 08:38:22PM -0800, Song Liu wrote:
> On Fri, Feb 14, 2025 at 3:23 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > Poking around the arm64 module code, arch/arm64/kernel/module-plts.c
> > is looking at all the relocations in order to set up the PLT.  That also
> > needs to be done for klp relas, or are your patches already doing that?
> 
> I don't think either version (this set and my RFC) added logic for PLT.
> There is some rela logic on the kpatch-build side. But I am not sure
> whether it is sufficient.

The klp relas looked ok.  I didn't see any signs of kpatch-build doing
anything wrong.  AFAICT the problem is that module-plts.c creates PLT
entries for regular relas but not klp relas.

-- 
Josh

