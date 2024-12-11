Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A608E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdrJ0SbMmqk7tEl4kBb44qSI7X5fDQGS/pk1FZgb02Y=; b=Sn0mzX33HqidmKL0yIaprH84lb
	dP5hj5jBB56YlRqIF1OFd2KT9IgUxQnH2Nr8/n7+yzCTj622+YZ8vMZoLisEtQ3vv9WOgsb3j91tf
	wua/n75I4HzeGWiPyejUrc0Gq1BqEbFbNNO+LZsmm1DjVwiKrU0veSbFxy7apAFucwIYtLY5VCtEf
	23cUx+2Nj5JGV6BxXeFeqF6FTtjsa2uaB5XncMnCti2gTG8HvCv6zw1gnPVR+gaOcaSSmrhW/LZKY
	ZRVrgTO0xZG4upyo5F9IplD2arEAQOEY0IUPitskaxwVVQN8UYcw12CYU/nsBfV9kvLdSG/1PBKkT
	kUqBZJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQU2-0000000Fb8m-0dqR;
	Wed, 11 Dec 2024 17:26:46 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQRv-0000000FaV4-21JI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 17:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1733937873;
	bh=TdrJ0SbMmqk7tEl4kBb44qSI7X5fDQGS/pk1FZgb02Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hwse0Ju8R5dII5eg932tcIQzr2y+1bY0mSoRggdOrl7iOAQiNvPGM7OzH26zxUVbf
	 Jp3k5sWBsxRaLkttKizM6VOqb+1gkhL61u5O9aGuNJhSvlphpQNnltmfwFJHZxRiXV
	 toNCDqZ5oXWivPlnkCWvSX3BX5DvEpkcDmXyKJ3Y=
Received: by gentwo.org (Postfix, from userid 1003)
	id 7CAB8406EC; Wed, 11 Dec 2024 09:24:33 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 7BCB7401EF;
	Wed, 11 Dec 2024 09:24:33 -0800 (PST)
Date: Wed, 11 Dec 2024 09:24:33 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Will Deacon <will@kernel.org>
cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com, 
    scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
In-Reply-To: <20241210113151.GC14735@willie-the-truck>
Message-ID: <6714a00a-220e-c43b-7f06-4a2397159cd7@gentwo.org>
References: <20241118181711.962576-1-yang@os.amperecomputing.com> <20241210113151.GC14735@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_092435_555792_8C90786D 
X-CRM114-Status: UNSURE (   9.74  )
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

On Tue, 10 Dec 2024, Will Deacon wrote:

> > With FEAT_BBM level 2 support, splitting large block page table to
> > smaller ones doesn't need to make the page table entry invalid anymore.
> > This allows kernel split large block mapping on the fly.
>
> I think you can still get TLB conflict aborts in this case, so this
> doesn't work. Hopefully the architecture can strengthen this in the

Which platforms get TLB conflicts? Ours does not. Is this an errata on
some platforms?


