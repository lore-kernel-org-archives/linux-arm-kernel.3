Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C5EC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXy4TOyy7MgZ0fGl1WWHieYDlASW2K19kUkZS0U553c=; b=24exiYgJLughSQGbSkW3DTovT9
	fj3+XcOYxZMykS0R5Kn5GmH94pjCxLyX1M5A4H+4Ov4ihkddl1yUCRTMw8zSgpSGQ8ieVuTd35AJz
	C50XN/bNhNVbEWB2KioyvaKWy2kbNf7xel82VaubX3qrHJAY5HEQnUBhQhE9DIYrhMzKfraspqImg
	L0UK2AZslwdz+OxlzQuvUjOA6lGPWpY26SpiHgF0yNIZ55Ysj/WqroFhzYcoNvUt7Isais6Xf8/im
	RSwkKV+6ZCwoZuJUmOV59JLPKpKkQsA7b6foyaWchXxA5lp1VbHIfX9oeCLd37Oaszy0cFmg8xLUQ
	a5tMZlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeZX-0000000G8GM-30Wn;
	Fri, 20 Jun 2025 16:26:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeAr-0000000G4r1-1kjt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 16:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88833A52A68;
	Fri, 20 Jun 2025 16:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F27C4CEE3;
	Fri, 20 Jun 2025 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750435264;
	bh=476EDcByVUDcMJq9G0/L+M1afs1hWsv5RMTIUVRlTMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QeNRSKWGt70s6g1hwBDaHF1e0D8Pd+LYbrtycRrUqtWP4xqpmf51Q62U0NHpRDVqA
	 pqBOl2B8YSaxaEhX3Fq4vtZWrImkX0Rf2jTJ7jZooe75XlMgkCsXadzhhYWETF9JAV
	 knXOlLmUBr0FCnGmWondl/AB0jOCbK554Ve2lLDA=
Date: Fri, 20 Jun 2025 18:01:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH net 0/4] net: axienet: Fix deferred probe loop
Message-ID: <2025062054-tameness-canal-2204@gregkh>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <2025062004-sandblast-overjoyed-6fe9@gregkh>
 <56f52836-545a-45aa-8a6b-04aa589c2583@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56f52836-545a-45aa-8a6b-04aa589c2583@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_090105_526702_EA8A20F0 
X-CRM114-Status: GOOD (  16.53  )
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

On Fri, Jun 20, 2025 at 11:41:52AM -0400, Sean Anderson wrote:
> On 6/20/25 01:10, Greg Kroah-Hartman wrote:
> > On Thu, Jun 19, 2025 at 04:05:33PM -0400, Sean Anderson wrote:
> >> Upon further investigation, the EPROBE_DEFER loop outlined in [1] can
> >> occur even without the PCS subsystem, as described in patch 4/4. The
> >> second patch is a general fix, and could be applied even without the
> >> auxdev conversion.
> >> 
> >> [1] https://lore.kernel.org/all/20250610183459.3395328-1-sean.anderson@linux.dev/
> > 
> > I have no idea what this summary means at all, which isn't a good start
> > to a patch series :(
> > 
> > What problem are you trying to solve?
> 
> See patch 4/4.

That's not what should be in patch 0/4 then, right?

> > What overall solution did you come up with?
> 
> See patch 4/4.

Again, why write a 0/4 summary at all then?

> > Who is supposed to be reviewing any of this?
> 
> Netdev. Hence "PATCH net".
> 
> And see [1] above for background. I will quote it more-extensively next time.

Referring to random links doesn't always work as we deal with thousands
of patches daily, and sometimes don't even have internet access (like
when reviewing patches on long flights/train rides...)

Make things self-contained please.

thanks,

greg k-h

