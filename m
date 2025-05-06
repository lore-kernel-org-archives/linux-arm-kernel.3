Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AE8C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wNOT1DAoZVhSLpHhkXu8/sSOgpiwDL+Pi84W+S/Gos=; b=DBU4dK0JVos5Qtts3b3XHpoh0h
	T1oXS2PJ4ow/Rgu8gbbTVF/Lao54j/2QhaCeZalHb4GH3atqCbVY/WBOtbgtzj8R8NdgFzja885zL
	/rUKV/WqhkW+s71LkWuR/y0T7ydgi/LOhbrWeoc1EEnvzw5SP6RWTxEF0sOLZE1qKDUaj5Xwnf0Jn
	BJ/pQur5/kt1XD7I5U3P3FxwdZbJFmLdLAPP+ej3aTmT3ZVvoQ3v0mmD2gRZ/Ygm9jw/1jct6vIPr
	462/iBlD5ArMZTIggkKsWNdAVzT7aEzThADfBVt5H8fvL3G6FY3AxEaqVw3HryjnMdW2Z7zdowwkL
	DPtpMJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNUR-0000000DAfS-2Kz7;
	Tue, 06 May 2025 18:58:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJtH-0000000CRH1-2vtV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:07:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746544045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6wNOT1DAoZVhSLpHhkXu8/sSOgpiwDL+Pi84W+S/Gos=;
	b=uhJrKX7G2UJLk+tOWtsqowh95IQY5uGUDWf3PWRWDjVn9bkdQ3elYf48wya934dsrnOT5d
	L4odQlCu2ElpTYewxnkjBZgOI3LDJrSSIw/HTFsh3B58t+4dknyCN6QaQKHaow7zFenpVe
	xjv7MI921BIhfbHTcYJzGnLENkt8capo8x3QU/pNL2czmE2SMrfbyVyOADhaoZAtF46AkR
	gauXlpAQXIUfXS52VMLaKeCeYhOcPM7rpYrCC9OoZj9e5TLmKGOPUYauuALA14feJEl55t
	9KtmmgXY0SV6v1iOFuS/b7FHGeSlFcPIt2ztrDMcdisKzHtmzMHeOzoOO8CvLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746544045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6wNOT1DAoZVhSLpHhkXu8/sSOgpiwDL+Pi84W+S/Gos=;
	b=KqXLwv2Ko7xWWiugCq2HozHlQ8iVBy4y4Hvpq1P0rMkctKCWxLLdIkEbPhZXaEASntugN5
	ItHXuROFf5HU4ZAg==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 22/25] irqchip/gic-v5: Add GICv5 LPI/IPI support
In-Reply-To: <20250506-gicv5-host-v3-22-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-22-6edd5a92fd09@kernel.org>
Date: Tue, 06 May 2025 17:07:24 +0200
Message-ID: <87wmatn5g3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_080727_878246_69C79881 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, May 06 2025 at 14:23, Lorenzo Pieralisi wrote:
> +static int __init gicv5_irs_init_ist(struct gicv5_irs_chip_data *irs_data)
> +{
> +	u32 lpi_id_bits, idr2_id_bits, idr2_min_lpi_id_bits,
> +	    l2_iste_sz, l2sz, l2_iste_sz_split, idr2;

Please don't do that. That's horrible to read. If it does not fit into a
single line, make it

       u32 a,....,h;
       u32 i,...,m;


