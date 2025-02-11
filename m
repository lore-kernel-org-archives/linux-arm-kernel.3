Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B43C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hfjt0I5NnrMIwqrD0mfpNKdeBJDKmRJFRQX9VEMhUU=; b=kcZOwFHsjcXD2xoG1T6HdS6dKS
	THxKl1AgyZ9yvp+bqQi/aDjJmmKCVa8X0EFwHn1XnRdlrhngjMNHFIeTxTuEcuZeHTUdYRWwYv8EM
	fRaMTbAXPDfpjCNGUA4rDjOazDqChvNGU6aBEMTLqisvFxyG6D1fWjn/11LXMELRP7G4nqDj198GF
	+gQgnHt8ugQcDOyQf29r3cgA7yCh8OcdGpKWovXwWcNHCJIiuk6c1xCd0oeJ8ljWWR8wQFqVUOpls
	yhvuWYXHEP60XosxR3PtWea1sdUP74HQJt0wRCj5v0bT/EHPJzvnFwjAEUvC5mbQ60t9KACASIdEd
	aq+rwNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnOM-00000003KaQ-03nU;
	Tue, 11 Feb 2025 10:21:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnMw-00000003KKs-0Qfg;
	Tue, 11 Feb 2025 10:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7hfjt0I5NnrMIwqrD0mfpNKdeBJDKmRJFRQX9VEMhUU=; b=RyKq5tU4gJrvp0I9SDHNYwuL7b
	NIoPnPxm1Ky1/wh0xCoSJHRif70vJVUsux58hnlYWxL4M1BtGHKz9fs4d8clPl8B+QsISMjXZum9w
	+MA2E+sjoIHRtpl8wQK2JzQ5PXOOQ2VLzKmETjW9SZSIAzyWuz8nHCdCQVNAyPbloRGNJBQTW2xmV
	vw4dO1Y8ze/3FGKayzQaJ9+lqHw1Ratvb1PgCng3yEfmjmvWnlj1Os3Lx5eZPcM9NkF1zu97uKC91
	s9Wd5+REWbaxfvcIWFsjmLp8TdX75W9mG7J/fPWeK2/yq4x4N9BGxrbdVx2hGN7b8toBEaedLZ0tJ
	1rKNklJg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thnMf-0006As-Pf; Tue, 11 Feb 2025 11:19:37 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-rockchip@lists.infradead.org,
 Shaohan Yao <shaohan.yao@rock-chips.com>, linux-pm@vger.kernel.org,
 Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] thermal: rockchip: Support the rk3562 SoC in thermal driver
Date: Tue, 11 Feb 2025 11:19:36 +0100
Message-ID: <17758610.geO5KgaWL5@diego>
In-Reply-To: <7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org>
References: <20241224094015.3816301-1-kever.yang@rock-chips.com>
 <20241224094015.3816301-2-kever.yang@rock-chips.com>
 <7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_021954_145874_FAC72EDB 
X-CRM114-Status: GOOD (  17.64  )
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

Hey Daniel,

Am Dienstag, 11. Februar 2025, 10:36:09 MEZ schrieb Daniel Lezcano:
> On 24/12/2024 10:40, Kever Yang wrote:
> > From: Shaohan Yao <shaohan.yao@rock-chips.com>
> > 
> > There are one Temperature Sensor on rk3562, channel 0 is for chip.
> 
> A bit stingy in terms of description, no ?
> 
> 
> > Signed-off-by: Shaohan Yao <shaohan.yao@rock-chips.com>
> > Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
[...]
> > +static const struct tsadc_table rk3562_code_table[] = {
> > +	{0, -40000},
> > +	{1419, -40000},
> > +	{1428, -35000},
> > +	{1436, -30000},
> > +	{1445, -25000},
> > +	{1453, -20000},
> > +	{1462, -15000},
> > +	{1470, -10000},
> > +	{1479, -5000},
> > +	{1487, 0},
> > +	{1496, 5000},
> > +	{1504, 10000},
> > +	{1512, 15000},
> > +	{1521, 20000},
> > +	{1529, 25000},
> > +	{1538, 30000},
> > +	{1546, 35000},
> > +	{1555, 40000},
> > +	{1563, 45000},
> > +	{1572, 50000},
> > +	{1580, 55000},
> > +	{1589, 60000},
> > +	{1598, 65000},
> > +	{1606, 70000},
> > +	{1615, 75000},
> > +	{1623, 80000},
> > +	{1632, 85000},
> > +	{1640, 90000},
> > +	{1648, 95000},
> > +	{1657, 100000},
> > +	{1666, 105000},
> > +	{1674, 110000},
> > +	{1682, 115000},
> > +	{1691, 120000},
> > +	{1699, 125000},
> > +	{TSADCV2_DATA_MASK, 125000},
> > +};
> 
> May be it is time to optimize all these tables out of the memory driver?
> 
> It is the 9th table introduced.

just to see if we think differently, what do you have in mind?

For me the adc-to-temperature conversion _is_ part of the hw-block itself,
so should likely not spill into the devicetree, but you're right, defining
a big table for each soc also isn't really great.

For the rk3562 in question, the stepping seems to be 8,9,8,9,....
where for the rk3568 the value stepping seems to be 32,36,32,36,...
and it looks similar for the other socs too, with the driver is already
interpolating between values it seems.

So even just halving (or more) all the big tables (dropping every second
entry for example) should not really loose us real granularity.

Heiko



