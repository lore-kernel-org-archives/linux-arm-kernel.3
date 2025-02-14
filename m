Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D15C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R7CClKFrSXiIhfS8RdyO5YoafWx3vgmfgbtnqzfBuQ=; b=B2WZSt1sb9tB6zpjOGl/7OZEy3
	1xo0EmJQM6TnjoRLnLaVSUZjok0Ezxg0m84EFXgWz7k95TvoWvBIl56Hk20RWyNZnmFnHS2LGoBsw
	QNFoy2pq0nZ9hfhGd1QBlgNCt/Fr/cgfiNondxyM1ZXM0HxgzBk8Y2SlLX2kwOEgyTKQ1Lkj2yAOo
	DxgEwr3m79UYI2CVS69xi9Bg5ttcq3n9pK6tXwbwkt/vNsg/dn8QqB/vLcG6fM9KNsKcNfYtheT8q
	n9D7n2Kwdcm+uUMEl54rS6sKepuNszPWhIZnWynZMjVgtXxJl2W4GTwfcKP2kdxTjtXTJC5W0jdLb
	r4N2ojTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0vK-0000000FxxS-21qe;
	Fri, 14 Feb 2025 19:00:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Mk-0000000FrhB-0wLj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:24:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20697A4336D;
	Fri, 14 Feb 2025 18:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859E2C4CED1;
	Fri, 14 Feb 2025 18:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739557481;
	bh=qcahaJjxOPF2+xYUsg3HR7q67xvZO5cp5xgsBNVsZHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ke+Lu86Il0gbEC9tvWXHdbBP12IpV/yk43MGmN22VmqWWg7AjL/L3fiXu7UldG2S2
	 7OOwCshZ10vkxyVym1yTfLX3/6RfULL2PR78xdqFADvHg6utE68b6hr6SRLfrkzi0o
	 tHtoY6Ur0EiBk62ptu5WrOO9irskzDoIJdeGKbCywGOhp/C4eJ1ZE8JZX4MCne3aA6
	 TbVz8lpq//Q5XQ9DVJAHogt6OmzRsxohuie/uv0/deRI+WjJmtw2El6b7vWPxW7PdB
	 SOX7GLgM+sNTeH793CsYEDo3WX8A6o3xt7TNFuYI53lNT6cBf80hKHBVhC6Lz3J9aG
	 KCf5Kd4maN3yw==
Date: Fri, 14 Feb 2025 10:24:39 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Song Liu <song@kernel.org>, Indu Bhagat <indu.bhagat@oracle.com>,
	Weinan Liu <wnliu@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250214182439.gpavslsvgw4xy7sf@jpoimboe>
References: <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com>
 <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org>
 <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
 <mb61pseoiz1cq.fsf@kernel.org>
 <CAPhsuW7bo4efVYb8uPkQ1v9TE95_CQ6+G3q4kVyt-8g-3JD6Cw@mail.gmail.com>
 <mb61pr0411o57.fsf@kernel.org>
 <CAPhsuW7fBkZaKQzLvBqsrxTvpJsfJfUBfco4i=-=C_on+GdpKg@mail.gmail.com>
 <mb61p7c5sdhv6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mb61p7c5sdhv6.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_102442_327722_44AB64C4 
X-CRM114-Status: GOOD (  11.33  )
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

On Fri, Feb 14, 2025 at 08:56:45AM +0000, Puranjay Mohan wrote:
> I did this test and found the same issue as you (gdb assembly broken),
> but I can see this issue even without the inlining. I think GDB tried to
> load the debuginfo and that is somehow broken therefore it fails to
> disassemblt properly.

I had the same theory about the debuginfo, but I stripped debug sections
from that file and gdb still got confused.

Still, the symbol table looked normal, so the gdb issue might be
completely separate from the kernel runtime issues.

-- 
Josh

