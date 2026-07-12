Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6745BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eleGJpEnYFxDxqONcdE0kQSQcyi7bZFQeN5aLXAYq54=; b=LlYnkGPeGzpdpj/Tavk0ugh9iE
	90YbvkhJ6+rniDwwEybh6+9wXE3ViCcnb2dKP6y9QeJhJ7v+jWF4ZGeqbaEBEjYpvnQSHxz+DpPBb
	edtgMEPFhukFPJba7vMTvtJPPjb3lIp82uFY5UQ3KjsEm3t9Oc6MLWJsDukE4IV2ncctLyvFpILhj
	a6R+92bOTjtJxUfQ8618bsKt3op90dP7w/Ov2gHmUrtPgJE7SPXkHiW4nFse66kDQZtVNcLMWW3Rn
	O1Dq6hS7N7rxXmK3yduDLOM4YcLPlL5WPMr4O/KYg9JlOGdCNKh3mKokdiRbltxZHtptbA30+XHZ1
	1aYy/dGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqTT-00000007IeL-0gUh;
	Sun, 12 Jul 2026 09:27:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqTR-00000007IeC-1XkW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:27:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A899742DF0;
	Sun, 12 Jul 2026 09:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8961F000E9;
	Sun, 12 Jul 2026 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783848463;
	bh=eleGJpEnYFxDxqONcdE0kQSQcyi7bZFQeN5aLXAYq54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ka37fTyx+JNPlw83sQi68vWVt8JMjJt2tNkTNPcKRGzmTHPEEqiJoChin9qpQaxdN
	 /rYCH6H7Z1cI4GEPWa3N05fu+XaZVbqXO0bTtAfzkrQtEVOet2dZu2zq1Dsv9vo7M3
	 g4W0NgQ6hGAIE3IRw3DjY28ZxEL+BjdyGjpEfnfVd5xtn7ieaanNN4Hgs9k2lh6++i
	 GoP0a+nUeqhZs8X1j9ldvGavcQcytsjw050iyvWcXY2kpcn6/If3pfAfmqOd7Ry0N3
	 pwIaCPMKfn8lnm7IIw/KCYQpv0rSDRJuPucmqY+wFy7e4NEG7c01WITL05nPeNZepM
	 3SCtswq0L8OpQ==
Date: Sun, 12 Jul 2026 10:27:28 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	David Carlier <devnexen@gmail.com>, Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] mm/vmalloc: acquire init_mm read lock on huge vmap
 promotion
Message-ID: <alNcMpAtslog2wPW@lucifer>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
 <d47ac961-4767-4ce4-9c75-f281beb24e42@arm.com>
 <2026071252-sweep-quirk-a068@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026071252-sweep-quirk-a068@gregkh>
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

On Sun, Jul 12, 2026 at 10:01:37AM +0200, Greg KH wrote:
>
> And scoped guard has been backported to many of the LTS branches
> already.

That's really handy :)

>
> thanks,
>
> greg k-h

Cheers, Lorenzo

