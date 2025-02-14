Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6614AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ay9KrSCDlk64j/01MRKvLopnwWKqdJcsV9naZB1JPSs=; b=heYp8uewihx6oaEoqnqm8/wUZF
	uLNOlifOlZizQn9EKngQmNHooz5SY+SOiZIADle3puStuZYZxU1/ytqNlI2+EdVnL9pPxWPZjRJRf
	NBNOP7TV8nc0Wo6lD7y1d9TYyV5L2cTc5MQnwOnhgr5Q+O8zZvu70cFy/LvGrVuBdcEaoASQUnzuh
	WQQ8nvgRfKemp2PsdRBWnP4ROH84C4sWx4xHyD6vZkqTCaFqHDmfh7/KchW5O4bk4/aG93L8ybqc0
	cZV1uZbnjC4sD3euIj4BSZADT6UPXdLw7XftCCWn9S3ZmgYPFyBR/0onWQvb9YCp8KAjkFWhvOZfw
	cZBoUxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1bi-0000000G4Np-3Uns;
	Fri, 14 Feb 2025 19:44:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1aG-0000000G44j-15v7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 19:42:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15C145C5B29;
	Fri, 14 Feb 2025 19:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5BDC4CED1;
	Fri, 14 Feb 2025 19:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739562163;
	bh=j8RbUnTVR+Rmdyxe3mjujeaLymNY6BVjB/yjOURYHBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=If1z8UYMrV18l2O39VsnXxyaZX8j5zqCs7PfU7UiHofpUd0X0H+YHHVk1t/Zw+b4/
	 eL+iiJzA1kIcgYiZQWhrjTrE8gm4hDWOkx1Xkziz4YBmkbRF6uSvpyObFlqsZ9+c4D
	 4HfNbweBxiFFpugcKa++4K7rPMll4aqQB6BNnQlWlFXjYpQ+e3Q4lXOCtvCgFex/gj
	 12AQ1FPMo7xdby/Gdbc00tsCjGcqjWxkbGzIUR67jveSRPnpVEzoE6ohrSxUjPxx8d
	 SIlFCyr5xnX9Sx5EMfpt/w7xgyik+6soixxL8IXY16+k++w4OZI4PIGG1egPo/0zym
	 5vltoOGyMwrhA==
Date: Fri, 14 Feb 2025 11:42:41 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Indu Bhagat <indu.bhagat@oracle.com>, Song Liu <song@kernel.org>,
	Weinan Liu <wnliu@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250214194241.3aymq2kr6gky5zfv@jpoimboe>
References: <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
 <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe>
 <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <3069bb9c-6245-4754-a187-ac8253103d32@oracle.com>
 <mb61pa5apc610.fsf@kernel.org>
 <f8d93a1b-3ad0-4e19-846f-c08d9cb19f48@oracle.com>
 <d91eba9a-dbd1-488f-8e1b-bc5121c30cd1@oracle.com>
 <mb61p1pw0qrpi.fsf@kernel.org>
 <20250214193819.22yet42umilpugv5@jpoimboe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214193819.22yet42umilpugv5@jpoimboe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_114244_337038_C054ECF4 
X-CRM114-Status: GOOD (  10.86  )
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

On Fri, Feb 14, 2025 at 11:38:22AM -0800, Josh Poimboeuf wrote:
> On Fri, Feb 14, 2025 at 06:58:01PM +0000, Puranjay Mohan wrote:
> > and the linker script has this line:
> > 
> > .sframe : AT(ADDR(.sframe) - 0) { __start_sframe_header = .; KEEP(*(.sframe)) __stop_sframe_header = .; }
> > 
> > So, do can you suggest the best way to fix these warnings?
> 
> Just add *(.init.sframe) like so:
> 
> .sframe : AT(ADDR(.sframe) - 0) { __start_sframe_header = .; KEEP(*(.sframe) *(.init.sframe)) __stop_sframe_header = .; }

Actually each probably needs its own KEEP:

...  KEEP(*(.sframe)) KEEP(*(.init.sframe)) ...

or so.

-- 
Josh

