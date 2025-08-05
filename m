Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D56C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 06:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFwAiOdLYLD4M+6ibBubook76MWPIIMTPAneCS8934U=; b=GAwnSDfz9SPkAJdCdQ+rnzPY/F
	U/687q5NzEszWWdouZzRD5+VkW7esqK4lwMXUOZpWMEggWRiQDVz2okpO9l1e1VVjceT0vu3hRAaL
	WZw70JrC35e4LQqqQGLj0bgvHiPMpSs046BGpcaznEz7LN0ZRCYiF9Itwvt0aeDcvAQjbgOXCtBMB
	sp+u/9PDqsvehsAN/Cu+XGzg3qslDjlxuYKzqyYMYOFvLWA852ULtD/14uMsmGTy/ij/FiwNVN/CA
	Z/n59sJuV6CEPXA/WG1VM9qKj7jX3bH2q3xy0ZkMeG+sAgly8h5PYzZDdMHawlBZ6Lq2rzmrMyxxK
	xMSnvndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBcV-0000000By4A-1apr;
	Tue, 05 Aug 2025 06:57:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBV8-0000000BwVe-0QrZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 06:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E367A5475F;
	Tue,  5 Aug 2025 06:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2ACAC4CEF4;
	Tue,  5 Aug 2025 06:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754376620;
	bh=ataxtz/n54x5sp9JZ6Vy9kgFTYfOAehKaIPuusetPXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usAIvtHr6Zd12HV3k5qee5KbtDSkp/5gcEVafjDCji+n4tixPSwkgSsuB5YnpwKmm
	 WfG1K9bUeSOq8TzI3EC35s/Xahb8vKfDk6TguUqjWNX5HbjkXJGUXozxlgm7aS6z1V
	 CdaoKybo/oFQ5iAiPjHvi1yzKDPWYPyvObkMGwHSLvryplZSqzNu61MtWNPaFvC8gh
	 7QSnIb2ZHnx2pwKMdUGVoogKKSBsePFHOjJTqFeksB2oTkuou9rlNt6K3cJHJoXN6O
	 DSt0+WPezIOVIGKBRrcX4ETjQqhVn05sdxYaPK1PPZIeB0ufD01TPagei+HQWOmXnS
	 73FVhtIpoQs9w==
Date: Tue, 5 Aug 2025 08:50:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, srini@kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/15] nvmem: microchip-otpc: rework to access packets
 based on tag
Message-ID: <20250805-futuristic-versed-orangutan-4316d9@kuoka>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
 <20250804100219.63325-3-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804100219.63325-3-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_235022_212613_B2373C79 
X-CRM114-Status: UNSURE (   9.45  )
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

On Mon, Aug 04, 2025 at 03:32:06PM +0530, Varshini Rajendran wrote:
> +static struct mchp_otpc_packet *mchp_otpc_tag_to_packet(struct mchp_otpc *otpc,
> +							u32 tag)
>  {
>  	struct mchp_otpc_packet *packet;
>  
> -	if (id >= otpc->npackets)
> -		return NULL;
> -
>  	list_for_each_entry(packet, &otpc->packets, list) {
> -		if (packet->id == id)
> +		if (packet->payload_info.packet_tag == tag)
>  			return packet;
>  	}

As mentioned in bindings change, this looks like breaking all the users.

Best regards,
Krzysztof


