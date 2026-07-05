Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A48C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 20:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa0TmpEiPh8i2xeTaaInBr++d04DMsnt6W0yXfVSjlY=; b=x2LNMytByoccNCSZ7KQyBBOj6d
	N9ljEkyUTvAuO+QY6uBJySkNimOF0vjsDyvHme1I3qSuFw+ODVvpJmJPrS+7OdZebD6uKOPJdG1Fq
	GS16vH3r/hpKDhfnSm5Gdg2CLx1FD4P7kmV88ghJ32UdewBv5AFUpyfbKI217MXUYppFNrknaL3nP
	SQ88F/6zylmourinm/jIKwIT418l7xmGF3EN6GEQSoUIbOWZS3XvlGFmi0y0juwz7Cwtb7iFGwIjU
	NG43/kjpdQ4hwO1ughKqmI7WzdvyNEvvSO12rWaV7lMhPvp71y0DE/cOlB/Q4D+vzqJfd3a6GZE2T
	9Wi9jmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTYv-00000009i8f-4BV4;
	Sun, 05 Jul 2026 20:35:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTYu-00000009i8V-2kUn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 20:35:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4436941FCE;
	Sun,  5 Jul 2026 20:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9664E1F000E9;
	Sun,  5 Jul 2026 20:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783283736;
	bh=Sa0TmpEiPh8i2xeTaaInBr++d04DMsnt6W0yXfVSjlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Zl/aGuuaiSi3T583VoIbLi29yqUPmVOK1rES3+kkX5GWbtgQbiq4yu4iroTC5NsDN
	 ccYfgNXwxORiyiEz48z/8L14iADbbq4FINCXUHVD8V/fGRJwaK/0+zV7NPjBid+0D0
	 xiCkdV2aZP1JtaDLHNtnU+bwCaSSCluH/KNZFFqY=
Date: Sun, 5 Jul 2026 13:35:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, baohua@kernel.org, Xueyuan.chen21@gmail.com,
 dev.jain@arm.com, rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
 jiangwen6@xiaomi.com, shanghaoqiang@xiaomi.com
Subject: Re: [PATCH v4 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
Message-Id: <20260705133535.3f4e484e298a52122c6d4721@linux-foundation.org>
In-Reply-To: <CAHKocdGiK0ij7FopLi6b_rQ3CDyVr=ARbC4cCwNG=pY=iTME5Q@mail.gmail.com>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
	<20260618084726.1070022-6-jiangwen6@xiaomi.com>
	<akPKkOt_GNbAbyN5@milan>
	<CAHKocdGiK0ij7FopLi6b_rQ3CDyVr=ARbC4cCwNG=pY=iTME5Q@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Thu, 2 Jul 2026 17:18:51 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:

> > Better naming? vmap_pages_range_batched()?
> >
> 
> Yes, I’ll adopt this naming in v5.

Cool.

Seems this series is due for significant updates, so I'll remove v4
from mm.git.

Some notes I took are:
https://lore.kernel.org/a6e410bd-7413-45f0-9033-a60cd5386512@arm.com
https://lore.kernel.org/a8ff2b34-5e5c-43c8-9de2-cf7929265853@arm.com
https://lore.kernel.org/akPKkOt_GNbAbyN5@milan
https://lore.kernel.org/aecf8ea2-43e3-4aad-810a-120b036d8bc2@arm.com

Also I added
	https://lore.kernel.org/20260630184129.4B62B1F00A3A@smtp.kernel.org

