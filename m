Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE726CD37AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 21:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3x8MabeutXi5u2ZOxPKzmW168+rCRgMi6Wqf4CXVKE=; b=SeD9Nor5OqMFfjJA3wqqk9vKpN
	WzLAMuMiWwMDYnlKwBvOGkAzW8VjCXEYlRkBGNxvVgukFYBO2Dc79GUp2bGkeTE62/wCXI2Ai1i6L
	1C6r2AIcxmhXS42KhDzc6lRuMAII0+YKCZfZAQcWegB33fTHqxSQ2PMFdobQXf9hSmVvowAlI3qkT
	RqCPOnGCKxGMyruXyHLiQigUbqDBKoyljj5ndOAi07eYM8UvXGhrYiuxk4PFtkoDtQ0ZljGImJ5zi
	RXM6vU9y/w2NhxjKHh5/icxvKeqt8YgXxVl/bCx9Ng2GnxqXj4dxiTD8QhLc/hqS53zcGJGIwRlT0
	hKGCvDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6fM-00000004zRI-0PRI;
	Thu, 07 May 2026 21:53:56 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6fJ-00000004zPu-21z3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 21:53:54 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gBQxT5l6Rz9twx;
	Thu,  7 May 2026 23:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778190829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3x8MabeutXi5u2ZOxPKzmW168+rCRgMi6Wqf4CXVKE=;
	b=XiA+ouV74XwrFS2c6bCxNrbZF4lGYa1XCo8iercJWPL49ZdSe8kfdzB8tjApOutgCTcpnZ
	CqTOr8C3Spvpn9VDaukgaO9CEDWMwLOim3rETaGi0WwCgVCz8tORmem4S5klqT71tyGfq6
	q9/daLb4ik2BJIOnkME32/g+JPXC9XGddaYUMdpa/S+1doN8qVxZ9gZtLWxrxWC8E6as/Z
	zQT9I63YABLdE8Gixi4HDxY90zjgh2+NesZY6kmJ8NCAI6nLlCilWIqJnsvnMVOLyAqPSO
	C4FXpf1O/RO41PnpWwNARqkC57IT/LPzEnjQCL0Gq09yLkYwBxbwZXHn7OgaOQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pRz70iYR;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778190828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3x8MabeutXi5u2ZOxPKzmW168+rCRgMi6Wqf4CXVKE=;
	b=pRz70iYRIabwZds/zBkOfIz7ffBSzxWr8QrUffnhoqMNYGWEIlt7PVDu3K3nnZGwTE5Ela
	c7x1+KJQxV29dro9uGPtoHlPA1Vvt0AqPnuc5w5UIk0iKvhzBQLNCmfudJzjPtK01v18Yi
	mMes+3se5GI995OFeMmSW7mZK2RQxprHL+1Zh3kfAiX2js5MZR19b/+f5lyxcN/gYX/+Tm
	+uFD73FkDEVfHCgyks7X07UORDcPuVh/pekhNOJb6qiGjPQgUY5ulXsC99jbh8AMEO/8QT
	DFax6wvBEM+q01D7qMts5CKlCnHobpbPhD97DUSjnrQ6lOlhNpMBclmzNdgJig==
Date: Thu, 7 May 2026 23:53:40 +0200
MIME-Version: 1.0
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1776793163.git.geert+renesas@glider.be>
 <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2cc6b046b50a6ef62f4
X-MBO-RS-META: shaqte9razzqy9pddg5m6mj3cujbz7ph
X-Rspamd-Queue-Id: 4gBQxT5l6Rz9twx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_145353_667865_99216BF1 
X-CRM114-Status: GOOD (  11.16  )
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

On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:

[...]

> +  '#power-domain-cells':
> +    description: |
> +      - The first power domain specifier cell must be either the Module
> +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> +        datasheet, or a Power Domain number, as defined in
> +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
> +      - The second power domain specifier cell must be the module number
> +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> +        in the high nibble, and the Module Reset Destination bitfield index in
> +        the low nibble.
> +    const: 2
> +
> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the module number (0x00-0xff).
> +    const: 1
Just one more question -- the power-domain-cells second cell and 
reset-cells are always going to be identical values, correct ? If so, it 
would be nice to keep the description: aligned, and maybe even indicate 
in the description that those two values have to be the same.

