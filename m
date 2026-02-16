Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC91CE81A48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vvqy8Jb4oFrlAJ4lKH5odjJ0nQ4DQWXHmpBeBU8omg=; b=kMpQTV6iqxeQVog5qpxdoI/Tph
	hCrpbWvUStnMiNdyet9ayDj9v4AA24tDlWI8JlbhLjK6lFKGToMFTWyWn0l7/9/0DiuwLd4p5q2rh
	1G1pv3f9PatIVvZdqwO9EHo24//bU266i3yfZuoQR9Q515XfiH/xSY3F27Y5y5Gzxm4r4DFHH4W+a
	a/osRtMvhWzgWN1jsqMDAs8j1fohtGyuyR8t6T1HYG7v5bJNlk2xKlBihx+JGm6CZt5Z4CC3K5hcu
	dsoD5oA7/55NlNkjVXcUgaeDmzOMQgJLJlLr6nkyKVx5S7f944ibSqFlQ6TVVjqDRDqL0/TsTDWhh
	/rcs9X0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1rT-000000073Km-1QjI;
	Mon, 16 Feb 2026 16:54:15 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1rP-000000073Js-1kPx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2vvq
	y8Jb4oFrlAJ4lKH5odjJ0nQ4DQWXHmpBeBU8omg=; b=RfxDVFCyayO8eMI5CRHD
	Qdj4eTZZA8Ln4IRNQvRe3M4TD/5EZPK1xyBitEkBPq+zwwsHQcERK5eNoW6vCPa3
	8+2+wqzVReJca72l2WEzRyJbhWEp0DYCfjUIm/Tnzi2Bi0bt8JRWIZdYXAMRyq7+
	3XKkwWKcpVfZSmGfBrwzqyLdZt+9DZRNYyS1gSwYGGdr6RKiqSnh9N/X9YbSh7X9
	JLN5nhZJUVd/LhCbQOcmvz8JLQBWpYzzO/CdFxTucdeO5oaSSdGDV/Uelj4BQbb5
	FJgZCNf2gEEQvCSmX1/BflgbN6z+6LK476VZkbo4jmY7MEZYKHC0XrTfSOhGn0+b
	9Q==
Received: (qmail 3323583 invoked from network); 16 Feb 2026 17:54:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Feb 2026 17:54:06 +0100
X-UD-Smtp-Session: l3s3148p1@p5KMzfNKiB1tKXIY
Date: Mon, 16 Feb 2026 17:54:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
Message-ID: <aZNLrRcMZXv4pdbN@shikoro>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
 <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
 <aZLVU9toZRX2vKX7@ninjato>
 <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
 <aZL3M6hT45I2WUaQ@ninjato>
 <5416c451-43fc-4feb-b3be-6d6754720884@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5416c451-43fc-4feb-b3be-6d6754720884@omp.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_085412_345852_FBAAEB88 
X-CRM114-Status: GOOD (  13.58  )
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

Hi Sergey,

> > That I don't know. I just know that I did build-testing for the whole
> > series and the buildbots reported success. Need to look up why this was
> > not caught.
> 
>    Maybe it just built the kernel after applying the entire series? :-)

My scripts build after every patch. As said, I have to double check why
it did not fail here. I used to think buildbots work the same, but
probably not as I got another success report after this thread already
had started.

>    Perhaps you should update the existing users to just pass NULL as
> init_data in this patch, and only then do the full-blown updates of
> the individual drivers?

That sounds like a good option to me, thanks!

Happy hacking,

   Wolfram


