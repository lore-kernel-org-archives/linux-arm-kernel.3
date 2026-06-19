Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41349CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvTg08fHdCJ2zWVngIJfipizxXJP2af00IlPHh9eNhU=; b=0HVNjzWqhzQwdHP2TcaGdYFiaR
	oGeSK5MmFvaYpy4u98yCkcHdBkGLEUi8eOeYtUC397hSi5BCS6rdiaSa12r2jFSyFVKLNfzNpIpre
	wzazoPRMW4YuVIzfx+xwev117mYFkTyWMoP0yXwIlW4K6r21t7fBxam9ctRBxljkbc0ttV+eXYzgW
	kS96Jwljgl5Apq62jaT6iyNbt8z631OcrkEW6zlViBAF7MbjUbbwCDNpfcAcRlcLvACrY4MBmnNyv
	8Ok9KLrCus4m2vvqw1FSSlwGyWWFuFwdOc0e3+19edguK813UPgEAJM5JQhpEsPC1P6IbNdanfGhv
	G6GT4sZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYu2-00000002Rfz-0t1O;
	Fri, 19 Jun 2026 13:04:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYu0-00000002RfS-0Aw4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:04:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E85D24A92;
	Fri, 19 Jun 2026 06:04:48 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E4AD3F763;
	Fri, 19 Jun 2026 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781874293; bh=e9pfEYbv59UVNvg5pd3j1Yh0i55qXWOlAw6aQXf2fiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQUOPpbAmN6Zr1EYJgextc9Lnki8Ehn68EA514fFROJG93hMv4r2Cfa/r8NEkWg3n
	 w7/Zq2/WnP0TUUTs/hsA6wrxV4sm6R2stNIFSF+9iXhA2oqOiIZLzOIr6XQovIdoEu
	 /E9iWQPaERn1E4Z9+FmbsevKh/DyS57CcpVOvJzY=
Date: Fri, 19 Jun 2026 14:04:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Harry Yoo <harry@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, kaleshsingh@google.com,
	21cnbao@gmail.com, david@kernel.org, will@kernel.org
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <ajU-b32dmwS7XOg4@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_060456_121921_C8A34F39 
X-CRM114-Status: GOOD (  13.05  )
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

On Thu, Jun 18, 2026 at 11:05:43PM +0900, Harry Yoo wrote:
> On 6/18/26 10:35 PM, Harry Yoo wrote:
> > On 6/12/26 1:44 PM, Dev Jain wrote:
> >> Introduce a boot option to tag only at allocation time of the objects. This
> >> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> >> catching bugs.
> > 
> > I think most of overhead when enabling MTE comes from loading and
> > validing tags for every memory access (either in SYNC or ASYNC mode),
> > rather than from storing tags.
> 
> Is there any reason not to use STGM instead of STG + DC GVA when
> setting/clearing tags for large sizes when we know they are properly
> aligned?

STGM is intended for copying tags when paired with LDGM. Have you seen
hardware where STGM is faster than STG or DC GVA? For properly aligned
buffers, I'd expect DC GVA to behave at least on par with STGM.

-- 
Catalin

