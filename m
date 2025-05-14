Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B4EC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5BHxGrgK6TE2/+fWMDf/xO+Ut+XEd5r25Gzw1ZGqpE=; b=sgYJDKLvrbDQJNJOQG56NiF2qo
	P3k9xbXq3HMcILgKZOwTOGaaKbOR07+uLvsLuszQFkmBY5z9ZCU0KSEYTF8hPAc+OBLCOCaSZ+oEB
	b/wlisAOt/Bwpj8dCNh7SWVIQwkxS/KeVApsmQoM6ZrrLb8/R6meYgJX9XlsH0FIl8RExQxDmRYis
	wOItAVSwf17SgFGBjbKlkvwex7OylzOkJDDjVZfnkgBK03rdDkzR7cI2JTLPrBQF6hn6i0J81Bsa1
	BixgCtgF9araLdbpV971xVcmspv5exiRcYSGEwRkTaQxPt+ZMsenJrmw8DRSWOmwhmn7la2B6gFY2
	IZ8KtG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6kO-0000000ENKl-3Fnw;
	Wed, 14 May 2025 07:41:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6hG-0000000EMqt-0doc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 07:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D70F7435A8;
	Wed, 14 May 2025 07:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFADDC4CEE9;
	Wed, 14 May 2025 07:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747208313;
	bh=FAn473klWAnhnmlMdk63GTbxuuQb/yWgRlVVBKaV7Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNQc0GeqAGdfUW9/KjWYCMCy9pKHow1UJ9WKSATh3epF6ltJ8U47GkbW4E3H6yar2
	 ln+VF+keJNXuyiBvab/PNbKWO9CQosIN2Te6mEgxe6ZUQSStVduesKzVprbAlu7vld
	 lhOUrqlkVyf/OZphw+rx4jrj9OC7ckmMnKAQ5Mk8=
Date: Wed, 14 May 2025 09:36:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Judith Mendez <jm@ti.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Davis <afd@ti.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/7] serial: 8250: Add PRUSS UART driver
Message-ID: <2025051408-discolor-backwash-5574@gregkh>
References: <20250513215934.933807-1-jm@ti.com>
 <20250513215934.933807-4-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513215934.933807-4-jm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_003834_210836_B193A010 
X-CRM114-Status: GOOD (  12.36  )
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

On Tue, May 13, 2025 at 04:59:30PM -0500, Judith Mendez wrote:
> From: Bin Liu <b-liu@ti.com>
> 
> This adds a new serial 8250 driver that supports the UART in PRUSS or
> PRU_ICSS*.
> 
> The UART sub-module is based on the industry standard TL16C550 UART
> controller, which has 16-bytes FIFO and supports 16x and 13x over
> samplings.

If it is based on an existing controller, why do we need a new driver
for this?  Please explain in detail why this code is needed at all, and
not just a new "quirk" for the existing driver?

thanks,

greg k-h

