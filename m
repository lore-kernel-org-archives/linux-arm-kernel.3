Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE8DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTaqMzgFKB6BvCjR+/Mj8L7h7lMTWPAYSPCWM72+Ja8=; b=um87lcGldxWQYE0IOhgb9D7QRP
	+iGRrLgwOEMRPozAZ7MM/NZRxlCUNOwwuwbaJsjthowLJoeR7aTykPNOtLKH0mSjThPkJsEOakjAB
	BLNXX1qS8jmO/ypUk3q42tuJciobeURmpJgdVTYuAREJne+/pYniZKeC7nuf3o4iC8ctRuMmk3s/Z
	2SRmmGLkmQ9+tzu8Is2LKZWPEm+E3+evJcw4xK+sDVl8L5MncAPNqa1MMVrnbmMHCkGHHMh6Z3QoT
	jPFh16rcq0C1/eRb31n7VZy6VB4TlwijaN4NForZPQawWbBj2/CLlHC1kO6RpC1Oe7/284smzhxJJ
	iMajK5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJ0n-00000002VG9-3yRi;
	Tue, 04 Aug 2026 17:33:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJ0m-00000002VFo-1Cuv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:33:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D2080406E3;
	Tue,  4 Aug 2026 17:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF54C1F000E9;
	Tue,  4 Aug 2026 17:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785864786;
	bh=cTaqMzgFKB6BvCjR+/Mj8L7h7lMTWPAYSPCWM72+Ja8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bSW/zCu2pqN1wyQJbp3qqbY97+FtE6YoCwLIy7QWHBOdR2OZssMnQJaHk84GfbWW1
	 At1hCpU4kt/XExzHY8E0cBRDNl7dhDPO6qhz5S6Ms7OnzeU17RRoh2dfRIoyJW/4YF
	 0NDu4bpq07VS85t1qupING3Z/E5e6UvDlPbRxSHIJnVLnY9rOaHMVL0frWeBdMK5tU
	 spEURThLmhVIwXZH+Hopsk3UXu05Pd5xlehD7gA5VcXRKQXhm9U4BOe6rZuhSVrzu2
	 mgKRgHY4j5sGAtT2fpEg4iw8NN9Med1DIC7q4eXUL+1ug4um38g2r53s8geo49YlK8
	 CiXmBChnkhmKw==
Date: Tue, 4 Aug 2026 18:32:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, 
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anIhSGs70TTzymHM@lucifer>
References: <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
 <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
 <CAHk-=whjfRaeYsAVS9VfYO5uaSB43sT7zPOmNWR6gC8h=t60=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whjfRaeYsAVS9VfYO5uaSB43sT7zPOmNWR6gC8h=t60=g@mail.gmail.com>
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

On Tue, Aug 04, 2026 at 10:01:45AM -0700, Linus Torvalds wrote:
> So I'm just trying to clarify my stance - I don't hate percpu TLB
> contents per se. I hate the notion of codifying them.

I do worry that changing per-CPU data structures to support this is exactly
codifying this (and will encourage other arches to follow suit).

And I really don't think there's any way to implement this without
fundamentally changing core mm or assumptions that core mm can make.

--
Cheers, Lorenzo

