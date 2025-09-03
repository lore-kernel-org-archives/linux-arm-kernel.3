Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CE5CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0FyGGHWcDrgxz10Urh5OV1MMiUdH5HDCFT5DAmKvuI=; b=liZpG9EHqswLVHK9j/9ooemBOU
	8gfJjx70487Wn/QhE4ORUlYm5JF90IIHj7v7mIMM3OHrGVYcz3hxkRII/j7mZEFlwUJnEccVDcMyG
	WNa4kJHes0oKiWGvNAd5Lf7oYymG/Y/UljqFoKi8O4sV/gIQjlU8sxvt8Oe+FzjU+N12LLaSUSTfA
	0Oaj7dXQf1HM+q9mNDArfGryZKDl66FZBhuefKqVJr2tgxyoJ9f7t2jut48yTzmEqBpH2VKtMIToj
	GoEOe5ISYFdAp85Z5lVa8L6HavelVjpFbFBOXR/WGeulc/zGXHyjqeSCl9jL5laCqqneJeyDu+P84
	D2j6jAQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlPS-00000006BqM-3a12;
	Wed, 03 Sep 2025 11:12:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkFA-000000060wy-3HD8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:57:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756893449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/0FyGGHWcDrgxz10Urh5OV1MMiUdH5HDCFT5DAmKvuI=;
	b=WWOeJ/esyFTr51QXP37ODlRH7ABL2Yen4uDulWpqlXI2IGmDGm4I5x2S6ArN6tgwkjemKp
	4hBP4TGK/P4Uurbs9941mrBz1+dy+UNFnGx8oZ69cimD8tqbee3vuzSEFD49zIrr69kSJy
	zxT5mzLLVXsr1OWKlGXN0DOtnG1+dH8YPW/n1jjXB3OFwhgTHkqBktmtdyWquQtxGm6pt3
	VrY74UKlTx057usWdP7FljDaQYVYQUwFMEE1WTRsX+nSVHJNAd3iqS114CHlf9CnEpUD3b
	SxVe/wOysR0+aGuuxLE1t6Qcu9NgoVXiyORMyv/bKuSASPh+wZMIPkZ4eDhDhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756893449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/0FyGGHWcDrgxz10Urh5OV1MMiUdH5HDCFT5DAmKvuI=;
	b=bm7kR/26YIrTFvAFsmmUReGzi+ASqn5d2A6PPqovQGU7SfvAv39Ti03OsNUqWaclyOJbNw
	HEWw2SzRe2QcZsDA==
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Gatien Chevallier
 <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH net-next v4 1/3] time: export timespec64_add_safe() symbol
In-Reply-To: <20250901-relative_flex_pps-v4-1-b874971dfe85@foss.st.com>
References: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
 <20250901-relative_flex_pps-v4-1-b874971dfe85@foss.st.com>
Date: Wed, 03 Sep 2025 11:57:28 +0200
Message-ID: <877byfzwmv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_025732_959689_2D4C4104 
X-CRM114-Status: UNSURE (   7.57  )
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

On Mon, Sep 01 2025 at 11:16, Gatien Chevallier wrote:

> Export the timespec64_add_safe() symbol so that this function can be used
> in modules where computation of time related is done.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

