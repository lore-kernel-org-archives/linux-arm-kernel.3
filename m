Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F619C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kUApj/v7iaN1AQEDfSoUpQu0i0Uo4+xVftVQ+W1P00=; b=Sj12O8ZphVYp49eFBhaU3Yd0BR
	1aqO3Mb0Ex5VKF+X0BFeThwpPgMY42Z6yrOfBXHgTzA4byD1xOFfuiiLMAYBpSo9HcgZPR2F9OodB
	/WJgZizfxqjDof2ezya7DvlptrvIqCacxi+5wnxWBcI7scgsTTDWaMsMgYRppyqlGaTbanG2FhiaT
	CWr01QsxyHKnt9eUgAYTZ+l2NL7w1Jz+x5AHafg40Bkdg9LHjsRvY9/b+rqD0hPJvB+GAsHnwBKO4
	nbZIf4eMwROIAnjarOP1CH77OSSDY6MJZJiOpnRfxYYCku4ZXUbdTZj168LwqmC/8Z+rl6hhk15Ch
	us98HLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCb1I-0000000EwYa-0w0j;
	Wed, 07 May 2025 09:24:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaB2-0000000EkDi-0bu7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 08:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51A3A5C55B2;
	Wed,  7 May 2025 08:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4412CC4CEEB;
	Wed,  7 May 2025 08:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746606651;
	bh=Fl13JhPGBJPjzijzkCVK1qHkDmkFIdv5opEKFUNLvKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpjn8IsacvjjRczk9F0jA7SV0QPGr1kT/oq4aO+Gvp5A1zbHfz8RJGd++ZX72pZOr
	 aRYD6aE31tc+Qh4uF6bug1laNwT5N2S9tR1u4tT0zH4EMjtqLsQV0o0XW5Z6xqCnlV
	 Z1RGYRo8XAYSQWcyTv543tH7BIIZIAwgpkqnDAMSOxGGRXyPMMjS9v8OeYy8psaVpL
	 6rqJFTaO6lV6mZUBHgfuYF5FYxF8vU1LM6Jl5xlhtZCicV3Lp+Q61VgBeubuTmotgA
	 koqhU3TMrRrcSsdTvBgduF6dRBI2UMi6W4347pxjoTBJ3Ku6tFNLLTRRwZt2Vfm1ph
	 5GXtFku5t3u7A==
Date: Wed, 7 May 2025 10:30:44 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 22/25] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <aBsaNNmMZ5mXvIKU@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-22-6edd5a92fd09@kernel.org>
 <87wmatn5g3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmatn5g3.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_013052_240341_BEE957AD 
X-CRM114-Status: GOOD (  10.99  )
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

On Tue, May 06, 2025 at 05:07:24PM +0200, Thomas Gleixner wrote:
> On Tue, May 06 2025 at 14:23, Lorenzo Pieralisi wrote:
> > +static int __init gicv5_irs_init_ist(struct gicv5_irs_chip_data *irs_data)
> > +{
> > +	u32 lpi_id_bits, idr2_id_bits, idr2_min_lpi_id_bits,
> > +	    l2_iste_sz, l2sz, l2_iste_sz_split, idr2;
> 
> Please don't do that. That's horrible to read. If it does not fit into a
> single line, make it
> 
>        u32 a,....,h;
>        u32 i,...,m;

Done.

Thanks,
Lorenzo

