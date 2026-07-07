Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3E7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avVeJSV3sTgrfABYepnBzlTH2P7OWGaspJVsPup+ruw=; b=xgyq1qR5p4Yf7zxxV15QXPVPjT
	DxsnMkzydqAAIgbPnQdDfChnsYIcYnpWRJGtuEmCo65drQJI2sjLAg/ZeB06mDHTKp9idDneF3/L4
	L/6ftp0+rlZJeY69dnP+vt8gl4l8L/9FcANID+Q9e3O5cJBLCHvetR39RCEsAc+KN77UlQkVpW+lr
	nHY35lJ2iWpsQt8HmPn6eXaIbUqKH2BYkAeQSZ1WQX8YsOyPzJHeco8xXQVO+TWPYMRWF7+jGzKZi
	EGiN2ztUZGnNSnBhMlzYMNjIFBvBZn0MRgsXwdTX0eEAWDOZtfx8LDxcbV6SXeli8A8it3miO438e
	LndAgqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB5Y-0000000FgWR-3O9T;
	Tue, 07 Jul 2026 19:04:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB5X-0000000FgVq-0Sur
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 19:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=avVeJSV3sTgrfABYepnBzlTH2P7OWGaspJVsPup+ruw=; b=VWrd41qRXyYyhzMWp+gqpuvhbS
	6B85dG3uLp6arQ3/pkhJsCYGOR87TGtYdSF/I8ogvfumgVQ+vAm6bt5SSlqyIbW5lG6tfBBjIVX5y
	UOGorZW+Dpd8xlk1kNS3h4bBcNBO9GNoOUkvUW+Rvcix7+8IviZrKFkh3/um8eIUf8sc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1whB5M-00BDMh-PC; Tue, 07 Jul 2026 21:04:00 +0200
Date: Tue, 7 Jul 2026 21:04:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, k.tegowski@samsung.com,
	k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net/stmmac: Verify provided DTS AXI setup
Message-ID: <ee504cab-b1da-4584-8693-70ed5cd943c7@lunn.ch>
References: <20260707174431.1264520-1-j.raczynski@samsung.com>
 <CGME20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056@eucas1p1.samsung.com>
 <20260707174431.1264520-3-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707174431.1264520-3-j.raczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_120411_148586_BD4D83DB 
X-CRM114-Status: GOOD (  15.73  )
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

On Tue, Jul 07, 2026 at 07:44:31PM +0200, Jakub Raczynski wrote:
> During parsing of AXI setup, there are few issues:
> - 'axi_blen' array is uninitialized value on stack without zero-init stack
>   configured. This can result in random AXI burst length config if
>   DTS config provides shorter array than AXI_BLEN.

What does the DT blinding say about the length? Is it allowed to be
short?

Are we talking about:

      snps,blen:
        $ref: /schemas/types.yaml#/definitions/uint32-array
        description:
          this is a vector of supported burst length.
        minItems: 7
        maxItems: 7

So it should be 7. Are there any in kernel DT blobs which don't pass
7? Can we just error out when it is not 7?

> - In case of failed memory allocation for AXI and error, there is no handling
>   of that. Fix it by checking if AXI config is error and return if so,
>   as this can only lack of memory. No AXI config, although is probably
>   wrong in most cases, is not treated as error, as generic config is mostly
>   provided in drivers.

This seems like a different fix. Maybe put it into a patch of its own.

> Fixes: afea03656add ("stmmac: rework DMA bus setting and introduce new platform AXI structure")

Again, does this bother anybody? At least axi_blen issue seems to be
that the DT blob is broken, so i doubt it actually does. Are there
reports of memory allocation error and resulting Opps.


    Andrew

---
pw-bot: cr

