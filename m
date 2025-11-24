Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E58CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EDndxfXQbvOqPBlz8NrS7Ws7lhc2QHJjs8Zhx0VmNg=; b=0nDv2PHVc76qkB8V4f4cNifG/3
	fwPZ7bgs6ekMl0zDhCUmqyIcKz/5ILQ1+398504ezSMvMSZu8fbNAs+auAh5r+VO1tBwqbxcivI5h
	nl0A3t1E3yTfF6ttAfbCFHe69no8qf99yztecan0nfOdmOhHp0LVLuhnov6AD27cfp0FYqsLuq9Eo
	xoSgSenL5gUWAPcGF9Hj1v6jYY6/WDYQUGty6eyEPflFhkZdKbvYWqkRQP6ilpu4QYKkgNscgigFu
	2KiGAGqAEkn8EM9YWesCz2mMeMXYS9S0lC3gFHyTwtkGCj4Auzo4/3VTSE22UMyz0KtzS70oN66vh
	8HPQXL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaz7-0000000C9dT-0z8X;
	Mon, 24 Nov 2025 18:08:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaz4-0000000C9co-38Ej
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 18:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47C6F43D99;
	Mon, 24 Nov 2025 18:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2090C4CEF1;
	Mon, 24 Nov 2025 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764007697;
	bh=IlF6JklCMMnUUMN0qCEJlEyZPZI/K4AomTLbC+Ab6gE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Rez6gWytpa46FR5MaQj+eFH7x+37KxShAIV9jQ4YyOYt6s8w5g8GgQtNu940wrHOX
	 hnpReiw6vr9TsK2VaGWJKo0vSkacJRDktv8nbsI6CRaDG16Vp01fkHT93/GaR4sjQp
	 agbeoqpaPFI82E5mBj4t0emDIiJs7SwLNBrasu8E=
Date: Mon, 24 Nov 2025 10:08:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Balbir Singh <balbirs@nvidia.com>, Catalin Marinas
 <catalin.marinas@arm.com>, "David Hildenbrand (Red Hat)"
 <davidhildenbrandkernel@gmail.com>, Jan Polensky <japo@linux.ibm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, will@kernel.org
Subject: Re: [PATCH] mm/huge_memory: restrict __GFP_ZEROTAGS to HW tagging
 architectures
Message-Id: <20251124100816.a4f16b6a84bae7c97dfc21fb@linux-foundation.org>
In-Reply-To: <e83945be-056a-443c-b140-e3301c2109c5@kernel.org>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
	<20251109003613.1461433-1-japo@linux.ibm.com>
	<690ce196-58cb-4252-ab72-967e1e1574cf@gmail.com>
	<aRG05VS-IIxV2y_C@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
	<fbca7868-6f68-4b98-a2f2-e39eb46b7f12@gmail.com>
	<aRIEkLw7BofLjOWs@arm.com>
	<9ab7f5c8-a2fd-497b-a32e-4def84e0be26@nvidia.com>
	<e83945be-056a-443c-b140-e3301c2109c5@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_100818_814074_B726297E 
X-CRM114-Status: GOOD (  17.89  )
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

On Mon, 24 Nov 2025 11:57:09 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:

> > I've run into the issue where due to init being set to false if zero_tags was set,
> > the system does not clear the zero_folio. I just spent a lot of time debugging it :)
> > 
> > Catalin, were you going to send out this patch as a fix to be included in mm-unstable?
> > I've for now reverted your __GFP_ZEROTAGS change to get_huge_zero_folio() for my testing
> > 
> > I am on the current mm-new branch.
> 
> We have a fix upstream now:
> 
> commit 5bebe8de19264946d398ead4e6c20c229454a552
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Tue Nov 18 08:21:27 2025 -0800
> 
>      mm/huge_memory: Fix initialization of huge zero folio
> 
> 
> Andrew could consider picking it up as well temporarily to fix the issue 
> until we rebase on top of the new kernel.

Sure, I added 5bebe8de19264946d398ead4e6c20c229454a552 to mm-new as a
temp thing.

